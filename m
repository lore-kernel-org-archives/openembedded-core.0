Received: from arroyo.ext.ti.com ([192.94.94.40])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <joelagnel@ti.com>) id 1QwksT-0004nm-GA
	for openembedded-core@lists.openembedded.org;
	Fri, 26 Aug 2011 03:06:33 +0200
Received: from dlep36.itg.ti.com ([157.170.170.91])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id p7Q11jmC015694
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Aug 2011 20:01:45 -0500
Received: from dlep26.itg.ti.com (smtp-le.itg.ti.com [157.170.170.27])
	by dlep36.itg.ti.com (8.13.8/8.13.8) with ESMTP id p7Q11ibP001223
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Aug 2011 20:01:44 -0500 (CDT)
Received: from DFLE70.ent.ti.com (localhost [127.0.0.1])
	by dlep26.itg.ti.com (8.13.8/8.13.8) with ESMTP id p7Q11i79026299
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Aug 2011 20:01:44 -0500 (CDT)
Received: from dlelxv22.itg.ti.com (172.17.1.197) by dfle70.ent.ti.com
	(128.247.5.40) with Microsoft SMTP Server id 14.1.323.3;
	Thu, 25 Aug 2011 20:01:45 -0500
Received: from localhost.localdomain (chase-ubuntu.am.dhcp.ti.com
	[128.247.105.25])	by dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id
	p7Q11hkP016008;	Thu, 25 Aug 2011 20:01:44 -0500
From: Joel A Fernandes <joelagnel@ti.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 25 Aug 2011 19:52:37 -0500
Message-ID: <1314319957-10080-1-git-send-email-joelagnel@ti.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Cc: k-kooi@ti.com
Subject: [meta-ti PATCH] beagleboard-test-scripts: Imported from OE classic
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
X-List-Received-Date: Fri, 26 Aug 2011 01:06:33 -0000
Content-Type: text/plain

Signed-off-by: Joel A Fernandes <joelagnel@ti.com>
---
 .../beagleboard/beagleboard-test-scripts_git.bb    |   50 ++++++++++++++++++++
 1 files changed, 50 insertions(+), 0 deletions(-)
 create mode 100644 recipes-ti/beagleboard/beagleboard-test-scripts_git.bb

diff --git a/recipes-ti/beagleboard/beagleboard-test-scripts_git.bb b/recipes-ti/beagleboard/beagleboard-test-scripts_git.bb
new file mode 100644
index 0000000..17c07d8
--- /dev/null
+++ b/recipes-ti/beagleboard/beagleboard-test-scripts_git.bb
@@ -0,0 +1,50 @@
+## Reminder:  The correct spacing for a variable is FOO = "BAR"  in : PR="r1"
+DESCRIPTION = "BeagleBoard test scripts"
+HOMEPAGE = "http://beagleboad.org/support"
+PR = "r7"
+
+
+SRC_URI = "git://github.com/joelagnel/validation-scripts.git;protocol=git \
+"
+
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM="file://gpl.txt;md5=5b122a36d0f6dc55279a0ebc69f3c60b"
+
+SRCREV = "4cc0b0442733c1cc1374267622245f5bd28cd4c2"
+S = "${WORKDIR}/git"
+
+inherit update-rc.d
+INITSCRIPT_NAME = "flash-nand-fs.sh"
+INITSCRIPT_PARAMS = "start 99 2 3 4 5 ."
+
+FILES_${PN} += "/boot/user.txt \
+		/boot/uEnv.txt \
+"
+
+do_install() {
+  TEST_FILES=" \
+    testaudio \
+    testcamera \
+    testdsp \
+    testedid \
+    testled \
+    testmem \
+    testneon \
+    testsvideo \
+    testuserbtn \
+    editbootscr \
+    edituserscr \
+    readgpio \
+  "
+  install -d ${D}/${bindir}
+  for i in ${TEST_FILES}; do
+    install -m 0755 ${S}/${i} ${D}/${bindir}
+  done
+  # A script to flash NAND if the board has it, and if there is valid image to flash on the SD Card.
+  # We also register it as an init script so that the SD Card auto-flashes to NAND during boot.
+  install -d ${D}/${sysconfdir}/init.d/
+  install -m 0755 ${S}/flashing/flash-nand-fs.sh ${D}/${sysconfdir}/init.d/flash-nand-fs.sh
+  install -d ${D}/boot/
+  install -m 0755 ${S}/flashing/user.txt ${D}/boot/user.txt
+  install -m 0755 ${S}/flashing/uEnv.txt ${D}/boot/uEnv.txt
+}
-- 
1.7.0.4



