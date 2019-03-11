Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com
	[209.85.215.179])
	by mail.openembedded.org (Postfix) with ESMTP id 11941607A4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Mar 2019 03:12:35 +0000 (UTC)
Received: by mail-pg1-f179.google.com with SMTP id l11so2895230pgq.10
	for <openembedded-core@lists.openembedded.org>;
	Sun, 10 Mar 2019 20:12:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=aVsIKQYd2CFeh1YIO2JdY67huB/QRtCTun7N8Kvx5Qc=;
	b=G5wLJ8CxCsyEEc8r5ompuUyYffTE53SgsEa9fO6AFsaSEz4h1mSwgDSkmr94o15TyU
	D3Sijomjk0yaRuhv8P0Dl2hG3/f0nnAq6iudIVtfIhxNNSY5a1uTO81wWCoWrDFwLxgC
	C05nnq9304JThJoxFEMF6FmGc9lcBuGTeQAXQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=aVsIKQYd2CFeh1YIO2JdY67huB/QRtCTun7N8Kvx5Qc=;
	b=W+nl1MbuxevgzmVX8/S+aAhcVArklgbfCJBbPXRbQz7pdXmDOpElS603O6kuXC6R/e
	04HhEd5iXsQAzrS6Qz/u9l8TweKOJkF6JxwRTXhhOlfxGIhXZJ43px1OgfS597qnul3Z
	VMO9RCYvonFoxeWajRM/Bd9kiilN6CcK1BHixX6kUbmSdmAUNjDwkJ+owx3QreqQcUVX
	sGSHvagI2+0o/DbHKXdJBk8Emvc4Nmgq/XlbxusiRd8raKnNocjgoBrkDgGzaWHsCmL/
	M0c6TEWPnYqa1TtcK5OJyys3Unjl/UA+HRkgU5WpX7naEtvfZpNygMBPfIRYriV3Ftx4
	Wesw==
X-Gm-Message-State: APjAAAXo0ByhNlU5PjqQNfdBCd544fvODh+AF2sfBohFz7CTzvPWbFvA
	5zBeB9oXvIeySoNJD5B3lp2Hm+XAvDRZvg==
X-Google-Smtp-Source: APXvYqw4yuLOxZ5WU1PqgW1HqTRzRe88ObGZme2OzaaJCG0KynF29ZNYBEDw3u0rD9AG0oXpqpfPWQ==
X-Received: by 2002:a63:4a11:: with SMTP id x17mr28293639pga.376.1552273956354;
	Sun, 10 Mar 2019 20:12:36 -0700 (PDT)
Received: from hex.int.rpsys.net ([12.27.65.221])
	by smtp.gmail.com with ESMTPSA id l2sm6166861pgj.64.2019.03.10.20.12.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 10 Mar 2019 20:12:35 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Mar 2019 03:12:29 +0000
Message-Id: <20190311031230.21497-4-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190311031230.21497-1-richard.purdie@linuxfoundation.org>
References: <20190311031230.21497-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Subject: [PATCH 4/5] linux-yocto: Fix systemtap issue on armv7
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
X-List-Received-Date: Mon, 11 Mar 2019 03:12:36 -0000
Content-Transfer-Encoding: quoted-printable

Testing stap on armv7 machines was failing due to intermixing of thumb/arm
instructions. Patch the kernel to always use the v7 march options since
we know our gcc versions support it to avoid the failure and allow
systemtap to work.

[YOCTO #13153]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...0001-arm-Makefile-Fix-systemtap-4.19.patch | 60 +++++++++++++++++++
 .../0001-arm-Makefile-Fix-systemtap.patch     | 60 +++++++++++++++++++
 meta/recipes-kernel/linux/linux-yocto_4.19.bb |  3 +-
 meta/recipes-kernel/linux/linux-yocto_5.0.bb  |  3 +-
 4 files changed, 124 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-kernel/linux/linux-yocto/0001-arm-Makefile=
-Fix-systemtap-4.19.patch
 create mode 100644 meta/recipes-kernel/linux/linux-yocto/0001-arm-Makefile=
-Fix-systemtap.patch

diff --git a/meta/recipes-kernel/linux/linux-yocto/0001-arm-Makefile-Fix-sy=
stemtap-4.19.patch b/meta/recipes-kernel/linux/linux-yocto/0001-arm-Makefil=
e-Fix-systemtap-4.19.patch
new file mode 100644
index 00000000000..53bd53b276c
--- /dev/null
+++ b/meta/recipes-kernel/linux/linux-yocto/0001-arm-Makefile-Fix-systemtap=
-4.19.patch
@@ -0,0 +1,60 @@
+From c2995494e311c113177db50ff140cebd94fd4011 Mon Sep 17 00:00:00 2001
+From: Richard Purdie <richard.purdie@linuxfoundation.org>
+Date: Sun, 10 Mar 2019 06:43:15 +0000
+Subject: [PATCH] arm/Makefile: Fix systemtap
+
+Currently systemtap fails to operate correctly on armv7 systems such as be=
aglebone and
+soon, qemuarm.
+
+
+root@qemuarm:/usr/src/kernel# env -uARCH -uKBUILD_EXTMOD -uCROSS_COMPILE -=
uKBUILD_IMAGE -uKCONFIG_CONFIG -uINSTALL_PATH -uLD_LIBRARY_PATH PATH=3D/usr=
/bin:/bin:/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin make=
 -C /lib/modules/4.19.19-yocto-standard/build M=3D/tmp/staptcNU6M modules C=
ONFIG_DEBUG_INFO=3D CONFIG_STACK_VALIDATION=3D ARCH=3Darm stap_4321_src.i -=
-no-print-directory -j2 V=3D1
+test -e include/generated/autoconf.h -a -e include/config/auto.conf || (		\
+echo >&2;							\
+echo >&2 "  ERROR: Kernel configuration is invalid.";		\
+echo >&2 "         include/generated/autoconf.h or include/config/auto.con=
f are missing.";\
+echo >&2 "         Run 'make oldconfig && make prepare' on kernel src to f=
ix it.";	\
+echo >&2 ;							\
+/bin/false)
+mkdir -p /tmp/staptcNU6M/.tmp_versions ; rm -f /tmp/staptcNU6M/.tmp_versio=
ns/*
+make -f ./scripts/Makefile.build obj=3D/tmp/staptcNU6M
+(cat /dev/null;   echo kernel//tmp/staptcNU6M/stap_4321.ko;) > /tmp/staptc=
NU6M/modules.order
+  gcc -Wp,-MD,/tmp/staptcNU6M/.stap_4321_src.o.d  -nostdinc -isystem /usr/=
lib/gcc/arm-poky-linux-gnueabi/8.3.0/include -I./arch/arm/include -I./arch/=
arm/include/generated  -I./include -I./arch/arm/include/uapi -I./arch/arm/i=
nclude/generated/uapi -I./include/uapi -I./include/generated/uapi -include =
./include/linux/kconfig.h -include ./include/linux/compiler_types.h -D__KER=
NEL__ -mlittle-endian -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs -fno=
-strict-aliasing -fno-common -fshort-wchar -Werror-implicit-function-declar=
ation -Wno-format-security -std=3Dgnu89 -fno-PIE -DCC_HAVE_ASM_GOTO -fno-dw=
arf2-cfi-asm -fno-omit-frame-pointer -mapcs -mno-sched-prolog -fno-ipa-sra =
-mabi=3Daapcs-linux -mfpu=3Dvfp -funwind-tables -marm -Wa,-mno-warn-depreca=
ted -D__LINUX_ARM_ARCH__=3D7 -march=3Darmv5t -Wa,-march=3Darmv7-a -msoft-fl=
oat -Uarm -fno-delete-null-pointer-checks -Wno-frame-address -Wno-format-tr=
uncation -Wno-format-overflow -Wno-int-in-bool-context -Os -Wno-maybe-unini=
tialized --param=3Dallow-store-data-races=3D0 -Wframe-larger-than=3D1024 -f=
stack-protector-strong -Wno-unused-but-set-variable -Wno-unused-const-varia=
ble -fno-omit-frame-pointer -fno-optimize-sibling-calls -fno-var-tracking-a=
ssignments -pg -Wdeclaration-after-statement -Wno-pointer-sign -Wno-stringo=
p-truncation -fno-strict-overflow -fno-merge-all-constants -fmerge-constant=
s -fno-stack-check -fconserve-stack -Werror=3Dimplicit-int -Werror=3Dstrict=
-prototypes -Werror=3Ddate-time -Werror=3Dincompatible-pointer-types -Werro=
r=3Ddesignated-init -fmacro-prefix-map=3D./=3D -Wno-packed-not-aligned -Iin=
clude2/asm/mach-default -I/lib/modules/4.19.19-yocto-standard/build -includ=
e /tmp/staptcNU6M/stapconf_4321.h -D "STP_NO_VELREL_CHECK" -freorder-blocks=
 -fasynchronous-unwind-tables -Wframe-larger-than=3D512 -fno-ipa-icf -Wno-u=
nused -Wno-tautological-compare -Werror -I/usr/share/systemtap/runtime  -DM=
ODULE  -DKBUILD_BASENAME=3D'"stap_4321_src"' -DKBUILD_MODNAME=3D'"stap_4321=
"' -c -o /tmp/staptcNU6M/stap_4321_src.o /tmp/staptcNU6M/stap_4321_src.c
+/tmp/ccaE9CMG.s: Assembler messages:
+/tmp/ccaE9CMG.s:49: Error: selected processor does not support `dmb ish' i=
n ARM mode
+/tmp/ccaE9CMG.s:52: Error: architectural extension `mp' is not allowed for=
 the current b
+
+(which was from running the stap command with -v -v -v -k and then being a=
ble to run the command individually)
+
+Note that it says armv5t above.
+
+That comes from the code this patch changes
+
+root@qemuarm:/usr/src/kernel# gcc -march=3Darmv7-a /tmp/staptcNU6M/stap_43=
21_aux_0.c
+cc1: error: -mfloat-abi=3Dhard: selected processor lacks an FPU
+
+which makes me wonder if cc-option fails unless -mfpu-vfp is on the comman=
dline too.
+
+Since we have a gcc which accepts the armv7-a arch, just remove the cc-opt=
ion
+wrapper unconditionally here.
+
+Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
+---
+ arch/arm/Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/arch/arm/Makefile b/arch/arm/Makefile
+index ecb99f7ac613..8513ba79ea04 100644
+--- a/arch/arm/Makefile
++++ b/arch/arm/Makefile
+@@ -64,7 +64,7 @@ KBUILD_CFLAGS	+=3D $(call cc-option,-fno-ipa-sra)
+ # macro, but instead defines a whole series of macros which makes
+ # testing for a specific architecture or later rather impossible.
+ arch-$(CONFIG_CPU_32v7M)	=3D-D__LINUX_ARM_ARCH__=3D7 -march=3Darmv7-m -Wa=
,-march=3Darmv7-m
+-arch-$(CONFIG_CPU_32v7)		=3D-D__LINUX_ARM_ARCH__=3D7 $(call cc-option,-ma=
rch=3Darmv7-a,-march=3Darmv5t -Wa$(comma)-march=3Darmv7-a)
++arch-$(CONFIG_CPU_32v7)		=3D-D__LINUX_ARM_ARCH__=3D7 -march=3Darmv7-a -Wa=
$(comma)-march=3Darmv7-a
+ arch-$(CONFIG_CPU_32v6)		=3D-D__LINUX_ARM_ARCH__=3D6 $(call cc-option,-ma=
rch=3Darmv6,-march=3Darmv5t -Wa$(comma)-march=3Darmv6)
+ # Only override the compiler option if ARMv6. The ARMv6K extensions are
+ # always available in ARMv7
+--=20
+2.20.1
+
diff --git a/meta/recipes-kernel/linux/linux-yocto/0001-arm-Makefile-Fix-sy=
stemtap.patch b/meta/recipes-kernel/linux/linux-yocto/0001-arm-Makefile-Fix=
-systemtap.patch
new file mode 100644
index 00000000000..53bd53b276c
--- /dev/null
+++ b/meta/recipes-kernel/linux/linux-yocto/0001-arm-Makefile-Fix-systemtap=
.patch
@@ -0,0 +1,60 @@
+From c2995494e311c113177db50ff140cebd94fd4011 Mon Sep 17 00:00:00 2001
+From: Richard Purdie <richard.purdie@linuxfoundation.org>
+Date: Sun, 10 Mar 2019 06:43:15 +0000
+Subject: [PATCH] arm/Makefile: Fix systemtap
+
+Currently systemtap fails to operate correctly on armv7 systems such as be=
aglebone and
+soon, qemuarm.
+
+
+root@qemuarm:/usr/src/kernel# env -uARCH -uKBUILD_EXTMOD -uCROSS_COMPILE -=
uKBUILD_IMAGE -uKCONFIG_CONFIG -uINSTALL_PATH -uLD_LIBRARY_PATH PATH=3D/usr=
/bin:/bin:/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin make=
 -C /lib/modules/4.19.19-yocto-standard/build M=3D/tmp/staptcNU6M modules C=
ONFIG_DEBUG_INFO=3D CONFIG_STACK_VALIDATION=3D ARCH=3Darm stap_4321_src.i -=
-no-print-directory -j2 V=3D1
+test -e include/generated/autoconf.h -a -e include/config/auto.conf || (		\
+echo >&2;							\
+echo >&2 "  ERROR: Kernel configuration is invalid.";		\
+echo >&2 "         include/generated/autoconf.h or include/config/auto.con=
f are missing.";\
+echo >&2 "         Run 'make oldconfig && make prepare' on kernel src to f=
ix it.";	\
+echo >&2 ;							\
+/bin/false)
+mkdir -p /tmp/staptcNU6M/.tmp_versions ; rm -f /tmp/staptcNU6M/.tmp_versio=
ns/*
+make -f ./scripts/Makefile.build obj=3D/tmp/staptcNU6M
+(cat /dev/null;   echo kernel//tmp/staptcNU6M/stap_4321.ko;) > /tmp/staptc=
NU6M/modules.order
+  gcc -Wp,-MD,/tmp/staptcNU6M/.stap_4321_src.o.d  -nostdinc -isystem /usr/=
lib/gcc/arm-poky-linux-gnueabi/8.3.0/include -I./arch/arm/include -I./arch/=
arm/include/generated  -I./include -I./arch/arm/include/uapi -I./arch/arm/i=
nclude/generated/uapi -I./include/uapi -I./include/generated/uapi -include =
./include/linux/kconfig.h -include ./include/linux/compiler_types.h -D__KER=
NEL__ -mlittle-endian -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs -fno=
-strict-aliasing -fno-common -fshort-wchar -Werror-implicit-function-declar=
ation -Wno-format-security -std=3Dgnu89 -fno-PIE -DCC_HAVE_ASM_GOTO -fno-dw=
arf2-cfi-asm -fno-omit-frame-pointer -mapcs -mno-sched-prolog -fno-ipa-sra =
-mabi=3Daapcs-linux -mfpu=3Dvfp -funwind-tables -marm -Wa,-mno-warn-depreca=
ted -D__LINUX_ARM_ARCH__=3D7 -march=3Darmv5t -Wa,-march=3Darmv7-a -msoft-fl=
oat -Uarm -fno-delete-null-pointer-checks -Wno-frame-address -Wno-format-tr=
uncation -Wno-format-overflow -Wno-int-in-bool-context -Os -Wno-maybe-unini=
tialized --param=3Dallow-store-data-races=3D0 -Wframe-larger-than=3D1024 -f=
stack-protector-strong -Wno-unused-but-set-variable -Wno-unused-const-varia=
ble -fno-omit-frame-pointer -fno-optimize-sibling-calls -fno-var-tracking-a=
ssignments -pg -Wdeclaration-after-statement -Wno-pointer-sign -Wno-stringo=
p-truncation -fno-strict-overflow -fno-merge-all-constants -fmerge-constant=
s -fno-stack-check -fconserve-stack -Werror=3Dimplicit-int -Werror=3Dstrict=
-prototypes -Werror=3Ddate-time -Werror=3Dincompatible-pointer-types -Werro=
r=3Ddesignated-init -fmacro-prefix-map=3D./=3D -Wno-packed-not-aligned -Iin=
clude2/asm/mach-default -I/lib/modules/4.19.19-yocto-standard/build -includ=
e /tmp/staptcNU6M/stapconf_4321.h -D "STP_NO_VELREL_CHECK" -freorder-blocks=
 -fasynchronous-unwind-tables -Wframe-larger-than=3D512 -fno-ipa-icf -Wno-u=
nused -Wno-tautological-compare -Werror -I/usr/share/systemtap/runtime  -DM=
ODULE  -DKBUILD_BASENAME=3D'"stap_4321_src"' -DKBUILD_MODNAME=3D'"stap_4321=
"' -c -o /tmp/staptcNU6M/stap_4321_src.o /tmp/staptcNU6M/stap_4321_src.c
+/tmp/ccaE9CMG.s: Assembler messages:
+/tmp/ccaE9CMG.s:49: Error: selected processor does not support `dmb ish' i=
n ARM mode
+/tmp/ccaE9CMG.s:52: Error: architectural extension `mp' is not allowed for=
 the current b
+
+(which was from running the stap command with -v -v -v -k and then being a=
ble to run the command individually)
+
+Note that it says armv5t above.
+
+That comes from the code this patch changes
+
+root@qemuarm:/usr/src/kernel# gcc -march=3Darmv7-a /tmp/staptcNU6M/stap_43=
21_aux_0.c
+cc1: error: -mfloat-abi=3Dhard: selected processor lacks an FPU
+
+which makes me wonder if cc-option fails unless -mfpu-vfp is on the comman=
dline too.
+
+Since we have a gcc which accepts the armv7-a arch, just remove the cc-opt=
ion
+wrapper unconditionally here.
+
+Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
+---
+ arch/arm/Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/arch/arm/Makefile b/arch/arm/Makefile
+index ecb99f7ac613..8513ba79ea04 100644
+--- a/arch/arm/Makefile
++++ b/arch/arm/Makefile
+@@ -64,7 +64,7 @@ KBUILD_CFLAGS	+=3D $(call cc-option,-fno-ipa-sra)
+ # macro, but instead defines a whole series of macros which makes
+ # testing for a specific architecture or later rather impossible.
+ arch-$(CONFIG_CPU_32v7M)	=3D-D__LINUX_ARM_ARCH__=3D7 -march=3Darmv7-m -Wa=
,-march=3Darmv7-m
+-arch-$(CONFIG_CPU_32v7)		=3D-D__LINUX_ARM_ARCH__=3D7 $(call cc-option,-ma=
rch=3Darmv7-a,-march=3Darmv5t -Wa$(comma)-march=3Darmv7-a)
++arch-$(CONFIG_CPU_32v7)		=3D-D__LINUX_ARM_ARCH__=3D7 -march=3Darmv7-a -Wa=
$(comma)-march=3Darmv7-a
+ arch-$(CONFIG_CPU_32v6)		=3D-D__LINUX_ARM_ARCH__=3D6 $(call cc-option,-ma=
rch=3Darmv6,-march=3Darmv5t -Wa$(comma)-march=3Darmv6)
+ # Only override the compiler option if ARMv6. The ARMv6K extensions are
+ # always available in ARMv7
+--=20
+2.20.1
+
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.19.bb b/meta/recipes-k=
ernel/linux/linux-yocto_4.19.bb
index 3ef26a12baa..aca9f15404e 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.19.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.19.bb
@@ -22,7 +22,8 @@ SRCREV_machine ?=3D "11e0e616ed095bb8012e1b4a231254c9656a=
0193"
 SRCREV_meta ?=3D "41fe45f7c5e69f6ec26c657fea16c459544042cf"
=20
 SRC_URI =3D "git://git.yoctoproject.org/linux-yocto.git;name=3Dmachine;bra=
nch=3D${KBRANCH}; \
-           git://git.yoctoproject.org/yocto-kernel-cache;type=3Dkmeta;name=
=3Dmeta;branch=3Dyocto-4.19;destsuffix=3D${KMETA}"
+           git://git.yoctoproject.org/yocto-kernel-cache;type=3Dkmeta;name=
=3Dmeta;branch=3Dyocto-4.19;destsuffix=3D${KMETA} \
+           file://0001-arm-Makefile-Fix-systemtap-4.19.patch"
=20
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dbbea815ee2795b2f4230826c0c6b881=
4"
 LINUX_VERSION ?=3D "4.19.19"
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.0.bb b/meta/recipes-ke=
rnel/linux/linux-yocto_5.0.bb
index ae6e80c0108..198fed43411 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.0.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.0.bb
@@ -25,7 +25,8 @@ SRCREV_meta ?=3D "4faa4419884d2bbe65f637befd71a1e95629eaa=
e"
 # KMACHINE_qemuarm ?=3D "qemuarma15"
=20
 SRC_URI =3D "git://git.yoctoproject.org/linux-yocto.git;name=3Dmachine;bra=
nch=3D${KBRANCH}; \
-           git://git.yoctoproject.org/yocto-kernel-cache;type=3Dkmeta;name=
=3Dmeta;branch=3Dyocto-5.0;destsuffix=3D${KMETA}"
+           git://git.yoctoproject.org/yocto-kernel-cache;type=3Dkmeta;name=
=3Dmeta;branch=3Dyocto-5.0;destsuffix=3D${KMETA} \
+           file://0001-arm-Makefile-Fix-systemtap.patch"
=20
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dbbea815ee2795b2f4230826c0c6b881=
4"
 LINUX_VERSION ?=3D "5.0"
--=20
2.20.1


