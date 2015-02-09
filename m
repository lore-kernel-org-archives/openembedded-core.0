Return-Path: <alexandre.belloni@free-electrons.com>
Received: from mail.free-electrons.com (down.free-electrons.com
	[37.187.137.238])
	by mail.openembedded.org (Postfix) with ESMTP id CD39065C97
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Feb 2015 23:46:48 +0000 (UTC)
Received: by mail.free-electrons.com (Postfix, from userid 106)
	id AD9488C; Tue, 10 Feb 2015 00:46:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	mail.free-electrons.com
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=5.0 tests=ALL_TRUSTED,SHORTCIRCUIT,
	URIBL_BLOCKED shortcircuit=ham autolearn=disabled version=3.4.0
Received: from localhost (128-79-216-6.hfc.dyn.abo.bbox.fr [128.79.216.6])
	by mail.free-electrons.com (Postfix) with ESMTPSA id 6D2337E;
	Tue, 10 Feb 2015 00:46:47 +0100 (CET)
From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
To: Tom Zanussi <tom.zanussi@linux.intel.com>
Date: Tue, 10 Feb 2015 00:46:41 +0100
Message-Id: <1423525604-18344-2-git-send-email-alexandre.belloni@free-electrons.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1423525604-18344-1-git-send-email-alexandre.belloni@free-electrons.com>
References: <1423525604-18344-1-git-send-email-alexandre.belloni@free-electrons.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/4] wic: fix empty btrfs partitions
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
X-List-Received-Date: Mon, 09 Feb 2015 23:46:52 -0000

btrfs emtpy partition creation is currently not working because of the
usage of the non existant variables rootfs ans extra_imagecmd. It also
as an incorrect size.

Signed-off-by: Alexandre Belloni <alexandre.belloni@free-electrons.com>
---
 scripts/lib/wic/kickstart/custom_commands/partition.py | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/scripts/lib/wic/kickstart/custom_commands/partition.py b/scripts/lib/wic/kickstart/custom_commands/partition.py
index 44df20c58a25..315c6128849d 100644
--- a/scripts/lib/wic/kickstart/custom_commands/partition.py
+++ b/scripts/lib/wic/kickstart/custom_commands/partition.py
@@ -425,12 +425,7 @@ class Wic_PartData(Mic_PartData):
             (fs, self.size)
         exec_cmd(dd_cmd)
 
-        mkfs_cmd = "mkfs.%s -b %d %s" % (self.fstype, self.size, rootfs)
-        (rc, out) = exec_native_cmd(mkfs_cmd, native_sysroot)
-        if rc:
-            msger.error("ERROR: mkfs.%s returned '%s' instead of 0 (which you probably don't want to ignore, use --debug for details)" % (self.fstype, rc))
-
-        mkfs_cmd = "mkfs.%s -F %s %s" % (self.fstype, extra_imagecmd, fs)
+        mkfs_cmd = "mkfs.%s -b %d %s" % (self.fstype, self.size * 1024, fs)
         (rc, out) = exec_native_cmd(mkfs_cmd, native_sysroot)
         if rc:
             msger.error("ERROR: mkfs.%s returned '%s' instead of 0 (which you probably don't want to ignore, use --debug for details)" % (self.fstype, rc))
-- 
2.1.0


