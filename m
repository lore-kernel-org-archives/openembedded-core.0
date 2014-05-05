Return-Path: <flihp@twobit.us>
Received: from smtp.twobit.us (smtp.twobit.us [38.83.192.235])
	by mail.openembedded.org (Postfix) with ESMTP id 47AA665F54
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 May 2014 16:49:17 +0000 (UTC)
Received: from [216.57.91.130] (helo=[10.204.207.200])
	by smtp.twobit.us with esmtpsa
	(TLS1.0:DHE_RSA_CAMELLIA_256_CBC_SHA1:256) (Exim 4.80)
	(envelope-from <flihp@twobit.us>)
	id 1WhM1X-0004B0-BR; Mon, 05 May 2014 16:45:59 +0000
Message-ID: <5367C0FC.40400@twobit.us>
Date: Mon, 05 May 2014 12:49:00 -0400
From: Philip Tricca <flihp@twobit.us>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:17.0) Gecko/20131104 Icedove/17.0.10
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>
References: <1397611008-7653-1-git-send-email-flihp@twobit.us>
	<5366C06B.7060805@twobit.us> <5367B323.30901@linux.intel.com>
In-Reply-To: <5367B323.30901@linux.intel.com>
X-Enigmail-Version: 1.5.1
X-SA-Exim-Connect-IP: 216.57.91.130
X-SA-Exim-Mail-From: flihp@twobit.us
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on smtp.twobit.us
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.3.2
X-SA-Exim-Version: 4.2.1 (built Mon, 26 Dec 2011 16:24:06 +0000)
X-SA-Exim-Scanned: Yes (on smtp.twobit.us)
Cc: openembedded-core@lists.openembedded.org
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
X-List-Received-Date: Mon, 05 May 2014 16:49:18 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 05/05/2014 11:49 AM, Saul Wold wrote:
> On 05/04/2014 03:34 PM, Philip Tricca wrote:
>> ping ...
>>
> 
> It was merged on 4/16!

Whoops. Was watching the mailing list, not git. My bad.

Thanks!
Philip

> Sau!
> 
>> On 04/15/2014 09:16 PM, Philip Tricca wrote:
>>> The previous behavior defines a static set of modules that are built
>>> into the grub efi executable. This works fine for a limited set of boot
>>> environments namely the standard linux/initrd. This patch conditionally
>>>   assigns the same modules to a variable. This allows other meta layers
>>> to add additional modules or completely override the defaults. The use
>>> case driving this patch is the use of multiboot2 and related modules.
>>>
>>> Signed-off-by: Philip Tricca <flihp@twobit.us>
>>> ---
>>>   meta/recipes-bsp/grub/grub-efi_2.00.bb |    4 +++-
>>>   1 file changed, 3 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/meta/recipes-bsp/grub/grub-efi_2.00.bb
>>> b/meta/recipes-bsp/grub/grub-efi_2.00.bb
>>> index 6944cb2..4b43749 100644
>>> --- a/meta/recipes-bsp/grub/grub-efi_2.00.bb
>>> +++ b/meta/recipes-bsp/grub/grub-efi_2.00.bb
>>> @@ -70,12 +70,14 @@ do_install_class-native() {
>>>       install -m 755 grub-mkimage ${D}${bindir}
>>>   }
>>>
>>> +GRUB_BUILDIN ?= "boot linux ext2 fat serial part_msdos part_gpt
>>> normal efi_gop iso9660 search"
>>> +
>>>   do_deploy() {
>>>       # Search for the grub.cfg on the local boot media by using the
>>>       # built in cfg file provided via this recipe
>>>       grub-mkimage -c ../cfg -p /EFI/BOOT -d ./grub-core/ \
>>>                      -O ${GRUB_TARGET}-efi -o ./${GRUB_IMAGE} \
>>> -                   boot linux ext2 fat serial part_msdos part_gpt
>>> normal efi_gop iso9660 search
>>> +                   ${GRUB_BUILDIN}
>>>       install -m 644 ${B}/${GRUB_IMAGE} ${DEPLOYDIR}
>>>   }
>>>
>>>
>>


