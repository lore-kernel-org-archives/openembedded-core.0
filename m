Return-Path: <sgw@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 63AFD6D16D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Oct 2013 17:49:24 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga101.jf.intel.com with ESMTP; 21 Oct 2013 10:49:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,540,1378882800"; d="scan'208";a="414632851"
Received: from unknown (HELO swold-linux.host.org) ([10.255.12.37])
	by fmsmga001.fm.intel.com with ESMTP; 21 Oct 2013 10:49:17 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 21 Oct 2013 10:49:14 -0700
Message-Id: <1382377754-4904-4-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1382377754-4904-1-git-send-email-sgw@linux.intel.com>
References: <1382377754-4904-1-git-send-email-sgw@linux.intel.com>
Subject: [PATCH 3/3] check: Remove duplicate recipe of libcheck
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
X-List-Received-Date: Mon, 21 Oct 2013 17:49:26 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-support/check/check_0.9.10.bb   | 20 -------------------
 meta/recipes-support/check/files/ptest.patch | 29 ----------------------------
 meta/recipes-support/check/files/run-ptest   |  3 ---
 3 files changed, 52 deletions(-)
 delete mode 100644 meta/recipes-support/check/check_0.9.10.bb
 delete mode 100644 meta/recipes-support/check/files/ptest.patch
 delete mode 100644 meta/recipes-support/check/files/run-ptest

diff --git a/meta/recipes-support/check/check_0.9.10.bb b/meta/recipes-support/check/check_0.9.10.bb
deleted file mode 100644
index 78eec14..0000000
--- a/meta/recipes-support/check/check_0.9.10.bb
+++ /dev/null
@@ -1,20 +0,0 @@
-DESCRIPTION = "Library to read the extended image information (EXIF) from JPEG pictures"
-HOMEPAGE = "http://sourceforge.net/projects/check"
-SECTION = "libs"
-LICENSE = "LGPLv2"
-LIC_FILES_CHKSUM = "file://COPYING.LESSER;md5=2d5025d4aa3495befef8f17206a5b0a1"
-
-
-SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${PV}/${BP}.tar.gz \
-           file://run-ptest \
-           file://ptest.patch \
-          "
-
-SRC_URI[md5sum] = "6d10a8efb9a683467b92b3bce97aeb30"
-SRC_URI[sha256sum] = "823819235753e94ae0bcab3c46cc209de166c32ff2f52cefe120597db4403e6d"
-
-inherit autotools ptest
-
-RDEPENDS_${PN} = "make"
-
-BBCLASSEXTEND = "native"
diff --git a/meta/recipes-support/check/files/ptest.patch b/meta/recipes-support/check/files/ptest.patch
deleted file mode 100644
index 3cb2b25..0000000
--- a/meta/recipes-support/check/files/ptest.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-Index: check-0.9.10/Makefile.am
-===================================================================
---- check-0.9.10.orig/Makefile.am
-+++ check-0.9.10/Makefile.am
-@@ -45,6 +45,9 @@ ACLOCAL_AMFLAGS = -I m4
- doc/check_html:
- 	$(MAKE) -C doc check_html
- 
-+install-ptest:
-+	$(MAKE) -C tests install-ptest
-+
- # check we can do a clean build, including docs.
- # perhaps we should check for out of date (svn st -u) and modified files.
- prereleasecheck: doc/check_html
-Index: check-0.9.10/tests/Makefile.am
-===================================================================
---- check-0.9.10.orig/tests/Makefile.am
-+++ check-0.9.10/tests/Makefile.am
-@@ -81,3 +81,10 @@ ex_xml_output_LDADD = $(top_builddir)/sr
- AM_CPPFLAGS = -I$(top_builddir)/src -I$(top_srcdir)/src
- 
- CLEANFILES = *~ *.log *.xml test_logfile
-+
-+install-ptest:
-+	@$(MKDIR_P) $(DESTDIR)/tests
-+	@for file in $(noinst_PROGRAMS) $(EXTRA_DIST); do \
-+		install -m 0755 $$file $(DESTDIR)/tests; \
-+	done;
-+	@sed -e 's/^Makefile/_Makefile/' < Makefile > $(DESTDIR)/Makefile
diff --git a/meta/recipes-support/check/files/run-ptest b/meta/recipes-support/check/files/run-ptest
deleted file mode 100644
index d4969ef..0000000
--- a/meta/recipes-support/check/files/run-ptest
+++ /dev/null
@@ -1,3 +0,0 @@
-#!/bin/sh
-make -k check-TESTS
-
-- 
1.8.3.1


