Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1R04Ff-0007MM-Dx
	for openembedded-core@lists.openembedded.org;
	Sun, 04 Sep 2011 06:24:11 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 03 Sep 2011 21:19:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,326,1312182000"; d="scan'208";a="47948257"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.14.30])
	by fmsmga001.fm.intel.com with ESMTP; 03 Sep 2011 21:19:11 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  3 Sep 2011 21:19:08 -0700
Message-Id: <caa8600f67f2835bab295f08c0691c065f95dbf9.1315109841.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <cover.1315109841.git.sgw@linux.intel.com>
References: <cover.1315109841.git.sgw@linux.intel.com>
In-Reply-To: <cover.1315109841.git.sgw@linux.intel.com>
References: <cover.1315109841.git.sgw@linux.intel.com>
Subject: [PATCH 2/2] opensp: Fix sstate relocation issue
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
X-List-Received-Date: Sun, 04 Sep 2011 04:24:11 -0000

[YOCTO #1439]

This fixes a problem where the native nsgmls has a path hard coded into
it, therefor add a wrapper to set the environment with the correct
paths for catalog files.

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-devtools/opensp/opensp_1.5.bb |    9 ++++++++-
 1 files changed, 8 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-devtools/opensp/opensp_1.5.bb b/meta/recipes-devtools/opensp/opensp_1.5.bb
index a402d11..0269c87 100644
--- a/meta/recipes-devtools/opensp/opensp_1.5.bb
+++ b/meta/recipes-devtools/opensp/opensp_1.5.bb
@@ -5,7 +5,7 @@ SECTION = "libs"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=641ff1e4511f0a87044ad42f87cb1045"
 
-PR = "r1"
+PR = "r2"
 
 # At -Os it encounters calls to some inline functions which are then
 # not found in any other objects with gcc 4.5
@@ -42,6 +42,13 @@ do_install_append() {
 	ln -sf osx sgml2xml
 }
 
+do_install_append_virtclass-native() {
+	for util in nsgmls sgmlnorm spam spcat spent sx; do
+		create_wrapper ${D}/${bindir}/$util \
+		    SGML_CATALOG_FILES=${sysconfdir}/sgml/catalog 
+	done
+}
+
 FILES_${PN} += "${datadir}/OpenSP/"
 
 BBCLASSEXTEND = "native"
-- 
1.7.6



