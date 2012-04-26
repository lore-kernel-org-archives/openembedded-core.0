Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1SNXiE-0000Wg-JM
	for openembedded-core@lists.openembedded.org;
	Fri, 27 Apr 2012 01:02:58 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 26 Apr 2012 15:53:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="158831712"
Received: from nbuild0.sc.intel.com ([172.25.110.36])
	by fmsmga002.fm.intel.com with ESMTP; 26 Apr 2012 15:53:20 -0700
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org
Date: Thu, 26 Apr 2012 15:53:18 -0700
Message-Id: <385b9b6d43ea3d98d355edc50989d2e0ab488cd7.1335480719.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <cover.1335480719.git.nitin.a.kamble@intel.com>
References: <cover.1335480719.git.nitin.a.kamble@intel.com>
Subject: [PATCH 1/2] eglibc: package mtrace separately
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
X-List-Received-Date: Thu, 26 Apr 2012 23:02:58 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

And install it only for nativesdk images

This fixes bug: [YOCTO# 2374]

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 meta/recipes-core/eglibc/eglibc-package.inc |    8 +++++++-
 meta/recipes-core/eglibc/eglibc_2.13.bb     |    2 +-
 meta/recipes-core/eglibc/eglibc_2.15.bb     |    2 +-
 3 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/eglibc/eglibc-package.inc b/meta/recipes-core/eglibc/eglibc-package.inc
index 0db221f..e199901 100644
--- a/meta/recipes-core/eglibc/eglibc-package.inc
+++ b/meta/recipes-core/eglibc/eglibc-package.inc
@@ -20,11 +20,12 @@ USE_LDCONFIG ?= "1"
 PKGSUFFIX = ""
 PKGSUFFIX_virtclass-nativesdk = "-nativesdk"
 
-PACKAGES = "${PN}-dbg ${PN} catchsegv${PKGSUFFIX} sln${PKGSUFFIX} nscd${PKGSUFFIX} ldd${PKGSUFFIX} ${PN}-utils eglibc-extra-nss${PKGSUFFIX} eglibc-thread-db${PKGSUFFIX} ${PN}-pic ${PN}-dev ${PN}-staticdev ${PN}-doc libcidn${PKGSUFFIX} libmemusage${PKGSUFFIX} libsegfault${PKGSUFFIX} ${PN}-pcprofile libsotruss${PKGSUFFIX}"
+PACKAGES = "${PN}-dbg ${PN} catchsegv${PKGSUFFIX} sln${PKGSUFFIX} nscd${PKGSUFFIX} ldd${PKGSUFFIX} ${PN}-mtrace ${PN}-utils eglibc-extra-nss${PKGSUFFIX} eglibc-thread-db${PKGSUFFIX} ${PN}-pic ${PN}-dev ${PN}-staticdev ${PN}-doc libcidn${PKGSUFFIX} libmemusage${PKGSUFFIX} libsegfault${PKGSUFFIX} ${PN}-pcprofile libsotruss${PKGSUFFIX}"
 
 # The ld.so in this eglibc supports the GNU_HASH
 RPROVIDES_${PN} = "glibc${PKGSUFFIX} rtld(GNU_HASH)"
 RPROVIDES_${PN}-utils = "glibc${PKGSUFFIX}-utils"
+RPROVIDES_${PN}-mtrace = "glibc${PKGSUFFIX}-mtrace"
 RPROVIDES_${PN}-pic = "glibc${PKGSUFFIX}-pic"
 RPROVIDES_${PN}-dev = "glibc${PKGSUFFIX}-dev"
 RPROVIDES_${PN}-staticdev = "glibc${PKGSUFFIX}-staticdev"
@@ -48,11 +49,14 @@ FILES_${PN}-dev_append += "${bindir}/rpcgen ${libdir}/*_nonshared.a \
 	${base_libdir}/*_nonshared.a ${base_libdir}/*.o ${datadir}/aclocal"
 FILES_${PN}-staticdev_append += "${libdir}/*.a ${base_libdir}/*.a"
 FILES_nscd${PKGSUFFIX} = "${sbindir}/nscd*"
+FILES_${PN}-mtrace = "${bindir}/mtrace"
 FILES_${PN}-utils = "${bindir}/* ${sbindir}/*"
 FILES_${PN}-dbg += "${libexecdir}/*/.debug ${libdir}/audit/.debug"
 FILES_catchsegv${PKGSUFFIX} = "${bindir}/catchsegv"
 RDEPENDS_catchsegv${PKGSUFFIX} = "libsegfault"
 RDEPENDS_${PN}-utils += "bash"
+RDEPENDS_${PN}-utils_virtclass-nativesdk += "${PN}-mtrace"
+RDEPENDS_${PN}-mtrace += "perl"
 FILES_${PN}-pcprofile = "${base_libdir}/libpcprofile.so"
 FILES_eglibc-thread-db${PKGSUFFIX} = "${base_libdir}/libthread_db.so.* ${base_libdir}/libthread_db-*.so"
 RPROVIDES_${PN}-dev += "libc-dev"
@@ -68,6 +72,8 @@ SUMMARY_ldd = "print shared library dependencies"
 DESCRIPTION_ldd = "/usr/bin/ldd prints shared library dependencies for each program or shared library specified on the command line."
 SUMMARY_${PN}-utils = "Miscellaneous utilities provided by eglibc"
 DESCRIPTION_${PN}-utils = "Miscellaneous utilities including getconf, iconf, locale, gencat, tzselect, zic, rpcinfo, ..."
+SUMMARY_${PN}-mtrace = "mtrace utility provided by eglibc"
+DESCRIPTION_${PN}-mtrace = "mtrace utility provided by eglibc"
 DESCRIPTION_libsotruss = "Library to support sotruss which traces calls through PLTs"
 
 inherit libc-common multilib_header
diff --git a/meta/recipes-core/eglibc/eglibc_2.13.bb b/meta/recipes-core/eglibc/eglibc_2.13.bb
index d8a41dc..73cd0aa 100644
--- a/meta/recipes-core/eglibc/eglibc_2.13.bb
+++ b/meta/recipes-core/eglibc/eglibc_2.13.bb
@@ -3,7 +3,7 @@ require eglibc.inc
 SRCREV = "15508"
 
 DEPENDS += "gperf-native"
-PR = "r26"
+PR = "r27"
 PR_append = "+svnr${SRCPV}"
 
 EGLIBC_BRANCH="eglibc-2_13"
diff --git a/meta/recipes-core/eglibc/eglibc_2.15.bb b/meta/recipes-core/eglibc/eglibc_2.15.bb
index 713efc3..f5219d1 100644
--- a/meta/recipes-core/eglibc/eglibc_2.15.bb
+++ b/meta/recipes-core/eglibc/eglibc_2.15.bb
@@ -3,7 +3,7 @@ require eglibc.inc
 SRCREV = "17386"
 
 DEPENDS += "gperf-native"
-PR = "r6"
+PR = "r7"
 PR_append = "+svnr${SRCPV}"
 
 EGLIBC_BRANCH="eglibc-2_15"
-- 
1.7.7



