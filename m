Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B1E8E9A03B
	for <webhook@archiver.kernel.org>; Tue, 17 Feb 2026 21:05:59 +0000 (UTC)
Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.22636.1771362355981461083
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Feb 2026 13:05:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=IqW+IGNF;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.225, mailfrom: fm-256628-202602172105548b738b543e000207d6-vgmjza@rts-flowmailer.siemens.com)
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 202602172105548b738b543e000207d6
        for <openembedded-core@lists.openembedded.org>;
        Tue, 17 Feb 2026 22:05:54 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=ipDZ2XTIFV8NzhdJVHg3e6eOBG835+e/aGG/FLovG6Y=;
 b=IqW+IGNFwm6cgF0QfLelpAlYxl2AETM/EbVOnXhyd8X1uniXS7oks5c1KCcnzj6DJth3m2
 QG2aIxiJl4WlzbPwdSBGq7Q6Elf33bw4YUAhNAwXboQwH31joOjv97gS0ZNfhEx6QNicCJXS
 yqBLVwt7o36orqhPVUaKCp0wJY2PEG10YmFhTAOgcvJJr5WDKuv9t9ZIse+94GYHp28pJtaj
 rGvreQYscp+zU2S9b12lXtx/PwGjCre8c1gWZ+zDof2QEjdbhr8c/XMsTnKjbbGzgUeUhjzy
 NphAMYSw+RePolG5tqdVG1MY5+5PCQROkzm3WJiZID834PvU2AF2fAEA==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][kirkstone][PATCH] libpng: patch CVE-2026-25646
Date: Tue, 17 Feb 2026 22:05:49 +0100
Message-Id: <20260217210549.2657864-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Feb 2026 21:05:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231278

From: Peter Marko <peter.marko@siemens.com>

Backport patch mentioned in NVD CVE report.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../libpng/files/CVE-2026-25646.patch         | 61 +++++++++++++++++++
 .../libpng/libpng_1.6.39.bb                   |  1 +
 2 files changed, 62 insertions(+)
 create mode 100644 meta/recipes-multimedia/libpng/files/CVE-2026-25646.patch

diff --git a/meta/recipes-multimedia/libpng/files/CVE-2026-25646.patch b/meta/recipes-multimedia/libpng/files/CVE-2026-25646.patch
new file mode 100644
index 0000000000..e97c5078b0
--- /dev/null
+++ b/meta/recipes-multimedia/libpng/files/CVE-2026-25646.patch
@@ -0,0 +1,61 @@
+From 01d03b8453eb30ade759cd45c707e5a1c7277d88 Mon Sep 17 00:00:00 2001
+From: Cosmin Truta <ctruta@gmail.com>
+Date: Fri, 6 Feb 2026 19:11:54 +0200
+Subject: [PATCH] Fix a heap buffer overflow in `png_set_quantize`
+
+The color distance hash table stored the current palette indices, but
+the color-pruning loop assumed the original indices. When colors were
+eliminated and indices changed, the stored indices became stale. This
+caused the loop bound `max_d` to grow past the 769-element hash array.
+
+The fix consists in storing the original indices via `palette_to_index`
+to match the pruning loop's expectations.
+
+Reported-by: Joshua Inscoe <pwnalone@users.noreply.github.com>
+Co-authored-by: Joshua Inscoe <pwnalone@users.noreply.github.com>
+Signed-off-by: Cosmin Truta <ctruta@gmail.com>
+
+CVE: CVE-2026-25646
+Upstream-Status: Backport [https://github.com/pnggroup/libpng/commit/01d03b8453eb30ade759cd45c707e5a1c7277d88]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ AUTHORS    | 1 +
+ pngrtran.c | 6 +++---
+ 2 files changed, 4 insertions(+), 3 deletions(-)
+
+diff --git a/AUTHORS b/AUTHORS
+index b9c0fffcf..4094f4a57 100644
+--- a/AUTHORS
++++ b/AUTHORS
+@@ -14,6 +14,7 @@ Authors, for copyright and licensing purposes.
+  * Guy Eric Schalnat
+  * James Yu
+  * John Bowler
++ * Joshua Inscoe
+  * Kevin Bracey
+  * Magnus Holmgren
+  * Mandar Sahastrabuddhe
+diff --git a/pngrtran.c b/pngrtran.c
+index fe8f9d32c..1fce9af12 100644
+--- a/pngrtran.c
++++ b/pngrtran.c
+@@ -1,7 +1,7 @@
+ 
+ /* pngrtran.c - transforms the data in a row for PNG readers
+  *
+- * Copyright (c) 2018-2019 Cosmin Truta
++ * Copyright (c) 2018-2026 Cosmin Truta
+  * Copyright (c) 1998-2002,2004,2006-2018 Glenn Randers-Pehrson
+  * Copyright (c) 1996-1997 Andreas Dilger
+  * Copyright (c) 1995-1996 Guy Eric Schalnat, Group 42, Inc.
+@@ -647,8 +647,8 @@ png_set_quantize(png_structrp png_ptr, png_colorp palette,
+                          break;
+ 
+                      t->next = hash[d];
+-                     t->left = (png_byte)i;
+-                     t->right = (png_byte)j;
++                     t->left = png_ptr->palette_to_index[i];
++                     t->right = png_ptr->palette_to_index[j];
+                      hash[d] = t;
+                   }
+                }
diff --git a/meta/recipes-multimedia/libpng/libpng_1.6.39.bb b/meta/recipes-multimedia/libpng/libpng_1.6.39.bb
index c4347a6715..448594e0d7 100644
--- a/meta/recipes-multimedia/libpng/libpng_1.6.39.bb
+++ b/meta/recipes-multimedia/libpng/libpng_1.6.39.bb
@@ -24,6 +24,7 @@ SRC_URI = "\
            file://CVE-2025-66293-02.patch \
            file://CVE-2026-22695.patch \
            file://CVE-2026-22801.patch \
+           file://CVE-2026-25646.patch \
 "
 
 SRC_URI[sha256sum] = "1f4696ce70b4ee5f85f1e1623dc1229b210029fa4b7aee573df3e2ba7b036937"

