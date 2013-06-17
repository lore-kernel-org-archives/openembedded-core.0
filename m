Return-Path: <Sen.Zhang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id A1CC960E12
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Jun 2013 12:31:14 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r5HCVHo9015194
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Jun 2013 05:31:17 -0700 (PDT)
Received: from jesse-wrs-desktop.corp.ad.wrs.com (128.224.162.230) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.342.3; Mon, 17 Jun 2013 05:31:15 -0700
From: Jesse Zhang <sen.zhang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 17 Jun 2013 20:33:26 +0800
Message-ID: <45e8001562afdc3b5a76a9c8fa1383453ecc13f4.1371472283.git.sen.zhang@windriver.com>
X-Mailer: git-send-email 1.7.11.7
In-Reply-To: <cover.1371472283.git.sen.zhang@windriver.com>
References: <cover.1371472283.git.sen.zhang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] alsa-lib: check if wordexp is supported in libc
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
X-List-Received-Date: Mon, 17 Jun 2013 12:31:15 -0000
Content-Type: text/plain

eglibc could be configured to build without the wordexp feature.  To
ensure that the wordexp feature could be used, the configure script must
check if wordexp() is supported in libc in addition to checking if
wordexp.h exists.

Signed-off-by: Hong H. Pham <hong.pham@windriver.com>
Signed-off-by: Jesse Zhang <sen.zhang@windriver.com>
---
 .../Check-if-wordexp-function-is-supported.patch   | 48 ++++++++++++++++++++++
 meta/recipes-multimedia/alsa/alsa-lib_1.0.26.bb    |  1 +
 2 files changed, 49 insertions(+)
 create mode 100644 meta/recipes-multimedia/alsa/alsa-lib/Check-if-wordexp-function-is-supported.patch

diff --git a/meta/recipes-multimedia/alsa/alsa-lib/Check-if-wordexp-function-is-supported.patch b/meta/recipes-multimedia/alsa/alsa-lib/Check-if-wordexp-function-is-supported.patch
new file mode 100644
index 0000000..d605f0f
--- /dev/null
+++ b/meta/recipes-multimedia/alsa/alsa-lib/Check-if-wordexp-function-is-supported.patch
@@ -0,0 +1,48 @@
+From 2555c5d62229cf269974f6ec6e4689ab97bbda42 Mon Sep 17 00:00:00 2001
+From: "Hong H. Pham" <hong.pham@windriver.com>
+Date: Tue, 26 Feb 2013 19:40:04 -0500
+Subject: [PATCH] Check if wordexp function is supported
+
+eglibc could be configured to build without wordexp, so it is not enough
+to check if wordexp.h exists (the header file could be installed, but it's
+possible that the wordexp() function is not supported).  An additional
+check if wordexp() is supported by the system C library is needed.
+
+Signed-off-by: Hong H. Pham <hong.pham@windriver.com>
+---
+ configure.in   |    5 ++++-
+ src/userfile.c |    2 +-
+ 2 files changed, 5 insertions(+), 2 deletions(-)
+
+diff --git a/configure.in b/configure.in
+index 4bcb0d6..ba1c2dd 100644
+--- a/configure.in
++++ b/configure.in
+@@ -333,7 +333,10 @@ arm*)
+ esac
+ 
+ dnl Check for wordexp.h
+-AC_CHECK_HEADERS([wordexp.h])
++AC_CHECK_HEADERS([wordexp.h],
++  dnl Make sure wordexp is supported by the C library
++  AC_CHECK_FUNCS([wordexp])
++)
+ 
+ dnl Check for resmgr support...
+ AC_MSG_CHECKING(for resmgr support)
+diff --git a/src/userfile.c b/src/userfile.c
+index 3a73836..b8ce809 100644
+--- a/src/userfile.c
++++ b/src/userfile.c
+@@ -32,7 +32,7 @@
+  * stores the first matchine one.  The returned string is strdup'ed.
+  */
+ 
+-#ifdef HAVE_WORDEXP_H
++#if (defined(HAVE_WORDEXP_H) && defined(HAVE_WORDEXP))
+ #include <wordexp.h>
+ #include <assert.h>
+ int snd_user_file(const char *file, char **result)
+-- 
+1.7.10.4
+
diff --git a/meta/recipes-multimedia/alsa/alsa-lib_1.0.26.bb b/meta/recipes-multimedia/alsa/alsa-lib_1.0.26.bb
index 2695e6b..6f22d06 100644
--- a/meta/recipes-multimedia/alsa/alsa-lib_1.0.26.bb
+++ b/meta/recipes-multimedia/alsa/alsa-lib_1.0.26.bb
@@ -20,6 +20,7 @@ SRC_URI = "ftp://ftp.alsa-project.org/pub/lib/alsa-lib-${PV}.tar.bz2 \
            file://fix-tstamp-declaration.patch \
            file://obsolete_automake_macros.patch \
            file://fix-O0-Optimize-unable-inline-function.patch \
+           file://Check-if-wordexp-function-is-supported.patch \
           "
 SRC_URI[md5sum] = "2dfa35d28471d721e592b616beedf965"
 SRC_URI[sha256sum] = "8c9f8161603cc3db640619650401292c3e110da63429ab6938aac763319f6e7d"
-- 
1.7.11.7


