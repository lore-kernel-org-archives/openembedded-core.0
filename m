Return-Path: <patrick@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
	[74.201.84.163])
	by mail.openembedded.org (Postfix) with ESMTP id C21D27318D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Sep 2016 19:06:09 +0000 (UTC)
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
	[76.250.84.236]) by mx.zohomail.com
	with SMTPS id 1473966365007912.1116883038646;
	Thu, 15 Sep 2016 12:06:05 -0700 (PDT)
From: Patrick Williams <patrick@stwcx.xyz>
To: openembedded-core@lists.openembedded.org
Date: Thu, 15 Sep 2016 14:05:58 -0500
Message-Id: <1473966359-13292-1-git-send-email-patrick@stwcx.xyz>
X-Mailer: git-send-email 2.7.3
Cc: Patrick Williams <patrick@stwcx.xyz>
Subject: [PATCH 1/2] util-linux: Disable minix support.
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
X-List-Received-Date: Thu, 15 Sep 2016 19:06:12 -0000

Disable building of {mkfs,fsck}.minix.

Signed-off-by: Patrick Williams <patrick@stwcx.xyz>
---
 meta/recipes-core/util-linux/util-linux.inc | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index bf770d8..608f198 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -45,7 +45,8 @@ SHARED_EXTRA_OECONF = "--disable-use-tty-group \
                        --enable-raw --enable-reset --disable-login \
                        --disable-vipw --disable-newgrp --disable-chfn-chsh \
                        --enable-write --enable-mount \
-                       --enable-libuuid --enable-libblkid --enable-fsck --without-udev \
+                       --enable-libuuid --enable-libblkid --enable-fsck \
+                       --disable-minix --without-udev \
                        usrsbin_execdir='${sbindir}' \
 "
 
@@ -191,7 +192,7 @@ do_install_append_class-native () {
 ALTERNATIVE_PRIORITY = "80"
 
 ALTERNATIVE_${PN}  = "dmesg kill more mkswap blockdev pivot_root switch_root"
-ALTERNATIVE_${PN} += "mkfs.minix hexdump last lastb logger mesg renice wall"
+ALTERNATIVE_${PN} += "hexdump last lastb logger mesg renice wall"
 ALTERNATIVE_${PN} += "setsid chrt flock utmpdump eject"
 
 ALTERNATIVE_LINK_NAME[dmesg] = "${base_bindir}/dmesg"
@@ -201,7 +202,6 @@ ALTERNATIVE_LINK_NAME[mkswap] = "${base_sbindir}/mkswap"
 ALTERNATIVE_LINK_NAME[blockdev] = "${base_sbindir}/blockdev"
 ALTERNATIVE_LINK_NAME[pivot_root] = "${base_sbindir}/pivot_root"
 ALTERNATIVE_LINK_NAME[switch_root] = "${base_sbindir}/switch_root"
-ALTERNATIVE_LINK_NAME[mkfs.minix] = "${base_sbindir}/mkfs.minix"
 ALTERNATIVE_LINK_NAME[eject] = "${bindir}/eject"
 
 ALTERNATIVE_${PN}-doc = "mountpoint.1 last.1 lastb.1 mesg.1 wall.1 nologin.8 sulogin.8 utmpdump.1 reset.1 kill.1 libblkid.3 blkid.8 findfs.8 fsck.8 uuid.3"
@@ -248,8 +248,7 @@ ALTERNATIVE_util-linux-swaponoff = "swapoff swapon"
 ALTERNATIVE_LINK_NAME[swapoff] = "${base_sbindir}/swapoff"
 ALTERNATIVE_LINK_NAME[swapon] = "${base_sbindir}/swapon"
 
-ALTERNATIVE_util-linux-fsck = "fsck.minix fsck"
-ALTERNATIVE_LINK_NAME[fsck.minix] = "${base_sbindir}/fsck.minix"
+ALTERNATIVE_util-linux-fsck = "fsck"
 ALTERNATIVE_LINK_NAME[fsck] = "${base_sbindir}/fsck"
 
 ALTERNATIVE_util-linux-blkid = "blkid"
-- 
2.7.3



