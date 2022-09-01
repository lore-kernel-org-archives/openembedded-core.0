Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC725C6FA87
	for <webhook@archiver.kernel.org>; Thu,  1 Sep 2022 07:21:51 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web11.9414.1662016902561552697
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Sep 2022 00:21:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=HvIkK33b;
 spf=pass (domain: gmail.com, ip: 209.85.221.53,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f53.google.com with SMTP id u18so8424267wrq.10
        for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Sep 2022 00:21:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=SEVBT2uxGHeVLHXZxpSwyTelqTCc5B41B1h4zNKvnnM=;
        b=HvIkK33bNW/Rc18EVMf6OZc2a2rLUp7nFM8deFZS5gsDEhANpZ4eZDaNjBvvxqfu0y
         COrzkCSuE4fJGuWRBYdJ9tAkpUp5uz+j6bPzWoICRxRDCGfG8cfE2BpkI9Y7/VMZYFez
         qQNFL1c00VEjPfsUz7qHCtv8NdNuEwAgZfF6ePChSYzN2tkkbzqOiBT7/aX/kKSHwA8V
         IkfKKewxEsRlJmL7KAk3/O7guIIkwdj0kuSJTnzBga2OOyGuRFt+j3TVYZ3risfWbTTU
         lwu/Ly4UgnXEJ7BNuJeY5fnu501SrvI0ICVMurLsysn4oeWoqXmyfm4J7LPL9gaDcz92
         AVgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=SEVBT2uxGHeVLHXZxpSwyTelqTCc5B41B1h4zNKvnnM=;
        b=nToebdW42AWy+kGowK5wwoxnT3JTCGN+KLvF6sWTGo07wR2WvE1JiuUd4uIKZxC7eJ
         JxjsI0MKX0MJ3mjrvqQdMPqmRxb0C0XlkXmHh5ykUdNU7yyS4K4RJvHOX6E2ciUAD7Vt
         fIWyK3DF6qVsd5/6zE301gB+Vr1uWnk7P49wGQX1wJHIxnAk7mN77ixlu138/TaarnRF
         KZh3sFZtYCCViM+PUyrGaO/qynqu9Ew0m3jq+lYcKi1UUYU+lQYwxjMVVklteZ6JMM0c
         o9BCritCQy1+/U64ZmCnlwILxvGUJHe0WBfCM9aKOO+NY/YPFeyy7cWnFgPU8g8okdkS
         e1Hg==
X-Gm-Message-State: ACgBeo2cBiAxHmqP7tr6kizF5LGeuwC6xIVSdWC4D8ukaJiRp/0lCuY8
	cCuHFrUz0/I1nDs9S509RUfIt94IQ/k=
X-Google-Smtp-Source: 
 AA6agR5g0tCZjWUsJnf0oz3V8HJX5kd73VtUooxwx8VEyFPd3mKTMwbKWMjPhc6R7G93e+jwRQef3g==
X-Received: by 2002:a5d:6d0e:0:b0:21e:fc95:3dfc with SMTP id
 e14-20020a5d6d0e000000b0021efc953dfcmr13960136wrq.112.1662016900854;
        Thu, 01 Sep 2022 00:21:40 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 c18-20020adffb52000000b00225239d9265sm14022982wrs.74.2022.09.01.00.21.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Sep 2022 00:21:39 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 06/14] ovmf: drop the force no-stack-protector patch
Date: Thu,  1 Sep 2022 09:21:17 +0200
Message-Id: <20220901072125.3366367-6-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220901072125.3366367-1-alex@linutronix.de>
References: <20220901072125.3366367-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Sep 2022 07:21:51 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170148

This should not be necessary, as ovmf is already marked as
COMPATIBLE_HOST:class-target=3D'(i.86|x86_64).*'
and existing upstream code handles both.

If/when ovmf is used on other targets, the situation can be revisited.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../ovmf/0003-ovmf-Update-to-latest.patch     | 45 -------------------
 meta/recipes-core/ovmf/ovmf_git.bb            |  1 -
 2 files changed, 46 deletions(-)
 delete mode 100644 meta/recipes-core/ovmf/ovmf/0003-ovmf-Update-to-latest.=
patch

diff --git a/meta/recipes-core/ovmf/ovmf/0003-ovmf-Update-to-latest.patch b=
/meta/recipes-core/ovmf/ovmf/0003-ovmf-Update-to-latest.patch
deleted file mode 100644
index d710429899..0000000000
--- a/meta/recipes-core/ovmf/ovmf/0003-ovmf-Update-to-latest.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From 67267d8cc31df16a3608cad1a17c5f1470ef8bbd Mon Sep 17 00:00:00 2001
-From: Steve Langasek <steve.langasek@ubuntu.com>
-Date: Sat, 10 Jun 2017 01:39:36 -0700
-Subject: [PATCH 3/6] ovmf: Update to latest
-
-Description: pass -fno-stack-protector to all GCC toolchains
- The upstream build rules inexplicably pass -fno-stack-protector only
- when building for i386 and amd64.  Add this essential argument to the
- generic rules for gcc 4.4 and later.
-Last-Updated: 2016-04-12
-Upstream-Status: Pending
----
- BaseTools/Conf/tools_def.template | 8 ++++----
- 1 file changed, 4 insertions(+), 4 deletions(-)
-
-diff --git a/BaseTools/Conf/tools_def.template b/BaseTools/Conf/tools_def.=
template
-index 498696e583..36241b6ede 100755
---- a/BaseTools/Conf/tools_def.template
-+++ b/BaseTools/Conf/tools_def.template
-@@ -1897,10 +1897,10 @@ DEFINE GCC_RISCV64_RC_FLAGS        =3D -I binary -=
O elf64-littleriscv   -B riscv
- # GCC Build Flag for included header file list generation=0D
- DEFINE GCC_DEPS_FLAGS              =3D -MMD -MF $@.deps=0D
- =0D
--DEFINE GCC48_ALL_CC_FLAGS            =3D DEF(GCC_ALL_CC_FLAGS) -ffunction=
-sections -fdata-sections -DSTRING_ARRAY_NAME=3D$(BASE_NAME)Strings=0D
-+DEFINE GCC48_ALL_CC_FLAGS            =3D DEF(GCC_ALL_CC_FLAGS) -ffunction=
-sections -fdata-sections -fno-stack-protector -DSTRING_ARRAY_NAME=3D$(BASE=
_NAME)Strings=0D
- DEFINE GCC48_IA32_X64_DLINK_COMMON   =3D -nostdlib -Wl,-n,-q,--gc-section=
s -z common-page-size=3D0x20=0D
--DEFINE GCC48_IA32_CC_FLAGS           =3D DEF(GCC48_ALL_CC_FLAGS) -m32 -ma=
rch=3Di586 -malign-double -fno-stack-protector -D EFI32 -fno-asynchronous-u=
nwind-tables -Wno-address=0D
--DEFINE GCC48_X64_CC_FLAGS            =3D DEF(GCC48_ALL_CC_FLAGS) -m64 -fn=
o-stack-protector "-DEFIAPI=3D__attribute__((ms_abi))" -maccumulate-outgoin=
g-args -mno-red-zone -Wno-address -mcmodel=3Dsmall -fpie -fno-asynchronous-=
unwind-tables -Wno-address=0D
-+DEFINE GCC48_IA32_CC_FLAGS           =3D DEF(GCC48_ALL_CC_FLAGS) -m32 -ma=
rch=3Di586 -malign-double -D EFI32 -fno-asynchronous-unwind-tables -Wno-add=
ress=0D
-+DEFINE GCC48_X64_CC_FLAGS            =3D DEF(GCC48_ALL_CC_FLAGS) -m64 "-D=
EFIAPI=3D__attribute__((ms_abi))" -maccumulate-outgoing-args -mno-red-zone =
-Wno-address -mcmodel=3Dsmall -fpie -fno-asynchronous-unwind-tables -Wno-ad=
dress=0D
- DEFINE GCC48_IA32_X64_ASLDLINK_FLAGS =3D DEF(GCC48_IA32_X64_DLINK_COMMON)=
 -Wl,--entry,ReferenceAcpiTable -u ReferenceAcpiTable=0D
- DEFINE GCC48_IA32_X64_DLINK_FLAGS    =3D DEF(GCC48_IA32_X64_DLINK_COMMON)=
 -Wl,--entry,$(IMAGE_ENTRY_POINT) -u $(IMAGE_ENTRY_POINT) -Wl,-Map,$(DEST_D=
IR_DEBUG)/$(BASE_NAME).map,--whole-archive=0D
- DEFINE GCC48_IA32_DLINK2_FLAGS       =3D -Wl,--defsym=3DPECOFF_HEADER_SIZ=
E=3D0x220 DEF(GCC_DLINK2_FLAGS_COMMON)=0D
-@@ -1909,7 +1909,7 @@ DEFINE GCC48_X64_DLINK2_FLAGS        =3D -Wl,--defsy=
m=3DPECOFF_HEADER_SIZE=3D0x228 DEF
- DEFINE GCC48_ASM_FLAGS               =3D DEF(GCC_ASM_FLAGS)=0D
- DEFINE GCC48_ARM_ASM_FLAGS           =3D $(ARCHASM_FLAGS) $(PLATFORM_FLAG=
S) DEF(GCC_ASM_FLAGS) -mlittle-endian=0D
- DEFINE GCC48_AARCH64_ASM_FLAGS       =3D $(ARCHASM_FLAGS) $(PLATFORM_FLAG=
S) DEF(GCC_ASM_FLAGS) -mlittle-endian=0D
--DEFINE GCC48_ARM_CC_FLAGS            =3D $(ARCHCC_FLAGS) $(PLATFORM_FLAGS=
) DEF(GCC_ARM_CC_FLAGS) -fstack-protector -mword-relocations=0D
-+DEFINE GCC48_ARM_CC_FLAGS            =3D $(ARCHCC_FLAGS) $(PLATFORM_FLAGS=
) DEF(GCC_ARM_CC_FLAGS) -mword-relocations=0D
- DEFINE GCC48_ARM_CC_XIPFLAGS         =3D DEF(GCC_ARM_CC_XIPFLAGS)=0D
- DEFINE GCC48_AARCH64_CC_FLAGS        =3D $(ARCHCC_FLAGS) $(PLATFORM_FLAGS=
) -mcmodel=3Dlarge DEF(GCC_AARCH64_CC_FLAGS)=0D
- DEFINE GCC48_AARCH64_CC_XIPFLAGS     =3D DEF(GCC_AARCH64_CC_XIPFLAGS)=0D
---=20
-2.32.0
-
diff --git a/meta/recipes-core/ovmf/ovmf_git.bb b/meta/recipes-core/ovmf/ov=
mf_git.bb
index aac30ead30..40542239e2 100644
--- a/meta/recipes-core/ovmf/ovmf_git.bb
+++ b/meta/recipes-core/ovmf/ovmf_git.bb
@@ -22,7 +22,6 @@ BUILD_CFLAGS +=3D "-Wno-error=3Dstringop-overflow"
 SRC_URI =3D "gitsm://github.com/tianocore/edk2.git;branch=3Dmaster;protoco=
l=3Dhttps \
            file://0001-ovmf-update-path-to-native-BaseTools.patch \
            file://0002-BaseTools-makefile-adjust-to-build-in-under-bitbake=
.patch \
-           file://0003-ovmf-Update-to-latest.patch \
            file://0005-debug-prefix-map.patch \
            file://0006-reproducible.patch \
            "
--=20
2.30.2


