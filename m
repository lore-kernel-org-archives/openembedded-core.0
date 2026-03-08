Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EA57EA8549
	for <webhook@archiver.kernel.org>; Sun,  8 Mar 2026 22:42:58 +0000 (UTC)
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1598.1773009770395843910
 for <openembedded-core@lists.openembedded.org>;
 Sun, 08 Mar 2026 15:42:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=VPPhMQCf;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-256628-20260308224247a63b0621dd0002071e-4moe76@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 20260308224247a63b0621dd0002071e
        for <openembedded-core@lists.openembedded.org>;
        Sun, 08 Mar 2026 23:42:47 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=/bC2JrwXrc+tJtgfoxWUwaZbwJDeylcxBk3kONminLY=;
 b=VPPhMQCfB0/fn9ljQ5BQfTlX9z7b83YbbXSBimHWRMCfroEU1pMCzddIwfSoqButt34bsF
 VFpVpiAttwf+LWLY8iAUBYVD/7/HjI/NZ6E5nJ5yd2e+kvLqdQjhfDzIcvk8e4Qag18fThO/
 1CedPbPpqbiXrUnanDRR2V6QkEi6Vr9QxfXlwjfwLYRYfnzr0oS0zaJ65YM3PJFmlXxL4Qct
 DAJ/5BfmdMEBfBd1x/uWSVogxAh3ctnApYeWISg2D9fj/Un7bZTMfuTuYOFe8YacoL1nWGR/
 XPEi85KJBcBXc2ywP6da7c1akNBCJjW/QEkUy1MaAJ9+A/EYx0pnG5ag==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][kirkstone][PATCH 1/3] tiff: patch CVE-2025-61143
Date: Sun,  8 Mar 2026 23:42:38 +0100
Message-Id: <20260308224240.60802-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 08 Mar 2026 22:42:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232669

From: Peter Marko <peter.marko@siemens.com>

Pick patch from merge request mentioned in NVD report.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../libtiff/tiff/CVE-2025-61143.patch         | 44 +++++++++++++++++++
 meta/recipes-multimedia/libtiff/tiff_4.3.0.bb |  1 +
 2 files changed, 45 insertions(+)
 create mode 100644 meta/recipes-multimedia/libtiff/tiff/CVE-2025-61143.patch

diff --git a/meta/recipes-multimedia/libtiff/tiff/CVE-2025-61143.patch b/meta/recipes-multimedia/libtiff/tiff/CVE-2025-61143.patch
new file mode 100644
index 00000000000..ed0438fec97
--- /dev/null
+++ b/meta/recipes-multimedia/libtiff/tiff/CVE-2025-61143.patch
@@ -0,0 +1,44 @@
+From 4d28af5fe61b1760f10981f5072ff1e6fd44f210 Mon Sep 17 00:00:00 2001
+From: Lee Howard <faxguy@howardsilvan.com>
+Date: Fri, 5 Sep 2025 21:44:49 +0000
+Subject: [PATCH] tiffcrop: avoid nullptr dereference
+
+Fixes #734
+
+CVE: CVE-2025-61143
+Upstream-Status: Backport [https://gitlab.com/libtiff/libtiff/-/commit/4d28af5fe61b1760f10981f5072ff1e6fd44f210]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ tools/tiffcrop.c   | 2 +-
+ tools/tiffdither.c | 5 +++++
+ 2 files changed, 6 insertions(+), 1 deletion(-)
+
+diff --git a/tools/tiffcrop.c b/tools/tiffcrop.c
+index ae414efc..1cbb49b6 100644
+--- a/tools/tiffcrop.c
++++ b/tools/tiffcrop.c
+@@ -2561,7 +2561,7 @@ main(int argc, char* argv[])
+ 
+     if (dump.outfile != NULL)
+       {
+-      dump_info (dump.outfile, dump.format, "", "Completed run for %s", TIFFFileName(out));
++      dump_info (dump.outfile, dump.format, "", "Completed run for %s", out ? TIFFFileName(out) : "(not opened)");
+       fclose (dump.outfile);
+       }
+     }
+diff --git a/tools/tiffdither.c b/tools/tiffdither.c
+index 3c64fdc0..405527c7 100644
+--- a/tools/tiffdither.c
++++ b/tools/tiffdither.c
+@@ -84,6 +84,11 @@ fsdither(TIFF* in, TIFF* out)
+ 	    fprintf(stderr, "Out of memory.\n");
+ 	    goto skip_on_error;
+ 	}
++	if (imagewidth > TIFFScanlineSize(in))
++	{
++	    fprintf(stderr, "Image width exceeds scanline size.\n");
++	    goto skip_on_error;
++	}
+ 
+ 	/*
+ 	 * Get first line
diff --git a/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb b/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb
index 84c3028b458..4c2b0a800b4 100644
--- a/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb
+++ b/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb
@@ -65,6 +65,7 @@ SRC_URI = "http://download.osgeo.org/libtiff/tiff-${PV}.tar.gz \
            file://CVE-2025-9900.patch \
            file://CVE-2025-8961.patch \
            file://CVE-2025-9165.patch \
+           file://CVE-2025-61143.patch \
            "
 
 SRC_URI[sha256sum] = "0e46e5acb087ce7d1ac53cf4f56a09b221537fc86dfc5daaad1c2e89e1b37ac8"

