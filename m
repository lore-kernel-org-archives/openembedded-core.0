Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id CF482731E5
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Jan 2016 13:36:12 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga103.jf.intel.com with ESMTP; 07 Jan 2016 05:36:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,533,1444719600"; d="scan'208";a="876413109"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga001.fm.intel.com with ESMTP; 07 Jan 2016 05:36:12 -0800
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.51])
	by linux.intel.com (Postfix) with ESMTP id 1E3596A4004;
	Thu,  7 Jan 2016 06:24:09 -0800 (PST)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  7 Jan 2016 13:39:39 +0200
Message-Id: <1452166779-16328-1-git-send-email-ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] meta: rename perl-native-runtime
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
X-List-Received-Date: Thu, 07 Jan 2016 13:36:13 -0000

The code in native.bbclass adds -native suffix to the package
names that don't have it. perl-native-runtime becomes
perl-native-runtime-native because of this.

Renamed perl-native-runtime -> hostperl-runtime-native to avoid
mangling it and to conform with the naming convetion for native
packages.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 meta/conf/bitbake.conf                                  | 2 +-
 meta/recipes-connectivity/openssl/openssl.inc           | 2 +-
 meta/recipes-devtools/automake/automake_1.15.bb         | 2 +-
 meta/recipes-devtools/gnu-config/gnu-config_20120814.bb | 2 +-
 meta/recipes-devtools/gnu-config/gnu-config_git.bb      | 2 +-
 meta/recipes-support/libcap/libcap_2.24.bb              | 2 +-
 6 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 371af31..3375959 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -171,7 +171,7 @@ ASSUME_PROVIDED = "\
     grep-native \
     diffstat-native \
     patch-native \
-    perl-native-runtime \
+    hostperl-runtime-native \
     python-native-runtime \
     tar-native \
     virtual/libintl-native \
diff --git a/meta/recipes-connectivity/openssl/openssl.inc b/meta/recipes-connectivity/openssl/openssl.inc
index 199e9ab..44e2eb4 100644
--- a/meta/recipes-connectivity/openssl/openssl.inc
+++ b/meta/recipes-connectivity/openssl/openssl.inc
@@ -8,7 +8,7 @@ SECTION = "libs/network"
 LICENSE = "openssl"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=f9a8f968107345e0b75aa8c2ecaa7ec8"
 
-DEPENDS = "perl-native-runtime"
+DEPENDS = "hostperl-runtime-native"
 DEPENDS_append_class-target = " openssl-native"
 
 SRC_URI = "http://www.openssl.org/source/openssl-${PV}.tar.gz \
diff --git a/meta/recipes-devtools/automake/automake_1.15.bb b/meta/recipes-devtools/automake/automake_1.15.bb
index 4f280ba..e3cb85b 100644
--- a/meta/recipes-devtools/automake/automake_1.15.bb
+++ b/meta/recipes-devtools/automake/automake_1.15.bb
@@ -16,7 +16,7 @@ RDEPENDS_${PN} += "\
     perl-module-threads \
     perl-module-vars "
 
-RDEPENDS_${PN}_class-native = "autoconf-native perl-native-runtime"
+RDEPENDS_${PN}_class-native = "autoconf-native hostperl-runtime-native"
 
 SRC_URI += " file://python-libdir.patch \
             file://py-compile-compile-only-optimized-byte-code.patch \
diff --git a/meta/recipes-devtools/gnu-config/gnu-config_20120814.bb b/meta/recipes-devtools/gnu-config/gnu-config_20120814.bb
index eb7e420..0d05e79 100644
--- a/meta/recipes-devtools/gnu-config/gnu-config_20120814.bb
+++ b/meta/recipes-devtools/gnu-config/gnu-config_20120814.bb
@@ -4,7 +4,7 @@ SECTION = "devel"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://config.guess;endline=39;md5=b79a4663475f4d724846463277817e0d"
 
-DEPENDS_class-native = "perl-native-runtime"
+DEPENDS_class-native = "hostperl-runtime-native"
 
 INHIBIT_DEFAULT_DEPS = "1"
 
diff --git a/meta/recipes-devtools/gnu-config/gnu-config_git.bb b/meta/recipes-devtools/gnu-config/gnu-config_git.bb
index 3d5f2b8..072726f 100644
--- a/meta/recipes-devtools/gnu-config/gnu-config_git.bb
+++ b/meta/recipes-devtools/gnu-config/gnu-config_git.bb
@@ -4,7 +4,7 @@ SECTION = "devel"
 LICENSE = "GPL-3.0-with-autoconf-exception"
 LIC_FILES_CHKSUM = "file://config.guess;beginline=7;endline=27;md5=9bac8b1743c2240ae07cce6e546ac2f2"
 
-DEPENDS_class-native = "perl-native-runtime"
+DEPENDS_class-native = "hostperl-runtime-native"
 
 INHIBIT_DEFAULT_DEPS = "1"
 
diff --git a/meta/recipes-support/libcap/libcap_2.24.bb b/meta/recipes-support/libcap/libcap_2.24.bb
index e2b93a4..a701019 100644
--- a/meta/recipes-support/libcap/libcap_2.24.bb
+++ b/meta/recipes-support/libcap/libcap_2.24.bb
@@ -5,7 +5,7 @@ HOMEPAGE = "http://sites.google.com/site/fullycapable/"
 LICENSE = "BSD | GPLv2"
 LIC_FILES_CHKSUM = "file://License;md5=3f84fd6f29d453a56514cb7e4ead25f1"
 
-DEPENDS = "perl-native-runtime"
+DEPENDS = "hostperl-runtime-native"
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/libs/security/linux-privs/${BPN}2/${BPN}-${PV}.tar.xz"
 
-- 
2.1.4


