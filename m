Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43295C433FE
	for <webhook@archiver.kernel.org>; Wed,  2 Feb 2022 18:28:19 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com
 [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.web08.2248.1643826498196364031
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Feb 2022 10:28:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Q61/1a4X;
 spf=pass (domain: gmail.com, ip: 209.85.218.50,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f50.google.com with SMTP id s5so284286ejx.2
        for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Feb 2022 10:28:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wyIzAK32I9guvooEcOicPRssUPcb/WDBUwd/FV7/bA4=;
        b=Q61/1a4Xy+lPwFWfSTLw29UGfw4tTwNkos9DlWqBZpL5IS1H0gI+yJunVBubNj82qC
         o/QSquDR3nl/tXUmeTZzp8KnaAfGJBbX/kG0PKt5+K4A9AzU1gGkYv3+ZSQq/8N4xL9+
         +FbhLHsmfnDIgufTuJr9jN0FmaOxR+PU5TuUVUnqOlcllWMaQgOrscDaQ3fURNs41KYE
         R2jlk219E7UbjkzKsk/qMQCMRvRkF3EJDh8pWYMSrIgLxQcH10hG5v99yEyY5SAwCUBB
         gi2k5CyEa8f6dI+s3D3Oy+WfM7lar0lM3a+Af2VxUgYtrN5lazaInEtsEJooYNo+PfgP
         XJPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wyIzAK32I9guvooEcOicPRssUPcb/WDBUwd/FV7/bA4=;
        b=U4a/sEfkO9EDq4y66lsgmnBDbjCep5yMZs8Uz8aTTr3X7adK5l32fLAWYIM8+6jVox
         OMjKyhbcCBXse5ryeOWoLu5UmcwRKNZKoQFkxxzvOK4ivDR5yR+3oo8HG428xH48LEBs
         OuWfBw65mfcmOoRnOdTP3ijEJBKqub9szB7f7VffQBErInhpbD3npmJWM7IOZkkiMsji
         DgWyFb1Rksv53aKcu68aRe9IVOJpkx9WUpI6K7eXV5BW9U4yDSETYVyaV1eeiVoEI/xI
         N053oHsGzEVppJEy5SaQQR+IfICSukOIcoD9vsBpg7q/z8MihDwH3SgUOrW4/JhwXRgN
         Wcbg==
X-Gm-Message-State: AOAM533C9Nv1enezOr4SN7SjC/c/WHH2zKk6mQ5Q81STHthWxycDAfYK
	NCWApOkCg97PGBA5S3i78thxU+oeO54=
X-Google-Smtp-Source: 
 ABdhPJwKUEHREpwDCV7MEi40zwc9nmCjxA5lAVbNWKy8NzCrCZdkXSMrVjgRyRycZyOkXRLsM5TgbQ==
X-Received: by 2002:a17:907:6293:: with SMTP id
 nd19mr25683916ejc.64.1643826496786;
        Wed, 02 Feb 2022 10:28:16 -0800 (PST)
Received: from nereus.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 i12sm15644203ejy.43.2022.02.02.10.28.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Feb 2022 10:28:16 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 16/33] glib-2.0: upgrade 2.70.2 -> 2.70.3
Date: Wed,  2 Feb 2022 19:27:41 +0100
Message-Id: <20220202182758.919991-16-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220202182758.919991-1-alex@linutronix.de>
References: <20220202182758.919991-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Feb 2022 18:28:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161241

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-core/glib-2.0/glib-2.0/relocate-modules.patch      | 2 +-
 .../glib-2.0/{glib-2.0_2.70.2.bb => glib-2.0_2.70.3.bb}         | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-core/glib-2.0/{glib-2.0_2.70.2.bb => glib-2.0_2.70.3.bb} (96%)

diff --git a/meta/recipes-core/glib-2.0/glib-2.0/relocate-modules.patch b/meta/recipes-core/glib-2.0/glib-2.0/relocate-modules.patch
index 2118c7e6b9..d3bb05e669 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0/relocate-modules.patch
+++ b/meta/recipes-core/glib-2.0/glib-2.0/relocate-modules.patch
@@ -1,4 +1,4 @@
-From f4b144cbcd474d5f4982e654607fd609e056b532 Mon Sep 17 00:00:00 2001
+From d4e95568151cb7a62b6a29a4d2c3f532fd55c98c Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Fri, 11 Mar 2016 15:35:55 +0000
 Subject: [PATCH] glib-2.0: relocate the GIO module directory for native builds
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.70.2.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.70.3.bb
similarity index 96%
rename from meta/recipes-core/glib-2.0/glib-2.0_2.70.2.bb
rename to meta/recipes-core/glib-2.0/glib-2.0_2.70.3.bb
index df0dde5080..760f71dcda 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.70.2.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.70.3.bb
@@ -20,7 +20,7 @@ SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
            "
 SRC_URI:append:class-native = " file://relocate-modules.patch"
 
-SRC_URI[sha256sum] = "0551459c85cd3da3d58ddc9016fd28be5af503f5e1615a71ba5b512ac945806f"
+SRC_URI[sha256sum] = "233fa4841c1e19e396db7607d58f6b75ba3313c50bf0fce07b2e3532d5eb7d46"
 
 # Find any meson cross files in FILESPATH that are relevant for the current
 # build (using siteinfo) and add them to EXTRA_OEMESON.
-- 
2.20.1


