Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1U0K3y-0008B7-1r
	for openembedded-core@lists.openembedded.org;
	Tue, 29 Jan 2013 23:54:13 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 29 Jan 2013 14:38:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,562,1355126400"; d="scan'208";a="196436647"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.12.123])
	by AZSMGA002.ch.intel.com with ESMTP; 29 Jan 2013 14:38:13 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org,
	dvhart@linux.intel.com
Date: Tue, 29 Jan 2013 14:38:11 -0800
Message-Id: <1359499091-1481-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.0.2
Subject: [PATCH] module.bbclass: Don't add pkg_postinst/pkg_prerm to all packages in recipe
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 29 Jan 2013 22:54:17 -0000

The code in module.bbclass was appending the pkg_postinst and
pkg_prerm to all packages that are part of a given recipe, meaning
that the -lic, -dev, -doc, ... packages all got the scriptlet
This change uses  only which macthes with the RDEPENDS and FILES
already used in module.bbclass.

The failure was that rootfs creation would fail due to the -lic package
being installed before the kernel and the script would fail.

[YOCTO #3803]

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/classes/module.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/module.bbclass b/meta/classes/module.bbclass
index d477caa..c933d32 100644
--- a/meta/classes/module.bbclass
+++ b/meta/classes/module.bbclass
@@ -25,7 +25,7 @@ module_do_install() {
 	           modules_install
 }
 
-pkg_postinst_append () {
+pkg_postinst_${PN}_append () {
 if [ -z "$D" ]; then
 	depmod -a ${KERNEL_VERSION}
 else
@@ -33,7 +33,7 @@ else
 fi
 }
 
-pkg_postrm_append () {
+pkg_postrm_${PN}_append () {
 if [ -z "$D" ]; then
 	depmod -a ${KERNEL_VERSION}
 else
-- 
1.8.0.2



