Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id DD42C78416
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Nov 2017 06:08:57 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id vA668wwI013768
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 5 Nov 2017 22:08:58 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.163.189) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.361.1; Sun, 5 Nov 2017 22:08:58 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 6 Nov 2017 14:10:16 +0800
Message-ID: <2823d535606deb720bbff51204dd8ed6a15f9c4e.1509948552.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1509948552.git.Qi.Chen@windriver.com>
References: <cover.1509948552.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/2] util-linux: upgrade to 2.31
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
X-List-Received-Date: Mon, 06 Nov 2017 06:08:58 -0000
Content-Type: text/plain

The utility 'reset' is removed in this new version.
A new utility 'rfkill' is added in this new version.

Recipe is modified to remove reset and add rfkill according to the
above changes in new version.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-core/util-linux/util-linux.inc        | 24 +++++++++-------------
 .../{util-linux_2.30.bb => util-linux_2.31.bb}     |  6 +++---
 2 files changed, 13 insertions(+), 17 deletions(-)
 rename meta/recipes-core/util-linux/{util-linux_2.30.bb => util-linux_2.31.bb} (84%)

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index f0ffd25..03970e9 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -31,7 +31,7 @@ PACKAGES =+ "util-linux-agetty util-linux-fdisk util-linux-cfdisk util-linux-sfd
              util-linux-swaponoff util-linux-losetup util-linux-umount \
              util-linux-mount util-linux-readprofile util-linux-uuidd \
              util-linux-uuidgen util-linux-lscpu util-linux-fsck.cramfs util-linux-fsck \
-             util-linux-blkid util-linux-mkfs util-linux-mcookie util-linux-reset \
+             util-linux-blkid util-linux-mkfs util-linux-mcookie util-linux-rfkill \
              util-linux-lsblk util-linux-mkfs.cramfs util-linux-fstrim \
              util-linux-partx util-linux-hwclock util-linux-mountpoint \
              util-linux-findfs util-linux-getopt util-linux-sulogin util-linux-prlimit \
@@ -44,7 +44,7 @@ PACKAGES_DYNAMIC = "^util-linux-lib.*"
 SHARED_EXTRA_OECONF = "--disable-use-tty-group \
                        --disable-makeinstall-chown \
                        --enable-kill --enable-last --enable-mesg --enable-partx \
-                       --enable-raw --enable-reset --disable-login \
+                       --enable-raw --enable-rfkill --disable-login \
                        --disable-vipw --disable-newgrp --disable-chfn-chsh \
                        --enable-write --enable-mount \
                        --enable-libuuid --enable-libblkid --enable-fsck \
@@ -86,7 +86,7 @@ FILES_util-linux-umount = "${base_bindir}/umount.${BPN}"
 FILES_util-linux-readprofile = "${sbindir}/readprofile.${BPN}"
 FILES_util-linux-uuidgen = "${bindir}/uuidgen"
 FILES_util-linux-uuidd = "${sbindir}/uuidd"
-FILES_util-linux-reset = "${base_bindir}/reset*"
+FILES_util-linux-rfkill = "${base_bindir}/rfkill*"
 FILES_util-linux-partx = "${sbindir}/partx"
 FILES_util-linux-hwclock = "${base_sbindir}/hwclock.${BPN}"
 FILES_util-linux-findfs = "${sbindir}/findfs"
@@ -119,9 +119,6 @@ FILES_util-linux-blkid = "${base_sbindir}/blkid*"
 RCONFLICTS_util-linux-blkid = "e2fsprogs-blkid"
 RREPLACES_util-linux-blkid = "e2fsprogs-blkid"
 
-# reset calls 'tput'
-RDEPENDS_util-linux-reset += "ncurses"
-
 RDEPENDS_util-linux-runuser += "libpam"
 RDEPENDS_util-linux-su += "libpam"
 
@@ -160,7 +157,7 @@ do_install () {
 
         sbinprogs="agetty ctrlaltdel cfdisk vipw vigr"
         sbinprogs_a="pivot_root hwclock mkswap mkfs.minix fsck.minix losetup swapon swapoff fdisk fsck blkid blockdev fstrim sulogin switch_root nologin"
-        binprogs_a="dmesg getopt kill more umount mount login reset su mountpoint"
+        binprogs_a="dmesg getopt kill more umount mount login rfkill su mountpoint"
 
         if [ "${base_sbindir}" != "${sbindir}" ]; then
         	mkdir -p ${D}${base_sbindir}
@@ -198,9 +195,8 @@ do_install () {
 	fi
 }
 
-# reset and nologin causes a conflict with ncurses-native and shadow-native
+# nologin causes a conflict with shadow-native
 do_install_append_class-native () {
-	rm -f ${D}${base_bindir}/reset
 	rm -f ${D}${base_sbindir}/nologin
 }
 
@@ -220,14 +216,14 @@ ALTERNATIVE_LINK_NAME[switch_root] = "${base_sbindir}/switch_root"
 ALTERNATIVE_LINK_NAME[eject] = "${bindir}/eject"
 ALTERNATIVE_LINK_NAME[nologin] = "${base_sbindir}/nologin"
 
-ALTERNATIVE_${PN}-doc = "mountpoint.1 last.1 lastb.1 mesg.1 wall.1 nologin.8 sulogin.8 utmpdump.1 reset.1 kill.1 libblkid.3 blkid.8 findfs.8 fsck.8 uuid.3 eject.1 logger.1"
+ALTERNATIVE_${PN}-doc = "mountpoint.1 last.1 lastb.1 mesg.1 wall.1 nologin.8 sulogin.8 utmpdump.1 rfkill.8 kill.1 libblkid.3 blkid.8 findfs.8 fsck.8 uuid.3 eject.1 logger.1"
 
 ALTERNATIVE_LINK_NAME[last.1] = "${mandir}/man1/last.1"
 ALTERNATIVE_LINK_NAME[lastb.1] = "${mandir}/man1/lastb.1"
 ALTERNATIVE_LINK_NAME[mesg.1] = "${mandir}/man1/mesg.1"
 ALTERNATIVE_LINK_NAME[mountpoint.1] = "${mandir}/man1/mountpoint.1"
 ALTERNATIVE_LINK_NAME[nologin.8] = "${mandir}/man8/nologin.8"
-ALTERNATIVE_LINK_NAME[reset.1] = "${mandir}/man1/reset.1"
+ALTERNATIVE_LINK_NAME[rfkill.8] = "${mandir}/man8/rfkill.8"
 ALTERNATIVE_LINK_NAME[sulogin.8] = "${mandir}/man8/sulogin.8"
 ALTERNATIVE_LINK_NAME[utmpdump.1] = "${mandir}/man1/utmpdump.1"
 ALTERNATIVE_LINK_NAME[wall.1] = "${mandir}/man1/wall.1"
@@ -272,9 +268,9 @@ ALTERNATIVE_LINK_NAME[fsck] = "${base_sbindir}/fsck"
 ALTERNATIVE_util-linux-blkid = "blkid"
 ALTERNATIVE_LINK_NAME[blkid] = "${base_sbindir}/blkid"
 
-ALTERNATIVE_util-linux-reset = "reset"
-ALTERNATIVE_LINK_NAME[reset] = "${bindir}/reset"
-ALTERNATIVE_TARGET[reset] = "${base_bindir}/reset"
+ALTERNATIVE_util-linux-rfkill = "rfkill"
+ALTERNATIVE_LINK_NAME[rfkill] = "${bindir}/rfkill"
+ALTERNATIVE_TARGET[rfkill] = "${base_bindir}/rfkill"
 
 ALTERNATIVE_util-linux-getopt = "getopt"
 ALTERNATIVE_LINK_NAME[getopt] = "${base_bindir}/getopt"
diff --git a/meta/recipes-core/util-linux/util-linux_2.30.bb b/meta/recipes-core/util-linux/util-linux_2.31.bb
similarity index 84%
rename from meta/recipes-core/util-linux/util-linux_2.30.bb
rename to meta/recipes-core/util-linux/util-linux_2.31.bb
index 39449d9..a83919b 100644
--- a/meta/recipes-core/util-linux/util-linux_2.30.bb
+++ b/meta/recipes-core/util-linux/util-linux_2.31.bb
@@ -1,4 +1,4 @@
-MAJOR_VERSION = "2.30"
+MAJOR_VERSION = "2.31"
 require util-linux.inc
 
 # To support older hosts, we need to patch and/or revert
@@ -16,8 +16,8 @@ SRC_URI += "file://configure-sbindir.patch \
             file://avoid_parallel_tests.patch \
 "
 SRC_URI_append_class-native = " file://no_getrandom.patch"
-SRC_URI[md5sum] = "eaa3429150268027908a1b8ae6ee9a62"
-SRC_URI[sha256sum] = "c208a4ff6906cb7f57940aa5bc3a6eed146e50a7cc0a092f52ef2ab65057a08d"
+SRC_URI[md5sum] = "5b6821c403c3cc6e7775f74df1882a20"
+SRC_URI[sha256sum] = "f9be7cdcf4fc5c5064a226599acdda6bdf3d86c640152ba01ea642d91108dc8a"
 
 CACHED_CONFIGUREVARS += "scanf_cv_alloc_modifier=ms"
 
-- 
1.9.1


