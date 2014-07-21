Return-Path: <maciej.borzecki@open-rnd.pl>
X-Greylist: delayed 304 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 21 Jul 2014 11:07:31 UTC
Received: from akt59.rev.netart.pl (akt59.rev.netart.pl [85.128.150.59])
	by mail.openembedded.org (Postfix) with ESMTP id 2C48870355
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Jul 2014 11:07:31 +0000 (UTC)
Received: from localhost.localdomain (unknown [46.170.72.194])
	by open-rnd.nazwa.pl (Postfix) with ESMTP id 40D30E02EFB6;
	Mon, 21 Jul 2014 13:02:25 +0200 (CEST)
From: Maciej Borzecki <maciej.borzecki@open-rnd.pl>
To: openembedded-core@lists.openembedded.org
Date: Mon, 21 Jul 2014 13:01:57 +0200
Message-Id: <1405940517-30651-1-git-send-email-maciej.borzecki@open-rnd.pl>
X-Mailer: git-send-email 1.9.0
Cc: Maciek Borzecki <maciek.borzecki@gmail.com>
Subject: [OE-code][PATCH] wic: include partition label in fs image file name
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
X-List-Received-Date: Mon, 21 Jul 2014 11:07:32 -0000

Not including the label image but having multiple partitions of the same
type, the image file of one partition would overwrite the other.

Signed-off-by: Maciej Borzecki <maciej.borzecki@open-rnd.pl>
Signed-off-by: Maciek Borzecki <maciek.borzecki@gmail.com>
---
 scripts/lib/mic/kickstart/custom_commands/partition.py | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/scripts/lib/mic/kickstart/custom_commands/partition.py b/scripts/lib/mic/kickstart/custom_commands/partition.py
index 06f29a9..d0f1b78 100644
--- a/scripts/lib/mic/kickstart/custom_commands/partition.py
+++ b/scripts/lib/mic/kickstart/custom_commands/partition.py
@@ -343,7 +343,7 @@ class Wic_PartData(Mic_PartData):
         """
         Prepare an empty ext2/3/4 partition.
         """
-        fs = "%s/fs.%s" % (cr_workdir, self.fstype)
+        fs = "%s/fs_%s.%s" % (cr_workdir, self.label, self.fstype)
 
         dd_cmd = "dd if=/dev/zero of=%s bs=1M seek=%d count=0" % \
             (fs, self.size)
@@ -363,7 +363,7 @@ class Wic_PartData(Mic_PartData):
         """
         Prepare an empty btrfs partition.
         """
-        fs = "%s/fs.%s" % (cr_workdir, self.fstype)
+        fs = "%s/fs_%s.%s" % (cr_workdir, self.label, self.fstype)
 
         dd_cmd = "dd if=/dev/zero of=%s bs=1M seek=%d count=0" % \
             (fs, self.size)
@@ -384,7 +384,7 @@ class Wic_PartData(Mic_PartData):
         """
         Prepare an empty vfat partition.
         """
-        fs = "%s/fs.%s" % (cr_workdir, self.fstype)
+        fs = "%s/fs_%s.%s" % (cr_workdir, self.label, self.fstype)
 
         blocks = self.size * 1024
 
-- 
1.9.0


