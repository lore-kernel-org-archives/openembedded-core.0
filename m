Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RpOrW-0004vE-Ta
	for openembedded-core@lists.openembedded.org;
	Mon, 23 Jan 2012 19:43:27 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 23 Jan 2012 10:34:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="59212266"
Received: from unknown (HELO swold-mobl.lan) ([10.255.14.82])
	by AZSMGA002.ch.intel.com with ESMTP; 23 Jan 2012 10:34:42 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 Jan 2012 10:34:23 -0800
Message-Id: <d2302b594794087de484c3ea0ea6f4f18bf1e98d.1327343524.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <cover.1327343523.git.sgw@linux.intel.com>
References: <cover.1327343523.git.sgw@linux.intel.com>
In-Reply-To: <cover.1327343523.git.sgw@linux.intel.com>
References: <cover.1327343523.git.sgw@linux.intel.com>
Subject: [PATCH v2 18/21] eglibc: refactor packages for staticdev
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
X-List-Received-Date: Mon, 23 Jan 2012 18:43:27 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-core/eglibc/eglibc-package.inc |    9 ++++++---
 1 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/eglibc/eglibc-package.inc b/meta/recipes-core/eglibc/eglibc-package.inc
index 020f558..e5a9b9d 100644
--- a/meta/recipes-core/eglibc/eglibc-package.inc
+++ b/meta/recipes-core/eglibc/eglibc-package.inc
@@ -20,13 +20,14 @@ USE_LDCONFIG ?= "1"
 PKGSUFFIX = ""
 PKGSUFFIX_virtclass-nativesdk = "-nativesdk"
 
-PACKAGES = "${PN}-dbg ${PN} catchsegv${PKGSUFFIX} sln${PKGSUFFIX} nscd${PKGSUFFIX} ldd${PKGSUFFIX} ${PN}-utils eglibc-extra-nss${PKGSUFFIX} eglibc-thread-db${PKGSUFFIX} ${PN}-pic ${PN}-dev ${PN}-doc libcidn${PKGSUFFIX} libmemusage${PKGSUFFIX} libsegfault${PKGSUFFIX} ${PN}-pcprofile libsotruss${PKGSUFFIX}"
+PACKAGES = "${PN}-dbg ${PN} catchsegv${PKGSUFFIX} sln${PKGSUFFIX} nscd${PKGSUFFIX} ldd${PKGSUFFIX} ${PN}-utils eglibc-extra-nss${PKGSUFFIX} eglibc-thread-db${PKGSUFFIX} ${PN}-pic ${PN}-dev ${PN}-staticdev ${PN}-doc libcidn${PKGSUFFIX} libmemusage${PKGSUFFIX} libsegfault${PKGSUFFIX} ${PN}-pcprofile libsotruss${PKGSUFFIX}"
 
 # The ld.so in this eglibc supports the GNU_HASH
 RPROVIDES_${PN} = "glibc${PKGSUFFIX} rtld(GNU_HASH)"
 RPROVIDES_${PN}-utils = "glibc${PKGSUFFIX}-utils"
 RPROVIDES_${PN}-pic = "glibc${PKGSUFFIX}-pic"
 RPROVIDES_${PN}-dev = "glibc${PKGSUFFIX}-dev"
+RPROVIDES_${PN}-staticdev = "glibc${PKGSUFFIX}-staticdev"
 RPROVIDES_${PN}-doc = "glibc${PKGSUFFIX}-doc"
 RPROVIDES_eglibc-extra-nss${PKGSUFFIX} = "glibc-extra-nss${PKGSUFFIX}"
 RPROVIDES_eglibc-thread-db${PKGSUFFIX} = "glibc-thread-db${PKGSUFFIX}"
@@ -43,8 +44,9 @@ FILES_eglibc-extra-nss${PKGSUFFIX} = "${base_libdir}/libnss_*-*.so ${base_libdir
 FILES_sln${PKGSUFFIX} = "/sbin/sln"
 FILES_${PN}-pic = "${libdir}/*_pic.a ${libdir}/*_pic.map ${libdir}/libc_pic/"
 FILES_libsotruss${PKGSUFFIX} = "${libdir}/audit/sotruss-lib.so"
-FILES_${PN}-dev_append += "${bindir}/rpcgen ${libdir}/*.a \
-	${base_libdir}/*.a ${base_libdir}/*.o ${datadir}/aclocal"
+FILES_${PN}-dev_append += "${bindir}/rpcgen ${libdir}/*_nonshared.a \
+	${base_libdir}/*_nonshared.a ${base_libdir}/*.o ${datadir}/aclocal"
+FILES_${PN}-staticdev_append += "${libdir}/*.a ${base_libdir}/*.a"
 FILES_nscd${PKGSUFFIX} = "${sbindir}/nscd*"
 FILES_${PN}-utils = "${bindir}/* ${sbindir}/*"
 FILES_${PN}-dbg += "${libexecdir}/*/.debug ${libdir}/audit/.debug"
@@ -54,6 +56,7 @@ RDEPENDS_${PN}-utils += "bash"
 FILES_${PN}-pcprofile = "${base_libdir}/libpcprofile.so"
 FILES_eglibc-thread-db${PKGSUFFIX} = "${base_libdir}/libthread_db.so.* ${base_libdir}/libthread_db-*.so"
 RPROVIDES_${PN}-dev += "libc-dev"
+RPROVIDES_${PN}-staticdev += "libc-staticdev"
 
 SUMMARY_sln = "The static ln."
 DESCRIPTION_sln = "Similar to the 'ln' utility, but statically linked.  sln is useful to make symbolic links to dynamic libraries if the dynamic linking system, for some reason, is not functional."
-- 
1.7.6.5



