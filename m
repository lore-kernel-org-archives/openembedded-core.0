Received: from stoexhub03.domain01.net ([83.145.59.144])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <anders@chargestorm.se>) id 1Tj5RA-0007v9-6b
	for openembedded-core@lists.openembedded.org;
	Thu, 13 Dec 2012 10:50:40 +0100
Received: from localhost (83.252.253.85) by stoexhub03.domain01.net
	(10.12.10.3) with Microsoft SMTP Server id 8.3.279.1; Thu, 13 Dec 2012
	10:35:01 +0100
From: Anders Darander <anders@chargestorm.se>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 13 Dec 2012 10:35:59 +0100
Message-ID: <51e7cbbca760b9fc61a57857fd5c370fad1a46ff.1355391318.git.anders@chargestorm.se>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1355391318.git.anders@chargestorm.se>
References: <cover.1355391318.git.anders@chargestorm.se>
MIME-Version: 1.0
X-GFI-SMTP-Submission: 1
Cc: Anders Darander <anders@chargestorm.se>
Subject: [PATCH 1/1] linux-firmware: split out ralink drivers
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
X-List-Received-Date: Thu, 13 Dec 2012 09:50:40 -0000
Content-Type: text/plain

To reduce disk usage on systems using the ralink driver, split out the ralink firmware
to a separate package.

Signed-off-by: Anders Darander <anders@chargestorm.se>
---
 meta/recipes-kernel/linux-firmware/linux-firmware_git.bb |   10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
index f4eb4cf..98a2d07 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
@@ -22,7 +22,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.radeon;md5=e56b405656593a0c97e478513051ea0e \
 SRCREV = "0d6729f2b0bc6254d3628eb831bc80a36b5a17db"
 PE = "1"
 PV = "0.0+git${SRCPV}"
-PR = "r5"
+PR = "r6"
 
 SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git;protocol=git"
 
@@ -49,7 +49,13 @@ do_install() {
 	( cd ${D}/lib/firmware ; ln -sf ti-connectivity/* . )
 }
 
-PACKAGES =+ "${PN}-sd8686 ${PN}-rtl8192cu linux-firmware-rtl8192ce linux-firmware-rtl8192su ${PN}-wl12xx"
+PACKAGES =+ "${PN}-ralink ${PN}-sd8686 ${PN}-rtl8192cu linux-firmware-rtl8192ce linux-firmware-rtl8192su ${PN}-wl12xx"
+
+LICENSE_${PN}-ralink = "Firmware:LICENCE.ralink_firmware.txt"
+FILES_${PN}-ralink = " \
+  /lib/firmware/rt*.bin \
+  /lib/firmware/LICENSE.ralink_firmware.txt \
+"
 
 LICENSE_${PN}-sd8686 = "Firmware:LICENSE.libertas"
 FILES_${PN}-sd8686 = " \
-- 
1.7.10.4



