Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51B13C4167B
	for <webhook@archiver.kernel.org>; Fri, 18 Nov 2022 22:29:22 +0000 (UTC)
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
 by mx.groups.io with SMTP id smtpd.web10.7449.1668810553006060974
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Nov 2022 14:29:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=cQEcoOUG;
 spf=pass (domain: gmail.com, ip: 209.85.219.54, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f54.google.com with SMTP id mi9so4298847qvb.8
        for <openembedded-core@lists.openembedded.org>; Fri, 18 Nov 2022 14:29:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W9rDfSBaIL6m4UcW5PRQFPPXvDkevVFXrEcdT3z+Bys=;
        b=cQEcoOUGyv5s4CsDTAjF3ieqBvlqMzsvgc9dUGJis8dtPZjqGU3oBAr7XfQSYyPwzn
         wneINPTHvuce5a/bBOOUfw+YLD8VSqhYp4KhZG4aiyIJF8ddZz/AshzvIvdG07fPv0Pl
         aDtTQ6lRgjh8R816AgeMZ7Hm+pSCbqkL5ViEvMJ2841JCU24y71zk1WBOLFdLoc9VB9n
         pjY5zUsuPgpzixmF//Xh23g3ZdREC93vgpK7SbSGO8wsFmnZbFOfnyOPM4KSZHUrDlwv
         RMyjxS8pzs0yKSmto5WgtJrI+2r2GA7DGmGEAYOQI7mA5E2UQu8QcMf3dzZpJWeX1tLs
         69sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W9rDfSBaIL6m4UcW5PRQFPPXvDkevVFXrEcdT3z+Bys=;
        b=kTlMjx77O2bquFsuuw3VmdUIGPiQUBsuVpQvXYiF4eiVzWg3cYvRLGJdV8+7g1Z/yY
         D2/4H/o+8rJmXlne4COs6yWM1RJNYLKfKJWLHMMp527XAuJdPWYa/kGdkATb+NiX1jsL
         Xe3xHuVdRdtaZvSScwJMq3Zw3BwGX+ONAvIzCNa+w6xs9xzVpM4XbLLcJmP1K/whVnui
         /NmHaLwXmceKx6jyrmvlK9Hx6ph8Xpu+dlf4JzWrtFxmAS3gLcGKWvPhV5CoEWesTOzd
         6GBsNdYfzlOJ30RTbCfnYRNjBJnDbGrbsEUSeFaYhYt4hycrVRD/79og7ExiqahvRUDM
         Pytg==
X-Gm-Message-State: ANoB5pl0D6ygswZf6nZXOt+5gzXiarkGruOOoDIZN+pKnr6pMPk2Rad+
	s6jDKdpO3morj65nL/pSGSl2JWtKXUgL3Q==
X-Google-Smtp-Source: AA0mqf4dZi5JBZNZT4H3tDVDNCn1nTSowkYPrKZr8AiXYkJsLRtswEneR8xYCmhw6+dlSdPqwii1xQ==
X-Received: by 2002:a05:6214:207:b0:4c6:4ac0:12c1 with SMTP id i7-20020a056214020700b004c64ac012c1mr8420622qvt.111.1668810553322;
        Fri, 18 Nov 2022 14:29:13 -0800 (PST)
Received: from build.lan (cpe7c9a54441c1f-cm7c9a54441c1d.cpe.net.cable.rogers.com. [173.34.238.88])
        by smtp.gmail.com with ESMTPSA id h9-20020a05620a284900b006f9ddaaf01esm3304068qkp.102.2022.11.18.14.29.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Nov 2022 14:29:12 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 11/15] linux-yocto/5.19: security.cfg: remove configs which have been dropped
Date: Fri, 18 Nov 2022 17:28:55 -0500
Message-Id: <2a6cbf45ba2f797d4aee7a89f889d03a81ea45f0.1668810409.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1668810409.git.bruce.ashfield@gmail.com>
References: <cover.1668810409.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Nov 2022 22:29:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173505

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/.:

    5e122351f62 security.cfg: remove configs which have been dropped

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.19.bb              |  4 ++--
 .../linux/linux-yocto-tiny_5.19.bb            |  4 ++--
 meta/recipes-kernel/linux/linux-yocto_5.19.bb | 22 +++++++++----------
 3 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.19.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.19.bb
index f78ade3e10..2b12b8b8df 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.19.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.19.bb
@@ -11,8 +11,8 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "59a2ffca6673305b3b9e3186294feb5437698d18"
-SRCREV_meta ?= "399055aee2fe59fbde5f7f9aadcc953bf49222f4"
+SRCREV_machine ?= "2bd6711a4dcc49e51ae68152ed0b40384e291554"
+SRCREV_meta ?= "7381acde368f24529d8c9face1826fb54bf7feee"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.19;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.19.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.19.bb
index f34ec707ae..0dd3816dc5 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.19.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.19.bb
@@ -14,8 +14,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "82689c62701573edb28ef1df2bd83adafd3ca701"
-SRCREV_meta ?= "399055aee2fe59fbde5f7f9aadcc953bf49222f4"
+SRCREV_machine ?= "ccb5f0a475b228c995800cb1b0f714426c2f1ec8"
+SRCREV_meta ?= "7381acde368f24529d8c9face1826fb54bf7feee"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.19.bb b/meta/recipes-kernel/linux/linux-yocto_5.19.bb
index 0447d500d2..b242dfa27a 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.19.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.19.bb
@@ -13,17 +13,17 @@ KBRANCH:qemux86  ?= "v5.19/standard/base"
 KBRANCH:qemux86-64 ?= "v5.19/standard/base"
 KBRANCH:qemumips64 ?= "v5.19/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "d789efca1869e21f1c275fd2e46f2eada1698f8d"
-SRCREV_machine:qemuarm64 ?= "82689c62701573edb28ef1df2bd83adafd3ca701"
-SRCREV_machine:qemumips ?= "7216e7029faf5685256b3ce57d3be1c371c56267"
-SRCREV_machine:qemuppc ?= "82689c62701573edb28ef1df2bd83adafd3ca701"
-SRCREV_machine:qemuriscv64 ?= "82689c62701573edb28ef1df2bd83adafd3ca701"
-SRCREV_machine:qemuriscv32 ?= "82689c62701573edb28ef1df2bd83adafd3ca701"
-SRCREV_machine:qemux86 ?= "82689c62701573edb28ef1df2bd83adafd3ca701"
-SRCREV_machine:qemux86-64 ?= "82689c62701573edb28ef1df2bd83adafd3ca701"
-SRCREV_machine:qemumips64 ?= "4e9603752156d3a0b9fe53309f4bc78d3f4f7df5"
-SRCREV_machine ?= "82689c62701573edb28ef1df2bd83adafd3ca701"
-SRCREV_meta ?= "399055aee2fe59fbde5f7f9aadcc953bf49222f4"
+SRCREV_machine:qemuarm ?= "dfb2a8b83c0e37732dd930330132b692409f7321"
+SRCREV_machine:qemuarm64 ?= "ccb5f0a475b228c995800cb1b0f714426c2f1ec8"
+SRCREV_machine:qemumips ?= "b0e7e098c3fc9f2309e74137de4b8a5fcbaa2779"
+SRCREV_machine:qemuppc ?= "ccb5f0a475b228c995800cb1b0f714426c2f1ec8"
+SRCREV_machine:qemuriscv64 ?= "ccb5f0a475b228c995800cb1b0f714426c2f1ec8"
+SRCREV_machine:qemuriscv32 ?= "ccb5f0a475b228c995800cb1b0f714426c2f1ec8"
+SRCREV_machine:qemux86 ?= "ccb5f0a475b228c995800cb1b0f714426c2f1ec8"
+SRCREV_machine:qemux86-64 ?= "ccb5f0a475b228c995800cb1b0f714426c2f1ec8"
+SRCREV_machine:qemumips64 ?= "20d5adcd760ffdc90b4e5babb85a07b9d6ff3113"
+SRCREV_machine ?= "ccb5f0a475b228c995800cb1b0f714426c2f1ec8"
+SRCREV_meta ?= "7381acde368f24529d8c9face1826fb54bf7feee"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
-- 
2.19.1


