Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f173.google.com (mail-ig0-f173.google.com
	[209.85.213.173])
	by mail.openembedded.org (Postfix) with ESMTP id D834473D7B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Apr 2015 07:50:04 +0000 (UTC)
Received: by igblo3 with SMTP id lo3so35183213igb.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Apr 2015 00:50:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=ssNpCrUQntdtALIMaovP+dgiFeuSY9AQ0nX9u5Laxlc=;
	b=HAAesJImASEugxO7SIhiAgeM1wA1XrwwQLEhlG12fUW2loiPSK4C2uaUe9cFRYpN9D
	sxVHUYNF2x8Ocp7p7FGHrGwwc5p7pFZmFJ0sK2RXdGdYWYYOpkedFKjOEH09GBjn9hQW
	0NkK5gzFBZJ7bvcNeI6B1EC99uZ5abOiMxeHSC1V1cnAiht0bu6MReJGkNjC0mlEWIaI
	tAcb3clIwkeC0lV8OpBB6rMWdL1x/UoC0RQ7pKgNfEmHTFelaNvtR1VfI3g0xDEjUDlX
	KC8S5tiTMOJKspwUvLJ/dfgK6ODF/W+wIwRmvIX+AB8Shnt2X+D2VtspihmYFPNHgsbB
	2K7g==
X-Received: by 10.107.6.220 with SMTP id f89mr34245240ioi.78.1429689005626;
	Wed, 22 Apr 2015 00:50:05 -0700 (PDT)
Received: from dvm-ch2e-038.sys.comcast.net (a-96-119-89-79.sys.comcast.net.
	[96.119.89.79])
	by mx.google.com with ESMTPSA id l1sm2686434ioe.32.2015.04.22.00.50.05
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 22 Apr 2015 00:50:05 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Apr 2015 07:49:51 +0000
Message-Id: <a22f5bb19cd09db3092e5694b66cbb188c23f21f.1429688786.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <42999018b09a752082a381b1c595f0bd7411e305.1429688786.git.raj.khem@gmail.com>
References: <42999018b09a752082a381b1c595f0bd7411e305.1429688786.git.raj.khem@gmail.com>
In-Reply-To: <cover.1429688786.git.raj.khem@gmail.com>
References: <cover.1429688786.git.raj.khem@gmail.com>
Subject: [PATCH 02/10] glibc, packagegroup-self-hosted, packagegroup-core-lsb: Consider non-glibc libcs
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
X-List-Received-Date: Wed, 22 Apr 2015 07:50:06 -0000

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


