Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF13AE77176
	for <webhook@archiver.kernel.org>; Wed,  4 Dec 2024 06:49:51 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web10.8183.1733294990955813059
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Dec 2024 22:49:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ljNshfe3;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-434ab938e37so41318255e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 03 Dec 2024 22:49:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733294989; x=1733899789; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Igz7GBAMIrXPPi9v/XKmz8VslQBZCrtblk4oE87e9XA=;
        b=ljNshfe3OFdCha3pdGegaMRxh5mpQiC7Xqby7RDmRcq3ejhKPW9X+CgmOY16yvbxy1
         RsT0yoyLS1LWyl1cuHWE0A3OtAd+mSPRAOeRmul7AKi8rbWlv585+X6or5HQx3FL4tqB
         citCwUHuvzTdVxXBKoihLtIxaOeevV0yELNwZkE/3jJM5F4qnZVI3cvch7w46Nd4QSAw
         CeUiicknP+D/dao8U/YTtS1KUQ0r3dYyL5ylVI93joGlLKgEiHu20snR/c3D/snQzxNX
         82bXCtWEyhKrb9aRzbazKpPpBdZl7myloZOBX6TPUR7hGGdqkvYHwv5SvpGQ4y4Typm1
         3w/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733294989; x=1733899789;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Igz7GBAMIrXPPi9v/XKmz8VslQBZCrtblk4oE87e9XA=;
        b=wdnYbrFJqYaz1auqs4h+RuIzjVijK2imo2Jt3Q6WEIJ5zEPhiamTbrgJZhWyi2W/bB
         ksXXzNfiiQv0QFsvw5eFB+hhi9Q7+aUK8s/ruvcPEHNczcPlLs+lXZjXKb/gtEHSXIz1
         8+q60NcMI3zazGqcldznU9x+OKqlg8tNajpBwJ3dnYaP31Qgb/54GdHH5tnk9tiic0xS
         Ik6+hZ9w9QZi5/rY26gDaGbSzLZgcAFt8lpXax8+jtduror6Oh+ofPhdVZAvIXbxizaQ
         P4LvRHXBQ9Z8tuwhDPdpx2mqrcDqPMtdkL84nNwLItlD7H0+XgHw++xNv1rK7NVEAsX7
         dUxQ==
X-Gm-Message-State: AOJu0YzvYguNbDOIcRsE9d84xn55yPm9mUyk9zT1y6fkHE9aJCOU69gI
	49dcp0TKUU2kgE5Hg850dXHxI74g3OzGn+C+PXN9uVFj/1tOCsCzIoT2eQ==
X-Gm-Gg: ASbGncvi1vxBUCTH/2mGJM1cTplL7NXFFZoMnxyZJyCyWqEbpnXIH+oSfyVuTAUMCFn
	Q0k7P1m7GGudtVZkU+EWurvmW39sGdNuqcRJvt/sKAUYnvESbArVS3RERb7MOuPSHYjqVgUkXbd
	yTuLHqYH4XmDJ52OCJjZV7Y7pinHJfO+hcyjYrY4VICX5Qjo+BwDbU2SzuyYKUdU+3ZcmQYRHqM
	Aiwvu40pxL8gJblpBcZdzGpdVLT52zByKj7mTeuErWGL6u3ZVGx+7aAWnAwostgZoDOlb5v9ROX
	QbVsj63g7Ec=
X-Google-Smtp-Source: AGHT+IHUCsieBIrwbD8YilictSMyI7+r7TipXyYJvnnrz722suS9xIf+TPfNW82FVMYicNbGljVMfQ==
X-Received: by 2002:a5d:59a6:0:b0:385:f979:7683 with SMTP id ffacd0b85a97d-38607c0e1fdmr2472852f8f.37.1733294989131;
        Tue, 03 Dec 2024 22:49:49 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385f343f293sm7435757f8f.36.2024.12.03.22.49.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2024 22:49:48 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 19/37] ovmf: update 202408 -> 202411
Date: Wed,  4 Dec 2024 07:49:02 +0100
Message-Id: <20241204064920.817016-19-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241204064920.817016-1-alex.kanavin@gmail.com>
References: <20241204064920.817016-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Dec 2024 06:49:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208248

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...ovmf-update-path-to-native-BaseTools.patch |  7 ++--
 ...ile-adjust-to-build-in-under-bitbake.patch |  7 ++--
 .../ovmf/ovmf/0003-debug-prefix-map.patch     | 35 ++++++++++---------
 .../ovmf/ovmf/0004-reproducible.patch         | 25 +++++++------
 meta/recipes-core/ovmf/ovmf_git.bb            |  4 +--
 5 files changed, 45 insertions(+), 33 deletions(-)

diff --git a/meta/recipes-core/ovmf/ovmf/0001-ovmf-update-path-to-native-Ba=
seTools.patch b/meta/recipes-core/ovmf/ovmf/0001-ovmf-update-path-to-native=
-BaseTools.patch
index 89ef8d91fcf..cee5042846c 100644
--- a/meta/recipes-core/ovmf/ovmf/0001-ovmf-update-path-to-native-BaseTools=
.patch
+++ b/meta/recipes-core/ovmf/ovmf/0001-ovmf-update-path-to-native-BaseTools=
.patch
@@ -1,7 +1,7 @@
-From 5f52c2582ae2226ef324332e352bb4c51b597656 Mon Sep 17 00:00:00 2001
+From 61583b59620946683551f43c6110e656604a252f Mon Sep 17 00:00:00 2001
 From: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
 Date: Thu, 9 Jun 2016 02:23:01 -0700
-Subject: [PATCH] ovmf: update path to native BaseTools
+Subject: [PATCH 1/4] ovmf: update path to native BaseTools
=20
 BaseTools is a set of utilities to build EDK-based firmware. These utiliti=
es
 are used during the build process. Thus, they need to be built natively.
@@ -28,3 +28,6 @@ index 279f0d099a..285f061bf4 100755
    echo $EDK_TOOLS_PATH
    source edksetup.sh BaseTools
  else
+--=20
+2.39.5
+
diff --git a/meta/recipes-core/ovmf/ovmf/0002-BaseTools-makefile-adjust-to-=
build-in-under-bitbake.patch b/meta/recipes-core/ovmf/ovmf/0002-BaseTools-m=
akefile-adjust-to-build-in-under-bitbake.patch
index 01101c24831..11d97c739a0 100644
--- a/meta/recipes-core/ovmf/ovmf/0002-BaseTools-makefile-adjust-to-build-i=
n-under-bitbake.patch
+++ b/meta/recipes-core/ovmf/ovmf/0002-BaseTools-makefile-adjust-to-build-i=
n-under-bitbake.patch
@@ -1,7 +1,7 @@
-From 7cf91acf8a19a8052d05e272fad9f7e2f5b9597e Mon Sep 17 00:00:00 2001
+From aacbf7c91732b9959e569e90844cf9de078b2f14 Mon Sep 17 00:00:00 2001
 From: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
 Date: Fri, 26 Jul 2019 17:34:26 -0400
-Subject: [PATCH] BaseTools: makefile: adjust to build in under bitbake
+Subject: [PATCH 2/4] BaseTools: makefile: adjust to build in under bitbake
=20
 Prepend the build flags with those of bitbake. This is to build
 using the bitbake native sysroot include and library directories.
@@ -64,3 +64,6 @@ index d369908a09..22c670f316 100644
  ifeq ($(HOST_ARCH), IA32)=0D
  #=0D
  # Snow Leopard  is a 32-bit and 64-bit environment. uname -m returns i386=
, but gcc defaults=0D
+--=20
+2.39.5
+
diff --git a/meta/recipes-core/ovmf/ovmf/0003-debug-prefix-map.patch b/meta=
/recipes-core/ovmf/ovmf/0003-debug-prefix-map.patch
index 08821650fa8..73910535a71 100644
--- a/meta/recipes-core/ovmf/ovmf/0003-debug-prefix-map.patch
+++ b/meta/recipes-core/ovmf/ovmf/0003-debug-prefix-map.patch
@@ -1,7 +1,7 @@
-From 415beee5adacae425f725cf9910784a0cdfa17dc Mon Sep 17 00:00:00 2001
+From 96fa2a7f2f54f1e6330275b5eba07e1efdbd865b Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Mon, 14 Jun 2021 19:56:28 +0200
-Subject: [PATCH] debug prefix map
+Subject: [PATCH 3/4] debug prefix map
=20
 We want to pass ${DEBUG_PREFIX_MAP} to gcc commands and also pass in
  --debug-prefix-map to nasm (we carry a patch to nasm for this). The
@@ -22,19 +22,19 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.co=
m>
  1 file changed, 9 insertions(+), 9 deletions(-)
=20
 diff --git a/BaseTools/Conf/tools_def.template b/BaseTools/Conf/tools_def.=
template
-index 76aaae7261..4829d5cd5d 100755
+index 14f3b643c4..4987488e88 100755
 --- a/BaseTools/Conf/tools_def.template
 +++ b/BaseTools/Conf/tools_def.template
-@@ -894,7 +894,7 @@ NOOPT_*_*_OBJCOPY_ADDDEBUGFLAG     =3D --add-gnu-debug=
link=3D"$(DEBUG_DIR)/$(MODULE_
- *_*_*_DTCPP_PATH                   =3D DEF(DTCPP_BIN)=0D
+@@ -896,7 +896,7 @@ NOOPT_*_*_OBJCOPY_ADDDEBUGFLAG     =3D --add-gnu-debug=
link=3D"$(DEBUG_DIR)/$(MODULE_
  *_*_*_DTC_PATH                     =3D DEF(DTC_BIN)=0D
  =0D
--DEFINE GCC_ALL_CC_FLAGS            =3D -g -Os -fshort-wchar -fno-builtin =
-fno-strict-aliasing -Wall -Werror -Wno-array-bounds -include AutoGen.h -fn=
o-common=0D
-+DEFINE GCC_ALL_CC_FLAGS            =3D -g -Os -fshort-wchar -fno-builtin =
-fno-strict-aliasing -Wall -Werror -Wno-array-bounds -include AutoGen.h -fn=
o-common ENV(GCC_PREFIX_MAP)=0D
- DEFINE GCC_ARM_CC_FLAGS            =3D DEF(GCC_ALL_CC_FLAGS) -mlittle-end=
ian -mabi=3Daapcs -fno-short-enums -funsigned-char -ffunction-sections -fda=
ta-sections -fomit-frame-pointer -Wno-address -mthumb -fno-pic -fno-pie=0D
+ # All supported GCC archs except LOONGARCH64 support -mstack-protector-gu=
ard=3Dglobal, so set that on everything except LOONGARCH64=0D
+-DEFINE GCC_ALL_CC_FLAGS            =3D -g -Os -fshort-wchar -fno-builtin =
-fno-strict-aliasing -Wall -Werror -Wno-array-bounds -include AutoGen.h -fn=
o-common -fstack-protector=0D
++DEFINE GCC_ALL_CC_FLAGS            =3D -g -Os -fshort-wchar -fno-builtin =
-fno-strict-aliasing -Wall -Werror -Wno-array-bounds -include AutoGen.h -fn=
o-common -fstack-protector ENV(GCC_PREFIX_MAP)=0D
+ DEFINE GCC_IA32_X64_CC_FLAGS       =3D -mstack-protector-guard=3Dglobal=0D
+ DEFINE GCC_ARM_CC_FLAGS            =3D DEF(GCC_ALL_CC_FLAGS) -mlittle-end=
ian -mabi=3Daapcs -fno-short-enums -funsigned-char -ffunction-sections -fda=
ta-sections -fomit-frame-pointer -Wno-address -mthumb -fno-pic -fno-pie -ms=
tack-protector-guard=3Dglobal=0D
  DEFINE GCC_LOONGARCH64_CC_FLAGS    =3D DEF(GCC_ALL_CC_FLAGS) -mabi=3Dlp64=
d -fno-asynchronous-unwind-tables -Wno-address -fno-short-enums -fsigned-ch=
ar -ffunction-sections -fdata-sections=0D
- DEFINE GCC_ARM_CC_XIPFLAGS         =3D -mno-unaligned-access=0D
-@@ -915,8 +915,8 @@ DEFINE GCC_ARM_ASLDLINK_FLAGS      =3D DEF(GCC_ARM_DLI=
NK_FLAGS) -Wl,--entry,Refere
+@@ -918,8 +918,8 @@ DEFINE GCC_ARM_ASLDLINK_FLAGS      =3D DEF(GCC_ARM_DLI=
NK_FLAGS) -Wl,--entry,Refere
  DEFINE GCC_AARCH64_ASLDLINK_FLAGS  =3D DEF(GCC_AARCH64_DLINK_FLAGS) -Wl,-=
-entry,ReferenceAcpiTable -u $(IMAGE_ENTRY_POINT) DEF(GCC_ARM_AARCH64_ASLDL=
INK_FLAGS)=0D
  DEFINE GCC_LOONGARCH64_ASLDLINK_FLAGS =3D DEF(GCC_LOONGARCH64_DLINK_FLAGS=
) -Wl,--entry,ReferenceAcpiTable -u $(IMAGE_ENTRY_POINT)=0D
  DEFINE GCC_IA32_X64_DLINK_FLAGS    =3D DEF(GCC_IA32_X64_DLINK_COMMON) --e=
ntry _$(IMAGE_ENTRY_POINT) --file-alignment 0x20 --section-alignment 0x20 -=
Map $(DEST_DIR_DEBUG)/$(BASE_NAME).map=0D
@@ -45,7 +45,7 @@ index 76aaae7261..4829d5cd5d 100755
  DEFINE GCC_VFRPP_FLAGS             =3D -x c -E -P -DVFRCOMPILE --include =
$(MODULE_NAME)StrDefs.h=0D
  DEFINE GCC_ASLPP_FLAGS             =3D -x c -E -include AutoGen.h=0D
  DEFINE GCC_ASLCC_FLAGS             =3D -x c=0D
-@@ -1069,7 +1069,7 @@ DEFINE GCC5_LOONGARCH64_PP_FLAGS           =3D -mabi=
=3Dlp64d -march=3Dloongarch64 DEF(
+@@ -1072,7 +1072,7 @@ DEFINE GCC5_LOONGARCH64_PP_FLAGS           =3D -mabi=
=3Dlp64d -march=3Dloongarch64 DEF(
  *_GCC48_IA32_DLINK2_FLAGS         =3D DEF(GCC48_IA32_DLINK2_FLAGS)=0D
  *_GCC48_IA32_RC_FLAGS             =3D DEF(GCC_IA32_RC_FLAGS)=0D
  *_GCC48_IA32_OBJCOPY_FLAGS        =3D=0D
@@ -54,7 +54,7 @@ index 76aaae7261..4829d5cd5d 100755
  =0D
    DEBUG_GCC48_IA32_CC_FLAGS       =3D DEF(GCC48_IA32_CC_FLAGS)=0D
  RELEASE_GCC48_IA32_CC_FLAGS       =3D DEF(GCC48_IA32_CC_FLAGS) -Wno-unuse=
d-but-set-variable=0D
-@@ -1097,7 +1097,7 @@ RELEASE_GCC48_IA32_CC_FLAGS       =3D DEF(GCC48_IA32=
_CC_FLAGS) -Wno-unused-but-set
+@@ -1100,7 +1100,7 @@ RELEASE_GCC48_IA32_CC_FLAGS       =3D DEF(GCC48_IA32=
_CC_FLAGS) -Wno-unused-but-set
  *_GCC48_X64_DLINK2_FLAGS         =3D DEF(GCC48_X64_DLINK2_FLAGS)=0D
  *_GCC48_X64_RC_FLAGS             =3D DEF(GCC_X64_RC_FLAGS)=0D
  *_GCC48_X64_OBJCOPY_FLAGS        =3D=0D
@@ -63,7 +63,7 @@ index 76aaae7261..4829d5cd5d 100755
  =0D
    DEBUG_GCC48_X64_CC_FLAGS       =3D DEF(GCC48_X64_CC_FLAGS)=0D
  RELEASE_GCC48_X64_CC_FLAGS       =3D DEF(GCC48_X64_CC_FLAGS) -Wno-unused-=
but-set-variable=0D
-@@ -1206,7 +1206,7 @@ RELEASE_GCC48_AARCH64_CC_FLAGS   =3D DEF(GCC48_AARCH=
64_CC_FLAGS) -Wno-unused-but-s
+@@ -1209,7 +1209,7 @@ RELEASE_GCC48_AARCH64_CC_FLAGS   =3D DEF(GCC48_AARCH=
64_CC_FLAGS) -Wno-unused-but-s
  *_GCC49_IA32_DLINK2_FLAGS         =3D DEF(GCC49_IA32_DLINK2_FLAGS)=0D
  *_GCC49_IA32_RC_FLAGS             =3D DEF(GCC_IA32_RC_FLAGS)=0D
  *_GCC49_IA32_OBJCOPY_FLAGS        =3D=0D
@@ -72,7 +72,7 @@ index 76aaae7261..4829d5cd5d 100755
  =0D
    DEBUG_GCC49_IA32_CC_FLAGS       =3D DEF(GCC49_IA32_CC_FLAGS)=0D
  RELEASE_GCC49_IA32_CC_FLAGS       =3D DEF(GCC49_IA32_CC_FLAGS) -Wno-unuse=
d-but-set-variable -Wno-unused-const-variable=0D
-@@ -1234,7 +1234,7 @@ RELEASE_GCC49_IA32_CC_FLAGS       =3D DEF(GCC49_IA32=
_CC_FLAGS) -Wno-unused-but-set
+@@ -1237,7 +1237,7 @@ RELEASE_GCC49_IA32_CC_FLAGS       =3D DEF(GCC49_IA32=
_CC_FLAGS) -Wno-unused-but-set
  *_GCC49_X64_DLINK2_FLAGS         =3D DEF(GCC49_X64_DLINK2_FLAGS)=0D
  *_GCC49_X64_RC_FLAGS             =3D DEF(GCC_X64_RC_FLAGS)=0D
  *_GCC49_X64_OBJCOPY_FLAGS        =3D=0D
@@ -81,7 +81,7 @@ index 76aaae7261..4829d5cd5d 100755
  =0D
    DEBUG_GCC49_X64_CC_FLAGS       =3D DEF(GCC49_X64_CC_FLAGS)=0D
  RELEASE_GCC49_X64_CC_FLAGS       =3D DEF(GCC49_X64_CC_FLAGS) -Wno-unused-=
but-set-variable -Wno-unused-const-variable=0D
-@@ -1493,7 +1493,7 @@ RELEASE_GCCNOLTO_AARCH64_DLINK_XIPFLAGS =3D -z commo=
n-page-size=3D0x20
+@@ -1496,7 +1496,7 @@ RELEASE_GCCNOLTO_AARCH64_DLINK_XIPFLAGS =3D -z commo=
n-page-size=3D0x20
  *_GCC5_IA32_DLINK2_FLAGS         =3D DEF(GCC5_IA32_DLINK2_FLAGS) -no-pie=
=0D
  *_GCC5_IA32_RC_FLAGS             =3D DEF(GCC_IA32_RC_FLAGS)=0D
  *_GCC5_IA32_OBJCOPY_FLAGS        =3D=0D
@@ -90,7 +90,7 @@ index 76aaae7261..4829d5cd5d 100755
  =0D
    DEBUG_GCC5_IA32_CC_FLAGS       =3D DEF(GCC5_IA32_CC_FLAGS) -flto=0D
    DEBUG_GCC5_IA32_DLINK_FLAGS    =3D DEF(GCC5_IA32_X64_DLINK_FLAGS) -flto=
 -Os -Wl,-m,elf_i386,--oformat=3Delf32-i386=0D
-@@ -1525,7 +1525,7 @@ RELEASE_GCC5_IA32_DLINK_FLAGS    =3D DEF(GCC5_IA32_X=
64_DLINK_FLAGS) -flto -Os -Wl,
+@@ -1528,7 +1528,7 @@ RELEASE_GCC5_IA32_DLINK_FLAGS    =3D DEF(GCC5_IA32_X=
64_DLINK_FLAGS) -flto -Os -Wl,
  *_GCC5_X64_DLINK2_FLAGS          =3D DEF(GCC5_X64_DLINK2_FLAGS)=0D
  *_GCC5_X64_RC_FLAGS              =3D DEF(GCC_X64_RC_FLAGS)=0D
  *_GCC5_X64_OBJCOPY_FLAGS         =3D=0D
@@ -99,3 +99,6 @@ index 76aaae7261..4829d5cd5d 100755
  =0D
    DEBUG_GCC5_X64_CC_FLAGS        =3D DEF(GCC5_X64_CC_FLAGS) -flto -DUSING=
_LTO=0D
    DEBUG_GCC5_X64_DLINK_FLAGS     =3D DEF(GCC5_X64_DLINK_FLAGS) -flto -Os=
=0D
+--=20
+2.39.5
+
diff --git a/meta/recipes-core/ovmf/ovmf/0004-reproducible.patch b/meta/rec=
ipes-core/ovmf/ovmf/0004-reproducible.patch
index aba5d9e134e..ae0ca0c15cf 100644
--- a/meta/recipes-core/ovmf/ovmf/0004-reproducible.patch
+++ b/meta/recipes-core/ovmf/ovmf/0004-reproducible.patch
@@ -1,7 +1,7 @@
-From f4ba093ea8a8a8c333c08605b3a6ff1c82712613 Mon Sep 17 00:00:00 2001
+From fc2d3c17ff2a7b39e8d47b788eeaac5e1487cdee Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Mon, 14 Jun 2021 19:57:30 +0200
-Subject: [PATCH] reproducible
+Subject: [PATCH 4/4] reproducible
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
-index 9d04fc612e..83fd6c9c05 100644
+index 897045b2be..a66003f44a 100644
 --- a/BaseTools/Source/C/GenFw/Elf64Convert.c
 +++ b/BaseTools/Source/C/GenFw/Elf64Convert.c
 @@ -13,6 +13,8 @@ SPDX-License-Identifier: BSD-2-Clause-Patent
@@ -56,7 +56,7 @@ index 9d04fc612e..83fd6c9c05 100644
  =0D
    //=0D
    // Add more space in the .debug data region for the DllCharacteristicsE=
x=0D
-@@ -2299,7 +2301,7 @@ WriteDebug64 (
+@@ -2308,7 +2310,7 @@ WriteDebug64 (
    EFI_IMAGE_DEBUG_CODEVIEW_NB10_ENTRY         *Nb10;=0D
    EFI_IMAGE_DEBUG_EX_DLLCHARACTERISTICS_ENTRY *DllEntry;=0D
  =0D
@@ -65,7 +65,7 @@ index 9d04fc612e..83fd6c9c05 100644
  =0D
    NtHdr =3D (EFI_IMAGE_OPTIONAL_HEADER_UNION *)(mCoffFile + mNtHdrOffset)=
;=0D
    DataDir =3D &NtHdr->Pe32Plus.OptionalHeader.DataDirectory[EFI_IMAGE_DIR=
ECTORY_ENTRY_DEBUG];=0D
-@@ -2332,7 +2334,7 @@ WriteDebug64 (
+@@ -2341,7 +2343,7 @@ WriteDebug64 (
  =0D
    Nb10 =3D (EFI_IMAGE_DEBUG_CODEVIEW_NB10_ENTRY*)(Dir + 1);=0D
    Nb10->Signature =3D CODEVIEW_SIGNATURE_NB10;=0D
@@ -89,10 +89,10 @@ index 45b39d7878..3fed7d1736 100644
          if Input not in self.Inputs:=0D
              self.Inputs.append(Input)=0D
 diff --git a/BaseTools/Source/Python/AutoGen/GenMake.py b/BaseTools/Source=
/Python/AutoGen/GenMake.py
-index fbd35d4989..5ddd544d17 100755
+index 6d9c60b702..83ac267647 100755
 --- a/BaseTools/Source/Python/AutoGen/GenMake.py
 +++ b/BaseTools/Source/Python/AutoGen/GenMake.py
-@@ -575,7 +575,7 @@ cleanlib:
+@@ -576,7 +576,7 @@ cleanlib:
                  os.remove(RespFileList)=0D
  =0D
          # convert source files and binary files to build targets=0D
@@ -101,7 +101,7 @@ index fbd35d4989..5ddd544d17 100755
          if len(self.ResultFileList) =3D=3D 0 and len(MyAgo.SourceFileList=
) !=3D 0:=0D
              EdkLogger.error("build", AUTOGEN_ERROR, "Nothing to build",=0D
                              ExtraData=3D"[%s]" % str(MyAgo))=0D
-@@ -726,7 +726,7 @@ cleanlib:
+@@ -727,7 +727,7 @@ cleanlib:
          OutputFile =3D ''=0D
          DepsFileList =3D []=0D
  =0D
@@ -110,7 +110,7 @@ index fbd35d4989..5ddd544d17 100755
              if Cmd[2]:=0D
                  for CopyCmd in Cmd[2]:=0D
                      Src, Dst =3D CopyCmd=0D
-@@ -759,7 +759,7 @@ cleanlib:
+@@ -760,7 +760,7 @@ cleanlib:
              self.BuildTargetList.append('\t%s' % CmdString)=0D
  =0D
              self.ParseSecCmd(DepsFileList, Cmd[1])=0D
@@ -119,7 +119,7 @@ index fbd35d4989..5ddd544d17 100755
                  self.BuildTargetList.append('%s : %s' % (self.ReplaceMacr=
o(SecOutputFile), self.ReplaceMacro(SecDepsFile)))=0D
                  self.BuildTargetList.append('\t%s' % self.ReplaceMacro(Se=
cCmd))=0D
              self.FfsOutputFileList =3D []=0D
-@@ -798,13 +798,13 @@ cleanlib:
+@@ -799,13 +799,13 @@ cleanlib:
  =0D
      def CommandExceedLimit(self):=0D
          FlagDict =3D {=0D
@@ -140,7 +140,7 @@ index fbd35d4989..5ddd544d17 100755
                     }=0D
  =0D
          RespDict =3D {}=0D
-@@ -1007,9 +1007,9 @@ cleanlib:
+@@ -1008,9 +1008,9 @@ cleanlib:
                  if not self.ObjTargetDict.get(T.Target.SubDir):=0D
                      self.ObjTargetDict[T.Target.SubDir] =3D set()=0D
                  self.ObjTargetDict[T.Target.SubDir].add(NewFile)=0D
@@ -175,3 +175,6 @@ index 65a2176ca9..318b9611ce 100755
  =0D
          # Ignore generating makefile when it is a binary module=0D
          if self.IsBinaryModule:=0D
+--=20
+2.39.5
+
diff --git a/meta/recipes-core/ovmf/ovmf_git.bb b/meta/recipes-core/ovmf/ov=
mf_git.bb
index e7617364533..9aa831badca 100644
--- a/meta/recipes-core/ovmf/ovmf_git.bb
+++ b/meta/recipes-core/ovmf/ovmf_git.bb
@@ -26,8 +26,8 @@ SRC_URI =3D "gitsm://github.com/tianocore/edk2.git;branch=
=3Dmaster;protocol=3Dhttps \
            file://0004-reproducible.patch \
            "
=20
-PV =3D "edk2-stable202408"
-SRCREV =3D "b158dad150bf02879668f72ce306445250838201"
+PV =3D "edk2-stable202411"
+SRCREV =3D "0f3867fa6ef0553e26c42f7d71ff6bdb98429742"
 UPSTREAM_CHECK_GITTAGREGEX =3D "(?P<pver>edk2-stable.*)"
=20
 CVE_PRODUCT =3D "edk2"
--=20
2.39.5


