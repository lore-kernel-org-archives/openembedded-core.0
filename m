Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1QPazh-0002kR-1N
	for openembedded-core@lists.openembedded.org;
	Thu, 26 May 2011 15:52:57 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 26 May 2011 06:49:52 -0700
X-ExtLoop1: 1
Received: from unknown (HELO [10.255.12.181]) ([10.255.12.181])
	by orsmga002.jf.intel.com with ESMTP; 26 May 2011 06:49:51 -0700
Message-ID: <4DDE5A8F.5050101@linux.intel.com>
Date: Thu, 26 May 2011 06:50:07 -0700
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110424 Lightning/1.0b2 Thunderbird/3.1.10
MIME-Version: 1.0
To: Jason Kridner <jkridner@beagleboard.org>
References: <cover.1306385875.git.dvhart@linux.intel.com>
	<c83bebea4e1c4dd15422ad2cb75eab977cea4a59.1306385875.git.dvhart@linux.intel.com>
	<732E0947-423B-4DD0-BA56-4C11313BD5DA@beagleboard.org>
In-Reply-To: <732E0947-423B-4DD0-BA56-4C11313BD5DA@beagleboard.org>
Cc: Koen Kooi <koen@dominion.thruhere.net>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [pull-oe-uboot 1/2] u-boot: remove UBOOT_MACHINE and COMPATIBLE_MACHINES
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
X-List-Received-Date: Thu, 26 May 2011 13:52:57 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit



On 05/26/2011 12:47 AM, Jason Kridner wrote:
> I think this is a good change. One comment below...
> 
> On May 26, 2011, at 12:02 AM, Darren Hart <dvhart@linux.intel.com> wrote:
> 
>> oe-core does not define any machines, so it does not make sense to
>> add machine specific information in the oe-core u-boot recipe and
>> infrastructure. Also note that COMPATIBLE_MACHINES is not easily extended due to
>> its regex syntax: "(machine_a|machine_b)", making it difficult to extend the
>> u-boot recipe in bbappend files without resorting to machine specific overrides.
>>
>> Remove COMPATIBLE_MACHINES and the default UBOOT_MACHINE from the recipe and
>> insert some anonymous python into u-boot.inc to raise SkipPackage if
>> UBOOT_MACHINE is not set (this ensures 'world' still works for machines that
>> can't build u-boot).
>>
>> UBOOT_MACHINE must now be specified in each machine config that requires u-boot.
>> This is an improvement over requiring machine specific overrides in every BSP
>> layer's u-boot_git.bbappend file. For example, a beagleboard machine config
>> currently contains:
>>
>> UBOOT_ENTRYPOINT = "0x80008000"
>> UBOOT_LOADADDRESS = "0x80008000"
>>
>> With this change, it must now contain:
>>
>> UBOOT_MACHINE = "omap3_beagle_config"
>> UBOOT_ENTRYPOINT = "0x80008000"
>> UBOOT_LOADADDRESS = "0x80008000"
>>
>> So long as the SRC_URI in the base recipe can build a working u-boot for a given
>> machine, there is no need to create a u-boot_git.bbappend file. If additional
>> patches are deemed necessary, a BSP layer creates a u-boot_git.bbappend file and
>> extends the SRC_URI to include general or machine specific backports.
>>
>> Signed-off-by: Darren Hart <dvhart@linux.intel.com>
>> Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
>> Cc: Koen Kooi <koen@dominion.thruhere.net>
>> Cc: Jason Kridner <jkridner@beagleboard.org>
>> ---
>> meta/recipes-bsp/uboot/u-boot.inc    |    8 +++++++-
>> meta/recipes-bsp/uboot/u-boot_git.bb |   11 ++++++-----
>> 2 files changed, 13 insertions(+), 6 deletions(-)
>>
>> diff --git a/meta/recipes-bsp/uboot/u-boot.inc b/meta/recipes-bsp/uboot/u-boot.inc
>> index 058e3ba..a54cf24 100644
>> --- a/meta/recipes-bsp/uboot/u-boot.inc
>> +++ b/meta/recipes-bsp/uboot/u-boot.inc
>> @@ -11,7 +11,13 @@ PARALLEL_MAKE=""
>> # GCC 4.5.1 builds unusable binaries using -Os, remove it from OPTFLAGS
>> EXTRA_OEMAKE = "CROSS_COMPILE=${TARGET_PREFIX} OPTFLAGS='-O2'"
>>
>> -UBOOT_MACHINE ?= "${MACHINE}_config"
>> +python () {
>> +    if not bb.data.getVar('UBOOT_MACHINE', d, 1):
>> +        bb.debug("To build %s, see u-boot_git.bb for instructions on \
> 
> If this file was renamed, don't you also want to update this printout?

Oh, tricky. This should be addressed in the 2/2 patch.... but what to
name it too. Do I have access to the filename of the recipe that
included this one, causing this code to run? Perhaps I should move the
instructions into this .inc file since the u-boot_*.bb recipe name will
change over time if my 2/2 patch is accepted?

Thoughts?

--
Darren

> 
>> +              setting up your machine config" % pn)
>> +        raise bb.parse.SkipPackage("because UBOOT_MACHINE is not set")
>> +}
>> +
>> UBOOT_IMAGE ?= "u-boot-${MACHINE}-${PV}-${PR}.bin"
>> UBOOT_SYMLINK ?= "u-boot-${MACHINE}.bin"
>> UBOOT_MAKE_TARGET ?= "all"
>> diff --git a/meta/recipes-bsp/uboot/u-boot_git.bb b/meta/recipes-bsp/uboot/u-boot_git.bb
>> index 4c8f5df..0fbb9ba 100644
>> --- a/meta/recipes-bsp/uboot/u-boot_git.bb
>> +++ b/meta/recipes-bsp/uboot/u-boot_git.bb
>> @@ -1,5 +1,11 @@
>> require u-boot.inc
>>
>> +# To build u-boot for your machine, provide the following lines in your machine
>> +# config, replacing the assignments as appropriate for your machine.
>> +# UBOOT_MACHINE = "omap3_beagle_config"
>> +# UBOOT_ENTRYPOINT = "0x80008000"
>> +# UBOOT_LOADADDRESS = "0x80008000"
>> +
>> LICENSE = "GPLv2+"
>> LIC_FILES_CHKSUM = "file://COPYING;md5=1707d6db1d42237583f50183a5651ecb \
>>                     file://README;beginline=1;endline=22;md5=3a00ef51d3fc96e9d6c1bc4708ccd3b5"
>> @@ -12,11 +18,6 @@ PR="r3"
>>
>> SRC_URI = "git://git.denx.de/u-boot.git;branch=master;protocol=git"
>>
>> -UBOOT_MACHINE_beagleboard = "omap3_beagle_config"
>> -UBOOT_MACHINE_overo = "omap3_overo_config"
>> -
>> S = "${WORKDIR}/git"
>>
>> PACKAGE_ARCH = "${MACHINE_ARCH}"
>> -
>> -COMPATIBLE_MACHINE = "(beagleboard|overo)"
>> -- 
>> 1.7.1
>>

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel


