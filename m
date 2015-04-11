Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f53.google.com (mail-pa0-f53.google.com
	[209.85.220.53])
	by mail.openembedded.org (Postfix) with ESMTP id BFDF873D2D
	for <openembedded-core@lists.openembedded.org>;
	Sat, 11 Apr 2015 01:21:04 +0000 (UTC)
Received: by pacyx8 with SMTP id yx8so37830140pac.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Apr 2015 18:21:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=tZGnT/ViYTHnWCzhgNmilUHY2R0reLVJJ97CXHKpA+I=;
	b=cqmlaHCzL14HOgDtDXsCl45+XOYEkQiHGnLaLWStqZhjyCvTQ0gGOP4G8xGrH6Z96Q
	k4BmLVAHyjTrRVQjPGfcHz86jVHXhgi1zNXswvYFjtlrtjE7ItXNXzNNel7HqCf13AxH
	DDVTJal3HlcxR7+TLCOG+/lBBKfNrsxsLt5Z7gZAR9Tgbdh8+5B9nr1M1misxnpoqHcT
	mHwoTrAtem4SHXNv5IBDIniHPSGEcV5Qxf2X9jZ/GietejA99jr4vF4QYCWh67lJFeLS
	TZutLxqnwiEBi7jMkKLV4kvg0dX/kuZQjC3n/XWZ+8HJFylyK1ogy+ttAlFKqaAPZOrx
	UAfw==
X-Received: by 10.70.92.34 with SMTP id cj2mr7291527pdb.116.1428715265797;
	Fri, 10 Apr 2015 18:21:05 -0700 (PDT)
Received: from iMac.hsd1.ca.comcast.net (c-24-130-225-169.hsd1.ca.comcast.net.
	[24.130.225.169])
	by mx.google.com with ESMTPSA id nb10sm259984pdb.76.2015.04.10.18.21.04
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 10 Apr 2015 18:21:04 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 10 Apr 2015 18:20:43 -0700
Message-Id: <f2c5a1972e7c6fa37af88e7e8b773401d222b146.1428714999.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <9f232e6f50da95ec02e84c6c25a321250e439d79.1428714999.git.raj.khem@gmail.com>
References: <9f232e6f50da95ec02e84c6c25a321250e439d79.1428714999.git.raj.khem@gmail.com>
In-Reply-To: <cover.1428714999.git.raj.khem@gmail.com>
References: <cover.1428714999.git.raj.khem@gmail.com>
Subject: [PATCH 12/17] pulseaudio: Fix build with musl
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
X-List-Received-Date: Sat, 11 Apr 2015 01:21:05 -0000

It reimplements some of standard C library functions but then it assumed
glibc so we need to break that assumption into conditional defines

Change-Id: I92109c2e4c48ab4c3565f64e68d9cbb165823b45
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-padsp-Make-it-compile-on-musl.patch       | 70 ++++++++++++++++++++++
 .../pulseaudio/pulseaudio_6.0.bb                   |  1 +
 2 files changed, 71 insertions(+)
 create mode 100644 meta/recipes-multimedia/pulseaudio/pulseaudio/0001-padsp-Make-it-compile-on-musl.patch

diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio/0001-padsp-Make-it-compile-on-musl.patch b/meta/recipes-multimedia/pulseaudio/pulseaudio/0001-padsp-Make-it-compile-on-musl.patch
new file mode 100644
index 0000000..8555995
--- /dev/null
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio/0001-padsp-Make-it-compile-on-musl.patch
@@ -0,0 +1,70 @@
+From f6ab3c3aa7a1841c8add04828029356d2a8c88e7 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 6 Apr 2015 21:56:31 -0700
+Subject: [PATCH] padsp: Make it compile on musl
+
+break assumptions on glibc and there is no stat64 on non
+glibc C libraries
+
+See pulseaudio bug
+
+https://bugs.freedesktop.org/show_bug.cgi?id=85319
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/utils/padsp.c | 15 +++++++++------
+ 1 file changed, 9 insertions(+), 6 deletions(-)
+
+diff --git a/src/utils/padsp.c b/src/utils/padsp.c
+index e61373c..684721a 100644
+--- a/src/utils/padsp.c
++++ b/src/utils/padsp.c
+@@ -2368,7 +2368,7 @@ fail:
+     return ret;
+ }
+ 
+-#ifdef sun
++#ifndef __GLIBC__
+ int ioctl(int fd, int request, ...) {
+ #else
+ int ioctl(int fd, unsigned long request, ...) {
+@@ -2508,10 +2508,13 @@ int stat(const char *pathname, struct stat *buf) {
+ 
+     return 0;
+ }
+-
+ #ifdef HAVE_OPEN64
+-
++#undef stat64
++#ifdef __GLIBC__
+ int stat64(const char *pathname, struct stat64 *buf) {
++#else
++int stat64(const char *pathname, struct stat *buf) {
++#endif
+     struct stat oldbuf;
+     int ret;
+ 
+@@ -2544,7 +2547,7 @@ int stat64(const char *pathname, struct stat64 *buf) {
+ 
+     return 0;
+ }
+-
++#undef open64
+ int open64(const char *filename, int flags, ...) {
+     va_list args;
+     mode_t mode = 0;
+@@ -2670,8 +2673,8 @@ FILE* fopen(const char *filename, const char *mode) {
+ }
+ 
+ #ifdef HAVE_OPEN64
+-
+-FILE *fopen64(const char *filename, const char *mode) {
++#undef fopen64
++FILE *fopen64(const char *__restrict filename, const char *__restrict mode) {
+ 
+     debug(DEBUG_LEVEL_VERBOSE, __FILE__": fopen64(%s)\n", filename?filename:"NULL");
+ 
+-- 
+2.1.4
+
diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio_6.0.bb b/meta/recipes-multimedia/pulseaudio/pulseaudio_6.0.bb
index 91027bf..fb33c7c 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio_6.0.bb
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio_6.0.bb
@@ -1,6 +1,7 @@
 require pulseaudio.inc
 
 SRC_URI = "http://freedesktop.org/software/pulseaudio/releases/${BP}.tar.xz \
+           file://0001-padsp-Make-it-compile-on-musl.patch \
            file://volatiles.04_pulse \
 "
 SRC_URI[md5sum] = "b691e83b7434c678dffacfa3a027750e"
-- 
2.1.4


