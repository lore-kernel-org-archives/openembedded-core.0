Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RDCuV-00054T-L7
	for openembedded-core@lists.openembedded.org;
	Mon, 10 Oct 2011 12:16:39 +0200
Received: by ywf7 with SMTP id 7so5188523ywf.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Oct 2011 03:10:58 -0700 (PDT)
Received: by 10.223.92.152 with SMTP id r24mr31317907fam.19.1318241458115;
	Mon, 10 Oct 2011 03:10:58 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id n18sm30760607fah.2.2011.10.10.03.10.56
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 10 Oct 2011 03:10:57 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Mon, 10 Oct 2011 12:10:54 +0200
Message-Id: <1318241454-10545-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.6.6.1
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH] util-linux 2.19.1: split blkid out into its own subpackage
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
X-List-Received-Date: Mon, 10 Oct 2011 10:16:40 -0000

Recent udev versions require blkid from u-l, not from e2fsprogs. In general all the non fsck related binaries from e2fsprogs are deprecated.

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta/recipes-core/util-linux/util-linux.inc       |   15 ++++++++++++++-
 meta/recipes-core/util-linux/util-linux_2.19.1.bb |    2 +-
 2 files changed, 15 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index 8762ac6..67d81b9 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -29,7 +29,7 @@ PACKAGES =+ "util-linux-agetty util-linux-fdisk util-linux-cfdisk util-linux-sfd
              util-linux-swaponoff util-linux-losetup util-linux-umount \
              util-linux-mount util-linux-readprofile util-linux-libblkid \
              util-linux-libblkid-dev util-linux-libuuid util-linux-libuuid-dev \
-             util-linux-uuidgen util-linux-lscpu util-linux-fsck"
+             util-linux-uuidgen util-linux-lscpu util-linux-fsck util-linux-blkid"
 
 EXTRA_OECONF = "--disable-use-tty-group --disable-makeinstall-chown --enable-elvtune --enable-init --enable-kill --enable-last \
  --enable-mesg --enable-partx --enable-raw --enable-rdev --enable-reset \
@@ -56,6 +56,11 @@ FILES_util-linux-lscpu = "${bindir}/lscpu"
 
 FILES_util-linux-fsck = "${base_sbindir}/fsck*"
 
+# Util-linux' blkid replaces the e2fsprogs one
+FILES_util-linux-blkid = "${base_sbindir}/blkid*"
+RCONFLICTS_util-linux-blkid = "e2fsprogs-blkid"
+RREPLACES_util-linux-blkid = "e2fsprogs-blkid"
+
 RRECOMMENDS_${PN} = "util-linux-fdisk util-linux-cfdisk util-linux-sfdisk util-linux-mount util-linux-readprofile "
 RDEPENDS_${PN} = "util-linux-umount util-linux-swaponoff util-linux-losetup perl"
 
@@ -262,4 +267,12 @@ pkg_prerm_util-linux-fsck () {
 	update-alternatives --remove fsck fsck.${PN}
 }
 
+pkg_postinst_util-linux-blkid () {
+	update-alternatives --install ${base_sbindir}/blkid blkid blkid.${PN} 100
+}
+
+pkg_prerm_util-linux-blkid () {
+	update-alternatives --remove blkid blkid.${PN}
+}
+
 BBCLASSEXTEND = "native"
diff --git a/meta/recipes-core/util-linux/util-linux_2.19.1.bb b/meta/recipes-core/util-linux/util-linux_2.19.1.bb
index 39ff68c..04f4457 100644
--- a/meta/recipes-core/util-linux/util-linux_2.19.1.bb
+++ b/meta/recipes-core/util-linux/util-linux_2.19.1.bb
@@ -1,5 +1,5 @@
 MAJOR_VERSION = "2.19"
-PR = "r7"
+PR = "r8"
 require util-linux.inc
 
 # note that `lscpu' is under GPLv3+
-- 
1.6.6.1



