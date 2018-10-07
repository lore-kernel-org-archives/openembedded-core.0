Return-Path: <peter@berginkonsult.se>
Received: from mailrelay4-1.pub.mailoutpod1-cph3.one.com
	(mailrelay4-1.pub.mailoutpod1-cph3.one.com [46.30.210.185])
	by mail.openembedded.org (Postfix) with ESMTP id 4381F7307F
	for <openembedded-core@lists.openembedded.org>;
	Sun,  7 Oct 2018 19:22:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=berginkonsult.se; s=20140924;
	h=content-transfer-encoding:content-type:in-reply-to:mime-version:date:
	message-id:from:references:to:subject:from;
	bh=tBe+QSYbNqolQcW4+MZLVwPmS/DDanTTPvogCuZWKKc=;
	b=30SnXkfEBm8Xv/Nuu9ZDg0E7YhSIzlrZ2F21Q86QXFGzI8XBmiNodAdfiqTp7fUyM/zZWMHKCxY/G
	nuLGnwCzm5aM+ncYXyTtlkWrcy1txu8nDu/9DSEmDHqNZx2bBlQG7LzWyJZJRdzpAtBFWxlyff6wg+
	1qxeIwfbETEuShPA=
X-HalOne-Cookie: cca449548e658ff716e401385eb2b82b99c1d387
X-HalOne-ID: 50eaf3f3-ca66-11e8-86b7-d0431ea8bb10
Received: from [192.168.100.126] (unknown [82.196.108.162])
	by mailrelay4.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
	id 50eaf3f3-ca66-11e8-86b7-d0431ea8bb10;
	Sun, 07 Oct 2018 19:22:23 +0000 (UTC)
To: Randy MacLeod <randy.macleod@windriver.com>,
	openembedded-core@lists.openembedded.org, Kang Kai <kai.kang@windriver.com>
References: <1537425318-1569-1-git-send-email-peter@berginkonsult.se>
	<f6ceb980-5383-7c22-1b4b-56a25a92fe47@windriver.com>
From: Peter Bergin <peter@berginkonsult.se>
Message-ID: <785a25e6-7ff7-971d-d5a5-8d900528e78f@berginkonsult.se>
Date: Sun, 7 Oct 2018 21:22:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <f6ceb980-5383-7c22-1b4b-56a25a92fe47@windriver.com>
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
X-List-Received-Date: Sun, 07 Oct 2018 19:22:23 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

Hi Randy,

thanks for feedback. I will prepare a v3 and send.

On 2018-10-06 04:36, Randy MacLeod wrote:
> Hi Peter,
>
> Thanks for the v2, I think there are some small things to fix
> up, some optional work and then this will be in good shape.
>
> Btw, it's good practice to write a wrapper email and explain
> what's changed since the previous version.
>
Thanks for advice! I'm quite new into this and it's good to learn way of 
working. If you or someone else could update 
https://www.openembedded.org/wiki/How_to_submit_a_patch_to_OpenEmbedded#Community_review 
with instructions about wrapper email when sending v2 it would be nice.

>
> The impact of this patch for most people is just a call
> to getrlimit(RLIMIT_AS, ...) so unless someone finds
> a problem, I think it should be merged after v3.
>
>
>
> On 09/20/2018 02:35 AM, Peter Bergin wrote:
>> Fix the situation where the task do_package_write_rpm ends up in
>> "liblzma: memory allocation failed". This happens if the host
>> environment has set a limit on virtual_memory for the user with
>> 'ulimit -v' for packages with a lot of binary packages, e.g. 
>> glibc-locale.
>>
>> Signed-off-by: Peter Bergin <peter@berginkonsult.se>
>> ---
>>   ...-restrict-virtual-memory-usage-if-limit-s.patch | 56 
>> ++++++++++++++++++++++
>>   meta/recipes-devtools/rpm/rpm_4.14.2.bb            |  1 +
>>   2 files changed, 57 insertions(+)
>>   create mode 100644 
>> meta/recipes-devtools/rpm/files/0001-rpm-rpmio.c-restrict-virtual-memory-usage-if-limit-s.patch
>>
>> diff --git 
>> a/meta/recipes-devtools/rpm/files/0001-rpm-rpmio.c-restrict-virtual-memory-usage-if-limit-s.patch 
>> b/meta/recipes-devtools/rpm/files/0001-rpm-rpmio.c-restrict-virtual-memory-usage-if-limit-s.patch 
>>
>> new file mode 100644
>> index 0000000..b901de2
>> --- /dev/null
>> +++ 
>> b/meta/recipes-devtools/rpm/files/0001-rpm-rpmio.c-restrict-virtual-memory-usage-if-limit-s.patch
>> @@ -0,0 +1,56 @@
>> +From b5bc64262c02bca96f58c517b8cd11a9bedc4e0e Mon Sep 17 00:00:00 2001
>> +From: Peter Bergin <peter@berginkonsult.se>
>> +Date: Wed, 19 Sep 2018 15:12:31 +0200
>> +Subject: [PATCH] rpm/rpmio.c: restrict virtual memory usage if limit 
>> set
>> +
>> +A solution to avoid OOM situation when the virtual memory is restricted
>> +for a user (ulimit -v). As the lzopen_internal funtion is run in 
>> parallel
> *function
>
Will fix!
>> +one instance per CPU thread the available virtual memory is limited per
>> +CPU thread.
>> +
>> +Upstream-Status: Inappropriate [introduced by oe-core patch on rpm]
>
> Please explain this Upstream-Status in greater detail in your email
> or your commit log. Which commit id is it? Hopefully the commit log
> explains why it's not acceptable to upstream.
>
> Ideally we'd get this patch and the one that you referred to upstream
> since carrying custom patches isn't in our interest and this does
> seem like a use case that upstream could encounter. If you aren't
> able to take the time to do that I expect that Kai (CCed) can.
>
>
I've got feedback from Alexander Kanavin on my v1 about upstream status. 
The multi-threading patches on rpm has been submitted upstream and a 
pull request is open at 
https://github.com/rpm-software-management/rpm/pull/226. Will change 
upstream status to "Pending [mege of multithreading patches to 
upstream]" as of Alexanders suggestion. Agree that ideally this should 
also be submitted upstream. If Kai can help out with this it's appreciated.
>> +
>> +Signed-off-by: Peter Bergin <peter@berginkonsult.se>
>> +---
>> + rpmio/rpmio.c | 25 +++++++++++++++++++++++++
>> + 1 file changed, 25 insertions(+)
>> +
>> +diff --git a/rpmio/rpmio.c b/rpmio/rpmio.c
>> +index e051c98..49752b3 100644
>> +--- a/rpmio/rpmio.c
>> ++++ b/rpmio/rpmio.c
>> +@@ -845,6 +845,31 @@ static LZFILE *lzopen_internal(const char 
>> *mode, int fd, int xz)
>> +         }
>> + #endif
>> +
>> ++        struct rlimit virtual_memory;
>> ++        getrlimit(RLIMIT_AS, &virtual_memory);
>> ++        if (virtual_memory.rlim_cur != RLIM_INFINITY) {
>> ++            const uint64_t virtual_memlimit = virtual_memory.rlim_cur;
>> ++            const uint64_t virtual_memlimit_per_cpu_thread =
>> ++                virtual_memlimit / lzma_cputhreads();
>> ++            uint64_t memory_usage_virt;
>> ++            rpmlog(RPMLOG_NOTICE, "XZ: virtual memory restricted to 
>> %lu and "
>> ++                   "per CPU thread %lu\n", virtual_memlimit, 
>> virtual_memlimit_per_cpu_thread);
>> ++            /* keep reducing the number of compression threads 
>> untill memory
> s/untill/until
Will fix!
>> ++               usage gets below limit per CPU thread*/
> s/gets below limit/falls below the limit/  --
Will fix!
>> ++            while ((memory_usage_virt = 
>> lzma_stream_encoder_mt_memusage(&mt_options)) >
>> ++                   virtual_memlimit_per_cpu_thread) {
>> ++                /* number of threads shouldn't be able to hit zero 
>> with compression
>> ++                 * settings aailable to set through rpm... */
> s/aailable/available/
Will fix!
>> ++ assert(--mt_options.threads != 0);
>
> I don't see how this can work when building optimized code.
> I see that you are just copying code that was already accepted
> upstream. Is NDEBUG always defined when the code is compiled and used?
> If it were not, then we'd end up with an infinite loop so it seems best
> to make change split into two statements. No need for a check in the
> while loop since lzma_stream_encoder_mt_memusage() will return an
> error if threads==0.
>
>
I will try to rework this without the assert statement. I can not see 
that NDEBUG is set when building rpm within oe-core.

Best regards,
/Peter

