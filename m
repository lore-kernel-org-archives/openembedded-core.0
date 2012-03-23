Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lianhao.lu@intel.com>) id 1SAwL7-0006em-Lf
	for openembedded-core@lists.openembedded.org;
	Fri, 23 Mar 2012 05:43:01 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 22 Mar 2012 21:34:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="122290802"
Received: from llu-piketon.sh.intel.com (HELO localhost) ([10.239.36.110])
	by azsmga001.ch.intel.com with ESMTP; 22 Mar 2012 21:34:04 -0700
From: Lianhao Lu <lianhao.lu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 23 Mar 2012 12:31:51 +0800
Message-Id: <27dab674140b90bbdbdfa7f76b9b7142717cf140.1332474082.git.lianhao.lu@intel.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <c1505ead113c0bac42d2481bbd75e1bf367bbfd2.1332474082.git.lianhao.lu@intel.com>
References: <c1505ead113c0bac42d2481bbd75e1bf367bbfd2.1332474082.git.lianhao.lu@intel.com>
In-Reply-To: <cover.1332474081.git.lianhao.lu@intel.com>
References: <cover.1332474081.git.lianhao.lu@intel.com>
Subject: [PATCH 4/5] nativesdk/misc: set PKGSUFFIX for correct variable name expansion.
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
X-List-Received-Date: Fri, 23 Mar 2012 04:43:02 -0000

Set PKGSUFFIX in nativesdk.bbclass for correct variable name expansion.
This would fix bunch of "not shipped" packaging warnings in "-nativesdk"
recipes. And also bumping the corresponding PR.

Signed-off-by: Lianhao Lu <lianhao.lu@intel.com>
---
 meta/classes/nativesdk.bbclass                  |    2 ++
 meta/recipes-core/eglibc/eglibc-locale.inc      |    2 +-
 meta/recipes-core/eglibc/eglibc_2.13.bb         |    2 +-
 meta/recipes-core/eglibc/eglibc_2.15.bb         |    2 +-
 meta/recipes-devtools/opkg/opkg.inc             |    2 +-
 meta/recipes-multimedia/alsa/alsa-lib_1.0.25.bb |    2 +-
 meta/recipes-support/sqlite/sqlite3_3.7.10.bb   |    2 +-
 7 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/meta/classes/nativesdk.bbclass b/meta/classes/nativesdk.bbclass
index ceec53e..97c460c 100644
--- a/meta/classes/nativesdk.bbclass
+++ b/meta/classes/nativesdk.bbclass
@@ -56,6 +56,8 @@ baselib = "lib"
 export PKG_CONFIG_DIR = "${STAGING_DIR_HOST}${libdir}/pkgconfig"
 export PKG_CONFIG_SYSROOT_DIR = "${STAGING_DIR_HOST}"
 
+PKGSUFFIX = "-nativesdk"
+
 python nativesdk_virtclass_handler () {
     if not isinstance(e, bb.event.RecipePreFinalise):
         return
diff --git a/meta/recipes-core/eglibc/eglibc-locale.inc b/meta/recipes-core/eglibc/eglibc-locale.inc
index 2e9b4d4..9d5434f 100644
--- a/meta/recipes-core/eglibc/eglibc-locale.inc
+++ b/meta/recipes-core/eglibc/eglibc-locale.inc
@@ -26,7 +26,7 @@ BINARY_LOCALE_ARCHES ?= "arm.* i[3-6]86 x86_64 powerpc mips"
 # set "0" for qemu emulation of native localedef for locale generation
 LOCALE_GENERATION_WITH_CROSS-LOCALEDEF = "1"
 
-PR = "r19"
+PR = "r20"
 
 PKGSUFFIX = ""
 PKGSUFFIX_virtclass-nativesdk = "-nativesdk"
diff --git a/meta/recipes-core/eglibc/eglibc_2.13.bb b/meta/recipes-core/eglibc/eglibc_2.13.bb
index a4f59b6..e02c80f 100644
--- a/meta/recipes-core/eglibc/eglibc_2.13.bb
+++ b/meta/recipes-core/eglibc/eglibc_2.13.bb
@@ -3,7 +3,7 @@ require eglibc.inc
 SRCREV = "15508"
 
 DEPENDS += "gperf-native"
-PR = "r21"
+PR = "r22"
 PR_append = "+svnr${SRCPV}"
 
 EGLIBC_BRANCH="eglibc-2_13"
diff --git a/meta/recipes-core/eglibc/eglibc_2.15.bb b/meta/recipes-core/eglibc/eglibc_2.15.bb
index 3820f5a..644d904 100644
--- a/meta/recipes-core/eglibc/eglibc_2.15.bb
+++ b/meta/recipes-core/eglibc/eglibc_2.15.bb
@@ -3,7 +3,7 @@ require eglibc.inc
 SRCREV = "16540"
 
 DEPENDS += "gperf-native"
-PR = "r1"
+PR = "r2"
 PR_append = "+svnr${SRCPV}"
 
 EGLIBC_BRANCH="eglibc-2_15"
diff --git a/meta/recipes-devtools/opkg/opkg.inc b/meta/recipes-devtools/opkg/opkg.inc
index 689bd4a..14083d0 100644
--- a/meta/recipes-devtools/opkg/opkg.inc
+++ b/meta/recipes-devtools/opkg/opkg.inc
@@ -11,7 +11,7 @@ DEPENDS_virtclass-native = "curl-native"
 DEPENDS_virtclass-nativesdk = "curl-nativesdk"
 
 PE = "1"
-INC_PR = "r8"
+INC_PR = "r9"
 
 FILESDIR = "${@os.path.dirname(d.getVar('FILE',1))}/opkg"
 
diff --git a/meta/recipes-multimedia/alsa/alsa-lib_1.0.25.bb b/meta/recipes-multimedia/alsa/alsa-lib_1.0.25.bb
index 90b0cba..b128d77 100644
--- a/meta/recipes-multimedia/alsa/alsa-lib_1.0.25.bb
+++ b/meta/recipes-multimedia/alsa/alsa-lib_1.0.25.bb
@@ -14,7 +14,7 @@ BBCLASSEXTEND = "native nativesdk"
 #FIXME: remove the following
 ARM_INSTRUCTION_SET = "arm"
 
-PR = "r0"
+PR = "r1"
 
 SRC_URI = "ftp://ftp.alsa-project.org/pub/lib/alsa-lib-${PV}.tar.bz2 \
            file://fix-tstamp-declaration.patch"
diff --git a/meta/recipes-support/sqlite/sqlite3_3.7.10.bb b/meta/recipes-support/sqlite/sqlite3_3.7.10.bb
index 25e2b24..ec6ded6 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.7.10.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.7.10.bb
@@ -1,6 +1,6 @@
 require sqlite3.inc
 
-PR = "r1"
+PR = "r2"
 
 LIC_FILES_CHKSUM = "file://sqlite3.h;endline=11;md5=65f0a57ca6928710b418c094b3570bb0"
 
-- 
1.7.0.4



