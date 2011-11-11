Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1ROu74-0005YU-Ff
	for openembedded-core@lists.openembedded.org;
	Fri, 11 Nov 2011 17:37:58 +0100
Received: by mail-bw0-f47.google.com with SMTP id zs2so3543817bkb.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Nov 2011 08:31:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=hiYvqRjqp/gcE7QaPfUCa21Ou2d4mtwktELaqkV3INc=;
	b=mHJm63d46wk5nDCuK9nIuhE+XHMp7kvaU97dP9rxuc7P3Tb8/Nwbyorg/Dwa9o/j/r
	fi8TxvEqixuC98Pz0t4GUafDtZ+70BJHyy9iRpNOYjbYJYjd1h1E5dFoJpNVhPtDCt5y
	TKfIpggKhVGxAHOlWFT7V7uS+pcGSqfJ6hORo=
Received: by 10.205.119.11 with SMTP id fs11mr9001609bkc.58.1321029102832;
	Fri, 11 Nov 2011 08:31:42 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id z15sm11740426bkv.4.2011.11.11.08.31.41
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 11 Nov 2011 08:31:42 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 11 Nov 2011 17:28:55 +0100
Message-Id: <5df020841b88f0ffa292571352c865586daff6bf.1321028799.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.rc1
In-Reply-To: <d99edd412e58edeb79c64112f7eb6ba522342bf9.1321028799.git.Martin.Jansa@gmail.com>
References: <d99edd412e58edeb79c64112f7eb6ba522342bf9.1321028799.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1321028799.git.Martin.Jansa@gmail.com>
References: <cover.1321028799.git.Martin.Jansa@gmail.com>
Subject: [PATCH][oe-core 19/22] util-linux: use u-a for flock and blockdev, conflicts with busybox
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
X-List-Received-Date: Fri, 11 Nov 2011 16:42:04 -0000

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
1.7.8.rc1



