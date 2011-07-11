Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QgPjR-0005bH-Jm
	for openembedded-core@lists.openembedded.org;
	Tue, 12 Jul 2011 01:17:42 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 11 Jul 2011 16:13:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,517,1304319600"; d="scan'208";a="26491815"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.13.180])
	by orsmga001.jf.intel.com with ESMTP; 11 Jul 2011 16:13:39 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Jul 2011 16:13:21 -0700
Message-Id: <f5be3f07f8372f657d248c739a666cf25fff06a4.1310425837.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1310425837.git.sgw@linux.intel.com>
References: <cover.1310425837.git.sgw@linux.intel.com>
In-Reply-To: <cover.1310425837.git.sgw@linux.intel.com>
References: <cover.1310425837.git.sgw@linux.intel.com>
Subject: [PATCH 14/26] tcp-wrappers: Use bitbake default FILES for packaging
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
X-List-Received-Date: Mon, 11 Jul 2011 23:17:45 -0000

This will ensure correct -dev and -staticdev packging

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../tcp-wrappers/tcp-wrappers_7.6.bb               |   17 ++++++++++-------
 1 files changed, 10 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb b/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb
index 1aeb9ff..1acb15a 100644
--- a/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb
+++ b/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb
@@ -5,13 +5,16 @@ SECTION = "console/network"
 
 LICENSE = "tcp-wrappers"
 LIC_FILES_CHKSUM = "file://DISCLAIMER;md5=071bd69cb78b18888ea5e3da5c3127fa"
-PR ="r0"
+PR ="r1"
 
 
-PACKAGES = "${PN}-dbg libwrap libwrap-doc libwrap-dev tcp-wrappers tcp-wrappers-doc"
-FILES_libwrap = "${base_libdir}/lib*.so.*"
+PACKAGES = "${PN}-dbg libwrap libwrap-doc libwrap-dev libwrap-staticdev \
+            tcp-wrappers tcp-wrappers-doc"
+FILES_libwrap = "${base_libdir}/lib*${SOLIBS}
 FILES_libwrap-doc = "${mandir}/man3 ${mandir}/man5"
-FILES_libwrap-dev = "${libdir}/lib*.so ${libdir}/lib*.a ${includedir}"
+FILES_libwrap-dev = "${libdir}/lib*${SOLIBSDEV} ${includedir}"
+FILES_libwrap-staticdev = "${libdir}/lib*.a"
+RDEPENDS_libwrap-staticdev = "libwrap-dev (= ${EXTENDPKGV})"
 FILES_tcp-wrappers = "${bindir}"
 FILES_tcp-wrappers-doc = "${mandir}/man8"
 
@@ -86,9 +89,9 @@ do_install () {
 	oe_libinstall -C shared -so libwrap ${D}${base_libdir}
 
 	rel_lib_prefix=`echo ${libdir} | sed 's,\(^/\|\)[^/][^/]*,..,g'`
-	libname=`readlink ${D}${base_libdir}/libwrap.so | xargs basename`
-	ln -s ${rel_lib_prefix}${base_libdir}/${libname} ${D}${libdir}/libwrap.so
-	rm -f ${D}${base_libdir}/libwrap.so
+	libname=`readlink ${D}${base_libdir}/libwrap${SOLIBSDEV} | xargs basename`
+	ln -s ${rel_lib_prefix}${base_libdir}/${libname} ${D}${libdir}/libwrap${SOLIBSDEV}
+	rm -f ${D}${base_libdir}/libwrap${SOLIBSDEV}
 
 	install -d ${D}${sbindir}
 	for b in ${BINS}; do
-- 
1.7.3.4



