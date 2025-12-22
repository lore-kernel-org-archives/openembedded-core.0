Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AB29E6ADC7
	for <webhook@archiver.kernel.org>; Mon, 22 Dec 2025 20:08:26 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.87800.1766434100788936424
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Dec 2025 12:08:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NK4EUhul;
 spf=pass (domain: gmail.com, ip: 209.85.218.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-b7eff205947so612856266b.1
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 12:08:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766434099; x=1767038899; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ohNLSatPtps/+jxMmLJaLZY6Aa+vRVOPVFspEpFO6/M=;
        b=NK4EUhulTxPry7PB7m0GMuxdzSfDf5QpHYRiB4tfn+Jrnsun7aZjXcFc36gu//NBvM
         754e/I16cQHBgVAjuCiMmHdEhhxYiFl9rzKVOKfxQA+6ZX7ytPirU5xl9Ug7gAi5mlDF
         f1dYL9myKfkJ6J2AD2EsJE/5u9u0MRSJdY4hFE0ePWkVsLiwYmw+6bVZFIFHmHwzHZEQ
         xNZHFSv2QwxnOIoOnTNkXFmbc3s0npePd4ZUw+YIz+P0ZJbgxCjQtyGb0YAeTDNSZJu+
         /FPYZdwl7zipDBlcId9RJInDO0x9RQqjo7Nna4cJuK8PmgP3xOzYugF1MGl2EYkk1K6i
         SYPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766434099; x=1767038899;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ohNLSatPtps/+jxMmLJaLZY6Aa+vRVOPVFspEpFO6/M=;
        b=dMuJC1PF9rKExG8bsyRE4a1Rwu2lrJ8SUk0f3lr8aMeo+l6BspFYfaNP8k7a8LYo36
         9n5nn2KvgryQsPRVVrzwmD4IQfcuVFIPnebbmxGfdi3ToVc+KsBHNxTHZof9kHh1522X
         duarLZoZVJDpVE8Ole7EfA2I1sBilFJKaooeCQYr4JMUvrgAenHHvr7rYnXOdPPR2vw6
         IYXkB5RsIQeBIxzUdDbCfVSbltKKHC/FCc3vgWjibnlozY4hc2WuLUt0iG2JAQkrXAQ0
         Ysu8HQzda0vPaD4Mh3qPM/Brtnq0Rpbdb9escWpNN5b6lS288z80iu+5CLylAvsHkwn9
         uYTA==
X-Gm-Message-State: AOJu0YzwfGFEXhs6AttlyRX0OE2XlUnmZCb4+TrgDZEmexoEECvJnwjm
	FN5KYuWVKnrNg8UchLTg8+qmRPfikS2ksDFzbu+RJoFyYJyVviJIy9ExCvfwYg==
X-Gm-Gg: AY/fxX6pdTvku7iWvnsJWqUeqZzLfDJzQcgfoTN6fIJyMgmmxvGwTVhI02zsfQQHH8K
	FRIJjqliTdfG09BkLpWxIQIu9W7UqGNrxyt6lBWmpVqUfqvgYTqXpQNE0VsAB8JEYCNz2dSlsyf
	gXgJuLQgnESBMxvB797F9uKdmEtoPypJ67l57DbicYMIBYHIe/f52L7TCcQOFAkE6sBxY1EaUdW
	t0WFEhxNOd9AGRv4NEjyfzqYDQ0toJhSsd4q0wfU4okLH5F5dljE3tiflMGLtYC/AsveVqBSyGl
	oH5+a4NdiRif7gNcB8b3cJCrxO+S5iYNsa7Pf7cifMIK2ZYOb0UtE6R93krTp5cLM8/f2t5IW1r
	8crQ6MBTRG9otEmzPMb9MkuCOggnC5Z1QRulZJDEndaMjGuMcSRSBWo5FZVYqUTmuc+AQazWiXR
	p5DmSbKeosqqXJXYs7TmZBW5hHYSpdNuPPAKw8UtWsOaYS5AI=
X-Google-Smtp-Source: AGHT+IFkTlsWQ+vvJtL2B+6D3x8MUieM2zxyBY8NhFnpzAAUAu39yR8BuKUNAmH6XZRdAebxEvhIGg==
X-Received: by 2002:a17:907:608d:b0:b76:f57a:b0a7 with SMTP id a640c23a62f3a-b803705129emr1465384566b.31.1766434098762;
        Mon, 22 Dec 2025 12:08:18 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037f3e271sm1182344066b.60.2025.12.22.12.08.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 12:08:18 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 047/114] ovmf: upgrade 202508 -> 202511
Date: Mon, 22 Dec 2025 21:06:29 +0100
Message-ID: <20251222200739.2278706-47-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251222200739.2278706-1-alex.kanavin@gmail.com>
References: <20251222200739.2278706-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 20:08:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228372

From: Alexander Kanavin <alex@linutronix.de>

Upstream has dropped support for 32 bit x86:
https://github.com/tianocore/edk2/commit/2a6708a786eb0f0e9b979cd93c5dc12c42=
e337a1

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...ovmf-update-path-to-native-BaseTools.patch |  9 +++--
 ...ile-adjust-to-build-in-under-bitbake.patch | 11 ++++--
 .../ovmf/ovmf/0003-debug-prefix-map.patch     | 37 ++++++++++---------
 .../ovmf/ovmf/0004-reproducible.patch         | 17 +++++----
 ...ceptionHandlerLib-fix-push-instructi.patch |  7 +++-
 meta/recipes-core/ovmf/ovmf_git.bb            | 16 +++-----
 6 files changed, 53 insertions(+), 44 deletions(-)

diff --git a/meta/recipes-core/ovmf/ovmf/0001-ovmf-update-path-to-native-Ba=
seTools.patch b/meta/recipes-core/ovmf/ovmf/0001-ovmf-update-path-to-native=
-BaseTools.patch
index 890e586210..bc70c1ab91 100644
--- a/meta/recipes-core/ovmf/ovmf/0001-ovmf-update-path-to-native-BaseTools=
.patch
+++ b/meta/recipes-core/ovmf/ovmf/0001-ovmf-update-path-to-native-BaseTools=
.patch
@@ -1,7 +1,7 @@
-From 0f859c6de2914cd984f8a0dd61471b91a2371bfa Mon Sep 17 00:00:00 2001
+From 89a7bfe82c9dea89fa7d859eb392aa414a365578 Mon Sep 17 00:00:00 2001
 From: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
 Date: Thu, 9 Jun 2016 02:23:01 -0700
-Subject: [PATCH] ovmf: update path to native BaseTools
+Subject: [PATCH 1/5] ovmf: update path to native BaseTools
=20
 BaseTools is a set of utilities to build EDK-based firmware. These utiliti=
es
 are used during the build process. Thus, they need to be built natively.
@@ -16,7 +16,7 @@ Upstream-Status: Inappropriate [oe-core cross compile spe=
cific]
  1 file changed, 1 insertion(+), 1 deletion(-)
=20
 diff --git a/OvmfPkg/build.sh b/OvmfPkg/build.sh
-index 279f0d099a..285f061bf4 100755
+index 30f4830173..ce4ffb20ab 100755
 --- a/OvmfPkg/build.sh
 +++ b/OvmfPkg/build.sh
 @@ -24,7 +24,7 @@ then
@@ -28,3 +28,6 @@ index 279f0d099a..285f061bf4 100755
    echo $EDK_TOOLS_PATH
    source edksetup.sh BaseTools
  else
+--=20
+2.47.3
+
diff --git a/meta/recipes-core/ovmf/ovmf/0002-BaseTools-makefile-adjust-to-=
build-in-under-bitbake.patch b/meta/recipes-core/ovmf/ovmf/0002-BaseTools-m=
akefile-adjust-to-build-in-under-bitbake.patch
index 4a55528571..27c4324b67 100644
--- a/meta/recipes-core/ovmf/ovmf/0002-BaseTools-makefile-adjust-to-build-i=
n-under-bitbake.patch
+++ b/meta/recipes-core/ovmf/ovmf/0002-BaseTools-makefile-adjust-to-build-i=
n-under-bitbake.patch
@@ -1,7 +1,7 @@
-From 9dbd082516fdd7100f99f0f389b8eef5ececab19 Mon Sep 17 00:00:00 2001
+From 8b4941871ccc88ed8b31eb7ffc097e1fe39fe57d Mon Sep 17 00:00:00 2001
 From: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
 Date: Fri, 26 Jul 2019 17:34:26 -0400
-Subject: [PATCH] BaseTools: makefile: adjust to build in under bitbake
+Subject: [PATCH 2/5] BaseTools: makefile: adjust to build in under bitbake
=20
 Prepend the build flags with those of bitbake. This is to build
 using the bitbake native sysroot include and library directories.
@@ -18,10 +18,10 @@ Upstream-Status: Inappropriate [needs to be converted t=
o in-recipe fixups]
  1 file changed, 7 insertions(+), 8 deletions(-)
=20
 diff --git a/BaseTools/Source/C/Makefiles/header.makefile b/BaseTools/Sour=
ce/C/Makefiles/header.makefile
-index 55a7307a5e..e36e6a8f04 100644
+index 53e73abe53..0b3f9bbb2a 100644
 --- a/BaseTools/Source/C/Makefiles/header.makefile
 +++ b/BaseTools/Source/C/Makefiles/header.makefile
-@@ -154,35 +154,34 @@ endif
+@@ -151,35 +151,34 @@ endif
  =0D
  INCLUDE =3D $(TOOL_INCLUDE) -I $(MAKEROOT) -I $(MAKEROOT)/Include/Common =
-I $(MAKEROOT)/Include/ -I $(MAKEROOT)/Include/IndustryStandard -I $(MAKERO=
OT)/Common/ -I .. -I . $(ARCH_INCLUDE)=0D
  INCLUDE +=3D -I $(EDK2_PATH)/MdePkg/Include=0D
@@ -64,3 +64,6 @@ index 55a7307a5e..e36e6a8f04 100644
  ifeq ($(HOST_ARCH), IA32)=0D
  #=0D
  # Snow Leopard  is a 32-bit and 64-bit environment. uname -m returns i386=
, but gcc defaults=0D
+--=20
+2.47.3
+
diff --git a/meta/recipes-core/ovmf/ovmf/0003-debug-prefix-map.patch b/meta=
/recipes-core/ovmf/ovmf/0003-debug-prefix-map.patch
index 1e79c23ae9..18ea24802a 100644
--- a/meta/recipes-core/ovmf/ovmf/0003-debug-prefix-map.patch
+++ b/meta/recipes-core/ovmf/ovmf/0003-debug-prefix-map.patch
@@ -1,7 +1,7 @@
-From eb6db21ed0a845dce149d17acf8673d5188adea4 Mon Sep 17 00:00:00 2001
+From 640b1e443a1b400d32d9af0c478abbbaebd491f1 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Mon, 14 Jun 2021 19:56:28 +0200
-Subject: [PATCH] debug prefix map
+Subject: [PATCH 3/5] debug prefix map
=20
 We want to pass ${DEBUG_PREFIX_MAP} to gcc commands and also pass in
  --debug-prefix-map to nasm (we carry a patch to nasm for this). The
@@ -22,30 +22,30 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.co=
m>
  1 file changed, 9 insertions(+), 9 deletions(-)
=20
 diff --git a/BaseTools/Conf/tools_def.template b/BaseTools/Conf/tools_def.=
template
-index 0caa1c9001..dd86b3249d 100755
+index 90a389bdff..1e134b299a 100755
 --- a/BaseTools/Conf/tools_def.template
 +++ b/BaseTools/Conf/tools_def.template
-@@ -920,7 +920,7 @@ NOOPT_*_*_OBJCOPY_ADDDEBUGFLAG     =3D --add-gnu-debug=
link=3D"$(DEBUG_DIR)/$(MODULE_
+@@ -833,7 +833,7 @@ NOOPT_*_*_OBJCOPY_ADDDEBUGFLAG     =3D --add-gnu-debug=
link=3D"$(DEBUG_DIR)/$(MODULE_
  *_*_*_DTC_PATH                     =3D DEF(DTC_BIN)=0D
  =0D
  # All supported GCC archs except LOONGARCH64 support -mstack-protector-gu=
ard=3Dglobal, so set that on everything except LOONGARCH64=0D
 -DEFINE GCC_ALL_CC_FLAGS            =3D -g -Os -fshort-wchar -fno-builtin =
-fno-strict-aliasing -Wall -Werror -Wno-array-bounds -include AutoGen.h -fn=
o-common -fstack-protector=0D
 +DEFINE GCC_ALL_CC_FLAGS            =3D -g -Os -fshort-wchar -fno-builtin =
-fno-strict-aliasing -Wall -Werror -Wno-array-bounds -include AutoGen.h -fn=
o-common -fstack-protector ENV(GCC_PREFIX_MAP)=0D
  DEFINE GCC_IA32_X64_CC_FLAGS       =3D -mstack-protector-guard=3Dglobal=0D
- DEFINE GCC_ARM_CC_FLAGS            =3D DEF(GCC_ALL_CC_FLAGS) -mlittle-end=
ian -mabi=3Daapcs -fno-short-enums -funsigned-char -ffunction-sections -fda=
ta-sections -fomit-frame-pointer -Wno-address -mthumb -fno-pic -fno-pie -ms=
tack-protector-guard=3Dglobal=0D
  DEFINE GCC_LOONGARCH64_CC_FLAGS    =3D DEF(GCC_ALL_CC_FLAGS) -mabi=3Dlp64=
d -fno-asynchronous-unwind-tables -Wno-address -fno-short-enums -fsigned-ch=
ar -ffunction-sections -fdata-sections=0D
-@@ -938,8 +938,8 @@ DEFINE GCC_ARM_AARCH64_ASLDLINK_FLAGS =3D -Wl,--defsym=
=3DPECOFF_HEADER_SIZE=3D0 DEF(GC
- DEFINE GCC_ARM_ASLDLINK_FLAGS      =3D DEF(GCC_ARM_DLINK_FLAGS) -Wl,--ent=
ry,ReferenceAcpiTable -u $(IMAGE_ENTRY_POINT) DEF(GCC_ARM_AARCH64_ASLDLINK_=
FLAGS)=0D
- DEFINE GCC_AARCH64_ASLDLINK_FLAGS  =3D DEF(GCC_AARCH64_DLINK_FLAGS) -Wl,-=
-entry,ReferenceAcpiTable -u $(IMAGE_ENTRY_POINT) DEF(GCC_ARM_AARCH64_ASLDL=
INK_FLAGS)=0D
+ DEFINE GCC_AARCH64_CC_FLAGS        =3D DEF(GCC_ALL_CC_FLAGS) -mlittle-end=
ian -fno-short-enums -fverbose-asm -funsigned-char  -ffunction-sections -fd=
ata-sections -Wno-address -fno-asynchronous-unwind-tables -fno-unwind-table=
s -fno-pic -fno-pie -ffixed-x18 -mstack-protector-guard=3Dglobal=0D
+@@ -845,8 +845,8 @@ DEFINE GCC_AARCH64_DLINK_FLAGS     =3D -Wl,--emit-relo=
cs -nostdlib -Wl,--gc-sectio
+ DEFINE GCC_LOONGARCH64_DLINK_FLAGS =3D DEF(GCC_LOONGARCH64_DLINK_COMMON) =
-z common-page-size=3D0x20=0D
+ DEFINE GCC_AARCH64_ASLDLINK_FLAGS  =3D DEF(GCC_AARCH64_DLINK_FLAGS) -Wl,-=
-entry,ReferenceAcpiTable -u $(IMAGE_ENTRY_POINT) -Wl,--defsym=3DPECOFF_HEA=
DER_SIZE=3D0 DEF(GCC_DLINK2_FLAGS_COMMON) -z common-page-size=3D0x20=0D
  DEFINE GCC_LOONGARCH64_ASLDLINK_FLAGS =3D DEF(GCC_LOONGARCH64_DLINK_FLAGS=
) -Wl,--entry,ReferenceAcpiTable -u $(IMAGE_ENTRY_POINT)=0D
--DEFINE GCC_ASM_FLAGS               =3D -c -x assembler -imacros AutoGen.h=
=0D
+-DEFINE GCC_ASM_FLAGS               =3D -c -x assembler=0D
 -DEFINE GCC_PP_FLAGS                =3D -E -x assembler-with-cpp -include =
AutoGen.h=0D
-+DEFINE GCC_ASM_FLAGS               =3D -c -x assembler -imacros AutoGen.h=
 ENV(GCC_PREFIX_MAP)=0D
++DEFINE GCC_ASM_FLAGS               =3D -c -x assembler ENV(GCC_PREFIX_MAP=
)=0D
 +DEFINE GCC_PP_FLAGS                =3D -E -x assembler-with-cpp -include =
AutoGen.h ENV(GCC_PREFIX_MAP)=0D
  DEFINE GCC_VFRPP_FLAGS             =3D -x c -E -DVFRCOMPILE --include $(M=
ODULE_NAME)StrDefs.h=0D
  DEFINE GCC_ASLPP_FLAGS             =3D -x c -E -include AutoGen.h=0D
- DEFINE GCC_ASLCC_FLAGS             =3D -x c=0D
-@@ -1092,7 +1092,7 @@ DEFINE GCC5_LOONGARCH64_PP_FLAGS           =3D -mabi=
=3Dlp64d -march=3Dloongarch64 DEF(
+ DEFINE GCC_ASLCC_FLAGS             =3D -x c -include AutoGen.h -fshort-wc=
har=0D
+@@ -980,7 +980,7 @@ DEFINE GCC5_LOONGARCH64_PP_FLAGS           =3D -mabi=
=3Dlp64d -march=3Dloongarch64 DEF(
  *_GCC48_IA32_DLINK2_FLAGS         =3D DEF(GCC48_IA32_DLINK2_FLAGS)=0D
  *_GCC48_IA32_RC_FLAGS             =3D DEF(GCC_IA32_RC_FLAGS)=0D
  *_GCC48_IA32_OBJCOPY_FLAGS        =3D=0D
@@ -54,7 +54,7 @@ index 0caa1c9001..dd86b3249d 100755
  =0D
    DEBUG_GCC48_IA32_CC_FLAGS       =3D DEF(GCC48_IA32_CC_FLAGS)=0D
  RELEASE_GCC48_IA32_CC_FLAGS       =3D DEF(GCC48_IA32_CC_FLAGS) -Wno-unuse=
d-but-set-variable=0D
-@@ -1120,7 +1120,7 @@ RELEASE_GCC48_IA32_CC_FLAGS       =3D DEF(GCC48_IA32=
_CC_FLAGS) -Wno-unused-but-set
+@@ -1008,7 +1008,7 @@ RELEASE_GCC48_IA32_CC_FLAGS       =3D DEF(GCC48_IA32=
_CC_FLAGS) -Wno-unused-but-set
  *_GCC48_X64_DLINK2_FLAGS         =3D DEF(GCC48_X64_DLINK2_FLAGS)=0D
  *_GCC48_X64_RC_FLAGS             =3D DEF(GCC_X64_RC_FLAGS)=0D
  *_GCC48_X64_OBJCOPY_FLAGS        =3D=0D
@@ -63,7 +63,7 @@ index 0caa1c9001..dd86b3249d 100755
  =0D
    DEBUG_GCC48_X64_CC_FLAGS       =3D DEF(GCC48_X64_CC_FLAGS)=0D
  RELEASE_GCC48_X64_CC_FLAGS       =3D DEF(GCC48_X64_CC_FLAGS) -Wno-unused-=
but-set-variable=0D
-@@ -1229,7 +1229,7 @@ RELEASE_GCC48_AARCH64_CC_FLAGS   =3D DEF(GCC48_AARCH=
64_CC_FLAGS) -Wno-unused-but-s
+@@ -1087,7 +1087,7 @@ RELEASE_GCC48_AARCH64_CC_FLAGS   =3D DEF(GCC48_AARCH=
64_CC_FLAGS) -Wno-unused-but-s
  *_GCC49_IA32_DLINK2_FLAGS         =3D DEF(GCC49_IA32_DLINK2_FLAGS)=0D
  *_GCC49_IA32_RC_FLAGS             =3D DEF(GCC_IA32_RC_FLAGS)=0D
  *_GCC49_IA32_OBJCOPY_FLAGS        =3D=0D
@@ -72,7 +72,7 @@ index 0caa1c9001..dd86b3249d 100755
  =0D
    DEBUG_GCC49_IA32_CC_FLAGS       =3D DEF(GCC49_IA32_CC_FLAGS)=0D
  RELEASE_GCC49_IA32_CC_FLAGS       =3D DEF(GCC49_IA32_CC_FLAGS) -Wno-unuse=
d-but-set-variable -Wno-unused-const-variable=0D
-@@ -1257,7 +1257,7 @@ RELEASE_GCC49_IA32_CC_FLAGS       =3D DEF(GCC49_IA32=
_CC_FLAGS) -Wno-unused-but-set
+@@ -1115,7 +1115,7 @@ RELEASE_GCC49_IA32_CC_FLAGS       =3D DEF(GCC49_IA32=
_CC_FLAGS) -Wno-unused-but-set
  *_GCC49_X64_DLINK2_FLAGS         =3D DEF(GCC49_X64_DLINK2_FLAGS)=0D
  *_GCC49_X64_RC_FLAGS             =3D DEF(GCC_X64_RC_FLAGS)=0D
  *_GCC49_X64_OBJCOPY_FLAGS        =3D=0D
@@ -81,7 +81,7 @@ index 0caa1c9001..dd86b3249d 100755
  =0D
    DEBUG_GCC49_X64_CC_FLAGS       =3D DEF(GCC49_X64_CC_FLAGS)=0D
  RELEASE_GCC49_X64_CC_FLAGS       =3D DEF(GCC49_X64_CC_FLAGS) -Wno-unused-=
but-set-variable -Wno-unused-const-variable=0D
-@@ -1516,7 +1516,7 @@ RELEASE_GCCNOLTO_AARCH64_DLINK_XIPFLAGS =3D -z commo=
n-page-size=3D0x20
+@@ -1314,7 +1314,7 @@ RELEASE_GCCNOLTO_AARCH64_DLINK_XIPFLAGS =3D -z commo=
n-page-size=3D0x20
  *_GCC5_IA32_DLINK2_FLAGS         =3D DEF(GCC5_IA32_DLINK2_FLAGS) -no-pie=
=0D
  *_GCC5_IA32_RC_FLAGS             =3D DEF(GCC_IA32_RC_FLAGS)=0D
  *_GCC5_IA32_OBJCOPY_FLAGS        =3D=0D
@@ -90,7 +90,7 @@ index 0caa1c9001..dd86b3249d 100755
  =0D
    DEBUG_GCC5_IA32_CC_FLAGS       =3D DEF(GCC5_IA32_CC_FLAGS) -flto=0D
    DEBUG_GCC5_IA32_DLINK_FLAGS    =3D DEF(GCC5_IA32_X64_DLINK_FLAGS) -flto=
 -Os -Wl,-m,elf_i386,--oformat=3Delf32-i386=0D
-@@ -1548,7 +1548,7 @@ RELEASE_GCC5_IA32_DLINK_FLAGS    =3D DEF(GCC5_IA32_X=
64_DLINK_FLAGS) -flto -Os -Wl,
+@@ -1346,7 +1346,7 @@ RELEASE_GCC5_IA32_DLINK_FLAGS    =3D DEF(GCC5_IA32_X=
64_DLINK_FLAGS) -flto -Os -Wl,
  *_GCC5_X64_DLINK2_FLAGS          =3D DEF(GCC5_X64_DLINK2_FLAGS)=0D
  *_GCC5_X64_RC_FLAGS              =3D DEF(GCC_X64_RC_FLAGS)=0D
  *_GCC5_X64_OBJCOPY_FLAGS         =3D=0D
@@ -99,3 +99,6 @@ index 0caa1c9001..dd86b3249d 100755
  =0D
    DEBUG_GCC5_X64_CC_FLAGS        =3D DEF(GCC5_X64_CC_FLAGS) -flto -DUSING=
_LTO=0D
    DEBUG_GCC5_X64_DLINK_FLAGS     =3D DEF(GCC5_X64_DLINK_FLAGS) -flto -Os=
=0D
+--=20
+2.47.3
+
diff --git a/meta/recipes-core/ovmf/ovmf/0004-reproducible.patch b/meta/rec=
ipes-core/ovmf/ovmf/0004-reproducible.patch
index 73f242321e..b42ecde211 100644
--- a/meta/recipes-core/ovmf/ovmf/0004-reproducible.patch
+++ b/meta/recipes-core/ovmf/ovmf/0004-reproducible.patch
@@ -1,7 +1,7 @@
-From 0d22e07cd9cc35ede04c01d3141068db744d7677 Mon Sep 17 00:00:00 2001
+From 8b218dffa0368fbc2bfb5d8051b358476266fcb4 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Mon, 14 Jun 2021 19:57:30 +0200
-Subject: [PATCH] reproducible
+Subject: [PATCH 4/5] reproducible
=20
 This patch fixes various things which make the build more reproducible. So=
me changes
 here only change intermediate artefacts but that means when you have two b=
uild trees
@@ -35,7 +35,7 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  4 files changed, 24 insertions(+), 16 deletions(-)
=20
 diff --git a/BaseTools/Source/C/GenFw/Elf64Convert.c b/BaseTools/Source/C/=
GenFw/Elf64Convert.c
-index 18594122ea..92b5f13cf6 100644
+index 83f1b285c2..e2f582f8fb 100644
 --- a/BaseTools/Source/C/GenFw/Elf64Convert.c
 +++ b/BaseTools/Source/C/GenFw/Elf64Convert.c
 @@ -15,6 +15,8 @@ SPDX-License-Identifier: BSD-2-Clause-Patent
@@ -47,7 +47,7 @@ index 18594122ea..92b5f13cf6 100644
  #endif=0D
  #include <assert.h>=0D
  #include <stdio.h>=0D
-@@ -990,7 +992,7 @@ ScanSections64 (
+@@ -995,7 +997,7 @@ ScanSections64 (
    }=0D
    mCoffOffset =3D mDebugOffset + sizeof(EFI_IMAGE_DEBUG_DIRECTORY_ENTRY) =
+=0D
                  sizeof(EFI_IMAGE_DEBUG_CODEVIEW_NB10_ENTRY) +=0D
@@ -56,7 +56,7 @@ index 18594122ea..92b5f13cf6 100644
  =0D
    //=0D
    // Add more space in the .debug data region for the DllCharacteristicsE=
x=0D
-@@ -2322,7 +2324,7 @@ WriteDebug64 (
+@@ -2329,7 +2331,7 @@ WriteDebug64 (
    EFI_IMAGE_DEBUG_CODEVIEW_NB10_ENTRY         *Nb10;=0D
    EFI_IMAGE_DEBUG_EX_DLLCHARACTERISTICS_ENTRY *DllEntry;=0D
  =0D
@@ -65,7 +65,7 @@ index 18594122ea..92b5f13cf6 100644
  =0D
    NtHdr =3D (EFI_IMAGE_OPTIONAL_HEADER_UNION *)(mCoffFile + mNtHdrOffset)=
;=0D
    DataDir =3D &NtHdr->Pe32Plus.OptionalHeader.DataDirectory[EFI_IMAGE_DIR=
ECTORY_ENTRY_DEBUG];=0D
-@@ -2355,7 +2357,7 @@ WriteDebug64 (
+@@ -2362,7 +2364,7 @@ WriteDebug64 (
  =0D
    Nb10 =3D (EFI_IMAGE_DEBUG_CODEVIEW_NB10_ENTRY*)(Dir + 1);=0D
    Nb10->Signature =3D CODEVIEW_SIGNATURE_NB10;=0D
@@ -153,7 +153,7 @@ index e5f282c4ac..27a34ef7c6 100755
                  if T.GenFileListMacro and T.FileListMacro not in self.Fil=
eListMacros:=0D
                      self.FileListMacros[T.FileListMacro] =3D []=0D
 diff --git a/BaseTools/Source/Python/AutoGen/ModuleAutoGen.py b/BaseTools/=
Source/Python/AutoGen/ModuleAutoGen.py
-index aa0b71632e..57c9cad117 100755
+index 764c51789b..40aadbcfbc 100755
 --- a/BaseTools/Source/Python/AutoGen/ModuleAutoGen.py
 +++ b/BaseTools/Source/Python/AutoGen/ModuleAutoGen.py
 @@ -1429,6 +1429,9 @@ class ModuleAutoGen(AutoGen):
@@ -175,3 +175,6 @@ index aa0b71632e..57c9cad117 100755
  =0D
          # Ignore generating makefile when it is a binary module=0D
          if self.IsBinaryModule:=0D
+--=20
+2.47.3
+
diff --git a/meta/recipes-core/ovmf/ovmf/0005-UefiCpuPkg-CpuExceptionHandle=
rLib-fix-push-instructi.patch b/meta/recipes-core/ovmf/ovmf/0005-UefiCpuPkg=
-CpuExceptionHandlerLib-fix-push-instructi.patch
index 43c402b91a..650e084b5b 100644
--- a/meta/recipes-core/ovmf/ovmf/0005-UefiCpuPkg-CpuExceptionHandlerLib-fi=
x-push-instructi.patch
+++ b/meta/recipes-core/ovmf/ovmf/0005-UefiCpuPkg-CpuExceptionHandlerLib-fi=
x-push-instructi.patch
@@ -1,7 +1,7 @@
-From 7dcf5ed06b5a256436521f892d2579421c163902 Mon Sep 17 00:00:00 2001
+From 7e6be0f4068a2158af3c97e873edb33fa4d5c6b8 Mon Sep 17 00:00:00 2001
 From: Gerd Hoffmann <kraxel@redhat.com>
 Date: Mon, 3 Nov 2025 09:56:52 +0100
-Subject: [PATCH] UefiCpuPkg/CpuExceptionHandlerLib: fix push instructions
+Subject: [PATCH 5/5] UefiCpuPkg/CpuExceptionHandlerLib: fix push instructi=
ons
=20
 Nasm 3.0 complains about 'dword' being invalid.  The comment talks about
 a '8-byte value' so 'qword' should be correct here.
@@ -41,3 +41,6 @@ index 3d64ac9080..671ed98f85 100644
  VectorNum:=0D
      push    rax=0D
  %ifdef NO_ABSOLUTE_RELOCS_IN_TEXT=0D
+--=20
+2.47.3
+
diff --git a/meta/recipes-core/ovmf/ovmf_git.bb b/meta/recipes-core/ovmf/ov=
mf_git.bb
index 6b42041ac7..ec6c3b516c 100644
--- a/meta/recipes-core/ovmf/ovmf_git.bb
+++ b/meta/recipes-core/ovmf/ovmf_git.bb
@@ -28,8 +28,8 @@ SRC_URI =3D "gitsm://github.com/tianocore/edk2.git;branch=
=3Dmaster;protocol=3Dhttps;ta
            file://0005-UefiCpuPkg-CpuExceptionHandlerLib-fix-push-instruct=
i.patch \
            "
=20
-PV =3D "edk2-stable202508"
-SRCREV =3D "d46aa46c8361194521391aa581593e556c707c6e"
+PV =3D "edk2-stable202511"
+SRCREV =3D "46548b1adac82211d8d11da12dd914f41e7aa775"
 UPSTREAM_CHECK_GITTAGREGEX =3D "(?P<pver>edk2-stable.*)"
=20
 CVE_PRODUCT =3D "edk2"
@@ -58,7 +58,7 @@ EDK_TOOLS_DIR =3D "edk2_basetools"
 BUILD_OPTIMIZATION =3D ""
=20
 # OVMF supports IA only, although it could conceivably support ARM someday.
-COMPATIBLE_HOST:class-target =3D '(i.86|x86_64).*'
+COMPATIBLE_HOST:class-target =3D '(x86_64).*'
=20
 # Additional build flags for OVMF with Secure Boot.
 # Fedora also uses "-D SMM_REQUIRE -D EXCLUDE_SHELL_FROM_FD".
@@ -178,9 +178,6 @@ do_compile:class-target() {
     export LFLAGS=3D"${LDFLAGS}"
     PARALLEL_JOBS=3D"${@oe.utils.parallel_make_argument(d, '-n %d')}"
     OVMF_ARCH=3D"X64"
-    if [ "${TARGET_ARCH}" !=3D "x86_64" ] ; then
-        OVMF_ARCH=3D"IA32"
-    fi
=20
     # The build for the target uses BaseTools/Conf/tools_def.template
     # from ovmf-native to find the compiler, which depends on
@@ -197,9 +194,6 @@ do_compile:class-target() {
     rm -rf ${WORKDIR}/ovmf
     mkdir ${WORKDIR}/ovmf
     OVMF_DIR_SUFFIX=3D"X64"
-    if [ "${TARGET_ARCH}" !=3D "x86_64" ] ; then
-        OVMF_DIR_SUFFIX=3D"Ia32" # Note the different capitalization
-    fi
     FIXED_GCCVER=3D$(fixup_target_tools ${GCC_VER})
     bbnote FIXED_GCCVER is ${FIXED_GCCVER}
     build_dir=3D"${S}/Build/Ovmf$OVMF_DIR_SUFFIX/${OVMF_BUILD_TYPE}_${FIXE=
D_GCCVER}"
@@ -231,10 +225,10 @@ do_install:class-native() {
=20
 do_install:class-target() {
     # Content for UEFI shell iso. We install the EFI shell as
-    # bootx64/ia32.efi because then it can be started even when the
+    # bootx64.efi because then it can be started even when the
     # firmware itself does not contain it.
     install -d ${D}/efi/boot
-    install ${WORKDIR}/ovmf/Shell.efi ${D}/efi/boot/boot${@ "ia32" if "${T=
ARGET_ARCH}" !=3D "x86_64" else "x64"}.efi
+    install ${WORKDIR}/ovmf/Shell.efi ${D}/efi/boot/bootx64.efi
     if ${@bb.utils.contains('PACKAGECONFIG', 'secureboot', 'true', 'false'=
, d)}; then
         install ${WORKDIR}/ovmf/EnrollDefaultKeys.efi ${D}
     fi
--=20
2.47.3


