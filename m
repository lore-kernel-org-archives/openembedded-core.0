Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB777CAC5B3
	for <webhook@archiver.kernel.org>; Thu, 25 Sep 2025 14:06:40 +0000 (UTC)
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.web10.12465.1758809199263658187
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Sep 2025 07:06:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=lg9TCG7J;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-256628-20250925140637b6b15fe1e000020773-wwxkvf@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 20250925140637b6b15fe1e000020773
        for <openembedded-core@lists.openembedded.org>;
        Thu, 25 Sep 2025 16:06:37 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=n8odxis6VYUBgyo5bpl6LFBtANbylI7Z6DGbjeEhrMQ=;
 b=lg9TCG7JD5IxXJVKUXD46FPUCR3PKpsiP2KicrSMYc9H/lRdxeAfz9z26i5QDhD8cfFaOC
 SyHzpOoHvJuJW0Hdlafpy6MQQUsQi5bK3opa9MnlxccoE2netX5eAaYkIvztPcSYelupmaIX
 U/SJATUfy7ygd8dCqgaT7dP9BwyT2kLrE0EVjvNj8x5b9UhAwVT8RuITIQ40Q7g5szpC3wyP
 vF91FzmPj4MKApvXuZa13rPopj/H0cdAkhUkz6QC0dvwQt6R8hU7w4sGE2qm/nPX0RugMM7K
 jckseZhYlk2vl9NbqGmVcB1vlOEykf14U7L9jGVCWux4bKx7VPKELZQA==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][walnascar][PATCH 09/10] tiff: patch CVE-2025-9165
Date: Thu, 25 Sep 2025 16:05:13 +0200
Message-Id: <20250925140514.1103300-9-peter.marko@siemens.com>
In-Reply-To: <20250925140514.1103300-1-peter.marko@siemens.com>
References: <20250925140514.1103300-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 25 Sep 2025 14:06:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224038

From: Peter Marko <peter.marko@siemens.com>

Pick commit mentioned in NVD report.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../libtiff/tiff/CVE-2025-9165.patch          | 29 +++++++++++++++++++
 meta/recipes-multimedia/libtiff/tiff_4.7.0.bb |  1 +
 2 files changed, 30 insertions(+)
 create mode 100644 meta/recipes-multimedia/libtiff/tiff/CVE-2025-9165.patch

diff --git a/meta/recipes-multimedia/libtiff/tiff/CVE-2025-9165.patch b/meta/recipes-multimedia/libtiff/tiff/CVE-2025-9165.patch
new file mode 100644
index 00000000000..560229284c9
--- /dev/null
+++ b/meta/recipes-multimedia/libtiff/tiff/CVE-2025-9165.patch
@@ -0,0 +1,29 @@
+From ed141286a37f6e5ddafb5069347ff5d587e7a4e0 Mon Sep 17 00:00:00 2001
+From: Su_Laus <sulau@freenet.de>
+Date: Fri, 8 Aug 2025 21:35:30 +0200
+Subject: [PATCH] tiffcmp: fix memory leak when second file cannot be opened.
+
+Closes #728, #729
+
+CVE: CVE-2025-9165
+Upstream-Status: Backport [https://gitlab.com/libtiff/libtiff/-/commit/ed141286a37f6e5ddafb5069347ff5d587e7a4e0]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ tools/tiffcmp.c | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/tools/tiffcmp.c b/tools/tiffcmp.c
+index 529c1cdc..88d9470f 100644
+--- a/tools/tiffcmp.c
++++ b/tools/tiffcmp.c
+@@ -105,7 +105,10 @@ int main(int argc, char *argv[])
+         return (2);
+     tif2 = TIFFOpen(argv[optind + 1], "r");
+     if (tif2 == NULL)
++    {
++        TIFFClose(tif1);
+         return (2);
++    }
+     dirnum = 0;
+     while (tiffcmp(tif1, tif2))
+     {
diff --git a/meta/recipes-multimedia/libtiff/tiff_4.7.0.bb b/meta/recipes-multimedia/libtiff/tiff_4.7.0.bb
index fd383e3d6a3..405edabe6f4 100644
--- a/meta/recipes-multimedia/libtiff/tiff_4.7.0.bb
+++ b/meta/recipes-multimedia/libtiff/tiff_4.7.0.bb
@@ -17,6 +17,7 @@ SRC_URI = "http://download.osgeo.org/libtiff/tiff-${PV}.tar.gz \
 	   file://CVE-2025-8177_1.patch \
 	   file://CVE-2025-8177_2.patch \
            file://CVE-2025-8534.patch \
+           file://CVE-2025-9165.patch \
 	   "
 
 SRC_URI[sha256sum] = "67160e3457365ab96c5b3286a0903aa6e78bdc44c4bc737d2e486bcecb6ba976"

