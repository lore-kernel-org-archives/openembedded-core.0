Return-Path: <peter@berginkonsult.se>
Received: from mailrelay1-1.pub.mailoutpod1-cph3.one.com
	(mailrelay1-1.pub.mailoutpod1-cph3.one.com [46.30.210.182])
	by mail.openembedded.org (Postfix) with ESMTP id 0A80E74700
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Sep 2018 12:42:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=berginkonsult.se; s=20140924;
	h=content-transfer-encoding:content-type:in-reply-to:mime-version:date:
	message-id:from:references:cc:to:subject:from;
	bh=jGvdiZPsaaNY7JcKO4Hs8DnbIzc3EQ94pFP2I/ZID3A=;
	b=1qoOZs1fqDLq1qcaNNAlMdzzptStr6OR1pNBwNFPIOFp0mYT1flFKkqj1AUTob5T1ZWsKKoVFyAY3
	KchXPL0/BJIQ+S+2V1v9VFHAWCd+Z31YiY5ZkdHEN9prAmeUjmdHoxX00gZ65JeTeFylA145bejhHH
	vw/2F0RQ5ogpyodw=
X-HalOne-Cookie: ee902120996e76088546f70b6f07927e0d81881a
X-HalOne-ID: a05824bb-bcd2-11e8-942c-d0431ea8a283
Received: from [192.168.0.101] (unknown [37.199.77.136])
	by mailrelay1.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
	id a05824bb-bcd2-11e8-942c-d0431ea8a283;
	Thu, 20 Sep 2018 12:42:26 +0000 (UTC)
To: Andre McCurdy <armccurdy@gmail.com>
References: <1537391156-12937-1-git-send-email-peter@berginkonsult.se>
	<CAJ86T=WkK3t3RBbOpuxfy0mHjRL1dRetV0fAQ1VQgOhJb3XirQ@mail.gmail.com>
From: Peter Bergin <peter@berginkonsult.se>
Message-ID: <da8a669a-51ae-4519-c300-b8eab68a78c3@berginkonsult.se>
Date: Thu, 20 Sep 2018 14:42:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <CAJ86T=WkK3t3RBbOpuxfy0mHjRL1dRetV0fAQ1VQgOhJb3XirQ@mail.gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] rpm: handle virtual memory usage when limit is set
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
X-List-Received-Date: Thu, 20 Sep 2018 12:42:27 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

On 2018-09-20 01:02, Andre McCurdy wrote:
> On Wed, Sep 19, 2018 at 2:05 PM, Peter Bergin <peter@berginkonsult.se> wrote:
>> Fix the situation where the task do_package_write_rpm ends up in
>> "liblzma: memory allocation failed". This happens if the host
>> environment has set a limit on virtual_memory for the user with
>> 'ulimit -v' for packages with a lot of binary packages, e.g. glibc-locale.
>>
>> Upstream-Status: Inappropriate [error introduced by oe-core patch on rpm]
>>
>> Signed-off-by: Peter Bergin <peter@berginkonsult.se>
>> ---
>>   ...estrict-virtual-memory-usage-if-limit-set.patch | 52 ++++++++++++++++++++++
>>   meta/recipes-devtools/rpm/rpm_4.14.2.bb            |  1 +
>>   2 files changed, 53 insertions(+)
>>   create mode 100644 meta/recipes-devtools/rpm/files/0001-rpm-restrict-virtual-memory-usage-if-limit-set.patch
>>
>> diff --git a/meta/recipes-devtools/rpm/files/0001-rpm-restrict-virtual-memory-usage-if-limit-set.patch b/meta/recipes-devtools/rpm/files/0001-rpm-restrict-virtual-memory-usage-if-limit-set.patch
>> new file mode 100644
>> index 0000000..a4b9a58
>> --- /dev/null
>> +++ b/meta/recipes-devtools/rpm/files/0001-rpm-restrict-virtual-memory-usage-if-limit-set.patch
>> @@ -0,0 +1,52 @@
>> +From cff87a68cde44d893b72caa1995ac6b9a1784523 Mon Sep 17 00:00:00 2001
>> +From: Peter Bergin <peter@berginkonsult.se>
>> +Date: Wed, 19 Sep 2018 15:12:31 +0200
>> +Subject: [PATCH] rpm: restrict virtual memory usage if limit set
>> +
>> +A solution to avoid OOM situation when the virtual memory is restricted
>> +for a user (ulimit -v). As the lzopen_internal funtion is run in parallel
>> +one instance per CPU thread the available virtual memory is limited per
>> +CPU thread.
>> +---
>> + rpmio/rpmio.c | 25 +++++++++++++++++++++++++
>> + 1 file changed, 25 insertions(+)
>> +
>> +diff --git a/rpmio/rpmio.c b/rpmio/rpmio.c
>> +index e051c98..49752b3 100644
>> +--- a/rpmio/rpmio.c
>> ++++ b/rpmio/rpmio.c
>> +@@ -845,6 +845,31 @@ static LZFILE *lzopen_internal(const char *mode, int fd, int xz)
>> +               }
>> + #endif
>> +
>> ++              struct rlimit virtual_memory;
>> ++              getrlimit(RLIMIT_AS, &virtual_memory);
>> ++              if (virtual_memory.rlim_cur != RLIM_INFINITY) {
>> ++                      const uint64_t virtual_memlimit = virtual_memory.rlim_cur;
>> ++                      const uint64_t virtual_memlimit_per_cpu_thread =
> What's the point of const for these variables?
Potential optimization. Set once and never changed will give the 
compiler a chance to optimize if possible.

>> ++                              virtual_memlimit / lzma_cputhreads();
>> ++                      uint64_t memory_usage_virt;
>> ++                      rpmlog(RPMLOG_NOTICE, "XZ: virtual memory restricted to %lu and "
>> ++                             "per CPU thread %lu\n", virtual_memlimit, virtual_memlimit_per_cpu_thread);
>> ++                      /* keep reducing the number of compression threads untill memory
> Typo.
>
>> ++                         usage gets below limit per CPU thread*/
>> ++                      while ((memory_usage_virt = lzma_stream_encoder_mt_memusage(&mt_options)) >
>> ++                             virtual_memlimit_per_cpu_thread) {
>> ++                              /* number of threads shouldn't be able to hit zero with compression
>> ++                               * settings aailable to set through rpm... */
>> ++                              assert(--mt_options.threads != 0);
> Putting an expression with a side effect inside assert() looks
> dubious. Did you test with and without NDEBUG defined?
No. Just copy-paste from code in the same file and same function.

Regards,
/Peter

