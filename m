Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71BE0C433EF
	for <webhook@archiver.kernel.org>; Thu, 14 Jul 2022 19:15:20 +0000 (UTC)
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com
 [209.85.222.174])
 by mx.groups.io with SMTP id smtpd.web10.245.1657826112552724122
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Jul 2022 12:15:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=hJZqMYdI;
 spf=pass (domain: gmail.com, ip: 209.85.222.174,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f174.google.com with SMTP id b2so1968803qkk.3
        for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Jul 2022 12:15:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=e+E1t+foeuxob9aL3q0m4KC250sOZAOVIsdZHY8u40k=;
        b=hJZqMYdIdXcide+M15rFN/fm+hRcjBCGGJj5UJ1vAhG56pCvT7ifVwSWpuh3ZSgHUN
         p7o5ZTAcrus0gn5HuoKq+JiBVyhd1xEk/UA1QQ758C82NYLZ6V/frW8CWubX9ACeb6+2
         fCzlReyG2YW0SiU4MVBXKebWt/NHs9TGrZslQwRsDAAV6+tJvnGz9P7rmtL8odcVPfcC
         J17n5Kmc3XIoVEj1UksuucNyPuuNDUCJRlrVGS1vPLiYLKIjVtIpSHE6ODvB96HxEymu
         cBLyn4/ElCG8vsa8komGpDupSMYUOXyQwBtA2DUp0IYDkt3bWGFHy66ACHz7o3cH6DLp
         SDzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=e+E1t+foeuxob9aL3q0m4KC250sOZAOVIsdZHY8u40k=;
        b=2UV6pN19Jp0FtOy2HrSPr2+BjN9ejhxXRdatPB3UyCQTrodMktZe1XFvI6T19WpWZS
         qca5boIIv0mubI1C8rVdaomKUyUDX6Ux3IoYTmj8qtzx5zNmZ2OF3cfFRLgw/lBLZIsu
         K7fL5opP39b+VBvKJhNBOWMtmyjvlURdmO8yAlV8tTA+SiAPSrGHCpreCyL3oKbYFkHo
         ZtYiORyJmwW/wJz8i0xBOF4cKqb3f6z3OKzGkorzAN6RsFP7arUuRY1ztjlXH3kD7FKw
         bjsIepghqcqU26y5UPunoN2gs8jjhthMhAsjSv8LZrUw+u+Mmk7HLnZaauBAKnZvRQAx
         n0JA==
X-Gm-Message-State: AJIora9QPWZWJh2YmwnHoeYg1Gax8xIaHkWtO3zLHHWccU5yY8j0tloN
	OeP8gibjy3f2G0HMDPT6aTlQBUJ+rH9bsQ==
X-Google-Smtp-Source: 
 AGRyM1s4U4MIKYNygL2KAH4KI7ys5BojRcWmiKBarMB47uiVtVqg5KYj0kw+Qc3N5yL9eeb3QjQW3Q==
X-Received: by 2002:a05:620a:450b:b0:6b0:8501:b04f with SMTP id
 t11-20020a05620a450b00b006b08501b04fmr7111747qkp.51.1657826111639;
        Thu, 14 Jul 2022 12:15:11 -0700 (PDT)
Received: from build.lan ([173.34.88.218])
        by smtp.gmail.com with ESMTPSA id
 d11-20020a05620a240b00b006b253a6dd1fsm1966022qkn.125.2022.07.14.12.15.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Jul 2022 12:15:10 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 08/10] linux-yocto/5.10: fix buildpaths issue with pnmtologo
Date: Thu, 14 Jul 2022 15:14:51 -0400
Message-Id: 
 <4c505b21162f56d268d7576839e9458d2f09ac42.1657825809.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1657825809.git.bruce.ashfield@gmail.com>
References: <cover.1657825809.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Jul 2022 19:15:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168048

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/5.10:

    2883e69e202d pnmtologo: use relocatable file name

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
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
2.19.1


