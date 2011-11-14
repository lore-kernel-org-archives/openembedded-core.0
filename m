Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RPoG2-0002Dy-I0
	for openembedded-core@lists.openembedded.org;
	Mon, 14 Nov 2011 05:35:01 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 13 Nov 2011 20:28:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="75055131"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.15.217])
	by orsmga001.jf.intel.com with ESMTP; 13 Nov 2011 20:28:16 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 13 Nov 2011 20:28:02 -0800
Message-Id: <31cf5eb447cfa8462494f4a65488f605532515be.1321244755.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1321244755.git.sgw@linux.intel.com>
References: <cover.1321244755.git.sgw@linux.intel.com>
In-Reply-To: <cover.1321244755.git.sgw@linux.intel.com>
References: <cover.1321244755.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 12/21] util-linux: use u-a for flock and blockdev, conflicts with busybox
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
X-List-Received-Date: Mon, 14 Nov 2011 04:35:05 -0000

From: Martin Jansa <Martin.Jansa@gmail.com>

* nobody replied on
  http://lists.linuxtogo.org/pipermail/openembedded-core/2011-September/009409.html
* be aware that all those renames to foo.${PN} are also applied for
  native variants so now we have utils like
  tmp-eglibc/sysroots/x86_64-linux/usr/bin/flock.util-linux-native
  which are not used ie in
  package_ipk.bbclass: package_update_index_ipk
  because it calls just flock
  so if that's problem then we should apply those renames only for
  target version (and live with possible overwrites in -native sysroot)
  or teach u-a postinst/prerm to happen also for sysroot population

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-core/util-linux/util-linux.inc |   10 +++++++---
 1 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index dcf0ed9..3b80736 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -116,9 +116,9 @@ do_install () {
 
 	mkdir -p ${D}${base_bindir}
 
-        sbinprogs="agetty blockdev ctrlaltdel cfdisk vipw vigr"
-        sbinprogs_a="pivot_root hwclock mkswap shutdown mkfs.minix fsck.minix losetup swapon fdisk readprofile fsck blkid sln"
-        usrbinprogs_a="chfn chsh hexdump last logger mesg newgrp renice wall setsid chrt"
+        sbinprogs="agetty ctrlaltdel cfdisk vipw vigr"
+        sbinprogs_a="pivot_root hwclock mkswap shutdown mkfs.minix fsck.minix losetup swapon fdisk readprofile fsck blkid sln blockdev"
+        usrbinprogs_a="chfn chsh hexdump last logger mesg newgrp renice wall setsid chrt flock"
         binprogs_a="dmesg kill more umount mount login reset"
 
         if [ "${base_sbindir}" != "${sbindir}" ]; then
@@ -180,6 +180,7 @@ pkg_postinst_${PN} () {
 	update-alternatives --install ${base_bindir}/kill kill kill.${PN} 100
 	update-alternatives --install ${base_bindir}/more more more.${PN} 100
 	update-alternatives --install ${base_sbindir}/mkswap mkswap mkswap.${PN} 100
+	update-alternatives --install ${base_sbindir}/blockdev blockdev blockdev.${PN} 100
 	test -x ${base_sbindir}/pivot_root.${PN} && \
 	update-alternatives --install ${base_sbindir}/pivot_root pivot_root pivot_root.${PN} 100
 #	update-alternatives --install ${base_sbindir}/sln sln sln.${PN} 100
@@ -190,6 +191,7 @@ pkg_postinst_${PN} () {
 	update-alternatives --install ${bindir}/mesg mesg mesg.${PN} 100
 	update-alternatives --install ${bindir}/renice renice renice.${PN} 100
 	update-alternatives --install ${bindir}/wall wall wall.${PN} 100
+	update-alternatives --install ${bindir}/flock flock flock.${PN} 100
 	
 	# There seems to be problem, atleast on nslu2, with these, untill they are
 	# fixed the busybox ones have higher priority
@@ -208,6 +210,7 @@ pkg_prerm_${PN} () {
 	update-alternatives --remove halt halt.${PN}
 	update-alternatives --remove hwclock hwclock.${PN}
 	update-alternatives --remove mkswap mkswap.${PN}
+	update-alternatives --remove blockdev blockdev.${PN}
 	update-alternatives --remove reboot reboot.${PN}
 	update-alternatives --remove shutdown shutdown.${PN}
 #	update-alternatives --remove sln sln.${PN}
@@ -218,6 +221,7 @@ pkg_prerm_${PN} () {
 	update-alternatives --remove mesg mesg.${PN}
 	update-alternatives --remove renice renice.${PN}
 	update-alternatives --remove wall wall.${PN}
+	update-alternatives --remove flock flock.${PN}
 }
 
 pkg_postinst_util-linux-fdisk () {
-- 
1.7.6.4



