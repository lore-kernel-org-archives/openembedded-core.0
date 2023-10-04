Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E7FFE7C4EC
	for <webhook@archiver.kernel.org>; Wed,  4 Oct 2023 18:13:58 +0000 (UTC)
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
 by mx.groups.io with SMTP id smtpd.web11.863.1696443235265854690
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Oct 2023 11:13:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Wk2D9RjT;
 spf=pass (domain: gmail.com, ip: 209.85.222.170, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-77574c076e4so6605285a.1
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Oct 2023 11:13:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696443234; x=1697048034; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fDmwApMnZMR2ylRNTG4aBAHHuPFJ//xao6BK3sJHdUE=;
        b=Wk2D9RjTC7CXndKTMTxPxcw0RbYe25tIsp4xRznSYSJvUBcBS0mh53B3TcWLWkm+p0
         cIlRXYMiACz+YTzOtBL2vAaettIgfPzj9FB8Pu5mOhPbPnTjO6IXN37BBqYcd9BCgMgh
         xtkOd/Hboo9MoGgKYmJutygLEcteM9IX9mORM4tTxaqF0RNBOVKX1GXt+08+DLx6Ck7G
         KBeJv09ipH9S0M6BF5nT1EeObufWIUgyp5H6sUTPeCveHsG4JqYggD5aRs8wgf0gWTQK
         xmLA5I6Ut+vxE1U+ngK65z4eYO+4acjkRRU1hif4yumToxt7hjulA2/tSgwmesqduKIA
         42RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696443234; x=1697048034;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fDmwApMnZMR2ylRNTG4aBAHHuPFJ//xao6BK3sJHdUE=;
        b=IckmwcR0SRZi0KA7oVTS1s/B7SkoS/m7w8IZSRzPyXqh8Sh6YEdJ9O1Lj/4e7zglTU
         rV18P7w7trrPcLTUsiiY5RM7JcN9MpTc3mR5nXD1+TteHdaRWrgzjDmfgMMbMkfxK390
         uHFd9ht1TiWKrnxHIWH+g+il/Q+P5qTPd/s9LCr5r13VFwjLUv3c1Dn9/wqDBk4w1A/X
         CnDfEeQAzEl2r+xgkD7ZamWRKGnLlyzqDQ35fuzcU4sr2d7Y2wO/4pbI1mcmSBH+s7QA
         O7m9xXbpT1+bvGGK/MNKtxkK0XeHvmgNDdFQ3rx/PM0QlQnv4EzUBlxH9mShdeYvLA7Q
         Icqw==
X-Gm-Message-State: AOJu0YwzGgNMErF7MOfbo0kqzzVjXgvqIl9Q93E3qONgniTeYu5bwN9t
	pd+Qzw0IqtYu2se3fv1ZhuCrR0p/UW5PExns19E=
X-Google-Smtp-Source: AGHT+IHtGMnRGO3BgsGw+bU2S9uTZ606VLko8mJzpv1PkUu7gQNekz6ebu6T1uoom72fMVGMnFtTBw==
X-Received: by 2002:a05:620a:394f:b0:775:6a43:931d with SMTP id qs15-20020a05620a394f00b007756a43931dmr3750213qkn.25.1696443234242;
        Wed, 04 Oct 2023 11:13:54 -0700 (PDT)
Received: from build.lan ([174.112.183.231])
        by smtp.gmail.com with ESMTPSA id o8-20020a05620a110800b007756c8ce8f5sm1429706qkk.59.2023.10.04.11.13.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Oct 2023 11:13:53 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH] linux-yocto/6.5: integrate fixes for sanity issues
Date: Wed,  4 Oct 2023 14:13:51 -0400
Message-Id: <20231004181351.4088521-1-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Oct 2023 18:13:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188694

From: Bruce Ashfield <bruce.ashfield@gmail.com>

making the following commits available in our 6.5 kernel:

    49e3d8448aea locking/atomic: scripts: fix fallback ifdeffery
    9ba8e064374d crypto: jitter - add RCT/APT support for different OSRs
    50f59f46583a crypto: jitter - Add clarifying comments to Jitter Entropy RCT cutoff values

Which should address several of the failures we are seeing with
6.5 under integration testing.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---

This should obviously be applied onto the end of any 6.5 patches
I've previously sent.

Bruce

 .../linux/linux-yocto-rt_6.5.bb               |  2 +-
 .../linux/linux-yocto-tiny_6.5.bb             |  2 +-
 meta/recipes-kernel/linux/linux-yocto_6.5.bb  | 22 +++++++++----------
 3 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.5.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.5.bb
index 9b09bae615..f70d77e06a 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.5.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.5.bb
@@ -14,7 +14,7 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "6efddc0f385fb758e7eef43d9de133b1677eb72c"
+SRCREV_machine ?= "712b8fb1342bf829c9ca1e649adc9d112b9c209f"
 SRCREV_meta ?= "06cf3d8830fda41ff271eec7da6e3c8425df790f"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.5.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.5.bb
index 5325fbad53..716c922c13 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.5.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.5.bb
@@ -17,7 +17,7 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "5b2595c3e0dce2912b32ef69aaaacd52cd0e720c"
+SRCREV_machine ?= "49e3d8448aeaecd8e2bb6b481f26b76514dbe0f5"
 SRCREV_meta ?= "06cf3d8830fda41ff271eec7da6e3c8425df790f"
 
 PV = "${LINUX_VERSION}+git"
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.5.bb b/meta/recipes-kernel/linux/linux-yocto_6.5.bb
index b9ed4be898..64399e1e8d 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.5.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.5.bb
@@ -18,17 +18,17 @@ KBRANCH:qemux86-64 ?= "v6.5/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.5/standard/base"
 KBRANCH:qemumips64 ?= "v6.5/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "619d7b434792c35b501914d481eb3178d87b9f60"
-SRCREV_machine:qemuarm64 ?= "5b2595c3e0dce2912b32ef69aaaacd52cd0e720c"
-SRCREV_machine:qemuloongarch64 ?= "5b2595c3e0dce2912b32ef69aaaacd52cd0e720c"
-SRCREV_machine:qemumips ?= "622b9a83a51276528ddd38ec9c239b7ef7eac1ee"
-SRCREV_machine:qemuppc ?= "5b2595c3e0dce2912b32ef69aaaacd52cd0e720c"
-SRCREV_machine:qemuriscv64 ?= "5b2595c3e0dce2912b32ef69aaaacd52cd0e720c"
-SRCREV_machine:qemuriscv32 ?= "5b2595c3e0dce2912b32ef69aaaacd52cd0e720c"
-SRCREV_machine:qemux86 ?= "5b2595c3e0dce2912b32ef69aaaacd52cd0e720c"
-SRCREV_machine:qemux86-64 ?= "5b2595c3e0dce2912b32ef69aaaacd52cd0e720c"
-SRCREV_machine:qemumips64 ?= "72909f2a89c5bcd4e8ab9aaab280eb961b4e1282"
-SRCREV_machine ?= "5b2595c3e0dce2912b32ef69aaaacd52cd0e720c"
+SRCREV_machine:qemuarm ?= "ff312905898c587e8c8e1b82b59c01b6933c6339"
+SRCREV_machine:qemuarm64 ?= "49e3d8448aeaecd8e2bb6b481f26b76514dbe0f5"
+SRCREV_machine:qemuloongarch64 ?= "49e3d8448aeaecd8e2bb6b481f26b76514dbe0f5"
+SRCREV_machine:qemumips ?= "889d009f6f39c91fedb8c7431c2ce649f05a04a9"
+SRCREV_machine:qemuppc ?= "49e3d8448aeaecd8e2bb6b481f26b76514dbe0f5"
+SRCREV_machine:qemuriscv64 ?= "49e3d8448aeaecd8e2bb6b481f26b76514dbe0f5"
+SRCREV_machine:qemuriscv32 ?= "49e3d8448aeaecd8e2bb6b481f26b76514dbe0f5"
+SRCREV_machine:qemux86 ?= "49e3d8448aeaecd8e2bb6b481f26b76514dbe0f5"
+SRCREV_machine:qemux86-64 ?= "49e3d8448aeaecd8e2bb6b481f26b76514dbe0f5"
+SRCREV_machine:qemumips64 ?= "97c93107649bc6f7fafdf6c3a8b3521f4bfe2246"
+SRCREV_machine ?= "49e3d8448aeaecd8e2bb6b481f26b76514dbe0f5"
 SRCREV_meta ?= "06cf3d8830fda41ff271eec7da6e3c8425df790f"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
-- 
2.34.1


