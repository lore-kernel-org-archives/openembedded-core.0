Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B379EC00144
	for <webhook@archiver.kernel.org>; Mon,  1 Aug 2022 09:33:27 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com
 [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.web11.22569.1659346403059915782
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Aug 2022 02:33:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=aFXjDThq;
 spf=pass (domain: gmail.com, ip: 209.85.208.49,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f49.google.com with SMTP id i13so12948234edj.11
        for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Aug 2022 02:33:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=esiDRebe900B/qlICt1RhFzyGXL8Efa3X9OUzRiyfEw=;
        b=aFXjDThqmspQDGtyb5Si9oPmu/cvdr0jG0A9OsZ37XQZCVv2OIllbAiEYiuVp/hhZt
         upRA1uWEFnVwedf8u724UjdIwqKP95Xo8eaQe1FFddfRE2hxq/pCTmaiYR6Eq9LwbI2t
         hQbFgna4Ba0yqTaBqcyAAF7aOfB6w2LxW52+4uoag4nvkX72U5j6ienzl00Uq1blBNpD
         mzVslGmAgL98wLVn/3ttHuXbD6lazAcK6UWElwJiB1CBsZwJcYAH4AAp3BrISn+aAsyU
         xDxLGBbO1HDVBKiQWSYM4MqQfhNM5zSEVG9ajBJkHxT+QMewlTc98xjQ1jdUI+e4ZXSh
         jsHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=esiDRebe900B/qlICt1RhFzyGXL8Efa3X9OUzRiyfEw=;
        b=W/CalU+CvSRX6Faf6j9Il2+3zCe8ranhLYTDvx2CiDHaUh/5V0xYHc8K/1RwZlyrlM
         xZrw27F5t3uLcMs9jwg3dljfUodPxGW8gI+NU0BrEFslRVFW7pYyhLIEM6hL7DsgQAVr
         dIXCb5vmwYSX2wlrAIPs2p6VqLF+Yb3UXwBlrFqgo+x7UyedHBwteX8+grL/q7na/9NK
         nEvzdRs5Lu7i+ugcJPJnACUfMr9T/rdGaG06UI8GJAsWgTemVBOLVVict3O5XKI6QqsW
         g2edbTFDT0HJvPWSP7aib3tO3JxY7yOten6GCIGOd9VXXyEpbGX6E79BqhIrXK9Opl03
         Skug==
X-Gm-Message-State: ACgBeo1yAO3XHi0OxmoB/xvxFmvGM6W4JCoaPpMTHBS3yV4JQCqI3hlp
	EgV71mfOwn18GwECsdcH22dIpKeRQBI=
X-Google-Smtp-Source: 
 AA6agR6tMovEsfJhqgqHarGLV5ZJ2YsNxaius3nPzZkvf6kRUzPy5/NJ7Hy0JULhMG8YohKXyIwvgA==
X-Received: by 2002:a05:6402:3583:b0:43d:6943:44a with SMTP id
 y3-20020a056402358300b0043d6943044amr7788801edc.409.1659346401412;
        Mon, 01 Aug 2022 02:33:21 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 kf23-20020a17090776d700b00718d18a1860sm4990451ejc.61.2022.08.01.02.33.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Aug 2022 02:33:20 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH] scripts/oe-setup-builddir: make it known where configurations
 come from
Date: Mon,  1 Aug 2022 11:33:12 +0200
Message-Id: <20220801093312.874112-1-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Aug 2022 09:33:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168744

"with some default values" isn't clear; if the user wants to change or
inspect the default values and their history, we should help them find
where they are. This becomes especially important when using template
configs other than poky's.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 scripts/oe-setup-builddir | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/scripts/oe-setup-builddir b/scripts/oe-setup-builddir
index 54048e62ec..5d644168cb 100755
--- a/scripts/oe-setup-builddir
+++ b/scripts/oe-setup-builddir
@@ -74,9 +74,10 @@ fi
 if [ ! -r "$BUILDDIR/conf/local.conf" ]; then
     cat <<EOM
 You had no conf/local.conf file. This configuration file has therefore been
-created for you with some default values. You may wish to edit it to, for
-example, select a different MACHINE (target hardware). See conf/local.conf
-for more information as common configuration options are commented.
+created for you from $OECORELOCALCONF
+You may wish to edit it to, for example, select a different MACHINE (target
+hardware). See conf/local.conf for more information as common configuration
+options are commented.
 
 EOM
     cp -f "$OECORELOCALCONF" "$BUILDDIR/conf/local.conf"
@@ -89,8 +90,9 @@ fi
 if [ ! -r "$BUILDDIR/conf/bblayers.conf" ]; then
     cat <<EOM
 You had no conf/bblayers.conf file. This configuration file has therefore been
-created for you with some default values. To add additional metadata layers
-into your configuration please add entries to conf/bblayers.conf.
+created for you from $OECORELAYERCONF
+To add additional metadata layers into your configuration please add entries
+to conf/bblayers.conf.
 
 EOM
 
-- 
2.30.2


