Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70893CCA47C
	for <webhook@archiver.kernel.org>; Thu, 14 Jul 2022 19:15:00 +0000 (UTC)
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com
 [209.85.219.44])
 by mx.groups.io with SMTP id smtpd.web08.260.1657826099465160995
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Jul 2022 12:14:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=DAN6CyYQ;
 spf=pass (domain: gmail.com, ip: 209.85.219.44,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f44.google.com with SMTP id m10so2187240qvu.4
        for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Jul 2022 12:14:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=oeZU176pg0tLtxl0dn2lTGKPh0P0wsXbPdR+OAUbLjs=;
        b=DAN6CyYQCneFzHwxrYUE+MnSYSAEa+Tql8adAlHu73HYlL18W5hY1sG1fjp4bvynhz
         SxJ9TkfWuHklY6Hi+UcTi4obhLKBgmiRK4GBQgY8VS2onxMS+bLFhzrx7WkwZBaTHEDB
         mW6IpDjRXXeKoNeXSNA9ZClygnkPNac1LRRJl+WrjEPwDKmxTlbHgxVQ7HOy1WBv7Ny4
         TSB1rz2jcaBDtKoCspjkb4E5Ak3mWxkipZ0l716BnLChWK/YltoCX3rUO3J8ttZQhRe5
         sECYN+nsmMI3TdEImGnJtXReX5Z4kRu5cbPevMUoEgOP6n+MW01WcR4Q9v14GuLktbm0
         7t8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=oeZU176pg0tLtxl0dn2lTGKPh0P0wsXbPdR+OAUbLjs=;
        b=gtbAKorhMSUFxOW/iJ9ofNdF1j33I+ctiMlCTw9u7dPzTu/NbA1Y4N6hXr1R9mjo5Y
         e6VUH7DEhKG+XIwvfLIPfD+gWkeXNqFunhu/mG2eBwtd4UCs7ldl20L74VzXhIWbclPu
         hXBJNcAuA95QavGFud4vLQ5IjmfQnFzSgRqtpV2GLIs4wC8gj2YMm5MsKwIdTP28h0lO
         /tP7ngm7uPSYAHIVRwuQC3+Rm3EfwD3qAjzP9xgFJAi0KkNTFcALTwymLXRWfUfyL65U
         OMPeORqihW4c/vkUx0BQMfNiBqS/QbmDMB5otavRFlQRlcLsRhVoLGf6XF4NvzeJlj2Q
         ScWg==
X-Gm-Message-State: AJIora8Rq3sLb51OXqJuIQujSzlTq2DottPtU/2spBLIe/zLtzCOcQJH
	0a6r3F4mLPuiC2V6WqCah9/t3uOjVIyfdw==
X-Google-Smtp-Source: 
 AGRyM1vumIJ8mP5p7BVHk072nF+K9KucYJABUHUueSsdzSsyJJXTyztAptHBv4Yub+249n0fIzax2g==
X-Received: by 2002:a0c:9c48:0:b0:473:5e9e:741 with SMTP id
 w8-20020a0c9c48000000b004735e9e0741mr9195646qve.63.1657826098506;
        Thu, 14 Jul 2022 12:14:58 -0700 (PDT)
Received: from build.lan ([173.34.88.218])
        by smtp.gmail.com with ESMTPSA id
 d11-20020a05620a240b00b006b253a6dd1fsm1966022qkn.125.2022.07.14.12.14.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Jul 2022 12:14:57 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 02/10] linux-yocto/5.15: fix buildpaths issue with
 gen-mach-types
Date: Thu, 14 Jul 2022 15:14:45 -0400
Message-Id: 
 <d082bc050471f200f1d475c9d9de1ac40d1ef57d.1657825809.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1657825809.git.bruce.ashfield@gmail.com>
References: <cover.1657825809.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Jul 2022 19:15:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168042

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/5.15:

    6c085baf1838 tools: use basename to identify file in gen-mach-types

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.15.bb              |  2 +-
 .../linux/linux-yocto-tiny_5.15.bb            |  2 +-
 meta/recipes-kernel/linux/linux-yocto_5.15.bb | 20 +++++++++----------
 3 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
index 61b1df04a9..f1f5de3b18 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
@@ -11,7 +11,7 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "4132e425a2dee778212b42d99a9812fe1c78a03d"
+SRCREV_machine ?= "3a7da2af1ba40b8c2247bac03a1fae488a1abde2"
 SRCREV_meta ?= "f122fe59e74365eba84bae800898ffd7329c628d"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
index 7c81b048dc..e271c6741a 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
@@ -14,7 +14,7 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "b2dcc4f70362059ef107000f9be5c76c2886911c"
+SRCREV_machine ?= "122de5742628e6b4303f0bbc653d409ff9f93557"
 SRCREV_meta ?= "f122fe59e74365eba84bae800898ffd7329c628d"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.15.bb b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
index 3e22f8d570..1c090db7b8 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
@@ -13,16 +13,16 @@ KBRANCH:qemux86  ?= "v5.15/standard/base"
 KBRANCH:qemux86-64 ?= "v5.15/standard/base"
 KBRANCH:qemumips64 ?= "v5.15/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "3d2ffe77f277a0a650e7d012c5bfe3765a467e4b"
-SRCREV_machine:qemuarm64 ?= "1da6524b1508ca6e9b6602471b478d310bec1960"
-SRCREV_machine:qemumips ?= "4101fd448319edc00fec2bd822be407d19205bb9"
-SRCREV_machine:qemuppc ?= "651a0112fb207bae1be0d2609e9a910135fb4feb"
-SRCREV_machine:qemuriscv64 ?= "2fca0fd719812ea2ff67630b01355aa80481623e"
-SRCREV_machine:qemuriscv32 ?= "2fca0fd719812ea2ff67630b01355aa80481623e"
-SRCREV_machine:qemux86 ?= "2fca0fd719812ea2ff67630b01355aa80481623e"
-SRCREV_machine:qemux86-64 ?= "2fca0fd719812ea2ff67630b01355aa80481623e"
-SRCREV_machine:qemumips64 ?= "d518b9a80c938ca7ce11e56d2275c33b89dfc9c3"
-SRCREV_machine ?= "2fca0fd719812ea2ff67630b01355aa80481623e"
+SRCREV_machine:qemuarm ?= "41652fad285637467681f47d4e94a886ffb473cd"
+SRCREV_machine:qemuarm64 ?= "b28bd930f849c23a8f1576b22a8e59a0b2ac8cc1"
+SRCREV_machine:qemumips ?= "fb51b7d8d905883f2595f006428c142975231886"
+SRCREV_machine:qemuppc ?= "731587ce51ec087bfbb6255a1e9c763b4f71f7cb"
+SRCREV_machine:qemuriscv64 ?= "6c085baf183868ed45d8c1d44408d7b24724cde5"
+SRCREV_machine:qemuriscv32 ?= "6c085baf183868ed45d8c1d44408d7b24724cde5"
+SRCREV_machine:qemux86 ?= "6c085baf183868ed45d8c1d44408d7b24724cde5"
+SRCREV_machine:qemux86-64 ?= "6c085baf183868ed45d8c1d44408d7b24724cde5"
+SRCREV_machine:qemumips64 ?= "5fcf0d1536623c9ede2ee54d143a650c59ca9d59"
+SRCREV_machine ?= "6c085baf183868ed45d8c1d44408d7b24724cde5"
 SRCREV_meta ?= "f122fe59e74365eba84bae800898ffd7329c628d"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
-- 
2.19.1


