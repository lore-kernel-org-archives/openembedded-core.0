Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web10.6681.1591088776036126446
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Jun 2020 02:06:17 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@axis.com header.s=axis-central1 header.b=aG7RPvL4;
 spf=pass (domain: axis.com, ip: 195.60.68.17, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; l=1429; q=dns/txt; s=axis-central1;
  t=1591088776; x=1622624776;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=XlmjjEswu0xaXfQZQj1aXAwfQ+5RJTGwax4VjjnMFdY=;
  b=aG7RPvL4xaAhHLguQD7GXvYTkNc3DwwrzxL+gateETwJQ89hOBeR/12k
   YaRUOR85d2re2V2D8JUvojZFm8S6bwIK4Nqp+mO+hlZ/zpd3YkrwJkz3p
   8liMyX4Ry4reHDCjvCkbnR94FUDCEtkjVkgbPj1kQvha44jU75wJSSfgG
   Gm36RgxNqr/eBcyjFSil6JchLOwTn2eOzMUnWWB+1iC02WAJv/a3KBrDy
   9TODDsv0YgPskZHEWC5caqrYFy85WEXvlwjr8dzTatgdio35Tmr+ImlMU
   4Tfz6SdY2R0DP/TpxJXXULp01ErjHI38Dx2tyhKsjdYIgfDWhsyklckOt
   w==;
IronPort-SDR: cv5Bjid46DZLUoVYtMUrYNhtX+jn+vsaBNfL2pHrV8oQiGUNA+buO5iqYpA0VyAFNYrft+LSW2
 1QCuw9waPIioFRe0243pkFka4D42SyWN5/yEL1vIjCUIMqZ+NEv1UU9xW8le3/CbFPemf8zHaU
 ROOqVqKMVUDKUhJX+HmZjmwR9EasCP0tpxhXHh6RE5siZfoL5jz6y0J4lBb+kxYLFv2bcT56l1
 FS7P/9zBZCQUCfyEhX6IQSYf4pGb65d4rHk7m5pIYHwq8X1zunpo6t5vodREHnZzzQ3EUvtrms
 7AA=
X-IronPort-AV: E=Sophos;i="5.73,463,1583190000"; 
   d="scan'208";a="9387489"
From: "Peter Kjellerstedt" <peter.kjellerstedt@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] cairo: Do not try to remove nonexistent directories
Date: Tue, 2 Jun 2020 11:06:05 +0200
Message-ID: <20200602090605.8897-1-pkj@axis.com>
X-Mailer: git-send-email 2.21.3
MIME-Version: 1.0
Return-Path: pkj@axis.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Commit 0e1f8fa0 (bitbake.conf: propagate 'opengl' DISTRO_FEATURE to
native/nativesdk from target) changed the default PACKAGECONFIG for
native and nativesdk so that it becomes empty unless "x11" is in
DISTRO_FEATURES since "trace" was also removed (propbably
unintentionally). This highlighted than an empty PACKAGECONFIG would
lead to a build failure since /usr/bin is never created under these
conditions, but the recipe still tried to remove it.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/recipes-graphics/cairo/cairo_1.16.0.bb | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/cairo/cairo_1.16.0.bb b/meta/recipes-graphics/cairo/cairo_1.16.0.bb
index 092c77b826..195a66b37d 100644
--- a/meta/recipes-graphics/cairo/cairo_1.16.0.bb
+++ b/meta/recipes-graphics/cairo/cairo_1.16.0.bb
@@ -70,8 +70,10 @@ do_install_append () {
 	rm -rf ${D}${libdir}/cairo/cairo-sphinx*
 	rm -rf ${D}${libdir}/cairo/.debug/cairo-fdr*
 	rm -rf ${D}${libdir}/cairo/.debug/cairo-sphinx*
-	rmdir -p --ignore-fail-on-non-empty ${D}${bindir}
-	rmdir -p --ignore-fail-on-non-empty ${D}${libdir}/cairo
+	[ ! -d ${D}${bindir} ] ||
+		rmdir -p --ignore-fail-on-non-empty ${D}${bindir}
+	[ ! -d ${D}${libdir}/cairo ] ||
+		rmdir -p --ignore-fail-on-non-empty ${D}${libdir}/cairo
 }
 
 PACKAGES =+ "cairo-gobject cairo-script-interpreter cairo-perf-utils"
