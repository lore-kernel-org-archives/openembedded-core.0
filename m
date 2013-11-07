Return-Path: <ross.burton@intel.com>
Received: from mail-we0-f170.google.com (mail-we0-f170.google.com
	[74.125.82.170])
	by mail.openembedded.org (Postfix) with ESMTP id C09516D3D5
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Nov 2013 11:55:59 +0000 (UTC)
Received: by mail-we0-f170.google.com with SMTP id u57so408455wes.15
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Nov 2013 03:56:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=t6Ha9BJMqITieEprWRDVK2DndQVxUIgqVCOwCd0QTBw=;
	b=AWzULGRpxl/QRNd07h2ny+18o0/FEcEsbC6X3OhlszY85qDfpxTiR0CueVXsIq5wJr
	ttoU0rMeGXVyk+Z05rzCQaK2MpU7aHkxzbIoFyEhSlX8GdlEIYpyEURyFW3zbUuLQsRZ
	5Z84GvzKan0zP+n+yieHqT9yKx8SQOVhyMCYE+oBcXsWNEDxFWmfF0dwvKKke/0of6hX
	P5sV2220npMmEMvq+JISQ6iyi/5nvW0m0tmwlqLiRFqhtOpbLHzgKNbJb9nGKtAL5m5L
	PP1YKystL10xXlOdxq9CnYuaDLvvVX9vIGvxew9aUurUaqj3jVHtYSfY5K1AYVyQfS92
	0ZGw==
X-Gm-Message-State: ALoCoQleRfhHLjfxOhmT1IzzVHewgs2jNmLWbWIYISHfYr6DKnfNIUYuia27aGrMRD14wl/JRNi5
X-Received: by 10.180.98.2 with SMTP id ee2mr2360941wib.21.1383825360754;
	Thu, 07 Nov 2013 03:56:00 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id q3sm34492026wib.5.2013.11.07.03.55.59
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 07 Nov 2013 03:55:59 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  7 Nov 2013 11:55:31 +0000
Message-Id: <1383825335-2306-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH 1/5] cogl: upgrade to 1.16.0
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 07 Nov 2013 11:56:05 -0000

Drop two patches that were backported from upstream.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/cogl/cogl-1.0.inc            |    4 ---
 meta/recipes-graphics/cogl/cogl-1.0_1.14.0.bb      |    7 -----
 meta/recipes-graphics/cogl/cogl-1.0_1.16.0.bb      |    6 ++++
 .../cogl/files/cogl-fixed-thumb.patch              |   30 --------------------
 .../cogl/files/cogl_fixed_mul-constraint.patch     |   22 --------------
 5 files changed, 6 insertions(+), 63 deletions(-)
 delete mode 100644 meta/recipes-graphics/cogl/cogl-1.0_1.14.0.bb
 create mode 100644 meta/recipes-graphics/cogl/cogl-1.0_1.16.0.bb
 delete mode 100644 meta/recipes-graphics/cogl/files/cogl-fixed-thumb.patch
 delete mode 100644 meta/recipes-graphics/cogl/files/cogl_fixed_mul-constraint.patch

diff --git a/meta/recipes-graphics/cogl/cogl-1.0.inc b/meta/recipes-graphics/cogl/cogl-1.0.inc
index 0c4e86d..c1e124a 100644
--- a/meta/recipes-graphics/cogl/cogl-1.0.inc
+++ b/meta/recipes-graphics/cogl/cogl-1.0.inc
@@ -2,10 +2,6 @@ DESCRIPTION = "a modern 3D graphics API with associated utility APIs"
 HOMEPAGE = "http://wiki.clutter-project.org/wiki/Cogl"
 LICENSE = "LGPLv2.1+"
 
-SRC_URI += "file://cogl_fixed_mul-constraint.patch \
-            file://cogl-fixed-thumb.patch \
-            "
-
 inherit clutter
 
 DEPENDS = "glib-2.0 gdk-pixbuf"
diff --git a/meta/recipes-graphics/cogl/cogl-1.0_1.14.0.bb b/meta/recipes-graphics/cogl/cogl-1.0_1.14.0.bb
deleted file mode 100644
index 0f40c59..0000000
--- a/meta/recipes-graphics/cogl/cogl-1.0_1.14.0.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-
-require cogl-1.0.inc
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
-
-SRC_URI[archive.md5sum] = "7eabaf4241c0b87cc9e3b0fa23fd0315"
-SRC_URI[archive.sha256sum] = "276e8c9f5ff0fcd57c1eaf74cc245f41ad469a95a18ac831fac2d5960baa5ae8"
diff --git a/meta/recipes-graphics/cogl/cogl-1.0_1.16.0.bb b/meta/recipes-graphics/cogl/cogl-1.0_1.16.0.bb
new file mode 100644
index 0000000..5e5c82b
--- /dev/null
+++ b/meta/recipes-graphics/cogl/cogl-1.0_1.16.0.bb
@@ -0,0 +1,6 @@
+require cogl-1.0.inc
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
+
+SRC_URI[archive.md5sum] = "611a61bed04354cbfffa3dc27feb6d4f"
+SRC_URI[archive.sha256sum] = "75c2c4636a050fda7ee8722ce3d9c618b08799ed92bbb72b4fdff3e73b096094"
diff --git a/meta/recipes-graphics/cogl/files/cogl-fixed-thumb.patch b/meta/recipes-graphics/cogl/files/cogl-fixed-thumb.patch
deleted file mode 100644
index 1825e88..0000000
--- a/meta/recipes-graphics/cogl/files/cogl-fixed-thumb.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-Upstream-Status: Backport
-
-There are two asm() statements in cogl-fixed.c that can't be assembled
-in Thumb mode.  Add a patch to switch to the generic code in Thumb mode.
-
-Signed-off-by: Donn Seeley <donn.seeley@windriver.com>
----
- cogl/cogl-fixed.c |    4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
---- a/cogl/cogl-fixed.c
-+++ b/cogl/cogl-fixed.c
-@@ -626,7 +626,7 @@ cogl_fixed_sqrt (CoglFixed x)
- 	/*
- 	 * Find the highest bit set
- 	 */
--#if defined (__arm__) && !defined(__ARM_ARCH_4T__)
-+#if defined (__arm__) && !defined(__ARM_ARCH_4T__) && !defined(__thumb__)
- 	/* This actually requires at least arm v5, but gcc does not seem
- 	 * to set the architecture defines correctly, and it is I think
- 	 * very unlikely that anyone will want to use clutter on anything
-@@ -804,7 +804,7 @@ CoglFixed
- cogl_fixed_mul (CoglFixed a,
-                 CoglFixed b)
- {
--#ifdef __arm__
-+#if defined(__arm__) && !defined(__thumb__)
-   /* This provides about 12% speedeup on the gcc -O2 optimised
-    * C version
-    *
diff --git a/meta/recipes-graphics/cogl/files/cogl_fixed_mul-constraint.patch b/meta/recipes-graphics/cogl/files/cogl_fixed_mul-constraint.patch
deleted file mode 100644
index 179533a..0000000
--- a/meta/recipes-graphics/cogl/files/cogl_fixed_mul-constraint.patch
+++ /dev/null
@@ -1,22 +0,0 @@
-Upstream-Status: Backport
-
-Add register constraints to prevent asm statement complaints like:
-
-  {standard input}:382: rdhi, rdlo and rm must all be different
-
-Signed-off-by: Donn Seeley <donn.seeley@windriver.com>
----
- cogl/cogl-fixed.c |    2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
---- a/cogl/cogl-fixed.c
-+++ b/cogl/cogl-fixed.c
-@@ -816,7 +816,7 @@ cogl_fixed_mul (CoglFixed a,
-   __asm__ ("smull %0, %1, %2, %3     \n"
-            "mov   %0, %0,     lsr %4 \n"
-            "add   %1, %0, %1, lsl %5 \n"
--           : "=r"(res_hi), "=r"(res_low) \
-+           : "=&r"(res_hi), "=&r"(res_low) \
-            : "r"(a), "r"(b), "i"(COGL_FIXED_Q), "i"(32 - COGL_FIXED_Q));
- 
-   return (CoglFixed) res_low;
-- 
1.7.10.4


