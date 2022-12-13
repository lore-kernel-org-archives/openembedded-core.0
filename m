Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC7DDC4708E
	for <webhook@archiver.kernel.org>; Tue, 13 Dec 2022 11:11:46 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web10.70642.1670929897369536242
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Dec 2022 03:11:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=QdqE99G2;
 spf=pass (domain: gmail.com, ip: 209.85.221.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id i7so595780wrv.8
        for <openembedded-core@lists.openembedded.org>; Tue, 13 Dec 2022 03:11:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XT2jSBSbaUBT8ayzPu6xA56tmFwFBroz2NjNKoT+MtI=;
        b=QdqE99G2cQVH/82H41+IoZ3Xq5a9ZZBufhXa+Jtk/+dBSerVnNs5q+Dw9lmOKbGV//
         rD0r1rKkCqYWa6YZfiwgGgKjVlNFkrUVuuXN5IFBDgyKNSFYTLcKonZU+niKCJ8yC0MB
         dqs/iO+5naquUFWbWFQNPZwQhPIHAt/BEjfABbpPL9RVoKDCSHV+eJ4mFYBJKJF3Ody9
         nheENNTn9xGSF+NyovFWroAXKGHIZ0h1Q2WChLdgw2+vTikcqhB0Pa56CEeGg0aqOKis
         VaxKeG/Zv1XY8FuqJhGfkUYjPpA8KcFaTkLZyED3CAT87Qk5qQ6wuP/ozYkfwRHtW0LD
         6kgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XT2jSBSbaUBT8ayzPu6xA56tmFwFBroz2NjNKoT+MtI=;
        b=o7cw0+ANnU5Obe/d9nTOUwQqQF4SA+wof3N2pY7HRu2S2L4vzpKrhHH9coSM+HinZC
         UmZJ2eEDxPX7YMYs8oxOrYXlbK0iUq/P2qrkwjuLi/PK5IwyYYL51o067E4ODik/4IHJ
         5ABUy9UXOiilO5JqwK/xkYGTq9ahVs4gYZMtO67FQ2sQYndUCBp/gwuJ7o+CPjaKfoDH
         gli5uPB0bxaJonwP4a7LkjxbOk8/h5KAQzd9BrcnDW6oCTTWfaYuhZGOFWh9VXX71b0b
         BwTQPXztryDC4LJanM/16u92qoiZ6D+TudUWm6fGN7RN2kD+yJ7xqhj9CKjwBCVmAwT1
         0UYA==
X-Gm-Message-State: ANoB5pkkKLlv8Oztc7UadSXbyZt5pV9/bpjwvUw9SETntr3wvg0Dl38L
	vqSPS11pWKngZzKe6qu7Nw3c5RXi8YA=
X-Google-Smtp-Source: AA0mqf683l3N5YoyDPhSuetfF0DjzIP60hCYwbxnQszTfylnjV4E6YNrX/UkZiHek7ym0PdTep1knA==
X-Received: by 2002:adf:e503:0:b0:242:8bf:a690 with SMTP id j3-20020adfe503000000b0024208bfa690mr15707707wrm.38.1670929895801;
        Tue, 13 Dec 2022 03:11:35 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id m8-20020a056000008800b002366c3eefccsm11362665wrx.109.2022.12.13.03.11.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Dec 2022 03:11:35 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 17/24] ovmf: update edk2-stable202208 -> edk2-stable202211
Date: Tue, 13 Dec 2022 12:11:11 +0100
Message-Id: <20221213111118.149697-17-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221213111118.149697-1-alex@linutronix.de>
References: <20221213111118.149697-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Dec 2022 11:11:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174527

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../ovmf/ovmf/0005-debug-prefix-map.patch     | 26 +++++++++----------
 meta/recipes-core/ovmf/ovmf_git.bb            |  4 +--
 2 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/meta/recipes-core/ovmf/ovmf/0005-debug-prefix-map.patch b/meta=
/recipes-core/ovmf/ovmf/0005-debug-prefix-map.patch
index 9e345f4dda..1b6687cfaf 100644
--- a/meta/recipes-core/ovmf/ovmf/0005-debug-prefix-map.patch
+++ b/meta/recipes-core/ovmf/ovmf/0005-debug-prefix-map.patch
@@ -1,7 +1,7 @@
-From 860bb1979f3578bb83257076fe0f3bd33f9d68bf Mon Sep 17 00:00:00 2001
+From 9f28dd5f183f6e4d2b023cd555bb30446ae5f618 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Mon, 14 Jun 2021 19:56:28 +0200
-Subject: [PATCH 5/6] debug prefix map
+Subject: [PATCH] debug prefix map
=20
 We want to pass ${DEBUG_PREFIX_MAP} to gcc commands and also pass in
  --debug-prefix-map to nasm (we carry a patch to nasm for this). The
@@ -22,10 +22,10 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.co=
m>
  1 file changed, 9 insertions(+), 9 deletions(-)
=20
 diff --git a/BaseTools/Conf/tools_def.template b/BaseTools/Conf/tools_def.=
template
-index 36241b6ede..947fbf2e8d 100755
+index c4e4c7ded0..058205da72 100755
 --- a/BaseTools/Conf/tools_def.template
 +++ b/BaseTools/Conf/tools_def.template
-@@ -1863,7 +1863,7 @@ NOOPT_*_*_OBJCOPY_ADDDEBUGFLAG     =3D --add-gnu-deb=
uglink=3D$(DEBUG_DIR)/$(MODULE_N
+@@ -1849,7 +1849,7 @@ NOOPT_*_*_OBJCOPY_ADDDEBUGFLAG     =3D --add-gnu-deb=
uglink=3D$(DEBUG_DIR)/$(MODULE_N
  *_*_*_DTCPP_PATH                   =3D DEF(DTCPP_BIN)=0D
  *_*_*_DTC_PATH                     =3D DEF(DTC_BIN)=0D
  =0D
@@ -34,9 +34,9 @@ index 36241b6ede..947fbf2e8d 100755
  DEFINE GCC_IA32_CC_FLAGS           =3D DEF(GCC_ALL_CC_FLAGS) -m32 -malign=
-double -freorder-blocks -freorder-blocks-and-partition -O2 -mno-stack-arg-=
probe=0D
  DEFINE GCC_X64_CC_FLAGS            =3D DEF(GCC_ALL_CC_FLAGS) -mno-red-zon=
e -Wno-address -mno-stack-arg-probe=0D
  DEFINE GCC_ARM_CC_FLAGS            =3D DEF(GCC_ALL_CC_FLAGS) -mlittle-end=
ian -mabi=3Daapcs -fno-short-enums -funsigned-char -ffunction-sections -fda=
ta-sections -fomit-frame-pointer -Wno-address -mthumb -mfloat-abi=3Dsoft -f=
no-pic -fno-pie=0D
-@@ -1881,8 +1881,8 @@ DEFINE GCC_IA32_X64_ASLDLINK_FLAGS =3D DEF(GCC_IA32_=
X64_DLINK_COMMON) --entry _Ref
- DEFINE GCC_ARM_ASLDLINK_FLAGS      =3D DEF(GCC_ARM_DLINK_FLAGS) -Wl,--ent=
ry,ReferenceAcpiTable -u $(IMAGE_ENTRY_POINT) DEF(GCC_ARM_AARCH64_ASLDLINK_=
FLAGS)=0D
+@@ -1871,8 +1871,8 @@ DEFINE GCC_ARM_ASLDLINK_FLAGS      =3D DEF(GCC_ARM_D=
LINK_FLAGS) -Wl,--entry,Refere
  DEFINE GCC_AARCH64_ASLDLINK_FLAGS  =3D DEF(GCC_AARCH64_DLINK_FLAGS) -Wl,-=
-entry,ReferenceAcpiTable -u $(IMAGE_ENTRY_POINT) DEF(GCC_ARM_AARCH64_ASLDL=
INK_FLAGS)=0D
+ DEFINE GCC_LOONGARCH64_ASLDLINK_FLAGS =3D DEF(GCC_LOONGARCH64_DLINK_FLAGS=
) -Wl,--entry,ReferenceAcpiTable -u $(IMAGE_ENTRY_POINT)=0D
  DEFINE GCC_IA32_X64_DLINK_FLAGS    =3D DEF(GCC_IA32_X64_DLINK_COMMON) --e=
ntry _$(IMAGE_ENTRY_POINT) --file-alignment 0x20 --section-alignment 0x20 -=
Map $(DEST_DIR_DEBUG)/$(BASE_NAME).map=0D
 -DEFINE GCC_ASM_FLAGS               =3D -c -x assembler -imacros AutoGen.h=
=0D
 -DEFINE GCC_PP_FLAGS                =3D -E -x assembler-with-cpp -include =
AutoGen.h=0D
@@ -45,7 +45,7 @@ index 36241b6ede..947fbf2e8d 100755
  DEFINE GCC_VFRPP_FLAGS             =3D -x c -E -P -DVFRCOMPILE --include =
$(MODULE_NAME)StrDefs.h=0D
  DEFINE GCC_ASLPP_FLAGS             =3D -x c -E -include AutoGen.h=0D
  DEFINE GCC_ASLCC_FLAGS             =3D -x c=0D
-@@ -2027,7 +2027,7 @@ DEFINE GCC_PP_FLAGS                        =3D -E -x=
 assembler-with-cpp -include A
+@@ -2026,7 +2026,7 @@ DEFINE GCC_PP_FLAGS                        =3D -E -x=
 assembler-with-cpp -include A
  *_GCC48_IA32_DLINK2_FLAGS         =3D DEF(GCC48_IA32_DLINK2_FLAGS)=0D
  *_GCC48_IA32_RC_FLAGS             =3D DEF(GCC_IA32_RC_FLAGS)=0D
  *_GCC48_IA32_OBJCOPY_FLAGS        =3D=0D
@@ -54,7 +54,7 @@ index 36241b6ede..947fbf2e8d 100755
  =0D
    DEBUG_GCC48_IA32_CC_FLAGS       =3D DEF(GCC48_IA32_CC_FLAGS) -Os=0D
  RELEASE_GCC48_IA32_CC_FLAGS       =3D DEF(GCC48_IA32_CC_FLAGS) -Os -Wno-u=
nused-but-set-variable=0D
-@@ -2055,7 +2055,7 @@ RELEASE_GCC48_IA32_CC_FLAGS       =3D DEF(GCC48_IA32=
_CC_FLAGS) -Os -Wno-unused-but
+@@ -2054,7 +2054,7 @@ RELEASE_GCC48_IA32_CC_FLAGS       =3D DEF(GCC48_IA32=
_CC_FLAGS) -Os -Wno-unused-but
  *_GCC48_X64_DLINK2_FLAGS         =3D DEF(GCC48_X64_DLINK2_FLAGS)=0D
  *_GCC48_X64_RC_FLAGS             =3D DEF(GCC_X64_RC_FLAGS)=0D
  *_GCC48_X64_OBJCOPY_FLAGS        =3D=0D
@@ -63,7 +63,7 @@ index 36241b6ede..947fbf2e8d 100755
  =0D
    DEBUG_GCC48_X64_CC_FLAGS       =3D DEF(GCC48_X64_CC_FLAGS) -Os=0D
  RELEASE_GCC48_X64_CC_FLAGS       =3D DEF(GCC48_X64_CC_FLAGS) -Os -Wno-unu=
sed-but-set-variable=0D
-@@ -2167,7 +2167,7 @@ RELEASE_GCC48_AARCH64_CC_FLAGS   =3D DEF(GCC48_AARCH=
64_CC_FLAGS) -Wno-unused-but-s
+@@ -2166,7 +2166,7 @@ RELEASE_GCC48_AARCH64_CC_FLAGS   =3D DEF(GCC48_AARCH=
64_CC_FLAGS) -Wno-unused-but-s
  *_GCC49_IA32_DLINK2_FLAGS         =3D DEF(GCC49_IA32_DLINK2_FLAGS)=0D
  *_GCC49_IA32_RC_FLAGS             =3D DEF(GCC_IA32_RC_FLAGS)=0D
  *_GCC49_IA32_OBJCOPY_FLAGS        =3D=0D
@@ -72,7 +72,7 @@ index 36241b6ede..947fbf2e8d 100755
  =0D
    DEBUG_GCC49_IA32_CC_FLAGS       =3D DEF(GCC49_IA32_CC_FLAGS) -Os=0D
  RELEASE_GCC49_IA32_CC_FLAGS       =3D DEF(GCC49_IA32_CC_FLAGS) -Os -Wno-u=
nused-but-set-variable -Wno-unused-const-variable=0D
-@@ -2195,7 +2195,7 @@ RELEASE_GCC49_IA32_CC_FLAGS       =3D DEF(GCC49_IA32=
_CC_FLAGS) -Os -Wno-unused-but
+@@ -2194,7 +2194,7 @@ RELEASE_GCC49_IA32_CC_FLAGS       =3D DEF(GCC49_IA32=
_CC_FLAGS) -Os -Wno-unused-but
  *_GCC49_X64_DLINK2_FLAGS         =3D DEF(GCC49_X64_DLINK2_FLAGS)=0D
  *_GCC49_X64_RC_FLAGS             =3D DEF(GCC_X64_RC_FLAGS)=0D
  *_GCC49_X64_OBJCOPY_FLAGS        =3D=0D
@@ -81,7 +81,7 @@ index 36241b6ede..947fbf2e8d 100755
  =0D
    DEBUG_GCC49_X64_CC_FLAGS       =3D DEF(GCC49_X64_CC_FLAGS) -Os=0D
  RELEASE_GCC49_X64_CC_FLAGS       =3D DEF(GCC49_X64_CC_FLAGS) -Os -Wno-unu=
sed-but-set-variable -Wno-unused-const-variable=0D
-@@ -2313,7 +2313,7 @@ RELEASE_GCC49_AARCH64_DLINK_XIPFLAGS =3D -z common-p=
age-size=3D0x20
+@@ -2312,7 +2312,7 @@ RELEASE_GCC49_AARCH64_DLINK_XIPFLAGS =3D -z common-p=
age-size=3D0x20
  *_GCC5_IA32_DLINK2_FLAGS         =3D DEF(GCC5_IA32_DLINK2_FLAGS) -no-pie=
=0D
  *_GCC5_IA32_RC_FLAGS             =3D DEF(GCC_IA32_RC_FLAGS)=0D
  *_GCC5_IA32_OBJCOPY_FLAGS        =3D=0D
@@ -90,7 +90,7 @@ index 36241b6ede..947fbf2e8d 100755
  =0D
    DEBUG_GCC5_IA32_CC_FLAGS       =3D DEF(GCC5_IA32_CC_FLAGS) -flto -Os=0D
    DEBUG_GCC5_IA32_DLINK_FLAGS    =3D DEF(GCC5_IA32_X64_DLINK_FLAGS) -flto=
 -Os -Wl,-m,elf_i386,--oformat=3Delf32-i386=0D
-@@ -2345,7 +2345,7 @@ RELEASE_GCC5_IA32_DLINK_FLAGS    =3D DEF(GCC5_IA32_X=
64_DLINK_FLAGS) -flto -Os -Wl,
+@@ -2344,7 +2344,7 @@ RELEASE_GCC5_IA32_DLINK_FLAGS    =3D DEF(GCC5_IA32_X=
64_DLINK_FLAGS) -flto -Os -Wl,
  *_GCC5_X64_DLINK2_FLAGS          =3D DEF(GCC5_X64_DLINK2_FLAGS)=0D
  *_GCC5_X64_RC_FLAGS              =3D DEF(GCC_X64_RC_FLAGS)=0D
  *_GCC5_X64_OBJCOPY_FLAGS         =3D=0D
@@ -100,5 +100,5 @@ index 36241b6ede..947fbf2e8d 100755
    DEBUG_GCC5_X64_CC_FLAGS        =3D DEF(GCC5_X64_CC_FLAGS) -flto -DUSING=
_LTO -Os=0D
    DEBUG_GCC5_X64_DLINK_FLAGS     =3D DEF(GCC5_X64_DLINK_FLAGS) -flto -Os=
=0D
 --=20
-2.32.0
+2.30.2
=20
diff --git a/meta/recipes-core/ovmf/ovmf_git.bb b/meta/recipes-core/ovmf/ov=
mf_git.bb
index d1bf8b080d..5ca0b49b69 100644
--- a/meta/recipes-core/ovmf/ovmf_git.bb
+++ b/meta/recipes-core/ovmf/ovmf_git.bb
@@ -26,8 +26,8 @@ SRC_URI =3D "gitsm://github.com/tianocore/edk2.git;branch=
=3Dmaster;protocol=3Dhttps \
            file://0006-reproducible.patch \
            "
=20
-PV =3D "edk2-stable202208"
-SRCREV =3D "ba0e0e4c6a174b71b18ccd6e47319cc45878893c"
+PV =3D "edk2-stable202211"
+SRCREV =3D "fff6d81270b57ee786ea18ad74f43149b9f03494"
 UPSTREAM_CHECK_GITTAGREGEX =3D "(?P<pver>edk2-stable.*)"
=20
 inherit deploy
--=20
2.30.2


