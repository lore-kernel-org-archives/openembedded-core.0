Return-Path: <tom.zanussi@intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 512736E91D
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Feb 2014 01:17:06 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by azsmga101.ch.intel.com with ESMTP; 03 Feb 2014 17:17:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,776,1384329600"; d="scan'208";a="469379652"
Received: from unknown (HELO localhost) ([10.255.13.52])
	by fmsmga001.fm.intel.com with ESMTP; 03 Feb 2014 17:17:06 -0800
From: Tom Zanussi <tom.zanussi@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  3 Feb 2014 19:16:56 -0600
Message-Id: <fc2b9e2d634e482680264fa899428292c52b9391.1391476329.git.tom.zanussi@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <77905d08bc13b7b0e12ee12aa77ccf4f4c4adc00.1391476329.git.tom.zanussi@linux.intel.com>
References: <77905d08bc13b7b0e12ee12aa77ccf4f4c4adc00.1391476329.git.tom.zanussi@linux.intel.com>
In-Reply-To: <cover.1391476329.git.tom.zanussi@linux.intel.com>
References: <cover.1391476329.git.tom.zanussi@linux.intel.com>
Cc: Tom Zanussi <tom.zanussi@linux.intel.com>
Subject: [PATCH 3/7] wic: Add wic-specific bootloader subclass
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
X-List-Received-Date: Tue, 04 Feb 2014 01:17:06 -0000

Add a new wic-specific bootloader subclass so we can add a --source
param to hang non-partition plugin off of.

By default, the bootloader gets the /boot partition source plugin, but
this can be overridden by the --source bootloader param if needed.

Signed-off-by: Tom Zanussi <tom.zanussi@linux.intel.com>
---
 scripts/lib/mic/imager/direct.py                   |  6 +++
 scripts/lib/mic/kickstart/__init__.py              |  4 +-
 .../lib/mic/kickstart/custom_commands/wicboot.py   | 57 ++++++++++++++++++++++
 3 files changed, 65 insertions(+), 2 deletions(-)
 create mode 100644 scripts/lib/mic/kickstart/custom_commands/wicboot.py

diff --git a/scripts/lib/mic/imager/direct.py b/scripts/lib/mic/imager/direct.py
index d24bc68..3827eb8 100644
--- a/scripts/lib/mic/imager/direct.py
+++ b/scripts/lib/mic/imager/direct.py
@@ -225,6 +225,12 @@ class DirectImageCreator(BaseImageCreator):
 
         fstab = self.__write_fstab()
 
+        for p in parts:
+            # as a convenience, set source to the boot partition source
+            # instead of forcing it to be set via bootloader --source
+            if not self.ks.handler.bootloader.source and p.mountpoint == "/boot":
+                self.ks.handler.bootloader.source = p.source
+
         self.boot_type = self.get_boot_type()
 
         if not self.bootimg_dir:
diff --git a/scripts/lib/mic/kickstart/__init__.py b/scripts/lib/mic/kickstart/__init__.py
index 7e645ca..72f3ca6 100644
--- a/scripts/lib/mic/kickstart/__init__.py
+++ b/scripts/lib/mic/kickstart/__init__.py
@@ -32,7 +32,7 @@ from pykickstart.handlers.control import dataMap
 
 from mic import msger
 from mic.utils import errors, misc, runner, fs_related as fs
-from custom_commands import desktop, micrepo, micboot, partition, installerfw
+from custom_commands import desktop, micrepo, wicboot, partition, installerfw
 
 
 AUTH_URL_PTN = r"(?P<scheme>.*)://(?P<username>.*)(:?P<password>.*)?@(?P<url>.*)"
@@ -98,7 +98,7 @@ def read_kickstart(path):
     using_version = ksversion.DEVEL
     commandMap[using_version]["desktop"] = desktop.Mic_Desktop
     commandMap[using_version]["repo"] = micrepo.Mic_Repo
-    commandMap[using_version]["bootloader"] = micboot.Mic_Bootloader
+    commandMap[using_version]["bootloader"] = wicboot.Wic_Bootloader
     commandMap[using_version]["part"] = partition.Wic_Partition
     commandMap[using_version]["partition"] = partition.Wic_Partition
     commandMap[using_version]["installerfw"] = installerfw.Mic_installerfw
diff --git a/scripts/lib/mic/kickstart/custom_commands/wicboot.py b/scripts/lib/mic/kickstart/custom_commands/wicboot.py
new file mode 100644
index 0000000..ab8871d
--- /dev/null
+++ b/scripts/lib/mic/kickstart/custom_commands/wicboot.py
@@ -0,0 +1,57 @@
+# ex:ts=4:sw=4:sts=4:et
+# -*- tab-width: 4; c-basic-offset: 4; indent-tabs-mode: nil -*-
+#
+# Copyright (c) 2014, Intel Corporation.
+# All rights reserved.
+#
+# This program is free software; you can redistribute it and/or modify
+# it under the terms of the GNU General Public License version 2 as
+# published by the Free Software Foundation.
+#
+# This program is distributed in the hope that it will be useful,
+# but WITHOUT ANY WARRANTY; without even the implied warranty of
+# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+# GNU General Public License for more details.
+#
+# You should have received a copy of the GNU General Public License along
+# with this program; if not, write to the Free Software Foundation, Inc.,
+# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
+#
+# DESCRIPTION
+# This module provides the OpenEmbedded bootloader object definitions.
+#
+# AUTHORS
+# Tom Zanussi <tom.zanussi (at] linux.intel.com>
+#
+
+from pykickstart.base import *
+from pykickstart.errors import *
+from pykickstart.options import *
+from pykickstart.commands.bootloader import *
+
+from mic.kickstart.custom_commands.micboot import *
+
+class Wic_Bootloader(Mic_Bootloader):
+    def __init__(self, writePriority=10, appendLine="", driveorder=None,
+                 forceLBA=False, location="", md5pass="", password="",
+                 upgrade=False, menus=""):
+        Mic_Bootloader.__init__(self, writePriority, appendLine, driveorder,
+                                forceLBA, location, md5pass, password, upgrade)
+
+        self.source = ""
+
+    def _getArgsAsStr(self):
+        retval = Mic_Bootloader._getArgsAsStr(self)
+
+        if self.source:
+            retval += " --source=%s" % self.source
+
+        return retval
+
+    def _getParser(self):
+        op = Mic_Bootloader._getParser(self)
+        # use specified source plugin to implement bootloader-specific methods
+        op.add_option("--source", type="string", action="store",
+                      dest="source", default=None)
+        return op
+
-- 
1.8.3.1


