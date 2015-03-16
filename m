Return-Path: <net147@gmail.com>
Received: from mail-pa0-f51.google.com (mail-pa0-f51.google.com
	[209.85.220.51])
	by mail.openembedded.org (Postfix) with ESMTP id 9E9556013D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Mar 2015 11:31:28 +0000 (UTC)
Received: by pabyw6 with SMTP id yw6so62518668pab.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Mar 2015 04:31:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=tG8ssLryk46GOmvTkRYxQx6NZ91+xx3hhPNFhAPKyFs=;
	b=l1VrH+2BXIdwHWHwwS1bDETW2aRep6dUmrL6DL7jVJHKje5fcj18S3wLK7D/JJ23c2
	xeuAQiP6Ckd5pTVXUdSBW5sGxwc75r+LUmh4tFvaUgXCwKC0wYTsBovURiLz3wGwmyAU
	4lKm2PtyLjtfePwe/mYCyGbGg96QRdD0ipkn2WONoQB0tvYr8lrHFItZRVeXKQK79MoT
	9gVNQJmywKIu9BEBPUbaY+bkANCEJBQIGjCa7RyRC07NbbCdakYRtfmmZO2xgb8TwxBZ
	4p0rorbU/1INJrUawP1c2nvELMQpoUz0D//HX3CTC+DIld/+5Ltl7HmV5Znu3NDInMyV
	RYeA==
X-Received: by 10.70.14.226 with SMTP id s2mr134843619pdc.145.1426505489546;
	Mon, 16 Mar 2015 04:31:29 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by mx.google.com with ESMTPSA id y2sm16890361pdm.31.2015.03.16.04.31.28
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 16 Mar 2015 04:31:28 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 16 Mar 2015 22:29:48 +1100
Message-Id: <1426505388-32713-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 2.3.1
Subject: [dizzy][PATCH] liburcu: revert ARM GCC blacklist commit
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
X-List-Received-Date: Mon, 16 Mar 2015 11:31:33 -0000

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
2.3.1


