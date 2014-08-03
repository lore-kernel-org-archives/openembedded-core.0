Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f47.google.com (mail-wg0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id 77D7965C70
	for <openembedded-core@lists.openembedded.org>;
	Sun,  3 Aug 2014 16:58:29 +0000 (UTC)
Received: by mail-wg0-f47.google.com with SMTP id b13so6569957wgh.30
	for <openembedded-core@lists.openembedded.org>;
	Sun, 03 Aug 2014 09:58:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=EGtDe6k7J5J/ODr1t3hOPh6lOOHX4ptJIyJ2ze720lc=;
	b=dQ6aE8umei7rRX9GozlhQosugox7wC9Dd5f2lIODzaVtTrg4313xryAHdekY8thVkj
	HP+QknkgGnYmizGKb/dtzMFb8Yu5jMMYFw0Y9Tc495TM0BHc/6x8S3NeutgzJUB6k1lq
	Une6U1NZczw7Il/aPfRF0FIo//HntgjBk34cLAZVIKWXWg5HyAwa9T6sw10xOnflXqwS
	jSqJGU+T7303fqwnl9xXYV53rDJWt5rhdKzb/vr72rN8MClEIeI3sri+55SARBwGRN1B
	pbX7rhDPlqkgWilxjCDUiANZ8srM3y6ueSuZuGoTtnCs38WRNW2VXV/lpngTeHGsJv6x
	+vNg==
X-Received: by 10.180.107.65 with SMTP id ha1mr22349465wib.59.1407085110404;
	Sun, 03 Aug 2014 09:58:30 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	19sm37061180wjz.3.2014.08.03.09.58.29 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 03 Aug 2014 09:58:29 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  3 Aug 2014 18:58:55 +0200
Message-Id: <1407085135-6491-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.0.2
Subject: [PATCH] cairo: explicitly disable LTO support by backporting patch which removes it
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
X-List-Received-Date: Sun, 03 Aug 2014 16:58:31 -0000

* cairo-native was failing to build in gentoo with gcc-4.9 and LTO
  enabled, more details in upstream bug
  https://bugs.freedesktop.org/show_bug.cgi?id=77060

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../cairo/cairo/0001-Remove-LTO-support.patch      | 60 ++++++++++++++++++++++
 meta/recipes-graphics/cairo/cairo_1.12.16.bb       |  4 +-
 2 files changed, 63 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-graphics/cairo/cairo/0001-Remove-LTO-support.patch

diff --git a/meta/recipes-graphics/cairo/cairo/0001-Remove-LTO-support.patch b/meta/recipes-graphics/cairo/cairo/0001-Remove-LTO-support.patch
new file mode 100644
index 0000000..87297b2
--- /dev/null
+++ b/meta/recipes-graphics/cairo/cairo/0001-Remove-LTO-support.patch
@@ -0,0 +1,60 @@
+From bdf15c249130568093676ed3b6c91f6f5e06f089 Mon Sep 17 00:00:00 2001
+From: Uli Schlachter <psychon@znc.in>
+Date: Mon, 21 Jul 2014 17:10:16 +0200
+Subject: [PATCH] Remove LTO support
+
+This just never worked too well and caused too many issues. I don't think anyone
+will miss this.
+
+As mentioned in the below bug report, proper LTO support also requires using
+special versions of ranlib, nm and ar which support the LTO object files.
+Otherwise, calling the normal ranlib on an .a library breaks the list of
+exported symbols and thus completely breaks the static library.
+
+This (partly) reverts the following commits:
+
+c3645d97ebd24c6f7ad850785d585aebc706a11c configure.ac: Add a --disable-lto configure option
+d486ea30f1a58640a1178de74f705a73845b1cda configure: Conditionally include -flto
+0870c6fb5b39dcc04fa376123848adde2d06d2ce gcc-4.5 warnings and optimisation flags.
+
+(The last commit is the one which brought us -flto in the first place even
+though it doesn't talk about this. It's also the one which is only reverted
+partly.)
+
+Fixes: https://bugs.freedesktop.org/show_bug.cgi?id=77060
+CC: Chris Wilson <chris@chris-wilson.co.uk>
+Signed-off-by: Uli Schlachter <psychon@znc.in>
+Reviewed-by: Bryce Harrington <b.harrington@samsung.com>
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+
+Upstream-Status: Backport (will be in 1.14*)
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+ build/configure.ac.warnings | 11 -----------
+ 1 file changed, 11 deletions(-)
+
+diff --git a/build/configure.ac.warnings b/build/configure.ac.warnings
+index f984eb2..2c4e34d 100644
+--- a/build/configure.ac.warnings
++++ b/build/configure.ac.warnings
+@@ -35,17 +35,6 @@ MAYBE_WARN="$MAYBE_WARN -erroff=E_ENUM_TYPE_MISMATCH_ARG \
+ 
+ dnl We also abuse the warning-flag facility to enable other compiler
+ dnl options.  Namely, the following:
+-
+-dnl -flto working really needs a test link, not just a compile
+-
+-safe_MAYBE_WARN="$MAYBE_WARN"
+-MAYBE_WARN="$MAYBE_WARN -flto"
+-AC_TRY_LINK([],[
+-	int main(int argc, char **argv) { return 0; }
+-],[],[
+-	MAYBE_WARN="$safe_MAYBE_WARN"
+-])
+-
+ MAYBE_WARN="$MAYBE_WARN -fno-strict-aliasing -fno-common"
+ 
+ dnl Also to turn various gcc/glibc-specific preprocessor checks
+-- 
+2.0.2
+
diff --git a/meta/recipes-graphics/cairo/cairo_1.12.16.bb b/meta/recipes-graphics/cairo/cairo_1.12.16.bb
index 246bd0b..42f7682 100644
--- a/meta/recipes-graphics/cairo/cairo_1.12.16.bb
+++ b/meta/recipes-graphics/cairo/cairo_1.12.16.bb
@@ -2,7 +2,9 @@ require cairo.inc
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=e73e999e0c72b5ac9012424fa157ad77"
 
-SRC_URI = "http://cairographics.org/releases/cairo-${PV}.tar.xz"
+SRC_URI = "http://cairographics.org/releases/cairo-${PV}.tar.xz \
+    file://0001-Remove-LTO-support.patch \
+"
 
 SRC_URI[md5sum] = "a1304edcdc99282f478b995ee5f8f854"
 SRC_URI[sha256sum] = "2505959eb3f1de3e1841023b61585bfd35684b9733c7b6a3643f4f4cbde6d846"
-- 
2.0.2


