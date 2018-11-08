Return-Path: <pascal.bach@siemens.com>
Received: from goliath.siemens.de (goliath.siemens.de [192.35.17.28])
	by mail.openembedded.org (Postfix) with ESMTP id 1AC8179F16
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Nov 2018 10:57:46 +0000 (UTC)
Received: from mail1.siemens.de (mail1.siemens.de [139.23.33.14])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id wA8Avk1j029366
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 8 Nov 2018 11:57:47 +0100
Received: from dev.vm6.ccp.siemens.com (MD1FZU9C.ad001.siemens.net
	[139.16.37.81])
	by mail1.siemens.de (8.15.2/8.15.2) with ESMTP id wA8Avkgq012925;
	Thu, 8 Nov 2018 11:57:46 +0100
Received: from dev.vm6.ccp.siemens.com (localhost [127.0.0.1])
	by dev.vm6.ccp.siemens.com (Postfix) with ESMTP id A2CE610D47AB;
	Thu,  8 Nov 2018 11:57:46 +0100 (CET)
From: Pascal Bach <pascal.bach@siemens.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  8 Nov 2018 11:57:37 +0100
Message-Id: <20181108105737.21810-1-pascal.bach@siemens.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] util-linux: make alternatives for rev and ionice work with busybox
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
X-List-Received-Date: Thu, 08 Nov 2018 10:57:47 -0000

Busybox can provide ionice and rev. They are both installed to /bin
The corresponding util-linux variant is installed to /usr/bin

This causes the following error during the do_rootfs task:

> update-alternatives: renaming ionice link from /bin/ionice to /usr/bin/ionice
> mv: cannot stat '/bin/ionice': No such file or directory

Moving the util-linux binaries to /bin avoids this error.

Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
---
 meta/recipes-core/util-linux/util-linux.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index a05c1cabbe..b018b1365c 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -158,7 +158,7 @@ do_install () {
 
         sbinprogs="agetty ctrlaltdel cfdisk vipw vigr"
         sbinprogs_a="pivot_root hwclock mkswap mkfs.minix fsck.minix losetup swapon swapoff fdisk fsck blkid blockdev fstrim sulogin switch_root nologin"
-        binprogs_a="dmesg getopt kill more umount mount login su mountpoint"
+        binprogs_a="dmesg getopt kill more umount mount login su mountpoint ionice rev"
 
         if [ "${base_sbindir}" != "${sbindir}" ]; then
         	mkdir -p ${D}${base_sbindir}
@@ -221,7 +221,7 @@ ALTERNATIVE_LINK_NAME[pivot_root] = "${base_sbindir}/pivot_root"
 ALTERNATIVE_LINK_NAME[cal] = "${bindir}/cal"
 ALTERNATIVE_LINK_NAME[eject] = "${bindir}/eject"
 ALTERNATIVE_LINK_NAME[fallocate] = "${bindir}/fallocate"
-ALTERNATIVE_LINK_NAME[rev] = "${bindir}/rev"
+ALTERNATIVE_LINK_NAME[rev] = "${base_bindir}/rev"
 ALTERNATIVE_LINK_NAME[fsfreeze] = "${sbindir}/fsfreeze"
 ALTERNATIVE_LINK_NAME[nologin] = "${base_sbindir}/nologin"
 
@@ -296,7 +296,7 @@ ALTERNATIVE_util-linux-unshare = "unshare"
 ALTERNATIVE_LINK_NAME[unshare] = "${bindir}/unshare"
 
 ALTERNATIVE_util-linux-ionice = "ionice"
-ALTERNATIVE_LINK_NAME[ionice] = "${bindir}/ionice"
+ALTERNATIVE_LINK_NAME[ionice] = "${base_bindir}/ionice"
 
 ALTERNATIVE_util-linux-switch-root = "switch_root"
 ALTERNATIVE_LINK_NAME[switch_root] = "${base_sbindir}/switch_root"
-- 
2.11.0


