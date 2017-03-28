Return-Path: <stefan@agner.ch>
X-Greylist: delayed 428 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 28 Mar 2017 21:04:48 UTC
Received: from mail.kmu-office.ch (mail.kmu-office.ch [178.209.48.109])
	by mail.openembedded.org (Postfix) with ESMTP id F409877BAD
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Mar 2017 21:04:48 +0000 (UTC)
Received: from seahawk.toradex.int
	(75-146-58-181-Washington.hfc.comcastbusiness.net [75.146.58.181])
	by mail.kmu-office.ch (Postfix) with ESMTPSA id 0BF3F5C1251;
	Tue, 28 Mar 2017 22:47:17 +0200 (CEST)
From: Stefan Agner <stefan@agner.ch>
To: openembedded-core@lists.openembedded.org
Date: Tue, 28 Mar 2017 13:57:32 -0700
Message-Id: <1490734652-13327-1-git-send-email-stefan@agner.ch>
X-Mailer: git-send-email 2.7.4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
	t=1490734038; bh=QDVkAT+QtDKGZK4YuWi8zOuYfh/YiXRMjFkFb2Co7ag=;
	h=From:To:Cc:Subject:Date:Message-Id;
	b=SknYitT8AlHDgSg5skntDRIw4HhjhoDoGJkGyew0Cg8MjxdxYudYU96RtAYH5FeJRfVx78UWDDDt5aTAQ1cIGWFhpK/SbsSmtfULVYZo3SR8L4XRdlnliL0gX4kZnohXfuFfNNKgMrMmnvTal+CNzoBDCKJqgO2IMmxfvw+nGKg=
Cc: Stefan Agner <stefan.agner@toradex.com>
Subject: [PATCH] util-linux: make blkdiscard a separate package
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
X-List-Received-Date: Tue, 28 Mar 2017 21:04:49 -0000

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
 meta/recipes-core/util-linux/util-linux.inc | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index 21815fb..434c453 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -30,6 +30,7 @@ PACKAGES =+ "util-linux-agetty util-linux-fdisk util-linux-cfdisk util-linux-sfd
              util-linux-swaponoff util-linux-losetup util-linux-umount \
              util-linux-mount util-linux-readprofile util-linux-uuidd \
              util-linux-uuidgen util-linux-lscpu util-linux-fsck util-linux-blkid \
+             util-linux-blkdiscard \
              util-linux-mkfs util-linux-mcookie util-linux-reset \
              util-linux-mkfs.cramfs util-linux-fsck.cramfs util-linux-fstrim \
              util-linux-partx util-linux-hwclock util-linux-mountpoint \
@@ -111,6 +112,8 @@ FILES_util-linux-blkid = "${base_sbindir}/blkid*"
 RCONFLICTS_util-linux-blkid = "e2fsprogs-blkid"
 RREPLACES_util-linux-blkid = "e2fsprogs-blkid"
 
+FILES_util-linux-blkdiscard = "${sbindir}/blkdiscard"
+
 # reset calls 'tput'
 RDEPENDS_util-linux-reset += "ncurses"
 
@@ -119,7 +122,7 @@ RDEPENDS_util-linux-runuser += "libpam"
 RDEPENDS_${PN} = "util-linux-umount util-linux-swaponoff util-linux-losetup util-linux-sulogin"
 RDEPENDS_${PN} += "${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'util-linux-runuser', '', d)}"
 
-RRECOMMENDS_${PN} = "util-linux-fdisk util-linux-cfdisk util-linux-sfdisk util-linux-mount util-linux-readprofile util-linux-mkfs util-linux-mountpoint util-linux-prlimit"
+RRECOMMENDS_${PN} = "util-linux-fdisk util-linux-cfdisk util-linux-sfdisk util-linux-mount util-linux-readprofile util-linux-mkfs util-linux-mountpoint util-linux-prlimit util-linux-blkdiscard"
 
 RRECOMMENDS_${PN}_class-native = ""
 RRECOMMENDS_${PN}_class-nativesdk = ""
-- 
2.7.4


