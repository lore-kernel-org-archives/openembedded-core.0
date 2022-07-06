Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 389E2C43334
	for <webhook@archiver.kernel.org>; Wed,  6 Jul 2022 18:24:43 +0000 (UTC)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com
 [209.85.208.41])
 by mx.groups.io with SMTP id smtpd.web09.686.1657131877552587588
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Jul 2022 11:24:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=K+hF3axo;
 spf=pass (domain: gmail.com, ip: 209.85.208.41,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f41.google.com with SMTP id eq6so20308762edb.6
        for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Jul 2022 11:24:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5iZEhsteUenDNhPKGApRFtnqx9x5JWBZUYVkRCZaJLg=;
        b=K+hF3axogPA0AuQCfCY6qKW1hdRVZ7Kof6GSFnOpyIOxnhHme3pTeF7GZCt7Oje/+0
         GYF1uAswwRx3f9nrVmFUtvJKBKSgEODwJcfJ4Y7dhKux2MMQALCcWMvlw2Z3FTMFmK6O
         SA4j/y3xulVylIOWNSu1YqMZsahmfPEXx8vx2uWagiM7Xn5R/dn9X4hWiyxUYNeCJoSx
         x4iDKicSYx0Kcg8xVg1c+SfxvbP8f6xfgfebdtLpB0tFnNdpo3FLoGYqjfm8tjJ4s/yF
         dad5cb3lwZGIko/tsKFay2lTUU944OsXF1VTDQ7bFTNMEp1S0lCVH1OzqDAhSOkwMRrb
         awIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5iZEhsteUenDNhPKGApRFtnqx9x5JWBZUYVkRCZaJLg=;
        b=hDWfgfiunywjMsi6d499hM3rbXsS7AVEcOW+xP1rsLmJA2Cej57l+ze7jp4GTLjJFg
         i+KuHfrlV9SysSDEXxff0TbNmsdOacDkNz88kpQcBhmGuBBQ8aMiC3LY6cy32wk/l/oC
         46xLMvvpZUlOa0XMQzW6+KdKFhPfgORr3fDYaW7xRG4ze0I68HhMcBM+zzihNRuqm4hs
         NoR7gWQ2cedRBhS0dHdPGxE6x1NVABRLk0DtonzEPIF1JPAQI7ogJQ+opsJu8zUXage2
         wrbKdwgJ65xBka1qqVLrhju3J1cnaIuq95IrQceIHBd4cMP4rxRpLYn1B56KLcifMWpQ
         qeMQ==
X-Gm-Message-State: AJIora+Km02qNhJFM0xL+RXlIucGLOc5gOy3iURS8ltDV+2j3IXqO4+8
	WDzJ4t6hQj4uJE3BN/07pVpfDtfwRDyYQA==
X-Google-Smtp-Source: 
 AGRyM1vLszN6Fk0wcNT9IfbGDpL+Dy4sFO5jccvtqvpIGKe2NJa+tFJs/Ks2GFEw/onxto3OSYBNuA==
X-Received: by 2002:aa7:d542:0:b0:43a:875:64d3 with SMTP id
 u2-20020aa7d542000000b0043a087564d3mr31843530edr.139.1657131875880;
        Wed, 06 Jul 2022 11:24:35 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 ek5-20020a056402370500b0043a253973aasm8554645edb.10.2022.07.06.11.24.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Jul 2022 11:24:35 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 1/2] scripts/oe-setup-builddir: copy site.conf.sample out of
 template directories (if it exists)
Date: Wed,  6 Jul 2022 20:23:28 +0200
Message-Id: <20220706182329.3085564-1-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Jul 2022 18:24:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167740

This allows:

1. Showing users where and how to define these settings correctly when setting up
a build from templates in poky (meta-poky/conf/site.conf.sample has commented
out examples and was previously unused).

2. Distributing site-specific settings with template configurations in other layers,
so there's no need to set them up separately.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 scripts/oe-setup-builddir | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/scripts/oe-setup-builddir b/scripts/oe-setup-builddir
index 54048e62ec..5ad6dd4138 100755
--- a/scripts/oe-setup-builddir
+++ b/scripts/oe-setup-builddir
@@ -64,6 +64,7 @@ if [ -n "$TEMPLATECONF" ]; then
     fi
     OECORELAYERCONF="$TEMPLATECONF/bblayers.conf.sample"
     OECORELOCALCONF="$TEMPLATECONF/local.conf.sample"
+    OECORESITECONF="$TEMPLATECONF/site.conf.sample"
     OECORENOTESCONF="$TEMPLATECONF/conf-notes.txt"
 fi
 
@@ -77,9 +78,11 @@ You had no conf/local.conf file. This configuration file has therefore been
 created for you with some default values. You may wish to edit it to, for
 example, select a different MACHINE (target hardware). See conf/local.conf
 for more information as common configuration options are commented.
-
+Also check conf/site.conf for site specific settings such as proxies and
+download cache locations.
 EOM
     cp -f "$OECORELOCALCONF" "$BUILDDIR/conf/local.conf"
+    cp -f "$OECORESITECONF" "$BUILDDIR/conf/site.conf" || true
     SHOWYPDOC=yes
 fi
 
@@ -107,6 +110,7 @@ fi
 # Prevent disturbing a new GIT clone in same console
 unset OECORELOCALCONF
 unset OECORELAYERCONF
+unset OECORESITECONF
 
 # Ending the first-time run message. Show the YP Documentation banner.
 if [ ! -z "$SHOWYPDOC" ]; then
-- 
2.30.2


