Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8BF4C05051
	for <webhook@archiver.kernel.org>; Sun, 25 Jun 2023 21:22:57 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web10.20342.1687728167778180618
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Jun 2023 14:22:48 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=C/sXlHWU;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-3f9b4bf99c2so34609685e9.3
        for <openembedded-core@lists.openembedded.org>; Sun, 25 Jun 2023 14:22:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687728166; x=1690320166;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G+6NGK1IcrnS1KY53NA2hE1ahivDT10iB93yi1XxgQ0=;
        b=C/sXlHWUGEGOOf3yTOjVnDjPYnlHEafHnvGGSlFm97yV0MqrMPy1XtDJIgj/tcl/Md
         G4Ye/+0xYfEI8elDudru6kvz7b8WOJ3hPJPQc3e1bHsRQXUwkhpc2tpuVVsViYmsmP6N
         3paOzhHDsPWqDYccGqgJD2WPn+m/9zUUvzjmotAHdrQdaVRyTWwOjt1SUREejzeyfKgF
         PYBGuJ/Gf32v6U+pIj8ahxYDu47yvcEEYf42S+svg4O4DcV0ZKoYt+IF4w5bSYaHKbpq
         Is3kLlIS6sQ+o5AfMUwdQar9dkgB9u4giFMG3mG3VtXpHBm1QNcOjz4QXnoTvTuKSSU5
         JxGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687728166; x=1690320166;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G+6NGK1IcrnS1KY53NA2hE1ahivDT10iB93yi1XxgQ0=;
        b=KOsaWhADYC4uZVq/dkEWsPz/1fLU63CubANzfvvw/ORJed551Hyyx2oWPdPb1ET/yz
         si5bm8hqKmzLYlXbtw6nMlraU0K/DN38GjGvbNBPuLRQpFfvmkUy0v1ThxFufzKii+na
         sbRit9l72SDuJJziinjcjcYZ6UCe42/1hQuoewa1xr5yNM/rQIZQfsJRlztO2ObP6hpj
         MYUAKUeiNVtJ/iZSAJqAekULHrw4s8Z6/dRQ5fOtJiCV03NSJzXe9X14Vdf7TnI2OzTo
         E0Zartdc42Lj56JCEP7PcoHepOZ9jSLfofP32mlPlgw/csmHTm1LUvzTsYzY9SpX3gRA
         FHJA==
X-Gm-Message-State: AC+VfDyKkZOVuRxlxL8n2LWtTMbHtNZCVRuBdwI05jB1niMQTjB52CdE
	67hGbNC5VcCdUHUlmR4y9eeUMa9Su+BqIA==
X-Google-Smtp-Source: ACHHUZ6jd9WrPutLT0d3D5brE6cxgUirQIW7WoTtqzvWiuRMX6w8AyUrrNCz0MdvWrDQxRyjHxbeCw==
X-Received: by 2002:a7b:ca51:0:b0:3fa:7421:2c66 with SMTP id m17-20020a7bca51000000b003fa74212c66mr7982677wml.16.1687728166030;
        Sun, 25 Jun 2023 14:22:46 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id q9-20020a056000136900b0030f9c3219aasm5426736wrz.47.2023.06.25.14.22.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jun 2023 14:22:45 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 03/21] ovmf: update 202302 -> 202305
Date: Sun, 25 Jun 2023 23:22:23 +0200
Message-Id: <20230625212241.915739-3-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230625212241.915739-1-alex@linutronix.de>
References: <20230625212241.915739-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 25 Jun 2023 21:22:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183378

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...ovmf-update-path-to-native-BaseTools.patch |  8 ++--
 ...ile-adjust-to-build-in-under-bitbake.patch | 48 +++++++++----------
 ...-map.patch =3D> 0003-debug-prefix-map.patch} | 22 ++++-----
 ...oducible.patch =3D> 0004-reproducible.patch} | 42 ++++++++--------
 meta/recipes-core/ovmf/ovmf_git.bb            |  8 ++--
 5 files changed, 63 insertions(+), 65 deletions(-)
 rename meta/recipes-core/ovmf/ovmf/{0005-debug-prefix-map.patch =3D> 0003-=
debug-prefix-map.patch} (86%)
 rename meta/recipes-core/ovmf/ovmf/{0006-reproducible.patch =3D> 0004-repr=
oducible.patch} (88%)

diff --git a/meta/recipes-core/ovmf/ovmf/0001-ovmf-update-path-to-native-Ba=
seTools.patch b/meta/recipes-core/ovmf/ovmf/0001-ovmf-update-path-to-native=
-BaseTools.patch
index 0c3df4fc44a..490d9e8046e 100644
--- a/meta/recipes-core/ovmf/ovmf/0001-ovmf-update-path-to-native-BaseTools=
.patch
+++ b/meta/recipes-core/ovmf/ovmf/0001-ovmf-update-path-to-native-BaseTools=
.patch
@@ -1,7 +1,7 @@
-From 1125f5a02c2f327aeffe2d6b66a9d816ad2eeec0 Mon Sep 17 00:00:00 2001
+From d8df6b6433351763e1db791dd84d432983d2b249 Mon Sep 17 00:00:00 2001
 From: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
 Date: Thu, 9 Jun 2016 02:23:01 -0700
-Subject: [PATCH 1/6] ovmf: update path to native BaseTools
+Subject: [PATCH 1/4] ovmf: update path to native BaseTools
=20
 BaseTools is a set of utilities to build EDK-based firmware. These utiliti=
es
 are used during the build process. Thus, they need to be built natively.
@@ -16,7 +16,7 @@ Upstream-Status: Inappropriate [oe-core cross compile spe=
cific]
  1 file changed, 1 insertion(+), 1 deletion(-)
=20
 diff --git a/OvmfPkg/build.sh b/OvmfPkg/build.sh
-index 91b1442ade..1858dae31a 100755
+index b0334fb76e..094f86f096 100755
 --- a/OvmfPkg/build.sh
 +++ b/OvmfPkg/build.sh
 @@ -24,7 +24,7 @@ then
@@ -29,5 +29,5 @@ index 91b1442ade..1858dae31a 100755
    source edksetup.sh BaseTools
  else
 --=20
-2.32.0
+2.30.2
=20
diff --git a/meta/recipes-core/ovmf/ovmf/0002-BaseTools-makefile-adjust-to-=
build-in-under-bitbake.patch b/meta/recipes-core/ovmf/ovmf/0002-BaseTools-m=
akefile-adjust-to-build-in-under-bitbake.patch
index 2293d7e938c..efabc8febc9 100644
--- a/meta/recipes-core/ovmf/ovmf/0002-BaseTools-makefile-adjust-to-build-i=
n-under-bitbake.patch
+++ b/meta/recipes-core/ovmf/ovmf/0002-BaseTools-makefile-adjust-to-build-i=
n-under-bitbake.patch
@@ -1,7 +1,7 @@
-From 19d4c7f9812062a683b3ba60b35aac0461190456 Mon Sep 17 00:00:00 2001
+From 7675a67b8bb207de38ff5a9dc416e8b1028eb8ce Mon Sep 17 00:00:00 2001
 From: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
 Date: Fri, 26 Jul 2019 17:34:26 -0400
-Subject: [PATCH 2/6] BaseTools: makefile: adjust to build in under bitbake
+Subject: [PATCH 2/4] BaseTools: makefile: adjust to build in under bitbake
=20
 Prepend the build flags with those of bitbake. This is to build
 using the bitbake native sysroot include and library directories.
@@ -14,58 +14,56 @@ to fight against how upstream wants to configure the bu=
ild.
 Signed-off-by: Ricardo Neri <ricardo.neri@linux.intel.com>
 Upstream-Status: Inappropriate [needs to be converted to in-recipe fixups]
 ---
- BaseTools/Source/C/Makefiles/header.makefile | 17 +++++++++--------
- 1 file changed, 9 insertions(+), 8 deletions(-)
+ BaseTools/Source/C/Makefiles/header.makefile | 15 +++++++--------
+ 1 file changed, 7 insertions(+), 8 deletions(-)
=20
 diff --git a/BaseTools/Source/C/Makefiles/header.makefile b/BaseTools/Sour=
ce/C/Makefiles/header.makefile
-index 0df728f327..1299d47c87 100644
+index 1bf003523b..28757aed63 100644
 --- a/BaseTools/Source/C/Makefiles/header.makefile
 +++ b/BaseTools/Source/C/Makefiles/header.makefile
-@@ -75,35 +75,36 @@ $(error Bad HOST_ARCH)
+@@ -82,35 +82,34 @@ $(error Bad HOST_ARCH)
  endif=0D
  =0D
  INCLUDE =3D $(TOOL_INCLUDE) -I $(MAKEROOT) -I $(MAKEROOT)/Include/Common =
-I $(MAKEROOT)/Include/ -I $(MAKEROOT)/Include/IndustryStandard -I $(MAKERO=
OT)/Common/ -I .. -I . $(ARCH_INCLUDE)=0D
--BUILD_CPPFLAGS =3D $(INCLUDE)=0D
-+BUILD_CPPFLAGS +=3D $(INCLUDE)=0D
+-CPPFLAGS =3D $(INCLUDE)=0D
++CPPFLAGS +=3D $(INCLUDE)=0D
  =0D
  # keep EXTRA_OPTFLAGS last=0D
  BUILD_OPTFLAGS =3D -O2 $(EXTRA_OPTFLAGS)=0D
  =0D
  ifeq ($(DARWIN),Darwin)=0D
  # assume clang or clang compatible flags on OS X=0D
--BUILD_CFLAGS =3D -MD -fshort-wchar -fno-strict-aliasing -Wall -Werror \=0D
-+BUILD_CFLAGS +=3D -MD -fshort-wchar -fno-strict-aliasing -Wall -Werror \=
=0D
+-CFLAGS =3D -MD -fshort-wchar -fno-strict-aliasing -Wall -Werror \=0D
++CFLAGS +=3D -MD -fshort-wchar -fno-strict-aliasing -Wall -Werror \=0D
  -Wno-deprecated-declarations -Wno-self-assign -Wno-unused-result -nostdli=
b -g=0D
  else=0D
- ifeq ($(CXX), llvm)=0D
--BUILD_CFLAGS =3D -MD -fshort-wchar -fno-strict-aliasing -fwrapv \=0D
-+BUILD_CFLAGS +=3D -MD -fshort-wchar -fno-strict-aliasing -fwrapv \=0D
+ ifneq ($(CLANG),)=0D
+-CFLAGS =3D -MD -fshort-wchar -fno-strict-aliasing -fwrapv \=0D
++CFLAGS +=3D -MD -fshort-wchar -fno-strict-aliasing -fwrapv \=0D
  -fno-delete-null-pointer-checks -Wall -Werror \=0D
  -Wno-deprecated-declarations -Wno-self-assign \=0D
  -Wno-unused-result -nostdlib -g=0D
  else=0D
--BUILD_CFLAGS =3D -MD -fshort-wchar -fno-strict-aliasing -fwrapv \=0D
-+BUILD_CFLAGS +=3D -MD -fshort-wchar -fno-strict-aliasing -fwrapv \=0D
+-CFLAGS =3D -MD -fshort-wchar -fno-strict-aliasing -fwrapv \=0D
++CFLAGS +=3D -MD -fshort-wchar -fno-strict-aliasing -fwrapv \=0D
  -fno-delete-null-pointer-checks -Wall -Werror \=0D
  -Wno-deprecated-declarations -Wno-stringop-truncation -Wno-restrict \=0D
  -Wno-unused-result -nostdlib -g=0D
  endif=0D
  endif=0D
- ifeq ($(CXX), llvm)=0D
--BUILD_LFLAGS =3D=0D
--BUILD_CXXFLAGS =3D -Wno-deprecated-register -Wno-unused-result=0D
-+BUILD_LFLAGS =3D $(LDFLAGS)=0D
-+BUILD_CXXFLAGS +=3D -Wno-deprecated-register -Wno-unused-result=0D
+ ifneq ($(CLANG),)=0D
+-LDFLAGS =3D=0D
+-CXXFLAGS =3D -Wno-deprecated-register -Wno-unused-result -std=3Dc++14=0D
++CXXFLAGS +=3D -Wno-deprecated-register -Wno-unused-result -std=3Dc++14=0D
  else=0D
--BUILD_LFLAGS =3D=0D
--BUILD_CXXFLAGS =3D -Wno-unused-result=0D
-+BUILD_LFLAGS =3D $(LDFLAGS)=0D
-+BUILD_CXXFLAGS +=3D -Wno-unused-result=0D
+-LDFLAGS =3D=0D
+-CXXFLAGS =3D -Wno-unused-result=0D
++CXXFLAGS +=3D -Wno-unused-result=0D
  endif=0D
 +=0D
  ifeq ($(HOST_ARCH), IA32)=0D
  #=0D
  # Snow Leopard  is a 32-bit and 64-bit environment. uname -m returns i386=
, but gcc defaults=0D
 --=20
-2.32.0
+2.30.2
=20
diff --git a/meta/recipes-core/ovmf/ovmf/0005-debug-prefix-map.patch b/meta=
/recipes-core/ovmf/ovmf/0003-debug-prefix-map.patch
similarity index 86%
rename from meta/recipes-core/ovmf/ovmf/0005-debug-prefix-map.patch
rename to meta/recipes-core/ovmf/ovmf/0003-debug-prefix-map.patch
index 7adc45465c0..c0c763c1cf8 100644
--- a/meta/recipes-core/ovmf/ovmf/0005-debug-prefix-map.patch
+++ b/meta/recipes-core/ovmf/ovmf/0003-debug-prefix-map.patch
@@ -1,7 +1,7 @@
-From cf6361f27cd6318622fd58ab6c0a9407cc633b1e Mon Sep 17 00:00:00 2001
+From 03e536b20d0b72cf078052f6748de8df3836625c Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Mon, 14 Jun 2021 19:56:28 +0200
-Subject: [PATCH] debug prefix map
+Subject: [PATCH 3/4] debug prefix map
=20
 We want to pass ${DEBUG_PREFIX_MAP} to gcc commands and also pass in
  --debug-prefix-map to nasm (we carry a patch to nasm for this). The
@@ -22,10 +22,10 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.co=
m>
  1 file changed, 9 insertions(+), 9 deletions(-)
=20
 diff --git a/BaseTools/Conf/tools_def.template b/BaseTools/Conf/tools_def.=
template
-index 471eb67c0c..a16fb5c9f1 100755
+index 503a6687c1..10ac38ef9e 100755
 --- a/BaseTools/Conf/tools_def.template
 +++ b/BaseTools/Conf/tools_def.template
-@@ -1849,7 +1849,7 @@ NOOPT_*_*_OBJCOPY_ADDDEBUGFLAG     =3D --add-gnu-deb=
uglink=3D$(DEBUG_DIR)/$(MODULE_N
+@@ -739,7 +739,7 @@ NOOPT_*_*_OBJCOPY_ADDDEBUGFLAG     =3D --add-gnu-debug=
link=3D"$(DEBUG_DIR)/$(MODULE_
  *_*_*_DTCPP_PATH                   =3D DEF(DTCPP_BIN)=0D
  *_*_*_DTC_PATH                     =3D DEF(DTC_BIN)=0D
  =0D
@@ -34,7 +34,7 @@ index 471eb67c0c..a16fb5c9f1 100755
  DEFINE GCC_ARM_CC_FLAGS            =3D DEF(GCC_ALL_CC_FLAGS) -mlittle-end=
ian -mabi=3Daapcs -fno-short-enums -funsigned-char -ffunction-sections -fda=
ta-sections -fomit-frame-pointer -Wno-address -mthumb -fno-pic -fno-pie=0D
  DEFINE GCC_LOONGARCH64_CC_FLAGS    =3D DEF(GCC_ALL_CC_FLAGS) -mabi=3Dlp64=
d -fno-asynchronous-unwind-tables -fno-plt -Wno-address -fno-short-enums -f=
signed-char -ffunction-sections -fdata-sections=0D
  DEFINE GCC_ARM_CC_XIPFLAGS         =3D -mno-unaligned-access=0D
-@@ -1869,8 +1869,8 @@ DEFINE GCC_ARM_ASLDLINK_FLAGS      =3D DEF(GCC_ARM_D=
LINK_FLAGS) -Wl,--entry,Refere
+@@ -759,8 +759,8 @@ DEFINE GCC_ARM_ASLDLINK_FLAGS      =3D DEF(GCC_ARM_DLI=
NK_FLAGS) -Wl,--entry,Refere
  DEFINE GCC_AARCH64_ASLDLINK_FLAGS  =3D DEF(GCC_AARCH64_DLINK_FLAGS) -Wl,-=
-entry,ReferenceAcpiTable -u $(IMAGE_ENTRY_POINT) DEF(GCC_ARM_AARCH64_ASLDL=
INK_FLAGS)=0D
  DEFINE GCC_LOONGARCH64_ASLDLINK_FLAGS =3D DEF(GCC_LOONGARCH64_DLINK_FLAGS=
) -Wl,--entry,ReferenceAcpiTable -u $(IMAGE_ENTRY_POINT)=0D
  DEFINE GCC_IA32_X64_DLINK_FLAGS    =3D DEF(GCC_IA32_X64_DLINK_COMMON) --e=
ntry _$(IMAGE_ENTRY_POINT) --file-alignment 0x20 --section-alignment 0x20 -=
Map $(DEST_DIR_DEBUG)/$(BASE_NAME).map=0D
@@ -45,7 +45,7 @@ index 471eb67c0c..a16fb5c9f1 100755
  DEFINE GCC_VFRPP_FLAGS             =3D -x c -E -P -DVFRCOMPILE --include =
$(MODULE_NAME)StrDefs.h=0D
  DEFINE GCC_ASLPP_FLAGS             =3D -x c -E -include AutoGen.h=0D
  DEFINE GCC_ASLCC_FLAGS             =3D -x c=0D
-@@ -2022,7 +2022,7 @@ DEFINE GCC5_LOONGARCH64_PP_FLAGS           =3D -mabi=
=3Dlp64d -march=3Dloongarch64 DEF(
+@@ -913,7 +913,7 @@ DEFINE GCC5_LOONGARCH64_PP_FLAGS           =3D -mabi=
=3Dlp64d -march=3Dloongarch64 DEF(
  *_GCC48_IA32_DLINK2_FLAGS         =3D DEF(GCC48_IA32_DLINK2_FLAGS)=0D
  *_GCC48_IA32_RC_FLAGS             =3D DEF(GCC_IA32_RC_FLAGS)=0D
  *_GCC48_IA32_OBJCOPY_FLAGS        =3D=0D
@@ -54,7 +54,7 @@ index 471eb67c0c..a16fb5c9f1 100755
  =0D
    DEBUG_GCC48_IA32_CC_FLAGS       =3D DEF(GCC48_IA32_CC_FLAGS)=0D
  RELEASE_GCC48_IA32_CC_FLAGS       =3D DEF(GCC48_IA32_CC_FLAGS) -Wno-unuse=
d-but-set-variable=0D
-@@ -2050,7 +2050,7 @@ RELEASE_GCC48_IA32_CC_FLAGS       =3D DEF(GCC48_IA32=
_CC_FLAGS) -Wno-unused-but-set
+@@ -941,7 +941,7 @@ RELEASE_GCC48_IA32_CC_FLAGS       =3D DEF(GCC48_IA32_C=
C_FLAGS) -Wno-unused-but-set
  *_GCC48_X64_DLINK2_FLAGS         =3D DEF(GCC48_X64_DLINK2_FLAGS)=0D
  *_GCC48_X64_RC_FLAGS             =3D DEF(GCC_X64_RC_FLAGS)=0D
  *_GCC48_X64_OBJCOPY_FLAGS        =3D=0D
@@ -63,7 +63,7 @@ index 471eb67c0c..a16fb5c9f1 100755
  =0D
    DEBUG_GCC48_X64_CC_FLAGS       =3D DEF(GCC48_X64_CC_FLAGS)=0D
  RELEASE_GCC48_X64_CC_FLAGS       =3D DEF(GCC48_X64_CC_FLAGS) -Wno-unused-=
but-set-variable=0D
-@@ -2159,7 +2159,7 @@ RELEASE_GCC48_AARCH64_CC_FLAGS   =3D DEF(GCC48_AARCH=
64_CC_FLAGS) -Wno-unused-but-s
+@@ -1050,7 +1050,7 @@ RELEASE_GCC48_AARCH64_CC_FLAGS   =3D DEF(GCC48_AARCH=
64_CC_FLAGS) -Wno-unused-but-s
  *_GCC49_IA32_DLINK2_FLAGS         =3D DEF(GCC49_IA32_DLINK2_FLAGS)=0D
  *_GCC49_IA32_RC_FLAGS             =3D DEF(GCC_IA32_RC_FLAGS)=0D
  *_GCC49_IA32_OBJCOPY_FLAGS        =3D=0D
@@ -72,7 +72,7 @@ index 471eb67c0c..a16fb5c9f1 100755
  =0D
    DEBUG_GCC49_IA32_CC_FLAGS       =3D DEF(GCC49_IA32_CC_FLAGS)=0D
  RELEASE_GCC49_IA32_CC_FLAGS       =3D DEF(GCC49_IA32_CC_FLAGS) -Wno-unuse=
d-but-set-variable -Wno-unused-const-variable=0D
-@@ -2187,7 +2187,7 @@ RELEASE_GCC49_IA32_CC_FLAGS       =3D DEF(GCC49_IA32=
_CC_FLAGS) -Wno-unused-but-set
+@@ -1078,7 +1078,7 @@ RELEASE_GCC49_IA32_CC_FLAGS       =3D DEF(GCC49_IA32=
_CC_FLAGS) -Wno-unused-but-set
  *_GCC49_X64_DLINK2_FLAGS         =3D DEF(GCC49_X64_DLINK2_FLAGS)=0D
  *_GCC49_X64_RC_FLAGS             =3D DEF(GCC_X64_RC_FLAGS)=0D
  *_GCC49_X64_OBJCOPY_FLAGS        =3D=0D
@@ -81,7 +81,7 @@ index 471eb67c0c..a16fb5c9f1 100755
  =0D
    DEBUG_GCC49_X64_CC_FLAGS       =3D DEF(GCC49_X64_CC_FLAGS)=0D
  RELEASE_GCC49_X64_CC_FLAGS       =3D DEF(GCC49_X64_CC_FLAGS) -Wno-unused-=
but-set-variable -Wno-unused-const-variable=0D
-@@ -2302,7 +2302,7 @@ RELEASE_GCC49_AARCH64_DLINK_XIPFLAGS =3D -z common-p=
age-size=3D0x20
+@@ -1337,7 +1337,7 @@ RELEASE_GCCNOLTO_AARCH64_DLINK_XIPFLAGS =3D -z commo=
n-page-size=3D0x20
  *_GCC5_IA32_DLINK2_FLAGS         =3D DEF(GCC5_IA32_DLINK2_FLAGS) -no-pie=
=0D
  *_GCC5_IA32_RC_FLAGS             =3D DEF(GCC_IA32_RC_FLAGS)=0D
  *_GCC5_IA32_OBJCOPY_FLAGS        =3D=0D
@@ -90,7 +90,7 @@ index 471eb67c0c..a16fb5c9f1 100755
  =0D
    DEBUG_GCC5_IA32_CC_FLAGS       =3D DEF(GCC5_IA32_CC_FLAGS) -flto=0D
    DEBUG_GCC5_IA32_DLINK_FLAGS    =3D DEF(GCC5_IA32_X64_DLINK_FLAGS) -flto=
 -Os -Wl,-m,elf_i386,--oformat=3Delf32-i386=0D
-@@ -2334,7 +2334,7 @@ RELEASE_GCC5_IA32_DLINK_FLAGS    =3D DEF(GCC5_IA32_X=
64_DLINK_FLAGS) -flto -Os -Wl,
+@@ -1369,7 +1369,7 @@ RELEASE_GCC5_IA32_DLINK_FLAGS    =3D DEF(GCC5_IA32_X=
64_DLINK_FLAGS) -flto -Os -Wl,
  *_GCC5_X64_DLINK2_FLAGS          =3D DEF(GCC5_X64_DLINK2_FLAGS)=0D
  *_GCC5_X64_RC_FLAGS              =3D DEF(GCC_X64_RC_FLAGS)=0D
  *_GCC5_X64_OBJCOPY_FLAGS         =3D=0D
diff --git a/meta/recipes-core/ovmf/ovmf/0006-reproducible.patch b/meta/rec=
ipes-core/ovmf/ovmf/0004-reproducible.patch
similarity index 88%
rename from meta/recipes-core/ovmf/ovmf/0006-reproducible.patch
rename to meta/recipes-core/ovmf/ovmf/0004-reproducible.patch
index 846f4080128..c3fdc3d8634 100644
--- a/meta/recipes-core/ovmf/ovmf/0006-reproducible.patch
+++ b/meta/recipes-core/ovmf/ovmf/0004-reproducible.patch
@@ -1,7 +1,7 @@
-From 27ed9962f5cb3afcc44d6c96c53277132a999712 Mon Sep 17 00:00:00 2001
+From c59850367a190d70dec43e0a66f399a4d8a5ffed Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Mon, 14 Jun 2021 19:57:30 +0200
-Subject: [PATCH 6/6] reproducible
+Subject: [PATCH 4/4] reproducible
=20
 This patch fixes various things which make the build more reproducible. So=
me changes
 here only change intermediate artefacts but that means when you have two b=
uild trees
@@ -35,10 +35,10 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.co=
m>
  4 files changed, 24 insertions(+), 16 deletions(-)
=20
 diff --git a/BaseTools/Source/C/GenFw/Elf64Convert.c b/BaseTools/Source/C/=
GenFw/Elf64Convert.c
-index d097db8632..a87ae6f3d0 100644
+index 9c17c90b16..fcc7864141 100644
 --- a/BaseTools/Source/C/GenFw/Elf64Convert.c
 +++ b/BaseTools/Source/C/GenFw/Elf64Convert.c
-@@ -14,6 +14,8 @@ SPDX-License-Identifier: BSD-2-Clause-Patent
+@@ -15,6 +15,8 @@ SPDX-License-Identifier: BSD-2-Clause-Patent
  #ifndef __GNUC__=0D
  #include <windows.h>=0D
  #include <io.h>=0D
@@ -47,35 +47,35 @@ index d097db8632..a87ae6f3d0 100644
  #endif=0D
  #include <assert.h>=0D
  #include <stdio.h>=0D
-@@ -769,7 +771,7 @@ ScanSections64 (
+@@ -990,7 +992,7 @@ ScanSections64 (
    }=0D
    mCoffOffset =3D mDebugOffset + sizeof(EFI_IMAGE_DEBUG_DIRECTORY_ENTRY) =
+=0D
                  sizeof(EFI_IMAGE_DEBUG_CODEVIEW_NB10_ENTRY) +=0D
 -                strlen(mInImageName) + 1;=0D
 +                strlen(basename(mInImageName)) + 1;=0D
  =0D
-   mCoffOffset =3D CoffAlign(mCoffOffset);=0D
-   if (SectionCount =3D=3D 0) {=0D
-@@ -1608,7 +1610,7 @@ WriteDebug64 (
-   EFI_IMAGE_DEBUG_DIRECTORY_ENTRY     *Dir;=0D
-   EFI_IMAGE_DEBUG_CODEVIEW_NB10_ENTRY *Nb10;=0D
+   //=0D
+   // Add more space in the .debug data region for the DllCharacteristicsE=
x=0D
+@@ -2261,7 +2263,7 @@ WriteDebug64 (
+   EFI_IMAGE_DEBUG_CODEVIEW_NB10_ENTRY         *Nb10;=0D
+   EFI_IMAGE_DEBUG_EX_DLLCHARACTERISTICS_ENTRY *DllEntry;=0D
  =0D
 -  Len =3D strlen(mInImageName) + 1;=0D
 +  Len =3D strlen(basename(mInImageName)) + 1;=0D
  =0D
-   Dir =3D (EFI_IMAGE_DEBUG_DIRECTORY_ENTRY*)(mCoffFile + mDebugOffset);=0D
-   Dir->Type =3D EFI_IMAGE_DEBUG_TYPE_CODEVIEW;=0D
-@@ -1618,7 +1620,7 @@ WriteDebug64 (
+   NtHdr =3D (EFI_IMAGE_OPTIONAL_HEADER_UNION *)(mCoffFile + mNtHdrOffset)=
;=0D
+   DataDir =3D &NtHdr->Pe32Plus.OptionalHeader.DataDirectory[EFI_IMAGE_DIR=
ECTORY_ENTRY_DEBUG];=0D
+@@ -2294,7 +2296,7 @@ WriteDebug64 (
  =0D
    Nb10 =3D (EFI_IMAGE_DEBUG_CODEVIEW_NB10_ENTRY*)(Dir + 1);=0D
    Nb10->Signature =3D CODEVIEW_SIGNATURE_NB10;=0D
 -  strcpy ((char *)(Nb10 + 1), mInImageName);=0D
 +  strcpy ((char *)(Nb10 + 1), basename(mInImageName));=0D
+ }=0D
  =0D
- =0D
-   NtHdr =3D (EFI_IMAGE_OPTIONAL_HEADER_UNION *)(mCoffFile + mNtHdrOffset)=
;=0D
+ STATIC=0D
 diff --git a/BaseTools/Source/Python/AutoGen/BuildEngine.py b/BaseTools/So=
urce/Python/AutoGen/BuildEngine.py
-index 722fead75a..8f1c236970 100644
+index 752a1a1f6a..02054cccf8 100644
 --- a/BaseTools/Source/Python/AutoGen/BuildEngine.py
 +++ b/BaseTools/Source/Python/AutoGen/BuildEngine.py
 @@ -70,6 +70,9 @@ class TargetDescBlock(object):
@@ -89,7 +89,7 @@ index 722fead75a..8f1c236970 100644
          if Input not in self.Inputs:=0D
              self.Inputs.append(Input)=0D
 diff --git a/BaseTools/Source/Python/AutoGen/GenMake.py b/BaseTools/Source=
/Python/AutoGen/GenMake.py
-index 961b2ab1c3..23c1592025 100755
+index daec9c6d54..0e8cc20efe 100755
 --- a/BaseTools/Source/Python/AutoGen/GenMake.py
 +++ b/BaseTools/Source/Python/AutoGen/GenMake.py
 @@ -575,7 +575,7 @@ cleanlib:
@@ -153,10 +153,10 @@ index 961b2ab1c3..23c1592025 100755
                  if T.GenFileListMacro and T.FileListMacro not in self.Fil=
eListMacros:=0D
                      self.FileListMacros[T.FileListMacro] =3D []=0D
 diff --git a/BaseTools/Source/Python/AutoGen/ModuleAutoGen.py b/BaseTools/=
Source/Python/AutoGen/ModuleAutoGen.py
-index d70b0d7ae8..25dca9a6df 100755
+index d05410b329..99b3f64aba 100755
 --- a/BaseTools/Source/Python/AutoGen/ModuleAutoGen.py
 +++ b/BaseTools/Source/Python/AutoGen/ModuleAutoGen.py
-@@ -1484,6 +1484,9 @@ class ModuleAutoGen(AutoGen):
+@@ -1474,6 +1474,9 @@ class ModuleAutoGen(AutoGen):
              for File in Files:=0D
                  if File.lower().endswith('.pdb'):=0D
                      AsBuiltInfDict['binary_item'].append('DISPOSABLE|' + =
File)=0D
@@ -166,7 +166,7 @@ index d70b0d7ae8..25dca9a6df 100755
          HeaderComments =3D self.Module.HeaderComments=0D
          StartPos =3D 0=0D
          for Index in range(len(HeaderComments)):=0D
-@@ -1759,7 +1762,7 @@ class ModuleAutoGen(AutoGen):
+@@ -1749,7 +1752,7 @@ class ModuleAutoGen(AutoGen):
              if os.path.exists (self.TimeStampPath):=0D
                  os.remove (self.TimeStampPath)=0D
  =0D
@@ -176,5 +176,5 @@ index d70b0d7ae8..25dca9a6df 100755
          # Ignore generating makefile when it is a binary module=0D
          if self.IsBinaryModule:=0D
 --=20
-2.32.0
+2.30.2
=20
diff --git a/meta/recipes-core/ovmf/ovmf_git.bb b/meta/recipes-core/ovmf/ov=
mf_git.bb
index bd92c5d43d7..761c2654530 100644
--- a/meta/recipes-core/ovmf/ovmf_git.bb
+++ b/meta/recipes-core/ovmf/ovmf_git.bb
@@ -22,12 +22,12 @@ BUILD_CFLAGS +=3D "-Wno-error=3Dstringop-overflow"
 SRC_URI =3D "gitsm://github.com/tianocore/edk2.git;branch=3Dmaster;protoco=
l=3Dhttps \
            file://0001-ovmf-update-path-to-native-BaseTools.patch \
            file://0002-BaseTools-makefile-adjust-to-build-in-under-bitbake=
.patch \
-           file://0005-debug-prefix-map.patch \
-           file://0006-reproducible.patch \
+           file://0003-debug-prefix-map.patch \
+           file://0004-reproducible.patch \
            "
=20
-PV =3D "edk2-stable202302"
-SRCREV =3D "f80f052277c88a67c55e107b550f504eeea947d3"
+PV =3D "edk2-stable202305"
+SRCREV =3D "ba91d0292e593df8528b66f99c1b0b14fadc8e16"
 UPSTREAM_CHECK_GITTAGREGEX =3D "(?P<pver>edk2-stable.*)"
=20
 inherit deploy
--=20
2.30.2


