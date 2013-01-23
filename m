Received: from mail-ie0-f180.google.com ([209.85.223.180])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1TxwDU-0006V3-9t
	for openembedded-core@lists.openembedded.org;
	Wed, 23 Jan 2013 10:01:57 +0100
Received: by mail-ie0-f180.google.com with SMTP id c10so12992714ieb.39
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Jan 2013 00:46:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:content-type;
	bh=b3lu2gqs80mVX2rsi4gI7k0AIlozUQvXTMZf+Dszenk=;
	b=jmOBxXLcLFE9SoRB3CLv+sVSyXjdBxBKUdnoD08zf+NLzfpN6Mztme4e834PZubTgE
	xxYY6RuAqmHPLP8jWOSyz1hdzcWFF3G1Xpr4SAvfa+m/UvDhozWG99WenNwl7/s7WGZk
	ZmRbSxcWuvApRFvOcscoudDOJhc7c6kdTtqAaeDyoNN1OOXQiCdkoICa+n6w8TfARr4C
	hfQbP7ttb5kR1KiOgfYQz2VHi0iUyTDpsSgs+zGdWLs+2MazE5Vz90Q3yuz4tApdEQJP
	y8Xz1qSkMTFPsRqOQmO4/zdunzQV2BEx8uBZeryOPkXzGEF+uI5b+nnPQRGFTbsY8jLX
	FsHA==
MIME-Version: 1.0
X-Received: by 10.50.179.66 with SMTP id de2mr426528igc.59.1358930784565; Wed,
	23 Jan 2013 00:46:24 -0800 (PST)
Received: by 10.64.98.163 with HTTP; Wed, 23 Jan 2013 00:46:24 -0800 (PST)
In-Reply-To: <50FEFA22.2090008@linux.intel.com>
References: <cover.1358634922.git.raj.khem@gmail.com>
	<613da782b369ba5424b5619b4315ea34e645d53c.1358634922.git.raj.khem@gmail.com>
	<50FEFA22.2090008@linux.intel.com>
Date: Wed, 23 Jan 2013 09:46:24 +0100
Message-ID: <CAAQYJAtiab8SLeZ2znyYBto8cGKDDHWGj2vosDzpRvPdi7D-pw@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/4] kernel.bbclass, module-base.bbclass: Use CC to form KERNEL_CC
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 23 Jan 2013 09:01:57 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Jan 22, 2013 at 9:44 PM, Darren Hart <dvhart@linux.intel.com> wrote:
>
>
> On 01/19/2013 02:40 PM, Khem Raj wrote:
>> kernel compiler is not special and we currently have it so
>> we want to pass -march and -mtune options as CFLAGS to kernel
>> build so that compiler picks the right subarch flags when
>> compiling assembly files in particular. Otherwise defaults
>> are chosen which may not be right in many case e.g. when
>> compiling kernel for collie machine we should use arch=armv4
>> but it uses toolchain/as defaults which is armv5te
>>
>> in some case e.g. thumb1 we know that kernel can not be compiled
>> in thumb1 mode so we can provide that information e.g. -marm
>> option through KERNEL_HOST_CC_ARCH variable as we do now
>>
>
> Makes me nervous... only because I'm not well versed enough across the
> architectures to catch some little gotchas. How much testing has this
> seen? Which architectures?
>

I've built and booted kernels for strongarm/armv4) and for pxa/armv5te.


Andrea



> --
> Darren
>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>>  meta/classes/kernel-arch.bbclass |   13 +++++++++++++
>>  meta/classes/kernel.bbclass      |   16 +---------------
>>  meta/classes/module-base.bbclass |   16 ----------------
>>  3 files changed, 14 insertions(+), 31 deletions(-)
>>
>> diff --git a/meta/classes/kernel-arch.bbclass b/meta/classes/kernel-arch.bbclass
>> index b3b78b6..a51e82b 100644
>> --- a/meta/classes/kernel-arch.bbclass
>> +++ b/meta/classes/kernel-arch.bbclass
>> @@ -43,3 +43,16 @@ def map_uboot_arch(a, d):
>>
>>  export UBOOT_ARCH = "${@map_uboot_arch(d.getVar('ARCH', True), d)}"
>>
>> +# Set TARGET_??_KERNEL_ARCH in the machine .conf to set architecture
>> +# specific options necessary for building the kernel and modules.
>> +TARGET_CC_KERNEL_ARCH ?= ""
>> +HOST_CC_KERNEL_ARCH ?= "${TARGET_CC_KERNEL_ARCH}"
>> +TARGET_LD_KERNEL_ARCH ?= ""
>> +HOST_LD_KERNEL_ARCH ?= "${TARGET_LD_KERNEL_ARCH}"
>> +TARGET_AR_KERNEL_ARCH ?= ""
>> +HOST_AR_KERNEL_ARCH ?= "${TARGET_AR_KERNEL_ARCH}"
>> +
>> +KERNEL_CC = "${CC} ${HOST_CC_KERNEL_ARCH}"
>> +KERNEL_LD = "${LD} ${HOST_LD_KERNEL_ARCH}"
>> +KERNEL_AR = "${AR} ${HOST_AR_KERNEL_ARCH}"
>> +
>> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
>> index d459569..e2a582b 100644
>> --- a/meta/classes/kernel.bbclass
>> +++ b/meta/classes/kernel.bbclass
>> @@ -1,7 +1,7 @@
>>  inherit linux-kernel-base module_strip
>>
>>  PROVIDES += "virtual/kernel"
>> -DEPENDS += "virtual/${TARGET_PREFIX}gcc kmod-native virtual/${TARGET_PREFIX}gcc${KERNEL_CCSUFFIX}"
>> +DEPENDS += "virtual/${TARGET_PREFIX}gcc kmod-native"
>>
>>  # we include gcc above, we dont need virtual/libc
>>  INHIBIT_DEFAULT_DEPS = "1"
>> @@ -37,20 +37,6 @@ KERNEL_PRIORITY ?= "${@int(d.getVar('PV',1).split('-')[0].split('+')[0].split('.
>>
>>  KERNEL_RELEASE ?= "${KERNEL_VERSION}"
>>
>> -KERNEL_CCSUFFIX ?= ""
>> -KERNEL_LDSUFFIX ?= ""
>> -
>> -# Set TARGET_??_KERNEL_ARCH in the machine .conf to set architecture
>> -# specific options necessary for building the kernel and modules.
>> -#FIXME: should be this: TARGET_CC_KERNEL_ARCH ?= "${TARGET_CC_ARCH}"
>> -TARGET_CC_KERNEL_ARCH ?= ""
>> -HOST_CC_KERNEL_ARCH ?= "${TARGET_CC_KERNEL_ARCH}"
>> -TARGET_LD_KERNEL_ARCH ?= ""
>> -HOST_LD_KERNEL_ARCH ?= "${TARGET_LD_KERNEL_ARCH}"
>> -
>> -KERNEL_CC = "${CCACHE}${HOST_PREFIX}gcc${KERNEL_CCSUFFIX} ${HOST_CC_KERNEL_ARCH}${TOOLCHAIN_OPTIONS}"
>> -KERNEL_LD = "${HOST_PREFIX}ld${KERNEL_LDSUFFIX} ${HOST_LD_KERNEL_ARCH}${TOOLCHAIN_OPTIONS}"
>> -
>>  # Where built kernel lies in the kernel tree
>>  KERNEL_OUTPUT ?= "arch/${ARCH}/boot/${KERNEL_IMAGETYPE}"
>>  KERNEL_IMAGEDEST = "boot"
>> diff --git a/meta/classes/module-base.bbclass b/meta/classes/module-base.bbclass
>> index 210c47c..cfee50a 100644
>> --- a/meta/classes/module-base.bbclass
>> +++ b/meta/classes/module-base.bbclass
>> @@ -7,22 +7,6 @@ export CROSS_COMPILE = "${TARGET_PREFIX}"
>>
>>  export KERNEL_VERSION = "${@base_read_file('${STAGING_KERNEL_DIR}/kernel-abiversion')}"
>>  KERNEL_OBJECT_SUFFIX = ".ko"
>> -KERNEL_CCSUFFIX = "${@base_read_file('${STAGING_KERNEL_DIR}/kernel-ccsuffix')}"
>> -KERNEL_LDSUFFIX = "${@base_read_file('${STAGING_KERNEL_DIR}/kernel-ldsuffix')}"
>> -KERNEL_ARSUFFIX = "${@base_read_file('${STAGING_KERNEL_DIR}/kernel-arsuffix')}"
>> -
>> -# Set TARGET_??_KERNEL_ARCH in the machine .conf to set architecture
>> -# specific options necessary for building the kernel and modules.
>> -TARGET_CC_KERNEL_ARCH ?= ""
>> -HOST_CC_KERNEL_ARCH ?= "${TARGET_CC_KERNEL_ARCH}"
>> -TARGET_LD_KERNEL_ARCH ?= ""
>> -HOST_LD_KERNEL_ARCH ?= "${TARGET_LD_KERNEL_ARCH}"
>> -TARGET_AR_KERNEL_ARCH ?= ""
>> -HOST_AR_KERNEL_ARCH ?= "${TARGET_AR_KERNEL_ARCH}"
>> -
>> -KERNEL_CC = "${CCACHE}${HOST_PREFIX}gcc${KERNEL_CCSUFFIX} ${HOST_CC_KERNEL_ARCH}"
>> -KERNEL_LD = "${HOST_PREFIX}ld${KERNEL_LDSUFFIX} ${HOST_LD_KERNEL_ARCH}"
>> -KERNEL_AR = "${HOST_PREFIX}ar${KERNEL_ARSUFFIX} ${HOST_AR_KERNEL_ARCH}"
>>
>>  # kernel modules are generally machine specific
>>  PACKAGE_ARCH = "${MACHINE_ARCH}"
>>
>
> --
> Darren Hart
> Intel Open Source Technology Center
> Yocto Project - Technical Lead - Linux Kernel
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


