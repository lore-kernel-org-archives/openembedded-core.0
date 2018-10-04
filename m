Return-Path: <peter@berginkonsult.se>
Received: from mailrelay2-1.pub.mailoutpod1-cph3.one.com
	(mailrelay2-1.pub.mailoutpod1-cph3.one.com [46.30.210.183])
	by mail.openembedded.org (Postfix) with ESMTP id B2A1E60107
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Oct 2018 06:23:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=berginkonsult.se; s=20140924;
	h=content-transfer-encoding:content-type:in-reply-to:mime-version:date:
	message-id:from:references:to:subject:from;
	bh=cWJqaesSvnm0NSOaJyOF+Z02yXeODd/bh5SjhaiAqB8=;
	b=tjs239dux6DJaF9r5a2Hdl9JY+iCE3dE1TGwQ6t2vIh4lTShoQ5LgkO4j2hDnBBRqb1zrwuXQEJjF
	ZKbdHKrQo3Fs21WCGBHsuLct5lQsmftaVVULowG9fL/mT0jvS74kVZxPaDackrrtijBPcTOE92HU1B
	G5bSaR26VwUVQSIU=
X-HalOne-Cookie: 7c9eeb494b48c8a30ebcfa45543348893a8458b0
X-HalOne-ID: 08284c91-c79e-11e8-9b9d-d0431ea8a290
Received: from [192.168.0.101] (unknown [176.64.132.85])
	by mailrelay2.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
	id 08284c91-c79e-11e8-9b9d-d0431ea8a290;
	Thu, 04 Oct 2018 06:23:42 +0000 (UTC)
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
References: <1537425318-1569-1-git-send-email-peter@berginkonsult.se>
From: Peter Bergin <peter@berginkonsult.se>
Message-ID: <f68d7bbe-f9a5-91d7-57ad-360fabc400a5@berginkonsult.se>
Date: Thu, 4 Oct 2018 08:23:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <1537425318-1569-1-git-send-email-peter@berginkonsult.se>
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
X-List-Received-Date: Thu, 04 Oct 2018 06:23:43 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Ping!

Is this something that can be included? Main question for community is 
if we should support the server setup with restricted virtual memory and 
rpm packaging.

Thanks!
/Peter

On 2018-09-20 08:35, Peter Bergin wrote:
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
> +one instance per CPU thread the available virtual memory is limited per
> +CPU thread.
> +
> +Upstream-Status: Inappropriate [introduced by oe-core patch on rpm]
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
> ++			   usage gets below limit per CPU thread*/
> ++			while ((memory_usage_virt = lzma_stream_encoder_mt_memusage(&mt_options)) >
> ++			       virtual_memlimit_per_cpu_thread) {
> ++				/* number of threads shouldn't be able to hit zero with compression
> ++				 * settings aailable to set through rpm... */
> ++				assert(--mt_options.threads != 0);
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


