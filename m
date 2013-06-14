Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id CA9886A59B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Jun 2013 08:37:59 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r5E8c171021745
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Jun 2013 01:38:01 -0700 (PDT)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.159) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.342.3; Fri, 14 Jun 2013 01:38:00 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 14 Jun 2013 16:37:58 +0800
Message-ID: <7d251cf9fa6bcd406bb56863936275331b8b9cde.1371198970.git.rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1371198970.git.rongqing.li@windriver.com>
References: <cover.1371198970.git.rongqing.li@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] cogl: make cogl be able to build on ARM arch
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
X-List-Received-Date: Fri, 14 Jun 2013 08:37:59 -0000
Content-Type: text/plain

From: "Roy.Li" <rongqing.li@windriver.com>

1. Fix asm() register constraints in cogl when building for ARM.
2. Fix cogl to handle Thumb builds.

Signed-off-by: Roy.Li <rongqing.li@windriver.com>
---
 meta/recipes-graphics/cogl/cogl-1.0.inc            |    4 +++
 .../cogl/files/cogl-fixed-thumb.patch              |   30 ++++++++++++++++++++
 .../cogl/files/cogl_fixed_mul-constraint.patch     |   22 ++++++++++++++
 3 files changed, 56 insertions(+)
 create mode 100644 meta/recipes-graphics/cogl/files/cogl-fixed-thumb.patch
 create mode 100644 meta/recipes-graphics/cogl/files/cogl_fixed_mul-constraint.patch

diff --git a/meta/recipes-graphics/cogl/cogl-1.0.inc b/meta/recipes-graphics/cogl/cogl-1.0.inc
index a44e6c4..c9c6165 100644
--- a/meta/recipes-graphics/cogl/cogl-1.0.inc
+++ b/meta/recipes-graphics/cogl/cogl-1.0.inc
@@ -2,6 +2,10 @@ DESCRIPTION = "a modern 3D graphics API with associated utility APIs"
 HOMEPAGE = "http://wiki.clutter-project.org/wiki/Cogl"
 LICENSE = "LGPLv2.1+"
 
+SRC_URI += "file://cogl_fixed_mul-constraint.patch \
+            file://cogl-fixed-thumb.patch \
+            "
+
 inherit clutter
 
 DEPENDS = "pango glib-2.0 gdk-pixbuf"
diff --git a/meta/recipes-graphics/cogl/files/cogl-fixed-thumb.patch b/meta/recipes-graphics/cogl/files/cogl-fixed-thumb.patch
new file mode 100644
index 0000000..77b0db2
--- /dev/null
+++ b/meta/recipes-graphics/cogl/files/cogl-fixed-thumb.patch
@@ -0,0 +1,30 @@
+Upstream-Status: Inappropriate [cogl-fixed.c disappears in cogl 2.0]
+
+There are two asm() statements in cogl-fixed.c that can't be assembled
+in Thumb mode.  Add a patch to switch to the generic code in Thumb mode.
+
+Signed-off-by: Donn Seeley <donn.seeley@windriver.com>
+---
+ cogl/cogl-fixed.c |    4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+--- a/cogl/cogl-fixed.c
++++ b/cogl/cogl-fixed.c
+@@ -626,7 +626,7 @@ cogl_fixed_sqrt (CoglFixed x)
+ 	/*
+ 	 * Find the highest bit set
+ 	 */
+-#if defined (__arm__) && !defined(__ARM_ARCH_4T__)
++#if defined (__arm__) && !defined(__ARM_ARCH_4T__) && !defined(__thumb__)
+ 	/* This actually requires at least arm v5, but gcc does not seem
+ 	 * to set the architecture defines correctly, and it is I think
+ 	 * very unlikely that anyone will want to use clutter on anything
+@@ -804,7 +804,7 @@ CoglFixed
+ cogl_fixed_mul (CoglFixed a,
+                 CoglFixed b)
+ {
+-#ifdef __arm__
++#if defined(__arm__) && !defined(__thumb__)
+   /* This provides about 12% speedeup on the gcc -O2 optimised
+    * C version
+    *
diff --git a/meta/recipes-graphics/cogl/files/cogl_fixed_mul-constraint.patch b/meta/recipes-graphics/cogl/files/cogl_fixed_mul-constraint.patch
new file mode 100644
index 0000000..7eb9da3
--- /dev/null
+++ b/meta/recipes-graphics/cogl/files/cogl_fixed_mul-constraint.patch
@@ -0,0 +1,22 @@
+Upstream-Status: Inappropriate [cogl-fixed.c disappears in cogl 2.0]
+
+Add register constraints to prevent asm statement complaints like:
+
+  {standard input}:382: rdhi, rdlo and rm must all be different
+
+Signed-off-by: Donn Seeley <donn.seeley@windriver.com>
+---
+ cogl/cogl-fixed.c |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+--- a/cogl/cogl-fixed.c
++++ b/cogl/cogl-fixed.c
+@@ -816,7 +816,7 @@ cogl_fixed_mul (CoglFixed a,
+   __asm__ ("smull %0, %1, %2, %3     \n"
+            "mov   %0, %0,     lsr %4 \n"
+            "add   %1, %0, %1, lsl %5 \n"
+-           : "=r"(res_hi), "=r"(res_low) \
++           : "=&r"(res_hi), "=&r"(res_low) \
+            : "r"(a), "r"(b), "i"(COGL_FIXED_Q), "i"(32 - COGL_FIXED_Q));
+ 
+   return (CoglFixed) res_low;
-- 
1.7.10.4


