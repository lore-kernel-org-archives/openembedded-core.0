Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com
	[209.85.160.169])
	by mail.openembedded.org (Postfix) with ESMTP id 026B07CE5A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Mar 2019 04:28:08 +0000 (UTC)
Received: by mail-qt1-f169.google.com with SMTP id b16so2564370qtt.2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 10 Mar 2019 21:28:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=c10kyDX6z0P9Ze6oYEK9XnI0D0aMCOIc9D//7a3rodo=;
	b=hS5I87igpskO4A+PxFOnKMdl1yXFkCrhbtpLrWoTgxl5pWwBfzcddjSAfYltiQI9h3
	e5BNAzxoiqcD5QAQJhP+QZMH5+3MSEw7mYFyuRG0Eq5V9KelxomhhtxQODd6yBfNmR6E
	DauGWeWqXDyJdnBf2dMLn/HOp4jjecYZtD+gNM9PYBQcjByR5uJ25JDWsxGOg9yHhaY4
	wSdnuOuxnizWM8BERHh3bKPYh56ai3PPiBVhdKQywv82BvFKW4cDK/yUNV2PK4m0/6A2
	57ex4clQ59yCLne42ko40wX46NTAU4J9Z04IOfTnU8BgzQSCFP3SwbaFL688RPMQejYh
	zHnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=c10kyDX6z0P9Ze6oYEK9XnI0D0aMCOIc9D//7a3rodo=;
	b=onFHERjgJ6l59m/HrD2pQadfg7OyQbyV3M5Ll5EjR78zY4RFgj7kL/+iXdUpMzBvVs
	fm4eWbpNlYgvffaSpITlhQNrG1UrsvoQXAXFLNFrWYhnRlhOsq9axaM72pKojtfOe1Rc
	31mVul7aFi80Jwneo81AI7vp2Gb9sKzMEGUcIkpyqRai6kIqWenjcZWqAq1E18f0qlCq
	PJ+HONzdIhirP4DqjxSlS8LRMA/OYpjTgEbPnOKY737Uw73mXofSshwBF+T7IkWL4AGw
	YJ0RyIDcF01LGBn4l+my6XKJAZXGW/5PK7oV+YKHdH3Q+HPBSHRyN13if1sch9odxvI5
	shvQ==
X-Gm-Message-State: APjAAAXUZqGozZMMvEkMTZVIZs8Md6PuSYKjyBmx0fJuz0leYQLQVm8z
	zgcAtgO+WhugrgrYDQF7JrhyQ6xzo1gTmK0ydTsvc2jc
X-Google-Smtp-Source: APXvYqyCZ+si9tTi/fHAK5LdJwXHwq68bdFPxGz9sV8pP9FwsnFrz2eKHvOcH1mDQzPhsLYhPwE1ZuzDJRrnJBCF8UI=
X-Received: by 2002:a0c:ba1d:: with SMTP id w29mr24550671qvf.228.1552278489695;
	Sun, 10 Mar 2019 21:28:09 -0700 (PDT)
MIME-Version: 1.0
References: <20190311031230.21497-1-richard.purdie@linuxfoundation.org>
	<20190311031230.21497-4-richard.purdie@linuxfoundation.org>
In-Reply-To: <20190311031230.21497-4-richard.purdie@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 10 Mar 2019 21:27:43 -0700
Message-ID: <CAMKF1sp9pjSGOgdv_+k-sqA-sghbxyixK3rb513aRCa5GEtiXA@mail.gmail.com>
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
X-List-Received-Date: Mon, 11 Mar 2019 04:28:09 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 10, 2019 at 8:13 PM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> Testing stap on armv7 machines was failing due to intermixing of thumb/ar=
m
> instructions. Patch the kernel to always use the v7 march options since
> we know our gcc versions support it to avoid the failure and allow
> systemtap to work.
>
> [YOCTO #13153]
>

please use the fix that Victor submitted upstream, that way we dont
need workaround.
http://lists.infradead.org/pipermail/linux-arm-kernel/2019-March/637809.htm=
l


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
nitialized --param=3Dallow-stor
>  e-data-races=3D0 -Wframe-larger-than=3D1024 -fstack-protector-strong -Wn=
o-unused-but-set-variable -Wno-unused-const-variable -fno-omit-frame-pointe=
r -fno-optimize-sibling-calls -fno-var-tracking-assignments -pg -Wdeclarati=
on-after-statement -Wno-pointer-sign -Wno-stringop-truncation -fno-strict-o=
verflow -fno-merge-all-constants -fmerge-constants -fno-stack-check -fconse=
rve-stack -Werror=3Dimplicit-int -Werror=3Dstrict-prototypes -Werror=3Ddate=
-time -Werror=3Dincompatible-pointer-types -Werror=3Ddesignated-init -fmacr=
o-prefix-map=3D./=3D -Wno-packed-not-aligned -Iinclude2/asm/mach-default -I=
/lib/modules/4.19.19-yocto-standard/build -include /tmp/staptcNU6M/stapconf=
_4321.h -D "STP_NO_VELREL_CHECK" -freorder-blocks -fasynchronous-unwind-tab=
les -Wframe-larger-than=3D512 -fno-ipa-icf -Wno-unused -Wno-tautological-co=
mpare -Werror -I/usr/share/systemtap/runtime  -DMODULE  -DKBUILD_BASENAME=
=3D'"stap_4321_src"' -DKBUILD_MODNAME=3D'"stap_4321"' -c -o /tmp/staptcNU6M=
/stap_4321_src.o /tmp/staptcNU6M/stap_4321_
>  src.c
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
nitialized --param=3Dallow-stor
>  e-data-races=3D0 -Wframe-larger-than=3D1024 -fstack-protector-strong -Wn=
o-unused-but-set-variable -Wno-unused-const-variable -fno-omit-frame-pointe=
r -fno-optimize-sibling-calls -fno-var-tracking-assignments -pg -Wdeclarati=
on-after-statement -Wno-pointer-sign -Wno-stringop-truncation -fno-strict-o=
verflow -fno-merge-all-constants -fmerge-constants -fno-stack-check -fconse=
rve-stack -Werror=3Dimplicit-int -Werror=3Dstrict-prototypes -Werror=3Ddate=
-time -Werror=3Dincompatible-pointer-types -Werror=3Ddesignated-init -fmacr=
o-prefix-map=3D./=3D -Wno-packed-not-aligned -Iinclude2/asm/mach-default -I=
/lib/modules/4.19.19-yocto-standard/build -include /tmp/staptcNU6M/stapconf=
_4321.h -D "STP_NO_VELREL_CHECK" -freorder-blocks -fasynchronous-unwind-tab=
les -Wframe-larger-than=3D512 -fno-ipa-icf -Wno-unused -Wno-tautological-co=
mpare -Werror -I/usr/share/systemtap/runtime  -DMODULE  -DKBUILD_BASENAME=
=3D'"stap_4321_src"' -DKBUILD_MODNAME=3D'"stap_4321"' -c -o /tmp/staptcNU6M=
/stap_4321_src.o /tmp/staptcNU6M/stap_4321_
>  src.c
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
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

