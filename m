Return-Path: <stefan@agner.ch>
Received: from mail.kmu-office.ch (mail.kmu-office.ch [178.209.48.109])
	by mail.openembedded.org (Postfix) with ESMTP id 069A077B96
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Mar 2017 22:47:19 +0000 (UTC)
Received: from seahawk.toradex.int
	(75-146-58-181-Washington.hfc.comcastbusiness.net [75.146.58.181])
	by mail.kmu-office.ch (Postfix) with ESMTPSA id B3BB05C1316;
	Wed, 29 Mar 2017 00:36:57 +0200 (CEST)
From: Stefan Agner <stefan@agner.ch>
To: openembedded-core@lists.openembedded.org
Date: Tue, 28 Mar 2017 15:45:09 -0700
Message-Id: <1490741109-18909-1-git-send-email-stefan@agner.ch>
X-Mailer: git-send-email 2.7.4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
	t=1490740618; bh=LjWfkn3/fp8HLHKGUIhQF1jgSWpwX/5AGnQVGDTXSfA=;
	h=From:To:Cc:Subject:Date:Message-Id;
	b=GRvM6UAcWAN7p0Lh6AM/n40k4jeF0gj1pYn7AyjWTJSQUM2h9vYShL8HQnYxqKpiwPak2zV6g90MJvGW5uUysOv/u6KDjdTp/9mkDNAfA5QvDpbPBwPBpQ/22s/8QU2VpSTov1E+rG3aE2StrX6vF3Or4E9um1rRBXkY3pNXFqo=
Cc: Stefan Agner <stefan.agner@toradex.com>
Subject: [PATCH v2] util-linux: make blkdiscard a separate package
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
X-List-Received-Date: Tue, 28 Mar 2017 22:47:21 -0000

From: Stefan Agner <stefan.agner@toradex.com>

Busybox doesn't provide a similar tool so having it in a
separate package allows to use it in addition to busybox
without having to include all of util-linux.

Before it was part of the top level util-linux package.
Now it is a separate package util-linux-blkdiscard but the
top level package still RRECOMMENDS it so for most users
nothing should change.

Signed-off-by: Stefan Agner <stefan.agner@toradex.com>
---
 meta/recipes-core/util-linux/util-linux.inc | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index 63302a9..c07417f 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -30,8 +30,8 @@ PACKAGES =+ "util-linux-agetty util-linux-fdisk util-linux-cfdisk util-linux-sfd
              util-linux-swaponoff util-linux-losetup util-linux-umount \
              util-linux-mount util-linux-readprofile util-linux-uuidd \
              util-linux-uuidgen util-linux-lscpu util-linux-fsck.cramfs util-linux-fsck \
-             util-linux-blkid util-linux-mkfs util-linux-mcookie util-linux-reset \
-             util-linux-lsblk util-linux-mkfs.cramfs util-linux-fstrim \
+             util-linux-blkdiscard util-linux-blkid util-linux-mkfs util-linux-mcookie \
+             util-linux-reset util-linux-lsblk util-linux-mkfs.cramfs util-linux-fstrim \
              util-linux-partx util-linux-hwclock util-linux-mountpoint \
              util-linux-findfs util-linux-getopt util-linux-sulogin util-linux-prlimit"
 PACKAGES += "${@bb.utils.contains('PACKAGECONFIG', 'pylibmount', 'util-linux-pylibmount', '', d)}"
@@ -112,6 +112,8 @@ FILES_util-linux-blkid = "${base_sbindir}/blkid*"
 RCONFLICTS_util-linux-blkid = "e2fsprogs-blkid"
 RREPLACES_util-linux-blkid = "e2fsprogs-blkid"
 
+FILES_util-linux-blkdiscard = "${sbindir}/blkdiscard"
+
 # reset calls 'tput'
 RDEPENDS_util-linux-reset += "ncurses"
 
@@ -120,7 +122,7 @@ RDEPENDS_util-linux-runuser += "libpam"
 RDEPENDS_${PN} = "util-linux-umount util-linux-swaponoff util-linux-losetup util-linux-sulogin util-linux-lsblk"
 RDEPENDS_${PN} += "${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'util-linux-runuser', '', d)}"
 
-RRECOMMENDS_${PN} = "util-linux-fdisk util-linux-cfdisk util-linux-sfdisk util-linux-mount util-linux-readprofile util-linux-mkfs util-linux-mountpoint util-linux-prlimit"
+RRECOMMENDS_${PN} = "util-linux-fdisk util-linux-cfdisk util-linux-sfdisk util-linux-mount util-linux-readprofile util-linux-mkfs util-linux-mountpoint util-linux-prlimit util-linux-blkdiscard"
 
 RRECOMMENDS_${PN}_class-native = ""
 RRECOMMENDS_${PN}_class-nativesdk = ""
-- 
2.7.4


