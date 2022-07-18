Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F38CC43334
	for <webhook@archiver.kernel.org>; Mon, 18 Jul 2022 00:31:38 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com
 [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web11.21796.1658104288602879558
 for <openembedded-core@lists.openembedded.org>;
 Sun, 17 Jul 2022 17:31:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=pL6waeSJ;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.54,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f54.google.com with SMTP id p9so10303657pjd.3
        for <openembedded-core@lists.openembedded.org>;
 Sun, 17 Jul 2022 17:31:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=Kc3O15d80CsESatM4l7SF/t2z0xKJlj8YWeCwO8Cktc=;
        b=pL6waeSJxaMwv77Du0kWiZ/LrgXUcpIR5WGbBmBZE0olgnwDrx/iFQwuXpJA/onzzN
         9c/Mjj7ABlVa/XyICARN/JQ35Jn7FnGN9itA4oWdRME4di9wwUfgwAW+SdycH/4y58FF
         /yZqdUSACE8aNRzcdWJnYdxD1aM87Z2uBTFgAGgBcF9lRv5AIW4UrpdNome0EJF8xRAC
         uXWloE8eav+vTtnVrTbmm7RmqSO+/njZxYMuPBRrWM/6SYEiRmZkOPpl8VrNRx0H02u+
         7eTNNQuZQecBSdDVU3VQZFgr/ZFF+VgxmfZDSmch+JfoYO62qhIPaHpNcAJcNgIYARmQ
         ALSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Kc3O15d80CsESatM4l7SF/t2z0xKJlj8YWeCwO8Cktc=;
        b=uCgg2elJmcRVhaQsb3mHFDYudYHDzhqWfngAwGZ+15+wWrFzII1ZwYDKbAXCjhjcKQ
         79niaAlgl6yXLy1Dn/rqtJgHyM/2wmxp18R1br9Pqmt5viHi0kauEIo74Eg36ewB2nEw
         7QfyVY4wNmNGASWslgsSHX0MluX4fJlT5KZTd3WTV4XNAtDiE0bSeOSfxL0yyuv7Y37K
         s34fA1ATXAqhC/FZ3aBok/m1r+hacuk0M7nxmVf99tFFlpQaeJsl3EXWVB+jax+V6Bc8
         +B0chlKH+No9zHwsSPQiJVD0z9pqhk7NMzybcPqbnT2Kt63ZZ/DAHaaEhm/ruuQ7RUv5
         PRjw==
X-Gm-Message-State: AJIora9FC655pbUV1QZJ4kcr8hYYVaDY8wPkxzLTKwdyH8fNk+VGek+f
	pc4WdxUC02EogKdWVe9ulYWdJyP5cfr3TCBA
X-Google-Smtp-Source: 
 AGRyM1v22g1CgzG9f2iUA76cCHsuaE34mUtS0L2dQ4jqtmu/XGdD8SBQp6VFSnQ8kipgG6EWmYY1sQ==
X-Received: by 2002:a17:90a:9409:b0:1f0:e171:f2bd with SMTP id
 r9-20020a17090a940900b001f0e171f2bdmr20529062pjo.245.1658104287556;
        Sun, 17 Jul 2022 17:31:27 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 s30-20020a17090a2f2100b001ef831a2015sm9958183pjd.22.2022.07.17.17.31.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Jul 2022 17:31:25 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 09/23] linux-yocto/5.10: fix buildpaths issue
 with pnmtologo
Date: Sun, 17 Jul 2022 14:30:10 -1000
Message-Id: 
 <1d8a9a33dc866914b5770b492890248b4c50326b.1658093505.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1658093505.git.steve@sakoman.com>
References: <cover.1658093505.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Jul 2022 00:31:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168174

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/5.10:

    2883e69e202d pnmtologo: use relocatable file name

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 73bc3bfaf06fedff71fcd54d172c4e8df17467a7)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux/linux-yocto-rt_5.10.bb              |  2 +-
 .../linux/linux-yocto-tiny_5.10.bb            |  4 ++--
 meta/recipes-kernel/linux/linux-yocto_5.10.bb | 20 +++++++++----------
 3 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
index 40cc21bceb..53ccd41033 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
@@ -11,7 +11,7 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "faeb2e0ef8f7014788d4e8152d4f5698a7472e0f"
+SRCREV_machine ?= "63771123b1eea439bea2cf80f9f5682667528d9f"
 SRCREV_meta ?= "96ea2660bb97e15f48f4885b9e436f24c3606bd9"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
index 2993ddc951..7b3aaa7fa0 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
@@ -15,8 +15,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine:qemuarm ?= "da9808c1a36f935dec2b90fb5fa5f9df4ff400a3"
-SRCREV_machine ?= "bf0ae2ab0102a68bad4a586fd42ceb78cc0a24e1"
+SRCREV_machine:qemuarm ?= "bff12aa9748d83efc518e524858913c028f0707a"
+SRCREV_machine ?= "5bdf36bd73803640ee495fc6f36b0207993bf62a"
 SRCREV_meta ?= "96ea2660bb97e15f48f4885b9e436f24c3606bd9"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.10.bb b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
index b1c991f55b..d5bf2c9496 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
@@ -13,16 +13,16 @@ KBRANCH:qemux86  ?= "v5.10/standard/base"
 KBRANCH:qemux86-64 ?= "v5.10/standard/base"
 KBRANCH:qemumips64 ?= "v5.10/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "859babe91947ce09d70f8be4c8b314d9712a30ea"
-SRCREV_machine:qemuarm64 ?= "0a59ce2115693d52b931b0fc72f5699a22a77e81"
-SRCREV_machine:qemumips ?= "5bebdf68c5391f8a56f98a8cb31522c0627e05e0"
-SRCREV_machine:qemuppc ?= "0f4a4f1329c7331a02d36f7195f9414e40709d43"
-SRCREV_machine:qemuriscv64 ?= "a6e419710dedbe0390cbf30267c13752b9161972"
-SRCREV_machine:qemuriscv32 ?= "a6e419710dedbe0390cbf30267c13752b9161972"
-SRCREV_machine:qemux86 ?= "a6e419710dedbe0390cbf30267c13752b9161972"
-SRCREV_machine:qemux86-64 ?= "a6e419710dedbe0390cbf30267c13752b9161972"
-SRCREV_machine:qemumips64 ?= "03dc9bc06ba1b7d105467bea334e84b3666b67f4"
-SRCREV_machine ?= "a6e419710dedbe0390cbf30267c13752b9161972"
+SRCREV_machine:qemuarm ?= "8d513bf2294b60cbfa7bfbfab43f7ec458e88de0"
+SRCREV_machine:qemuarm64 ?= "f86e70ec0a39fa6cfd5b19a013703345cf9e8d4c"
+SRCREV_machine:qemumips ?= "a5c1977699a2733ed4ddd08f1bcc1cbcc1fa8862"
+SRCREV_machine:qemuppc ?= "2e52a4c55beaea77e6b99720de58624c416e7569"
+SRCREV_machine:qemuriscv64 ?= "2883e69e202dc7948c99a7828e192b2b42c2d90a"
+SRCREV_machine:qemuriscv32 ?= "2883e69e202dc7948c99a7828e192b2b42c2d90a"
+SRCREV_machine:qemux86 ?= "2883e69e202dc7948c99a7828e192b2b42c2d90a"
+SRCREV_machine:qemux86-64 ?= "2883e69e202dc7948c99a7828e192b2b42c2d90a"
+SRCREV_machine:qemumips64 ?= "37c7c3e8979a2b0eb75bf8ceab7f2b7f12565ceb"
+SRCREV_machine ?= "2883e69e202dc7948c99a7828e192b2b42c2d90a"
 SRCREV_meta ?= "96ea2660bb97e15f48f4885b9e436f24c3606bd9"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH}; \
-- 
2.25.1


