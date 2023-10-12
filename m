Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DE71CDB47E
	for <webhook@archiver.kernel.org>; Thu, 12 Oct 2023 17:39:13 +0000 (UTC)
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
 by mx.groups.io with SMTP id smtpd.web11.18921.1697132350295576396
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Oct 2023 10:39:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=EPW9NKRI;
 spf=pass (domain: gmail.com, ip: 209.85.160.169, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-417f872fb94so8387221cf.0
        for <openembedded-core@lists.openembedded.org>; Thu, 12 Oct 2023 10:39:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697132349; x=1697737149; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sbA2i1iENgm/7V6oKEdVN6mtjLYM6b3cx8D1/SWduA4=;
        b=EPW9NKRIoZ/7qSaIFR+gQVQCgdcvlFZABtlLnfSR20QF/SP7s84Kjegx3zRro1VRT8
         T895WzjqFSwmHmp/F+SJi8sMO8lJYR8XxsYEqtcWfJLcV4NWdAeoGW61NIvIkKlFQMWg
         K5l/zvKFEXxMtx1Jxf6j779R0r5uqaAiRXKHyqoOscFKBJGg5sGmqXkWN3ajF6rV3S4S
         vUdE1B5jCLNlQJwWemmogqWOHNCxgPPQTRkJGyEomcmPGqQgEIjSqEaXflGTbV8QRfAJ
         4tcdSTrjoeBLzninQbx7UfHHqIguiq1If8wI+cX/hdz2YlLPmG/2toSFPabAK/dVAq38
         AlIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697132349; x=1697737149;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sbA2i1iENgm/7V6oKEdVN6mtjLYM6b3cx8D1/SWduA4=;
        b=OC8V8NoKhMgPOWj19HoaXlRSltPq5XrXgryCJSS5zOoPJo8b6ZOxlaurzQVU9JM4sA
         nEOJHil663UoSBDGjKaJeH57dUZVjlXGlucPNtkvkjVkyqYrerfqus+z5jiAjhJ8Wj3j
         oPBwzabGgBOAc6l4cpiYYiGC5VHvWJ9d72qI4ti2HERSvXCm9zRr6Vj8dTd9vkVCIQh2
         tXRdNw6tv39KwDhVm+eWfVfKGAUaEdiO5LCLN8B/Uu8S92lmb/r7JJeNfxmeHeZD+74i
         PGo4qzDz0gViEbH6DK0NasYmywVarq/k5NXW1XG9GGJkl6nB4vXXSeEpUhMRDwMWnsu0
         SWNw==
X-Gm-Message-State: AOJu0YxEj3jn6bS8znGLf/bVdd+5jW10G/3H+GFBT48Xi7ki+LZvnpE0
	CBQF3TfAqy9NwOTgkcnxpyI/JJEvwig2XTEP
X-Google-Smtp-Source: AGHT+IGgTUJsmxxxmH/8uPfWXpKoQLhY8E1g6vSTiX+SHzxEaW+vyHckFVTbD/gwbRzlod8c4OHgFw==
X-Received: by 2002:ac8:5f0c:0:b0:412:7ba9:c7f6 with SMTP id x12-20020ac85f0c000000b004127ba9c7f6mr31770913qta.5.1697132349319;
        Thu, 12 Oct 2023 10:39:09 -0700 (PDT)
Received: from build.lan ([174.112.183.231])
        by smtp.gmail.com with ESMTPSA id hb11-20020a05622a2b4b00b0041969bc2e4csm6385283qtb.32.2023.10.12.10.39.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Oct 2023 10:39:08 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/7] linux-yocto/6.5: tiny: fix arm 32 boot
Date: Thu, 12 Oct 2023 13:38:59 -0400
Message-Id: <856a7ac05d37b13883d99b8dc3d60303aede2c5f.1697132218.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1697132218.git.bruce.ashfield@gmail.com>
References: <cover.1697132218.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Oct 2023 17:39:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189015

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/.:

    b8c36f31e96 qemuarma15: add ARM_PATCH_PHYS_VIRT

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_6.5.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_6.5.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_6.5.bb      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.5.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.5.bb
index 24ee65d676..6104caf017 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.5.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.5.bb
@@ -15,7 +15,7 @@ python () {
 }
 
 SRCREV_machine ?= "ce1898ae324b07c07206c71cd7dd41d03ddc1348"
-SRCREV_meta ?= "31d86e2adece1709756f6d5d5b2a50cd033a451f"
+SRCREV_meta ?= "b8c36f31e96bed0b017f07ef3285123f81d0faa0"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.5;destsuffix=${KMETA};protocol=https"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.5.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.5.bb
index 4e3c5b5296..4ade5062fd 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.5.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.5.bb
@@ -18,7 +18,7 @@ KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine ?= "a923d8834d771a66938eafbb306ba1ba27fe3b17"
-SRCREV_meta ?= "31d86e2adece1709756f6d5d5b2a50cd033a451f"
+SRCREV_meta ?= "b8c36f31e96bed0b017f07ef3285123f81d0faa0"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.5.bb b/meta/recipes-kernel/linux/linux-yocto_6.5.bb
index 66860bbb9f..e8bacf0dbe 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.5.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.5.bb
@@ -29,7 +29,7 @@ SRCREV_machine:qemux86 ?= "a923d8834d771a66938eafbb306ba1ba27fe3b17"
 SRCREV_machine:qemux86-64 ?= "a923d8834d771a66938eafbb306ba1ba27fe3b17"
 SRCREV_machine:qemumips64 ?= "a47a17e0dc4753b39804de29aedbc67db90d8a3a"
 SRCREV_machine ?= "a923d8834d771a66938eafbb306ba1ba27fe3b17"
-SRCREV_meta ?= "31d86e2adece1709756f6d5d5b2a50cd033a451f"
+SRCREV_meta ?= "b8c36f31e96bed0b017f07ef3285123f81d0faa0"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
-- 
2.34.1


