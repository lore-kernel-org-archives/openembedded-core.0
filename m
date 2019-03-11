Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com
	[209.85.208.193])
	by mail.openembedded.org (Postfix) with ESMTP id 69621607A4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Mar 2019 03:16:36 +0000 (UTC)
Received: by mail-lj1-f193.google.com with SMTP id z7so2701493lji.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 10 Mar 2019 20:16:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=BuRtgLYcPut8T21op4ZuvdLF8emify5FQoquaWsqa2E=;
	b=hiV4hdJzU1AIsPivexyBBOpNpGYT/zwed7Bw8Yo0f6ou34WAOx2g4dOQj7HkchWkmk
	TzXkd2X+58oUclTjUlS+OOnOej5m2LMzvj3J4AmFOSEHGGYAV4t1Z61nM7h7sVawAJgx
	FDMDgTmmKjrrmr6WAgKtUcBL91pbE+HMrloaPi8encfek//mgAAlVMs7dUzjLIm1BcMO
	AduJP7qNZyuLKkP3qAi3oK+G4+xiq8xF7C+QMERvhvKGMhRK5kg3beK4C4iMrPU7Mkzn
	wqZzuWIHTH2FJjxKDCiD0mnfhqeHRuB+BnthlK1BY406ZL58ou7ml60Cm0KVj5sGsJh0
	Fd6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=BuRtgLYcPut8T21op4ZuvdLF8emify5FQoquaWsqa2E=;
	b=ixpxheIYvWTl68XspRdHa92b4UtqXlUN0COydjJYg4RFhhw+wg9W1R1JXpzJ7TCvJT
	nunW/XuJX4N6dH5l93pRd2NbFzV95Bw3NYrwpGAIWrHEg4YKdSQGH6hVxRV+cRJcr9NZ
	4tkHAjZGt7bLKiq0vF3D1IG9PyUdFW4UGmtVJ3hpIr8ORp40T8ZZdvJ0PMyKtJ/FF5De
	6MR5t9qaQKoqxEGjO49dsVh5mbt/G5WGg2pURXoFj0i0+SM2ZVVersAkWuB5ELjsl62J
	2BFG+AMbCoyMP+4Rw/PbD/vK22+u1xBiEBN3W+3CBeXLybgpegtr+Cd7O/A1wNkwRZSv
	0YBQ==
X-Gm-Message-State: APjAAAUgv+D9WzmBOr11+0kqtoaCRPOkU3kvEY8IHm4B8OYAa5sYQ6LP
	Gl7/9t72LsHWgS+TDpW2T8o7GdfYLp1O9DkBkiE=
X-Google-Smtp-Source: APXvYqzqVUlYa90I1o7D/Z6tVGdFkvMFUxv32sFUeEngZ9omnqpk8G9Vb4D2SrmGkfNKgsXN0m+E0Mf52vFbCO04sGE=
X-Received: by 2002:a2e:9a55:: with SMTP id k21mr15234467ljj.191.1552274196752;
	Sun, 10 Mar 2019 20:16:36 -0700 (PDT)
MIME-Version: 1.0
References: <20190311031230.21497-1-richard.purdie@linuxfoundation.org>
	<20190311031230.21497-4-richard.purdie@linuxfoundation.org>
In-Reply-To: <20190311031230.21497-4-richard.purdie@linuxfoundation.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Sun, 10 Mar 2019 23:16:19 -0400
Message-ID: <CADkTA4OmYCRtLMPHQRbJooso23g62GD01+yhC45=0hBUDadXGg@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
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
X-List-Received-Date: Mon, 11 Mar 2019 03:16:36 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 10, 2019 at 11:12 PM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> Testing stap on armv7 machines was failing due to intermixing of thumb/ar=
m
> instructions. Patch the kernel to always use the v7 march options since
> we know our gcc versions support it to avoid the failure and allow
> systemtap to work.

I'd rather just merge this into the kernel directly. I can do a quick
merge and bump
of the SRCREV. If you send the patch against linux-yocto, that makes it eas=
ier
for me to grab and integrate it, versus having to dig it out of here
(since my access
is pretty limited at the moment).

Bruce

>
> [YOCTO #13153]
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  ...0001-arm-Makefile-Fix-systemtap-4.19.patch | 60 +++++++++++++++++++
>  .../0001-arm-Makefile-Fix-systemtap.patch     | 60 +++++++++++++++++++
>  meta/recipes-kernel/linux/linux-yocto_4.19.bb |  3 +-
>  meta/recipes-kernel/linux/linux-yocto_5.0.bb  |  3 +-
>  4 files changed, 124 insertions(+), 2 deletions(-)
>  create mode 100644 meta/recipes-kernel/linux/linux-yocto/0001-arm-Makefi=
le-Fix-systemtap-4.19.patch
>  create mode 100644 meta/recipes-kernel/linux/linux-yocto/0001-arm-Makefi=
le-Fix-systemtap.patch
>
> diff --git a/meta/recipes-kernel/linux/linux-yocto/0001-arm-Makefile-Fix-=
systemtap-4.19.patch b/meta/recipes-kernel/linux/linux-yocto/0001-arm-Makef=
ile-Fix-systemtap-4.19.patch
> new file mode 100644
> index 00000000000..53bd53b276c
> --- /dev/null
> +++ b/meta/recipes-kernel/linux/linux-yocto/0001-arm-Makefile-Fix-systemt=
ap-4.19.patch
> @@ -0,0 +1,60 @@
> +From c2995494e311c113177db50ff140cebd94fd4011 Mon Sep 17 00:00:00 2001
> +From: Richard Purdie <richard.purdie@linuxfoundation.org>
> +Date: Sun, 10 Mar 2019 06:43:15 +0000
> +Subject: [PATCH] arm/Makefile: Fix systemtap
> +
> +Currently systemtap fails to operate correctly on armv7 systems such as =
beaglebone and
> +soon, qemuarm.
> +
> +
> +root@qemuarm:/usr/src/kernel# env -uARCH -uKBUILD_EXTMOD -uCROSS_COMPILE=
 -uKBUILD_IMAGE -uKCONFIG_CONFIG -uINSTALL_PATH -uLD_LIBRARY_PATH PATH=3D/u=
sr/bin:/bin:/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin ma=
ke -C /lib/modules/4.19.19-yocto-standard/build M=3D/tmp/staptcNU6M modules=
 CONFIG_DEBUG_INFO=3D CONFIG_STACK_VALIDATION=3D ARCH=3Darm stap_4321_src.i=
 --no-print-directory -j2 V=3D1
> +test -e include/generated/autoconf.h -a -e include/config/auto.conf || (=
               \
> +echo >&2;                                                      \
> +echo >&2 "  ERROR: Kernel configuration is invalid.";          \
> +echo >&2 "         include/generated/autoconf.h or include/config/auto.c=
onf are missing.";\
> +echo >&2 "         Run 'make oldconfig && make prepare' on kernel src to=
 fix it.";     \
> +echo >&2 ;                                                     \
> +/bin/false)
> +mkdir -p /tmp/staptcNU6M/.tmp_versions ; rm -f /tmp/staptcNU6M/.tmp_vers=
ions/*
> +make -f ./scripts/Makefile.build obj=3D/tmp/staptcNU6M
> +(cat /dev/null;   echo kernel//tmp/staptcNU6M/stap_4321.ko;) > /tmp/stap=
tcNU6M/modules.order
> +  gcc -Wp,-MD,/tmp/staptcNU6M/.stap_4321_src.o.d  -nostdinc -isystem /us=
r/lib/gcc/arm-poky-linux-gnueabi/8.3.0/include -I./arch/arm/include -I./arc=
h/arm/include/generated  -I./include -I./arch/arm/include/uapi -I./arch/arm=
/include/generated/uapi -I./include/uapi -I./include/generated/uapi -includ=
e ./include/linux/kconfig.h -include ./include/linux/compiler_types.h -D__K=
ERNEL__ -mlittle-endian -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs -f=
no-strict-aliasing -fno-common -fshort-wchar -Werror-implicit-function-decl=
aration -Wno-format-security -std=3Dgnu89 -fno-PIE -DCC_HAVE_ASM_GOTO -fno-=
dwarf2-cfi-asm -fno-omit-frame-pointer -mapcs -mno-sched-prolog -fno-ipa-sr=
a -mabi=3Daapcs-linux -mfpu=3Dvfp -funwind-tables -marm -Wa,-mno-warn-depre=
cated -D__LINUX_ARM_ARCH__=3D7 -march=3Darmv5t -Wa,-march=3Darmv7-a -msoft-=
float -Uarm -fno-delete-null-pointer-checks -Wno-frame-address -Wno-format-=
truncation -Wno-format-overflow -Wno-int-in-bool-context -Os -Wno-maybe-uni=
nitialized --param=3Dallow-store-data-races=3D0 -Wframe-larger-than=3D1024 =
-fstack-protector-strong -Wno-unused-but-set-variable -Wno-unused-const-var=
iable -fno-omit-frame-pointer -fno-optimize-sibling-calls -fno-var-tracking=
-assignments -pg -Wdeclaration-after-statement -Wno-pointer-sign -Wno-strin=
gop-truncation -fno-strict-overflow -fno-merge-all-constants -fmerge-consta=
nts -fno-stack-check -fconserve-stack -Werror=3Dimplicit-int -Werror=3Dstri=
ct-prototypes -Werror=3Ddate-time -Werror=3Dincompatible-pointer-types -Wer=
ror=3Ddesignated-init -fmacro-prefix-map=3D./=3D -Wno-packed-not-aligned -I=
include2/asm/mach-default -I/lib/modules/4.19.19-yocto-standard/build -incl=
ude /tmp/staptcNU6M/stapconf_4321.h -D "STP_NO_VELREL_CHECK" -freorder-bloc=
ks -fasynchronous-unwind-tables -Wframe-larger-than=3D512 -fno-ipa-icf -Wno=
-unused -Wno-tautological-compare -Werror -I/usr/share/systemtap/runtime  -=
DMODULE  -DKBUILD_BASENAME=3D'"stap_4321_src"' -DKBUILD_MODNAME=3D'"stap_43=
21"' -c -o /tmp/staptcNU6M/stap_4321_src.o /tmp/staptcNU6M/stap_4321_src.c
> +/tmp/ccaE9CMG.s: Assembler messages:
> +/tmp/ccaE9CMG.s:49: Error: selected processor does not support `dmb ish'=
 in ARM mode
> +/tmp/ccaE9CMG.s:52: Error: architectural extension `mp' is not allowed f=
or the current b
> +
> +(which was from running the stap command with -v -v -v -k and then being=
 able to run the command individually)
> +
> +Note that it says armv5t above.
> +
> +That comes from the code this patch changes
> +
> +root@qemuarm:/usr/src/kernel# gcc -march=3Darmv7-a /tmp/staptcNU6M/stap_=
4321_aux_0.c
> +cc1: error: -mfloat-abi=3Dhard: selected processor lacks an FPU
> +
> +which makes me wonder if cc-option fails unless -mfpu-vfp is on the comm=
andline too.
> +
> +Since we have a gcc which accepts the armv7-a arch, just remove the cc-o=
ption
> +wrapper unconditionally here.
> +
> +Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> +---
> + arch/arm/Makefile | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/arch/arm/Makefile b/arch/arm/Makefile
> +index ecb99f7ac613..8513ba79ea04 100644
> +--- a/arch/arm/Makefile
> ++++ b/arch/arm/Makefile
> +@@ -64,7 +64,7 @@ KBUILD_CFLAGS        +=3D $(call cc-option,-fno-ipa-sr=
a)
> + # macro, but instead defines a whole series of macros which makes
> + # testing for a specific architecture or later rather impossible.
> + arch-$(CONFIG_CPU_32v7M)      =3D-D__LINUX_ARM_ARCH__=3D7 -march=3Darmv=
7-m -Wa,-march=3Darmv7-m
> +-arch-$(CONFIG_CPU_32v7)               =3D-D__LINUX_ARM_ARCH__=3D7 $(cal=
l cc-option,-march=3Darmv7-a,-march=3Darmv5t -Wa$(comma)-march=3Darmv7-a)
> ++arch-$(CONFIG_CPU_32v7)               =3D-D__LINUX_ARM_ARCH__=3D7 -marc=
h=3Darmv7-a -Wa$(comma)-march=3Darmv7-a
> + arch-$(CONFIG_CPU_32v6)               =3D-D__LINUX_ARM_ARCH__=3D6 $(cal=
l cc-option,-march=3Darmv6,-march=3Darmv5t -Wa$(comma)-march=3Darmv6)
> + # Only override the compiler option if ARMv6. The ARMv6K extensions are
> + # always available in ARMv7
> +--
> +2.20.1
> +
> diff --git a/meta/recipes-kernel/linux/linux-yocto/0001-arm-Makefile-Fix-=
systemtap.patch b/meta/recipes-kernel/linux/linux-yocto/0001-arm-Makefile-F=
ix-systemtap.patch
> new file mode 100644
> index 00000000000..53bd53b276c
> --- /dev/null
> +++ b/meta/recipes-kernel/linux/linux-yocto/0001-arm-Makefile-Fix-systemt=
ap.patch
> @@ -0,0 +1,60 @@
> +From c2995494e311c113177db50ff140cebd94fd4011 Mon Sep 17 00:00:00 2001
> +From: Richard Purdie <richard.purdie@linuxfoundation.org>
> +Date: Sun, 10 Mar 2019 06:43:15 +0000
> +Subject: [PATCH] arm/Makefile: Fix systemtap
> +
> +Currently systemtap fails to operate correctly on armv7 systems such as =
beaglebone and
> +soon, qemuarm.
> +
> +
> +root@qemuarm:/usr/src/kernel# env -uARCH -uKBUILD_EXTMOD -uCROSS_COMPILE=
 -uKBUILD_IMAGE -uKCONFIG_CONFIG -uINSTALL_PATH -uLD_LIBRARY_PATH PATH=3D/u=
sr/bin:/bin:/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin ma=
ke -C /lib/modules/4.19.19-yocto-standard/build M=3D/tmp/staptcNU6M modules=
 CONFIG_DEBUG_INFO=3D CONFIG_STACK_VALIDATION=3D ARCH=3Darm stap_4321_src.i=
 --no-print-directory -j2 V=3D1
> +test -e include/generated/autoconf.h -a -e include/config/auto.conf || (=
               \
> +echo >&2;                                                      \
> +echo >&2 "  ERROR: Kernel configuration is invalid.";          \
> +echo >&2 "         include/generated/autoconf.h or include/config/auto.c=
onf are missing.";\
> +echo >&2 "         Run 'make oldconfig && make prepare' on kernel src to=
 fix it.";     \
> +echo >&2 ;                                                     \
> +/bin/false)
> +mkdir -p /tmp/staptcNU6M/.tmp_versions ; rm -f /tmp/staptcNU6M/.tmp_vers=
ions/*
> +make -f ./scripts/Makefile.build obj=3D/tmp/staptcNU6M
> +(cat /dev/null;   echo kernel//tmp/staptcNU6M/stap_4321.ko;) > /tmp/stap=
tcNU6M/modules.order
> +  gcc -Wp,-MD,/tmp/staptcNU6M/.stap_4321_src.o.d  -nostdinc -isystem /us=
r/lib/gcc/arm-poky-linux-gnueabi/8.3.0/include -I./arch/arm/include -I./arc=
h/arm/include/generated  -I./include -I./arch/arm/include/uapi -I./arch/arm=
/include/generated/uapi -I./include/uapi -I./include/generated/uapi -includ=
e ./include/linux/kconfig.h -include ./include/linux/compiler_types.h -D__K=
ERNEL__ -mlittle-endian -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs -f=
no-strict-aliasing -fno-common -fshort-wchar -Werror-implicit-function-decl=
aration -Wno-format-security -std=3Dgnu89 -fno-PIE -DCC_HAVE_ASM_GOTO -fno-=
dwarf2-cfi-asm -fno-omit-frame-pointer -mapcs -mno-sched-prolog -fno-ipa-sr=
a -mabi=3Daapcs-linux -mfpu=3Dvfp -funwind-tables -marm -Wa,-mno-warn-depre=
cated -D__LINUX_ARM_ARCH__=3D7 -march=3Darmv5t -Wa,-march=3Darmv7-a -msoft-=
float -Uarm -fno-delete-null-pointer-checks -Wno-frame-address -Wno-format-=
truncation -Wno-format-overflow -Wno-int-in-bool-context -Os -Wno-maybe-uni=
nitialized --param=3Dallow-store-data-races=3D0 -Wframe-larger-than=3D1024 =
-fstack-protector-strong -Wno-unused-but-set-variable -Wno-unused-const-var=
iable -fno-omit-frame-pointer -fno-optimize-sibling-calls -fno-var-tracking=
-assignments -pg -Wdeclaration-after-statement -Wno-pointer-sign -Wno-strin=
gop-truncation -fno-strict-overflow -fno-merge-all-constants -fmerge-consta=
nts -fno-stack-check -fconserve-stack -Werror=3Dimplicit-int -Werror=3Dstri=
ct-prototypes -Werror=3Ddate-time -Werror=3Dincompatible-pointer-types -Wer=
ror=3Ddesignated-init -fmacro-prefix-map=3D./=3D -Wno-packed-not-aligned -I=
include2/asm/mach-default -I/lib/modules/4.19.19-yocto-standard/build -incl=
ude /tmp/staptcNU6M/stapconf_4321.h -D "STP_NO_VELREL_CHECK" -freorder-bloc=
ks -fasynchronous-unwind-tables -Wframe-larger-than=3D512 -fno-ipa-icf -Wno=
-unused -Wno-tautological-compare -Werror -I/usr/share/systemtap/runtime  -=
DMODULE  -DKBUILD_BASENAME=3D'"stap_4321_src"' -DKBUILD_MODNAME=3D'"stap_43=
21"' -c -o /tmp/staptcNU6M/stap_4321_src.o /tmp/staptcNU6M/stap_4321_src.c
> +/tmp/ccaE9CMG.s: Assembler messages:
> +/tmp/ccaE9CMG.s:49: Error: selected processor does not support `dmb ish'=
 in ARM mode
> +/tmp/ccaE9CMG.s:52: Error: architectural extension `mp' is not allowed f=
or the current b
> +
> +(which was from running the stap command with -v -v -v -k and then being=
 able to run the command individually)
> +
> +Note that it says armv5t above.
> +
> +That comes from the code this patch changes
> +
> +root@qemuarm:/usr/src/kernel# gcc -march=3Darmv7-a /tmp/staptcNU6M/stap_=
4321_aux_0.c
> +cc1: error: -mfloat-abi=3Dhard: selected processor lacks an FPU
> +
> +which makes me wonder if cc-option fails unless -mfpu-vfp is on the comm=
andline too.
> +
> +Since we have a gcc which accepts the armv7-a arch, just remove the cc-o=
ption
> +wrapper unconditionally here.
> +
> +Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> +---
> + arch/arm/Makefile | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/arch/arm/Makefile b/arch/arm/Makefile
> +index ecb99f7ac613..8513ba79ea04 100644
> +--- a/arch/arm/Makefile
> ++++ b/arch/arm/Makefile
> +@@ -64,7 +64,7 @@ KBUILD_CFLAGS        +=3D $(call cc-option,-fno-ipa-sr=
a)
> + # macro, but instead defines a whole series of macros which makes
> + # testing for a specific architecture or later rather impossible.
> + arch-$(CONFIG_CPU_32v7M)      =3D-D__LINUX_ARM_ARCH__=3D7 -march=3Darmv=
7-m -Wa,-march=3Darmv7-m
> +-arch-$(CONFIG_CPU_32v7)               =3D-D__LINUX_ARM_ARCH__=3D7 $(cal=
l cc-option,-march=3Darmv7-a,-march=3Darmv5t -Wa$(comma)-march=3Darmv7-a)
> ++arch-$(CONFIG_CPU_32v7)               =3D-D__LINUX_ARM_ARCH__=3D7 -marc=
h=3Darmv7-a -Wa$(comma)-march=3Darmv7-a
> + arch-$(CONFIG_CPU_32v6)               =3D-D__LINUX_ARM_ARCH__=3D6 $(cal=
l cc-option,-march=3Darmv6,-march=3Darmv5t -Wa$(comma)-march=3Darmv6)
> + # Only override the compiler option if ARMv6. The ARMv6K extensions are
> + # always available in ARMv7
> +--
> +2.20.1
> +
> diff --git a/meta/recipes-kernel/linux/linux-yocto_4.19.bb b/meta/recipes=
-kernel/linux/linux-yocto_4.19.bb
> index 3ef26a12baa..aca9f15404e 100644
> --- a/meta/recipes-kernel/linux/linux-yocto_4.19.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto_4.19.bb
> @@ -22,7 +22,8 @@ SRCREV_machine ?=3D "11e0e616ed095bb8012e1b4a231254c965=
6a0193"
>  SRCREV_meta ?=3D "41fe45f7c5e69f6ec26c657fea16c459544042cf"
>
>  SRC_URI =3D "git://git.yoctoproject.org/linux-yocto.git;name=3Dmachine;b=
ranch=3D${KBRANCH}; \
> -           git://git.yoctoproject.org/yocto-kernel-cache;type=3Dkmeta;na=
me=3Dmeta;branch=3Dyocto-4.19;destsuffix=3D${KMETA}"
> +           git://git.yoctoproject.org/yocto-kernel-cache;type=3Dkmeta;na=
me=3Dmeta;branch=3Dyocto-4.19;destsuffix=3D${KMETA} \
> +           file://0001-arm-Makefile-Fix-systemtap-4.19.patch"
>
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dbbea815ee2795b2f4230826c0c6b8=
814"
>  LINUX_VERSION ?=3D "4.19.19"
> diff --git a/meta/recipes-kernel/linux/linux-yocto_5.0.bb b/meta/recipes-=
kernel/linux/linux-yocto_5.0.bb
> index ae6e80c0108..198fed43411 100644
> --- a/meta/recipes-kernel/linux/linux-yocto_5.0.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto_5.0.bb
> @@ -25,7 +25,8 @@ SRCREV_meta ?=3D "4faa4419884d2bbe65f637befd71a1e95629e=
aae"
>  # KMACHINE_qemuarm ?=3D "qemuarma15"
>
>  SRC_URI =3D "git://git.yoctoproject.org/linux-yocto.git;name=3Dmachine;b=
ranch=3D${KBRANCH}; \
> -           git://git.yoctoproject.org/yocto-kernel-cache;type=3Dkmeta;na=
me=3Dmeta;branch=3Dyocto-5.0;destsuffix=3D${KMETA}"
> +           git://git.yoctoproject.org/yocto-kernel-cache;type=3Dkmeta;na=
me=3Dmeta;branch=3Dyocto-5.0;destsuffix=3D${KMETA} \
> +           file://0001-arm-Makefile-Fix-systemtap.patch"
>
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dbbea815ee2795b2f4230826c0c6b8=
814"
>  LINUX_VERSION ?=3D "5.0"
> --
> 2.20.1
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

