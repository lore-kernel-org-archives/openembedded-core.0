Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02CF5C433FE
	for <webhook@archiver.kernel.org>; Wed, 19 Jan 2022 10:41:48 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web08.4735.1642588907156811413
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Jan 2022 02:41:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=VgqufPGz;
 spf=pass (domain: gmail.com, ip: 209.85.128.48,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id
 25-20020a05600c231900b003497473a9c4so13426621wmo.5
        for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Jan 2022 02:41:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2a42ocGdoMiynk/tRzGLyRyYWcRuyDD9/jSlx8Fy050=;
        b=VgqufPGzbn422b0+uIfM+4T6eZ8uVy/NRQoBBc/IfEdDLkhli8MKHe+XnaYmcpJPef
         y61jolnaOM2STBqiK5PHIm3eMcgRDT8jlbc7u9QFwJGdfFxx16fVe5z2fi2w7X9XM2tT
         QsiD+nQ9SaSzU86oD+6Fd/8bdZXBBZrU1Xeroc9iMZk7c4qs6zoE6fCBlmpHy0JYA0ZG
         icNWuu3SwgY/mMXbkpaiByY5wZKcQILETl+MPA+INJhxECup4jZGreGqBrIwXWuRn0nA
         YJOiwgXm8bqzVZfXWjFVGoUa3UXHLvrtlGgUFKyYXNf9seXkpitUU1TjcmxuiVqx4w9L
         L2kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2a42ocGdoMiynk/tRzGLyRyYWcRuyDD9/jSlx8Fy050=;
        b=V+EskK8l7sF/PQFV5mbuAUGts2baTZcyH2K4nhUTNPVwH5xwH15LMMvAJ+6Ft/gysa
         mvrtxglH6CNDAX1nTPSpvGVmMtcJHcZD0ywb03m+rH7NMckONXuZrAEExztrkSRGqpN2
         ptFf8FcyuiNasOlpn5wUY3LV2FoTSTwFjk0iN8SbH6T5kT8vGreYvw1u/eOdFgtq6TuU
         yNcKqcHvBWd6SbEYcHa0XhptjoA/gblvffJzCtimFjPNe2hJWBHBwpkeCAVcXjguVQpV
         IaLW1seo+9i3MLMjvhua87/KK22BtxBYUYki9bV0DxAGog7DU7lcdqXdybjBCnxPF8xY
         FSlw==
X-Gm-Message-State: AOAM532eu4pc3ZcBMLkdcee0YPss4Gd1Y+EsyK7Wk1Oauw9MgIleYI+T
	TsudEUZTbILberKoeSNtToM6+u41hjY=
X-Google-Smtp-Source: 
 ABdhPJzpqgWVontGAKk25cfXmM5z/0tuF5IjEOBId6i2Sq9nAtNN3F6PbnuJ9cjIGf+vRYXif6yZgw==
X-Received: by 2002:a05:600c:19d0:: with SMTP id
 u16mr2767848wmq.39.1642588905793;
        Wed, 19 Jan 2022 02:41:45 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 o5sm4667956wmc.39.2022.01.19.02.41.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jan 2022 02:41:45 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>,
	Changqing Li <changqing.li@windriver.com>
Subject: [PATCH 27/39] pigz: upgrade 2.6 -> 2.7
Date: Wed, 19 Jan 2022 11:41:05 +0100
Message-Id: <20220119104117.2120127-27-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220119104117.2120127-1-alex@linutronix.de>
References: <20220119104117.2120127-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Jan 2022 10:41:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160719

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...0001-Fix-bug-when-combining-l-with-d.patch | 50 -------------------
 .../pigz/{pigz_2.6.bb => pigz_2.7.bb}         |  5 +-
 2 files changed, 2 insertions(+), 53 deletions(-)
 delete mode 100644 meta/recipes-extended/pigz/files/0001-Fix-bug-when-combining-l-with-d.patch
 rename meta/recipes-extended/pigz/{pigz_2.6.bb => pigz_2.7.bb} (88%)

diff --git a/meta/recipes-extended/pigz/files/0001-Fix-bug-when-combining-l-with-d.patch b/meta/recipes-extended/pigz/files/0001-Fix-bug-when-combining-l-with-d.patch
deleted file mode 100644
index 9c301f2054..0000000000
--- a/meta/recipes-extended/pigz/files/0001-Fix-bug-when-combining-l-with-d.patch
+++ /dev/null
@@ -1,50 +0,0 @@
-From 65986f3d12d434b9bc428ceb6fcb1f6eeeb2c47d Mon Sep 17 00:00:00 2001
-From: Changqing Li <changqing.li@windriver.com>
-Date: Mon, 17 Jan 2022 15:36:56 +0800
-Subject: [PATCH] Fix bug when combining -l with -d.
-
-Though it makes no sense to do pigz -ld, that is implicit when
-doing unpigz -l. This commit fixes a bug for that combination.
-
-Upstream-Status: Backport [https://github.com/madler/pigz/commit/326bba44aa102c707dd6ebcd2fc3f413b3119db0]
-
-Signed-off-by: Changqing Li <changqing.li@windriver.com>
----
- pigz.c | 14 +++++++-------
- 1 file changed, 7 insertions(+), 7 deletions(-)
-
-diff --git a/pigz.c b/pigz.c
-index f90157f..d648216 100644
---- a/pigz.c
-+++ b/pigz.c
-@@ -4007,6 +4007,13 @@ local void process(char *path) {
-     }
-     SET_BINARY_MODE(g.ind);
- 
-+    // if requested, just list information about the input file
-+    if (g.list && g.decode != 2) {
-+        list_info();
-+        load_end();
-+        return;
-+    }
-+
-     // if decoding or testing, try to read gzip header
-     if (g.decode) {
-         in_init();
-@@ -4048,13 +4055,6 @@ local void process(char *path) {
-         }
-     }
- 
--    // if requested, just list information about input file
--    if (g.list) {
--        list_info();
--        load_end();
--        return;
--    }
--
-     // create output file out, descriptor outd
-     if (path == NULL || g.pipeout) {
-         // write to stdout
--- 
-2.17.1
-
diff --git a/meta/recipes-extended/pigz/pigz_2.6.bb b/meta/recipes-extended/pigz/pigz_2.7.bb
similarity index 88%
rename from meta/recipes-extended/pigz/pigz_2.6.bb
rename to meta/recipes-extended/pigz/pigz_2.7.bb
index d490a6a722..9a1c591b27 100644
--- a/meta/recipes-extended/pigz/pigz_2.6.bb
+++ b/meta/recipes-extended/pigz/pigz_2.7.bb
@@ -8,9 +8,8 @@ SECTION = "console/utils"
 LICENSE = "Zlib & Apache-2.0"
 LIC_FILES_CHKSUM = "file://pigz.c;md5=9ae6dee8ceba9610596ed0ada493d142;beginline=7;endline=21"
 
-SRC_URI = "http://zlib.net/${BPN}/fossils/${BP}.tar.gz \
-           file://0001-Fix-bug-when-combining-l-with-d.patch"
-SRC_URI[sha256sum] = "2eed7b0d7449d1d70903f2a62cd6005d262eb3a8c9e98687bc8cbb5809db2a7d"
+SRC_URI = "http://zlib.net/${BPN}/fossils/${BP}.tar.gz"
+SRC_URI[sha256sum] = "b4c9e60344a08d5db37ca7ad00a5b2c76ccb9556354b722d56d55ca7e8b1c707"
 PROVIDES:class-native += "gzip-native"
 
 # Point this at the homepage in case /fossils/ isn't updated
-- 
2.20.1


