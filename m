Return-Path: <robert.joslyn@redrectangle.org>
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
	by mail.openembedded.org (Postfix) with ESMTP id 294826C500
	for <openembedded-core@lists.openembedded.org>;
	Sun,  2 Dec 2018 02:33:35 +0000 (UTC)
Received: from localhost.localdomain (unknown [134.49.240.168])
	(Authenticated sender: robert.joslyn@redrectangle.org)
	by relay10.mail.gandi.net (Postfix) with ESMTPSA id 48D4D240002;
	Sun,  2 Dec 2018 02:33:34 +0000 (UTC)
From: Robert Joslyn <robert.joslyn@redrectangle.org>
To: openembedded-core@lists.openembedded.org
Date: Sat,  1 Dec 2018 18:33:18 -0800
Message-Id: <20181202023318.26387-1-robert.joslyn@redrectangle.org>
X-Mailer: git-send-email 2.19.2
MIME-Version: 1.0
Subject: [PATCH] pciutils: Move headers from pciutils-dev to libpci-dev
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 02 Dec 2018 02:33:36 -0000
Content-Transfer-Encoding: 8bit

The pciutils recipe places libpci in a separate package, but the default
package split puts the headers for the library in pciutils-dev. When
building an SDK for an image that uses libpci, but not pciutils, the
headers for libpci are not included.

Move the headers, unversioned so symlink, and pkgconfig files from
pciutils-dev to libpci-dev so the SDK gets those files for images using
libpci.
---
 meta/recipes-bsp/pciutils/pciutils_3.6.2.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-bsp/pciutils/pciutils_3.6.2.bb b/meta/recipes-bsp/pciutils/pciutils_3.6.2.bb
index 413421cd8a..de1e54e5a5 100644
--- a/meta/recipes-bsp/pciutils/pciutils_3.6.2.bb
+++ b/meta/recipes-bsp/pciutils/pciutils_3.6.2.bb
@@ -52,9 +52,11 @@ do_install () {
 	oe_multilib_header pci/config.h
 }
 
-PACKAGES =+ "${PN}-ids libpci"
+PACKAGES =+ "${PN}-ids libpci libpci-dev"
 FILES_${PN}-ids = "${datadir}/pci.ids*"
 FILES_libpci = "${libdir}/libpci.so.*"
+FILES_libpci-dev = "${includedir} ${FILES_SOLIBSDEV} ${libdir}/pkgconfig"
 SUMMARY_${PN}-ids = "PCI utilities - device ID database"
 DESCRIPTION_${PN}-ids = "Package providing the PCI device ID database for pciutils."
 RDEPENDS_${PN} += "${PN}-ids"
+RDEPENDS_libpci-dev = "libpci (= ${EXTENDPKGV})"
-- 
2.19.2


