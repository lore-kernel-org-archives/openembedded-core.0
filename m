Return-Path: <net147@gmail.com>
Received: from mail-pa0-f44.google.com (mail-pa0-f44.google.com
	[209.85.220.44])
	by mail.openembedded.org (Postfix) with ESMTP id E146D65D50
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Oct 2014 05:16:34 +0000 (UTC)
Received: by mail-pa0-f44.google.com with SMTP id et14so4452149pad.31
	for <openembedded-core@lists.openembedded.org>;
	Sun, 19 Oct 2014 22:16:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=BwoXLhKnyhFrrYVlq50kxlENqyqnhoo8j1UTP6RSsog=;
	b=U/nNlvE3EPjxv8vaU1DUGH5LQZQ42+1lTcfyiqE/JNfaIDJFpVH5q4GOk/B4fuNHD/
	JyLISC7gUR4Aw19zfSIvIwfQ8+/ts4M3UV75C4SAfx7WCdJf1Sc/1iWWqT331j6op8Tz
	v9hA8Fw4WDiA5N/bhQUikTm8or0H+5C0dAbGmdWnWF1G/WCTlXY6J4mwhbkfR/jSusa9
	RdWKbobHulaqnvCuS9XzV5aFncYqKMzThZZZlT5AaOb/FKhKA2h5XxEGTwYidI3xy6J5
	4hdDBKy5mGgSmiH3axn48+78XEZ+haQcJXi1kJztyWwJq9sn/Y/d5MsbJUnCXB608eS8
	CA1Q==
X-Received: by 10.70.46.71 with SMTP id t7mr25508778pdm.92.1413782194703;
	Sun, 19 Oct 2014 22:16:34 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by mx.google.com with ESMTPSA id zn2sm7928287pbb.41.2014.10.19.22.16.33
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 19 Oct 2014 22:16:33 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 20 Oct 2014 16:28:55 +1100
Message-Id: <1413782935-17764-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 2.1.2
Subject: [PATCH] liburcu: revert ARM GCC blacklist commit
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
X-List-Received-Date: Mon, 20 Oct 2014 05:16:35 -0000

This fixes the following error when building liburcu:
"Your gcc version produces clobbered frame accesses"

OE-Core is using a patched GCC 4.8.2 which is able to compile liburcu
properly.

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 ...evert-Blacklist-ARM-gcc-4.8.0-4.8.1-4.8.2.patch | 47 ++++++++++++++++++++++
 meta/recipes-support/liburcu/liburcu_0.8.4.bb      |  1 +
 2 files changed, 48 insertions(+)
 create mode 100644 meta/recipes-support/liburcu/liburcu/Revert-Blacklist-ARM-gcc-4.8.0-4.8.1-4.8.2.patch

diff --git a/meta/recipes-support/liburcu/liburcu/Revert-Blacklist-ARM-gcc-4.8.0-4.8.1-4.8.2.patch b/meta/recipes-support/liburcu/liburcu/Revert-Blacklist-ARM-gcc-4.8.0-4.8.1-4.8.2.patch
new file mode 100644
index 0000000..535a738
--- /dev/null
+++ b/meta/recipes-support/liburcu/liburcu/Revert-Blacklist-ARM-gcc-4.8.0-4.8.1-4.8.2.patch
@@ -0,0 +1,47 @@
+From 7b3df100346128d780f218b881d563d1fd12e310 Mon Sep 17 00:00:00 2001
+From: Jonathan Liu <net147@gmail.com>
+Date: Mon, 20 Oct 2014 13:46:10 +1100
+Subject: [PATCH] Revert "Blacklist ARM gcc 4.8.0, 4.8.1, 4.8.2"
+
+This reverts commit 4b79310aa3d408ba30fee02cc497a68072d38a99.
+OE-Core is using a patched GCC 4.8.2 which is able to compile liburcu
+properly.
+
+Upstream-Status: Inappropriate [OE specific]
+
+Signed-off-by: Jonathan Liu <net147@gmail.com>
+---
+ urcu/compiler.h | 19 -------------------
+ 1 file changed, 19 deletions(-)
+
+diff --git a/urcu/compiler.h b/urcu/compiler.h
+index 1e30903..19534f0 100644
+--- a/urcu/compiler.h
++++ b/urcu/compiler.h
+@@ -108,23 +108,4 @@
+ 
+ #define CAA_ARRAY_SIZE(x)	(sizeof(x) / sizeof((x)[0]))
+ 
+-/*
+- * Don't allow compiling with buggy compiler.
+- */
+-
+-#ifdef __GNUC__
+-# define URCU_GCC_VERSION	(__GNUC__ * 10000 \
+-				+ __GNUC_MINOR__ * 100 \
+-				+ __GNUC_PATCHLEVEL__)
+-
+-/*
+- * http://gcc.gnu.org/bugzilla/show_bug.cgi?id=58854
+- */
+-# ifdef __ARMEL__
+-#  if URCU_GCC_VERSION >= 40800 && URCU_GCC_VERSION <= 40802
+-#   error Your gcc version produces clobbered frame accesses
+-#  endif
+-# endif
+-#endif
+-
+ #endif /* _URCU_COMPILER_H */
+-- 
+2.1.2
+
diff --git a/meta/recipes-support/liburcu/liburcu_0.8.4.bb b/meta/recipes-support/liburcu/liburcu_0.8.4.bb
index cd7af24..963029e 100644
--- a/meta/recipes-support/liburcu/liburcu_0.8.4.bb
+++ b/meta/recipes-support/liburcu/liburcu_0.8.4.bb
@@ -8,6 +8,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=0f060c30a27922ce9c0d557a639b4fa3 \
                     file://urcu/uatomic/x86.h;beginline=4;endline=21;md5=220552f72c55b102f2ee35929734ef42"
 
 SRC_URI = "http://lttng.org/files/urcu/userspace-rcu-${PV}.tar.bz2 \
+           file://Revert-Blacklist-ARM-gcc-4.8.0-4.8.1-4.8.2.patch \
           "
 
 SRC_URI[md5sum] = "2ca6671b20a550aa0e8020a1a9a96fd4"
-- 
2.1.2


