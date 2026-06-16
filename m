Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F3D8CD98EE
	for <webhook@archiver.kernel.org>; Tue, 16 Jun 2026 19:16:59 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5793.1781637415311730187
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Jun 2026 12:16:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=tIMcMB85;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-49222fb062bso39116055e9.1
        for <openembedded-core@lists.openembedded.org>; Tue, 16 Jun 2026 12:16:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781637413; x=1782242213; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wkvHdzhjj2XY6tesXQlNDSXLM4wy1h5maMZ63pKpmdU=;
        b=tIMcMB85ii44t+1Pdj6zoJPQG5k1Fw7lDajilVVpKRsTI1c1eD34RGr1CV3ybUIphK
         rQ8uXaRGDmGFJsYu61tYPuy83uqcikYgMmqiaMzmQkXn175QTVdDH/LtpQyJOzAcEOB9
         St87wgUjvtFRsDu8Vu4VyJoikpb4dhZ0BXpctVPWmWFqJ6vJ1cMOUsq2nqBDKcAPJCkN
         gjqZ00E7skCZdtXZdfKNM/wqg9YRu458CPCl9ugKUFa+pnV65WxDwRnmBSVo2jctVjJI
         ijjmYdHHgF63wbzdWrsJyMMmM9u7dntfqrF2S63wad+zHLgQBmVfjBVhsS+X1ovhXqaD
         kxiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781637413; x=1782242213;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wkvHdzhjj2XY6tesXQlNDSXLM4wy1h5maMZ63pKpmdU=;
        b=Z3x9pO2XQV/Yyro0o6mDp4NNOUllsIo2FZodjsDl0pITJnVgEv/feycCxyq1naiX5t
         AU9JCL6Q8+BM3k47z4v4Kxssl7kP5pHXfIvk9dqq1KPfmKu7W/HKmVpxyAplJXfatIw7
         kgK6qiNMjTDjXwO8RZifsup2dfN+lsF+Q1eHv8SUKKzgRfvFzdQEQHl8RKo+uzEf1GFo
         SScrZn+I7ssOXLa3SXoWO3pCOcy0B6yOf3/ktkk0PuFy7LgxqxNVD1YytsCAdIVElWzu
         F7ggtqgf5B9b/ssKobYhDSqieDLtEt87+HGFI2HcWBbQWT8HlZ/ED8z5Tc7tF7bpP2Kj
         PRgA==
X-Gm-Message-State: AOJu0YyXNrQC0Ozxvhy1pIzuVA+wy261USHrQ3x+EkFp5NmcvVRUvs9z
	hkvZEPi5Qisu2r65mFlxAbLf3XssvbdZbFUzFTFvp25xROL6L9F5w5FOxIQBQK1+
X-Gm-Gg: Acq92OGoC9ByU6h57wkVRmTCeSeqMAeS8iMtBqmDfqLFx+EzjU3SP4vGyO5aSUF4SI9
	IRm9/PmaznjOaIjXJC02U2A4mOZ2t/hcIWicBr1QT4VJFCaF/4M78b4HH2gPpIMy5ZH1uWiVBZO
	uUcsMMD4mi7VcReNQfjFQLvSlKg70bHOH62eelsEUfFC4o2vT0LORiy6xRliVtOXTo/IyVBtWoL
	nymiseA/BuHoBLncGVDHrw5dnjat1IuKkFbGIGzl78qrfJu3oLMRw5QqRv2S65uzzzGSjxJFxXa
	bar0DZUs9KfebXlP7LZzYrQ0wzz2P7gAv4mMNRrykhl7ZsTZbhcPhVIegg7OHUqrssFEog7dzLB
	bGszRz8kvsVNI9mOhNX+QjEY0D/qnDxRoMdVKRfXKlZl+LD6PD7cVPND14wnru3Z9jOeYrLYxCJ
	5jhRrBNm5SAlW4Yq/0iPV3A4cbvx/K4HAaQAYSfQE6xG6B0uC3p8wosrI8tVKEFkK86D0SQg==
X-Received: by 2002:a05:600c:4e04:b0:492:2fa4:2563 with SMTP id 5b1f17b1804b1-492333eb324mr12741555e9.25.1781637413413;
        Tue, 16 Jun 2026 12:16:53 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49230a4f8d7sm86982035e9.5.2026.06.16.12.16.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 12:16:52 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 20/30] igt-gpu-tools: upgrade 2.3 -> 2.4
Date: Tue, 16 Jun 2026 21:16:16 +0200
Message-ID: <20260616191628.2014553-20-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260616191628.2014553-1-alex.kanavin@gmail.com>
References: <20260616191628.2014553-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Jun 2026 19:16:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238945

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...-meson.build-do-not-hardcode-the-build-directory-.patch | 7 +++----
 .../{igt-gpu-tools_2.3.bb => igt-gpu-tools_2.4.bb}         | 4 ++--
 2 files changed, 5 insertions(+), 6 deletions(-)
 rename meta/recipes-graphics/igt-gpu-tools/{igt-gpu-tools_2.3.bb => igt-gpu-tools_2.4.bb} (93%)

diff --git a/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools/0001-lib-meson.build-do-not-hardcode-the-build-directory-.patch b/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools/0001-lib-meson.build-do-not-hardcode-the-build-directory-.patch
index 7ff8aa22a9..d8422633cc 100644
--- a/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools/0001-lib-meson.build-do-not-hardcode-the-build-directory-.patch
+++ b/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools/0001-lib-meson.build-do-not-hardcode-the-build-directory-.patch
@@ -1,4 +1,4 @@
-From 27fd94beadfc29ea4ad82f660dbdb2540d0b6b97 Mon Sep 17 00:00:00 2001
+From ebafc97afab5bcd71ca1d2013aed3b09b12e1c35 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Thu, 18 Dec 2025 15:45:11 +0100
 Subject: [PATCH] lib/meson.build: do not hardcode the build directory into the
@@ -25,7 +25,6 @@ and them IGT_IMGDIR is used thusly in lib/igt_core.h:
 #define igt_fopen_data(filename) \
         __igt_fopen_data(IGT_SRCDIR, IGT_DATADIR, IGT_IMGDIR, filename)
 
-
 Upstream-Status: Inappropriate [hack patching in a bogus dir; issue reported at https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/issues/190]
 Signed-off-by: Alexander Kanavin <alex@linutronix.de>
 ---
@@ -33,10 +32,10 @@ Signed-off-by: Alexander Kanavin <alex@linutronix.de>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/lib/meson.build b/lib/meson.build
-index d0487fb3c..f6452e970 100644
+index 5c4829345..d28c95d99 100644
 --- a/lib/meson.build
 +++ b/lib/meson.build
-@@ -292,7 +292,7 @@ foreach f: lib_sources
+@@ -301,7 +301,7 @@ foreach f: lib_sources
  	    '-DIGT_DATADIR="@0@"'.format(join_paths(prefix, datadir)),
  	    '-DIGT_SRCDIR="@0@"'.format(srcdir),
  	    '-DIGT_LOG_DOMAIN="@0@"'.format(f.split('.')[0]),
diff --git a/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_2.3.bb b/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_2.4.bb
similarity index 93%
rename from meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_2.3.bb
rename to meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_2.4.bb
index c92d10c617..32a3a3cc48 100644
--- a/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_2.3.bb
+++ b/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_2.4.bb
@@ -9,13 +9,13 @@ LICENSE = "MIT"
 
 inherit meson pkgconfig
 
-SRCREV = "2d7ec9a36c550c48af4bdd6e748f6753369ab8ff"
+SRCREV = "e6b603e4984e4ce30fe1cc2705734d0f130e0550"
 
 SRC_URI = "git://gitlab.freedesktop.org/drm/igt-gpu-tools.git;protocol=https;branch=master;tag=v${PV} \
            file://0001-lib-meson.build-do-not-hardcode-the-build-directory-.patch \
            "
 
-DEPENDS += "libdrm libpciaccess cairo udev glib-2.0 procps libunwind kmod openssl elfutils alsa-lib json-c bison-native"
+DEPENDS += "libdrm libpciaccess cairo udev glib-2.0 procps libunwind kmod openssl elfutils alsa-lib json-c bison-native pciutils jansson"
 RDEPENDS:${PN} += "bash perl"
 RDEPENDS:${PN}-tests += "bash"
 
-- 
2.47.3


