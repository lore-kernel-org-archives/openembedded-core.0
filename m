Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79097CA1016
	for <webhook@archiver.kernel.org>; Thu, 11 Sep 2025 08:51:38 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web10.41408.1757580697429612084
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Sep 2025 01:51:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CuUNA81f;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-45de287cc11so8812735e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 11 Sep 2025 01:51:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757580696; x=1758185496; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FZtMm7w2WZUlI8+gn1CFhpVI7Edk/Xlrl916CVflvZA=;
        b=CuUNA81f8wr+4a/NFUuMW1FZ+hDEg7x6VjbsShB4+77hS3IjFqgB1p61CubqLCuuQ0
         HxatXQR33Zjzq4y7AiXIh5Wr+OXtkJTzu/CBCfAcz8ZTxbtDyg48pQNq9EoIYccoq5re
         Q5grSo99fGrH9bPcCeZQIXTo1hqv7hje8nguPy9Wc0A/+WWyK+5DQ40n/ZzqoJTT0V2d
         3yboFHCmYl0Vkg87J6AJkeDbu+o45jvz3Yq4R/7cRHQXWwC8ZGIqGX6FB2G5MvMKlegZ
         qZ9T129LD7lyu1ODRbdvQJPeiDrzV5ERMlTKS940866oxQrFh5PvnJ8iTsr4mMFilT5Q
         1jUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757580696; x=1758185496;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FZtMm7w2WZUlI8+gn1CFhpVI7Edk/Xlrl916CVflvZA=;
        b=KXDP03fy1mnhJHOQhdHnQ5ivlb5LMzgYAkubDh/T+5HCnkESnkKlOg70ot0wmtwykS
         aHZ8+2E3OViNWFsjQ9HnjBdPeKz0ZF0FZ3C2w8GHRwrfzoISzYNla/XNuXjLq++BDV8b
         Njk/C+0xG3rFh67xy1AnuFxa+iStlSENt1S74YZe88IK28zZsdhj17I0Cv1V6Vo9HviO
         w91+qtdNF5L8Gn+7WDx+51edscD57NyJJsukUPkkfVDQ1Xvsd2qKbv8gJdQpBMZSImKu
         nbS+QBRGzzs6P+p/3T7tGvsB8fF8VawjuXzQPlXvvDRgsk2bdvd7N5Eo1ZygokSixFT9
         epiA==
X-Gm-Message-State: AOJu0Yz+hIfJ021KAZpO6Rxa48BXWMWff2FLE4ptW2HC5epnlo7e1wOB
	1WGQFU8dXDyYEUlld4PqnJ90PW+dwsGHuQ7F2RpC+NnihC1I+nNfYHDaeIE71w==
X-Gm-Gg: ASbGncvTIFFJCiFhXVnWrV46Ic7b7R09zIHWy9bSws0omZR+d82cEv7BPBCBcznPSSl
	BzsyOgZizNWwO6ad7tdAEAWR0kQ6H/3MT17bBVWHmdpCWJjljZ7sBnG7K1sgWs1n44Jr+PLDl4P
	EQBzML9tgcR5RohaBbd54Q4sQ0SgLKKZnMnChZtirgw+vCD59LyXvXsC0rc5W4ApLizxa6EZ+cx
	dNnjl7gsTjtDq2Y73NeYdAQwF7kE632F+ixVw45UEYag+E5IMBc9GqIn7Ut9ycdlj6SG/08eaKW
	boOSP73gSkXNfYNfDSvXNWWjanklyG9k/F+Ftm2MfIaGz5LQz3o9tqAN8b/IYuhTPhqgdZOkbEG
	1Vxx6eyJEKxDcq+DqEwsjMqdXRCEkxt88svLJba26UMTep2kXC1RLIekJFueJRzk/XroqiENUpc
	/YcSJ20ToQPG3w0QsN+ItGyu6TVL6nKx8kNkS1HZosoLo0AEjfS+DQ6XcPz5krs0WTe02m
X-Google-Smtp-Source: AGHT+IElcak4tSM285BIenBzV4j6GxCL6wPVP1RKhF5aowMSV2ORfz5RnygZ/3dKuzdtul/kFzauFw==
X-Received: by 2002:a05:6000:400f:b0:3df:22a3:d240 with SMTP id ffacd0b85a97d-3e75e0f032cmr2157210f8f.4.1757580695326;
        Thu, 11 Sep 2025 01:51:35 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45e017b2f4esm19382005e9.17.2025.09.11.01.51.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Sep 2025 01:51:34 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 03/16] ovmf: update 202502 -> 202508
Date: Thu, 11 Sep 2025 10:51:10 +0200
Message-Id: <20250911085123.1551425-3-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250911085123.1551425-1-alex.kanavin@gmail.com>
References: <20250911085123.1551425-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Sep 2025 08:51:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223250

From: Alexander Kanavin <alex@linutronix.de>

Remove backports.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...t-define-bool-type-if-building-in-C2.patch | 35 -------
 ...ovmf-update-path-to-native-BaseTools.patch |  7 +-
 ...ile-adjust-to-build-in-under-bitbake.patch | 11 +--
 .../ovmf/ovmf/0003-debug-prefix-map.patch     | 26 ++---
 .../ovmf/ovmf/0004-reproducible.patch         | 32 +++---
 .../ovmf/ovmf/CVE-2024-38797-1.patch          | 43 --------
 .../ovmf/ovmf/CVE-2024-38797-2.patch          | 63 ------------
 .../ovmf/ovmf/CVE-2024-38797-3.patch          | 99 -------------------
 .../ovmf/ovmf/CVE-2024-38797-4.patch          | 97 ------------------
 .../ovmf/ovmf/CVE-2025-2295.patch             | 56 -----------
 meta/recipes-core/ovmf/ovmf_git.bb            | 12 +--
 11 files changed, 43 insertions(+), 438 deletions(-)
 delete mode 100644 meta/recipes-core/ovmf/ovmf/0001-SecurityPkg-Don-t-defi=
ne-bool-type-if-building-in-C2.patch
 delete mode 100644 meta/recipes-core/ovmf/ovmf/CVE-2024-38797-1.patch
 delete mode 100644 meta/recipes-core/ovmf/ovmf/CVE-2024-38797-2.patch
 delete mode 100644 meta/recipes-core/ovmf/ovmf/CVE-2024-38797-3.patch
 delete mode 100644 meta/recipes-core/ovmf/ovmf/CVE-2024-38797-4.patch
 delete mode 100644 meta/recipes-core/ovmf/ovmf/CVE-2025-2295.patch

diff --git a/meta/recipes-core/ovmf/ovmf/0001-SecurityPkg-Don-t-define-bool=
-type-if-building-in-C2.patch b/meta/recipes-core/ovmf/ovmf/0001-SecurityPk=
g-Don-t-define-bool-type-if-building-in-C2.patch
deleted file mode 100644
index a555070ca59..00000000000
--- a/meta/recipes-core/ovmf/ovmf/0001-SecurityPkg-Don-t-define-bool-type-i=
f-building-in-C2.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 772fa11ac82579a8f6fa171e6b835f68af3f64be Mon Sep 17 00:00:00 2001
-From: Rebecca Cran <rebecca@bsdio.com>
-Date: Mon, 26 May 2025 08:01:39 -0600
-Subject: [PATCH] SecurityPkg: Don't define bool type if building in C23 mo=
de
-
-In C23 bool is a built-in type, so it's not necessary to typedef
-bool in LibspdmStdBoolAlt.h.
-
-Signed-off-by: Rebecca Cran <rebecca@bsdio.com>
-
-Upstream-Status: Backport [https://github.com/tianocore/edk2/commit/772fa1=
1ac82579a8f6fa171e6b835f68af3f64be]
-
-Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
----
- .../DeviceSecurity/SpdmLib/Include/hal/LibspdmStdBoolAlt.h     | 3 +++
- 1 file changed, 3 insertions(+)
-
-diff --git a/SecurityPkg/DeviceSecurity/SpdmLib/Include/hal/LibspdmStdBool=
Alt.h b/SecurityPkg/DeviceSecurity/SpdmLib/Include/hal/LibspdmStdBoolAlt.h
-index 08af7296d0..395ef22d43 100644
---- a/SecurityPkg/DeviceSecurity/SpdmLib/Include/hal/LibspdmStdBoolAlt.h
-+++ b/SecurityPkg/DeviceSecurity/SpdmLib/Include/hal/LibspdmStdBoolAlt.h
-@@ -10,7 +10,10 @@ SPDX-License-Identifier: BSD-2-Clause-Patent
- #ifndef LIBSPDM_STDBOOL_ALT_H=0D
- #define LIBSPDM_STDBOOL_ALT_H=0D
- =0D
-+// In C23, bool is a built-in type=0D
-+#if __STDC_VERSION__ < 202311L=0D
- typedef BOOLEAN bool;=0D
-+#endif=0D
- =0D
- #ifndef true=0D
- #define true  TRUE=0D
---=20
-2.34.1
-
diff --git a/meta/recipes-core/ovmf/ovmf/0001-ovmf-update-path-to-native-Ba=
seTools.patch b/meta/recipes-core/ovmf/ovmf/0001-ovmf-update-path-to-native=
-BaseTools.patch
index cee5042846c..890e5862107 100644
--- a/meta/recipes-core/ovmf/ovmf/0001-ovmf-update-path-to-native-BaseTools=
.patch
+++ b/meta/recipes-core/ovmf/ovmf/0001-ovmf-update-path-to-native-BaseTools=
.patch
@@ -1,7 +1,7 @@
-From 61583b59620946683551f43c6110e656604a252f Mon Sep 17 00:00:00 2001
+From 0f859c6de2914cd984f8a0dd61471b91a2371bfa Mon Sep 17 00:00:00 2001
 From: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
 Date: Thu, 9 Jun 2016 02:23:01 -0700
-Subject: [PATCH 1/4] ovmf: update path to native BaseTools
+Subject: [PATCH] ovmf: update path to native BaseTools
=20
 BaseTools is a set of utilities to build EDK-based firmware. These utiliti=
es
 are used during the build process. Thus, they need to be built natively.
@@ -28,6 +28,3 @@ index 279f0d099a..285f061bf4 100755
    echo $EDK_TOOLS_PATH
    source edksetup.sh BaseTools
  else
---=20
-2.39.5
-
diff --git a/meta/recipes-core/ovmf/ovmf/0002-BaseTools-makefile-adjust-to-=
build-in-under-bitbake.patch b/meta/recipes-core/ovmf/ovmf/0002-BaseTools-m=
akefile-adjust-to-build-in-under-bitbake.patch
index 11d97c739a0..4a55528571e 100644
--- a/meta/recipes-core/ovmf/ovmf/0002-BaseTools-makefile-adjust-to-build-i=
n-under-bitbake.patch
+++ b/meta/recipes-core/ovmf/ovmf/0002-BaseTools-makefile-adjust-to-build-i=
n-under-bitbake.patch
@@ -1,7 +1,7 @@
-From aacbf7c91732b9959e569e90844cf9de078b2f14 Mon Sep 17 00:00:00 2001
+From 9dbd082516fdd7100f99f0f389b8eef5ececab19 Mon Sep 17 00:00:00 2001
 From: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
 Date: Fri, 26 Jul 2019 17:34:26 -0400
-Subject: [PATCH 2/4] BaseTools: makefile: adjust to build in under bitbake
+Subject: [PATCH] BaseTools: makefile: adjust to build in under bitbake
=20
 Prepend the build flags with those of bitbake. This is to build
 using the bitbake native sysroot include and library directories.
@@ -18,10 +18,10 @@ Upstream-Status: Inappropriate [needs to be converted t=
o in-recipe fixups]
  1 file changed, 7 insertions(+), 8 deletions(-)
=20
 diff --git a/BaseTools/Source/C/Makefiles/header.makefile b/BaseTools/Sour=
ce/C/Makefiles/header.makefile
-index d369908a09..22c670f316 100644
+index 55a7307a5e..e36e6a8f04 100644
 --- a/BaseTools/Source/C/Makefiles/header.makefile
 +++ b/BaseTools/Source/C/Makefiles/header.makefile
-@@ -85,35 +85,34 @@ endif
+@@ -154,35 +154,34 @@ endif
  =0D
  INCLUDE =3D $(TOOL_INCLUDE) -I $(MAKEROOT) -I $(MAKEROOT)/Include/Common =
-I $(MAKEROOT)/Include/ -I $(MAKEROOT)/Include/IndustryStandard -I $(MAKERO=
OT)/Common/ -I .. -I . $(ARCH_INCLUDE)=0D
  INCLUDE +=3D -I $(EDK2_PATH)/MdePkg/Include=0D
@@ -64,6 +64,3 @@ index d369908a09..22c670f316 100644
  ifeq ($(HOST_ARCH), IA32)=0D
  #=0D
  # Snow Leopard  is a 32-bit and 64-bit environment. uname -m returns i386=
, but gcc defaults=0D
---=20
-2.39.5
-
diff --git a/meta/recipes-core/ovmf/ovmf/0003-debug-prefix-map.patch b/meta=
/recipes-core/ovmf/ovmf/0003-debug-prefix-map.patch
index 4a20548c61e..1e79c23ae94 100644
--- a/meta/recipes-core/ovmf/ovmf/0003-debug-prefix-map.patch
+++ b/meta/recipes-core/ovmf/ovmf/0003-debug-prefix-map.patch
@@ -1,7 +1,7 @@
-From 96fa2a7f2f54f1e6330275b5eba07e1efdbd865b Mon Sep 17 00:00:00 2001
+From eb6db21ed0a845dce149d17acf8673d5188adea4 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Mon, 14 Jun 2021 19:56:28 +0200
-Subject: [PATCH 3/4] debug prefix map
+Subject: [PATCH] debug prefix map
=20
 We want to pass ${DEBUG_PREFIX_MAP} to gcc commands and also pass in
  --debug-prefix-map to nasm (we carry a patch to nasm for this). The
@@ -21,9 +21,11 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  BaseTools/Conf/tools_def.template | 18 +++++++++---------
  1 file changed, 9 insertions(+), 9 deletions(-)
=20
+diff --git a/BaseTools/Conf/tools_def.template b/BaseTools/Conf/tools_def.=
template
+index 0caa1c9001..dd86b3249d 100755
 --- a/BaseTools/Conf/tools_def.template
 +++ b/BaseTools/Conf/tools_def.template
-@@ -920,7 +920,7 @@ NOOPT_*_*_OBJCOPY_ADDDEBUGFLAG     =3D --a
+@@ -920,7 +920,7 @@ NOOPT_*_*_OBJCOPY_ADDDEBUGFLAG     =3D --add-gnu-debug=
link=3D"$(DEBUG_DIR)/$(MODULE_
  *_*_*_DTC_PATH                     =3D DEF(DTC_BIN)=0D
  =0D
  # All supported GCC archs except LOONGARCH64 support -mstack-protector-gu=
ard=3Dglobal, so set that on everything except LOONGARCH64=0D
@@ -32,18 +34,18 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.co=
m>
  DEFINE GCC_IA32_X64_CC_FLAGS       =3D -mstack-protector-guard=3Dglobal=0D
  DEFINE GCC_ARM_CC_FLAGS            =3D DEF(GCC_ALL_CC_FLAGS) -mlittle-end=
ian -mabi=3Daapcs -fno-short-enums -funsigned-char -ffunction-sections -fda=
ta-sections -fomit-frame-pointer -Wno-address -mthumb -fno-pic -fno-pie -ms=
tack-protector-guard=3Dglobal=0D
  DEFINE GCC_LOONGARCH64_CC_FLAGS    =3D DEF(GCC_ALL_CC_FLAGS) -mabi=3Dlp64=
d -fno-asynchronous-unwind-tables -Wno-address -fno-short-enums -fsigned-ch=
ar -ffunction-sections -fdata-sections=0D
-@@ -941,8 +941,8 @@ DEFINE GCC_ARM_ASLDLINK_FLAGS      =3D DEF
+@@ -938,8 +938,8 @@ DEFINE GCC_ARM_AARCH64_ASLDLINK_FLAGS =3D -Wl,--defsym=
=3DPECOFF_HEADER_SIZE=3D0 DEF(GC
+ DEFINE GCC_ARM_ASLDLINK_FLAGS      =3D DEF(GCC_ARM_DLINK_FLAGS) -Wl,--ent=
ry,ReferenceAcpiTable -u $(IMAGE_ENTRY_POINT) DEF(GCC_ARM_AARCH64_ASLDLINK_=
FLAGS)=0D
  DEFINE GCC_AARCH64_ASLDLINK_FLAGS  =3D DEF(GCC_AARCH64_DLINK_FLAGS) -Wl,-=
-entry,ReferenceAcpiTable -u $(IMAGE_ENTRY_POINT) DEF(GCC_ARM_AARCH64_ASLDL=
INK_FLAGS)=0D
  DEFINE GCC_LOONGARCH64_ASLDLINK_FLAGS =3D DEF(GCC_LOONGARCH64_DLINK_FLAGS=
) -Wl,--entry,ReferenceAcpiTable -u $(IMAGE_ENTRY_POINT)=0D
- DEFINE GCC_IA32_X64_DLINK_FLAGS    =3D DEF(GCC_IA32_X64_DLINK_COMMON) --e=
ntry _$(IMAGE_ENTRY_POINT) --file-alignment 0x20 --section-alignment 0x20 -=
Map $(DEST_DIR_DEBUG)/$(BASE_NAME).map=0D
 -DEFINE GCC_ASM_FLAGS               =3D -c -x assembler -imacros AutoGen.h=
=0D
 -DEFINE GCC_PP_FLAGS                =3D -E -x assembler-with-cpp -include =
AutoGen.h=0D
 +DEFINE GCC_ASM_FLAGS               =3D -c -x assembler -imacros AutoGen.h=
 ENV(GCC_PREFIX_MAP)=0D
 +DEFINE GCC_PP_FLAGS                =3D -E -x assembler-with-cpp -include =
AutoGen.h ENV(GCC_PREFIX_MAP)=0D
- DEFINE GCC_VFRPP_FLAGS             =3D -x c -E -P -DVFRCOMPILE --include =
$(MODULE_NAME)StrDefs.h=0D
+ DEFINE GCC_VFRPP_FLAGS             =3D -x c -E -DVFRCOMPILE --include $(M=
ODULE_NAME)StrDefs.h=0D
  DEFINE GCC_ASLPP_FLAGS             =3D -x c -E -include AutoGen.h=0D
  DEFINE GCC_ASLCC_FLAGS             =3D -x c=0D
-@@ -1095,7 +1095,7 @@ DEFINE GCC5_LOONGARCH64_PP_FLAGS
+@@ -1092,7 +1092,7 @@ DEFINE GCC5_LOONGARCH64_PP_FLAGS           =3D -mabi=
=3Dlp64d -march=3Dloongarch64 DEF(
  *_GCC48_IA32_DLINK2_FLAGS         =3D DEF(GCC48_IA32_DLINK2_FLAGS)=0D
  *_GCC48_IA32_RC_FLAGS             =3D DEF(GCC_IA32_RC_FLAGS)=0D
  *_GCC48_IA32_OBJCOPY_FLAGS        =3D=0D
@@ -52,7 +54,7 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  =0D
    DEBUG_GCC48_IA32_CC_FLAGS       =3D DEF(GCC48_IA32_CC_FLAGS)=0D
  RELEASE_GCC48_IA32_CC_FLAGS       =3D DEF(GCC48_IA32_CC_FLAGS) -Wno-unuse=
d-but-set-variable=0D
-@@ -1123,7 +1123,7 @@ RELEASE_GCC48_IA32_CC_FLAGS       =3D DEF(
+@@ -1120,7 +1120,7 @@ RELEASE_GCC48_IA32_CC_FLAGS       =3D DEF(GCC48_IA32=
_CC_FLAGS) -Wno-unused-but-set
  *_GCC48_X64_DLINK2_FLAGS         =3D DEF(GCC48_X64_DLINK2_FLAGS)=0D
  *_GCC48_X64_RC_FLAGS             =3D DEF(GCC_X64_RC_FLAGS)=0D
  *_GCC48_X64_OBJCOPY_FLAGS        =3D=0D
@@ -61,7 +63,7 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  =0D
    DEBUG_GCC48_X64_CC_FLAGS       =3D DEF(GCC48_X64_CC_FLAGS)=0D
  RELEASE_GCC48_X64_CC_FLAGS       =3D DEF(GCC48_X64_CC_FLAGS) -Wno-unused-=
but-set-variable=0D
-@@ -1232,7 +1232,7 @@ RELEASE_GCC48_AARCH64_CC_FLAGS   =3D DEF(G
+@@ -1229,7 +1229,7 @@ RELEASE_GCC48_AARCH64_CC_FLAGS   =3D DEF(GCC48_AARCH=
64_CC_FLAGS) -Wno-unused-but-s
  *_GCC49_IA32_DLINK2_FLAGS         =3D DEF(GCC49_IA32_DLINK2_FLAGS)=0D
  *_GCC49_IA32_RC_FLAGS             =3D DEF(GCC_IA32_RC_FLAGS)=0D
  *_GCC49_IA32_OBJCOPY_FLAGS        =3D=0D
@@ -70,7 +72,7 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  =0D
    DEBUG_GCC49_IA32_CC_FLAGS       =3D DEF(GCC49_IA32_CC_FLAGS)=0D
  RELEASE_GCC49_IA32_CC_FLAGS       =3D DEF(GCC49_IA32_CC_FLAGS) -Wno-unuse=
d-but-set-variable -Wno-unused-const-variable=0D
-@@ -1260,7 +1260,7 @@ RELEASE_GCC49_IA32_CC_FLAGS       =3D DEF(
+@@ -1257,7 +1257,7 @@ RELEASE_GCC49_IA32_CC_FLAGS       =3D DEF(GCC49_IA32=
_CC_FLAGS) -Wno-unused-but-set
  *_GCC49_X64_DLINK2_FLAGS         =3D DEF(GCC49_X64_DLINK2_FLAGS)=0D
  *_GCC49_X64_RC_FLAGS             =3D DEF(GCC_X64_RC_FLAGS)=0D
  *_GCC49_X64_OBJCOPY_FLAGS        =3D=0D
@@ -79,7 +81,7 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  =0D
    DEBUG_GCC49_X64_CC_FLAGS       =3D DEF(GCC49_X64_CC_FLAGS)=0D
  RELEASE_GCC49_X64_CC_FLAGS       =3D DEF(GCC49_X64_CC_FLAGS) -Wno-unused-=
but-set-variable -Wno-unused-const-variable=0D
-@@ -1519,7 +1519,7 @@ RELEASE_GCCNOLTO_AARCH64_DLINK_XIPFLAGS
+@@ -1516,7 +1516,7 @@ RELEASE_GCCNOLTO_AARCH64_DLINK_XIPFLAGS =3D -z commo=
n-page-size=3D0x20
  *_GCC5_IA32_DLINK2_FLAGS         =3D DEF(GCC5_IA32_DLINK2_FLAGS) -no-pie=
=0D
  *_GCC5_IA32_RC_FLAGS             =3D DEF(GCC_IA32_RC_FLAGS)=0D
  *_GCC5_IA32_OBJCOPY_FLAGS        =3D=0D
@@ -88,7 +90,7 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  =0D
    DEBUG_GCC5_IA32_CC_FLAGS       =3D DEF(GCC5_IA32_CC_FLAGS) -flto=0D
    DEBUG_GCC5_IA32_DLINK_FLAGS    =3D DEF(GCC5_IA32_X64_DLINK_FLAGS) -flto=
 -Os -Wl,-m,elf_i386,--oformat=3Delf32-i386=0D
-@@ -1551,7 +1551,7 @@ RELEASE_GCC5_IA32_DLINK_FLAGS    =3D DEF(G
+@@ -1548,7 +1548,7 @@ RELEASE_GCC5_IA32_DLINK_FLAGS    =3D DEF(GCC5_IA32_X=
64_DLINK_FLAGS) -flto -Os -Wl,
  *_GCC5_X64_DLINK2_FLAGS          =3D DEF(GCC5_X64_DLINK2_FLAGS)=0D
  *_GCC5_X64_RC_FLAGS              =3D DEF(GCC_X64_RC_FLAGS)=0D
  *_GCC5_X64_OBJCOPY_FLAGS         =3D=0D
diff --git a/meta/recipes-core/ovmf/ovmf/0004-reproducible.patch b/meta/rec=
ipes-core/ovmf/ovmf/0004-reproducible.patch
index 0ddb86f530d..73f242321e4 100644
--- a/meta/recipes-core/ovmf/ovmf/0004-reproducible.patch
+++ b/meta/recipes-core/ovmf/ovmf/0004-reproducible.patch
@@ -1,7 +1,7 @@
-From fc2d3c17ff2a7b39e8d47b788eeaac5e1487cdee Mon Sep 17 00:00:00 2001
+From 0d22e07cd9cc35ede04c01d3141068db744d7677 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Mon, 14 Jun 2021 19:57:30 +0200
-Subject: [PATCH 4/4] reproducible
+Subject: [PATCH] reproducible
=20
 This patch fixes various things which make the build more reproducible. So=
me changes
 here only change intermediate artefacts but that means when you have two b=
uild trees
@@ -34,9 +34,11 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  .../Source/Python/AutoGen/ModuleAutoGen.py    |  5 +++-
  4 files changed, 24 insertions(+), 16 deletions(-)
=20
+diff --git a/BaseTools/Source/C/GenFw/Elf64Convert.c b/BaseTools/Source/C/=
GenFw/Elf64Convert.c
+index 18594122ea..92b5f13cf6 100644
 --- a/BaseTools/Source/C/GenFw/Elf64Convert.c
 +++ b/BaseTools/Source/C/GenFw/Elf64Convert.c
-@@ -15,6 +15,8 @@ SPDX-License-Identifier: BSD-2-Clause-Pa
+@@ -15,6 +15,8 @@ SPDX-License-Identifier: BSD-2-Clause-Patent
  #include <windows.h>=0D
  #undef RUNTIME_FUNCTION=0D
  #include <io.h>=0D
@@ -54,7 +56,7 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  =0D
    //=0D
    // Add more space in the .debug data region for the DllCharacteristicsE=
x=0D
-@@ -2310,7 +2312,7 @@ WriteDebug64 (
+@@ -2322,7 +2324,7 @@ WriteDebug64 (
    EFI_IMAGE_DEBUG_CODEVIEW_NB10_ENTRY         *Nb10;=0D
    EFI_IMAGE_DEBUG_EX_DLLCHARACTERISTICS_ENTRY *DllEntry;=0D
  =0D
@@ -63,7 +65,7 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  =0D
    NtHdr =3D (EFI_IMAGE_OPTIONAL_HEADER_UNION *)(mCoffFile + mNtHdrOffset)=
;=0D
    DataDir =3D &NtHdr->Pe32Plus.OptionalHeader.DataDirectory[EFI_IMAGE_DIR=
ECTORY_ENTRY_DEBUG];=0D
-@@ -2343,7 +2345,7 @@ WriteDebug64 (
+@@ -2355,7 +2357,7 @@ WriteDebug64 (
  =0D
    Nb10 =3D (EFI_IMAGE_DEBUG_CODEVIEW_NB10_ENTRY*)(Dir + 1);=0D
    Nb10->Signature =3D CODEVIEW_SIGNATURE_NB10;=0D
@@ -72,6 +74,8 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  }=0D
  =0D
  STATIC=0D
+diff --git a/BaseTools/Source/Python/AutoGen/BuildEngine.py b/BaseTools/So=
urce/Python/AutoGen/BuildEngine.py
+index b829a2503c..afe826b78f 100644
 --- a/BaseTools/Source/Python/AutoGen/BuildEngine.py
 +++ b/BaseTools/Source/Python/AutoGen/BuildEngine.py
 @@ -70,6 +70,9 @@ class TargetDescBlock(object):
@@ -84,9 +88,11 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
      def AddInput(self, Input):=0D
          if Input not in self.Inputs:=0D
              self.Inputs.append(Input)=0D
+diff --git a/BaseTools/Source/Python/AutoGen/GenMake.py b/BaseTools/Source=
/Python/AutoGen/GenMake.py
+index e5f282c4ac..27a34ef7c6 100755
 --- a/BaseTools/Source/Python/AutoGen/GenMake.py
 +++ b/BaseTools/Source/Python/AutoGen/GenMake.py
-@@ -576,7 +576,7 @@ cleanlib:
+@@ -571,7 +571,7 @@ cleanlib:
                  os.remove(RespFileList)=0D
  =0D
          # convert source files and binary files to build targets=0D
@@ -95,7 +101,7 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
          if len(self.ResultFileList) =3D=3D 0 and len(MyAgo.SourceFileList=
) !=3D 0:=0D
              EdkLogger.error("build", AUTOGEN_ERROR, "Nothing to build",=0D
                              ExtraData=3D"[%s]" % str(MyAgo))=0D
-@@ -727,7 +727,7 @@ cleanlib:
+@@ -722,7 +722,7 @@ cleanlib:
          OutputFile =3D ''=0D
          DepsFileList =3D []=0D
  =0D
@@ -104,7 +110,7 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.co=
m>
              if Cmd[2]:=0D
                  for CopyCmd in Cmd[2]:=0D
                      Src, Dst =3D CopyCmd=0D
-@@ -760,7 +760,7 @@ cleanlib:
+@@ -755,7 +755,7 @@ cleanlib:
              self.BuildTargetList.append('\t%s' % CmdString)=0D
  =0D
              self.ParseSecCmd(DepsFileList, Cmd[1])=0D
@@ -113,7 +119,7 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.co=
m>
                  self.BuildTargetList.append('%s : %s' % (self.ReplaceMacr=
o(SecOutputFile), self.ReplaceMacro(SecDepsFile)))=0D
                  self.BuildTargetList.append('\t%s' % self.ReplaceMacro(Se=
cCmd))=0D
              self.FfsOutputFileList =3D []=0D
-@@ -799,13 +799,13 @@ cleanlib:
+@@ -794,13 +794,13 @@ cleanlib:
  =0D
      def CommandExceedLimit(self):=0D
          FlagDict =3D {=0D
@@ -134,7 +140,7 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.co=
m>
                     }=0D
  =0D
          RespDict =3D {}=0D
-@@ -1019,9 +1019,9 @@ cleanlib:
+@@ -1014,9 +1014,9 @@ cleanlib:
                  if not self.ObjTargetDict.get(T.Target.SubDir):=0D
                      self.ObjTargetDict[T.Target.SubDir] =3D set()=0D
                  self.ObjTargetDict[T.Target.SubDir].add(NewFile)=0D
@@ -146,9 +152,11 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.c=
om>
                  # Generate related macros if needed=0D
                  if T.GenFileListMacro and T.FileListMacro not in self.Fil=
eListMacros:=0D
                      self.FileListMacros[T.FileListMacro] =3D []=0D
+diff --git a/BaseTools/Source/Python/AutoGen/ModuleAutoGen.py b/BaseTools/=
Source/Python/AutoGen/ModuleAutoGen.py
+index aa0b71632e..57c9cad117 100755
 --- a/BaseTools/Source/Python/AutoGen/ModuleAutoGen.py
 +++ b/BaseTools/Source/Python/AutoGen/ModuleAutoGen.py
-@@ -1474,6 +1474,9 @@ class ModuleAutoGen(AutoGen):
+@@ -1429,6 +1429,9 @@ class ModuleAutoGen(AutoGen):
              for File in Files:=0D
                  if File.lower().endswith('.pdb'):=0D
                      AsBuiltInfDict['binary_item'].append('DISPOSABLE|' + =
File)=0D
@@ -158,7 +166,7 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.co=
m>
          HeaderComments =3D self.Module.HeaderComments=0D
          StartPos =3D 0=0D
          for Index in range(len(HeaderComments)):=0D
-@@ -1749,7 +1752,7 @@ class ModuleAutoGen(AutoGen):
+@@ -1704,7 +1707,7 @@ class ModuleAutoGen(AutoGen):
              if os.path.exists (self.TimeStampPath):=0D
                  os.remove (self.TimeStampPath)=0D
  =0D
diff --git a/meta/recipes-core/ovmf/ovmf/CVE-2024-38797-1.patch b/meta/reci=
pes-core/ovmf/ovmf/CVE-2024-38797-1.patch
deleted file mode 100644
index 066dfa0ff0a..00000000000
--- a/meta/recipes-core/ovmf/ovmf/CVE-2024-38797-1.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From 2c8fb3e5164effc8a370e800fe91db7341e69116 Mon Sep 17 00:00:00 2001
-From: Doug Flick <dougflick@microsoft.com>
-Date: Mon, 7 Apr 2025 11:23:41 -0700
-Subject: [PATCH 1/4] SecurityPkg: Update SecurityFixes.yaml for CVE-2024-3=
8797
-
-This commit updates the SecurityFixes.yaml file to include
-information about the CVE-2024-38797 vulnerability.
-
-Signed-off-by: Doug Flick <DougFlick@microsoft.com>
-
-CVE: CVE-2024-38797
-Upstream-Status: Backport [https://github.com/tianocore/edk2/pull/10928/co=
mmits/519366f542e9370bee982b1c3687ffedb5cabc21]
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
----
- SecurityPkg/SecurityFixes.yaml | 15 +++++++++++++++
- 1 file changed, 15 insertions(+)
-
-diff --git a/SecurityPkg/SecurityFixes.yaml b/SecurityPkg/SecurityFixes.ya=
ml
-index b4006b4..06b597a 100644
---- a/SecurityPkg/SecurityFixes.yaml
-+++ b/SecurityPkg/SecurityFixes.yaml
-@@ -40,3 +40,18 @@ CVE_2022_36764:
-     - Library\DxeTpmMeasureBootLib\DxeTpmMeasureBootLib.c=0D
-   links:=0D
-     - https://bugzilla.tianocore.org/show_bug.cgi?id=3D4118=0D
-+CVE_2024_38797:=0D
-+  commit-titles:=0D
-+    - "SecurityPkg: Out of bound read in HashPeImageByType()"=0D
-+    - "SecurityPkg: Improving HashPeImageByType () logic"=0D
-+    - "SecurityPkg: Improving SecureBootConfigImpl:HashPeImageByType () l=
ogic"=0D
-+  cve: CVE-2024-38797=0D
-+  date_reported: 2024-06-04 12:00 UTC=0D
-+  description: Out of bound read in HashPeImageByType()=0D
-+  note:=0D
-+  files_impacted:=0D
-+    - SecurityPkg\Library\DxeImageVerificationLib\DxeImageVerificationLib=
.c=0D
-+    - SecurityPkg\VariableAuthenticated\SecureBootConfigDxe\SecureBootCon=
figImpl.c=0D
-+  links:=0D
-+    - https://bugzilla.tianocore.org/show_bug.cgi?id=3D2214=0D
-+    - https://github.com/tianocore/edk2/security/advisories/GHSA-4wjw-6xm=
f-44xf=0D
---=20
-2.34.1
-
diff --git a/meta/recipes-core/ovmf/ovmf/CVE-2024-38797-2.patch b/meta/reci=
pes-core/ovmf/ovmf/CVE-2024-38797-2.patch
deleted file mode 100644
index 9bf66456813..00000000000
--- a/meta/recipes-core/ovmf/ovmf/CVE-2024-38797-2.patch
+++ /dev/null
@@ -1,63 +0,0 @@
-From 1a7be26382c4a34504875f094e15fe371d44192e Mon Sep 17 00:00:00 2001
-From: Doug Flick <dougflick@microsoft.com>
-Date: Thu, 3 Oct 2024 09:37:18 -0700
-Subject: [PATCH 2/4] SecurityPkg: Out of bound read in HashPeImageByType()
-
-In HashPeImageByType(), the hash of PE/COFF image is calculated.
-This function may get untrusted input.
-
-Inside this function, the following code verifies the loaded image has
-the correct format, by reading the second byte of the buffer.
-
-```c
-  if ((*(AuthData + 1) & TWO_BYTE_ENCODE) !=3D TWO_BYTE_ENCODE) {
-  	...
-  }
-```
-
-The input image is not trusted and that may not have the second byte to
-read. So this poses an out of bound read error.
-
-With below fix we are assuring that we don't do out of bound read. i.e,
-we make sure that AuthDataSize is greater than 1.
-
-```c
-  if (AuthDataSize > 1
-      && (*(AuthData + 1) & TWO_BYTE_ENCODE) !=3D TWO_BYTE_ENCODE){
-    ...
-  }
-```
-
-AuthDataSize size is verified before reading the second byte.
-So if AuthDataSize is less than 2, the second byte will not be read, and
-the out of bound read situation won't occur.
-
-Tested the patch on real platform with and without TPM connected and
-verified image is booting fine.
-
-Authored-by: Raj AlwinX Selvaraj <Alw...@intel.com>
-Signed-off-by: Doug Flick <DougFlick@microsoft.com>
-
-CVE: CVE-2024-38797
-Upstream-Status: Backport [https://github.com/tianocore/edk2/pull/10928/co=
mmits/2dcdb41b564aa3cb846644b4b1722a0b3ae5e06b]
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
----
- .../Library/DxeImageVerificationLib/DxeImageVerificationLib.c   | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/SecurityPkg/Library/DxeImageVerificationLib/DxeImageVerificat=
ionLib.c b/SecurityPkg/Library/DxeImageVerificationLib/DxeImageVerification=
Lib.c
-index b05da19..2afa2c9 100644
---- a/SecurityPkg/Library/DxeImageVerificationLib/DxeImageVerificationLib.c
-+++ b/SecurityPkg/Library/DxeImageVerificationLib/DxeImageVerificationLib.c
-@@ -642,7 +642,7 @@ HashPeImageByType (
-     //    This field has the fixed offset (+32) in final Authenticode ASN=
.1 data.=0D
-     //    Fixed offset (+32) is calculated based on two bytes of length e=
ncoding.=0D
-     //=0D
--    if ((*(AuthData + 1) & TWO_BYTE_ENCODE) !=3D TWO_BYTE_ENCODE) {=0D
-+    if ((AuthDataSize > 1) && ((*(AuthData + 1) & TWO_BYTE_ENCODE) !=3D T=
WO_BYTE_ENCODE)) {=0D
-       //=0D
-       // Only support two bytes of Long Form of Length Encoding.=0D
-       //=0D
---=20
-2.34.1
-
diff --git a/meta/recipes-core/ovmf/ovmf/CVE-2024-38797-3.patch b/meta/reci=
pes-core/ovmf/ovmf/CVE-2024-38797-3.patch
deleted file mode 100644
index 169c78daab1..00000000000
--- a/meta/recipes-core/ovmf/ovmf/CVE-2024-38797-3.patch
+++ /dev/null
@@ -1,99 +0,0 @@
-From 4db363db013a92937431234252fc9d84e44fc120 Mon Sep 17 00:00:00 2001
-From: Doug Flick <dougflick@microsoft.com>
-Date: Thu, 3 Oct 2024 10:16:57 -0700
-Subject: [PATCH 3/4] SecurityPkg: Improving HashPeImageByType () logic
-
-Namely:
-
-(1) The TWO_BYTE_ENCODE check is independent of Index. If it evalutes
-    to TRUE for Index=3D=3D0, then it will evaluate to TRUE for all other
-    Index values as well. As a result, the (Index =3D=3D HASHALG_MAX)
-    condition will fire after the loop, and we'll return
-    EFI_UNSUPPORTED.
-
-    While this is correct, functionally speaking, it is wasteful to
-    keep re-checking TWO_BYTE_ENCODE in the loop body. The check
-    should be made at the top of the function, and EFI_UNSUPPORTED
-    should be returned at once, if appropriate.
-
-(2) If the hash algorithm selected by Index has such a large OID that
-    the OID comparison cannot even be performed (because AuthDataSize
-    is not large enough for containing the OID in question, starting
-    at offset 32), then the function returns EFI_UNSUPPORTED at once.
-
-    This is bogus; this case should simply be treated as an OID
-    mismatch, and the loop should advance to the next Index value /
-    hash algorithm candidate. A remaining hash algo may have a shorter
-    OID and yield an OID match.
-
-Signed-off-by: Doug Flick <DougFlick@microsoft.com>
-
-CVE: CVE-2024-38797
-Upstream-Status: Backport [https://github.com/tianocore/edk2/pull/10928/co=
mmits/5df518ec510324f48ed1cf0376150960644b41f0]
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
----
- .../DxeImageVerificationLib.c                 | 37 ++++++++++---------
- 1 file changed, 19 insertions(+), 18 deletions(-)
-
-diff --git a/SecurityPkg/Library/DxeImageVerificationLib/DxeImageVerificat=
ionLib.c b/SecurityPkg/Library/DxeImageVerificationLib/DxeImageVerification=
Lib.c
-index 2afa2c9..2eca39d 100644
---- a/SecurityPkg/Library/DxeImageVerificationLib/DxeImageVerificationLib.c
-+++ b/SecurityPkg/Library/DxeImageVerificationLib/DxeImageVerificationLib.c
-@@ -618,6 +618,7 @@ Done:
-   @param[in]  AuthDataSize        Size of the Authenticode Signature in b=
ytes.=0D
- =0D
-   @retval EFI_UNSUPPORTED             Hash algorithm is not supported.=0D
-+  @retval EFI_BAD_BUFFER_SIZE         AuthData provided is invalid size.=
=0D
-   @retval EFI_SUCCESS                 Hash successfully.=0D
- =0D
- **/=0D
-@@ -629,28 +630,28 @@ HashPeImageByType (
- {=0D
-   UINT8  Index;=0D
- =0D
--  for (Index =3D 0; Index < HASHALG_MAX; Index++) {=0D
-+  //=0D
-+  // Check the Hash algorithm in PE/COFF Authenticode.=0D
-+  //    According to PKCS#7 Definition:=0D
-+  //        SignedData ::=3D SEQUENCE {=0D
-+  //            version Version,=0D
-+  //            digestAlgorithms DigestAlgorithmIdentifiers,=0D
-+  //            contentInfo ContentInfo,=0D
-+  //            .... }=0D
-+  //    The DigestAlgorithmIdentifiers can be used to determine the hash =
algorithm in PE/COFF hashing=0D
-+  //    This field has the fixed offset (+32) in final Authenticode ASN.1=
 data.=0D
-+  //    Fixed offset (+32) is calculated based on two bytes of length enc=
oding.=0D
-+  //=0D
-+  if ((AuthDataSize > 1) && ((*(AuthData + 1) & TWO_BYTE_ENCODE) !=3D TWO=
_BYTE_ENCODE)) {=0D
-     //=0D
--    // Check the Hash algorithm in PE/COFF Authenticode.=0D
--    //    According to PKCS#7 Definition:=0D
--    //        SignedData ::=3D SEQUENCE {=0D
--    //            version Version,=0D
--    //            digestAlgorithms DigestAlgorithmIdentifiers,=0D
--    //            contentInfo ContentInfo,=0D
--    //            .... }=0D
--    //    The DigestAlgorithmIdentifiers can be used to determine the has=
h algorithm in PE/COFF hashing=0D
--    //    This field has the fixed offset (+32) in final Authenticode ASN=
.1 data.=0D
--    //    Fixed offset (+32) is calculated based on two bytes of length e=
ncoding.=0D
-+    // Only support two bytes of Long Form of Length Encoding.=0D
-     //=0D
--    if ((AuthDataSize > 1) && ((*(AuthData + 1) & TWO_BYTE_ENCODE) !=3D T=
WO_BYTE_ENCODE)) {=0D
--      //=0D
--      // Only support two bytes of Long Form of Length Encoding.=0D
--      //=0D
--      continue;=0D
--    }=0D
-+    return EFI_BAD_BUFFER_SIZE;=0D
-+  }=0D
- =0D
-+  for (Index =3D 0; Index < HASHALG_MAX; Index++) {=0D
-     if (AuthDataSize < 32 + mHash[Index].OidLength) {=0D
--      return EFI_UNSUPPORTED;=0D
-+      continue;=0D
-     }=0D
- =0D
-     if (CompareMem (AuthData + 32, mHash[Index].OidValue, mHash[Index].Oi=
dLength) =3D=3D 0) {=0D
---=20
-2.34.1
-
diff --git a/meta/recipes-core/ovmf/ovmf/CVE-2024-38797-4.patch b/meta/reci=
pes-core/ovmf/ovmf/CVE-2024-38797-4.patch
deleted file mode 100644
index 86bc950e7da..00000000000
--- a/meta/recipes-core/ovmf/ovmf/CVE-2024-38797-4.patch
+++ /dev/null
@@ -1,97 +0,0 @@
-From cb3342702c5c1f8a4ddbb6d503a98ed720d14eb3 Mon Sep 17 00:00:00 2001
-From: Doug Flick <dougflick@microsoft.com>
-Date: Fri, 17 Jan 2025 11:30:17 -0800
-Subject: [PATCH 4/4] SecurityPkg: Improving
- SecureBootConfigImpl:HashPeImageByType () logic
-
-Namely:
-
-(1) The TWO_BYTE_ENCODE check is independent of Index. If it evalutes
-    to TRUE for Index=3D=3D0, then it will evaluate to TRUE for all other
-    Index values as well. As a result, the (Index =3D=3D HASHALG_MAX)
-    condition will fire after the loop, and we'll return
-    EFI_UNSUPPORTED.
-
-    While this is correct, functionally speaking, it is wasteful to
-    keep re-checking TWO_BYTE_ENCODE in the loop body. The check
-    should be made at the top of the function, and EFI_UNSUPPORTED
-    should be returned at once, if appropriate.
-
-(2) If the hash algorithm selected by Index has such a large OID that
-    the OID comparison cannot even be performed (because AuthDataSize
-    is not large enough for containing the OID in question, starting
-    at offset 32), then the function returns EFI_UNSUPPORTED at once.
-
-    This is bogus; this case should simply be treated as an OID
-    mismatch, and the loop should advance to the next Index value /
-    hash algorithm candidate. A remaining hash algo may have a shorter
-    OID and yield an OID match.
-
-Signed-off-by: Doug Flick <DougFlick@microsoft.com>
-
-CVE: CVE-2024-38797
-Upstream-Status: Backport [https://github.com/tianocore/edk2/pull/10928/co=
mmits/8676572908b950dd4d1f8985006011be99c0a5b6]
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
----
- .../SecureBootConfigImpl.c                    | 37 +++++++++++--------
- 1 file changed, 21 insertions(+), 16 deletions(-)
-
-diff --git a/SecurityPkg/VariableAuthenticated/SecureBootConfigDxe/SecureB=
ootConfigImpl.c b/SecurityPkg/VariableAuthenticated/SecureBootConfigDxe/Sec=
ureBootConfigImpl.c
-index 6d4560c..155e755 100644
---- a/SecurityPkg/VariableAuthenticated/SecureBootConfigDxe/SecureBootConf=
igImpl.c
-+++ b/SecurityPkg/VariableAuthenticated/SecureBootConfigDxe/SecureBootConf=
igImpl.c
-@@ -2096,30 +2096,35 @@ HashPeImageByType (
- {=0D
-   UINT8                     Index;=0D
-   WIN_CERTIFICATE_EFI_PKCS  *PkcsCertData;=0D
-+  UINT32                    PkcsCertSize;=0D
- =0D
-   PkcsCertData =3D (WIN_CERTIFICATE_EFI_PKCS *)(mImageBase + mSecDataDir-=
>Offset);=0D
-+  PkcsCertSize =3D mSecDataDir->SizeOfCert;=0D
- =0D
--  for (Index =3D 0; Index < HASHALG_MAX; Index++) {=0D
-+  //=0D
-+  // Check the Hash algorithm in PE/COFF Authenticode.=0D
-+  //    According to PKCS#7 Definition:=0D
-+  //        SignedData ::=3D SEQUENCE {=0D
-+  //            version Version,=0D
-+  //            digestAlgorithms DigestAlgorithmIdentifiers,=0D
-+  //            contentInfo ContentInfo,=0D
-+  //            .... }=0D
-+  //    The DigestAlgorithmIdentifiers can be used to determine the hash =
algorithm in PE/COFF hashing=0D
-+  //    This field has the fixed offset (+32) in final Authenticode ASN.1=
 data.=0D
-+  //    Fixed offset (+32) is calculated based on two bytes of length enc=
oding.=0D
-+  //=0D
-+  if ((PkcsCertSize > 1) && ((*(PkcsCertData->CertData + 1) & TWO_BYTE_EN=
CODE) !=3D TWO_BYTE_ENCODE)) {=0D
-     //=0D
--    // Check the Hash algorithm in PE/COFF Authenticode.=0D
--    //    According to PKCS#7 Definition:=0D
--    //        SignedData ::=3D SEQUENCE {=0D
--    //            version Version,=0D
--    //            digestAlgorithms DigestAlgorithmIdentifiers,=0D
--    //            contentInfo ContentInfo,=0D
--    //            .... }=0D
--    //    The DigestAlgorithmIdentifiers can be used to determine the has=
h algorithm in PE/COFF hashing=0D
--    //    This field has the fixed offset (+32) in final Authenticode ASN=
.1 data.=0D
--    //    Fixed offset (+32) is calculated based on two bytes of length e=
ncoding.=0D
-+    // Only support two bytes of Long Form of Length Encoding.=0D
-     //=0D
--    if ((*(PkcsCertData->CertData + 1) & TWO_BYTE_ENCODE) !=3D TWO_BYTE_E=
NCODE) {=0D
--      //=0D
--      // Only support two bytes of Long Form of Length Encoding.=0D
--      //=0D
-+    return EFI_BAD_BUFFER_SIZE;=0D
-+  }=0D
-+=0D
-+  for (Index =3D 0; Index < HASHALG_MAX; Index++) {=0D
-+    if (PkcsCertSize < 32 + mHash[Index].OidLength) {=0D
-       continue;=0D
-     }=0D
- =0D
--    //=0D
-     if (CompareMem (PkcsCertData->CertData + 32, mHash[Index].OidValue, m=
Hash[Index].OidLength) =3D=3D 0) {=0D
-       break;=0D
-     }=0D
---=20
-2.34.1
-
diff --git a/meta/recipes-core/ovmf/ovmf/CVE-2025-2295.patch b/meta/recipes=
-core/ovmf/ovmf/CVE-2025-2295.patch
deleted file mode 100644
index 038a3f2dbc7..00000000000
--- a/meta/recipes-core/ovmf/ovmf/CVE-2025-2295.patch
+++ /dev/null
@@ -1,56 +0,0 @@
-From 4b028816b5619ede6c3720664478055e09151516 Mon Sep 17 00:00:00 2001
-From: Madhavan <madavtechy@gmail.com>
-Date: Fri, 14 Mar 2025 14:15:13 -0400
-Subject: [PATCH] NetworkPkg/IScsiDxe:Fix for Remote Memory Exposure in ISC=
SI
- bz4206
-
-Used SafeUint32Add to calculate and validate OutTransferLength with
-boundary check in IScsiOnR2TRcvd to avoid integer overflow
-
-Signed-off-by: Madhavan <madavtechy@gmail.com>
-
-CVE: CVE-2025-2295
-Upstream-Status: Backport [https://github.com/tianocore/edk2/commit/17cdc5=
12f02a2dfd1b9e24133da56fdda099abda]
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
----
- NetworkPkg/IScsiDxe/IScsiProto.c | 10 ++++++++--
- 1 file changed, 8 insertions(+), 2 deletions(-)
-
-diff --git a/NetworkPkg/IScsiDxe/IScsiProto.c b/NetworkPkg/IScsiDxe/IScsiP=
roto.c
-index ef587649a0..fb48e6304d 100644
---- a/NetworkPkg/IScsiDxe/IScsiProto.c
-+++ b/NetworkPkg/IScsiDxe/IScsiProto.c
-@@ -1,7 +1,7 @@
- /** @file=0D
-   The implementation of iSCSI protocol based on RFC3720.=0D
- =0D
--Copyright (c) 2004 - 2018, Intel Corporation. All rights reserved.<BR>=0D
-+Copyright (c) 2004 - 2025, Intel Corporation. All rights reserved.<BR>=0D
- SPDX-License-Identifier: BSD-2-Clause-Patent=0D
- =0D
- **/=0D
-@@ -2682,6 +2682,7 @@ IScsiOnR2TRcvd (
-   EFI_STATUS               Status;=0D
-   ISCSI_XFER_CONTEXT       *XferContext;=0D
-   UINT8                    *Data;=0D
-+  UINT32                   TransferLength;=0D
- =0D
-   R2THdr =3D (ISCSI_READY_TO_TRANSFER *)NetbufGetByte (Pdu, 0, NULL);=0D
-   if (R2THdr =3D=3D NULL) {=0D
-@@ -2712,7 +2713,12 @@ IScsiOnR2TRcvd (
-   XferContext->Offset            =3D R2THdr->BufferOffset;=0D
-   XferContext->DesiredLength     =3D R2THdr->DesiredDataTransferLength;=0D
- =0D
--  if (((XferContext->Offset + XferContext->DesiredLength) > Packet->OutTr=
ansferLength) ||=0D
-+  Status =3D SafeUint32Add (XferContext->Offset, XferContext->DesiredLeng=
th, &TransferLength);=0D
-+  if (EFI_ERROR (Status)) {=0D
-+    return EFI_PROTOCOL_ERROR;=0D
-+  }=0D
-+=0D
-+  if ((TransferLength > Packet->OutTransferLength) ||=0D
-       (XferContext->DesiredLength > Tcb->Conn->Session->MaxBurstLength)=0D
-       )=0D
-   {=0D
---=20
-2.48.1
-
diff --git a/meta/recipes-core/ovmf/ovmf_git.bb b/meta/recipes-core/ovmf/ov=
mf_git.bb
index a8efcc2a462..577310a6782 100644
--- a/meta/recipes-core/ovmf/ovmf_git.bb
+++ b/meta/recipes-core/ovmf/ovmf_git.bb
@@ -20,21 +20,15 @@ PACKAGECONFIG[tpm] =3D "-D TPM_ENABLE=3DTRUE,-D TPM_ENA=
BLE=3DFALSE,,"
 #see https://src.fedoraproject.org/rpms/edk2/blob/rawhide/f/0032-Basetools=
-turn-off-gcc12-warning.patch
 BUILD_CFLAGS +=3D "-Wno-error=3Dstringop-overflow"
=20
-SRC_URI =3D "gitsm://github.com/tianocore/edk2.git;branch=3Dmaster;protoco=
l=3Dhttps \
+SRC_URI =3D "gitsm://github.com/tianocore/edk2.git;branch=3Dmaster;protoco=
l=3Dhttps;tag=3D${PV} \
            file://0001-ovmf-update-path-to-native-BaseTools.patch \
            file://0002-BaseTools-makefile-adjust-to-build-in-under-bitbake=
.patch \
            file://0003-debug-prefix-map.patch \
            file://0004-reproducible.patch \
-           file://CVE-2025-2295.patch \
-           file://CVE-2024-38797-1.patch \
-           file://CVE-2024-38797-2.patch \
-           file://CVE-2024-38797-3.patch \
-           file://CVE-2024-38797-4.patch \
-           file://0001-SecurityPkg-Don-t-define-bool-type-if-building-in-C=
2.patch \
            "
=20
-PV =3D "edk2-stable202502"
-SRCREV =3D "fbe0805b2091393406952e84724188f8c1941837"
+PV =3D "edk2-stable202508"
+SRCREV =3D "d46aa46c8361194521391aa581593e556c707c6e"
 UPSTREAM_CHECK_GITTAGREGEX =3D "(?P<pver>edk2-stable.*)"
=20
 CVE_PRODUCT =3D "edk2"
--=20
2.39.5


