Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id EF62B7703C
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Sep 2015 11:00:21 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga103.fm.intel.com with ESMTP; 02 Sep 2015 04:00:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,453,1437462000"; d="scan'208";a="781091536"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga001.fm.intel.com with ESMTP; 02 Sep 2015 04:00:21 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.65])
	by linux.intel.com (Postfix) with ESMTP id 9D54B6A4083
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Sep 2015 03:59:30 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  2 Sep 2015 13:58:06 +0300
Message-Id: <f75c7376cc07989be78f81d658ee88253dc3df41.1441191270.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1441191270.git.ed.bartosh@linux.intel.com>
References: <cover.1441191270.git.ed.bartosh@linux.intel.com>
In-Reply-To: <cover.1441191270.git.ed.bartosh@linux.intel.com>
References: <cover.1441191270.git.ed.bartosh@linux.intel.com>
Subject: [PATCH 06/17] wic: remove micpartition.py
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
X-List-Received-Date: Wed, 02 Sep 2015 11:00:22 -0000

Moved functionality of Mic_Partition and Mic_PartData classes
from micpartition.py to Wic_Partition and Wic_PartData classes
of partition.py module.

Reduced level of inheritance.
Removed confusing mic legacy names.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 .../lib/wic/kickstart/custom_commands/__init__.py  |  4 --
 .../wic/kickstart/custom_commands/micpartition.py  | 57 ----------------------
 .../lib/wic/kickstart/custom_commands/partition.py | 41 +++++++++++-----
 3 files changed, 30 insertions(+), 72 deletions(-)
 delete mode 100644 scripts/lib/wic/kickstart/custom_commands/micpartition.py

diff --git a/scripts/lib/wic/kickstart/custom_commands/__init__.py b/scripts/lib/wic/kickstart/custom_commands/__init__.py
index b4e613d..e4ae406 100644
--- a/scripts/lib/wic/kickstart/custom_commands/__init__.py
+++ b/scripts/lib/wic/kickstart/custom_commands/__init__.py
@@ -1,11 +1,7 @@
-from micpartition import Mic_Partition
-from micpartition import Mic_PartData
 from partition import Wic_Partition
 from partition import Wic_PartData
 
 __all__ = (
-    "Mic_Partition",
-    "Mic_PartData",
     "Wic_Partition",
     "Wic_PartData",
 )
diff --git a/scripts/lib/wic/kickstart/custom_commands/micpartition.py b/scripts/lib/wic/kickstart/custom_commands/micpartition.py
deleted file mode 100644
index d6be008..0000000
--- a/scripts/lib/wic/kickstart/custom_commands/micpartition.py
+++ /dev/null
@@ -1,57 +0,0 @@
-#!/usr/bin/env python -tt
-#
-# Marko Saukko <marko.saukko@cybercom.com>
-#
-# Copyright (C) 2011 Nokia Corporation and/or its subsidiary(-ies).
-#
-# This copyrighted material is made available to anyone wishing to use, modify,
-# copy, or redistribute it subject to the terms and conditions of the GNU
-# General Public License v.2. This program is distributed in the hope that it
-# will be useful, but WITHOUT ANY WARRANTY expressed or implied, including the
-# implied warranties of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
-# See the GNU General Public License for more details.
-#
-# You should have received a copy of the GNU General Public License along with
-# this program; if not, write to the Free Software Foundation, Inc., 51
-# Franklin Street, Fifth Floor, Boston, MA 02110-1301, USA.
-
-from pykickstart.commands.partition import *
-
-class Mic_PartData(FC4_PartData):
-    removedKeywords = FC4_PartData.removedKeywords
-    removedAttrs = FC4_PartData.removedAttrs
-
-    def __init__(self, *args, **kwargs):
-        FC4_PartData.__init__(self, *args, **kwargs)
-        self.deleteRemovedAttrs()
-        self.align = kwargs.get("align", None)
-        self.extopts = kwargs.get("extopts", None)
-        self.part_type = kwargs.get("part_type", None)
-
-    def _getArgsAsStr(self):
-        retval = FC4_PartData._getArgsAsStr(self)
-
-        if self.align:
-            retval += " --align=%d" % self.align
-        if self.extopts:
-            retval += " --extoptions=%s" % self.extopts
-        if self.part_type:
-            retval += " --part-type=%s" % self.part_type
-
-        return retval
-
-class Mic_Partition(FC4_Partition):
-    removedKeywords = FC4_Partition.removedKeywords
-    removedAttrs = FC4_Partition.removedAttrs
-
-    def _getParser(self):
-        op = FC4_Partition._getParser(self)
-        # The alignment value is given in kBytes. e.g., value 8 means that
-        # the partition is aligned to start from 8096 byte boundary.
-        op.add_option("--align", type="int", action="store", dest="align",
-                      default=None)
-        op.add_option("--extoptions", type="string", action="store", dest="extopts",
-                      default=None)
-        op.add_option("--part-type", type="string", action="store", dest="part_type",
-                      default=None)
-        return op
diff --git a/scripts/lib/wic/kickstart/custom_commands/partition.py b/scripts/lib/wic/kickstart/custom_commands/partition.py
index 045b290..dd6edd2 100644
--- a/scripts/lib/wic/kickstart/custom_commands/partition.py
+++ b/scripts/lib/wic/kickstart/custom_commands/partition.py
@@ -28,7 +28,7 @@ import os
 import tempfile
 import uuid
 
-from pykickstart.commands.partition import *
+from pykickstart.commands.partition import FC4_PartData, FC4_Partition
 from wic.utils.oe.misc import *
 from wic.kickstart.custom_commands import *
 from wic.plugin import pluginmgr
@@ -39,13 +39,16 @@ partition_methods = {
     "do_configure_partition":None,
 }
 
-class Wic_PartData(Mic_PartData):
-    removedKeywords = Mic_PartData.removedKeywords
-    removedAttrs = Mic_PartData.removedAttrs
+class Wic_PartData(FC4_PartData):
+    removedKeywords = FC4_PartData.removedKeywords
+    removedAttrs = FC4_PartData.removedAttrs
 
     def __init__(self, *args, **kwargs):
-        Mic_PartData.__init__(self, *args, **kwargs)
+        FC4_PartData.__init__(self, *args, **kwargs)
         self.deleteRemovedAttrs()
+        self.align = kwargs.get("align", None)
+        self.extopts = kwargs.get("extopts", None)
+        self.part_type = kwargs.get("part_type", None)
         self.source = kwargs.get("source", None)
         self.sourceparams = kwargs.get("sourceparams", None)
         self.rootfs = kwargs.get("rootfs-dir", None)
@@ -59,8 +62,14 @@ class Wic_PartData(Mic_PartData):
         self.size = 0
 
     def _getArgsAsStr(self):
-        retval = Mic_PartData._getArgsAsStr(self)
-
+        retval = FC4_PartData._getArgsAsStr(self)
+
+        if self.align:
+            retval += " --align=%d" % self.align
+        if self.extopts:
+            retval += " --extoptions=%s" % self.extopts
+        if self.part_type:
+            retval += " --part-type=%s" % self.part_type
         if self.source:
             retval += " --source=%s" % self.source
             if self.sourceparams:
@@ -468,9 +477,10 @@ class Wic_PartData(Mic_PartData):
         mkswap_cmd = "mkswap %s -U %s %s" % (label_str, str(uuid.uuid1()), fs)
         exec_native_cmd(mkswap_cmd, native_sysroot)
 
-class Wic_Partition(Mic_Partition):
-    removedKeywords = Mic_Partition.removedKeywords
-    removedAttrs = Mic_Partition.removedAttrs
+
+class Wic_Partition(FC4_Partition):
+    removedKeywords = FC4_Partition.removedKeywords
+    removedAttrs = FC4_Partition.removedAttrs
 
     def _getParser(self):
         def overhead_cb(option, opt_str, value, parser):
@@ -479,7 +489,16 @@ class Wic_Partition(Mic_Partition):
                                        (option, value))
             setattr(parser.values, option.dest, value)
 
-        op = Mic_Partition._getParser(self)
+        op = FC4_Partition._getParser(self)
+
+        # The alignment value is given in kBytes. e.g., value 8 means that
+        # the partition is aligned to start from 8096 byte boundary.
+        op.add_option("--align", type="int", action="store", dest="align",
+                      default=None)
+        op.add_option("--extoptions", type="string", action="store", dest="extopts",
+                      default=None)
+        op.add_option("--part-type", type="string", action="store", dest="part_type",
+                      default=None)
         # use specified source file to fill the partition
         # and calculate partition size
         op.add_option("--source", type="string", action="store",
-- 
2.1.4


