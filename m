Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f41.google.com (mail-pa0-f41.google.com
	[209.85.220.41])
	by mail.openembedded.org (Postfix) with ESMTP id 6ECD073D37
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Apr 2015 03:35:37 +0000 (UTC)
Received: by pacwv17 with SMTP id wv17so14155276pac.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Apr 2015 20:35:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=ssNpCrUQntdtALIMaovP+dgiFeuSY9AQ0nX9u5Laxlc=;
	b=NheeWt/gdalcxwQwHTNmbJxImaF/yxtm6lZuAIkkCOF68lEpWeMo60rwwBRV6v1z6i
	Ai4nobIm1rsrEWVrnHLwE8WJ2Tst+Zm2EXAVOJGJEV/7sbOkS0kJiPBkOnSN/WvG2k1M
	92W3h/Co7P3Zzk1ZjTwUIrqzqwscTg5rbpyZcszcEe33XOw6E9cq8CqOX0NeAeU87ph8
	K29PQHrh0OuPKjb0bklof07Bg3KuEgzF972aAnXOdYYdhH+SirS565IR4bEDaC5TJD5K
	2rT44N2tCvXG5YS/S/j2kAM2dlgdanmlmi8nGLfyCm2qZh/69f3BdoCJhC6Zqsr/tGE2
	RnhA==
X-Received: by 10.68.218.9 with SMTP id pc9mr4444595pbc.2.1429846539117;
	Thu, 23 Apr 2015 20:35:39 -0700 (PDT)
Received: from iMac.hsd1.ca.comcast.net (c-24-130-225-169.hsd1.ca.comcast.net.
	[24.130.225.169])
	by mx.google.com with ESMTPSA id qv9sm9575507pab.27.2015.04.23.20.35.38
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 23 Apr 2015 20:35:38 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 Apr 2015 20:35:19 -0700
Message-Id: <aced357a8b994ceff87490e2e9faa526143bf4c4.1429846255.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1429846255.git.raj.khem@gmail.com>
References: <cover.1429846255.git.raj.khem@gmail.com>
Subject: [PATCH 01/14] glibc, packagegroup-self-hosted, packagegroup-core-lsb: Consider non-glibc libcs
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
X-List-Received-Date: Fri, 24 Apr 2015 03:35:39 -0000

Make skipping expression simpler to check for given libc
Make sure glibc specific items are covered with right override

Change-Id: I8b4a0b7cbfe38ffdc9320f798038c79c7220552b
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/glibc/glibc_2.21.bb                        | 8 +++-----
 meta/recipes-core/packagegroups/packagegroup-self-hosted.bb  | 7 ++++---
 meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb | 9 +++++++++
 3 files changed, 16 insertions(+), 8 deletions(-)

diff --git a/meta/recipes-core/glibc/glibc_2.21.bb b/meta/recipes-core/glibc/glibc_2.21.bb
index fcef4ff..58a9601 100644
--- a/meta/recipes-core/glibc/glibc_2.21.bb
+++ b/meta/recipes-core/glibc/glibc_2.21.bb
@@ -68,11 +68,9 @@ GLIBC_BROKEN_LOCALES = " _ER _ET so_ET yn_ER sid_ET tr_TR mn_MN gez_ET gez_ER bn
 # this helps in easing out parsing for non-glibc system libraries
 #
 python __anonymous () {
-    import re
-    notglibc = (re.match('.*uclibc$', d.getVar('TARGET_OS', True)) != None) or (re.match('.*musl$', d.getVar('TARGET_OS', True)) != None)
-    if notglibc:
-        raise bb.parse.SkipPackage("incompatible with target %s" %
-                                   d.getVar('TARGET_OS', True))
+    if d.getVar('TCLIBC', True) != "glibc":
+        raise bb.parse.SkipPackage("incompatible with %s C library" %
+                                   d.getVar('TCLIBC', True))
 }
 
 EXTRA_OECONF = "--enable-kernel=${OLDEST_KERNEL} \
diff --git a/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb b/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
index 47589b6..531f729 100644
--- a/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
@@ -62,7 +62,6 @@ RRECOMMENDS_packagegroup-self-hosted-host-tools = "\
     kernel-module-iptable-filter \
 	"
 
-# glibc-utils: for rpcgen
 RDEPENDS_packagegroup-self-hosted-sdk = "\
     autoconf \
     automake \
@@ -73,7 +72,6 @@ RDEPENDS_packagegroup-self-hosted-sdk = "\
     cpp \
     cpp-symlinks \
     distcc \
-    glibc-utils \
     glibc-gconv-ibm850 \
     file \
     findutils \
@@ -98,7 +96,10 @@ RDEPENDS_packagegroup-self-hosted-sdk = "\
     quilt \
     sed \
     "
-
+# glibc-utils: for rpcgen
+RDEPENDS_packagegroup-self-hosted-sdk_append_libc-glibc = "\
+    glibc-utils \
+    "
 RDEPENDS_packagegroup-self-hosted-debug = " \
     gdb \
     gdbserver \
diff --git a/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb b/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb
index e0f32e0..a07a6ad 100644
--- a/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb
+++ b/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb
@@ -9,6 +9,15 @@ LICENSE = "MIT"
 
 inherit packagegroup
 
+#
+# We will skip parsing this packagegeoup for non-glibc systems
+#
+python __anonymous () {
+    if d.getVar('TCLIBC', True) != "glibc":
+        raise bb.parse.SkipPackage("incompatible with %s C library" %
+                                   d.getVar('TCLIBC', True))
+}
+
 PACKAGES = "\
     packagegroup-core-lsb \
     packagegroup-core-sys-extended \
-- 
2.1.4


