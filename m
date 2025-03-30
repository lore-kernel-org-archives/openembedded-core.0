Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33075C28B20
	for <webhook@archiver.kernel.org>; Sun, 30 Mar 2025 20:43:36 +0000 (UTC)
Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.web10.37890.1743367408595514354
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Mar 2025 13:43:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=CmQbkEkM;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-256628-202503302043251b27fab7922e0e1e35-_xk9aa@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 202503302043251b27fab7922e0e1e35
        for <openembedded-core@lists.openembedded.org>;
        Sun, 30 Mar 2025 22:43:26 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=JNtstNzyo8wFQZsxYOsC7fZYCCEN1S+YVoysjEb82sY=;
 b=CmQbkEkMIjLJVu470cUloCBRpvYiBdU5UezFOKEIWs39Q/G2t3HsauY9Bb0xD/h2ytqxYy
 0BH/dNhPglb6FDdljuSTj8vjnYo3CojyNV1Nfr+89GdKwro303oGmHWfrCcVPsao2MGFIzES
 jLRGqDMm+k7O0HGLYZ3coBX7LWXI09FREo4NpXBZx5FUB+dt3hTXE3fg9yI2nldjVfFwUK0c
 jfuPAfVSP4unTiYbgGuWsLLm6Ncoe+92QZyXTbmbCRgnwC+PHLlQryEMmnKwRU2wXCmoINXi
 Ph4SWAFQS8wa0LhIloqLDNC/nMfSkxee8cYfrUreyJI/Jh4CaE9Xmx9g==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][scarthgap][PATCH] freetype: follow-up patch for CVE-2025-27363
Date: Sun, 30 Mar 2025 22:42:37 +0200
Message-Id: <20250330204237.365611-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 30 Mar 2025 20:43:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213924

From: Peter Marko <peter.marko@siemens.com>

Per [1] there are two patches needed - [2] which is already included in
3.13.1 and [3] which is only in 2.13.3.
Backport the second patch.

[1] https://gitlab.freedesktop.org/freetype/freetype/-/issues/1322
[2] https://gitlab.freedesktop.org/freetype/freetype/-/commit/ef636696524b081f1b8819eb0c6a0b932d35757d
[3] https://gitlab.freedesktop.org/freetype/freetype/-/commit/73720c7c9958e87b3d134a7574d1720ad2d24442

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../freetype/freetype/CVE-2025-27363.patch    | 33 +++++++++++++++++++
 .../freetype/freetype_2.13.2.bb               |  4 ++-
 2 files changed, 36 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-graphics/freetype/freetype/CVE-2025-27363.patch

diff --git a/meta/recipes-graphics/freetype/freetype/CVE-2025-27363.patch b/meta/recipes-graphics/freetype/freetype/CVE-2025-27363.patch
new file mode 100644
index 0000000000..0882b01498
--- /dev/null
+++ b/meta/recipes-graphics/freetype/freetype/CVE-2025-27363.patch
@@ -0,0 +1,33 @@
+From 73720c7c9958e87b3d134a7574d1720ad2d24442 Mon Sep 17 00:00:00 2001
+From: Alexei Podtelezhnikov <apodtele@gmail.com>
+Date: Sun, 23 Jun 2024 10:58:00 -0400
+Subject: [PATCH] * src/truetype/ttgload.c (load_truetype_glyph): Unsigned fix.
+
+CVE: CVE-2025-27363
+Upstream-Status: Backport [https://gitlab.freedesktop.org/freetype/freetype/-/commit/73720c7c9958e87b3d134a7574d1720ad2d24442]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ src/truetype/ttgload.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/truetype/ttgload.c b/src/truetype/ttgload.c
+index 8cddc394c..b656ccf04 100644
+--- a/src/truetype/ttgload.c
++++ b/src/truetype/ttgload.c
+@@ -1741,14 +1741,14 @@
+       if ( FT_IS_NAMED_INSTANCE( FT_FACE( face ) ) ||
+            FT_IS_VARIATION( FT_FACE( face ) )      )
+       {
+-        short        i, limit;
++        FT_UShort    i, limit;
+         FT_SubGlyph  subglyph;
+ 
+         FT_Outline  outline = { 0, 0, NULL, NULL, NULL, 0 };
+         FT_Vector*  unrounded = NULL;
+ 
+ 
+-        limit = (short)gloader->current.num_subglyphs;
++        limit = (FT_UShort)gloader->current.num_subglyphs;
+ 
+         /* construct an outline structure for              */
+         /* communication with `TT_Vary_Apply_Glyph_Deltas' */
diff --git a/meta/recipes-graphics/freetype/freetype_2.13.2.bb b/meta/recipes-graphics/freetype/freetype_2.13.2.bb
index 4e7a0ad160..ce7a615a3c 100644
--- a/meta/recipes-graphics/freetype/freetype_2.13.2.bb
+++ b/meta/recipes-graphics/freetype/freetype_2.13.2.bb
@@ -13,7 +13,9 @@ LIC_FILES_CHKSUM = "file://LICENSE.TXT;md5=843b6efc16f6b1652ec97f89d5a516c0 \
                     file://docs/GPLv2.TXT;md5=8ef380476f642c20ebf40fecb0add2ec \
                     "
 
-SRC_URI = "${SAVANNAH_NONGNU_MIRROR}/${BPN}/${BP}.tar.xz"
+SRC_URI = "${SAVANNAH_NONGNU_MIRROR}/${BPN}/${BP}.tar.xz \
+           file://CVE-2025-27363.patch \
+"
 SRC_URI[sha256sum] = "12991c4e55c506dd7f9b765933e62fd2be2e06d421505d7950a132e4f1bb484d"
 
 UPSTREAM_CHECK_REGEX = "freetype-(?P<pver>\d+(\.\d+)+)"

