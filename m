Return-Path: <Zhe.He@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 394FD7F97A
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Nov 2019 02:01:21 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id xA121LR2008533
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 31 Oct 2019 19:01:21 -0700 (PDT)
Received: from [128.224.158.234] (128.224.158.234) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.468.0;
	Thu, 31 Oct 2019 19:01:20 -0700
To: Bruce Ashfield <bruce.ashfield@gmail.com>
References: <1572517219-382824-1-git-send-email-zhe.he@windriver.com>
	<CADkTA4OvFRd7wCFQRHZAv+BMki9nsX_g5_TuogsHUvSnmDGLxg@mail.gmail.com>
From: He Zhe <zhe.he@windriver.com>
Message-ID: <5e5f4937-0465-49c0-66aa-71b79628fdf2@windriver.com>
Date: Fri, 1 Nov 2019 10:01:17 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CADkTA4OvFRd7wCFQRHZAv+BMki9nsX_g5_TuogsHUvSnmDGLxg@mail.gmail.com>
X-Originating-IP: [128.224.158.234]
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] linux-dummy: Add package kernel
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
X-List-Received-Date: Fri, 01 Nov 2019 02:01:22 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 10/31/19 6:57 PM, Bruce Ashfield wrote:
> On Thu, Oct 31, 2019 at 6:20 AM <zhe.he@windriver.com> wrote:
>> From: He Zhe <zhe.he@windriver.com>
>>
>> Some package like packagegroup-core-boot may ask for package kernel. Let
>> linux-dummy rprovide package kernel to fix the following build failure.
>>
>> ERROR: Nothing RPROVIDES 'kernel' (but
>> .../meta/recipes-core/packagegroups/packagegroup-core-boot.bb RDEPENDS on or
>> otherwise requires it)
> Can you expand on what the higher level use case is that something is
> using packagegroup-core-boot (or whatever), but also linux-dummy ?
>
> It seems like this is going to hide misconfigurations .. since you may
> want something bootable, but yet are not properly configured.
>
> If there's part of that packagroup you need, why not split it up,
> rather than masking the symptom seen here ?

It's the "efi" in MACHINE_FEATURES who asks for "kernel".
https://git.openembedded.org/openembedded-core/tree/meta/recipes-core/packagegroups/packagegroup-core-boot.bb#n31

I thought the user would take care of the kernel himself, so simply added it to
linux-dummy. I'm not quite sure what you mean by "split it up".

Regards,
Zhe

>
> Bruce
>
>> Signed-off-by: He Zhe <zhe.he@windriver.com>
>> ---
>>  meta/recipes-kernel/linux/linux-dummy.bb | 7 +++++--
>>  1 file changed, 5 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta/recipes-kernel/linux/linux-dummy.bb b/meta/recipes-kernel/linux/linux-dummy.bb
>> index 62cf6f5ea6..20d7ed815d 100644
>> --- a/meta/recipes-kernel/linux/linux-dummy.bb
>> +++ b/meta/recipes-kernel/linux/linux-dummy.bb
>> @@ -8,19 +8,22 @@ LICENSE = "GPLv2"
>>  LIC_FILES_CHKSUM = "file://${WORKDIR}/COPYING.GPL;md5=751419260aa954499f7abaabaa882bbe"
>>
>>  PROVIDES += "virtual/kernel"
>> +RPROVIDES_${PN} += "kernel lib32-kernel"
>>
>>  PACKAGES_DYNAMIC += "^kernel-module-.*"
>>  PACKAGES_DYNAMIC += "^kernel-image-.*"
>>  PACKAGES_DYNAMIC += "^kernel-firmware-.*"
>>
>> -PACKAGES += "kernel-modules kernel-vmlinux"
>> +PACKAGES += "kernel-modules kernel-vmlinux kernel"
>>  FILES_kernel-modules = ""
>>  ALLOW_EMPTY_kernel-modules = "1"
>>  DESCRIPTION_kernel-modules = "Kernel modules meta package"
>>  FILES_kernel-vmlinux = ""
>>  ALLOW_EMPTY_kernel-vmlinux = "1"
>>  DESCRIPTION_kernel-vmlinux = "Kernel vmlinux meta package"
>> -
>> +FILES_kernel = ""
>> +ALLOW_EMPTY_kernel = "1"
>> +DESCRIPTION_kernel = "Kernel meta package"
>>
>>  INHIBIT_DEFAULT_DEPS = "1"
>>
>> --
>> 2.17.1
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>


