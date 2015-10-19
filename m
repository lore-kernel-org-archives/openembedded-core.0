Return-Path: <ross.burton@intel.com>
Received: from mail-lf0-f45.google.com (mail-lf0-f45.google.com
	[209.85.215.45])
	by mail.openembedded.org (Postfix) with ESMTP id 9FD3075D4A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Oct 2015 10:13:05 +0000 (UTC)
Received: by lffv3 with SMTP id v3so107405048lff.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Oct 2015 03:13:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=tsEpIB9nL3DZC42hmvn0dsWVwP1TIToTyfPC62aKeNw=;
	b=Av/mbwtyaakC9WUSAw2eW/lSBFjtlWhZ818fNLVq2TFXP5FC2iTenXqHaOmtj8RyYW
	Lk2v/JyJQesa7fZdd3OEnC0JTYGBfT7RuMUVk+rHLviV7xUNawv7SCqDCY+cR/j9BjkN
	DNjEJcsr/sT1BrELAhhEawHUjmpPk6hvtuLdvQlxVEMmNlFBT+wEUiX4CW0jQV0WRO0Y
	49dM8ZlQTMxTlYdOpUyUUCakEhJwOeH0VXgOC5os5wDoXu8bt+uL8uEaIQef5ySzcVhf
	SMqjWDYs3x8E3fUPepe8BjQjb9aQoz+PtP6PYirw0vcPnL4KXZGoQdz90v3LkaGkOcuO
	wKAQ==
X-Gm-Message-State: ALoCoQlKZtnLo7Pt+SV4GFra8psEQb7uhlV+zu8+CRkLT1JLGY7Dj48fIMU2/n/UtXgZKsdKRSe7
X-Received: by 10.180.211.47 with SMTP id mz15mr18858275wic.93.1445249584838; 
	Mon, 19 Oct 2015 03:13:04 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	he3sm39245624wjc.48.2015.10.19.03.13.04
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 19 Oct 2015 03:13:04 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 19 Oct 2015 11:05:29 +0100
Message-Id: <1445249129-1475-3-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1445249129-1475-1-git-send-email-ross.burton@intel.com>
References: <1445249129-1475-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 3/3] file: don't replace host file when built natively
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
X-List-Received-Date: Mon, 19 Oct 2015 10:13:06 -0000

To avoid races over the file binaries being replaced mid-build we made
file-native an assume-provided binary and check for it at startup, but target
file still needs a native file binary of the same version to compile the magic
data.

The least invasive way of doing this is to build a native file but use
NATIVE_PACKAGE_PATH_SUFFIX to ensure it isn't on PATH, and tell the target build
where to find the native binary.  To ensure that the host libmagic and the
libmagic provided by file-replacement-native don't cause build races, don't
install libmagic if building natively.

[ YOCTO #8144 ]

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-devtools/file/file/host-file.patch  | 32 ++++++++++++++++++++++++
 meta/recipes-devtools/file/file/no-library.patch | 28 +++++++++++++++++++++
 meta/recipes-devtools/file/file_5.24.bb          | 11 +++++++-
 3 files changed, 70 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/file/file/host-file.patch
 create mode 100644 meta/recipes-devtools/file/file/no-library.patch

diff --git a/meta/recipes-devtools/file/file/host-file.patch b/meta/recipes-devtools/file/file/host-file.patch
new file mode 100644
index 0000000..a7efbdc
--- /dev/null
+++ b/meta/recipes-devtools/file/file/host-file.patch
@@ -0,0 +1,32 @@
+Upstream-Status: Submitted (http://bugs.gw.com/view.php?id=485)
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+From 3cde199d03b39632361c275cd30fa0612a03138b Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross.burton@intel.com>
+Date: Mon, 19 Oct 2015 10:30:57 +0100
+Subject: [PATCH 2/2] When using the host file, respect FILE_COMPILE
+
+If we're cross-compiling and not using the file binary that was just built,
+execute the binary that we've been told to use (via FILE_COMPILE) when checking
+the version instead of assuming that "file" is correct as the actual compile
+uses FILE_COMPILE so different binaries may be used.
+---
+ magic/Makefile.am | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/magic/Makefile.am b/magic/Makefile.am
+index 89ac844..67067fe 100644
+--- a/magic/Makefile.am
++++ b/magic/Makefile.am
+@@ -293,7 +293,7 @@ ${MAGIC}: $(EXTRA_DIST) $(FILE_COMPILE_DEP)
+ 	@(if expr "${FILE_COMPILE}" : '.*/.*' > /dev/null; then \
+ 	    echo "Using ${FILE_COMPILE} to generate ${MAGIC}" > /dev/null; \
+ 	  else \
+-	    v=$$(file --version | sed -e s/file-// -e q); \
++	    v=$$(${FILE_COMPILE} --version | sed -e s/file-// -e q); \
+ 	    if [ "$$v" != "${PACKAGE_VERSION}" ]; then \
+ 		echo "Cannot use the installed version of file ($$v) to"; \
+ 		echo "cross-compile file ${PACKAGE_VERSION}"; \
+-- 
+2.1.4
+
diff --git a/meta/recipes-devtools/file/file/no-library.patch b/meta/recipes-devtools/file/file/no-library.patch
new file mode 100644
index 0000000..f1a26d4
--- /dev/null
+++ b/meta/recipes-devtools/file/file/no-library.patch
@@ -0,0 +1,28 @@
+We don't build a full file-native binary but rely on the host file binary.
+file-replacement-native is only needed to build the target file binary so to
+avoid problems with the host libmagic vs file-replacement-native, don't install
+libmagic.
+
+Upstream-Status: Inappropriate
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+diff --git a/src/Makefile.am b/src/Makefile.am
+index 575899f..052193a 100644
+--- a/src/Makefile.am
++++ b/src/Makefile.am
+@@ -1,13 +1,12 @@
+ MAGIC = $(pkgdatadir)/magic
+-lib_LTLIBRARIES = libmagic.la
+-include_HEADERS = magic.h
++noinst_LTLIBRARIES = libmagic.la
+ 
+ bin_PROGRAMS = file
+ 
+ AM_CPPFLAGS = -DMAGIC='"$(MAGIC)"'
+ AM_CFLAGS = $(CFLAG_VISIBILITY) @WARNINGS@
+ 
+-libmagic_la_SOURCES = magic.c apprentice.c softmagic.c ascmagic.c \
++libmagic_la_SOURCES = magic.c magic.h apprentice.c softmagic.c ascmagic.c \
+ 	encoding.c compress.c is_tar.c readelf.c print.c fsmagic.c \
+ 	funcs.c file.h readelf.h tar.h apptype.c \
+ 	file_opts.h elfclass.h mygetopt.h cdf.c cdf_time.c readcdf.c cdf.h
diff --git a/meta/recipes-devtools/file/file_5.24.bb b/meta/recipes-devtools/file/file_5.24.bb
index 08b95d7..c1d4578 100644
--- a/meta/recipes-devtools/file/file_5.24.bb
+++ b/meta/recipes-devtools/file/file_5.24.bb
@@ -8,19 +8,26 @@ SECTION = "console/utils"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://COPYING;beginline=2;md5=6a7382872edb68d33e1a9398b6e03188"
 
-DEPENDS = "zlib file-native"
+DEPENDS = "zlib file-replacement-native"
 DEPENDS_class-native = "zlib-native"
 
 SRC_URI = "git://github.com/file/file.git \
         file://debian-742262.patch \
         file://0001-Add-P-prompt-into-Usage-info.patch \
+        file://host-file.patch \
         "
 
+# file-native is generally assume-provided so don't install the library as this
+# is for file-replacement-native.
+SRC_URI_append_class-native = "file://no-library.patch"
+
 SRCREV = "3c0874be4d3232d672b20f513451a39cfd7c585a"
 S = "${WORKDIR}/git"
 
 inherit autotools
 
+EXTRA_OEMAKE_append_class-target = "-e FILE_COMPILE=${STAGING_BINDIR_NATIVE}/file-native/file"
+
 FILES_${PN} += "${datadir}/misc/*.mgc"
 
 do_install_append_class-native() {
@@ -34,3 +41,5 @@ do_install_append_class-nativesdk() {
 }
 
 BBCLASSEXTEND = "native nativesdk"
+PROVIDES_append_class-native = " file-replacement-native"
+NATIVE_PACKAGE_PATH_SUFFIX = "/${PN}"
-- 
2.1.4


