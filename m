Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f48.google.com (mail-wm0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id 15637771DA
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Feb 2016 16:23:01 +0000 (UTC)
Received: by mail-wm0-f48.google.com with SMTP id 128so34781234wmz.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 Feb 2016 08:23:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=jmgYHBSeN27NlVnjai3EOugSKWZKHpLggU/C6Kl5TQQ=;
	b=GNI+1ICm9SftqEHTQDsey7f4Hq2Ocj4tVFrUSP4B6EsHsFUOKxkiGkozhv1pp0d70t
	nNCrcVAgZimK1Z1TmDEE0vTmRGsCMFEn9n/+t37jnZDKvySnBX9w1jDzdU034OQbN34t
	0j5iWgfNu4b96NdFkyAYYCEDK1G87SmQadsz8AbA9IpfAK+/6jWmKBv8vB2S8CKBynZ3
	u/OcNMCeH7DKEgE5nwzSKh3fiAKHA8lFUcWHxxfV/rfKfQVGOYadcRbuOBO7ahtx2Npz
	f2QcnhptRk4e5XoooSzSjp3CT+SwO3NToiMpuAEAeFv2/DdInrUMETiMMe6Wyry5uwsS
	RfTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=jmgYHBSeN27NlVnjai3EOugSKWZKHpLggU/C6Kl5TQQ=;
	b=UqfQggc648eZhD/G1UGAQwwgUpHAVmJQsurVph31obSBEq7iJMCrWHQo8glt/22KSX
	mFoSvdDgAZinKQa1+E5yEBH0HBcQtgkWqeqSv1817DpVxqNMNzx/ENPXNmf1ZMJDkCrA
	W9b019GWUtvw7K9Yujq8s2noQu6PL6iSW0tDs8RkwePwDCszhSS9/P3rOrKBJ8TUzloH
	mVlGtESb8gt4bBhebx6/H7nkywJpDEi9aI3lwHm7PjHcJq9IKEBTdYSzfxZCuaksW6VY
	II/srRlebmrost/rwkCoXGnYBY4I64C8CJMTY8nhLTcIK4OA75jJbK5tX6hfvUgqgly7
	zCtA==
X-Gm-Message-State: AG10YOSokp1vp+LBZAHg40XlboD5Pt5+kqEPfvzb2tVKf0Wg9GWVVd55u3/HEJeCCnQ8pUaF
X-Received: by 10.194.123.167 with SMTP id mb7mr10622910wjb.0.1454602982160;
	Thu, 04 Feb 2016 08:23:02 -0800 (PST)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	i2sm11951507wjx.42.2016.02.04.08.23.01
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 04 Feb 2016 08:23:01 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  4 Feb 2016 16:22:50 +0000
Message-Id: <1454602972-13669-2-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <1454602972-13669-1-git-send-email-ross.burton@intel.com>
References: <1454602972-13669-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 2/4] libffi: ensure sysroot paths are not in libffi.pc
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
X-List-Received-Date: Thu, 04 Feb 2016 16:23:03 -0000

Remove a previous patch and solve the problem in a different way, as the same
root cause was causing the absolute sysroot path to appear in libffi.pc.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../libffi/libffi/fix-libffi.la-location.patch     | 18 ------------------
 meta/recipes-gnome/libffi/libffi/not-win32.patch   | 22 ++++++++++++++++++++++
 meta/recipes-gnome/libffi/libffi_3.2.1.bb          |  2 +-
 3 files changed, 23 insertions(+), 19 deletions(-)
 delete mode 100644 meta/recipes-gnome/libffi/libffi/fix-libffi.la-location.patch
 create mode 100644 meta/recipes-gnome/libffi/libffi/not-win32.patch

diff --git a/meta/recipes-gnome/libffi/libffi/fix-libffi.la-location.patch b/meta/recipes-gnome/libffi/libffi/fix-libffi.la-location.patch
deleted file mode 100644
index 775bffc..0000000
--- a/meta/recipes-gnome/libffi/libffi/fix-libffi.la-location.patch
+++ /dev/null
@@ -1,18 +0,0 @@
-
-Upstream-Status: Inappropriate
-
-Signed-off-by: Saul Wold <sgw@linux.intel.com>
-
-Index: libffi-3.0.13/Makefile.am
-===================================================================
---- libffi-3.0.13.orig/Makefile.am
-+++ libffi-3.0.13/Makefile.am
-@@ -98,7 +98,7 @@ FLAGS_TO_PASS = $(AM_MAKEFLAGS)
- 
- MAKEOVERRIDES=
- 
--toolexeclib_LTLIBRARIES = libffi.la
-+lib_LTLIBRARIES = libffi.la
- noinst_LTLIBRARIES = libffi_convenience.la
- 
- libffi_la_SOURCES = src/prep_cif.c src/types.c \
diff --git a/meta/recipes-gnome/libffi/libffi/not-win32.patch b/meta/recipes-gnome/libffi/libffi/not-win32.patch
new file mode 100644
index 0000000..1e90125
--- /dev/null
+++ b/meta/recipes-gnome/libffi/libffi/not-win32.patch
@@ -0,0 +1,22 @@
+libffi's configure assumes that cross-compiled builds are complicated and
+introduces convoluted path manipulation involving gcc search paths to the
+install paths, resulting in paths like -L/usr/lib/../lib/ appearing in
+libffi.pc.  When pkg-config is then used to obtain the linker flags for libffi
+it can't tell that this path is on the default search path and returns
+$SYSROOT/usr/lib/../lib which then gets written all over the target sysroot.
+This then means the sstate can't be shared and triggers QA errors.
+
+As this block is generally pointless, disable it.
+
+Upstream-Status: Inappropriate
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+--- a/configure.ac~	2014-11-12 11:56:51.000000000 +0000
++++ b/configure.ac	2016-02-04 14:02:53.765710532 +0000
+@@ -593,5 +593,5 @@
+ # These variables are only ever used when we cross-build to X86_WIN32.
+ # And we only support this with GCC, so...
+-if test "x$GCC" = "xyes"; then
++if false; then
+   if test -n "$with_cross_host" &&
+      test x"$with_cross_host" != x"no"; then
\ No newline at end of file
diff --git a/meta/recipes-gnome/libffi/libffi_3.2.1.bb b/meta/recipes-gnome/libffi/libffi_3.2.1.bb
index fd916ca..72e25fb 100644
--- a/meta/recipes-gnome/libffi/libffi_3.2.1.bb
+++ b/meta/recipes-gnome/libffi/libffi_3.2.1.bb
@@ -10,7 +10,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3610bb17683a0089ed64055416b2ae1b"
 
 SRC_URI = "ftp://sourceware.org/pub/libffi/${BP}.tar.gz \
-           file://fix-libffi.la-location.patch \
+           file://not-win32.patch \
 	   file://0001-mips-Use-compiler-internal-define-for-linux.patch \
 	   "
 
-- 
2.7.0


