Return-Path: <california.l.sullivan@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 93CDE78686
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Mar 2018 17:37:34 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	01 Mar 2018 09:37:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.47,408,1515484800"; d="scan'208";a="179145069"
Received: from clsulliv.jf.intel.com ([10.7.201.36])
	by orsmga004.jf.intel.com with ESMTP; 01 Mar 2018 09:37:35 -0800
To: Anuj Mittal <anuj.mittal@intel.com>,
	openembedded-core@lists.openembedded.org
References: <20180301021518.29564-1-california.l.sullivan@intel.com>
	<20180301021518.29564-5-california.l.sullivan@intel.com>
	<bfa31a79-669b-2327-b366-7aff56a8f57d@intel.com>
From: Cal Sullivan <california.l.sullivan@intel.com>
Message-ID: <6e49d30b-6bf4-eba1-a219-f5231c2c82f1@intel.com>
Date: Thu, 1 Mar 2018 09:37:35 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <bfa31a79-669b-2327-b366-7aff56a8f57d@intel.com>
Subject: Re: [PATCH v3 04/21] grub-efi: if installed and EFI_PROVIDER, install as bootx64 or bootia32
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
X-List-Received-Date: Thu, 01 Mar 2018 17:37:34 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 02/28/2018 06:34 PM, Anuj Mittal wrote:
> Hi Cal,
>
> On 03/01/2018 10:15 AM, California Sullivan wrote:
>> This way we could theoretically support multiple bootloaders, and we
>> keep the convention of boot(x64|ia32).
>>
>> Signed-off-by: California Sullivan <california.l.sullivan@intel.com>
>> ---
>>   meta/recipes-bsp/grub/grub-efi_2.02.bb | 13 ++++++++-----
>>   1 file changed, 8 insertions(+), 5 deletions(-)
>>
>> diff --git a/meta/recipes-bsp/grub/grub-efi_2.02.bb b/meta/recipes-bsp/grub/grub-efi_2.02.bb
>> index c5a68f01cef..ed27b90fdbc 100644
>> --- a/meta/recipes-bsp/grub/grub-efi_2.02.bb
>> +++ b/meta/recipes-bsp/grub/grub-efi_2.02.bb
>> @@ -15,16 +15,19 @@ S = "${WORKDIR}/grub-${PV}"
>>   python __anonymous () {
>>       import re
>>       target = d.getVar('TARGET_ARCH')
>> +    prefix = "" if d.getVar('EFI_PROVIDER') == "grub-efi" else "grub-efi-"
>>       if target == "x86_64":
>>           grubtarget = 'x86_64'
>> -        grubimage = "grub-efi-bootx64.efi"
>> +        grubimage = prefix + "bootx64.efi"
>>       elif re.match('i.86', target):
>>           grubtarget = 'i386'
>> -        grubimage = "grub-efi-bootia32.efi"
>> +        grubimage = prefix + "bootia32.efi"
>>       else:
>>           raise bb.parse.SkipRecipe("grub-efi is incompatible with target %s" % target)
>>       d.setVar("GRUB_TARGET", grubtarget)
>>       d.setVar("GRUB_IMAGE", grubimage)
>> +    prefix = "grub-efi-" if prefix == "" else ""
>> +    d.setVar("GRUB_IMAGE_PREFIX", prefix)
>>   }
>>   
>>   inherit deploy
>> @@ -41,7 +44,7 @@ do_mkimage() {
>>   	# Search for the grub.cfg on the local boot media by using the
>>   	# built in cfg file provided via this recipe
>>   	grub-mkimage -c ../cfg -p /EFI/BOOT -d ./grub-core/ \
>> -	               -O ${GRUB_TARGET}-efi -o ./${GRUB_IMAGE} \
>> +	               -O ${GRUB_TARGET}-efi -o ./${GRUB_IMAGE_PREFIX}${GRUB_IMAGE} \
>>   	               ${GRUB_BUILDIN}
>>   }
>>   
>> @@ -55,7 +58,7 @@ do_install_append_class-target() {
>>   	install -d ${D}/boot
>>   	install -d ${D}/boot/EFI
>>   	install -d ${D}/boot/EFI/BOOT
>> -	install -m 644 ${B}/${GRUB_IMAGE} ${D}/boot/EFI/BOOT/
>> +	install -m 644 ${B}/${GRUB_IMAGE_PREFIX}${GRUB_IMAGE} ${D}/boot/EFI/BOOT/${GRUB_IMAGE}
>>   }
>>   
>>   do_install_class-native() {
>> @@ -79,7 +82,7 @@ GRUB_BUILDIN ?= "boot linux ext2 fat serial part_msdos part_gpt normal \
>>                    efi_gop iso9660 configfile search loadenv test"
>>   
>>   do_deploy() {
>> -	install -m 644 ${B}/${GRUB_IMAGE} ${DEPLOYDIR}
>> +	install -m 644 ${B}/${GRUB_IMAGE_PREFIX}${GRUB_IMAGE} ${DEPLOYDIR}
>>   }
>>   
>>   do_deploy_class-native() {
>>
> Should FILES_${PN} also be changed to add prefix?
Nope, only ${GRUB_IMAGE}. It gets installed as ${GRUB_IMAGE}, which will 
either be grub-efi-bootx64.efi or bootx64.efi (or ia32 equivalents). 
${GRUB_IMAGE_PREFIX} is only used to set the build target, input file 
for installation, and deploy target. ${GRUB_IMAGE_PREFIX} will always be 
either "grub-efi" or "", and together ${GRUB_IMAGE_PREFIX}${GRUB_IMAGE} 
will always create grub-efi-boot(x64|ia32).efi.

The goal of this is to install as boot(x64|ia32).efi if it is selected 
as the EFI_PROVIDER, and install as the complete name otherwise. This 
allows one efi bootloader to be installed as the standard 
boot(x64|ia32).efi, while still being able to coexist with other efi 
bootloaders.

Thanks,
Cal
>
> Thanks,
> Anuj
>


