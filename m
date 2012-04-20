Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SLH7O-0005tX-SL
	for openembedded-core@lists.openembedded.org;
	Fri, 20 Apr 2012 18:55:35 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 20 Apr 2012 09:45:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="156167870"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.163])
	by fmsmga002.fm.intel.com with ESMTP; 20 Apr 2012 09:45:40 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Apr 2012 09:45:09 -0700
Message-Id: <9f51d8b38a154e2e21a7a877a3cb5c4cc9bc4f9e.1334940120.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1334940120.git.sgw@linux.intel.com>
References: <cover.1334940120.git.sgw@linux.intel.com>
In-Reply-To: <cover.1334940120.git.sgw@linux.intel.com>
References: <cover.1334940120.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 18/43] gzip: Use update-alternatives class
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
X-List-Received-Date: Fri, 20 Apr 2012 16:55:36 -0000

From: Mark Hatle <mark.hatle@windriver.com>

Switch to using the update-alternatives class.  Need this for
consistency and to ensure the necessary package provides get set.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/recipes-extended/gzip/gzip.inc       |   32 ++++++++--------------------
 meta/recipes-extended/gzip/gzip_1.3.12.bb |   24 +++++++--------------
 meta/recipes-extended/gzip/gzip_1.4.bb    |    2 +-
 3 files changed, 18 insertions(+), 40 deletions(-)

diff --git a/meta/recipes-extended/gzip/gzip.inc b/meta/recipes-extended/gzip/gzip.inc
index a449449..1d608a6 100644
--- a/meta/recipes-extended/gzip/gzip.inc
+++ b/meta/recipes-extended/gzip/gzip.inc
@@ -12,29 +12,15 @@ SRC_URI = "${GNU_MIRROR}/gzip/${BP}.tar.gz"
 
 inherit autotools
 
-do_install () {
-	autotools_do_install
-	if [ "${PN}" = "${BPN}" ] ; then
-		# Rename and move files into /bin (FHS), which is typical place for gzip
-		install -d ${D}${base_bindir}
-		mv ${D}${bindir}/gunzip ${D}${base_bindir}/gunzip.${PN}
-		mv ${D}${bindir}/gzip ${D}${base_bindir}/gzip.${PN}
-		mv ${D}${bindir}/zcat ${D}${base_bindir}/zcat.${PN}
-	fi
+do_install_append () {
+	# Rename and move files into /bin (FHS), which is typical place for gzip
+	install -d ${D}${base_bindir}
+	mv ${D}${bindir}/gunzip ${D}${base_bindir}/gunzip
+	mv ${D}${bindir}/gzip ${D}${base_bindir}/gzip
+	mv ${D}${bindir}/zcat ${D}${base_bindir}/zcat
 }
 
-pkg_postinst_${PN} () {
-	if [ "${PN}" = "${BPN}" ] ; then
-		update-alternatives --install ${base_bindir}/gunzip gunzip gunzip.${PN} 100
-		update-alternatives --install ${base_bindir}/gzip gzip gzip.${PN} 100
-		update-alternatives --install ${base_bindir}/zcat zcat zcat.${PN} 100
-	fi
-}
+inherit update-alternatives
 
-pkg_prerm_${PN} () {
-	if [ "${PN}" = "${BPN}" ] ; then
-		update-alternatives --remove gunzip gunzip.${PN}
-		update-alternatives --remove gzip gzip.${PN}
-		update-alternatives --remove zcat zcat.${PN}
-	fi
-}
+ALTERNATIVE_LINKS = "${base_bindir}/gunzip ${base_bindir}/gzip ${base_bindir}/zcat"
+ALTERNATIVE_PRIORITY = "100"
diff --git a/meta/recipes-extended/gzip/gzip_1.3.12.bb b/meta/recipes-extended/gzip/gzip_1.3.12.bb
index 2836942..6d18d47 100644
--- a/meta/recipes-extended/gzip/gzip_1.3.12.bb
+++ b/meta/recipes-extended/gzip/gzip_1.3.12.bb
@@ -16,29 +16,21 @@ SRC_URI = "${GNU_MIRROR}/gzip/gzip-${PV}.tar.gz \
 SRC_URI[md5sum] = "b5bac2d21840ae077e0217bc5e4845b1"
 SRC_URI[sha256sum] = "3f565be05f7f3d1aff117c030eb7c738300510b7d098cedea796ca8e4cd587af"
 
-PR = "r0"
+PR = "r1"
 
 inherit autotools
 
-do_install () {
-	autotools_do_install
+do_install_append () {
 	# move files into /bin (FHS)
 	install -d ${D}${base_bindir}
-	mv ${D}${bindir}/gunzip ${D}${base_bindir}/gunzip.${PN}
-	mv ${D}${bindir}/gzip ${D}${base_bindir}/gzip.${PN}
-	mv ${D}${bindir}/zcat ${D}${base_bindir}/zcat.${PN}
+	mv ${D}${bindir}/gunzip ${D}${base_bindir}/gunzip
+	mv ${D}${bindir}/gzip ${D}${base_bindir}/gzip
+	mv ${D}${bindir}/zcat ${D}${base_bindir}/zcat
 }
 
-pkg_postinst_${PN} () {
-	update-alternatives --install ${base_bindir}/gunzip gunzip gunzip.${PN} 100
-	update-alternatives --install ${base_bindir}/gzip gzip gzip.${PN} 100
-	update-alternatives --install ${base_bindir}/zcat zcat zcat.${PN} 100
-}
+inherit update-alternatives
 
-pkg_prerm_${PN} () {
-	update-alternatives --remove gunzip gunzip.${PN}
-	update-alternatives --remove gzip gzip.${PN}
-	update-alternatives --remove zcat zcat.${PN}
-}
+ALTERNATIVE_LINKS = "${base_bindir}/gunzip ${base_bindir}/gzip ${base_bindir}/zcat"
+ALTERNATIVE_PRIORITY = "100"
 
 BBCLASSEXTEND = "native"
diff --git a/meta/recipes-extended/gzip/gzip_1.4.bb b/meta/recipes-extended/gzip/gzip_1.4.bb
index 8f4a237..54dd50a 100644
--- a/meta/recipes-extended/gzip/gzip_1.4.bb
+++ b/meta/recipes-extended/gzip/gzip_1.4.bb
@@ -1,6 +1,6 @@
 require gzip.inc
 
-PR = "r1"
+PR = "r2"
 
 NATIVE_PACKAGE_PATH_SUFFIX = "/${PN}"
 
-- 
1.7.7.6



