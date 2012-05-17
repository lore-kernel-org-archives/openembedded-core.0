Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1SV9wc-0008I9-Bh
	for openembedded-core@lists.openembedded.org;
	Fri, 18 May 2012 01:17:18 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 17 May 2012 16:07:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="101403797"
Received: from nbuild0.sc.intel.com ([172.25.110.36])
	by AZSMGA002.ch.intel.com with ESMTP; 17 May 2012 16:07:14 -0700
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 May 2012 16:07:13 -0700
Message-Id: <bce112d0eb42badfca77109b40cf2c86ca3efa48.1337295951.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <cover.1337295951.git.nitin.a.kamble@intel.com>
References: <cover.1337295951.git.nitin.a.kamble@intel.com>
Subject: [PATCH 1/1] eglibc: package mtrace separately
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
X-List-Received-Date: Thu, 17 May 2012 23:17:18 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

add libc-mtrace as dependency for task-core-tools-debug

now eglibc-mtrace gets included in an sdk image and not in a non-sdk image.

make uclibc recipe lie about providing libc-mtrace to satisfy the dependency

This fixes bug: [YOCTO# 2374]

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 meta/recipes-core/eglibc/eglibc-package.inc      |    7 ++++++-
 meta/recipes-core/eglibc/eglibc_2.13.bb          |    2 +-
 meta/recipes-core/eglibc/eglibc_2.15.bb          |    2 +-
 meta/recipes-core/tasks/task-core-tools-debug.bb |    1 +
 meta/recipes-core/uclibc/uclibc.inc              |    2 +-
 5 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-core/eglibc/eglibc-package.inc b/meta/recipes-core/eglibc/eglibc-package.inc
index 7d97567..ce37155 100644
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
+RPROVIDES_${PN}-mtrace = "glibc${PKGSUFFIX}-mtrace libc-mtrace"
 RPROVIDES_${PN}-pic = "glibc${PKGSUFFIX}-pic"
 RPROVIDES_${PN}-dev = "glibc${PKGSUFFIX}-dev"
 RPROVIDES_${PN}-staticdev = "glibc${PKGSUFFIX}-staticdev"
@@ -48,11 +49,13 @@ FILES_${PN}-dev_append += "${bindir}/rpcgen ${libdir}/*_nonshared.a \
 	${base_libdir}/*_nonshared.a ${base_libdir}/*.o ${datadir}/aclocal"
 FILES_${PN}-staticdev_append += "${libdir}/*.a ${base_libdir}/*.a"
 FILES_nscd${PKGSUFFIX} = "${sbindir}/nscd*"
+FILES_${PN}-mtrace = "${bindir}/mtrace"
 FILES_${PN}-utils = "${bindir}/* ${sbindir}/*"
 FILES_${PN}-dbg += "${libexecdir}/*/.debug ${libdir}/audit/.debug"
 FILES_catchsegv${PKGSUFFIX} = "${bindir}/catchsegv"
 RDEPENDS_catchsegv${PKGSUFFIX} = "libsegfault"
 RDEPENDS_${PN}-utils += "bash"
+RDEPENDS_${PN}-mtrace += "perl"
 FILES_${PN}-pcprofile = "${base_libdir}/libpcprofile.so"
 FILES_eglibc-thread-db${PKGSUFFIX} = "${base_libdir}/libthread_db.so.* ${base_libdir}/libthread_db-*.so"
 RPROVIDES_${PN}-dev += "libc-dev"
@@ -68,6 +71,8 @@ SUMMARY_ldd = "print shared library dependencies"
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
index 340ec99..bb60b57 100644
--- a/meta/recipes-core/eglibc/eglibc_2.15.bb
+++ b/meta/recipes-core/eglibc/eglibc_2.15.bb
@@ -3,7 +3,7 @@ require eglibc.inc
 SRCREV = "17386"
 
 DEPENDS += "gperf-native"
-PR = "r10"
+PR = "r11"
 PR_append = "+svnr${SRCPV}"
 
 EGLIBC_BRANCH="eglibc-2_15"
diff --git a/meta/recipes-core/tasks/task-core-tools-debug.bb b/meta/recipes-core/tasks/task-core-tools-debug.bb
index 3c92f3f..3970f14 100644
--- a/meta/recipes-core/tasks/task-core-tools-debug.bb
+++ b/meta/recipes-core/tasks/task-core-tools-debug.bb
@@ -23,4 +23,5 @@ RDEPENDS_${PN} = "\
     tcf-agent \
     rsync \
     strace \
+    libc-mtrace \
     "
diff --git a/meta/recipes-core/uclibc/uclibc.inc b/meta/recipes-core/uclibc/uclibc.inc
index 55ab0c9..afc0ed5 100644
--- a/meta/recipes-core/uclibc/uclibc.inc
+++ b/meta/recipes-core/uclibc/uclibc.inc
@@ -89,7 +89,7 @@ RPROVIDES_${PN}-dev += "libc-dev virtual-libc-dev"
 # going to work. So we pretend that we have it to make bitbake not pull other recipes
 # to satisfy this dependency for the images/tasks
 
-RPROVIDES_uclibc += "libsegfault rtld(GNU_HASH)"
+RPROVIDES_uclibc += "libsegfault rtld(GNU_HASH) libc-mtrace"
 
 SRC_URI = "\
         http://www.uclibc.org/downloads/uClibc-${PV}.tar.bz2;name=uClibc-${PV} \
-- 
1.7.7



