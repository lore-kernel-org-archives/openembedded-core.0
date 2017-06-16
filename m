Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 21A0D78476
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Jun 2017 12:29:26 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	16 Jun 2017 05:29:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,347,1493708400"; d="scan'208";a="1161279563"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga001.fm.intel.com with ESMTP; 16 Jun 2017 05:29:04 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 16 Jun 2017 15:28:39 +0300
Message-Id: <2a0f0a8aa0be18fb1ed84e3bf2f3152420b303dc.1497615866.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1497615866.git.alexander.kanavin@linux.intel.com>
References: <cover.1497615866.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 16/32] remake: remove the recipe
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
X-List-Received-Date: Fri, 16 Jun 2017 12:29:26 -0000

Using remake as the provider of virtual/make has been broken for a while;
looks like no one is using it at all.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-devtools/remake/remake.inc            | 16 -------------
 .../remake/remake/version-remake.texi.patch        | 16 -------------
 meta/recipes-devtools/remake/remake_4.1+dbg-1.1.bb | 28 ----------------------
 3 files changed, 60 deletions(-)
 delete mode 100644 meta/recipes-devtools/remake/remake.inc
 delete mode 100644 meta/recipes-devtools/remake/remake/version-remake.texi.patch
 delete mode 100644 meta/recipes-devtools/remake/remake_4.1+dbg-1.1.bb

diff --git a/meta/recipes-devtools/remake/remake.inc b/meta/recipes-devtools/remake/remake.inc
deleted file mode 100644
index df889fcf9f3..00000000000
--- a/meta/recipes-devtools/remake/remake.inc
+++ /dev/null
@@ -1,16 +0,0 @@
-SUMMARY = "Makefile debugger which is gnumake compatible"
-DESCRIPTION = "remake is a patched and modernized version of GNU make \
-utility that adds improved error reporting, the ability to trace \
-execution in a comprehensible way, and a debugger."
-
-HOMEPAGE = "http://bashdb.sourceforge.net/remake/"
-SECTION = "devel"
-
-SRC_URI = "git://github.com/rocky/remake.git"
-
-inherit autotools gettext update-alternatives pkgconfig
-
-ALTERNATIVE_${PN} = "make"
-ALTERNATIVE_LINK_NAME[make] = "${bindir}/make"
-ALTERNATIVE_TARGET[make] = "${bindir}/remake"
-ALTERNATIVE_PRIORITY = "100"
diff --git a/meta/recipes-devtools/remake/remake/version-remake.texi.patch b/meta/recipes-devtools/remake/remake/version-remake.texi.patch
deleted file mode 100644
index fa6329e0673..00000000000
--- a/meta/recipes-devtools/remake/remake/version-remake.texi.patch
+++ /dev/null
@@ -1,16 +0,0 @@
-Upstream-Status: Pending
-
-version-remake.texi is not there but it is required by remake.texi,
-just add it for getting the 'make remake.info' works.
-
-==============================================================
-diff --git a/doc/version-remake.texi b/doc/version-remake.texi
-new file mode 100644
-index 0000000..2a3b72b
---- /dev/null
-+++ b/doc/version-remake.texi
-@@ -0,0 +1,4 @@
-+@set UPDATED 10 June 2012
-+@set UPDATED-MONTH June 2012
-+@set EDITION 3.82+dbg-0.9git
-+@set VERSION 3.82+dbg-0.9git
diff --git a/meta/recipes-devtools/remake/remake_4.1+dbg-1.1.bb b/meta/recipes-devtools/remake/remake_4.1+dbg-1.1.bb
deleted file mode 100644
index 8eab7e3a0d2..00000000000
--- a/meta/recipes-devtools/remake/remake_4.1+dbg-1.1.bb
+++ /dev/null
@@ -1,28 +0,0 @@
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
-                    file://tests/COPYING;md5=d32239bcb673463ab874e80d47fae504 \
-                    file://glob/COPYING.LIB;md5=4a770b67e6be0f60da244beb2de0fce4"
-require remake.inc
-
-UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>(\d+(\.\d+)+)\+dbg.+)"
-SRC_URI += "file://version-remake.texi.patch \
-           "
-SRCREV = "cf54641d50a0165bb17622b3e9770f426ccbc561"
-S = "${WORKDIR}/git"
-
-DEPENDS += "readline guile"
-# Need to add "gettext-native" dependency to remake-native.
-# By default only "gettext-minimal-native" is added
-# when inherit gettext.
-DEPENDS_class-native += "gettext-native"
-PROVIDES += "virtual/make"
-
-do_configure_prepend() {
-    # remove the default LINGUAS since we are not going to generate languages
-    rm ${S}/po/LINGUAS
-    touch ${S}/po/LINGUAS
-    # create config.rpath which required by configure.ac
-    ( cd ${S}; autopoint || touch config.rpath )
-}
-
-BBCLASSEXTEND = "native"
-- 
2.11.0


