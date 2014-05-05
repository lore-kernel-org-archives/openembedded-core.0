Return-Path: <sgw@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 7029665F49
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 May 2014 15:50:05 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 05 May 2014 08:50:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,988,1389772800"; d="scan'208";a="533781910"
Received: from unknown (HELO [10.255.12.182]) ([10.255.12.182])
	by fmsmga002.fm.intel.com with ESMTP; 05 May 2014 08:49:58 -0700
Message-ID: <5367B323.30901@linux.intel.com>
Date: Mon, 05 May 2014 08:49:55 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: Philip Tricca <flihp@twobit.us>, openembedded-core@lists.openembedded.org
References: <1397611008-7653-1-git-send-email-flihp@twobit.us>
	<5366C06B.7060805@twobit.us>
In-Reply-To: <5366C06B.7060805@twobit.us>
Subject: Re: [PATCH] grub-efi: Use a variable to specify built-in grub modules.
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
X-List-Received-Date: Mon, 05 May 2014 15:50:06 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/04/2014 03:34 PM, Philip Tricca wrote:
> ping ...
>

It was merged on 4/16!

Sau!

> On 04/15/2014 09:16 PM, Philip Tricca wrote:
>> The previous behavior defines a static set of modules that are built
>> into the grub efi executable. This works fine for a limited set of boot
>> environments namely the standard linux/initrd. This patch conditionally
>>   assigns the same modules to a variable. This allows other meta layers
>> to add additional modules or completely override the defaults. The use
>> case driving this patch is the use of multiboot2 and related modules.
>>
>> Signed-off-by: Philip Tricca <flihp@twobit.us>
>> ---
>>   meta/recipes-bsp/grub/grub-efi_2.00.bb |    4 +++-
>>   1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/meta/recipes-bsp/grub/grub-efi_2.00.bb b/meta/recipes-bsp/grub/grub-efi_2.00.bb
>> index 6944cb2..4b43749 100644
>> --- a/meta/recipes-bsp/grub/grub-efi_2.00.bb
>> +++ b/meta/recipes-bsp/grub/grub-efi_2.00.bb
>> @@ -70,12 +70,14 @@ do_install_class-native() {
>>   	install -m 755 grub-mkimage ${D}${bindir}
>>   }
>>
>> +GRUB_BUILDIN ?= "boot linux ext2 fat serial part_msdos part_gpt normal efi_gop iso9660 search"
>> +
>>   do_deploy() {
>>   	# Search for the grub.cfg on the local boot media by using the
>>   	# built in cfg file provided via this recipe
>>   	grub-mkimage -c ../cfg -p /EFI/BOOT -d ./grub-core/ \
>>   	               -O ${GRUB_TARGET}-efi -o ./${GRUB_IMAGE} \
>> -	               boot linux ext2 fat serial part_msdos part_gpt normal efi_gop iso9660 search
>> +	               ${GRUB_BUILDIN}
>>   	install -m 644 ${B}/${GRUB_IMAGE} ${DEPLOYDIR}
>>   }
>>
>>
>

