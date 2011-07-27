Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QlyuO-00028l-5i
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Jul 2011 09:52:00 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 27 Jul 2011 00:47:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,275,1309762800"; d="scan'208";a="31949315"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.14.61])
	by azsmga001.ch.intel.com with ESMTP; 27 Jul 2011 00:47:30 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Jul 2011 00:47:03 -0700
Message-Id: <fabc9a454fc822aa6d6d77b89d78eb502dd63fac.1311752531.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1311752531.git.sgw@linux.intel.com>
References: <cover.1311752531.git.sgw@linux.intel.com>
In-Reply-To: <cover.1311752531.git.sgw@linux.intel.com>
References: <cover.1311752531.git.sgw@linux.intel.com>
Subject: [Consolidated & Tested 13/35] libpam: update to 1.1.4 and add subpackage xtests
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
X-List-Received-Date: Wed, 27 Jul 2011 07:52:00 -0000

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
index b62e2f2..59fbdcd 100644
--- a/meta/recipes-extended/pam/libpam_1.1.3.bb
+++ b/meta/recipes-extended/pam/libpam_1.1.4.bb
@@ -11,18 +11,21 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=ca0395de9a86191a078b8b79302e3083"
 
 PR = "r0"
 
-DEPENDS = "bison flex"
+DEPENDS = "bison flex cracklib"
 RDEPENDS_${PN}-runtime = "libpam pam-plugin-deny pam-plugin-permit pam-plugin-warn pam-plugin-unix"
+RDEPENDS_${PN}-xtests = "libpam pam-plugin-access pam-plugin-debug pam-plugin-cracklib pam-plugin-pwhistory \
+                        pam-plugin-succeed-if pam-plugin-time coreutils"
 RRECOMMENDS_${PN} = "libpam-runtime"
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/libs/pam/library/Linux-PAM-${PV}.tar.bz2 \
            file://99_pam \
-           file://pam.d/*"
+           file://pam.d/* \
+           file://libpam-xtests.patch"
 
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
1.7.3.4



