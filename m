Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web10.6271.1596030099980790690
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Jul 2020 06:41:40 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: matthew.zeng@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id 06TDfbMT005075
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL);
	Wed, 29 Jul 2020 06:41:37 -0700 (PDT)
Received: from mt-manjaro (128.224.73.221) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.487.0; Wed, 29 Jul
 2020 06:41:37 -0700
References: <20200729130916.38764-1-matthew.zeng@windriver.com>
 <d05d7357b7199a1e787d7f0510eaeacb46740a0a.camel@linuxfoundation.org>
User-agent: mu4e 1.4.10; emacs 27.0.91
From: "Matthew" <matthew.zeng@windriver.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
CC: <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCHv2] ltp: remove OOM tests from runtest/mm
In-Reply-To: <d05d7357b7199a1e787d7f0510eaeacb46740a0a.camel@linuxfoundation.org>
Date: Wed, 29 Jul 2020 09:41:35 -0400
Message-ID: <87bljyqvzk.fsf@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.73.221]
Content-Type: text/plain


Richard Purdie <richard.purdie@linuxfoundation.org> writes:

> On Wed, 2020-07-29 at 09:09 -0400, Matthew wrote:
>> Fixes [YOCTO #13802]
>
> Thanks, we can reference the bug but I don't think we can yet claim it
> fixes it.

Sure, would something like the following work?

Reference [YOCTO #13802]

>
> The missing log issue happened again:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/96/builds/908
> so I think there are multiple issues at play here.

Can you attach this build's log.do_testimage so I can have a further look?

>
> Is there any way to have the logging logged to disk straight away
> rather than stuck internally in oeqa's logging buffers? That way we
> could see which tests had run before a hang?
>
> Also, could we make the scp failure non-fatal, maybe a warning so that
> when it fails we can look at the rest of the logs?

I'll further investigate this idea.

Matthew

>
> Cheers,
>
> Richard
>
>> Remove the OOM tests, since they might cause oeqa ssh
>> connection lost.
>>
>> Signed-off-by: Mingde (Matthew) Zeng <matthew.zeng@windriver.com>
>> ---
>>  ...001-Remove-OOM-tests-from-runtest-mm.patch | 33
>> +++++++++++++++++++
>>  meta/recipes-extended/ltp/ltp_20200515.bb     |  1 +
>>  2 files changed, 34 insertions(+)
>>  create mode 100644 meta/recipes-extended/ltp/ltp/0001-Remove-OOM-
>> tests-from-runtest-mm.patch
>>
>> diff --git a/meta/recipes-extended/ltp/ltp/0001-Remove-OOM-tests-
>> from-runtest-mm.patch b/meta/recipes-extended/ltp/ltp/0001-Remove-
>> OOM-tests-from-runtest-mm.patch
>> new file mode 100644
>> index 0000000000..2d8262be78
>> --- /dev/null
>> +++ b/meta/recipes-extended/ltp/ltp/0001-Remove-OOM-tests-from-
>> runtest-mm.patch
>> @@ -0,0 +1,33 @@
>> +From 373b21dcf7a2879c27cc3dbeac5d83f5d45d22ae Mon Sep 17 00:00:00
>> 2001
>> +From: "Mingde (Matthew) Zeng" <matthewzmd@gmail.com>
>> +Date: Wed, 29 Jul 2020 08:47:09 -0400
>> +Subject: [PATCH] Remove OOM tests from runtest/mm
>> +
>> +Disable OOM tests, as they might cause oeqa ssh connection lost
>> +
>> +Upstream-Status: Inappropriate [oe-core specific]
>> +Signed-off-by: Mingde (Matthew) Zeng <matthew.zeng@windriver.com>
>> +---
>> + runtest/mm | 6 ------
>> + 1 file changed, 6 deletions(-)
>> +
>> +diff --git a/runtest/mm b/runtest/mm
>> +index 4701a14bd..2f9888ec6 100644
>> +--- a/runtest/mm
>> ++++ b/runtest/mm
>> +@@ -75,12 +75,6 @@ ksm06_2 ksm06 -n 10000
>> +
>> + cpuset01 cpuset01
>> +
>> +-oom01 oom01
>> +-oom02 oom02
>> +-oom03 oom03
>> +-oom04 oom04
>> +-oom05 oom05
>> +-
>> + swapping01 swapping01 -i 5
>> +
>> + thp01 thp01 -I 120
>> +--
>> +2.27.0
>> +
>> diff --git a/meta/recipes-extended/ltp/ltp_20200515.bb
>> b/meta/recipes-extended/ltp/ltp_20200515.bb
>> index ece3acf0f9..0c7044d044 100644
>> --- a/meta/recipes-extended/ltp/ltp_20200515.bb
>> +++ b/meta/recipes-extended/ltp/ltp_20200515.bb
>> @@ -37,6 +37,7 @@ SRC_URI = "git://github.com/linux-test-
>> project/ltp.git \
>>             file://0001-ptrace01-Fix-missing-format-string.patch \
>>             file://0001-sigwaitinfo-Do-not-run-invalid-undefined-
>> test-cases.patch \
>>             file://0001-syscalls-copy_file_range02-Expect-EFBIG-in-
>> subcase-m.patch \
>> +           file://0001-Remove-OOM-tests-from-runtest-mm.patch \
>>             "
>>
>>  S = "${WORKDIR}/git"
>> --
>> 2.27.0
>> 


--
Mingde (Matthew) Zeng
