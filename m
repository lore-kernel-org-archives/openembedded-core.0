Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1TGV0L-0001KJ-Uj
	for openembedded-core@lists.openembedded.org;
	Tue, 25 Sep 2012 15:16:49 +0200
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1TGUnz-0005Xq-3H
	for openembedded-core@lists.openembedded.org;
	Tue, 25 Sep 2012 15:04:03 +0200
From: Phil Blundell <philb@gnu.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 25 Sep 2012 14:04:02 +0100
X-Mailer: Evolution 3.0.2- 
Message-ID: <1348578243.31293.72.camel@phil-desktop>
Mime-Version: 1.0
Subject: [PATCH] util-linux: Don't package chkdupexe
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
X-List-Received-Date: Tue, 25 Sep 2012 13:16:50 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

The chkdupexe utility is fairly worthless and drags perl in as a build dependency
of the whole util-linux recipe.  If anybody actually wants to use this script
then we should package it separately, but for the time being let's just delete it.

Signed-off-by: Phil Blundell <pb@pbcl.net>
---
 meta/recipes-core/util-linux/util-linux.inc       |    6 +++---
 meta/recipes-core/util-linux/util-linux_2.21.2.bb |    6 +-----
 2 files changed, 4 insertions(+), 8 deletions(-)

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index b2a1552..d62d406 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -31,7 +31,7 @@ PACKAGES =+ "util-linux-agetty util-linux-fdisk util-linux-cfdisk util-linux-sfd
              util-linux-mount util-linux-readprofile util-linux-libblkid \
              util-linux-libblkid-dev util-linux-libuuid util-linux-libuuid-dev \
              util-linux-uuidgen util-linux-lscpu util-linux-fsck util-linux-blkid \
-             util-linux-chkdupexe util-linux-mkfs util-linux-mcookie"
+             util-linux-mkfs util-linux-mcookie"
 
 EXTRA_OECONF = "--libdir=${base_libdir} --disable-use-tty-group \
                 --disable-makeinstall-chown --enable-elvtune --enable-init \
@@ -63,7 +63,6 @@ FILES_util-linux-libuuid-dev = "${base_libdir}/libuuid.so ${base_libdir}/libuuid
 FILES_util-linux-lscpu = "${bindir}/lscpu"
 
 FILES_util-linux-fsck = "${base_sbindir}/fsck*"
-FILES_util-linux-chkdupexe = "${bindir}/chkdupexe"
 FILES_util-linux-mkfs = "${sbindir}/mkfs"
 
 # Util-linux' blkid replaces the e2fsprogs one
@@ -72,7 +71,6 @@ RCONFLICTS_util-linux-blkid = "e2fsprogs-blkid"
 RREPLACES_util-linux-blkid = "e2fsprogs-blkid"
 
 RDEPENDS_${PN} = "util-linux-umount util-linux-swaponoff util-linux-losetup"
-RDEPENDS_${PN}-chkdupexe = "perl"
 RRECOMMENDS_${PN} = "util-linux-fdisk util-linux-cfdisk util-linux-sfdisk util-linux-mount util-linux-readprofile util-linux-mkfs "
 
 RRECOMMENDS_${PN}_virtclass-native = ""
@@ -125,6 +123,8 @@ do_install () {
 
 	ln -sf swapon.${BPN}   ${D}${base_sbindir}/swapoff.${BPN}
 	rm -f ${D}${sbindir}/swapoff
+
+	rm -f ${D}${bindir}/chkdupexe
 }
 
 inherit update-alternatives
diff --git a/meta/recipes-core/util-linux/util-linux_2.21.2.bb b/meta/recipes-core/util-linux/util-linux_2.21.2.bb
index 792730c..39e3609 100644
--- a/meta/recipes-core/util-linux/util-linux_2.21.2.bb
+++ b/meta/recipes-core/util-linux/util-linux_2.21.2.bb
@@ -1,5 +1,5 @@
 MAJOR_VERSION = "2.21"
-PR = "r4"
+PR = "r5"
 require util-linux.inc
 
 # note that `lscpu' is under GPLv3+
@@ -40,7 +40,3 @@ addtask remove_lscpu before do_configure after do_patch
 
 CACHED_CONFIGUREVARS += "scanf_cv_alloc_modifier=as"
 EXTRA_OECONF_virtclass-native += "--disable-fallocate --disable-use-tty-group"
-
-do_install_append () {
-	sed -i -e '1s,.*,#!${bindir}/env perl,' ${D}${bindir}/chkdupexe
-}
-- 
1.7.10.4





