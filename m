Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9736C5DF81
	for <webhook@archiver.kernel.org>; Tue, 18 Aug 2026 19:31:40 +0000 (UTC)
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16969.1787081490593049920
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Aug 2026 12:31:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=IxShtKSo;
 spf=pass (domain: gmail.com, ip: 209.85.160.182, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-52d7ef16f91so1028711cf.3
        for <openembedded-core@lists.openembedded.org>; Tue, 18 Aug 2026 12:31:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787081489; x=1787686289; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5qo3mDXTvFABph4022PI65b6n1YxyigNjUaD+fUWgxQ=;
        b=IxShtKSorwg71uDg0lPSBW8XYvsEzzlbg566Kpvq2ayHn5TlZBwHKpn4ug3p4Q32GL
         sNWvcPTvI4T7x3f7ZkxnIVvGi6S767zdeyVoIk4jsHnJJ48V7q50h87jwvmDFmzZQ4dS
         8psVZbx5C+AuxZvlSjkp9vLf87+XzYF617Byc0X7Zv/8QOAEzPuX9TzGZsl1Zlhr+0yo
         7NDVYpyJf340pwftpuxyYOVrZFj2el3TePPdTaELPolZXpcrBrZEKH1ZCAW/F5+CZX0x
         fzduYMbNfRfxFSX+I095SmBXsCV+L78rMG4VcTkaSqSfFUL1AaLTbsM/doDzfS8PkWhD
         VYuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787081489; x=1787686289;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=5qo3mDXTvFABph4022PI65b6n1YxyigNjUaD+fUWgxQ=;
        b=jUOpiB0prUy2YxWHJi32uhxCj3xP50+jNCjFElFddKKE/NKjaIzrGcrkzrlyZvhRJ2
         w6JP7L+NPFixjcJVeKIUnJ7knq5H3AbH7hr5h9H0qdiMSP79r+a5uvuKsAq/uFsfztRz
         R3yU8MoE5ZgKTEhAbT0PAhVIAZp8I5n35X7lPsDmgN3FAOrgYMwY+ycRmbpkezWInHsb
         Ao/hefWJlSG8q7M00mReDFatYm+Wd1pUzEt1RWpgizvNT3ffxdd54VOBynHtpCW+VMkx
         ia3wzZz2xCBkTKqsWkGEdwKmdw3Tl6pBwCw2Tm/xXym8tZyias1BtRenDd9J80bjhGO+
         WNbg==
X-Gm-Message-State: AOJu0YzbZSM1QjqAAQLdXvfXXEA8VHw7biITqg6vnOQFuwJ+Egr8j+P7
	OdwMsxf68jJPgN0cskrFRtEoLwvMKcEcXJJy6FA73fEEM3Ex5T1pDSPDdndX7ibl
X-Gm-Gg: AR+sD11f6snvWXlWPbr2KMiR8+J+chuSq/tPNUky803SEAB85ZEQ+2P1a6uukhXoQZK
	uiVBqFa8M3ZnkDd27peE3X6eIVW4emlwd8Uufa8NYyGu/+0/LNAJSG4ErP87wTqrXxJePiTk9/T
	BGyYY5iRy2BL3ShL+KIcptPgSXOqQNAR2zqlpbWwDDq+seZaHCW96OwKrQKsWFbNVR1TOj6AvuI
	bqpyUQ7fmQbT4J25q2GyZwQq+V9LG+322PQMbK/ONK5X8zMQzofKvLVyAiUveCiA6CGLwxWYfiY
	O11D4u3lXUH6A0o+O4dgf4CiH3c/G5NpOqxNBxJiwHGma1+KKi7khhxGiuIq57PMxv6zRezli69
	7N0VnhgvMBueoTFpHJ02HXDb57j4R2ZNv6DkfMnjE3y8rKaECcCT14elEYE2bAKcXANA3WVsGoN
	c/QFfpgSXdrvn2bnPNOjX3Hv7BNmAEKva4avP63NfxhG2KHj6AjzW0kZOd4IwBoFY4lPtm5ntjF
	FZY98qjNeV/4OOZTovQ60mT2dOXDSenyqSFM+V0cBiJZjtG8pzqKGxKO/KJkhYN9chjnQn44xj8
	IUzJsZEZBJGN31Z56k2A5bJoO84vqYO8JkwFCQvOrLjeqWRLdKxltV+Q5kim+/uQsbpQu0bcWMT
	u+25wRA==
X-Received: by 2002:ac8:7f11:0:b0:51b:f857:cf82 with SMTP id d75a77b69052e-52dd30a1ab0mr4475321cf.8.1787081489047;
        Tue, 18 Aug 2026 12:31:29 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-52db62396eesm46454941cf.20.2026.08.18.12.31.27
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 12:31:27 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: openembedded-core@lists.openembedded.org
Subject: [PATCH][scarthgap] linux-yocto/6.6: fix tiny build
Date: Tue, 18 Aug 2026 15:31:25 -0400
Message-ID: <20260818193126.299021-1-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Aug 2026 19:31:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243690

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/6.6:

1/1 [
    Author: Bruce Ashfield
    Email: bruce.ashfield@gmail.com
    Subject: pinctrl: core: include gpio/driver.h for struct gpio_chip
    Date: Tue, 18 Aug 2026 14:34:22 -0400

    Stable commit f53dd26462b8e ("pinctrl: remove pinctrl_gpio_direction_output()")
    [ upstream 45d2055b0067 ] changed pinctrl_gpio_direction_input/output() to take
    a struct gpio_chip * and dereference gc->base. Those functions are compiled
    unconditionally, but in 6.6 core.c the struct gpio_chip definition is only
    pulled in via "../gpio/gpiolib.h" under #ifdef CONFIG_GPIOLIB. Configurations
    with CONFIG_PINCTRL=y and CONFIG_GPIOLIB=n (e.g. linux-yocto-tiny on x86, built
    with --allnoconfig) therefore fail to build:

      drivers/pinctrl/core.c: error: invalid use of undefined type 'struct gpio_chip'

    Include <linux/gpio/driver.h> directly so struct gpio_chip is always a complete
    type, matching how mainline core.c has included it since commit ec963d04ca865
    ("pinctrl: provide new GPIO-to-pinctrl glue helpers"), present in 6.12/6.18 but
    not 6.6.

    Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
]

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_6.6.bb               |  4 ++--
 .../linux/linux-yocto-tiny_6.6.bb             |  4 ++--
 meta/recipes-kernel/linux/linux-yocto_6.6.bb  | 24 +++++++++----------
 3 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
index 39fa0a56c2..1d4f95e42c 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
@@ -14,8 +14,8 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "c0f2d7109571c01223cbd3738db96b5ea20ddc68"
-SRCREV_meta ?= "b768be4d32d53a825349353e988ca5930e83f99c"
+SRCREV_machine ?= "eaa4bfd4f99ab0f3cf46ec5a207b73e22fb1c3f9"
+SRCREV_meta ?= "dd201eb6ec53179f45836d41610ca68c725d28e2"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.6;destsuffix=${KMETA};protocol=https"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
index 7675e32542..f2d6e5eef5 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "20c2ecb592178ed51039ae1a75a523c66c1eee5d"
-SRCREV_meta ?= "b768be4d32d53a825349353e988ca5930e83f99c"
+SRCREV_machine ?= "c51e01ecff210644b5d199a4edb30cb1a94a746f"
+SRCREV_meta ?= "dd201eb6ec53179f45836d41610ca68c725d28e2"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.6.bb b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
index 7a273f9cc6..c1ac8e0a08 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
@@ -18,18 +18,18 @@ KBRANCH:qemux86-64 ?= "v6.6/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.6/standard/base"
 KBRANCH:qemumips64 ?= "v6.6/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "06b8a8a900edeb9770128b2e25e7814ff0638c72"
-SRCREV_machine:qemuarm64 ?= "bcdc0007d72899e94de35713c4c18e0ad581f41b"
-SRCREV_machine:qemuloongarch64 ?= "491a3d5683a61ca2a7911f748661cfad50b8d05c"
-SRCREV_machine:qemumips ?= "9023f83c1acc4010d43c5891c641a671a12d264e"
-SRCREV_machine:qemuppc ?= "a76593fcb6c3b2183877d531562237a9def7acc5"
-SRCREV_machine:qemuriscv64 ?= "491a3d5683a61ca2a7911f748661cfad50b8d05c"
-SRCREV_machine:qemuriscv32 ?= "491a3d5683a61ca2a7911f748661cfad50b8d05c"
-SRCREV_machine:qemux86 ?= "491a3d5683a61ca2a7911f748661cfad50b8d05c"
-SRCREV_machine:qemux86-64 ?= "491a3d5683a61ca2a7911f748661cfad50b8d05c"
-SRCREV_machine:qemumips64 ?= "50376ca9492c97cc4d6d291d06e52db021aeb1f1"
-SRCREV_machine ?= "491a3d5683a61ca2a7911f748661cfad50b8d05c"
-SRCREV_meta ?= "b768be4d32d53a825349353e988ca5930e83f99c"
+SRCREV_machine:qemuarm ?= "ed7cf749dcade8ded9fda05be53c235a446dcbff"
+SRCREV_machine:qemuarm64 ?= "b96d2d770cab02b84c46606fa538ce027bee6b08"
+SRCREV_machine:qemuloongarch64 ?= "5ae544e1312ed5b4ed130d22ff1f44333494c4c3"
+SRCREV_machine:qemumips ?= "fcfa6f13ad7894cedda5f59124e7a6f6f0100a67"
+SRCREV_machine:qemuppc ?= "89811e5148d2a4c925940684ad9126bd08de9799"
+SRCREV_machine:qemuriscv64 ?= "5ae544e1312ed5b4ed130d22ff1f44333494c4c3"
+SRCREV_machine:qemuriscv32 ?= "5ae544e1312ed5b4ed130d22ff1f44333494c4c3"
+SRCREV_machine:qemux86 ?= "5ae544e1312ed5b4ed130d22ff1f44333494c4c3"
+SRCREV_machine:qemux86-64 ?= "5ae544e1312ed5b4ed130d22ff1f44333494c4c3"
+SRCREV_machine:qemumips64 ?= "b6dc41bac21f990565fffb211d470fdc97533291"
+SRCREV_machine ?= "5ae544e1312ed5b4ed130d22ff1f44333494c4c3"
+SRCREV_meta ?= "dd201eb6ec53179f45836d41610ca68c725d28e2"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
-- 
2.43.0


