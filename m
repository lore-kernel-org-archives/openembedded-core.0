Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1498EEB64D7
	for <webhook@archiver.kernel.org>; Mon, 26 Jun 2023 22:48:19 +0000 (UTC)
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
 by mx.groups.io with SMTP id smtpd.web11.6345.1687819692994810467
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Jun 2023 15:48:13 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=b13uxPlK;
 spf=pass (domain: gmail.com, ip: 209.85.219.42, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-635e0e6b829so13527116d6.0
        for <openembedded-core@lists.openembedded.org>; Mon, 26 Jun 2023 15:48:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687819692; x=1690411692;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/NHzShKhtSGt9qoZHNoOufmNgdloCChamn/bxlbTlfE=;
        b=b13uxPlKEUXYHNKFnxEpUH+ER9AP8HszNHKb7BmxJCDrCBcR+URI0DVSvWxI9i4zRE
         fMAJMXNSZtaVheFROQ8TEYYAaLtKU/e+rhAb2ElCLqSBYtk4hkbDjjuqrgD6d/Bq3Epk
         GmyPgUhskc8fY+d0AEIPwyCI/szOZrR1Z7bNViAxZTj4neo5pA76rfR6/FvMCNdoRQ3x
         Kw6xcxsRJ5xx++j/3D3IoI/5hyhstOVtOlblYf+DeQLdHhT6Hsxkzm14w7+wvgRaA5yi
         OJJZMIRDZ9XIZJP4HWbQWk3teXeqlWH5iFN53NVs1deR4DrfHQDqT3x7gOHKmxNvdNRb
         vTxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687819692; x=1690411692;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/NHzShKhtSGt9qoZHNoOufmNgdloCChamn/bxlbTlfE=;
        b=LlozimypGjd0jxfyNlQoEmz2WxgPPW0HxewslR5KU83m8SLIqC7+yFwgG93OWEtrmO
         SDto0/U1twGCNwsh+M2HAPkZGktqr709VLG8YS/xEWuLNXbee5cY1luYnw5assODbgHT
         PNOgrzBccsZqQkMCfr6jiLPHCBCBukge/+CEMuuV2LpWpRulZNYQuH1AS/o/SbMfCGTA
         sBf+91Q5gubyjQIXZfIIGEkqh9m/4+TfmG+z7mAGa+7qUSfnEEG0FO871CbKF5ZU8t04
         wDJW5L+Ud1CvfO39ZSBRQRZVm7JHbs3kEuajJngTUuyz52ojLlkAqjwSJX8lABzl+3bi
         XOjw==
X-Gm-Message-State: AC+VfDzlA2IZ6N7KHI2jWLJnjBAz78Wgk+FqeSOVKHgO/1e5VlW/dDwb
	xF5K3A9CR61dy/X2LIRkMkiWb+tW/U+KlRs/
X-Google-Smtp-Source: ACHHUZ6SVaYMAVcXGdkhBvI4wR9h6rJfLEYxGipawK/6YlWe7aeNU3S9wzdeBa4L9tsS0UMMDOwP0Q==
X-Received: by 2002:a05:6214:528b:b0:62d:ddeb:3788 with SMTP id kj11-20020a056214528b00b0062dddeb3788mr17555898qvb.38.1687819691975;
        Mon, 26 Jun 2023 15:48:11 -0700 (PDT)
Received: from build.lan ([174.112.183.231])
        by smtp.gmail.com with ESMTPSA id k2-20020ad44202000000b006301819be40sm3678123qvp.49.2023.06.26.15.48.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jun 2023 15:48:11 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: steve@sakoman.com
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH] linux-yocto/5.15: cfg: fix DECNET configuration warning
Date: Mon, 26 Jun 2023 18:48:09 -0400
Message-Id: <20230626224809.5588-1-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 26 Jun 2023 22:48:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183436

From: Bruce Ashfield <bruce.ashfield@gmail.com>

-stable merged the DECNET removal to 5.15, so we integrate
the following kernel-cache commit to fix the kernel configuration
audit warning:

    b647d9611cb base: drop CONFIG_DECNET

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_5.15.bb      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
index b16a2af875..6ca7873910 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
@@ -12,7 +12,7 @@ python () {
 }
 
 SRCREV_machine ?= "b2a7dbd4edac7627c091c2ab14fec83726a4c79b"
-SRCREV_meta ?= "a6e18bacddf8ebca0c151e809c9996e17e08a7b0"
+SRCREV_meta ?= "b647d9611cb4936536e60a438292fc22df2fe000"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA};protocol=https"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
index 20ec58fb85..616cc47202 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
@@ -15,7 +15,7 @@ KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine ?= "b79e89ab973aeb8ec48e2cd987436ab52678e795"
-SRCREV_meta ?= "a6e18bacddf8ebca0c151e809c9996e17e08a7b0"
+SRCREV_meta ?= "b647d9611cb4936536e60a438292fc22df2fe000"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.15.bb b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
index c9dae7fa31..4ae03f1cb4 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
@@ -23,7 +23,7 @@ SRCREV_machine:qemux86 ?= "079c88490578df99b38570c8968b836b8347ed44"
 SRCREV_machine:qemux86-64 ?= "079c88490578df99b38570c8968b836b8347ed44"
 SRCREV_machine:qemumips64 ?= "47d334232ab28f0f8d5316e07e11f8f14c6aaecc"
 SRCREV_machine ?= "079c88490578df99b38570c8968b836b8347ed44"
-SRCREV_meta ?= "a6e18bacddf8ebca0c151e809c9996e17e08a7b0"
+SRCREV_meta ?= "b647d9611cb4936536e60a438292fc22df2fe000"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
-- 
2.34.1


