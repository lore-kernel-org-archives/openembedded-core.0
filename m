Return-Path: <jussi.kukkonen@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 7780273D37
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Apr 2015 11:19:15 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 30 Apr 2015 04:19:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,676,1422950400"; d="scan'208";a="687963582"
Received: from theory.fi.intel.com ([10.237.72.51])
	by orsmga001.jf.intel.com with ESMTP; 30 Apr 2015 04:19:17 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 30 Apr 2015 14:18:49 +0300
Message-Id: <1c6820d61a7dbd95d60a28cd63c26dfa25e04873.1430379963.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <d5ec2c5d3534efc9e081757e78878216a8d9c609.1430379963.git.jussi.kukkonen@intel.com>
References: <d5ec2c5d3534efc9e081757e78878216a8d9c609.1430379963.git.jussi.kukkonen@intel.com>
In-Reply-To: <cover.1430379963.git.jussi.kukkonen@intel.com>
References: <cover.1430379963.git.jussi.kukkonen@intel.com>
Subject: [PATCH 2/2] libtasn1: Upgrade 4.0 -> 4.5
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
X-List-Received-Date: Thu, 30 Apr 2015 11:19:15 -0000

* Remove configure.ac-patch as unnecessary

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 .../libtasn1/libtasn1_fix_for_automake_1.12.patch  | 28 ----------------------
 .../gnutls/{libtasn1_4.0.bb => libtasn1_4.5.bb}    |  5 ++--
 2 files changed, 2 insertions(+), 31 deletions(-)
 delete mode 100644 meta/recipes-support/gnutls/libtasn1/libtasn1_fix_for_automake_1.12.patch
 rename meta/recipes-support/gnutls/{libtasn1_4.0.bb => libtasn1_4.5.bb} (75%)

diff --git a/meta/recipes-support/gnutls/libtasn1/libtasn1_fix_for_automake_1.12.patch b/meta/recipes-support/gnutls/libtasn1/libtasn1_fix_for_automake_1.12.patch
deleted file mode 100644
index 5540bef..0000000
--- a/meta/recipes-support/gnutls/libtasn1/libtasn1_fix_for_automake_1.12.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-Upstream-Status: Pending
-
-This patch avoids following issues with automake 1.12:
-
-| automake: warnings are treated as errors
-| /srv/home/nitin/builds/build-gcc47/tmp/sysroots/x86_64-linux/usr/share/automake-1.12/am/ltlibrary.am: warning: 'libtasn1.la': linking libtool libraries using a non-POSIX
-| /srv/home/nitin/builds/build-gcc47/tmp/sysroots/x86_64-linux/usr/share/automake-1.12/am/ltlibrary.am: archiver requires 'AM_PROG_AR' in 'configure.ac'
-
-Signed-Off-By: Nitin A Kamble <nitin.a.kamble@intel.com>
-2012/05/02
-
-
-Index: libtasn1-2.11/configure.ac
-===================================================================
---- libtasn1-2.11.orig/configure.ac
-+++ libtasn1-2.11/configure.ac
-@@ -38,6 +38,11 @@ lgl_EARLY
- AC_PROG_YACC
- AC_PROG_LN_S
- 
-+# automake 1.12 seems to require this, but automake 1.11 doesn't recognize it
-+m4_pattern_allow([AM_PROG_AR])
-+AM_PROG_AR
-+
-+
- dnl Checks for programs.
- AC_PROG_INSTALL
- AM_MISSING_PROG(HELP2MAN, help2man, $missing_dir)
diff --git a/meta/recipes-support/gnutls/libtasn1_4.0.bb b/meta/recipes-support/gnutls/libtasn1_4.5.bb
similarity index 75%
rename from meta/recipes-support/gnutls/libtasn1_4.0.bb
rename to meta/recipes-support/gnutls/libtasn1_4.5.bb
index 289833ec..f874574 100644
--- a/meta/recipes-support/gnutls/libtasn1_4.0.bb
+++ b/meta/recipes-support/gnutls/libtasn1_4.5.bb
@@ -9,12 +9,11 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
                     file://README;endline=8;md5=c3803a3e8ca5ab5eb1e5912faa405351"
 
 SRC_URI = "${GNU_MIRROR}/libtasn1/libtasn1-${PV}.tar.gz \
-           file://libtasn1_fix_for_automake_1.12.patch \
            file://dont-depend-on-help2man.patch \
            "
 
-SRC_URI[md5sum] = "d3d2d9bce3b6668b9827a9df52635be1"
-SRC_URI[sha256sum] = "41d044f7644bdd1c4f8a5c15ac1885ca1fcbf32f5f6dd4760a19278b979857fe"
+SRC_URI[md5sum] = "81d272697545e82d39f6bd14854b68f0"
+SRC_URI[sha256sum] = "89b3b5dce119273431544ecb305081f3530911001bb12e5d76588907edb71bda"
 
 inherit autotools texinfo binconfig lib_package
 
-- 
2.1.4


