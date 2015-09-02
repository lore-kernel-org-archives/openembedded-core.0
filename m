Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 0736177044
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Sep 2015 11:00:26 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga103.jf.intel.com with ESMTP; 02 Sep 2015 04:00:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,453,1437462000"; d="scan'208";a="760751672"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga001.jf.intel.com with ESMTP; 02 Sep 2015 04:00:23 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.65])
	by linux.intel.com (Postfix) with ESMTP id B60306A4083
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Sep 2015 03:59:31 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  2 Sep 2015 13:58:07 +0300
Message-Id: <2a5459009f5fef8c7965ef31e9e90f5d258f6bf3.1441191270.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1441191270.git.ed.bartosh@linux.intel.com>
References: <cover.1441191270.git.ed.bartosh@linux.intel.com>
In-Reply-To: <cover.1441191270.git.ed.bartosh@linux.intel.com>
References: <cover.1441191270.git.ed.bartosh@linux.intel.com>
Subject: [PATCH 07/17] wic: remove micboot.py
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
X-List-Received-Date: Wed, 02 Sep 2015 11:00:27 -0000

Moved functionaly of micboot.py Mic_Bootloader class to
Wic_Bootloader class of wicboot.py module.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 .../lib/wic/kickstart/custom_commands/micboot.py   | 50 ----------------------
 .../lib/wic/kickstart/custom_commands/wicboot.py   | 23 ++++++----
 2 files changed, 15 insertions(+), 58 deletions(-)
 delete mode 100644 scripts/lib/wic/kickstart/custom_commands/micboot.py

diff --git a/scripts/lib/wic/kickstart/custom_commands/micboot.py b/scripts/lib/wic/kickstart/custom_commands/micboot.py
deleted file mode 100644
index 1fa282b..0000000
--- a/scripts/lib/wic/kickstart/custom_commands/micboot.py
+++ /dev/null
@@ -1,50 +0,0 @@
-#!/usr/bin/env python -tt
-#
-# Copyright (c) 2008, 2009, 2010 Intel, Inc.
-#
-# Anas Nashif
-#
-# This program is free software; you can redistribute it and/or modify it
-# under the terms of the GNU General Public License as published by the Free
-# Software Foundation; version 2 of the License
-#
-# This program is distributed in the hope that it will be useful, but
-# WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
-# or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
-# for more details.
-#
-# You should have received a copy of the GNU General Public License along
-# with this program; if not, write to the Free Software Foundation, Inc., 59
-# Temple Place - Suite 330, Boston, MA 02111-1307, USA.
-
-from pykickstart.base import *
-from pykickstart.errors import *
-from pykickstart.options import *
-from pykickstart.commands.bootloader import *
-
-class Mic_Bootloader(F8_Bootloader):
-    def __init__(self, writePriority=10, appendLine="", driveorder=None,
-                 forceLBA=False, location="", md5pass="", password="",
-                 upgrade=False, menus=""):
-        F8_Bootloader.__init__(self, writePriority, appendLine, driveorder,
-                               forceLBA, location, md5pass, password, upgrade)
-
-        self.menus = ""
-        self.ptable = "msdos"
-
-    def _getArgsAsStr(self):
-        ret = F8_Bootloader._getArgsAsStr(self)
-
-        if self.menus == "":
-            ret += " --menus=%s" %(self.menus,)
-        if self.ptable:
-            ret += " --ptable=\"%s\"" %(self.ptable,)
-        return ret
-
-    def _getParser(self):
-        op = F8_Bootloader._getParser(self)
-        op.add_option("--menus", dest="menus")
-        op.add_option("--ptable", dest="ptable", choices=("msdos", "gpt"),
-                      default="msdos")
-        return op
-
diff --git a/scripts/lib/wic/kickstart/custom_commands/wicboot.py b/scripts/lib/wic/kickstart/custom_commands/wicboot.py
index f191416..eefd574 100644
--- a/scripts/lib/wic/kickstart/custom_commands/wicboot.py
+++ b/scripts/lib/wic/kickstart/custom_commands/wicboot.py
@@ -27,29 +27,36 @@
 from pykickstart.base import *
 from pykickstart.errors import *
 from pykickstart.options import *
-from pykickstart.commands.bootloader import *
+from pykickstart.commands.bootloader import F8_Bootloader
 
-from wic.kickstart.custom_commands.micboot import *
-
-class Wic_Bootloader(Mic_Bootloader):
+class Wic_Bootloader(F8_Bootloader):
     def __init__(self, writePriority=10, appendLine="", driveorder=None,
                  forceLBA=False, location="", md5pass="", password="",
                  upgrade=False, menus=""):
-        Mic_Bootloader.__init__(self, writePriority, appendLine, driveorder,
-                                forceLBA, location, md5pass, password, upgrade)
+        F8_Bootloader.__init__(self, writePriority, appendLine, driveorder,
+                               forceLBA, location, md5pass, password, upgrade)
 
+        self.menus = ""
+        self.ptable = "msdos"
         self.source = ""
 
     def _getArgsAsStr(self):
-        retval = Mic_Bootloader._getArgsAsStr(self)
+        retval = F8_Bootloader._getArgsAsStr(self)
 
+        if self.menus == "":
+            retval += " --menus=%s" %(self.menus,)
+        if self.ptable:
+            retval += " --ptable=\"%s\"" %(self.ptable,)
         if self.source:
             retval += " --source=%s" % self.source
 
         return retval
 
     def _getParser(self):
-        op = Mic_Bootloader._getParser(self)
+        op = F8_Bootloader._getParser(self)
+        op.add_option("--menus", dest="menus")
+        op.add_option("--ptable", dest="ptable", choices=("msdos", "gpt"),
+                      default="msdos")
         # use specified source plugin to implement bootloader-specific methods
         op.add_option("--source", type="string", action="store",
                       dest="source", default=None)
-- 
2.1.4


