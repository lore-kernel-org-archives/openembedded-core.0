Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D8E2D58074
	for <webhook@archiver.kernel.org>; Mon, 25 Nov 2024 12:01:43 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web10.17078.1732536093280197294
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Nov 2024 04:01:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RvzWkVTa;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-434a14d6bf4so4023535e9.1
        for <openembedded-core@lists.openembedded.org>; Mon, 25 Nov 2024 04:01:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732536092; x=1733140892; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2al1ctNOqVt85Zqf/Uz8LqnoJ6iujI9930XoJCJJ7v4=;
        b=RvzWkVTaDO3zZvVZ224lfhv9f3tEiFDHCT8uvvV3eKgDStwkGb/Oz5yaNdv0i4X9Hq
         OxqPwfrUP7eSQ0NUehlzMskLZtVwtqJtmZKeqk7Kk7igozgP63/ifQygO2J4MVqENtVl
         5Ft4DZA40n//FZykR6TfTNsfu6yHn9Nj/KciVGJ8jVVY5NI4La0ulsD+JCE50P+anCVu
         IZQsdkKlOSQ/dtjoE4qvOK1gaQ7K9hsnJzYaXDJS6qzkGLcjIAUGHg0l1YZsefldINmX
         CSFj9zRBDPRdzaEM4mOCyzNsnHNnJ3P6+x//lu9otY2BZE4DkWlhQFnFqlx8fGA1Xh4g
         S6MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732536092; x=1733140892;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2al1ctNOqVt85Zqf/Uz8LqnoJ6iujI9930XoJCJJ7v4=;
        b=xQ81qLEgcjhEg2f2/hUqVuEmrbj7UuE6Fcgrt08ZPRotRmXWn2pcBYJhVvVO1yrrqT
         b6CH1KS/svq/RsPaWT0PJyYg+hxpzbiIacfbT65hR2SjgQpuVyI9SA+tNlKyXfZRMPYi
         9lMznLFnVVzWtAYRfqsgEPRl67PhXZef0YdvWlDLCGfQqFPeX6mYJpbn9ICiu2CetAZc
         U7nFbWXuw2V/mr01sEHuMG2uqcbeini5FNyWNxIe5Jx7/r0nyUgqzLA3V5vX9p9pp4oD
         xrXRQZoRTsiAh1TYLg9l844D8iTILUuqYadpKuUQF6dCJAXhOTGbxA8Hnudp8USFusqA
         r+3Q==
X-Gm-Message-State: AOJu0YwK/q8FDt3D1jfPNW/RM/qfrnia2qO2XtA4H9BWYuTqDCT0mvoD
	FE9r7eLYrMcHEOrp0GEGGAsSdyPCwOUlg4PH+i0DyNodzmho1FknwO3FTg==
X-Gm-Gg: ASbGnctJ4yzsRKpwF8/VK121qw9/XLhFhy1GXKKWPccjfy8Wg52Y/Oj7mAEHpomrC9H
	uuhESPIuOLxs8e9NEgLn4xGtjUMOrQ6JNbbYJwEO/1ej+0MQpvqzdcB7MkdSYMNVFYYw6pzwVSx
	w2S/JdG3Zh4moKtfVypXpf/llQXyH4elsSS49X9V1wHohsrq9+idzW344FeSH5FcpAPtxs/masV
	7Futfsxz74A28j5kVWMiMSMRRy6SxALqH8ayjY4m6AzCC86z0stAp8hwrNT6mR+QbM1SA9vc80Q
	6Avam3lAyaU=
X-Google-Smtp-Source: AGHT+IE4aGuRp1sPXC50e7puRauWGiD5DHeKRAjZnSt+ulKWHfIPn6oTLBb4KzuI8742N4k+6ax6OA==
X-Received: by 2002:a05:600c:138e:b0:431:1868:417f with SMTP id 5b1f17b1804b1-433ce426977mr115897675e9.17.1732536091314;
        Mon, 25 Nov 2024 04:01:31 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4349e80e51esm44881115e9.33.2024.11.25.04.01.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Nov 2024 04:01:31 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 03/35] chrpath: upgrade 0.16 -> 0.18
Date: Mon, 25 Nov 2024 13:00:55 +0100
Message-Id: <20241125120127.2205232-3-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241125120127.2205232-1-alex.kanavin@gmail.com>
References: <20241125120127.2205232-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 25 Nov 2024 12:01:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207750

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-devtools/chrpath/chrpath/standarddoc.patch      | 5 +----
 .../chrpath/{chrpath_0.16.bb => chrpath_0.18.bb}             | 4 ++--
 2 files changed, 3 insertions(+), 6 deletions(-)
 rename meta/recipes-devtools/chrpath/{chrpath_0.16.bb => chrpath_0.18.bb} (85%)

diff --git a/meta/recipes-devtools/chrpath/chrpath/standarddoc.patch b/meta/recipes-devtools/chrpath/chrpath/standarddoc.patch
index 3d303fbc6fd..b22e1f5f9b0 100644
--- a/meta/recipes-devtools/chrpath/chrpath/standarddoc.patch
+++ b/meta/recipes-devtools/chrpath/chrpath/standarddoc.patch
@@ -1,4 +1,4 @@
-From 285b5fbf1d6b25ff55d305c17edf4d327bf19dd3 Mon Sep 17 00:00:00 2001
+From cc3219f01501904daec28d48e450f628f644bc3c Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Tue, 5 Jul 2011 23:42:29 +0100
 Subject: [PATCH] chrpath: Ensure the package respects the docdir variable
@@ -27,6 +27,3 @@ index b50ad21..5f7e861 100644
  doc_DATA = AUTHORS COPYING ChangeLog INSTALL NEWS README
  
  bin_PROGRAMS = chrpath
--- 
-2.8.1
-
diff --git a/meta/recipes-devtools/chrpath/chrpath_0.16.bb b/meta/recipes-devtools/chrpath/chrpath_0.18.bb
similarity index 85%
rename from meta/recipes-devtools/chrpath/chrpath_0.16.bb
rename to meta/recipes-devtools/chrpath/chrpath_0.18.bb
index d33c7837a17..653c1115d0f 100644
--- a/meta/recipes-devtools/chrpath/chrpath_0.16.bb
+++ b/meta/recipes-devtools/chrpath/chrpath_0.18.bb
@@ -9,10 +9,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
 SRC_URI = "${DEBIAN_MIRROR}/main/c/${BPN}/${BPN}_${PV}.orig.tar.gz \
            file://standarddoc.patch"
 
-SRC_URI[md5sum] = "2bf8d1d1ee345fc8a7915576f5649982"
-SRC_URI[sha256sum] = "bb0d4c54bac2990e1bdf8132f2c9477ae752859d523e141e72b3b11a12c26e7b"
+SRC_URI[sha256sum] = "f09c49f0618660ca11fc6d9580ddde904c7224d4c6d0f6f2d1f9bcdc9102c9aa"
 
 inherit autotools
+S = "${WORKDIR}/chrpath"
 
 # We don't have a staged chrpath-native for ensuring our binary is
 # relocatable, so use the one we've just built
-- 
2.39.5


