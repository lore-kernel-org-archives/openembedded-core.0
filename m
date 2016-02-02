Return-Path: <maciej.borzecki@open-rnd.pl>
X-Greylist: delayed 647 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 02 Feb 2016 15:26:48 UTC
Received: from akt59.rev.netart.pl (akt59.rev.netart.pl [85.128.150.59])
	by mail.openembedded.org (Postfix) with ESMTP id A3A1C77270
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Feb 2016 15:26:48 +0000 (UTC)
Received: from comp_016_pc_buildenv.localdomain (unknown [31.182.60.238])
	by open-rnd.nazwa.pl (Postfix) with ESMTP id 841152DBE79;
	Tue,  2 Feb 2016 16:16:00 +0100 (CET)
From: Maciej Borzecki <maciej.borzecki@open-rnd.pl>
To: openembedded-core@lists.openembedded.org,
	Ed Bartosh <ed.bartosh@linux.intel.com>
Date: Tue,  2 Feb 2016 16:15:20 +0100
Message-Id: <1454426120-3135-1-git-send-email-maciej.borzecki@open-rnd.pl>
X-Mailer: git-send-email 2.5.0
Cc: Maciek Borzecki <maciek.borzecki@gmail.com>
Subject: [wic][PATCH] wic: default to empty bootloader config
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
X-List-Received-Date: Tue, 02 Feb 2016 15:26:50 -0000

A kickstart file for non-x86 boards may have no 'bootloader' stanza. It
is the usual case if bootloader is setup using other mechanism than
through wic, and is for instance a part of u-boot configuration. In such
case the 'bootloader' field in the KickStart class will be
uninitialized. Instead of adding an empty bootloader line in every
kickstart file call the bootloader parser with empty argument list to
get defaults namespace.

Signed-off-by: Maciej Borzecki <maciej.borzecki@open-rnd.pl>
---
 scripts/lib/wic/ksparser.py | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/scripts/lib/wic/ksparser.py b/scripts/lib/wic/ksparser.py
index f2a0e047449e122470b84e521a114f52d55bc4a4..2f1e0978db5cd39c88e9ac11c090d20a68573605 100644
--- a/scripts/lib/wic/ksparser.py
+++ b/scripts/lib/wic/ksparser.py
@@ -29,6 +29,7 @@ import os
 import shlex
 from argparse import ArgumentParser, ArgumentError, ArgumentTypeError
 
+from wic import msger
 from wic.partition import Partition
 from wic.utils.misc import find_canned
 
@@ -135,6 +136,9 @@ class KickStart(object):
         include.add_argument('path', type=cannedpathtype)
 
         self._parse(parser, confpath)
+        if not self.bootloader:
+            msger.warning('bootloader config not specified, using defaults')
+            self.bootloader = bootloader.parse_args([])
 
     def _parse(self, parser, confpath):
         """
-- 
2.5.0


