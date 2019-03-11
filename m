Return-Path: <kamensky@cisco.com>
X-Greylist: delayed 571 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 11 Mar 2019 04:39:06 UTC
Received: from alln-iport-1.cisco.com (alln-iport-1.cisco.com [173.37.142.88])
	by mail.openembedded.org (Postfix) with ESMTP id 37E9C7CE7D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Mar 2019 04:39:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=cisco.com; i=@cisco.com; l=15970; q=dns/txt;
	s=iport; t=1552279147; x=1553488747;
	h=date:from:to:cc:subject:in-reply-to:message-id:
	references:mime-version;
	bh=E32mIExNZFlV9GR43EfzBBL5GO9GLOIMHwCAFhQjFs0=;
	b=KJjAUXnQb5Lm+naBX8vplY5aAGa/l6eeZ4eF0XXvGRtWPNNgHmiglhuj
	EWbo3oYpDfJZoPZhCAnZjQXEsRupt+PmIc8jKUZbWQGULZmeA1JottlK3
	srPQm09lE0Gk5Vi+N5Vv6mPvD1ezEtKO2DNgdRGHpgLogEBHIjXlhjQk8 w=;
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0AIAACz44Vc/5tdJa1kGQEBAQEBAQE?=
	=?us-ascii?q?BAQEBAQcBAQEBAQGBUwIBAQEBAQsBgWUqaIEDJ40Cik+BJUMlmCaBew0YDYQ?=
	=?us-ascii?q?BRgKENSI2Bw0BAQMBAQcBAwJtHAyFSgEBAQMBAQE2AjQLBQsLEQECAQIBLic?=
	=?us-ascii?q?BIQYIBgESgyOBbQgPr3CEMAGFdIEvAYssF4F/gREzgl+DHgECAoEnEIYIA4l?=
	=?us-ascii?q?2hnqBB4YFjCUJh1GDfIMHhFGBeViFDotbiniFZY0KgU4JKIFWTSMVOw0Qgk8?=
	=?us-ascii?q?Jgg4WgQABCAOBYYVyhV8fAzABjXCCTQEB?=
X-IronPort-AV: E=Sophos;i="5.58,466,1544486400"; d="scan'208";a="243350378"
Received: from rcdn-core-4.cisco.com ([173.37.93.155])
	by alln-iport-1.cisco.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	11 Mar 2019 04:29:36 +0000
Received: from sjc-ads-6991 (sjc-ads-6991.cisco.com [10.30.218.111])
	by rcdn-core-4.cisco.com (8.15.2/8.15.2) with ESMTP id x2B4TZk9014707; 
	Mon, 11 Mar 2019 04:29:35 GMT
Date: Sun, 10 Mar 2019 21:29:35 -0700 (PDT)
From: Victor Kamensky <kamensky@cisco.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
In-Reply-To: <CADkTA4OmYCRtLMPHQRbJooso23g62GD01+yhC45=0hBUDadXGg@mail.gmail.com>
Message-ID: <alpine.LRH.2.00.1903102121520.48832@sjc-ads-6991.cisco.com>
References: <20190311031230.21497-1-richard.purdie@linuxfoundation.org>
	<20190311031230.21497-4-richard.purdie@linuxfoundation.org>
	<CADkTA4OmYCRtLMPHQRbJooso23g62GD01+yhC45=0hBUDadXGg@mail.gmail.com>
User-Agent: Alpine 2.00 (LRH 1167 2008-08-23)
MIME-Version: 1.0
X-Outbound-SMTP-Client: 10.30.218.111, sjc-ads-6991.cisco.com
X-Outbound-Node: rcdn-core-4.cisco.com
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/5] linux-yocto: Fix systemtap issue on armv7
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
X-List-Received-Date: Mon, 11 Mar 2019 04:39:06 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII; format=flowed



On Sun, 10 Mar 2019, Bruce Ashfield wrote:

> On Sun, Mar 10, 2019 at 11:12 PM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
>>
>> Testing stap on armv7 machines was failing due to intermixing of thumb/arm
>> instructions. Patch the kernel to always use the v7 march options since
>> we know our gcc versions support it to avoid the failure and allow
>> systemtap to work.
>
> I'd rather just merge this into the kernel directly. I can do a quick
> merge and bump
> of the SRCREV. If you send the patch against linux-yocto, that makes it easier
> for me to grab and integrate it, versus having to dig it out of here
> (since my access
> is pretty limited at the moment).

BTW please note I posted on ARM linux kernel mailing list
IMO more appropriate and possibly upstreamable fix for the same issue

http://lists.infradead.org/pipermail/linux-arm-kernel/2019-March/637809.html

It seems quite urgent so Richard's fix might work as well as short term.

More inline.

> Bruce
>
>>
>> [YOCTO #13153]
>>
>> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>> ---
>>  ...0001-arm-Makefile-Fix-systemtap-4.19.patch | 60 +++++++++++++++++++
>>  .../0001-arm-Makefile-Fix-systemtap.patch     | 60 +++++++++++++++++++
>>  meta/recipes-kernel/linux/linux-yocto_4.19.bb |  3 +-
>>  meta/recipes-kernel/linux/linux-yocto_5.0.bb  |  3 +-
>>  4 files changed, 124 insertions(+), 2 deletions(-)
>>  create mode 100644 meta/recipes-kernel/linux/linux-yocto/0001-arm-Makefile-Fix-systemtap-4.19.patch
>>  create mode 100644 meta/recipes-kernel/linux/linux-yocto/0001-arm-Makefile-Fix-systemtap.patch
>>
>> diff --git a/meta/recipes-kernel/linux/linux-yocto/0001-arm-Makefile-Fix-systemtap-4.19.patch b/meta/recipes-kernel/linux/linux-yocto/0001-arm-Makefile-Fix-systemtap-4.19.patch
>> new file mode 100644
>> index 00000000000..53bd53b276c
>> --- /dev/null
>> +++ b/meta/recipes-kernel/linux/linux-yocto/0001-arm-Makefile-Fix-systemtap-4.19.patch
>> @@ -0,0 +1,60 @@
>> +From c2995494e311c113177db50ff140cebd94fd4011 Mon Sep 17 00:00:00 2001
>> +From: Richard Purdie <richard.purdie@linuxfoundation.org>
>> +Date: Sun, 10 Mar 2019 06:43:15 +0000
>> +Subject: [PATCH] arm/Makefile: Fix systemtap
>> +
>> +Currently systemtap fails to operate correctly on armv7 systems such as beaglebone and
>> +soon, qemuarm.
>> +
>> +
>> +root@qemuarm:/usr/src/kernel# env -uARCH -uKBUILD_EXTMOD -uCROSS_COMPILE -uKBUILD_IMAGE -uKCONFIG_CONFIG -uINSTALL_PATH -uLD_LIBRARY_PATH PATH=/usr/bin:/bin:/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin make -C /lib/modules/4.19.19-yocto-standard/build M=/tmp/staptcNU6M modules CONFIG_DEBUG_INFO= CONFIG_STACK_VALIDATION= ARCH=arm stap_4321_src.i --no-print-directory -j2 V=1
>> +test -e include/generated/autoconf.h -a -e include/config/auto.conf || (               \
>> +echo >&2;                                                      \
>> +echo >&2 "  ERROR: Kernel configuration is invalid.";          \
>> +echo >&2 "         include/generated/autoconf.h or include/config/auto.conf are missing.";\
>> +echo >&2 "         Run 'make oldconfig && make prepare' on kernel src to fix it.";     \
>> +echo >&2 ;                                                     \
>> +/bin/false)
>> +mkdir -p /tmp/staptcNU6M/.tmp_versions ; rm -f /tmp/staptcNU6M/.tmp_versions/*
>> +make -f ./scripts/Makefile.build obj=/tmp/staptcNU6M
>> +(cat /dev/null;   echo kernel//tmp/staptcNU6M/stap_4321.ko;) > /tmp/staptcNU6M/modules.order
>> +  gcc -Wp,-MD,/tmp/staptcNU6M/.stap_4321_src.o.d  -nostdinc -isystem /usr/lib/gcc/arm-poky-linux-gnueabi/8.3.0/include -I./arch/arm/include -I./arch/arm/include/generated  -I./include -I./arch/arm/include/uapi -I./arch/arm/include/generated/uapi -I./include/uapi -I./include/generated/uapi -include ./include/linux/kconfig.h -include ./include/linux/compiler_types.h -D__KERNEL__ -mlittle-endian -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs -fno-strict-aliasing -fno-common -fshort-wchar -Werror-implicit-function-declaration -Wno-format-security -std=gnu89 -fno-PIE -DCC_HAVE_ASM_GOTO -fno-dwarf2-cfi-asm -fno-omit-frame-pointer -mapcs -mno-sched-prolog -fno-ipa-sra -mabi=aapcs-linux -mfpu=vfp -funwind-tables -marm -Wa,-mno-warn-deprecated -D__LINUX_ARM_ARCH__=7 -march=armv5t -Wa,-march=armv7-a -msoft-float -Uarm -fno-delete-null-pointer-checks -Wno-frame-address -Wno-format-truncation -Wno-format-overflow -Wno-int-in-bool-context -Os -Wno-maybe-uninitialized --param=allow-st
> ore-data-races=0 -Wframe-larger-than=1024 -fstack-protector-strong -Wno-unused-but-set-variable -Wno-unused-const-variable -fno-omit-frame-pointer -fno-optimize-sibling-calls -fno-var-tracking-assignments -pg -Wdeclaration-after-statement -Wno-pointer-sign -Wno-stringop-truncation -fno-strict-overflow -fno-merge-all-constants -fmerge-constants -fno-stack-check -fconserve-stack -Werror=implicit-int -Werror=strict-prototypes -Werror=date-time -Werror=incompatible-pointer-types -Werror=designated-init -fmacro-prefix-map=./= -Wno-packed-not-aligned -Iinclude2/asm/mach-default -I/lib/modules/4.19.19-yocto-standard/build -include /tmp/staptcNU6M/stapconf_4321.h -D "STP_NO_VELREL_CHECK" -freorder-blocks -fasynchronous-unwind-tables -Wframe-larger-than=512 -fno-ipa-icf -Wno-unused -Wno-tautological-compare -Werror -I/usr/share/systemtap/runtime  -DMODULE  -DKBUILD_BASENAME='"stap_4321_src"' -DKBUILD_MODNAME='"stap_4321"' -c -o /tmp/staptcNU6M/stap_4321_src.o /tmp/staptcNU6M/stap_432
> 1_src.c
>> +/tmp/ccaE9CMG.s: Assembler messages:
>> +/tmp/ccaE9CMG.s:49: Error: selected processor does not support `dmb ish' in ARM mode
>> +/tmp/ccaE9CMG.s:52: Error: architectural extension `mp' is not allowed for the current b
>> +
>> +(which was from running the stap command with -v -v -v -k and then being able to run the command individually)
>> +
>> +Note that it says armv5t above.
>> +
>> +That comes from the code this patch changes
>> +
>> +root@qemuarm:/usr/src/kernel# gcc -march=armv7-a /tmp/staptcNU6M/stap_4321_aux_0.c
>> +cc1: error: -mfloat-abi=hard: selected processor lacks an FPU
>> +
>> +which makes me wonder if cc-option fails unless -mfpu-vfp is on the commandline too.
>> +
>> +Since we have a gcc which accepts the armv7-a arch, just remove the cc-option
>> +wrapper unconditionally here.
>> +
>> +Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>> +---
>> + arch/arm/Makefile | 2 +-
>> + 1 file changed, 1 insertion(+), 1 deletion(-)
>> +
>> +diff --git a/arch/arm/Makefile b/arch/arm/Makefile
>> +index ecb99f7ac613..8513ba79ea04 100644
>> +--- a/arch/arm/Makefile
>> ++++ b/arch/arm/Makefile
>> +@@ -64,7 +64,7 @@ KBUILD_CFLAGS        += $(call cc-option,-fno-ipa-sra)
>> + # macro, but instead defines a whole series of macros which makes
>> + # testing for a specific architecture or later rather impossible.
>> + arch-$(CONFIG_CPU_32v7M)      =-D__LINUX_ARM_ARCH__=7 -march=armv7-m -Wa,-march=armv7-m
>> +-arch-$(CONFIG_CPU_32v7)               =-D__LINUX_ARM_ARCH__=7 $(call cc-option,-march=armv7-a,-march=armv5t -Wa$(comma)-march=armv7-a)
>> ++arch-$(CONFIG_CPU_32v7)               =-D__LINUX_ARM_ARCH__=7 -march=armv7-a -Wa$(comma)-march=armv7-a

Small nit: note '-Wa$(comma)-march=armv7-a' was part of
cc-option second choice. It would be used only if first
choice '-march=armv7-a' fails (as in our case). If you
just want unconditionally to enable just first choice of
cc-option it should be

arch-$(CONFIG_CPU_32v7)    =-D__LINUX_ARM_ARCH__=7 -march=armv7-a

Thanks,
Victor

>> + arch-$(CONFIG_CPU_32v6)               =-D__LINUX_ARM_ARCH__=6 $(call cc-option,-march=armv6,-march=armv5t -Wa$(comma)-march=armv6)
>> + # Only override the compiler option if ARMv6. The ARMv6K extensions are
>> + # always available in ARMv7
>> +--
>> +2.20.1
>> +
>> diff --git a/meta/recipes-kernel/linux/linux-yocto/0001-arm-Makefile-Fix-systemtap.patch b/meta/recipes-kernel/linux/linux-yocto/0001-arm-Makefile-Fix-systemtap.patch
>> new file mode 100644
>> index 00000000000..53bd53b276c
>> --- /dev/null
>> +++ b/meta/recipes-kernel/linux/linux-yocto/0001-arm-Makefile-Fix-systemtap.patch
>> @@ -0,0 +1,60 @@
>> +From c2995494e311c113177db50ff140cebd94fd4011 Mon Sep 17 00:00:00 2001
>> +From: Richard Purdie <richard.purdie@linuxfoundation.org>
>> +Date: Sun, 10 Mar 2019 06:43:15 +0000
>> +Subject: [PATCH] arm/Makefile: Fix systemtap
>> +
>> +Currently systemtap fails to operate correctly on armv7 systems such as beaglebone and
>> +soon, qemuarm.
>> +
>> +
>> +root@qemuarm:/usr/src/kernel# env -uARCH -uKBUILD_EXTMOD -uCROSS_COMPILE -uKBUILD_IMAGE -uKCONFIG_CONFIG -uINSTALL_PATH -uLD_LIBRARY_PATH PATH=/usr/bin:/bin:/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin make -C /lib/modules/4.19.19-yocto-standard/build M=/tmp/staptcNU6M modules CONFIG_DEBUG_INFO= CONFIG_STACK_VALIDATION= ARCH=arm stap_4321_src.i --no-print-directory -j2 V=1
>> +test -e include/generated/autoconf.h -a -e include/config/auto.conf || (               \
>> +echo >&2;                                                      \
>> +echo >&2 "  ERROR: Kernel configuration is invalid.";          \
>> +echo >&2 "         include/generated/autoconf.h or include/config/auto.conf are missing.";\
>> +echo >&2 "         Run 'make oldconfig && make prepare' on kernel src to fix it.";     \
>> +echo >&2 ;                                                     \
>> +/bin/false)
>> +mkdir -p /tmp/staptcNU6M/.tmp_versions ; rm -f /tmp/staptcNU6M/.tmp_versions/*
>> +make -f ./scripts/Makefile.build obj=/tmp/staptcNU6M
>> +(cat /dev/null;   echo kernel//tmp/staptcNU6M/stap_4321.ko;) > /tmp/staptcNU6M/modules.order
>> +  gcc -Wp,-MD,/tmp/staptcNU6M/.stap_4321_src.o.d  -nostdinc -isystem /usr/lib/gcc/arm-poky-linux-gnueabi/8.3.0/include -I./arch/arm/include -I./arch/arm/include/generated  -I./include -I./arch/arm/include/uapi -I./arch/arm/include/generated/uapi -I./include/uapi -I./include/generated/uapi -include ./include/linux/kconfig.h -include ./include/linux/compiler_types.h -D__KERNEL__ -mlittle-endian -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs -fno-strict-aliasing -fno-common -fshort-wchar -Werror-implicit-function-declaration -Wno-format-security -std=gnu89 -fno-PIE -DCC_HAVE_ASM_GOTO -fno-dwarf2-cfi-asm -fno-omit-frame-pointer -mapcs -mno-sched-prolog -fno-ipa-sra -mabi=aapcs-linux -mfpu=vfp -funwind-tables -marm -Wa,-mno-warn-deprecated -D__LINUX_ARM_ARCH__=7 -march=armv5t -Wa,-march=armv7-a -msoft-float -Uarm -fno-delete-null-pointer-checks -Wno-frame-address -Wno-format-truncation -Wno-format-overflow -Wno-int-in-bool-context -Os -Wno-maybe-uninitialized --param=allow-st
> ore-data-races=0 -Wframe-larger-than=1024 -fstack-protector-strong -Wno-unused-but-set-variable -Wno-unused-const-variable -fno-omit-frame-pointer -fno-optimize-sibling-calls -fno-var-tracking-assignments -pg -Wdeclaration-after-statement -Wno-pointer-sign -Wno-stringop-truncation -fno-strict-overflow -fno-merge-all-constants -fmerge-constants -fno-stack-check -fconserve-stack -Werror=implicit-int -Werror=strict-prototypes -Werror=date-time -Werror=incompatible-pointer-types -Werror=designated-init -fmacro-prefix-map=./= -Wno-packed-not-aligned -Iinclude2/asm/mach-default -I/lib/modules/4.19.19-yocto-standard/build -include /tmp/staptcNU6M/stapconf_4321.h -D "STP_NO_VELREL_CHECK" -freorder-blocks -fasynchronous-unwind-tables -Wframe-larger-than=512 -fno-ipa-icf -Wno-unused -Wno-tautological-compare -Werror -I/usr/share/systemtap/runtime  -DMODULE  -DKBUILD_BASENAME='"stap_4321_src"' -DKBUILD_MODNAME='"stap_4321"' -c -o /tmp/staptcNU6M/stap_4321_src.o /tmp/staptcNU6M/stap_432
> 1_src.c
>> +/tmp/ccaE9CMG.s: Assembler messages:
>> +/tmp/ccaE9CMG.s:49: Error: selected processor does not support `dmb ish' in ARM mode
>> +/tmp/ccaE9CMG.s:52: Error: architectural extension `mp' is not allowed for the current b
>> +
>> +(which was from running the stap command with -v -v -v -k and then being able to run the command individually)
>> +
>> +Note that it says armv5t above.
>> +
>> +That comes from the code this patch changes
>> +
>> +root@qemuarm:/usr/src/kernel# gcc -march=armv7-a /tmp/staptcNU6M/stap_4321_aux_0.c
>> +cc1: error: -mfloat-abi=hard: selected processor lacks an FPU
>> +
>> +which makes me wonder if cc-option fails unless -mfpu-vfp is on the commandline too.
>> +
>> +Since we have a gcc which accepts the armv7-a arch, just remove the cc-option
>> +wrapper unconditionally here.
>> +
>> +Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>> +---
>> + arch/arm/Makefile | 2 +-
>> + 1 file changed, 1 insertion(+), 1 deletion(-)
>> +
>> +diff --git a/arch/arm/Makefile b/arch/arm/Makefile
>> +index ecb99f7ac613..8513ba79ea04 100644
>> +--- a/arch/arm/Makefile
>> ++++ b/arch/arm/Makefile
>> +@@ -64,7 +64,7 @@ KBUILD_CFLAGS        += $(call cc-option,-fno-ipa-sra)
>> + # macro, but instead defines a whole series of macros which makes
>> + # testing for a specific architecture or later rather impossible.
>> + arch-$(CONFIG_CPU_32v7M)      =-D__LINUX_ARM_ARCH__=7 -march=armv7-m -Wa,-march=armv7-m
>> +-arch-$(CONFIG_CPU_32v7)               =-D__LINUX_ARM_ARCH__=7 $(call cc-option,-march=armv7-a,-march=armv5t -Wa$(comma)-march=armv7-a)
>> ++arch-$(CONFIG_CPU_32v7)               =-D__LINUX_ARM_ARCH__=7 -march=armv7-a -Wa$(comma)-march=armv7-a
>> + arch-$(CONFIG_CPU_32v6)               =-D__LINUX_ARM_ARCH__=6 $(call cc-option,-march=armv6,-march=armv5t -Wa$(comma)-march=armv6)
>> + # Only override the compiler option if ARMv6. The ARMv6K extensions are
>> + # always available in ARMv7
>> +--
>> +2.20.1
>> +
>> diff --git a/meta/recipes-kernel/linux/linux-yocto_4.19.bb b/meta/recipes-kernel/linux/linux-yocto_4.19.bb
>> index 3ef26a12baa..aca9f15404e 100644
>> --- a/meta/recipes-kernel/linux/linux-yocto_4.19.bb
>> +++ b/meta/recipes-kernel/linux/linux-yocto_4.19.bb
>> @@ -22,7 +22,8 @@ SRCREV_machine ?= "11e0e616ed095bb8012e1b4a231254c9656a0193"
>>  SRCREV_meta ?= "41fe45f7c5e69f6ec26c657fea16c459544042cf"
>>
>>  SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH}; \
>> -           git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.19;destsuffix=${KMETA}"
>> +           git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.19;destsuffix=${KMETA} \
>> +           file://0001-arm-Makefile-Fix-systemtap-4.19.patch"
>>
>>  LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
>>  LINUX_VERSION ?= "4.19.19"
>> diff --git a/meta/recipes-kernel/linux/linux-yocto_5.0.bb b/meta/recipes-kernel/linux/linux-yocto_5.0.bb
>> index ae6e80c0108..198fed43411 100644
>> --- a/meta/recipes-kernel/linux/linux-yocto_5.0.bb
>> +++ b/meta/recipes-kernel/linux/linux-yocto_5.0.bb
>> @@ -25,7 +25,8 @@ SRCREV_meta ?= "4faa4419884d2bbe65f637befd71a1e95629eaae"
>>  # KMACHINE_qemuarm ?= "qemuarma15"
>>
>>  SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH}; \
>> -           git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.0;destsuffix=${KMETA}"
>> +           git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.0;destsuffix=${KMETA} \
>> +           file://0001-arm-Makefile-Fix-systemtap.patch"
>>
>>  LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
>>  LINUX_VERSION ?= "5.0"
>> --
>> 2.20.1
>>
>
>
> -- 
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
> -- 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

