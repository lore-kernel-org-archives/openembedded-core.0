Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4920F357C5
	for <webhook@archiver.kernel.org>; Tue, 24 Feb 2026 14:33:22 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.21687.1771943592514320116
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Feb 2026 06:33:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=O5KKhYRI;
 spf=pass (domain: smile.fr, ip: 209.85.128.43, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-48375f10628so36363495e9.1
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 06:33:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1771943591; x=1772548391; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Qqel6sAlmu6KUUVJwAC3aNfAHi1TsGIXY1XdgCHWSBQ=;
        b=O5KKhYRICHCyig+vLgqL2HQ6NKw5dcVn3fK1nbGyGmqw/lXWkKDFVeBC3melgEUACz
         m33aZZywOoiawcRBlO9oWJpxyVvy74ZbXy6UpSTCDUvMS1jZ6T7dcKl4dEuKQ4FBQBER
         QKiUfjWZwc9ynhT8e4oBXa613tkeGZTAkRgzA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771943591; x=1772548391;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Qqel6sAlmu6KUUVJwAC3aNfAHi1TsGIXY1XdgCHWSBQ=;
        b=R84ED5C1riGeq8PU6pxyyIPc4h9L6MEnNuCwYjA6FfVOrpzb2ioHnEY/tLrvE6G4Ug
         lLcDaiqcggJt7TPraJEl9LHOldq7x+4ohwX93zXqLTcBfvOzHP3IRnzcnrEBfp0UBXSa
         OIY4QSUDsbBXqQ/x+FIstaugHdgCZQayOossJ7DZ6BTXxIRVsoHZVv/ob+Xx31Ukc9Cw
         y+neEwNYfXurDRjsAaVOlwFU8pYA9fU/pQZnDj97KxWqnNYk+KjTCjeUhPM2ZivpMdE3
         xLCjM7zT9+Yj4YiVoYRDrlhOcCr9/ce4UwmM5DNPkdy7nUM+HuEZk1NTYIqGb7TEljqK
         wqqg==
X-Gm-Message-State: AOJu0YwwPPZCPjxHWFyzrRw1d3EGW2/HlBim444gP+zE/QT/yj5JjmhW
	Of3IFwcpyZpKCH6kFYPvYMSG9jkkiwPSKxf8JxluYx+j+ypJ1y/itS2LplZjdCi+ABfsoSRG3Dv
	g4Qi/
X-Gm-Gg: AZuq6aKvM//SDFrLfROalXWQDsTjBWkOk5vPqipZyVI7rKnXM3U4Jx5vKswLO4u4low
	sWbISRqnaQhwGpyXunjw35MfrdnVSXWrQc6nFYsiwfcPbQrPfKYWoBkFK4juyRiOCxXUn49J6gG
	tKSJ3pN177vqWTNA/bJQ4bLC5HccljYCt90Og+c07p9fSm0h8ZRfWgJlfhMPBxae1SpNQCQid+4
	I5zxYO/XxkQJfKL9iqxFT8F8AGONvIyMWyQsbNVhfunpxI96AtAgJxKgkt66ayXKwEiRUPdEtVS
	uIXjR2ETbE/kHeQzV0mn3mUM/AQsaMZTs2SI2RyW9W1W6x82PZ/c5PpSF3hJ6VpontnTxJiG1a+
	nq+yMGoSmJwDwPRzvMOHRh1PcCXJX3dxG92iDADRN749T2ZfHUiMXzHOpdmaNYOfC3xGfh5vgwu
	T0lcu4l2jTA7NNq89QShHZqxYELXRyP4lLntLvN+wxaRE+0UhDrm3RacCYYAh6/WHcm+L2AaR8r
	C9f1RFFs1+7Z6UloTn28ei7mKGDuUBF8JC77q4On3Vp
X-Received: by 2002:a05:600c:3111:b0:483:612d:7a9a with SMTP id 5b1f17b1804b1-483a95622f5mr215154135e9.0.1771943590527;
        Tue, 24 Feb 2026 06:33:10 -0800 (PST)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483b88f950esm19819895e9.15.2026.02.24.06.33.09
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 06:33:09 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 30/44] libpng: patch CVE-2026-25646
Date: Tue, 24 Feb 2026 15:31:58 +0100
Message-ID: <e883a05e7f508f6d446901671e27b54a6fb67c76.1771943404.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1771943404.git.yoann.congal@smile.fr>
References: <cover.1771943404.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 14:33:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231837

From: Peter Marko <peter.marko@siemens.com>

Backport patch mentioned in NVD CVE report.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../libpng/files/CVE-2026-25646.patch         | 61 +++++++++++++++++++
 .../libpng/libpng_1.6.42.bb                   |  1 +
 2 files changed, 62 insertions(+)
 create mode 100644 meta/recipes-multimedia/libpng/files/CVE-2026-25646.patch

diff --git a/meta/recipes-multimedia/libpng/files/CVE-2026-25646.patch b/meta/recipes-multimedia/libpng/files/CVE-2026-25646.patch
new file mode 100644
index 00000000000..5fbf5eb0f75
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
+@@ -15,6 +15,7 @@ Authors, for copyright and licensing purposes.
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
+- * Copyright (c) 2018-2024 Cosmin Truta
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
diff --git a/meta/recipes-multimedia/libpng/libpng_1.6.42.bb b/meta/recipes-multimedia/libpng/libpng_1.6.42.bb
index 0e375a0ce84..7471315fddc 100644
--- a/meta/recipes-multimedia/libpng/libpng_1.6.42.bb
+++ b/meta/recipes-multimedia/libpng/libpng_1.6.42.bb
@@ -23,6 +23,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}${LIBV}/${PV}/${BP}.tar.xz
            file://CVE-2025-66293-02.patch \
            file://CVE-2026-22695.patch \
            file://CVE-2026-22801.patch \
+           file://CVE-2026-25646.patch \
 "
 
 SRC_URI[sha256sum] = "c919dbc11f4c03b05aba3f8884d8eb7adfe3572ad228af972bb60057bdb48450"

