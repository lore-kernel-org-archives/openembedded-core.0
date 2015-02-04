Return-Path: <alexandre.belloni@free-electrons.com>
Received: from mail.free-electrons.com (down.free-electrons.com
	[37.187.137.238])
	by mail.openembedded.org (Postfix) with ESMTP id 2731560017
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Feb 2015 22:49:16 +0000 (UTC)
Received: by mail.free-electrons.com (Postfix, from userid 106)
	id 12B27602; Wed,  4 Feb 2015 23:49:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	mail.free-electrons.com
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=5.0 tests=ALL_TRUSTED,SHORTCIRCUIT,
	URIBL_BLOCKED shortcircuit=ham autolearn=disabled version=3.4.0
Received: from localhost (128-79-216-6.hfc.dyn.abo.bbox.fr [128.79.216.6])
	by mail.free-electrons.com (Postfix) with ESMTPSA id C95DDD;
	Wed,  4 Feb 2015 23:49:23 +0100 (CET)
From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
To: Tom Zanussi <tom.zanussi@linux.intel.com>
Date: Wed,  4 Feb 2015 23:49:15 +0100
Message-Id: <1423090155-14149-1-git-send-email-alexandre.belloni@free-electrons.com>
X-Mailer: git-send-email 2.1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH] wic: bootimg-partition: Stop removing whole workdir
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
X-List-Received-Date: Wed, 04 Feb 2015 22:49:16 -0000

Stop removing the whole working directory as this is also removing
eventual previously created partition images, leading to image creation
failures.

Signed-off-by: Alexandre Belloni <alexandre.belloni@free-electrons.com>
---
 scripts/lib/wic/plugins/source/bootimg-partition.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/lib/wic/plugins/source/bootimg-partition.py b/scripts/lib/wic/plugins/source/bootimg-partition.py
index 6ba39a01f700..c5eb7b8b801b 100644
--- a/scripts/lib/wic/plugins/source/bootimg-partition.py
+++ b/scripts/lib/wic/plugins/source/bootimg-partition.py
@@ -66,7 +66,7 @@ class BootimgPartitionPlugin(SourcePlugin):
         - copies all files listed in IMAGE_BOOT_FILES variable
         """
         hdddir = "%s/boot" % cr_workdir
-        rm_cmd = "rm -rf %s" % cr_workdir
+        rm_cmd = "rm -rf %s/boot" % cr_workdir
         exec_cmd(rm_cmd)
 
         install_cmd = "install -d %s" % hdddir
-- 
2.1.0


