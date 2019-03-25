Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-it1-f175.google.com (mail-it1-f175.google.com
	[209.85.166.175])
	by mail.openembedded.org (Postfix) with ESMTP id BF7817D00B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Mar 2019 03:12:02 +0000 (UTC)
Received: by mail-it1-f175.google.com with SMTP id m137so11874669ita.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 24 Mar 2019 20:12:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=I5Hq1LgaJn6WkcMlviyATQO+HOhmpPIb8udAFWshdpU=;
	b=Jb0NT0lz9vMXbIMhbJ73X0v3jsuYB9aoCPfZk0mNIgQVYbIrUzdcUhmwY/8rGKUS9L
	mkMa9uVWRNzNJfCDLLjPhunHXweoxv0y2MaeqJ3Lj9e+Y6H3DxI3qfllqP7QUajvnxbM
	uzSF574tlXhRaKVQkA4G7ck9LLCLzDHSoe9X2m+VBKESyT7v35UGqagalqFnmkgeX4sI
	CnHsjQgAjlmu9C+9sS3ndvH8bMl1X45RFH9Z5iLbMSNWoiL24S3FP2QM1QFWoUccLmjp
	kzz+uaNOqROC4w2fYr56EDl8BXRhlmqYAey5eEQQhfYrQvdH2+jcdKMks0Bippl+YHvc
	+QGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=I5Hq1LgaJn6WkcMlviyATQO+HOhmpPIb8udAFWshdpU=;
	b=OuU5QSkGQRc/atgH/mtpvbdske31m2m1+OJ5gmSKpx90Sh/GlIUsGgtZ4QnHo3gV+4
	srEp/KxdV0aarNlqqROuFgrmdkV6HtxH4sd3zdsBriG3a1t+Asg+L4mtQz79K4/t/ONL
	Exg72oZamDAYR5qelo5Z0yQfiRrhbcv2MM34nykxzQDt9e2TTJ5WWVl7lUhjCRw0gOK4
	Y8/yWjZ/tot0ObRLOGIuN0rNGc1dGgFxMtyR8G5B9UOpGmHZLJ0ieQxyIjm0xGlNdbSK
	p3NC1oXp0+HA/FZXkNTTUqi7PUSbJCxjeOjYucu/dFpbjc+txOPOTLM0MKQXndyFNpIf
	g5KA==
X-Gm-Message-State: APjAAAU+AePnhM1w8KF6XmrDexMJuFvzqLe3UV8mAap945dAzinQDzSb
	tXDtKdF8AbLC9PrePsT/6Vc=
X-Google-Smtp-Source: APXvYqwcyEKVdlIU2OfUxiw1GgLGtwvEVrc9Uw/Qt+SeYN4qB6zymXIr2izMo2kvUxHQp2TLPP9zHA==
X-Received: by 2002:a24:ac6e:: with SMTP id m46mr10480868iti.49.1553483523600; 
	Sun, 24 Mar 2019 20:12:03 -0700 (PDT)
Received: from localhost.localdomain
	(CPEe8de27b71faa-CM64777d5e8820.cpe.net.cable.rogers.com.
	[174.116.254.195])
	by smtp.gmail.com with ESMTPSA id l8sm5443416itl.26.2019.03.24.20.12.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 24 Mar 2019 20:12:02 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Date: Sun, 24 Mar 2019 23:11:52 -0400
Message-Id: <c6cf9c71087f214c04f91523375a8fb9aacceab6.1553483380.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1553483380.git.bruce.ashfield@gmail.com>
References: <cover.1553483380.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/8] linux-yocto/4.19: integrate arm systemtap fix
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
X-List-Received-Date: Mon, 25 Mar 2019 03:12:02 -0000
Content-Transfer-Encoding: quoted-printable

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Richard had pushed an explicit patch to fix systemtap for arm
on the 4.19 kernel in time for M3.

The patch has now been integrated into the repo itself and can
be dropped from the recipe.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_4.19.bb              |  2 +-
 .../linux/linux-yocto-tiny_4.19.bb            |  4 +-
 ...0001-arm-Makefile-Fix-systemtap-4.19.patch | 62 -------------------
 meta/recipes-kernel/linux/linux-yocto_4.19.bb | 18 +++---
 4 files changed, 12 insertions(+), 74 deletions(-)
 delete mode 100644 meta/recipes-kernel/linux/linux-yocto/0001-arm-Makefile=
-Fix-systemtap-4.19.patch

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb b/meta/recipe=
s-kernel/linux/linux-yocto-rt_4.19.bb
index 979ffcdddc..0f3a498dcc 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb
@@ -11,7 +11,7 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel t=
o linux-yocto-rt to enable it")
 }
=20
-SRCREV_machine ?=3D "3059029718900250904b9f587e37ba22fb949ea6"
+SRCREV_machine ?=3D "6a02e73544953583e575a0f6c8797b6f4eb02fb7"
 SRCREV_meta ?=3D "b173a1b0a218f2bebc28251ef08ee592652b6bc0"
=20
 SRC_URI =3D "git://git.yoctoproject.org/linux-yocto.git;branch=3D${KBRANCH=
};name=3Dmachine \
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.19.bb b/meta/reci=
pes-kernel/linux/linux-yocto-tiny_4.19.bb
index 0129d6a6e1..3f54f4f2d8 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.19.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.19.bb
@@ -15,8 +15,8 @@ DEPENDS +=3D "openssl-native util-linux-native"
 KMETA =3D "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL =3D "2"
=20
-SRCREV_machine_qemuarm ?=3D "6cc861e796ab19a6827cf9996e7755f1875d553e"
-SRCREV_machine ?=3D "11e0e616ed095bb8012e1b4a231254c9656a0193"
+SRCREV_machine_qemuarm ?=3D "94da18b1810c993f211e906a146adc69fbbd6304"
+SRCREV_machine ?=3D "148322096f4147947955fa83c9863eed4ac23897"
 SRCREV_meta ?=3D "b173a1b0a218f2bebc28251ef08ee592652b6bc0"
=20
 PV =3D "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto/0001-arm-Makefile-Fix-sy=
stemtap-4.19.patch b/meta/recipes-kernel/linux/linux-yocto/0001-arm-Makefil=
e-Fix-systemtap-4.19.patch
deleted file mode 100644
index 0a84b13b59..0000000000
--- a/meta/recipes-kernel/linux/linux-yocto/0001-arm-Makefile-Fix-systemtap=
-4.19.patch
+++ /dev/null
@@ -1,62 +0,0 @@
-From c2995494e311c113177db50ff140cebd94fd4011 Mon Sep 17 00:00:00 2001
-From: Richard Purdie <richard.purdie@linuxfoundation.org>
-Date: Sun, 10 Mar 2019 06:43:15 +0000
-Subject: [PATCH] arm/Makefile: Fix systemtap
-
-Currently systemtap fails to operate correctly on armv7 systems such as be=
aglebone and
-soon, qemuarm.
-
-
-root@qemuarm:/usr/src/kernel# env -uARCH -uKBUILD_EXTMOD -uCROSS_COMPILE -=
uKBUILD_IMAGE -uKCONFIG_CONFIG -uINSTALL_PATH -uLD_LIBRARY_PATH PATH=3D/usr=
/bin:/bin:/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin make=
 -C /lib/modules/4.19.19-yocto-standard/build M=3D/tmp/staptcNU6M modules C=
ONFIG_DEBUG_INFO=3D CONFIG_STACK_VALIDATION=3D ARCH=3Darm stap_4321_src.i -=
-no-print-directory -j2 V=3D1
-test -e include/generated/autoconf.h -a -e include/config/auto.conf || (		\
-echo >&2;							\
-echo >&2 "  ERROR: Kernel configuration is invalid.";		\
-echo >&2 "         include/generated/autoconf.h or include/config/auto.con=
f are missing.";\
-echo >&2 "         Run 'make oldconfig && make prepare' on kernel src to f=
ix it.";	\
-echo >&2 ;							\
-/bin/false)
-mkdir -p /tmp/staptcNU6M/.tmp_versions ; rm -f /tmp/staptcNU6M/.tmp_versio=
ns/*
-make -f ./scripts/Makefile.build obj=3D/tmp/staptcNU6M
-(cat /dev/null;   echo kernel//tmp/staptcNU6M/stap_4321.ko;) > /tmp/staptc=
NU6M/modules.order
-  gcc -Wp,-MD,/tmp/staptcNU6M/.stap_4321_src.o.d  -nostdinc -isystem /usr/=
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
-/tmp/ccaE9CMG.s: Assembler messages:
-/tmp/ccaE9CMG.s:49: Error: selected processor does not support `dmb ish' i=
n ARM mode
-/tmp/ccaE9CMG.s:52: Error: architectural extension `mp' is not allowed for=
 the current b
-
-(which was from running the stap command with -v -v -v -k and then being a=
ble to run the command individually)
-
-Note that it says armv5t above.
-
-That comes from the code this patch changes
-
-root@qemuarm:/usr/src/kernel# gcc -march=3Darmv7-a /tmp/staptcNU6M/stap_43=
21_aux_0.c
-cc1: error: -mfloat-abi=3Dhard: selected processor lacks an FPU
-
-which makes me wonder if cc-option fails unless -mfpu-vfp is on the comman=
dline too.
-
-Since we have a gcc which accepts the armv7-a arch, just remove the cc-opt=
ion
-wrapper unconditionally here.
-
-Upstream-Status: Submitted [Alternative patch discussion on arm-linux mail=
ing list]
-
-Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
----
- arch/arm/Makefile | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/arch/arm/Makefile b/arch/arm/Makefile
-index ecb99f7ac613..8513ba79ea04 100644
---- a/arch/arm/Makefile
-+++ b/arch/arm/Makefile
-@@ -64,7 +64,7 @@ KBUILD_CFLAGS	+=3D $(call cc-option,-fno-ipa-sra)
- # macro, but instead defines a whole series of macros which makes
- # testing for a specific architecture or later rather impossible.
- arch-$(CONFIG_CPU_32v7M)	=3D-D__LINUX_ARM_ARCH__=3D7 -march=3Darmv7-m -Wa=
,-march=3Darmv7-m
--arch-$(CONFIG_CPU_32v7)		=3D-D__LINUX_ARM_ARCH__=3D7 $(call cc-option,-ma=
rch=3Darmv7-a,-march=3Darmv5t -Wa$(comma)-march=3Darmv7-a)
-+arch-$(CONFIG_CPU_32v7)		=3D-D__LINUX_ARM_ARCH__=3D7 -march=3Darmv7-a -Wa=
$(comma)-march=3Darmv7-a
- arch-$(CONFIG_CPU_32v6)		=3D-D__LINUX_ARM_ARCH__=3D6 $(call cc-option,-ma=
rch=3Darmv6,-march=3Darmv5t -Wa$(comma)-march=3Darmv6)
- # Only override the compiler option if ARMv6. The ARMv6K extensions are
- # always available in ARMv7
---=20
-2.20.1
-
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.19.bb b/meta/recipes-k=
ernel/linux/linux-yocto_4.19.bb
index d5d99e7d77..a3e6cd6526 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.19.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.19.bb
@@ -11,19 +11,19 @@ KBRANCH_qemux86  ?=3D "v4.19/standard/base"
 KBRANCH_qemux86-64 ?=3D "v4.19/standard/base"
 KBRANCH_qemumips64 ?=3D "v4.19/standard/mti-malta64"
=20
-SRCREV_machine_qemuarm ?=3D "0d83500d7377b68aeb42387350bb41dd7dc04315"
-SRCREV_machine_qemuarm64 ?=3D "11e0e616ed095bb8012e1b4a231254c9656a0193"
-SRCREV_machine_qemumips ?=3D "0169796412b83d8835f3f9b81d19efe008199fdd"
-SRCREV_machine_qemuppc ?=3D "11e0e616ed095bb8012e1b4a231254c9656a0193"
-SRCREV_machine_qemux86 ?=3D "11e0e616ed095bb8012e1b4a231254c9656a0193"
-SRCREV_machine_qemux86-64 ?=3D "11e0e616ed095bb8012e1b4a231254c9656a0193"
-SRCREV_machine_qemumips64 ?=3D "fc7a2bf24e0e39b6a260f8650a3c8d497b8cdcfd"
-SRCREV_machine ?=3D "11e0e616ed095bb8012e1b4a231254c9656a0193"
+SRCREV_machine_qemuarm ?=3D "5fe7d1bfb1d030c1e696efef2ee89974874c0b01"
+SRCREV_machine_qemuarm64 ?=3D "148322096f4147947955fa83c9863eed4ac23897"
+SRCREV_machine_qemumips ?=3D "7ec0c72dac55c5b72c82fb3bcc4f44ff59d79c4d"
+SRCREV_machine_qemuppc ?=3D "148322096f4147947955fa83c9863eed4ac23897"
+SRCREV_machine_qemux86 ?=3D "148322096f4147947955fa83c9863eed4ac23897"
+SRCREV_machine_qemux86-64 ?=3D "148322096f4147947955fa83c9863eed4ac23897"
+SRCREV_machine_qemumips64 ?=3D "141bb3296422e09cfb0a8ef06f2e7f1748bb8f65"
+SRCREV_machine ?=3D "148322096f4147947955fa83c9863eed4ac23897"
 SRCREV_meta ?=3D "b173a1b0a218f2bebc28251ef08ee592652b6bc0"
=20
 SRC_URI =3D "git://git.yoctoproject.org/linux-yocto.git;name=3Dmachine;bra=
nch=3D${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=3Dkmeta;name=
=3Dmeta;branch=3Dyocto-4.19;destsuffix=3D${KMETA} \
-           file://0001-arm-Makefile-Fix-systemtap-4.19.patch"
+          "
=20
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dbbea815ee2795b2f4230826c0c6b881=
4"
 LINUX_VERSION ?=3D "4.19.19"
--=20
2.19.1


