Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Kai.Kang@windriver.com>) id 1QjoF1-00026E-M9
	for openembedded-core@lists.openembedded.org;
	Thu, 21 Jul 2011 10:04:20 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p6L80B35017283
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 21 Jul 2011 01:00:11 -0700 (PDT)
Received: from localhost (128.224.162.154) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Thu, 21 Jul 2011 01:00:11 -0700
Message-ID: <fb9463e2c0dc7d1d378b0954bf65502c27cb2ddc.1311234759.git.kai.kang@windriver.com>
In-Reply-To: <cover.1311234759.git.kai.kang@windriver.com>
References: <cover.1311234759.git.kai.kang@windriver.com>
Old-Date: Tue, 19 Jul 2011 17:08:31 +0800
Date: Thu, 21 Jul 2011 16:00:18 +0800
To: <scott.a.garman@intel.com>
From: Kang Kai <kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.154]
Cc: Wenzong, openembedded-core@lists.openembedded.org
Subject: [PATCH 01/10] libpam: update to 1.1.4 and add subpackage xtests
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
X-List-Received-Date: Thu, 21 Jul 2011 08:04:20 -0000
Content-Type: text/plain

From: Kang Kai <kai.kang@windriver.com>

Update libpam to 1.1.4, and add dependecy cracklib because run xtexts will
need pam-plugin-cracklib.
There are some additional checks under subdirectory xtests and make it
as a subpackage libpam-xtests.

Signed-off-by: Kang Kai <kai.kang@windriver.com>
---
 .../pam/libpam/libpam-xtests.patch                 |   35 ++++++++++++++++++++
 .../pam/{libpam_1.1.3.bb => libpam_1.1.4.bb}       |   14 +++++---
 2 files changed, 44 insertions(+), 5 deletions(-)
 create mode 100644 meta/recipes-extended/pam/libpam/libpam-xtests.patch
 rename meta/recipes-extended/pam/{libpam_1.1.3.bb => libpam_1.1.4.bb} (85%)

diff --git a/meta/recipes-extended/pam/libpam/libpam-xtests.patch b/meta/recipes-extended/pam/libpam/libpam-xtests.patch
new file mode 100644
index 0000000..be68745
--- /dev/null
+++ b/meta/recipes-extended/pam/libpam/libpam-xtests.patch
@@ -0,0 +1,35 @@
+This patch is used to create a new sub package libpam-xtests to do more checks.
+
+Upstream-Status: Pending
+
+Signed-off-by: Kang Kai <kai.kang@windriver.com>
+--- Linux-PAM-1.1.4/xtests/Makefile.am.orig	2011-07-19 17:00:09.619980001 +0800
++++ Linux-PAM-1.1.4/xtests/Makefile.am	2011-07-19 16:54:00.229979998 +0800
+@@ -7,7 +7,7 @@
+ AM_LDFLAGS = -L$(top_builddir)/libpam -lpam \
+ 	-L$(top_builddir)/libpam_misc -lpam_misc
+ 
+-CLEANFILES = *~ $(XTESTS)
++CLEANFILES = *~
+ 
+ EXTRA_DIST = run-xtests.sh tst-pam_dispatch1.pamd tst-pam_dispatch2.pamd \
+ 	tst-pam_dispatch3.pamd tst-pam_dispatch4.pamd \
+@@ -51,3 +51,18 @@
+ 
+ xtests: $(XTESTS) run-xtests.sh
+ 	"$(srcdir)"/run-xtests.sh "$(srcdir)" ${XTESTS} ${NOSRCTESTS}
++
++all: $(XTESTS)
++
++install: install_xtests
++
++install_xtests:
++	$(INSTALL) -d $(DESTDIR)$(pkgdatadir)/xtests
++	for file in $(EXTRA_DIST) ; do \
++		$(INSTALL) $$file $(DESTDIR)$(pkgdatadir)/xtests ; \
++	done
++	for file in $(XTESTS); do \
++		$(INSTALL) .libs/$$file $(DESTDIR)$(pkgdatadir)/xtests ; \
++	done
++
++.PHONY: all install_xtests
diff --git a/meta/recipes-extended/pam/libpam_1.1.3.bb b/meta/recipes-extended/pam/libpam_1.1.4.bb
similarity index 85%
rename from meta/recipes-extended/pam/libpam_1.1.3.bb
rename to meta/recipes-extended/pam/libpam_1.1.4.bb
index b62e2f2..f2379e4 100644
--- a/meta/recipes-extended/pam/libpam_1.1.3.bb
+++ b/meta/recipes-extended/pam/libpam_1.1.4.bb
@@ -11,18 +11,21 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=ca0395de9a86191a078b8b79302e3083"
 
 PR = "r0"
 
-DEPENDS = "bison flex"
+DEPENDS = "bison flex cracklib"
 RDEPENDS_${PN}-runtime = "libpam pam-plugin-deny pam-plugin-permit pam-plugin-warn pam-plugin-unix"
+RDEPENDS_${PN}-xtests = "libpam pam-plugin-access pam-plugin-debug pam-plugin-cracklib pam-plugin-pwhistory \
+						pam-plugin-succeed-if pam-plugin-time coreutils"
 RRECOMMENDS_${PN} = "libpam-runtime"
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/libs/pam/library/Linux-PAM-${PV}.tar.bz2 \
            file://99_pam \
-           file://pam.d/*"
+           file://pam.d/* \
+		   file://libpam-xtests.patch"
 
 SRC_URI_append_libc-uclibc = " file://pam-no-innetgr.patch"
 
-SRC_URI[md5sum] = "6db7fcb5db6253350e3a4648ceac40e7"
-SRC_URI[sha256sum] = "17b268789b935a76e736a1150210dd12f156972973e79347668f828d43632652"
+SRC_URI[md5sum] = "e9af5fb27bb22edb55d077e2888b3ebc"
+SRC_URI[sha256sum] = "ccd89331914390b1e9e99c954471d65f19b660d81e15a46eeb96cee125d44056"
 
 EXTRA_OECONF = "--with-db-uniquename=_pam \
                 --includedir=${includedir}/security \
@@ -34,12 +37,13 @@ S = "${WORKDIR}/Linux-PAM-${PV}"
 
 inherit autotools gettext
 
-PACKAGES += "${PN}-runtime"
+PACKAGES += "${PN}-runtime ${PN}-xtests"
 FILES_${PN} = "${base_libdir}/lib*${SOLIBS}"
 FILES_${PN}-dbg += "${base_libdir}/security/.debug \
                     ${base_libdir}/security/pam_filter/.debug"
 FILES_${PN}-dev += "${base_libdir}/security/*.la ${base_libdir}/*.la ${base_libdir}/lib*${SOLIBSDEV}"
 FILES_${PN}-runtime = "${sysconfdir}"
+FILES_${PN}-xtests = "${datadir}/Linux-PAM/xtests"
 
 PACKAGES_DYNAMIC += " pam-plugin-*"
 
-- 
1.7.5.1.300.gc565c



