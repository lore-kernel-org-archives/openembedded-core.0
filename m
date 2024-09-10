Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD3FFEB64DE
	for <webhook@archiver.kernel.org>; Tue, 10 Sep 2024 12:22:04 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.web11.21597.1725970916894167517
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Sep 2024 05:21:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=aTko7ZxD;
 spf=pass (domain: linaro.org, ip: 209.85.167.53, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5366fd6fdf1so753799e87.0
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Sep 2024 05:21:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725970915; x=1726575715; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ewP+ru99S6Xt98CDQ98YdcWa0nQP5vaJr/kJp8qeszc=;
        b=aTko7ZxDfIHqZwuvsf+h8I8rWv/7opRo6XDosh4vigl8uy4d4buauFxmqfYxZQDdkW
         /QfgK8WXalVQNv7EntZ3eaIE+ez4Y+mdUKWUY+DoBsLaCyAZNKJdo4gaDN1YK0sAMF5A
         ye2zZhLZDMYSHVN0T1PIwv1JYS+8PikFn+jou8rr2o1lDdVg9oOc6DBubtQpyOz5FukB
         XsSlWukkA0tNZ5j/yEVjuvgvckeKUMsfEJfVfS4YOYdTZPe5aHWMxXWBGVn+pDCgfIdZ
         LDWvoRuG4YTeIfZXEoSIRGY+6F2J6ssVT+YTzqOUp9WqQGpjdXQvSgVAR8CGQTLiYr/Q
         JkAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725970915; x=1726575715;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ewP+ru99S6Xt98CDQ98YdcWa0nQP5vaJr/kJp8qeszc=;
        b=HwW6X5BV0UV1nNjU9TaENPaIAiZyVatvZssEqwL+vnMqCnL+V66h6bHNjKIpSXgYXA
         SLqNAGHfijWRenTiQNY5wkyBol3ST9y8GWv06dZOHLOgq1qKiogODQbt0pkXeNI7C6/x
         QeWs+4MyNNvMg7fO50hx7xwADt42107tCUDFV+KaztOmjCVwwMhCLycusgV5aZogPiG7
         pJ6nuU7FQqKnBAjVN6G6KmzUJOBvOPSLJalg8y6sKxtSWz0tUPjzk4RXraObH4Bd//qf
         8sGYrtJ8X1O3o19ziALwgq7iMMV0KOaI22SAEv/gR04FnnYuT4e56rsmF8VCK0orUpM5
         /IOg==
X-Gm-Message-State: AOJu0YwJ0aL8Gt7DMdTFq4NVDJv12GeWKVkkYBWSH1ShaK8SP+qtcluZ
	zq3IRxK6TXsVpaotfJNrdkdQQUPlnL8vOJdRXiwXcQZDMoBqtVFb8A+q0s5fizMdCimU5TJewIH
	cG8M=
X-Google-Smtp-Source: AGHT+IHt8zzLIFqkfVT2UtuXy+r18+F+hcJvuiq5CQ7MTwEZqy5c3IeQ5WIHymmXkUQ4qMJ4NzFtXg==
X-Received: by 2002:a05:6512:3989:b0:535:3ce5:6173 with SMTP id 2adb3069b0e04-536587f6087mr9836915e87.37.1725970913881;
        Tue, 10 Sep 2024 05:21:53 -0700 (PDT)
Received: from localhost.localdomain (87-100-245-199.bb.dnainternet.fi. [87.100.245.199])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5365f868e6bsm1120702e87.41.2024.09.10.05.21.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Sep 2024 05:21:53 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH] omvf: update from edk2-stable202402 to edk2-stable202408
Date: Tue, 10 Sep 2024 15:21:28 +0300
Message-ID: <20240910122128.316163-1-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Sep 2024 12:22:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204347

Includes patches for CVE-2023-45236, CVE-2023-45237 and
CVE-2024-25742. Refreshed patches with devtool.

Changes:

https://github.com/tianocore/edk2/releases

edk2-stable202408
Release Date 2024-08-23
New Features & Bug Fixes

    CryptoPkg:Add more crypto APIs (AESGCM/PEM/X509/RSA/PKCS5/PKCS7/Authent=
icode) based on Mbedtls
    CryptoPkg: Enable Openssl native instruction support for AARCH64
    CryptoPkg: Add support for aes128-sha256 and aes256-sha256 cipher
    UefiCpuPkg: S3 cleanup
    MdePkg/BaseLib: Add CRC16 CCITT False Implementation
    DynamicTablesPkg: ACPI TPM2 generator
    DynamicTablesPkg: Prepare for supporting other archs
    BaseTools: Add VS2022 support
    OvmfPkg: Add LoongArchVirt instance to OvmfPkg and enable it

edk2-stable202405

Release Date 2024-05-24
New Features & Bug Fixes

    SecurityPkg:Add EFI Device Authentication Signature Database and SPDM
    CryptoPkg:add additional RSAES-OAEP crypto functions
    OvmfPkg:Add 5-level paging support
    OvmfPkg:SEV-SNP Support for running under an SVSM
    OvmfPkg:RBP register shall be cleared in TDVMCALL
    OvmfPkg:Harden #VC instruction emulation (CVE-2024-25742)
    Add SPI bus driver stack
    NetworkPkg: Predictable TCP ISNs
    NetworkPkg: Use of a Weak PseudoRandom Number Generator
    UefiCpuPkg: Add new SmmRelocationLib library

Bugzilla List
Update Notes

    NetworkPkg SECURITY PATCH CVE-2023-45237 requires the platform to provi=
de the right implementation of the EFI_RNG_PROTOCOL
    (i.e., using a GUID that appears in the allowlist) and EFI_HASH2_PROTOC=
OL. If it is not implemented, the platform will lose the ability to do netw=
ork boot.

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 ...ovmf-update-path-to-native-BaseTools.patch |  9 +++----
 ...ile-adjust-to-build-in-under-bitbake.patch |  5 +---
 .../ovmf/ovmf/0003-debug-prefix-map.patch     | 27 +++++++++----------
 .../ovmf/ovmf/0004-reproducible.patch         | 23 +++++++---------
 meta/recipes-core/ovmf/ovmf_git.bb            |  4 +--
 5 files changed, 28 insertions(+), 40 deletions(-)

diff --git a/meta/recipes-core/ovmf/ovmf/0001-ovmf-update-path-to-native-Ba=
seTools.patch b/meta/recipes-core/ovmf/ovmf/0001-ovmf-update-path-to-native=
-BaseTools.patch
index 490d9e8046..89ef8d91fc 100644
--- a/meta/recipes-core/ovmf/ovmf/0001-ovmf-update-path-to-native-BaseTools=
.patch
+++ b/meta/recipes-core/ovmf/ovmf/0001-ovmf-update-path-to-native-BaseTools=
.patch
@@ -1,7 +1,7 @@
-From d8df6b6433351763e1db791dd84d432983d2b249 Mon Sep 17 00:00:00 2001
+From 5f52c2582ae2226ef324332e352bb4c51b597656 Mon Sep 17 00:00:00 2001
 From: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
 Date: Thu, 9 Jun 2016 02:23:01 -0700
-Subject: [PATCH 1/4] ovmf: update path to native BaseTools
+Subject: [PATCH] ovmf: update path to native BaseTools
=20
 BaseTools is a set of utilities to build EDK-based firmware. These utiliti=
es
 are used during the build process. Thus, they need to be built natively.
@@ -16,7 +16,7 @@ Upstream-Status: Inappropriate [oe-core cross compile spe=
cific]
  1 file changed, 1 insertion(+), 1 deletion(-)
=20
 diff --git a/OvmfPkg/build.sh b/OvmfPkg/build.sh
-index b0334fb76e..094f86f096 100755
+index 279f0d099a..285f061bf4 100755
 --- a/OvmfPkg/build.sh
 +++ b/OvmfPkg/build.sh
 @@ -24,7 +24,7 @@ then
@@ -28,6 +28,3 @@ index b0334fb76e..094f86f096 100755
    echo $EDK_TOOLS_PATH
    source edksetup.sh BaseTools
  else
---=20
-2.30.2
-
diff --git a/meta/recipes-core/ovmf/ovmf/0002-BaseTools-makefile-adjust-to-=
build-in-under-bitbake.patch b/meta/recipes-core/ovmf/ovmf/0002-BaseTools-m=
akefile-adjust-to-build-in-under-bitbake.patch
index eeedc9e20f..01101c2483 100644
--- a/meta/recipes-core/ovmf/ovmf/0002-BaseTools-makefile-adjust-to-build-i=
n-under-bitbake.patch
+++ b/meta/recipes-core/ovmf/ovmf/0002-BaseTools-makefile-adjust-to-build-i=
n-under-bitbake.patch
@@ -1,4 +1,4 @@
-From ac9df4fb92965f1f95a5bdbde5f2f86d0c569711 Mon Sep 17 00:00:00 2001
+From 7cf91acf8a19a8052d05e272fad9f7e2f5b9597e Mon Sep 17 00:00:00 2001
 From: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
 Date: Fri, 26 Jul 2019 17:34:26 -0400
 Subject: [PATCH] BaseTools: makefile: adjust to build in under bitbake
@@ -64,6 +64,3 @@ index d369908a09..22c670f316 100644
  ifeq ($(HOST_ARCH), IA32)=0D
  #=0D
  # Snow Leopard  is a 32-bit and 64-bit environment. uname -m returns i386=
, but gcc defaults=0D
---=20
-2.30.2
-
diff --git a/meta/recipes-core/ovmf/ovmf/0003-debug-prefix-map.patch b/meta=
/recipes-core/ovmf/ovmf/0003-debug-prefix-map.patch
index c0c763c1cf..08821650fa 100644
--- a/meta/recipes-core/ovmf/ovmf/0003-debug-prefix-map.patch
+++ b/meta/recipes-core/ovmf/ovmf/0003-debug-prefix-map.patch
@@ -1,7 +1,7 @@
-From 03e536b20d0b72cf078052f6748de8df3836625c Mon Sep 17 00:00:00 2001
+From 415beee5adacae425f725cf9910784a0cdfa17dc Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Mon, 14 Jun 2021 19:56:28 +0200
-Subject: [PATCH 3/4] debug prefix map
+Subject: [PATCH] debug prefix map
=20
 We want to pass ${DEBUG_PREFIX_MAP} to gcc commands and also pass in
  --debug-prefix-map to nasm (we carry a patch to nasm for this). The
@@ -22,19 +22,19 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.co=
m>
  1 file changed, 9 insertions(+), 9 deletions(-)
=20
 diff --git a/BaseTools/Conf/tools_def.template b/BaseTools/Conf/tools_def.=
template
-index 503a6687c1..10ac38ef9e 100755
+index 76aaae7261..4829d5cd5d 100755
 --- a/BaseTools/Conf/tools_def.template
 +++ b/BaseTools/Conf/tools_def.template
-@@ -739,7 +739,7 @@ NOOPT_*_*_OBJCOPY_ADDDEBUGFLAG     =3D --add-gnu-debug=
link=3D"$(DEBUG_DIR)/$(MODULE_
+@@ -894,7 +894,7 @@ NOOPT_*_*_OBJCOPY_ADDDEBUGFLAG     =3D --add-gnu-debug=
link=3D"$(DEBUG_DIR)/$(MODULE_
  *_*_*_DTCPP_PATH                   =3D DEF(DTCPP_BIN)=0D
  *_*_*_DTC_PATH                     =3D DEF(DTC_BIN)=0D
  =0D
 -DEFINE GCC_ALL_CC_FLAGS            =3D -g -Os -fshort-wchar -fno-builtin =
-fno-strict-aliasing -Wall -Werror -Wno-array-bounds -include AutoGen.h -fn=
o-common=0D
 +DEFINE GCC_ALL_CC_FLAGS            =3D -g -Os -fshort-wchar -fno-builtin =
-fno-strict-aliasing -Wall -Werror -Wno-array-bounds -include AutoGen.h -fn=
o-common ENV(GCC_PREFIX_MAP)=0D
  DEFINE GCC_ARM_CC_FLAGS            =3D DEF(GCC_ALL_CC_FLAGS) -mlittle-end=
ian -mabi=3Daapcs -fno-short-enums -funsigned-char -ffunction-sections -fda=
ta-sections -fomit-frame-pointer -Wno-address -mthumb -fno-pic -fno-pie=0D
- DEFINE GCC_LOONGARCH64_CC_FLAGS    =3D DEF(GCC_ALL_CC_FLAGS) -mabi=3Dlp64=
d -fno-asynchronous-unwind-tables -fno-plt -Wno-address -fno-short-enums -f=
signed-char -ffunction-sections -fdata-sections=0D
+ DEFINE GCC_LOONGARCH64_CC_FLAGS    =3D DEF(GCC_ALL_CC_FLAGS) -mabi=3Dlp64=
d -fno-asynchronous-unwind-tables -Wno-address -fno-short-enums -fsigned-ch=
ar -ffunction-sections -fdata-sections=0D
  DEFINE GCC_ARM_CC_XIPFLAGS         =3D -mno-unaligned-access=0D
-@@ -759,8 +759,8 @@ DEFINE GCC_ARM_ASLDLINK_FLAGS      =3D DEF(GCC_ARM_DLI=
NK_FLAGS) -Wl,--entry,Refere
+@@ -915,8 +915,8 @@ DEFINE GCC_ARM_ASLDLINK_FLAGS      =3D DEF(GCC_ARM_DLI=
NK_FLAGS) -Wl,--entry,Refere
  DEFINE GCC_AARCH64_ASLDLINK_FLAGS  =3D DEF(GCC_AARCH64_DLINK_FLAGS) -Wl,-=
-entry,ReferenceAcpiTable -u $(IMAGE_ENTRY_POINT) DEF(GCC_ARM_AARCH64_ASLDL=
INK_FLAGS)=0D
  DEFINE GCC_LOONGARCH64_ASLDLINK_FLAGS =3D DEF(GCC_LOONGARCH64_DLINK_FLAGS=
) -Wl,--entry,ReferenceAcpiTable -u $(IMAGE_ENTRY_POINT)=0D
  DEFINE GCC_IA32_X64_DLINK_FLAGS    =3D DEF(GCC_IA32_X64_DLINK_COMMON) --e=
ntry _$(IMAGE_ENTRY_POINT) --file-alignment 0x20 --section-alignment 0x20 -=
Map $(DEST_DIR_DEBUG)/$(BASE_NAME).map=0D
@@ -45,7 +45,7 @@ index 503a6687c1..10ac38ef9e 100755
  DEFINE GCC_VFRPP_FLAGS             =3D -x c -E -P -DVFRCOMPILE --include =
$(MODULE_NAME)StrDefs.h=0D
  DEFINE GCC_ASLPP_FLAGS             =3D -x c -E -include AutoGen.h=0D
  DEFINE GCC_ASLCC_FLAGS             =3D -x c=0D
-@@ -913,7 +913,7 @@ DEFINE GCC5_LOONGARCH64_PP_FLAGS           =3D -mabi=
=3Dlp64d -march=3Dloongarch64 DEF(
+@@ -1069,7 +1069,7 @@ DEFINE GCC5_LOONGARCH64_PP_FLAGS           =3D -mabi=
=3Dlp64d -march=3Dloongarch64 DEF(
  *_GCC48_IA32_DLINK2_FLAGS         =3D DEF(GCC48_IA32_DLINK2_FLAGS)=0D
  *_GCC48_IA32_RC_FLAGS             =3D DEF(GCC_IA32_RC_FLAGS)=0D
  *_GCC48_IA32_OBJCOPY_FLAGS        =3D=0D
@@ -54,7 +54,7 @@ index 503a6687c1..10ac38ef9e 100755
  =0D
    DEBUG_GCC48_IA32_CC_FLAGS       =3D DEF(GCC48_IA32_CC_FLAGS)=0D
  RELEASE_GCC48_IA32_CC_FLAGS       =3D DEF(GCC48_IA32_CC_FLAGS) -Wno-unuse=
d-but-set-variable=0D
-@@ -941,7 +941,7 @@ RELEASE_GCC48_IA32_CC_FLAGS       =3D DEF(GCC48_IA32_C=
C_FLAGS) -Wno-unused-but-set
+@@ -1097,7 +1097,7 @@ RELEASE_GCC48_IA32_CC_FLAGS       =3D DEF(GCC48_IA32=
_CC_FLAGS) -Wno-unused-but-set
  *_GCC48_X64_DLINK2_FLAGS         =3D DEF(GCC48_X64_DLINK2_FLAGS)=0D
  *_GCC48_X64_RC_FLAGS             =3D DEF(GCC_X64_RC_FLAGS)=0D
  *_GCC48_X64_OBJCOPY_FLAGS        =3D=0D
@@ -63,7 +63,7 @@ index 503a6687c1..10ac38ef9e 100755
  =0D
    DEBUG_GCC48_X64_CC_FLAGS       =3D DEF(GCC48_X64_CC_FLAGS)=0D
  RELEASE_GCC48_X64_CC_FLAGS       =3D DEF(GCC48_X64_CC_FLAGS) -Wno-unused-=
but-set-variable=0D
-@@ -1050,7 +1050,7 @@ RELEASE_GCC48_AARCH64_CC_FLAGS   =3D DEF(GCC48_AARCH=
64_CC_FLAGS) -Wno-unused-but-s
+@@ -1206,7 +1206,7 @@ RELEASE_GCC48_AARCH64_CC_FLAGS   =3D DEF(GCC48_AARCH=
64_CC_FLAGS) -Wno-unused-but-s
  *_GCC49_IA32_DLINK2_FLAGS         =3D DEF(GCC49_IA32_DLINK2_FLAGS)=0D
  *_GCC49_IA32_RC_FLAGS             =3D DEF(GCC_IA32_RC_FLAGS)=0D
  *_GCC49_IA32_OBJCOPY_FLAGS        =3D=0D
@@ -72,7 +72,7 @@ index 503a6687c1..10ac38ef9e 100755
  =0D
    DEBUG_GCC49_IA32_CC_FLAGS       =3D DEF(GCC49_IA32_CC_FLAGS)=0D
  RELEASE_GCC49_IA32_CC_FLAGS       =3D DEF(GCC49_IA32_CC_FLAGS) -Wno-unuse=
d-but-set-variable -Wno-unused-const-variable=0D
-@@ -1078,7 +1078,7 @@ RELEASE_GCC49_IA32_CC_FLAGS       =3D DEF(GCC49_IA32=
_CC_FLAGS) -Wno-unused-but-set
+@@ -1234,7 +1234,7 @@ RELEASE_GCC49_IA32_CC_FLAGS       =3D DEF(GCC49_IA32=
_CC_FLAGS) -Wno-unused-but-set
  *_GCC49_X64_DLINK2_FLAGS         =3D DEF(GCC49_X64_DLINK2_FLAGS)=0D
  *_GCC49_X64_RC_FLAGS             =3D DEF(GCC_X64_RC_FLAGS)=0D
  *_GCC49_X64_OBJCOPY_FLAGS        =3D=0D
@@ -81,7 +81,7 @@ index 503a6687c1..10ac38ef9e 100755
  =0D
    DEBUG_GCC49_X64_CC_FLAGS       =3D DEF(GCC49_X64_CC_FLAGS)=0D
  RELEASE_GCC49_X64_CC_FLAGS       =3D DEF(GCC49_X64_CC_FLAGS) -Wno-unused-=
but-set-variable -Wno-unused-const-variable=0D
-@@ -1337,7 +1337,7 @@ RELEASE_GCCNOLTO_AARCH64_DLINK_XIPFLAGS =3D -z commo=
n-page-size=3D0x20
+@@ -1493,7 +1493,7 @@ RELEASE_GCCNOLTO_AARCH64_DLINK_XIPFLAGS =3D -z commo=
n-page-size=3D0x20
  *_GCC5_IA32_DLINK2_FLAGS         =3D DEF(GCC5_IA32_DLINK2_FLAGS) -no-pie=
=0D
  *_GCC5_IA32_RC_FLAGS             =3D DEF(GCC_IA32_RC_FLAGS)=0D
  *_GCC5_IA32_OBJCOPY_FLAGS        =3D=0D
@@ -90,7 +90,7 @@ index 503a6687c1..10ac38ef9e 100755
  =0D
    DEBUG_GCC5_IA32_CC_FLAGS       =3D DEF(GCC5_IA32_CC_FLAGS) -flto=0D
    DEBUG_GCC5_IA32_DLINK_FLAGS    =3D DEF(GCC5_IA32_X64_DLINK_FLAGS) -flto=
 -Os -Wl,-m,elf_i386,--oformat=3Delf32-i386=0D
-@@ -1369,7 +1369,7 @@ RELEASE_GCC5_IA32_DLINK_FLAGS    =3D DEF(GCC5_IA32_X=
64_DLINK_FLAGS) -flto -Os -Wl,
+@@ -1525,7 +1525,7 @@ RELEASE_GCC5_IA32_DLINK_FLAGS    =3D DEF(GCC5_IA32_X=
64_DLINK_FLAGS) -flto -Os -Wl,
  *_GCC5_X64_DLINK2_FLAGS          =3D DEF(GCC5_X64_DLINK2_FLAGS)=0D
  *_GCC5_X64_RC_FLAGS              =3D DEF(GCC_X64_RC_FLAGS)=0D
  *_GCC5_X64_OBJCOPY_FLAGS         =3D=0D
@@ -99,6 +99,3 @@ index 503a6687c1..10ac38ef9e 100755
  =0D
    DEBUG_GCC5_X64_CC_FLAGS        =3D DEF(GCC5_X64_CC_FLAGS) -flto -DUSING=
_LTO=0D
    DEBUG_GCC5_X64_DLINK_FLAGS     =3D DEF(GCC5_X64_DLINK_FLAGS) -flto -Os=
=0D
---=20
-2.30.2
-
diff --git a/meta/recipes-core/ovmf/ovmf/0004-reproducible.patch b/meta/rec=
ipes-core/ovmf/ovmf/0004-reproducible.patch
index c3fdc3d863..aba5d9e134 100644
--- a/meta/recipes-core/ovmf/ovmf/0004-reproducible.patch
+++ b/meta/recipes-core/ovmf/ovmf/0004-reproducible.patch
@@ -1,7 +1,7 @@
-From c59850367a190d70dec43e0a66f399a4d8a5ffed Mon Sep 17 00:00:00 2001
+From f4ba093ea8a8a8c333c08605b3a6ff1c82712613 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Mon, 14 Jun 2021 19:57:30 +0200
-Subject: [PATCH 4/4] reproducible
+Subject: [PATCH] reproducible
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
-index 9c17c90b16..fcc7864141 100644
+index 9d04fc612e..83fd6c9c05 100644
 --- a/BaseTools/Source/C/GenFw/Elf64Convert.c
 +++ b/BaseTools/Source/C/GenFw/Elf64Convert.c
-@@ -15,6 +15,8 @@ SPDX-License-Identifier: BSD-2-Clause-Patent
+@@ -13,6 +13,8 @@ SPDX-License-Identifier: BSD-2-Clause-Patent
  #ifndef __GNUC__=0D
  #include <windows.h>=0D
  #include <io.h>=0D
@@ -47,7 +47,7 @@ index 9c17c90b16..fcc7864141 100644
  #endif=0D
  #include <assert.h>=0D
  #include <stdio.h>=0D
-@@ -990,7 +992,7 @@ ScanSections64 (
+@@ -988,7 +990,7 @@ ScanSections64 (
    }=0D
    mCoffOffset =3D mDebugOffset + sizeof(EFI_IMAGE_DEBUG_DIRECTORY_ENTRY) =
+=0D
                  sizeof(EFI_IMAGE_DEBUG_CODEVIEW_NB10_ENTRY) +=0D
@@ -56,7 +56,7 @@ index 9c17c90b16..fcc7864141 100644
  =0D
    //=0D
    // Add more space in the .debug data region for the DllCharacteristicsE=
x=0D
-@@ -2261,7 +2263,7 @@ WriteDebug64 (
+@@ -2299,7 +2301,7 @@ WriteDebug64 (
    EFI_IMAGE_DEBUG_CODEVIEW_NB10_ENTRY         *Nb10;=0D
    EFI_IMAGE_DEBUG_EX_DLLCHARACTERISTICS_ENTRY *DllEntry;=0D
  =0D
@@ -65,7 +65,7 @@ index 9c17c90b16..fcc7864141 100644
  =0D
    NtHdr =3D (EFI_IMAGE_OPTIONAL_HEADER_UNION *)(mCoffFile + mNtHdrOffset)=
;=0D
    DataDir =3D &NtHdr->Pe32Plus.OptionalHeader.DataDirectory[EFI_IMAGE_DIR=
ECTORY_ENTRY_DEBUG];=0D
-@@ -2294,7 +2296,7 @@ WriteDebug64 (
+@@ -2332,7 +2334,7 @@ WriteDebug64 (
  =0D
    Nb10 =3D (EFI_IMAGE_DEBUG_CODEVIEW_NB10_ENTRY*)(Dir + 1);=0D
    Nb10->Signature =3D CODEVIEW_SIGNATURE_NB10;=0D
@@ -75,7 +75,7 @@ index 9c17c90b16..fcc7864141 100644
  =0D
  STATIC=0D
 diff --git a/BaseTools/Source/Python/AutoGen/BuildEngine.py b/BaseTools/So=
urce/Python/AutoGen/BuildEngine.py
-index 752a1a1f6a..02054cccf8 100644
+index 45b39d7878..3fed7d1736 100644
 --- a/BaseTools/Source/Python/AutoGen/BuildEngine.py
 +++ b/BaseTools/Source/Python/AutoGen/BuildEngine.py
 @@ -70,6 +70,9 @@ class TargetDescBlock(object):
@@ -89,7 +89,7 @@ index 752a1a1f6a..02054cccf8 100644
          if Input not in self.Inputs:=0D
              self.Inputs.append(Input)=0D
 diff --git a/BaseTools/Source/Python/AutoGen/GenMake.py b/BaseTools/Source=
/Python/AutoGen/GenMake.py
-index daec9c6d54..0e8cc20efe 100755
+index fbd35d4989..5ddd544d17 100755
 --- a/BaseTools/Source/Python/AutoGen/GenMake.py
 +++ b/BaseTools/Source/Python/AutoGen/GenMake.py
 @@ -575,7 +575,7 @@ cleanlib:
@@ -153,7 +153,7 @@ index daec9c6d54..0e8cc20efe 100755
                  if T.GenFileListMacro and T.FileListMacro not in self.Fil=
eListMacros:=0D
                      self.FileListMacros[T.FileListMacro] =3D []=0D
 diff --git a/BaseTools/Source/Python/AutoGen/ModuleAutoGen.py b/BaseTools/=
Source/Python/AutoGen/ModuleAutoGen.py
-index d05410b329..99b3f64aba 100755
+index 65a2176ca9..318b9611ce 100755
 --- a/BaseTools/Source/Python/AutoGen/ModuleAutoGen.py
 +++ b/BaseTools/Source/Python/AutoGen/ModuleAutoGen.py
 @@ -1474,6 +1474,9 @@ class ModuleAutoGen(AutoGen):
@@ -175,6 +175,3 @@ index d05410b329..99b3f64aba 100755
  =0D
          # Ignore generating makefile when it is a binary module=0D
          if self.IsBinaryModule:=0D
---=20
-2.30.2
-
diff --git a/meta/recipes-core/ovmf/ovmf_git.bb b/meta/recipes-core/ovmf/ov=
mf_git.bb
index 085574c0cb..202182397d 100644
--- a/meta/recipes-core/ovmf/ovmf_git.bb
+++ b/meta/recipes-core/ovmf/ovmf_git.bb
@@ -26,8 +26,8 @@ SRC_URI =3D "gitsm://github.com/tianocore/edk2.git;branch=
=3Dmaster;protocol=3Dhttps \
            file://0004-reproducible.patch \
            "
=20
-PV =3D "edk2-stable202402"
-SRCREV =3D "edc6681206c1a8791981a2f911d2fb8b3d2f5768"
+PV =3D "edk2-stable202408"
+SRCREV =3D "b158dad150bf02879668f72ce306445250838201"
 UPSTREAM_CHECK_GITTAGREGEX =3D "(?P<pver>edk2-stable.*)"
=20
 CVE_PRODUCT =3D "edk2"
--=20
2.34.1


