Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7FB9B78438
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Dec 2017 10:59:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 08770182E3
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Dec 2017 11:59:24 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id 1bqMcBBZGIJu
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Dec 2017 11:59:23 +0100 (CET)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bastet.se.axis.com (Postfix) with ESMTPS id 1EBF018292
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Dec 2017 11:59:23 +0100 (CET)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DFF661E080
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Dec 2017 11:59:22 +0100 (CET)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D4D9B1E066
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Dec 2017 11:59:22 +0100 (CET)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder03.se.axis.com (Postfix) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Dec 2017 11:59:22 +0100 (CET)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by seth.se.axis.com (Postfix) with ESMTP id C91AD2706
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Dec 2017 11:59:22 +0100 (CET)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id vB4AxIZT013026
	for <openembedded-core@lists.openembedded.org>;
	Mon, 4 Dec 2017 11:59:18 +0100
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id vB4AxI1L013025
	for openembedded-core@lists.openembedded.org;
	Mon, 4 Dec 2017 11:59:18 +0100
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  4 Dec 2017 11:59:17 +0100
Message-Id: <20171204105917.12985-1-pkj@axis.com>
X-Mailer: git-send-email 2.12.0
X-TM-AS-GCONF: 00
Subject: [PATCHv2] libbsd: Make it build with GCC 5.0 and older
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
X-List-Received-Date: Mon, 04 Dec 2017 10:59:23 -0000

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---

This hit us when building master and Rocko with GCC 4.7.2...

PATCHv2: Added a Signed-off-by to the patch.

 ...r-older-GCCs-not-supporting-__has_include.patch | 31 ++++++++++++++++++++++
 meta/recipes-support/libbsd/libbsd_0.8.6.bb        |  1 +
 2 files changed, 32 insertions(+)
 create mode 100644 meta/recipes-support/libbsd/libbsd/0001-Fix-for-older-GCCs-not-supporting-__has_include.patch

diff --git a/meta/recipes-support/libbsd/libbsd/0001-Fix-for-older-GCCs-not-supporting-__has_include.patch b/meta/recipes-support/libbsd/libbsd/0001-Fix-for-older-GCCs-not-supporting-__has_include.patch
new file mode 100644
index 0000000000..d13732bdaf
--- /dev/null
+++ b/meta/recipes-support/libbsd/libbsd/0001-Fix-for-older-GCCs-not-supporting-__has_include.patch
@@ -0,0 +1,31 @@
+From 2fbf47ce9b64f4e07be223bc2870348a68f19d86 Mon Sep 17 00:00:00 2001
+From: Adam Lackorzynski <adam@l4re.org>
+Date: Sat, 21 Oct 2017 23:08:31 +0200
+Subject: [PATCH] Fix for older GCCs not supporting __has_include*
+
+Upstream-Status: Submitted [https://bugs.freedesktop.org/show_bug.cgi?id=103396]
+Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
+---
+ include/bsd/sys/cdefs.h | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/include/bsd/sys/cdefs.h b/include/bsd/sys/cdefs.h
+index 044f221..b4c8f30 100644
+--- a/include/bsd/sys/cdefs.h
++++ b/include/bsd/sys/cdefs.h
+@@ -25,10 +25,10 @@
+  */
+ 
+ #ifndef __has_include
+-#define __has_include 1
++#define __has_include(x) 1
+ #endif
+ #ifndef __has_include_next
+-#define __has_include_next 1
++#define __has_include_next(x) 1
+ #endif
+ 
+ #ifdef LIBBSD_OVERLAY
+-- 
+2.12.0
+
diff --git a/meta/recipes-support/libbsd/libbsd_0.8.6.bb b/meta/recipes-support/libbsd/libbsd_0.8.6.bb
index 182543fd42..c88517f5b5 100644
--- a/meta/recipes-support/libbsd/libbsd_0.8.6.bb
+++ b/meta/recipes-support/libbsd/libbsd_0.8.6.bb
@@ -36,6 +36,7 @@ SECTION = "libs"
 SRC_URI = " \
     http://libbsd.freedesktop.org/releases/${BPN}-${PV}.tar.xz \
     file://0001-src-libbsd-overlay.pc.in-Set-Cflags-to-use-I-instead.patch \
+    file://0001-Fix-for-older-GCCs-not-supporting-__has_include.patch \
 "
 SRC_URI_append_libc-musl  = " \
     file://0001-Replace-__BEGIN_DECLS-and-__END_DECLS.patch \
-- 
2.12.0


