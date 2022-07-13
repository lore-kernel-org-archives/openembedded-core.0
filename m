Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9A07CCA479
	for <webhook@archiver.kernel.org>; Wed, 13 Jul 2022 18:33:33 +0000 (UTC)
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com
 [209.85.219.52])
 by mx.groups.io with SMTP id smtpd.web12.665.1657737208046823274
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Jul 2022 11:33:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=qzsMshHN;
 spf=pass (domain: gmail.com, ip: 209.85.219.52,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f52.google.com with SMTP id m6so5455737qvq.10
        for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Jul 2022 11:33:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=oeZU176pg0tLtxl0dn2lTGKPh0P0wsXbPdR+OAUbLjs=;
        b=qzsMshHNtjIukqEJw4qEWAMXnQ9knRVKNG7OGjBTnEOWifcVA+B+Ue8C9yyBR0k/fe
         yr0L/Ix23Tn0c3564Pa0jLgn9ilgMoSRKF0fObwa3T85drCmOGj/c3qKYYC0i3YELkmj
         XCpQDxxGhteS6uygwvizCxmbAS0clwhUZEItJEFklAjLM8gX/mMWp76axcWpM0bnf1V6
         cCQv5ud5k60TKYt2T6mom18pVbvVCCWWJ6Dij+t49U77L2UBflSpMJhWvmu0jKNEgkkZ
         oVgUO41AGwCXgDK0HLv1AgFfIbZkUWFk/vRqPDF+NmjCtm7zmXl/+FHSbqqaQH9Hn67a
         CcHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=oeZU176pg0tLtxl0dn2lTGKPh0P0wsXbPdR+OAUbLjs=;
        b=5aRUnpots+EgIUq0D3wO6+BnkpjtIbLEl8f6lJ1zt0ddNAdaMgK+V2pWavak3qRC2K
         3GCnxINtBnVrf1nEsR+BhAagudFNeif940vWfk7EQqqxlDjx10LcHntt1gLJXUsGoeWA
         ho56ntZEXMER0sGZ9lY919GGHDi1rAkAB8Qm9ghziIZSzorAC6lqad+kJ9eZ3JqFjkXT
         dOxFHZpSPUYMBr6ArWmh18Lp7ckQYgWkmXi2FH1XHMfslbn32CT3miCN7Rn4ht5jxnat
         /UEc2pkh3TeAvUZWaU80lFZ9mouzHbMz54uGT6w1R4ku2V0xnyYJUsopuwG6WRl1eNz2
         c7dg==
X-Gm-Message-State: AJIora+VrLSbTPTUaEJzMBbaVyuiDQFuLWhwBw9ca7Xli+oR/RlKdGIy
	9CmqXp1e7SBc4A/CTpkWiWBz1y+PhW3/cA==
X-Google-Smtp-Source: 
 AGRyM1u5oSmiJfNNJHiCqM71sYFkccIHtfgRlubX2VNrANvTtA2lXHYBTk4tP5KM4CKQW3aXDeBVDw==
X-Received: by 2002:ad4:5744:0:b0:472:f0b2:1887 with SMTP id
 q4-20020ad45744000000b00472f0b21887mr4300149qvx.106.1657737207007;
        Wed, 13 Jul 2022 11:33:27 -0700 (PDT)
Received: from build.lan ([173.34.88.218])
        by smtp.gmail.com with ESMTPSA id
 a23-20020ac87217000000b0031eceadc86fsm736851qtp.81.2022.07.13.11.33.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Jul 2022 11:33:25 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] linux-yocto/5.15: fix buildpaths issue with
 gen-mach-types
Date: Wed, 13 Jul 2022 14:33:23 -0400
Message-Id: <20220713183323.24706-2-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20220713183323.24706-1-bruce.ashfield@gmail.com>
References: <20220713183323.24706-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Jul 2022 18:33:33 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167982

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


