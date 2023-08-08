Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CA91C04E69
	for <webhook@archiver.kernel.org>; Tue,  8 Aug 2023 03:36:07 +0000 (UTC)
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
 by mx.groups.io with SMTP id smtpd.web11.53942.1691465758449237853
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Aug 2023 20:35:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=lViIOuPp;
 spf=pass (domain: gmail.com, ip: 209.85.222.178, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-765a7768f1dso457206685a.0
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Aug 2023 20:35:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691465757; x=1692070557;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oNT9AisQTtkocfm4ECti9WAo1jZPTczJm1j/Q0EF5hg=;
        b=lViIOuPpM1vT3+RzB6ZgZhzVpZdGYp4OIU+SGeHRvsi0GTuZjQril9r8InRq4QuDu6
         puI0BbUHVSSGcRerZKNLI1bpq/t2sWENcx91YEewH5qcgtS4htLN/xJlFkF25ZijDBLH
         EeMrbEDoUZGRfoqeE4rQwEoj/fPD1/4LnUW478HNrZStNC+NqoHszOrQ67LIPVq9uW5W
         zipkaw5ksJGT7M3IZr2Eyl83LZ+uDvkxBu+rWNEX0mS1zNXUaq+eVcKVTpy2V2/SsTGE
         cWb7cg1hyrejxoFPxwxzFNywTmGfJoBHYdosmdCVgHgJN/DBzCj818n5deCqDTEIz/yI
         Obpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691465757; x=1692070557;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oNT9AisQTtkocfm4ECti9WAo1jZPTczJm1j/Q0EF5hg=;
        b=FFfNOqJ8Yc+JywwpF3F9X2iNyoOE/f5/RH7EXwwclGz7u5m1ywherH4Zb1EmO1nPXl
         yctW9H/kDCQnqWiC3GE6u7dZO07H698wDcknV+gsNDqkANLVpdXs+BA4zDTbuHsrXIjw
         cx3Z6ut42hToI/1FSwwbuF8l0IgAVwEQo96bot1WOtw4Zms3XxP5Nlzc0a/JF/1rBJh9
         mlgTChO1KKEMTcv/T5Zur4+GadHGLHM4+GOMusqzeAxKR7tUMDrmZIMahu4Q6hQiYSXR
         jAuTCUVje2/qLvdoeZhBYbZv7oXFiZCxu2TKRnoRyDZvJkv8qMlxGdSfbyJ+hyNWvSis
         6Duw==
X-Gm-Message-State: AOJu0Yw2/+0uiXJO5NRgcSE11tEnFuwrQ+FeGZc4DCb3ZaeQ6KTgpclD
	GKcByrhD5Btmn/vrUizxT48=
X-Google-Smtp-Source: AGHT+IHoP+AxyDzv2mZWxTWLujH1TLJ2VCjN0WZxqwnMFe7q0lYjbAD+jsYUBvcVJc/TbINg4tFY6w==
X-Received: by 2002:a05:620a:458a:b0:765:5f40:426a with SMTP id bp10-20020a05620a458a00b007655f40426amr13644548qkb.47.1691465757198;
        Mon, 07 Aug 2023 20:35:57 -0700 (PDT)
Received: from build.lan ([174.112.183.231])
        by smtp.gmail.com with ESMTPSA id g16-20020ae9e110000000b0076cb0ed2d7asm3033840qkm.24.2023.08.07.20.35.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Aug 2023 20:35:56 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/7] linux-yocto/6.4: fix CONFIG_LEDS_TRIGGER_GPIO kernel audit warning
Date: Mon,  7 Aug 2023 23:35:47 -0400
Message-Id: <67fc4e1bfb68c7cf9e2ea9022dcb01911168dfb5.1691465503.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1691465503.git.bruce.ashfield@gmail.com>
References: <cover.1691465503.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Aug 2023 03:36:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185631

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/.:

    eab54df7b72 leds : do not enable CONFIG_LEDS_TRIGGER_GPIO by default

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_6.4.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_6.4.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_6.4.bb      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.4.bb
index 9273a08c61..4d0fc03ef0 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.4.bb
@@ -15,7 +15,7 @@ python () {
 }
 
 SRCREV_machine ?= "917d160a84f61aada28d09f5afc04d6451fa52a0"
-SRCREV_meta ?= "dab56f52aa33b5cea1513b36b98e50a6c7c31f47"
+SRCREV_meta ?= "eab54df7b727b239c88d29a29357dbbaca8ca1f7"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.4;destsuffix=${KMETA};protocol=https"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.4.bb
index 39abfcbb08..ca725c42d4 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.4.bb
@@ -18,7 +18,7 @@ KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine ?= "dee78ad1963cff9c063fba486d43fc9670285883"
-SRCREV_meta ?= "dab56f52aa33b5cea1513b36b98e50a6c7c31f47"
+SRCREV_meta ?= "eab54df7b727b239c88d29a29357dbbaca8ca1f7"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.4.bb b/meta/recipes-kernel/linux/linux-yocto_6.4.bb
index 443a89cc1e..322ca2a62c 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.4.bb
@@ -28,7 +28,7 @@ SRCREV_machine:qemux86 ?= "dee78ad1963cff9c063fba486d43fc9670285883"
 SRCREV_machine:qemux86-64 ?= "dee78ad1963cff9c063fba486d43fc9670285883"
 SRCREV_machine:qemumips64 ?= "144ff37fee7f0499574d5b508e4db82234f38fec"
 SRCREV_machine ?= "dee78ad1963cff9c063fba486d43fc9670285883"
-SRCREV_meta ?= "dab56f52aa33b5cea1513b36b98e50a6c7c31f47"
+SRCREV_meta ?= "eab54df7b727b239c88d29a29357dbbaca8ca1f7"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
-- 
2.34.1


