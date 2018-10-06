Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id EB1ED74616
	for <openembedded-core@lists.openembedded.org>;
	Sat,  6 Oct 2018 02:37:47 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w962b8MY015465
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 5 Oct 2018 19:37:18 -0700
Received: from [172.25.44.4] (172.25.44.4) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.408.0;
	Fri, 5 Oct 2018 19:36:57 -0700
To: Peter Bergin <peter@berginkonsult.se>,
	<openembedded-core@lists.openembedded.org>,
	Kang Kai <kai.kang@windriver.com>
References: <1537425318-1569-1-git-send-email-peter@berginkonsult.se>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <f6ceb980-5383-7c22-1b4b-56a25a92fe47@windriver.com>
Date: Fri, 5 Oct 2018 22:36:56 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <1537425318-1569-1-git-send-email-peter@berginkonsult.se>
X-Originating-IP: [172.25.44.4]
Subject: Re: [PATCH v2] rpm: handle virtual memory usage when limit is set
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 06 Oct 2018 02:37:48 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Peter,

Thanks for the v2, I think there are some small things to fix
up, some optional work and then this will be in good shape.

Btw, it's good practice to write a wrapper email and explain
what's changed since the previous version.


The impact of this patch for most people is just a call
to getrlimit(RLIMIT_AS, ...) so unless someone finds
a problem, I think it should be merged after v3.



On 09/20/2018 02:35 AM, Peter Bergin wrote:
> Fix the situation where the task do_package_write_rpm ends up in
> "liblzma: memory allocation failed". This happens if the host
> environment has set a limit on virtual_memory for the user with
> 'ulimit -v' for packages with a lot of binary packages, e.g. glibc-locale.
> 
> Signed-off-by: Peter Bergin <peter@berginkonsult.se>
> ---
>   ...-restrict-virtual-memory-usage-if-limit-s.patch | 56 ++++++++++++++++++++++
>   meta/recipes-devtools/rpm/rpm_4.14.2.bb            |  1 +
>   2 files changed, 57 insertions(+)
>   create mode 100644 meta/recipes-devtools/rpm/files/0001-rpm-rpmio.c-restrict-virtual-memory-usage-if-limit-s.patch
> 
> diff --git a/meta/recipes-devtools/rpm/files/0001-rpm-rpmio.c-restrict-virtual-memory-usage-if-limit-s.patch b/meta/recipes-devtools/rpm/files/0001-rpm-rpmio.c-restrict-virtual-memory-usage-if-limit-s.patch
> new file mode 100644
> index 0000000..b901de2
> --- /dev/null
> +++ b/meta/recipes-devtools/rpm/files/0001-rpm-rpmio.c-restrict-virtual-memory-usage-if-limit-s.patch
> @@ -0,0 +1,56 @@
> +From b5bc64262c02bca96f58c517b8cd11a9bedc4e0e Mon Sep 17 00:00:00 2001
> +From: Peter Bergin <peter@berginkonsult.se>
> +Date: Wed, 19 Sep 2018 15:12:31 +0200
> +Subject: [PATCH] rpm/rpmio.c: restrict virtual memory usage if limit set
> +
> +A solution to avoid OOM situation when the virtual memory is restricted
> +for a user (ulimit -v). As the lzopen_internal funtion is run in parallel
*function

> +one instance per CPU thread the available virtual memory is limited per
> +CPU thread.
> +
> +Upstream-Status: Inappropriate [introduced by oe-core patch on rpm]

Please explain this Upstream-Status in greater detail in your email
or your commit log. Which commit id is it? Hopefully the commit log
explains why it's not acceptable to upstream.

Ideally we'd get this patch and the one that you referred to upstream
since carrying custom patches isn't in our interest and this does
seem like a use case that upstream could encounter. If you aren't
able to take the time to do that I expect that Kai (CCed) can.


> +
> +Signed-off-by: Peter Bergin <peter@berginkonsult.se>
> +---
> + rpmio/rpmio.c | 25 +++++++++++++++++++++++++
> + 1 file changed, 25 insertions(+)
> +
> +diff --git a/rpmio/rpmio.c b/rpmio/rpmio.c
> +index e051c98..49752b3 100644
> +--- a/rpmio/rpmio.c
> ++++ b/rpmio/rpmio.c
> +@@ -845,6 +845,31 @@ static LZFILE *lzopen_internal(const char *mode, int fd, int xz)
> + 		}
> + #endif
> +
> ++		struct rlimit virtual_memory;
> ++		getrlimit(RLIMIT_AS, &virtual_memory);
> ++		if (virtual_memory.rlim_cur != RLIM_INFINITY) {
> ++			const uint64_t virtual_memlimit = virtual_memory.rlim_cur;
> ++			const uint64_t virtual_memlimit_per_cpu_thread =
> ++				virtual_memlimit / lzma_cputhreads();
> ++			uint64_t memory_usage_virt;
> ++			rpmlog(RPMLOG_NOTICE, "XZ: virtual memory restricted to %lu and "
> ++			       "per CPU thread %lu\n", virtual_memlimit, virtual_memlimit_per_cpu_thread);
> ++			/* keep reducing the number of compression threads untill memory
s/untill/until
> ++			   usage gets below limit per CPU thread*/
s/gets below limit/falls below the limit/  --
> ++			while ((memory_usage_virt = lzma_stream_encoder_mt_memusage(&mt_options)) >
> ++			       virtual_memlimit_per_cpu_thread) {
> ++				/* number of threads shouldn't be able to hit zero with compression
> ++				 * settings aailable to set through rpm... */
s/aailable/available/
> ++				assert(--mt_options.threads != 0);

I don't see how this can work when building optimized code.
I see that you are just copying code that was already accepted
upstream. Is NDEBUG always defined when the code is compiled and used?
If it were not, then we'd end up with an infinite loop so it seems best
to make change split into two statements. No need for a check in the
while loop since lzma_stream_encoder_mt_memusage() will return an
error if threads==0.




> ++			}
> ++			if (threads != (int)mt_options.threads)
> ++				rpmlog(RPMLOG_NOTICE,
> ++				       "XZ: Adjusted the number of threads from %d to %d to not "
> ++				       "exceed the memory usage limit of %lu bytes\n",
> ++				       threads, mt_options.threads, virtual_memlimit);
> ++
> ++		}
> ++
> + 		ret = lzma_stream_encoder_mt(&lzfile->strm, &mt_options);
> + 	    }
> + #endif
> +--
> +2.7.4
> +
> diff --git a/meta/recipes-devtools/rpm/rpm_4.14.2.bb b/meta/recipes-devtools/rpm/rpm_4.14.2.bb
> index 46f8837..200fe4d 100644
> --- a/meta/recipes-devtools/rpm/rpm_4.14.2.bb
> +++ b/meta/recipes-devtools/rpm/rpm_4.14.2.bb
> @@ -39,6 +39,7 @@ SRC_URI = "git://github.com/rpm-software-management/rpm;branch=rpm-4.14.x \
>              file://0003-rpmstrpool.c-make-operations-over-string-pools-threa.patch \
>              file://0004-build-pack.c-remove-static-local-variables-from-buil.patch \
>              file://0001-perl-disable-auto-reqs.patch \
> +           file://0001-rpm-rpmio.c-restrict-virtual-memory-usage-if-limit-s.patch \
>              "
>   
>   PE = "1"
> 

Optional, I suppose:

Most bitbake users build on 64 bit systems but there are
quite a few 32 bit targets. The code looks like it would behave fine
on 32bit systems and it seems unlikely that there would be additional
memory constraints provisioned on a 32 bit target but it would be
nice to confirm that things work properly.


Thanks,

-- 
# Randy MacLeod
# Wind River Linux

