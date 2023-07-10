Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83358EB64DC
	for <webhook@archiver.kernel.org>; Mon, 10 Jul 2023 03:20:47 +0000 (UTC)
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
 by mx.groups.io with SMTP id smtpd.web11.31964.1688959237385909838
 for <openembedded-core@lists.openembedded.org>;
 Sun, 09 Jul 2023 20:20:37 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=Q1k1i5S/;
 spf=pass (domain: gmail.com, ip: 209.85.219.48, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-635ee3baa14so21967916d6.3
        for <openembedded-core@lists.openembedded.org>; Sun, 09 Jul 2023 20:20:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688959236; x=1691551236;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mgxTKs8NRRuS5BMawIQC4KfVuJo9aQLzBlkbWoNuqfQ=;
        b=Q1k1i5S/4GCcPwz7IXv2OYG8W6i0CRAP4/Ovw5ZWALX6mE8joUrxBJkr1IzH9g4jZ5
         NJoQJsikFSMjMFyikg54wqWdhcZeVQBPNZ1/YhBhZK8niws+qdSKAUA5sN58OtEte69z
         5hRX8tkY3SYJ5ATpOcDnb85VA2NcSc03AD1t2HkQ6e5YuwjQLzIzp0L8ZwkSNGou5f/l
         RVMoyURDjjP4oxkEkiadJyu92lIceBPFIwPxPIajJunPb+xD+Y02ARboTXcYzo7BGhqu
         3PGlI5MH4csh9QFGX++DY+WS9SuedvbbMQmC8MyEsqu0a464XmQBkeiATZd9HMF4MIp/
         lUPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688959236; x=1691551236;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mgxTKs8NRRuS5BMawIQC4KfVuJo9aQLzBlkbWoNuqfQ=;
        b=krs9sETmv9P6Fpvncv5poWrUGulba3TfsTdoom48UpPw+z4oDkzx+F/Ovms7wtEsnL
         EyIirhv/iL5HPJYfdg2xfQ9a71NU7skAZ4GkzmWsOSon9C3H2QijUTrhW8sBc6CNN/LL
         WsqlTifK1Sg5zUuVt5G+6Lsm3qRXdLascu6WDA34LKQ+ho6HuNzuUeAwVo9VsU7k1MoX
         2FuZfw2QLzul9XdsawIhFEU6g09XICFbaTp5GO4AEBBvA4cJtvK+YpwpBjWwC58S7IAf
         +rCZWNZV2QqYplKqaPOqVe+BaANwzaw0bkn5TKX0dhO7pOxY3X056pEi1Dx+Xfffma4J
         v4/A==
X-Gm-Message-State: ABy/qLZ1EGT9TZvxp+w2RuuFFy30bNMtW+UKLs0R488DfNkYj6OdGEKJ
	YGHTs5YeFwlxYg2n2LDLfddK4kJl/g4=
X-Google-Smtp-Source: APBJJlGdaCd/o55SRqTFYlmgTmOTN9i1S9kD8nkT3F5CBwnEZWpQLh9nus6+lXJLDgogUbSFj3rVgA==
X-Received: by 2002:a0c:db08:0:b0:625:aa49:19f1 with SMTP id d8-20020a0cdb08000000b00625aa4919f1mr8987283qvk.62.1688959236352;
        Sun, 09 Jul 2023 20:20:36 -0700 (PDT)
Received: from build.lan ([174.112.183.231])
        by smtp.gmail.com with ESMTPSA id d15-20020a0cf0cf000000b00630228acc45sm5039863qvl.145.2023.07.09.20.20.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Jul 2023 20:20:35 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 09/15] linux-yocto/6.4: refresh configuration
Date: Sun,  9 Jul 2023 23:20:20 -0400
Message-Id: <43b5d56b48368cb8a265115eb4a436e82aa0afc9.1688958789.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1688958788.git.bruce.ashfield@gmail.com>
References: <cover.1688958788.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Jul 2023 03:20:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184051

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Bumping SRCREVs to pickup the following confguration tweaks for 6.4:

    ebe5a59e59f cfg/fb: update CONFIG_FB_CMDLINE to CONFIG_VIDEO_CMDLINE
    ccd8fad4a64 cfg/netfilter: drop CONFIG_IP_NF_TARGET_CLUSTERIP
    7a20868156d cfg/net: remove CONFIG_NET_SCH_DSMARK
    d3083675d3f net/cfg: remove CONFIG_NET_SCH_CBQ

With these merged, we have no configuration warnings in the 6.4
reference kernel.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_6.4.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_6.4.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_6.4.bb      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.4.bb
index 21eae02ae9..3e1331e52a 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.4.bb
@@ -15,7 +15,7 @@ python () {
 }
 
 SRCREV_machine ?= "40dfcb393658098382d48669718a1cb16674c833"
-SRCREV_meta ?= "4541301322a156977eadc19cbbb8f0a57f4dc06a"
+SRCREV_meta ?= "ebe5a59e59f8a82b7f7a641fece317a0a3ea05d2"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.4;destsuffix=${KMETA};protocol=https"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.4.bb
index e6809a4f28..db729a2e4d 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.4.bb
@@ -18,7 +18,7 @@ KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine ?= "40dfcb393658098382d48669718a1cb16674c833"
-SRCREV_meta ?= "4541301322a156977eadc19cbbb8f0a57f4dc06a"
+SRCREV_meta ?= "ebe5a59e59f8a82b7f7a641fece317a0a3ea05d2"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.4.bb b/meta/recipes-kernel/linux/linux-yocto_6.4.bb
index 8117c4a04e..029aaaa004 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.4.bb
@@ -28,7 +28,7 @@ SRCREV_machine:qemux86 ?= "40dfcb393658098382d48669718a1cb16674c833"
 SRCREV_machine:qemux86-64 ?= "40dfcb393658098382d48669718a1cb16674c833"
 SRCREV_machine:qemumips64 ?= "b14484af5492f03c8afc25f3684c8ae86a78295f"
 SRCREV_machine ?= "40dfcb393658098382d48669718a1cb16674c833"
-SRCREV_meta ?= "4541301322a156977eadc19cbbb8f0a57f4dc06a"
+SRCREV_meta ?= "ebe5a59e59f8a82b7f7a641fece317a0a3ea05d2"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
-- 
2.34.1


