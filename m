Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D9EEEA8548
	for <webhook@archiver.kernel.org>; Sun,  8 Mar 2026 22:42:58 +0000 (UTC)
Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1648.1773009776985057619
 for <openembedded-core@lists.openembedded.org>;
 Sun, 08 Mar 2026 15:42:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=D+QTIE2Z;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-256628-20260308224254f16a250ea900020707-zadalg@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 20260308224254f16a250ea900020707
        for <openembedded-core@lists.openembedded.org>;
        Sun, 08 Mar 2026 23:42:54 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=osXK2doqGxQ2CpdteOSXyYpILvv66nddk90RSk1s1EQ=;
 b=D+QTIE2ZZzZ//c2YGslAyEa5cQshO5ynINaK/DoIALfYfNUKby1qI7Zu4bWs9Xd13MgCx6
 mSivOCH1KfPg5vxSGzy0VbroDWoLajazSY1vK5VDzt9M3H1NM13Q6v+e/VK5Q95t6iX9weE8
 XqK6t5aWvZ+vcdiwDlqXofj56MZFhe3sGoD+2jlXw4Q2sRw2cdFgSOglYn6ZAC3ItLl2nqOH
 yH+ODZm3ds0wMQDwERi4wc/Uxyr/W95eSwnlD8Gkm/XKoU9UKtq945d11YhMMg3i1MwrNmPf
 bFsl1AHmIg5N10MjL2xQWcBueIN8sa8e+n35G7N2RoyWBJQK9vBD9jqw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][kirkstone][PATCH 2/3] tiff: patch CVE-2025-61144
Date: Sun,  8 Mar 2026 23:42:39 +0100
Message-Id: <20260308224240.60802-2-peter.marko@siemens.com>
In-Reply-To: <20260308224240.60802-1-peter.marko@siemens.com>
References: <20260308224240.60802-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 08 Mar 2026 22:42:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232670

From: Peter Marko <peter.marko@siemens.com>

Pick patch from merge request mentioned in NVD report.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../libtiff/tiff/CVE-2025-61144.patch         | 27 +++++++++++++++++++
 meta/recipes-multimedia/libtiff/tiff_4.3.0.bb |  1 +
 2 files changed, 28 insertions(+)
 create mode 100644 meta/recipes-multimedia/libtiff/tiff/CVE-2025-61144.patch

diff --git a/meta/recipes-multimedia/libtiff/tiff/CVE-2025-61144.patch b/meta/recipes-multimedia/libtiff/tiff/CVE-2025-61144.patch
new file mode 100644
index 00000000000..8b25cdfab9e
--- /dev/null
+++ b/meta/recipes-multimedia/libtiff/tiff/CVE-2025-61144.patch
@@ -0,0 +1,27 @@
+From 88cf9dbb48f6e172629795ecffae35d5052f68aa Mon Sep 17 00:00:00 2001
+From: Lee Howard <faxguy@howardsilvan.com>
+Date: Fri, 5 Sep 2025 21:46:03 +0000
+Subject: [PATCH] tiffcrop: avoid buffer overflow
+
+Fixes #740
+
+CVE: CVE-2025-61144
+Upstream-Status: Backport [https://gitlab.com/libtiff/libtiff/-/commit/88cf9dbb48f6e172629795ecffae35d5052f68aa]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ tools/tiffcrop.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/tools/tiffcrop.c b/tools/tiffcrop.c
+index ae414efc..afa1cce5 100644
+--- a/tools/tiffcrop.c
++++ b/tools/tiffcrop.c
+@@ -3913,7 +3913,7 @@ combineSeparateSamplesBytes (unsigned char *srcbuffs[], unsigned char *out,
+     {
+     if ((dumpfile != NULL) && (level == 2))
+       {
+-      for (s = 0; s < spp; s++)
++      for (s = 0; (s < spp) && (s < MAX_SAMPLES); s++)
+         {
+         dump_info (dumpfile, format, "combineSeparateSamplesBytes","Input data, Sample %"PRIu16, s);
+         dump_buffer(dumpfile, format, 1, cols, row, srcbuffs[s] + (row * src_rowsize));
diff --git a/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb b/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb
index 4c2b0a800b4..02fc956c232 100644
--- a/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb
+++ b/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb
@@ -66,6 +66,7 @@ SRC_URI = "http://download.osgeo.org/libtiff/tiff-${PV}.tar.gz \
            file://CVE-2025-8961.patch \
            file://CVE-2025-9165.patch \
            file://CVE-2025-61143.patch \
+           file://CVE-2025-61144.patch \
            "
 
 SRC_URI[sha256sum] = "0e46e5acb087ce7d1ac53cf4f56a09b221537fc86dfc5daaad1c2e89e1b37ac8"

