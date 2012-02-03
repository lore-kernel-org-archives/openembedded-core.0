Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RtSgn-0003fp-D4
	for openembedded-core@lists.openembedded.org;
	Sat, 04 Feb 2012 00:37:09 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 03 Feb 2012 15:26:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="103081733"
Received: from unknown (HELO [10.255.14.242]) ([10.255.14.242])
	by azsmga001.ch.intel.com with ESMTP; 03 Feb 2012 15:26:31 -0800
Message-ID: <4F2C6D27.8050501@linux.intel.com>
Date: Fri, 03 Feb 2012 15:26:31 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:9.0) Gecko/20111222 Thunderbird/9.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1328305049-18696-1-git-send-email-Chase.Maupin@ti.com>
	<1328305049-18696-2-git-send-email-Chase.Maupin@ti.com>
	<7D46E86EC0A8354091174257B2FED10127649BE9@DFLE34.ent.ti.com>
In-Reply-To: <7D46E86EC0A8354091174257B2FED10127649BE9@DFLE34.ent.ti.com>
Subject: Re: [PATCH 1/1] u-boot inc: update inc file for newer u-boot versions
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 03 Feb 2012 23:37:09 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 02/03/2012 01:43 PM, Maupin, Chase wrote:
>> -----Original Message-----
>> From: Maupin, Chase
>> Sent: Friday, February 03, 2012 3:37 PM
>> To: openembedded-core@lists.openembedded.org
>> Cc: Maupin, Chase
>> Subject: [PATCH 1/1] u-boot inc: update inc file for newer u-boot
>> versions
>>
>> * Add support for different suffixes found with later u-boot
>>    versions which have switched from .bin to .img
>> * Allow recipes that include u-boot.inc to also package an
>>    SPL if they build one.
>>      * Minimum requirement is to set the SPL_BINARY value to add
>>        the SPL to the u-boot package as well as into the deploy
>>        directory.
>>
>> Signed-off-by: Chase Maupin<Chase.Maupin@ti.com>
>> ---
>>   meta/recipes-bsp/u-boot/u-boot.inc |   37
>> ++++++++++++++++++++++++++++++++---
>>   1 files changed, 33 insertions(+), 4 deletions(-)
>>
>> diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-
>> bsp/u-boot/u-boot.inc
>> index 4180345..dcf5463 100644
>> --- a/meta/recipes-bsp/u-boot/u-boot.inc
>> +++ b/meta/recipes-bsp/u-boot/u-boot.inc
>> @@ -19,11 +19,22 @@ python () {
>>   		raise bb.parse.SkipPackage("because UBOOT_MACHINE is
>> not set")
>>   }
>>
>> -UBOOT_IMAGE ?= "u-boot-${MACHINE}-${PV}-${PR}.bin"
>> -UBOOT_BINARY ?= "u-boot.bin"
>> -UBOOT_SYMLINK ?= "u-boot-${MACHINE}.bin"
>> +# Some versions of u-boot use .bin and others use .img.  By
>> default use .bin
>> +# but enable individual recipes to change this value.
>> +UBOOT_SUFFIX ?= "bin"
>> +UBOOT_IMAGE ?= "u-boot-${MACHINE}-${PV}-${PR}.${UBOOT_SUFFIX}"
>> +UBOOT_BINARY ?= "u-boot.${UBOOT_SUFFIX}"
>> +UBOOT_SYMLINK ?= "u-boot-${MACHINE}.${UBOOT_SUFFIX}"
>>   UBOOT_MAKE_TARGET ?= "all"
>>
>> +# Some versions of u-boot build an SPL (Second Program Loader)
>> image that
>> +# should be packaged along with the u-boot binary as well as
>> placed in the
>> +# deploy directory.  For those versions they can set the following
>> variables
>> +# to allow packaging the SPL.
>> +SPL_BINARY ?= ""
>> +SPL_IMAGE ?= "${SPL_BINARY}-${PV}-${PR}"
>> +SPL_SYMLINK ?= "${SPL_BINARY}-${MACHINE}"
>> +
>>   do_compile () {
>>   	unset LDFLAGS
>>   	unset CFLAGS
>> @@ -36,15 +47,33 @@ do_install () {
>>       install -d ${D}/boot
>>       install ${S}/${UBOOT_BINARY} ${D}/boot/${UBOOT_IMAGE}
>>       ln -sf ${UBOOT_IMAGE} ${D}/boot/${UBOOT_BINARY}
>> +
>> +    if [ "x${SPL_BINARY}" != "x" ]
>> +    then
>> +        install ${S}/${SPL_BINARY} ${D}/boot/${SPL_IMAGE}
>> +        ln -sf ${SPL_IMAGE} ${D}/boot/${SPL_BINARY}
>> +    fi
>>   }
>>
>>   FILES_${PN} = "/boot"
>> +# no gnu_hash in uboot.bin, by design, so skip QA
>> +INSANE_SKIP_${PN} = True
>
> BTW, I believe I can remove this line since I didn't see any QA warnings when building without it.  I have seen versions of u-boot.inc that use the INSANE_SKIP and versions that don't so I'm not sure what the right thing is here.
>
If you are going to set it, it should be the list of which tests to skip 
rather than True.

INSANE_SKIP_${PN} = "ldflags" for the gnu_hash check, need to read 
insane.bbclass to figure that out.

Sau!

>>
>>   do_deploy () {
>> -	install ${S}/u-boot.bin ${DEPLOYDIR}/${UBOOT_IMAGE}
>> +    install -d ${DEPLOYDIR}
>> +	install ${S}/${UBOOT_BINARY} ${DEPLOYDIR}/${UBOOT_IMAGE}
>>
>>   	cd ${DEPLOYDIR}
>>   	rm -f ${UBOOT_SYMLINK}
>>   	ln -sf ${UBOOT_IMAGE} ${UBOOT_SYMLINK}
>> +
>> +    if [ "x${SPL_BINARY}" != "x" ]
>> +    then
>> +        install ${S}/${SPL_BINARY} ${DEPLOYDIR}/${SPL_IMAGE}
>> +        rm -f ${DEPLOYDIR}/${SPL_BINARY}
>> ${DEPLOYDIR}/${SPL_SYMLINK}
>> +        ln -sf ${SPL_IMAGE} ${DEPLOYDIR}/${SPL_BINARY}
>> +        ln -sf ${SPL_IMAGE} ${DEPLOYDIR}/${SPL_SYMLINK}
>> +    fi
>>   }
>> +
>>   addtask deploy before do_build after do_compile
>> --
>> 1.7.0.4
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


