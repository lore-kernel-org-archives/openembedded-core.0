Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lianhao.lu@intel.com>) id 1SErah-0006Zd-7x
	for openembedded-core@lists.openembedded.org;
	Tue, 03 Apr 2012 02:27:19 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 02 Apr 2012 17:18:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="148904172"
Received: from llu-piketon.sh.intel.com (HELO localhost) ([10.239.36.110])
	by fmsmga002.fm.intel.com with ESMTP; 02 Apr 2012 17:18:09 -0700
From: Lianhao Lu <lianhao.lu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  3 Apr 2012 08:13:51 +0800
Message-Id: <4ca2d5696ad0249c2524d5d99728647f0df6b92a.1333411736.git.lianhao.lu@intel.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1333411736.git.lianhao.lu@intel.com>
References: <cover.1333411736.git.lianhao.lu@intel.com>
Subject: [PATCH 1/1] eglibc: SDK_GLIBC_ADDONS for eglibc-nativesdk.
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 03 Apr 2012 00:27:19 -0000

Use SDK_GLIBC_ADDONS for eglibc-nativesdk so that it is not
dependant on the target eglibc's GLIBC_ADDONS settings.

Signed-off-by: Lianhao Lu <lianhao.lu@intel.com>
---
 meta/conf/machine-sdk/i586.conf         |    2 ++
 meta/conf/machine-sdk/i686.conf         |    2 ++
 meta/conf/machine-sdk/x86_64.conf       |    4 +++-
 meta/recipes-core/eglibc/eglibc.inc     |    4 ++++
 meta/recipes-core/eglibc/eglibc_2.13.bb |    5 ++---
 meta/recipes-core/eglibc/eglibc_2.15.bb |    4 +---
 6 files changed, 14 insertions(+), 7 deletions(-)

diff --git a/meta/conf/machine-sdk/i586.conf b/meta/conf/machine-sdk/i586.conf
index 0b748a5..190f2bd 100644
--- a/meta/conf/machine-sdk/i586.conf
+++ b/meta/conf/machine-sdk/i586.conf
@@ -1,2 +1,4 @@
 SDK_ARCH = "i586"
 SDK_CC_ARCH = "-march=i586"
+
+SDK_GLIBC_ADDONS = "nptl"
diff --git a/meta/conf/machine-sdk/i686.conf b/meta/conf/machine-sdk/i686.conf
index ffdb461..3e8e4f4 100644
--- a/meta/conf/machine-sdk/i686.conf
+++ b/meta/conf/machine-sdk/i686.conf
@@ -1,2 +1,4 @@
 SDK_ARCH = "i686"
 SDK_CC_ARCH = "-march=i686"
+
+SDK_GLIBC_ADDONS = "nptl"
diff --git a/meta/conf/machine-sdk/x86_64.conf b/meta/conf/machine-sdk/x86_64.conf
index a6adb28..9495842 100644
--- a/meta/conf/machine-sdk/x86_64.conf
+++ b/meta/conf/machine-sdk/x86_64.conf
@@ -1 +1,3 @@
-SDK_ARCH = "x86_64"
\ No newline at end of file
+SDK_ARCH = "x86_64"
+
+SDK_GLIBC_ADDONS = "nptl"
diff --git a/meta/recipes-core/eglibc/eglibc.inc b/meta/recipes-core/eglibc/eglibc.inc
index da5c187..8e3fe50 100644
--- a/meta/recipes-core/eglibc/eglibc.inc
+++ b/meta/recipes-core/eglibc/eglibc.inc
@@ -50,3 +50,7 @@ do_configure_prepend() {
 	sed -e "s#@BASH@#/bin/sh#" -i ${S}/elf/ldd.bash.in
 	echo '${OE_FEATURES}' > ${B}/option-groups.config
 }
+
+GLIBC_ADDONS ?= "ports,nptl,libidn"
+SDK_GLIBC_ADDONS ?= "ports,nptl,libidn"
+GLIBC_ADDONS_virtclass-nativesdk = "${SDK_GLIBC_ADDONS}"
diff --git a/meta/recipes-core/eglibc/eglibc_2.13.bb b/meta/recipes-core/eglibc/eglibc_2.13.bb
index e02c80f..927f72f 100644
--- a/meta/recipes-core/eglibc/eglibc_2.13.bb
+++ b/meta/recipes-core/eglibc/eglibc_2.13.bb
@@ -3,7 +3,7 @@ require eglibc.inc
 SRCREV = "15508"
 
 DEPENDS += "gperf-native"
-PR = "r22"
+PR = "r23"
 PR_append = "+svnr${SRCPV}"
 
 EGLIBC_BRANCH="eglibc-2_13"
@@ -36,8 +36,6 @@ PROVIDES_${PN}-dbg = "glibc-dbg"
 BUILD_CPPFLAGS = "-I${STAGING_INCDIR_NATIVE}"
 TARGET_CPPFLAGS = "-I${STAGING_DIR_TARGET}${layout_includedir}"
 
-GLIBC_ADDONS ?= "ports,nptl,libidn"
-
 GLIBC_BROKEN_LOCALES = " _ER _ET so_ET yn_ER sid_ET tr_TR mn_MN gez_ET gez_ER bn_BD te_IN es_CR.ISO-8859-1"
 
 FILESPATH = "${@base_set_filespath([ '${FILE_DIRNAME}/eglibc-${PV}', '${FILE_DIRNAME}/eglibc', '${FILE_DIRNAME}/files', '${FILE_DIRNAME}' ], d)}"
@@ -60,6 +58,7 @@ python __anonymous () {
 
 export libc_cv_slibdir = "${base_libdir}"
 
+
 EXTRA_OECONF = "--enable-kernel=${OLDEST_KERNEL} \
                 --without-cvs --disable-profile --disable-debug --without-gd \
                 --enable-clocale=gnu \
diff --git a/meta/recipes-core/eglibc/eglibc_2.15.bb b/meta/recipes-core/eglibc/eglibc_2.15.bb
index 75ccace..1575e7f 100644
--- a/meta/recipes-core/eglibc/eglibc_2.15.bb
+++ b/meta/recipes-core/eglibc/eglibc_2.15.bb
@@ -3,7 +3,7 @@ require eglibc.inc
 SRCREV = "17386"
 
 DEPENDS += "gperf-native"
-PR = "r2"
+PR = "r3"
 PR_append = "+svnr${SRCPV}"
 
 EGLIBC_BRANCH="eglibc-2_15"
@@ -41,8 +41,6 @@ PROVIDES_${PN}-dbg = "glibc-dbg"
 BUILD_CPPFLAGS = "-I${STAGING_INCDIR_NATIVE}"
 TARGET_CPPFLAGS = "-I${STAGING_DIR_TARGET}${layout_includedir}"
 
-GLIBC_ADDONS ?= "ports,nptl,libidn"
-
 GLIBC_BROKEN_LOCALES = " _ER _ET so_ET yn_ER sid_ET tr_TR mn_MN gez_ET gez_ER bn_BD te_IN es_CR.ISO-8859-1"
 
 FILESPATH = "${@base_set_filespath([ '${FILE_DIRNAME}/eglibc-${PV}', '${FILE_DIRNAME}/eglibc', '${FILE_DIRNAME}/files', '${FILE_DIRNAME}' ], d)}"
-- 
1.7.0.4



