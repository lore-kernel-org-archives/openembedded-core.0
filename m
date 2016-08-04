Return-Path: <pascal.bach@siemens.com>
Received: from thoth.sbs.de (thoth.sbs.de [192.35.17.2])
	by mail.openembedded.org (Postfix) with ESMTP id 2DB886FF78
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Aug 2016 13:28:53 +0000 (UTC)
Received: from mail2.siemens.de (mail2.siemens.de [139.25.208.11])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id u74DSr0W017854
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 4 Aug 2016 15:28:53 +0200
Received: from dev.sbt.siemens.com (MD1FZU9C.ww002.siemens.net [139.16.77.234])
	by mail2.siemens.de (8.15.2/8.15.2) with ESMTP id u74DSr7S027356;
	Thu, 4 Aug 2016 15:28:53 +0200
From: Pascal Bach <pascal.bach@siemens.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  4 Aug 2016 15:28:46 +0200
Message-Id: <1470317326-1814-1-git-send-email-pascal.bach@siemens.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] util-linux: make prlimit a separate package
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
X-List-Received-Date: Thu, 04 Aug 2016 13:28:54 -0000

Busybox doesn't provide a similar tool so having it in
a separate package allows to us it in addition to busybox without having
to include all of util-linux.

Before it was part of the top level util-linux package.
Now it is a separate package util-linux-prlimit but the top level package
still RRECOMMENDS it so for most users nothing should change.

Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
---
 meta/recipes-core/util-linux/util-linux.inc | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index bac1a37..5236209 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -32,7 +32,7 @@ PACKAGES =+ "util-linux-agetty util-linux-fdisk util-linux-cfdisk util-linux-sfd
              util-linux-mkfs util-linux-mcookie util-linux-reset \
              util-linux-mkfs.cramfs util-linux-fsck.cramfs util-linux-fstrim \
              util-linux-partx util-linux-hwclock util-linux-mountpoint \
-             util-linux-findfs util-linux-getopt util-linux-sulogin"
+             util-linux-findfs util-linux-getopt util-linux-sulogin util-linux-prlimit"
 PACKAGES += "${@bb.utils.contains('PACKAGECONFIG', 'pylibmount', 'util-linux-pylibmount', '', d)}"
 PACKAGES =+ "${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'util-linux-runuser', '', d)}"
 
@@ -88,6 +88,7 @@ FILES_util-linux-hwclock = "${base_sbindir}/hwclock.${BPN}"
 FILES_util-linux-findfs = "${sbindir}/findfs"
 FILES_util-linux-getopt = "${base_bindir}/getopt.${BPN}"
 FILES_util-linux-runuser = "${sbindir}/runuser"
+FILES_util-linux-prlimit = "${bindir}/prlimit"
 
 FILES_util-linux-pylibmount = "${PYTHON_SITEPACKAGES_DIR}/libmount/pylibmount.so \
                                ${PYTHON_SITEPACKAGES_DIR}/libmount/__init__.* \
@@ -116,7 +117,7 @@ RDEPENDS_util-linux-runuser += "libpam"
 RDEPENDS_${PN} = "util-linux-umount util-linux-swaponoff util-linux-losetup util-linux-sulogin"
 RDEPENDS_${PN} += "${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'util-linux-runuser', '', d)}"
 
-RRECOMMENDS_${PN} = "util-linux-fdisk util-linux-cfdisk util-linux-sfdisk util-linux-mount util-linux-readprofile util-linux-mkfs util-linux-mountpoint"
+RRECOMMENDS_${PN} = "util-linux-fdisk util-linux-cfdisk util-linux-sfdisk util-linux-mount util-linux-readprofile util-linux-mkfs util-linux-mountpoint util-linux-prlimit"
 
 RRECOMMENDS_${PN}_class-native = ""
 RRECOMMENDS_${PN}_class-nativesdk = ""
-- 
2.1.4


