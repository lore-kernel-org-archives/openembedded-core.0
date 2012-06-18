Received: from masterfoo.zenlinux.com ([207.192.74.254])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1SgiFs-0008TU-0R
	for openembedded-core@lists.openembedded.org;
	Mon, 18 Jun 2012 22:08:56 +0200
Received: from localhost (c-76-105-137-48.hsd1.or.comcast.net [76.105.137.48])
	(using TLSv1 with cipher DHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by masterfoo.zenlinux.com (Postfix) with ESMTP id 9780930461
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jun 2012 15:58:08 -0400 (EDT)
From: Scott Garman <scott.a.garman@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 18 Jun 2012 12:57:58 -0700
Message-Id: <4e4c4d1748dbc3592569bedc07c8b46f60307ace.1340038108.git.scott.a.garman@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1340038108.git.scott.a.garman@intel.com>
References: <cover.1340038108.git.scott.a.garman@intel.com>
In-Reply-To: <cover.1340038108.git.scott.a.garman@intel.com>
References: <cover.1340038108.git.scott.a.garman@intel.com>
X-MasterFoo-MailScanner-Information: Please contact the ISP for more
	information
X-MailScanner-ID: 9780930461.8457D
X-MasterFoo-MailScanner: Found to be clean
X-MasterFoo-MailScanner-SpamCheck: not spam
X-MasterFoo-MailScanner-From: scott.a.garman@intel.com
X-Spam-Status: No
Subject: [PATCH 4/6] eglibc: package mtrace separately
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
X-List-Received-Date: Mon, 18 Jun 2012 20:08:56 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

add libc-mtrace as dependency for task-core-tools-debug

now eglibc-mtrace gets included in an sdk image and not in a non-sdk image.

This does not affect builds with uclibc.

This fixes bug: [YOCTO# 2374]

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 meta/recipes-core/eglibc/eglibc-package.inc      |    7 ++++++-
 meta/recipes-core/eglibc/eglibc_2.13.bb          |    2 +-
 meta/recipes-core/tasks/task-core-tools-debug.bb |    4 ++++
 3 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/eglibc/eglibc-package.inc b/meta/recipes-core/eglibc/eglibc-package.inc
index 0db221f..3c371a7 100644
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
diff --git a/meta/recipes-core/tasks/task-core-tools-debug.bb b/meta/recipes-core/tasks/task-core-tools-debug.bb
index 3c92f3f..1dddbb8 100644
--- a/meta/recipes-core/tasks/task-core-tools-debug.bb
+++ b/meta/recipes-core/tasks/task-core-tools-debug.bb
@@ -17,10 +17,14 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 ALLOW_EMPTY = "1"
 
+MTRACE = ""
+MTRACE_libc-glibc = "libc-mtrace"
+
 RDEPENDS_${PN} = "\
     gdb \
     gdbserver \
     tcf-agent \
     rsync \
     strace \
+    ${MTRACE} \
     "
-- 
1.7.9.5



