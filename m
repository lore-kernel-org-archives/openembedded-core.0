Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5679EC47088
	for <webhook@archiver.kernel.org>; Thu,  1 Dec 2022 14:23:22 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web10.44616.1669904600366642784
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Dec 2022 06:23:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=bvk1nhXG;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.182, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f182.google.com with SMTP id s7so1779912plk.5
        for <openembedded-core@lists.openembedded.org>; Thu, 01 Dec 2022 06:23:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rURhyf9kE6AjA9xpYKCTvBocFv16QIZZyRdbFWksyls=;
        b=bvk1nhXGHCVRt4w4EjXywlEUwQGiF34ogUVxh6qBnNxxLrVhZNmn2ajl+6sWmbLADv
         bNZUFsavOTk/LWgbJJzuDpG0oNkNywduWHX3tYXqI/gMldavHjTtVyyqhu8JjPm3TJH+
         +ItnOaEXPS7IubDL1twxOZIZFaMJEJoLmGdoddh3ejIu4QmDbO9RroKseb1x/sbZ1Upw
         3EDgHLXqNPM0v7cCvEWenH///GGJpYua1i6SDzkJpJRI3X0+GeeMuQpt/KoDsOzgh2sX
         afL3GqKkmZcIQo/I2Zjalh8njTQZ3GhhAVb+7qFgaP1krRyPVg80zSB/lt411dHjb5EP
         8ijQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rURhyf9kE6AjA9xpYKCTvBocFv16QIZZyRdbFWksyls=;
        b=qkS0xhMTPRT8SWRG2+6vuMSkmWWGzJHbl+CrbJhnQJtvkAHWLkt8BkwXZAPYruqL6h
         ciDtpKZROIJ8EkLEJK/cVEB/QoHvDvdICF+NKvhrQVXViAzApVBb65ppphpAZIe2Cy/q
         flmyouj+0yOo45BFzLFHHHIosoGElblxCOW6MqqfQFcqtribUrPlv3MQEgp4Zu3Df/XH
         csCiicsQySC6FOTsM7r2PSq4kQQnE8Qj997rt7Rlfhb+3DCmR41pZ8nu4Msy48Sz2KtY
         1HYbxiW6sIQBuocm+xqfDb7DVqHeXhjWE9sO2g/l2x7QdwH2T0luOOu/QTE43Vi/HFfC
         yi/A==
X-Gm-Message-State: ANoB5plOb8AsVe0lgjSPY1szBSGDVSweFdebKK6cazzUOzOlDMatBDBK
	r2eLOWiis6iFwQSG8zIO3thwKRinlUEWx2E5GIE=
X-Google-Smtp-Source: AA0mqf53IsGTgnIsAFBWqPitKc8jpCvxxXJLoMWXvZjMRA9dGYksrUDndPPlZzna+2GQh8ejhHKvDg==
X-Received: by 2002:a17:902:bb10:b0:189:6292:827e with SMTP id im16-20020a170902bb1000b001896292827emr35145531plb.97.1669904599337;
        Thu, 01 Dec 2022 06:23:19 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id p2-20020a622902000000b00575acb243besm3300615pfp.1.2022.12.01.06.23.18
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Dec 2022 06:23:18 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 08/22] linux-yocto/5.15: fix CONFIG_CRYPTO_CCM mismatch warnings
Date: Thu,  1 Dec 2022 04:22:38 -1000
Message-Id: <cd9dc8d13335803d1160455cf762369ec64d3f35.1669904433.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1669904433.git.steve@sakoman.com>
References: <cover.1669904433.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Dec 2022 14:23:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174071

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/.:

    f475b1a9ded qat: fix CONFIG_CRYPTO_CCM mismatch warnings

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit a3417ce85e38d514c7dc43c2ddcdacf45996fc2a)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_5.15.bb      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
index f80cabe55d..fc1ccd9b39 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
@@ -12,7 +12,7 @@ python () {
 }
 
 SRCREV_machine ?= "a0d36398b257c555381e735cd721cd8479d6762d"
-SRCREV_meta ?= "5ca1021282e796e2427f8c7769af524c433fb39d"
+SRCREV_meta ?= "f475b1a9deddbde23f48d7d535abdd5fb133b837"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
index c09f51ce61..087c30b5a5 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
@@ -15,7 +15,7 @@ KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine ?= "1c3448ff6cc6d24d16c6ef6065cb642245cac627"
-SRCREV_meta ?= "5ca1021282e796e2427f8c7769af524c433fb39d"
+SRCREV_meta ?= "f475b1a9deddbde23f48d7d535abdd5fb133b837"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.15.bb b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
index 710accc9e2..d5f21daf35 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
@@ -23,7 +23,7 @@ SRCREV_machine:qemux86 ?= "8cd3f1c8dc13e8fa2d9a25ce0285d3526705eea7"
 SRCREV_machine:qemux86-64 ?= "8cd3f1c8dc13e8fa2d9a25ce0285d3526705eea7"
 SRCREV_machine:qemumips64 ?= "ae8ab2e3acaf9e14cd75a6c96f1ba43c66a1babd"
 SRCREV_machine ?= "8cd3f1c8dc13e8fa2d9a25ce0285d3526705eea7"
-SRCREV_meta ?= "5ca1021282e796e2427f8c7769af524c433fb39d"
+SRCREV_meta ?= "f475b1a9deddbde23f48d7d535abdd5fb133b837"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
-- 
2.25.1


