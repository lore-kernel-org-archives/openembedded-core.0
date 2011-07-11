Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QgPjS-0005fR-LW
	for openembedded-core@lists.openembedded.org;
	Tue, 12 Jul 2011 01:17:43 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 11 Jul 2011 16:13:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,517,1304319600"; d="scan'208";a="26491841"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.13.180])
	by orsmga001.jf.intel.com with ESMTP; 11 Jul 2011 16:13:42 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Jul 2011 16:13:30 -0700
Message-Id: <e5fe3daf894671d811f8596b427b980d6ead363f.1310425837.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1310425837.git.sgw@linux.intel.com>
References: <cover.1310425837.git.sgw@linux.intel.com>
In-Reply-To: <cover.1310425837.git.sgw@linux.intel.com>
References: <cover.1310425837.git.sgw@linux.intel.com>
Subject: [PATCH 23/26] glibc: Use bitbake default FILES for packaging
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
X-List-Received-Date: Mon, 11 Jul 2011 23:17:46 -0000

This will ensure correct -dev and -staticdev packging

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-core/glibc/glibc-package.inc |   12 ++++++++----
 1 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-core/glibc/glibc-package.inc b/meta/recipes-core/glibc/glibc-package.inc
index c1c3853..5337de5 100644
--- a/meta/recipes-core/glibc/glibc-package.inc
+++ b/meta/recipes-core/glibc/glibc-package.inc
@@ -20,13 +20,14 @@ PKGSUFFIX_virtclass-nativesdk = "-nativesdk"
 PACKAGES = "${PN}-dbg ${PN} catchsegv${PKGSUFFIX} sln${PKGSUFFIX} nscd${PKGSUFFIX} \
 	ldd${PKGSUFFIX} ${PN}-utils ${PN}-dev ${PN}-doc \
 	libsegfault${PKGSUFFIX} ${PN}-extra-nss ${PN}-thread-db \
-	${PN}-pcprofile"
+	${PN}-pcprofile ${PN}-staticdev"
 
 libc_baselibs = "${base_libdir}/libc* ${base_libdir}/libm* ${base_libdir}/ld* \
 	${base_libdir}/libpthread* ${base_libdir}/libresolv* ${base_libdir}/librt* \
 	${base_libdir}/libutil* ${base_libdir}/libnsl* ${base_libdir}/libnss_files* \
 	${base_libdir}/libnss_compat* ${base_libdir}/libnss_dns* ${base_libdir}/libdl* \
-	${base_libdir}/libanl* ${base_libdir}/libBrokenLocale*"
+	${base_libdir}/libanl* ${base_libdir}/libBrokenLocale* \
+        ${base_libdir}/lib*nonshared.a"
 
 # The problem is that if PN = "glibc", FILES_${PN} will overwrite FILES_glibc
 # Solution: Make them both the same thing, then it doesn't matter
@@ -37,8 +38,9 @@ glibcdbgfiles = "${bindir}/.debug ${sbindir}/.debug ${libdir}/.debug \
                   ${base_bindir}/.debug ${base_sbindir}/.debug ${base_libdir}/.debug \
                   ${libdir}/gconv/.debug ${libexecdir}/*/.debug"
 glibcdevfiles = "${bindir}/rpcgen ${includedir} ${libdir}/lib*${SOLIBSDEV} ${libdir}/*.la \
-                ${libdir}/*.a ${libdir}/*.o ${libdir}/pkgconfig \
-                ${base_libdir}/*.a ${base_libdir}/*.o ${datadir}/aclocal"
+                ${libdir}/*.o ${libdir}/pkgconfig ${base_libdir}/*.o ${datadir}/aclocal"
+
+glibcstaticdev = "${libdir}/*.a ${base_libdir}/*.a"
 
 FILES_glibc = "${glibcfiles}"
 FILES_${PN} = "${glibcfiles}"
@@ -48,6 +50,8 @@ FILES_glibc-extra-nss = "${base_libdir}/libnss*"
 FILES_sln = "${base_sbindir}/sln"
 FILES_glibc-dev = "${glibcdevfiles}"
 FILES_${PN}-dev = "${glibcdevfiles}"
+FILES_glibc-staticdev = "${glibcstaticdev}"
+FILES_${PN}-staticdev = "${glibcstaticdev}"
 FILES_glibc-dbg = "${glibcdbgfiles}"
 FILES_${PN}-dbg = "${glibcdbgfiles}"
 FILES_nscd${PKGSUFFIX} = "${sbindir}/nscd* ${sysconfdir}/nscd* ${sysconfdir}/init.d/nscd*"
-- 
1.7.3.4



