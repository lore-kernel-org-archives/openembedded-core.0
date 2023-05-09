Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AE35C7EE22
	for <webhook@archiver.kernel.org>; Tue,  9 May 2023 17:23:54 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.web10.39157.1683653033066250407
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 May 2023 10:23:53 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=Vbsu5z2l;
 spf=pass (domain: gmail.com, ip: 209.85.218.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-96598a7c5e0so981116366b.3
        for <openembedded-core@lists.openembedded.org>; Tue, 09 May 2023 10:23:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683653031; x=1686245031;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C9wQc77+ojSHOdFtt6OHLK0P4yHrblh0GLWAdWRXVZo=;
        b=Vbsu5z2la6OmAR9SxaEEcZGJS4NneLGaSqnDqaOK89dw1lkttolsvYQ9VOHa1/sCCQ
         o8xVccFtsBYlD3/8ZLGWRQkV9HVbf07z7gQZbvIfJeGV3PuNDMU4Jjwls9DGSnASHETF
         6BIVIK+YygphwNKGLOqVMoZPk3DKnGA8WI4iWpwffujbzu1ZqJ1lkZUNrDM8pa4yZgDA
         HZwGOl5g4k4jUk8MgojrxUiaHq2lCURLVzkbzd+oixfewte0VJpr0ojmi2XqEmaJamY7
         Gf2lA51FQ2HmGvGl+OZaSuEaM6tAATDFj37gUao1T6tfzGsKZ14kK1cSSjNnbPCoHW7Q
         80kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683653031; x=1686245031;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C9wQc77+ojSHOdFtt6OHLK0P4yHrblh0GLWAdWRXVZo=;
        b=aNrJ5WpBBbXgNJD8oAaG6BG6pyafaKjNbJErBTWORVHGe0BjGxKkUkge6BJOSW55SA
         X1z0S62demsHDip22W/kf91Qb9k9ZfpiqCtAcHapmha+MHIIVArIYSJspYae+e/wvll/
         eWDdP6/lPqEYjZRhBuPumN0YcZ0OAl5YNQFdVoOU7SnDIYEwvKSDg+aVnfKzIvmPbO35
         UyHXwL7CzATAROEQu+kQZVAo/LuvogSJ6nJgA3dF7YNCBH0jsDvFRRVku2Oh/ta9dbky
         5EmWssGPUaI+5rrrKMJUlbb4KfnqDVQ1hanYYYDXg/mSr4t3+hP9rFnZsZCur/E9yTIX
         mX8w==
X-Gm-Message-State: AC+VfDwgrUmvtY2VhHess7s5WDBrphmK/Tu1bNkmFmzQNN+YUhgH1yUO
	ltT2mVYkv1Q+GHdGevjLTTO1B8IZVDo=
X-Google-Smtp-Source: ACHHUZ5u5ZTUnUDE3MwNOpp3GttZktzAqYh8p1aZ9A+FAUbOVBLbku9UOqTkbKGC5ltUxJdLJwiFcQ==
X-Received: by 2002:a17:907:98e:b0:94a:5c6d:3207 with SMTP id bf14-20020a170907098e00b0094a5c6d3207mr13310817ejc.44.1683653031609;
        Tue, 09 May 2023 10:23:51 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id jz24-20020a17090775f800b0096347ef816dsm1578252ejc.64.2023.05.09.10.23.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 May 2023 10:23:51 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 06/27] ovmf: update 202211 -> 202302
Date: Tue,  9 May 2023 19:23:23 +0200
Message-Id: <20230509172344.1516743-6-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230509172344.1516743-1-alex@linutronix.de>
References: <20230509172344.1516743-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 May 2023 17:23:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181061

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../ovmf/ovmf/0005-debug-prefix-map.patch     | 44 +++++++++----------
 meta/recipes-core/ovmf/ovmf_git.bb            |  4 +-
 2 files changed, 24 insertions(+), 24 deletions(-)

diff --git a/meta/recipes-core/ovmf/ovmf/0005-debug-prefix-map.patch b/meta=
/recipes-core/ovmf/ovmf/0005-debug-prefix-map.patch
index 1b6687cfafc..7adc45465c0 100644
--- a/meta/recipes-core/ovmf/ovmf/0005-debug-prefix-map.patch
+++ b/meta/recipes-core/ovmf/ovmf/0005-debug-prefix-map.patch
@@ -1,4 +1,4 @@
-From 9f28dd5f183f6e4d2b023cd555bb30446ae5f618 Mon Sep 17 00:00:00 2001
+From cf6361f27cd6318622fd58ab6c0a9407cc633b1e Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Mon, 14 Jun 2021 19:56:28 +0200
 Subject: [PATCH] debug prefix map
@@ -22,7 +22,7 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 9 insertions(+), 9 deletions(-)
=20
 diff --git a/BaseTools/Conf/tools_def.template b/BaseTools/Conf/tools_def.=
template
-index c4e4c7ded0..058205da72 100755
+index 471eb67c0c..a16fb5c9f1 100755
 --- a/BaseTools/Conf/tools_def.template
 +++ b/BaseTools/Conf/tools_def.template
 @@ -1849,7 +1849,7 @@ NOOPT_*_*_OBJCOPY_ADDDEBUGFLAG     =3D --add-gnu-deb=
uglink=3D$(DEBUG_DIR)/$(MODULE_N
@@ -31,10 +31,10 @@ index c4e4c7ded0..058205da72 100755
  =0D
 -DEFINE GCC_ALL_CC_FLAGS            =3D -g -Os -fshort-wchar -fno-builtin =
-fno-strict-aliasing -Wall -Werror -Wno-array-bounds -include AutoGen.h -fn=
o-common=0D
 +DEFINE GCC_ALL_CC_FLAGS            =3D -g -Os -fshort-wchar -fno-builtin =
-fno-strict-aliasing -Wall -Werror -Wno-array-bounds -include AutoGen.h -fn=
o-common ENV(GCC_PREFIX_MAP)=0D
- DEFINE GCC_IA32_CC_FLAGS           =3D DEF(GCC_ALL_CC_FLAGS) -m32 -malign=
-double -freorder-blocks -freorder-blocks-and-partition -O2 -mno-stack-arg-=
probe=0D
- DEFINE GCC_X64_CC_FLAGS            =3D DEF(GCC_ALL_CC_FLAGS) -mno-red-zon=
e -Wno-address -mno-stack-arg-probe=0D
- DEFINE GCC_ARM_CC_FLAGS            =3D DEF(GCC_ALL_CC_FLAGS) -mlittle-end=
ian -mabi=3Daapcs -fno-short-enums -funsigned-char -ffunction-sections -fda=
ta-sections -fomit-frame-pointer -Wno-address -mthumb -mfloat-abi=3Dsoft -f=
no-pic -fno-pie=0D
-@@ -1871,8 +1871,8 @@ DEFINE GCC_ARM_ASLDLINK_FLAGS      =3D DEF(GCC_ARM_D=
LINK_FLAGS) -Wl,--entry,Refere
+ DEFINE GCC_ARM_CC_FLAGS            =3D DEF(GCC_ALL_CC_FLAGS) -mlittle-end=
ian -mabi=3Daapcs -fno-short-enums -funsigned-char -ffunction-sections -fda=
ta-sections -fomit-frame-pointer -Wno-address -mthumb -fno-pic -fno-pie=0D
+ DEFINE GCC_LOONGARCH64_CC_FLAGS    =3D DEF(GCC_ALL_CC_FLAGS) -mabi=3Dlp64=
d -fno-asynchronous-unwind-tables -fno-plt -Wno-address -fno-short-enums -f=
signed-char -ffunction-sections -fdata-sections=0D
+ DEFINE GCC_ARM_CC_XIPFLAGS         =3D -mno-unaligned-access=0D
+@@ -1869,8 +1869,8 @@ DEFINE GCC_ARM_ASLDLINK_FLAGS      =3D DEF(GCC_ARM_D=
LINK_FLAGS) -Wl,--entry,Refere
  DEFINE GCC_AARCH64_ASLDLINK_FLAGS  =3D DEF(GCC_AARCH64_DLINK_FLAGS) -Wl,-=
-entry,ReferenceAcpiTable -u $(IMAGE_ENTRY_POINT) DEF(GCC_ARM_AARCH64_ASLDL=
INK_FLAGS)=0D
  DEFINE GCC_LOONGARCH64_ASLDLINK_FLAGS =3D DEF(GCC_LOONGARCH64_DLINK_FLAGS=
) -Wl,--entry,ReferenceAcpiTable -u $(IMAGE_ENTRY_POINT)=0D
  DEFINE GCC_IA32_X64_DLINK_FLAGS    =3D DEF(GCC_IA32_X64_DLINK_COMMON) --e=
ntry _$(IMAGE_ENTRY_POINT) --file-alignment 0x20 --section-alignment 0x20 -=
Map $(DEST_DIR_DEBUG)/$(BASE_NAME).map=0D
@@ -45,59 +45,59 @@ index c4e4c7ded0..058205da72 100755
  DEFINE GCC_VFRPP_FLAGS             =3D -x c -E -P -DVFRCOMPILE --include =
$(MODULE_NAME)StrDefs.h=0D
  DEFINE GCC_ASLPP_FLAGS             =3D -x c -E -include AutoGen.h=0D
  DEFINE GCC_ASLCC_FLAGS             =3D -x c=0D
-@@ -2026,7 +2026,7 @@ DEFINE GCC_PP_FLAGS                        =3D -E -x=
 assembler-with-cpp -include A
+@@ -2022,7 +2022,7 @@ DEFINE GCC5_LOONGARCH64_PP_FLAGS           =3D -mabi=
=3Dlp64d -march=3Dloongarch64 DEF(
  *_GCC48_IA32_DLINK2_FLAGS         =3D DEF(GCC48_IA32_DLINK2_FLAGS)=0D
  *_GCC48_IA32_RC_FLAGS             =3D DEF(GCC_IA32_RC_FLAGS)=0D
  *_GCC48_IA32_OBJCOPY_FLAGS        =3D=0D
 -*_GCC48_IA32_NASM_FLAGS           =3D -f elf32=0D
 +*_GCC48_IA32_NASM_FLAGS           =3D -f elf32 ENV(NASM_PREFIX_MAP)=0D
  =0D
-   DEBUG_GCC48_IA32_CC_FLAGS       =3D DEF(GCC48_IA32_CC_FLAGS) -Os=0D
- RELEASE_GCC48_IA32_CC_FLAGS       =3D DEF(GCC48_IA32_CC_FLAGS) -Os -Wno-u=
nused-but-set-variable=0D
-@@ -2054,7 +2054,7 @@ RELEASE_GCC48_IA32_CC_FLAGS       =3D DEF(GCC48_IA32=
_CC_FLAGS) -Os -Wno-unused-but
+   DEBUG_GCC48_IA32_CC_FLAGS       =3D DEF(GCC48_IA32_CC_FLAGS)=0D
+ RELEASE_GCC48_IA32_CC_FLAGS       =3D DEF(GCC48_IA32_CC_FLAGS) -Wno-unuse=
d-but-set-variable=0D
+@@ -2050,7 +2050,7 @@ RELEASE_GCC48_IA32_CC_FLAGS       =3D DEF(GCC48_IA32=
_CC_FLAGS) -Wno-unused-but-set
  *_GCC48_X64_DLINK2_FLAGS         =3D DEF(GCC48_X64_DLINK2_FLAGS)=0D
  *_GCC48_X64_RC_FLAGS             =3D DEF(GCC_X64_RC_FLAGS)=0D
  *_GCC48_X64_OBJCOPY_FLAGS        =3D=0D
 -*_GCC48_X64_NASM_FLAGS           =3D -f elf64=0D
 +*_GCC48_X64_NASM_FLAGS           =3D -f elf64 ENV(NASM_PREFIX_MAP)=0D
  =0D
-   DEBUG_GCC48_X64_CC_FLAGS       =3D DEF(GCC48_X64_CC_FLAGS) -Os=0D
- RELEASE_GCC48_X64_CC_FLAGS       =3D DEF(GCC48_X64_CC_FLAGS) -Os -Wno-unu=
sed-but-set-variable=0D
-@@ -2166,7 +2166,7 @@ RELEASE_GCC48_AARCH64_CC_FLAGS   =3D DEF(GCC48_AARCH=
64_CC_FLAGS) -Wno-unused-but-s
+   DEBUG_GCC48_X64_CC_FLAGS       =3D DEF(GCC48_X64_CC_FLAGS)=0D
+ RELEASE_GCC48_X64_CC_FLAGS       =3D DEF(GCC48_X64_CC_FLAGS) -Wno-unused-=
but-set-variable=0D
+@@ -2159,7 +2159,7 @@ RELEASE_GCC48_AARCH64_CC_FLAGS   =3D DEF(GCC48_AARCH=
64_CC_FLAGS) -Wno-unused-but-s
  *_GCC49_IA32_DLINK2_FLAGS         =3D DEF(GCC49_IA32_DLINK2_FLAGS)=0D
  *_GCC49_IA32_RC_FLAGS             =3D DEF(GCC_IA32_RC_FLAGS)=0D
  *_GCC49_IA32_OBJCOPY_FLAGS        =3D=0D
 -*_GCC49_IA32_NASM_FLAGS           =3D -f elf32=0D
 +*_GCC49_IA32_NASM_FLAGS           =3D -f elf32 ENV(NASM_PREFIX_MAP)=0D
  =0D
-   DEBUG_GCC49_IA32_CC_FLAGS       =3D DEF(GCC49_IA32_CC_FLAGS) -Os=0D
- RELEASE_GCC49_IA32_CC_FLAGS       =3D DEF(GCC49_IA32_CC_FLAGS) -Os -Wno-u=
nused-but-set-variable -Wno-unused-const-variable=0D
-@@ -2194,7 +2194,7 @@ RELEASE_GCC49_IA32_CC_FLAGS       =3D DEF(GCC49_IA32=
_CC_FLAGS) -Os -Wno-unused-but
+   DEBUG_GCC49_IA32_CC_FLAGS       =3D DEF(GCC49_IA32_CC_FLAGS)=0D
+ RELEASE_GCC49_IA32_CC_FLAGS       =3D DEF(GCC49_IA32_CC_FLAGS) -Wno-unuse=
d-but-set-variable -Wno-unused-const-variable=0D
+@@ -2187,7 +2187,7 @@ RELEASE_GCC49_IA32_CC_FLAGS       =3D DEF(GCC49_IA32=
_CC_FLAGS) -Wno-unused-but-set
  *_GCC49_X64_DLINK2_FLAGS         =3D DEF(GCC49_X64_DLINK2_FLAGS)=0D
  *_GCC49_X64_RC_FLAGS             =3D DEF(GCC_X64_RC_FLAGS)=0D
  *_GCC49_X64_OBJCOPY_FLAGS        =3D=0D
 -*_GCC49_X64_NASM_FLAGS           =3D -f elf64=0D
 +*_GCC49_X64_NASM_FLAGS           =3D -f elf64 ENV(NASM_PREFIX_MAP)=0D
  =0D
-   DEBUG_GCC49_X64_CC_FLAGS       =3D DEF(GCC49_X64_CC_FLAGS) -Os=0D
- RELEASE_GCC49_X64_CC_FLAGS       =3D DEF(GCC49_X64_CC_FLAGS) -Os -Wno-unu=
sed-but-set-variable -Wno-unused-const-variable=0D
-@@ -2312,7 +2312,7 @@ RELEASE_GCC49_AARCH64_DLINK_XIPFLAGS =3D -z common-p=
age-size=3D0x20
+   DEBUG_GCC49_X64_CC_FLAGS       =3D DEF(GCC49_X64_CC_FLAGS)=0D
+ RELEASE_GCC49_X64_CC_FLAGS       =3D DEF(GCC49_X64_CC_FLAGS) -Wno-unused-=
but-set-variable -Wno-unused-const-variable=0D
+@@ -2302,7 +2302,7 @@ RELEASE_GCC49_AARCH64_DLINK_XIPFLAGS =3D -z common-p=
age-size=3D0x20
  *_GCC5_IA32_DLINK2_FLAGS         =3D DEF(GCC5_IA32_DLINK2_FLAGS) -no-pie=
=0D
  *_GCC5_IA32_RC_FLAGS             =3D DEF(GCC_IA32_RC_FLAGS)=0D
  *_GCC5_IA32_OBJCOPY_FLAGS        =3D=0D
 -*_GCC5_IA32_NASM_FLAGS           =3D -f elf32=0D
 +*_GCC5_IA32_NASM_FLAGS           =3D -f elf32 ENV(NASM_PREFIX_MAP)=0D
  =0D
-   DEBUG_GCC5_IA32_CC_FLAGS       =3D DEF(GCC5_IA32_CC_FLAGS) -flto -Os=0D
+   DEBUG_GCC5_IA32_CC_FLAGS       =3D DEF(GCC5_IA32_CC_FLAGS) -flto=0D
    DEBUG_GCC5_IA32_DLINK_FLAGS    =3D DEF(GCC5_IA32_X64_DLINK_FLAGS) -flto=
 -Os -Wl,-m,elf_i386,--oformat=3Delf32-i386=0D
-@@ -2344,7 +2344,7 @@ RELEASE_GCC5_IA32_DLINK_FLAGS    =3D DEF(GCC5_IA32_X=
64_DLINK_FLAGS) -flto -Os -Wl,
+@@ -2334,7 +2334,7 @@ RELEASE_GCC5_IA32_DLINK_FLAGS    =3D DEF(GCC5_IA32_X=
64_DLINK_FLAGS) -flto -Os -Wl,
  *_GCC5_X64_DLINK2_FLAGS          =3D DEF(GCC5_X64_DLINK2_FLAGS)=0D
  *_GCC5_X64_RC_FLAGS              =3D DEF(GCC_X64_RC_FLAGS)=0D
  *_GCC5_X64_OBJCOPY_FLAGS         =3D=0D
 -*_GCC5_X64_NASM_FLAGS            =3D -f elf64=0D
 +*_GCC5_X64_NASM_FLAGS            =3D -f elf64 ENV(NASM_PREFIX_MAP)=0D
  =0D
-   DEBUG_GCC5_X64_CC_FLAGS        =3D DEF(GCC5_X64_CC_FLAGS) -flto -DUSING=
_LTO -Os=0D
+   DEBUG_GCC5_X64_CC_FLAGS        =3D DEF(GCC5_X64_CC_FLAGS) -flto -DUSING=
_LTO=0D
    DEBUG_GCC5_X64_DLINK_FLAGS     =3D DEF(GCC5_X64_DLINK_FLAGS) -flto -Os=
=0D
 --=20
 2.30.2
diff --git a/meta/recipes-core/ovmf/ovmf_git.bb b/meta/recipes-core/ovmf/ov=
mf_git.bb
index 5ca0b49b69e..bd92c5d43d7 100644
--- a/meta/recipes-core/ovmf/ovmf_git.bb
+++ b/meta/recipes-core/ovmf/ovmf_git.bb
@@ -26,8 +26,8 @@ SRC_URI =3D "gitsm://github.com/tianocore/edk2.git;branch=
=3Dmaster;protocol=3Dhttps \
            file://0006-reproducible.patch \
            "
=20
-PV =3D "edk2-stable202211"
-SRCREV =3D "fff6d81270b57ee786ea18ad74f43149b9f03494"
+PV =3D "edk2-stable202302"
+SRCREV =3D "f80f052277c88a67c55e107b550f504eeea947d3"
 UPSTREAM_CHECK_GITTAGREGEX =3D "(?P<pver>edk2-stable.*)"
=20
 inherit deploy
--=20
2.30.2


