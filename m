Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B0D6C43219
	for <webhook@archiver.kernel.org>; Sun, 13 Nov 2022 14:13:04 +0000 (UTC)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.web12.2804.1668348779511320811
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Nov 2022 06:12:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=nV8eaZaM;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.182, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f182.google.com with SMTP id v3so8163969pgh.4
        for <openembedded-core@lists.openembedded.org>; Sun, 13 Nov 2022 06:12:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n3R5mdUVRU53L42CEvo9CTWz9S2/0sVXNWYopblK1mo=;
        b=nV8eaZaMuEjfYXKZ2UIJJmqFHGYuw2Hy3q/fknz+hfNj/mHEF1Zxet5lCZj0d68cwv
         V/5Icb68BcFT7Xx9uciMVTzPF76syNDHNL736QW90UhFXboOqJZLShrIKPQEUJs2nT8E
         7RDWvjgGmMdB3IMolkh7OlyTV7NYSdIUZEzXicYOqJJKHY61PYIDnEMIPE5yAdYMY9s8
         c+Hx/CkIHT5iNXF5RAR35bCOLAU6qwejRY72Ef66XFSBpH/g6k6RkGKUp4nP37PzeKpl
         NvPvRDRd7bmvK1NfOl4CEWDuwuGsd66FDZ/snu9m9slensKb/mGJI2RYc56NKnzgNH/T
         u81A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n3R5mdUVRU53L42CEvo9CTWz9S2/0sVXNWYopblK1mo=;
        b=zgLubO89fS2Q4Br3Z9O4BsOs0rLNy5wUhPBXdRPjruZnC9036Fi0aSu6Cp+khE8ges
         YEqK+L/b+MxvYd/XaElqMjFlFFPQaUExP6ibUewxTwLgf6jK393n2VG4ep1oOomQiZPI
         ARPPkAA/WDBRW+Mb06J3viLFMNuawNzBHyGGRmBtRfCqVMO4K7yXkLsOVFBLYcmKRceG
         4jPZH2xqHx+f9TPxN60JPOZJCM2PIOzTAOdmmM73KQtS4U2b6bJnJgu6HJXEu5W2ZxPw
         wmE9pws6Ytbw39QEpsFgk5cnbm339XHl4qAboEttDTxXBVBY+MAMa3mQtsPGzAwfOhq1
         mTrQ==
X-Gm-Message-State: ANoB5pkJld/tYHq77GPGOaiCumYYLbClv5BZBUJ1lK6OzcuM6xJUPa3+
	t5xqTZ12Wc+dlWtBfYBeZfEGaJ6otW9+r5yM
X-Google-Smtp-Source: AA0mqf4N7lvt5n/JiqrwqiRo1GaqiNxDaDOEVaCPSydI9tZdjg1DfoTk3INgQK2upHxlMmEj2UXMFQ==
X-Received: by 2002:a63:2264:0:b0:438:a46b:63f2 with SMTP id t36-20020a632264000000b00438a46b63f2mr8727507pgm.572.1668348778350;
        Sun, 13 Nov 2022 06:12:58 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id w34-20020a634762000000b0046b2ebb0a52sm4198771pgk.17.2022.11.13.06.12.57
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Nov 2022 06:12:57 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 1/9] pixman: backport fix for CVE-2022-44638
Date: Sun, 13 Nov 2022 04:12:39 -1000
Message-Id: <1d2e131d9ba55626354264d454b2808e84751600.1668348622.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1668348622.git.steve@sakoman.com>
References: <cover.1668348622.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 13 Nov 2022 14:13:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173195

From: Ross Burton <ross.burton@arm.com>

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
(cherry picked from commit 23df4760ebc153c484d467e51b414910c570a6f8)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../xorg-lib/pixman/CVE-2022-44638.patch      | 33 +++++++++++++++++++
 .../xorg-lib/pixman_0.40.0.bb                 |  1 +
 2 files changed, 34 insertions(+)
 create mode 100644 meta/recipes-graphics/xorg-lib/pixman/CVE-2022-44638.patch

diff --git a/meta/recipes-graphics/xorg-lib/pixman/CVE-2022-44638.patch b/meta/recipes-graphics/xorg-lib/pixman/CVE-2022-44638.patch
new file mode 100644
index 0000000000..d226766d49
--- /dev/null
+++ b/meta/recipes-graphics/xorg-lib/pixman/CVE-2022-44638.patch
@@ -0,0 +1,33 @@
+CVE: CVE-2022-44638
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
+From a1f88e842e0216a5b4df1ab023caebe33c101395 Mon Sep 17 00:00:00 2001
+From: Matt Turner <mattst88@gmail.com>
+Date: Wed, 2 Nov 2022 12:07:32 -0400
+Subject: [PATCH] Avoid integer overflow leading to out-of-bounds write
+
+Thanks to Maddie Stone and Google's Project Zero for discovering this
+issue, providing a proof-of-concept, and a great analysis.
+
+Closes: https://gitlab.freedesktop.org/pixman/pixman/-/issues/63
+---
+ pixman/pixman-trap.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/pixman/pixman-trap.c b/pixman/pixman-trap.c
+index 91766fd..7560405 100644
+--- a/pixman/pixman-trap.c
++++ b/pixman/pixman-trap.c
+@@ -74,7 +74,7 @@ pixman_sample_floor_y (pixman_fixed_t y,
+ 
+     if (f < Y_FRAC_FIRST (n))
+     {
+-	if (pixman_fixed_to_int (i) == 0x8000)
++	if (pixman_fixed_to_int (i) == 0xffff8000)
+ 	{
+ 	    f = 0; /* saturate */
+ 	}
+-- 
+GitLab
+
diff --git a/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb b/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb
index ccfe277746..c56733eefd 100644
--- a/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb
+++ b/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb
@@ -9,6 +9,7 @@ DEPENDS = "zlib"
 
 SRC_URI = "https://www.cairographics.org/releases/${BP}.tar.gz \
            file://0001-ARM-qemu-related-workarounds-in-cpu-features-detecti.patch \
+           file://CVE-2022-44638.patch \
            "
 SRC_URI[md5sum] = "73858c0862dd9896fb5f62ae267084a4"
 SRC_URI[sha256sum] = "6d200dec3740d9ec4ec8d1180e25779c00bc749f94278c8b9021f5534db223fc"
-- 
2.25.1


