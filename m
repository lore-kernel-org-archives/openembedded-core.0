Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 5BA3573D27
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Apr 2015 13:53:12 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.9) with ESMTP id t3FDrCjW028191
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 15 Apr 2015 06:53:12 -0700 (PDT)
Received: from [128.224.162.174] (128.224.162.174) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 15 Apr 2015 06:53:11 -0700
Message-ID: <552E6D46.1010701@windriver.com>
Date: Wed, 15 Apr 2015 21:53:10 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Thunderbird/31.6.0
MIME-Version: 1.0
To: Koen Kooi <koen@dominion.thruhere.net>, Richard Purdie
	<richard.purdie@linuxfoundation.org>
References: <1429101157-12319-1-git-send-email-koen.kooi@linaro.org>
	<1429104564.6976.115.camel@linuxfoundation.org>
	<6A30645B-9ABE-4498-AF6C-4E432984ED95@dominion.thruhere.net>
In-Reply-To: <6A30645B-9ABE-4498-AF6C-4E432984ED95@dominion.thruhere.net>
Cc: Koen Kooi <koen.kooi@linaro.org>, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] strace: fix build for aarch64
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
X-List-Received-Date: Wed, 15 Apr 2015 13:53:13 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit



On 04/15/2015 09:32 PM, Koen Kooi wrote:
>
>> Op 15 apr. 2015, om 15:29 heeft Richard Purdie <richard.purdie@linuxfoundation.org> het volgende geschreven:
>>
>> On Wed, 2015-04-15 at 14:32 +0200, Koen Kooi wrote:
>>> Upstream added aarch64 support but forgot to update 'make dist' leading to missing files in the tarball.
>>>
>>> Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
>>> ---
>>> .../0001-Add-linux-aarch64-arch_regs.h.patch       | 25 ++++++++++++++++++++++
>>> meta/recipes-devtools/strace/strace_4.10.bb        |  1 +
>>> 2 files changed, 26 insertions(+)
>>> create mode 100644 meta/recipes-devtools/strace/strace/0001-Add-linux-aarch64-arch_regs.h.patch
>>
>> I'm guessing this is a better fix than Robert's fix for strace?
>
> This shrinks the diff between strace.git and ${S}, Roberts version increases it. It’s the same one-liner type fix, though.

Thanks, please drop my patch.

// Robert

>
>> Let me know if they're different issues…
>
> It’s the same issue.
>
> regards,
>
> Koen.
>
>>
>> Cheers,
>>
>> Richard
>>
>>> diff --git a/meta/recipes-devtools/strace/strace/0001-Add-linux-aarch64-arch_regs.h.patch b/meta/recipes-devtools/strace/strace/0001-Add-linux-aarch64-arch_regs.h.patch
>>> new file mode 100644
>>> index 0000000..f70766b
>>> --- /dev/null
>>> +++ b/meta/recipes-devtools/strace/strace/0001-Add-linux-aarch64-arch_regs.h.patch
>>> @@ -0,0 +1,25 @@
>>> +From f85854131c8265f2eb59c714dcea5c4b3dc09bed Mon Sep 17 00:00:00 2001
>>> +From: Koen Kooi <koen.kooi@linaro.org>
>>> +Date: Wed, 15 Apr 2015 14:29:37 +0200
>>> +Subject: [PATCH] Add linux/aarch64/arch_regs.h
>>> +
>>> +It is missing from the tarball, but it is present in git for v4.10
>>> +
>>> +Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
>>> +Upstream-status: Pending
>>> +---
>>> + linux/aarch64/arch_regs.h | 2 ++
>>> + 1 file changed, 2 insertions(+)
>>> + create mode 100644 linux/aarch64/arch_regs.h
>>> +
>>> +diff --git a/linux/aarch64/arch_regs.h b/linux/aarch64/arch_regs.h
>>> +new file mode 100644
>>> +index 0000000..9a5e33e
>>> +--- /dev/null
>>> ++++ b/linux/aarch64/arch_regs.h
>>> +@@ -0,0 +1,2 @@
>>> ++extern uint64_t *const aarch64_sp_ptr;
>>> ++extern uint32_t *const arm_sp_ptr;
>>> +--
>>> +1.9.3
>>> +
>>> diff --git a/meta/recipes-devtools/strace/strace_4.10.bb b/meta/recipes-devtools/strace/strace_4.10.bb
>>> index 416c387..707cb76 100644
>>> --- a/meta/recipes-devtools/strace/strace_4.10.bb
>>> +++ b/meta/recipes-devtools/strace/strace_4.10.bb
>>> @@ -5,6 +5,7 @@ LICENSE = "BSD"
>>> LIC_FILES_CHKSUM = "file://COPYING;md5=124500c21e856f0912df29295ba104c7"
>>>
>>> SRC_URI = "${SOURCEFORGE_MIRROR}/strace/strace-${PV}.tar.xz \
>>> +           file://0001-Add-linux-aarch64-arch_regs.h.patch \
>>>             file://git-version-gen \
>>>             file://strace-add-configure-options.patch \
>>>             file://Makefile-ptest.patch \
>>> --
>>> 1.9.3
>>>
>>
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>
>
>
>

