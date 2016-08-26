Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 8C7E9762B3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Aug 2016 14:30:23 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga103.jf.intel.com with ESMTP; 26 Aug 2016 07:30:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,581,1464678000"; 
   d="scan'208";a="1525521"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.49])
	by orsmga004.jf.intel.com with ESMTP; 26 Aug 2016 07:30:23 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 26 Aug 2016 17:28:16 +0300
Message-Id: <cf5764cb583333f3585a18bf7f2ad5cce6d47ad7.1472221205.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <cover.1472221205.git.alexander.kanavin@linux.intel.com>
References: <cover.1472221205.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1472221205.git.alexander.kanavin@linux.intel.com>
References: <cover.1472221205.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 01/28] source-highlight: add a recipe
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
X-List-Received-Date: Fri, 26 Aug 2016 14:30:23 -0000

gtk-doc relies on this to highlight source code snippets

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/conf/distro/include/security_flags.inc        |  1 +
 ...light.pc.in-do-not-add-Boost-s-libraries-.patch | 30 ++++++++++++++++++++++
 .../source-highlight/source-highlight_3.1.8.bb     | 28 ++++++++++++++++++++
 3 files changed, 59 insertions(+)
 create mode 100644 meta/recipes-support/source-highlight/files/0001-source-highlight.pc.in-do-not-add-Boost-s-libraries-.patch
 create mode 100644 meta/recipes-support/source-highlight/source-highlight_3.1.8.bb

diff --git a/meta/conf/distro/include/security_flags.inc b/meta/conf/distro/include/security_flags.inc
index 20f48de..1c1e50b 100644
--- a/meta/conf/distro/include/security_flags.inc
+++ b/meta/conf/distro/include/security_flags.inc
@@ -80,6 +80,7 @@ SECURITY_CFLAGS_pn-python3 = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-rpm = "${lcl_maybe_fortify} -fstack-protector"
 SECURITY_CFLAGS_pn-syslinux = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-slang = "${SECURITY_NO_PIE_CFLAGS}"
+SECURITY_CFLAGS_pn-source-highlight = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-tcl = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-tiff = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-uclibc = ""
diff --git a/meta/recipes-support/source-highlight/files/0001-source-highlight.pc.in-do-not-add-Boost-s-libraries-.patch b/meta/recipes-support/source-highlight/files/0001-source-highlight.pc.in-do-not-add-Boost-s-libraries-.patch
new file mode 100644
index 0000000..b0aa5d1
--- /dev/null
+++ b/meta/recipes-support/source-highlight/files/0001-source-highlight.pc.in-do-not-add-Boost-s-libraries-.patch
@@ -0,0 +1,30 @@
+From 9aa01fd5f9d8b2b98c34684dc8f68115750ef41c Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Tue, 12 Jul 2016 17:15:13 +0300
+Subject: [PATCH] source-highlight.pc.in: do not add Boost's libraries and
+ includes
+
+This breaks when compiling in sysroots; a proper way is to use Depends
+
+Upstream-Status: Pending
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ source-highlight.pc.in | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/source-highlight.pc.in b/source-highlight.pc.in
+index 79ab63e..64114a7 100644
+--- a/source-highlight.pc.in
++++ b/source-highlight.pc.in
+@@ -7,6 +7,6 @@ Name: libsource-highlight
+ Description: GNU Source-highlight library.
+ URL: http://www.gnu.org/software/src-highlite/
+ Version: @VERSION@
+-Libs: -L${libdir} -lsource-highlight @BOOST_LDFLAGS@ @BOOST_REGEX_LIB@
+-Cflags: -I${includedir} @BOOST_CPPFLAGS@
++Libs: -L${libdir} -lsource-highlight
++Cflags: -I${includedir}
+ 
+-- 
+2.8.1
+
diff --git a/meta/recipes-support/source-highlight/source-highlight_3.1.8.bb b/meta/recipes-support/source-highlight/source-highlight_3.1.8.bb
new file mode 100644
index 0000000..37d2fa9
--- /dev/null
+++ b/meta/recipes-support/source-highlight/source-highlight_3.1.8.bb
@@ -0,0 +1,28 @@
+SUMMARY = "Syntax highlight utility"
+DESCRIPTION = "Source-highlight converts source code to formatted text with syntax highlighting."
+HOMEPAGE = "https://www.gnu.org/software/src-highlite/"
+LICENSE = "GPLv3"
+LIC_FILES_CHKSUM = "file://COPYING;md5=ff95bfe019feaf92f524b73dd79e76eb"
+
+SRC_URI = "${GNU_MIRROR}/src-highlite/${BPN}-${PV}.tar.gz \
+           file://0001-source-highlight.pc.in-do-not-add-Boost-s-libraries-.patch"
+SRC_URI[md5sum] = "3243470706ef5fefdc3e43b5306a4e41"
+SRC_URI[sha256sum] = "01336a7ea1d1ccc374201f7b81ffa94d0aecb33afc7d6903ebf9fbf33a55ada3"
+
+inherit autotools
+
+DEPENDS_append = " boost"
+
+DEPENDS_append_class-target = " source-highlight-native"
+
+EXTRA_OECONF = "--with-boost=${PKG_CONFIG_SYSROOT_DIR}/${prefix}"
+
+BBCLASSEXTEND = "native"
+
+# source-highlight is using its own binary from the build tree to make documentation
+# let's substitute the native binary instead
+do_configure_prepend_class-target () {
+        sed -i -e 's,^SRCHILITEEXE = $(top_builddir).*,SRCHILITEEXE = source-highlight,' ${S}/doc/Makefile.am
+}
+
+RDEPENDS_source-highlight += "bash"
-- 
2.9.3


