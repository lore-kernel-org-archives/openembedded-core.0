Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RBpVq-0007Gb-1R
	for openembedded-core@lists.openembedded.org;
	Thu, 06 Oct 2011 17:05:30 +0200
Received: by ywf7 with SMTP id 7so2689186ywf.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Oct 2011 07:59:52 -0700 (PDT)
Received: by 10.223.65.76 with SMTP id h12mr4075114fai.7.1317913191693;
	Thu, 06 Oct 2011 07:59:51 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id f25sm7464029faf.7.2011.10.06.07.59.49
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 06 Oct 2011 07:59:50 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Oct 2011 16:59:45 +0200
Message-Id: <1317913185-11345-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.6.6.1
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH v2] util-linux: split fsck* into its own subpackage
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
X-List-Received-Date: Thu, 06 Oct 2011 15:05:30 -0000

This will allow systemd to run /sbin/fsck without dragging in all of util-linux

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta/recipes-core/util-linux/util-linux.inc       |   16 +++++++++++++---
 meta/recipes-core/util-linux/util-linux_2.19.1.bb |    2 +-
 2 files changed, 14 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index afce673..8762ac6 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -29,7 +29,7 @@ PACKAGES =+ "util-linux-agetty util-linux-fdisk util-linux-cfdisk util-linux-sfd
              util-linux-swaponoff util-linux-losetup util-linux-umount \
              util-linux-mount util-linux-readprofile util-linux-libblkid \
              util-linux-libblkid-dev util-linux-libuuid util-linux-libuuid-dev \
-             util-linux-uuidgen util-linux-lscpu"
+             util-linux-uuidgen util-linux-lscpu util-linux-fsck"
 
 EXTRA_OECONF = "--disable-use-tty-group --disable-makeinstall-chown --enable-elvtune --enable-init --enable-kill --enable-last \
  --enable-mesg --enable-partx --enable-raw --enable-rdev --enable-reset \
@@ -54,6 +54,8 @@ FILES_util-linux-libuuid = "${libdir}/libuuid.so.*"
 FILES_util-linux-libuuid-dev = "${libdir}/libuuid.so ${libdir}/libuuid.a ${libdir}/libuuid.la ${includedir}/uuid"
 FILES_util-linux-lscpu = "${bindir}/lscpu"
 
+FILES_util-linux-fsck = "${base_sbindir}/fsck*"
+
 RRECOMMENDS_${PN} = "util-linux-fdisk util-linux-cfdisk util-linux-sfdisk util-linux-mount util-linux-readprofile "
 RDEPENDS_${PN} = "util-linux-umount util-linux-swaponoff util-linux-losetup perl"
 
@@ -172,7 +174,6 @@ pkg_postinst_${PN} () {
 	update-alternatives --install ${base_sbindir}/pivot_root pivot_root pivot_root.${PN} 100
 #	update-alternatives --install ${base_sbindir}/sln sln sln.${PN} 100
 	update-alternatives --install ${base_sbindir}/mkfs.minix mkfs.minix mkfs.minix.${PN} 100
-	update-alternatives --install ${base_sbindir}/fsck.minix fsck.minix fsck.minix.${PN} 100
 	update-alternatives --install ${bindir}/hexdump hexdump hexdump.${PN} 100
 	update-alternatives --install ${bindir}/last last last.${PN} 100
 	update-alternatives --install ${bindir}/logger logger logger.${PN} 100
@@ -201,7 +202,6 @@ pkg_prerm_${PN} () {
 	update-alternatives --remove shutdown shutdown.${PN}
 #	update-alternatives --remove sln sln.${PN}
 	update-alternatives --remove mkfs.minix mkfs.minix.${PN}
-	update-alternatives --remove fsck.minix fsck.minix.${PN}
 	update-alternatives --remove hexdump hexdump.${PN}
 	update-alternatives --remove last last.${PN}
 	update-alternatives --remove logger logger.${PN}
@@ -252,4 +252,14 @@ pkg_prerm_util-linux-swaponoff () {
 	update-alternatives --remove swapon swapon.${PN}
 }
 
+pkg_postinst_util-linux-fsck () {	
+	update-alternatives --install ${base_sbindir}/fsck.minix fsck.minix fsck.minix.${PN} 100
+	update-alternatives --install ${base_sbindir}/fsck fsck fsck.${PN} 100
+}
+
+pkg_prerm_util-linux-fsck () {
+	update-alternatives --remove fsck.minix fsck.minix.${PN}
+	update-alternatives --remove fsck fsck.${PN}
+}
+
 BBCLASSEXTEND = "native"
diff --git a/meta/recipes-core/util-linux/util-linux_2.19.1.bb b/meta/recipes-core/util-linux/util-linux_2.19.1.bb
index 5b327cb..39ff68c 100644
--- a/meta/recipes-core/util-linux/util-linux_2.19.1.bb
+++ b/meta/recipes-core/util-linux/util-linux_2.19.1.bb
@@ -1,5 +1,5 @@
 MAJOR_VERSION = "2.19"
-PR = "r5"
+PR = "r7"
 require util-linux.inc
 
 # note that `lscpu' is under GPLv3+
-- 
1.6.6.1



