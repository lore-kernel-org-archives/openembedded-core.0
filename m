Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DED8DD111A8
	for <webhook@archiver.kernel.org>; Thu, 27 Nov 2025 18:03:43 +0000 (UTC)
Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.698.1764266613545471136
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Nov 2025 10:03:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=clVOXSG5;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.225, mailfrom: fm-256628-20251127180331d5f1d040eb000207f9-rh8kct@rts-flowmailer.siemens.com)
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 20251127180331d5f1d040eb000207f9
        for <openembedded-core@lists.openembedded.org>;
        Thu, 27 Nov 2025 19:03:31 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=EwJFwru6SuuA/pKLiCWMYBPk4fbj1MeVRdIq6IXoshU=;
 b=clVOXSG5ZmDEikMuYAT+OBJYANMPL5wPnwHaLda/A8N1JGT8h4qZDxXxZxW+m0efGFWOZ6
 pIKCLDvY39EWi4J+JLBsjWgLR52lUfy1bitj9pePIrolKXW8ycwbFNYRNRg8NTEP+8D64KVp
 CsAWbReqgf3i5HmHzQZSv/lJ3B439ycaLKiu5qeKAtAqUJc6DolrVZzMYXE1K++BQjeCihFu
 zijSdoeiW67lWQ/FeB9b12gTmQDLs84t4qBlUg1JrxSrDhhABhk+ayA1fOHe4WjrdQlfi7mD
 iZn6Pek7exSzDFRlYnRlWA+sbl/nw3cb2lIPuxmGf18VfZ1Mx5lKv/Aw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][scarthgap][PATCH 2/4] libpng: patch CVE-2025-64506
Date: Thu, 27 Nov 2025 19:03:23 +0100
Message-Id: <20251127180325.3347669-2-peter.marko@siemens.com>
In-Reply-To: <20251127180325.3347669-1-peter.marko@siemens.com>
References: <20251127180325.3347669-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Nov 2025 18:03:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226857

From: Peter Marko <peter.marko@siemens.com>

Pick commit per NVD report.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../libpng/files/CVE-2025-64506.patch         | 57 +++++++++++++++++++
 .../libpng/libpng_1.6.42.bb                   |  1 +
 2 files changed, 58 insertions(+)
 create mode 100644 meta/recipes-multimedia/libpng/files/CVE-2025-64506.patch

diff --git a/meta/recipes-multimedia/libpng/files/CVE-2025-64506.patch b/meta/recipes-multimedia/libpng/files/CVE-2025-64506.patch
new file mode 100644
index 00000000000..dc7fe006019
--- /dev/null
+++ b/meta/recipes-multimedia/libpng/files/CVE-2025-64506.patch
@@ -0,0 +1,57 @@
+From 2bd84c019c300b78e811743fbcddb67c9d9bf821 Mon Sep 17 00:00:00 2001
+From: Cosmin Truta <ctruta@gmail.com>
+Date: Fri, 7 Nov 2025 22:40:05 +0200
+Subject: [PATCH] Fix a heap buffer overflow in `png_write_image_8bit`
+
+The condition guarding the pre-transform path incorrectly allowed 8-bit
+input data to enter `png_write_image_8bit` which expects 16-bit input.
+This caused out-of-bounds reads when processing 8-bit grayscale+alpha
+images (GitHub #688), or 8-bit RGB or RGB+alpha images (GitHub #746),
+with the `convert_to_8bit` flag set (an invalid combination that should
+bypass the pre-transform path).
+
+The second part of the condition, i.e.
+
+    colormap == 0 && convert_to_8bit != 0
+
+failed to verify that input was 16-bit, i.e.
+
+    linear != 0
+
+contradicting the comment "This only applies when the input is 16-bit".
+
+The fix consists in restructuring the condition to ensure both the
+`alpha` path and the `convert_to_8bit` path require linear (16-bit)
+input. The corrected condition, i.e.
+
+    linear != 0 && (alpha != 0 || display->convert_to_8bit != 0)
+
+matches the expectation of the `png_write_image_8bit` function and
+prevents treating 8-bit buffers as 16-bit data.
+
+Reported-by: Samsung-PENTEST <Samsung-PENTEST@users.noreply.github.com>
+Reported-by: weijinjinnihao <weijinjinnihao@users.noreply.github.com>
+Analyzed-by: degrigis <degrigis@users.noreply.github.com>
+Reviewed-by: John Bowler <jbowler@acm.org>
+
+CVE: CVE-2025-64506
+Upstream-Status: Backport [https://github.com/pnggroup/libpng/commit/2bd84c019c300b78e811743fbcddb67c9d9bf821]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ pngwrite.c | 3 +--
+ 1 file changed, 1 insertion(+), 2 deletions(-)
+
+diff --git a/pngwrite.c b/pngwrite.c
+index 35a5d17b6..83148960e 100644
+--- a/pngwrite.c
++++ b/pngwrite.c
+@@ -2142,8 +2142,7 @@ png_image_write_main(png_voidp argument)
+     * before it is written.  This only applies when the input is 16-bit and
+     * either there is an alpha channel or it is converted to 8-bit.
+     */
+-   if ((linear != 0 && alpha != 0 ) ||
+-       (colormap == 0 && display->convert_to_8bit != 0))
++   if (linear != 0 && (alpha != 0 || display->convert_to_8bit != 0))
+    {
+       png_bytep row = png_voidcast(png_bytep, png_malloc(png_ptr,
+           png_get_rowbytes(png_ptr, info_ptr)));
diff --git a/meta/recipes-multimedia/libpng/libpng_1.6.42.bb b/meta/recipes-multimedia/libpng/libpng_1.6.42.bb
index dec78e568c4..ab043e33384 100644
--- a/meta/recipes-multimedia/libpng/libpng_1.6.42.bb
+++ b/meta/recipes-multimedia/libpng/libpng_1.6.42.bb
@@ -15,6 +15,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}${LIBV}/${PV}/${BP}.tar.xz
            file://CVE-2025-64505-01.patch \
            file://CVE-2025-64505-02.patch \
            file://CVE-2025-64505-03.patch \
+           file://CVE-2025-64506.patch \
 "
 
 SRC_URI[sha256sum] = "c919dbc11f4c03b05aba3f8884d8eb7adfe3572ad228af972bb60057bdb48450"

