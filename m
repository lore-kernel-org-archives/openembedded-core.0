Return-Path: <george.l.musat@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 2742465D4F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Nov 2014 12:29:17 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga103.fm.intel.com with ESMTP; 20 Nov 2014 04:22:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.07,423,1413270000"; d="scan'208";a="625483877"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by fmsmga001.fm.intel.com with ESMTP; 20 Nov 2014 04:29:17 -0800
Received: from localhost.localdomain (unknown [10.237.112.174])
	by linux.intel.com (Postfix) with ESMTP id 6DFDA6A4083;
	Thu, 20 Nov 2014 04:28:21 -0800 (PST)
From: Lucian Musat <george.l.musat@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 20 Nov 2014 14:21:18 +0200
Message-Id: <1416486078-30122-1-git-send-email-george.l.musat@intel.com>
X-Mailer: git-send-email 2.1.0
Subject: [PATCH] oeqa/runtime: Added some new filters for the log parser Including custom filters for edgerouter, minnow and jasperforest.
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
X-List-Received-Date: Thu, 20 Nov 2014 12:29:22 -0000

Signed-off-by: Lucian Musat <george.l.musat@intel.com>
---
 meta/lib/oeqa/runtime/parselogs.py | 36 +++++++++++++++++++++++++++++-------
 1 file changed, 29 insertions(+), 7 deletions(-)

diff --git a/meta/lib/oeqa/runtime/parselogs.py b/meta/lib/oeqa/runtime/parselogs.py
index 42cb1b5..19a4f1b 100644
--- a/meta/lib/oeqa/runtime/parselogs.py
+++ b/meta/lib/oeqa/runtime/parselogs.py
@@ -7,10 +7,22 @@ from oeqa.utils.decorators import *
 errors = ["error", "cannot", "can\'t", "failed"]
 
 common_errors = [
-    '(WW) warning, (EE) error, (NI) not implemented, (??) unknown.',
-    'dma timeout',
-    'can\'t add hid device:',
-    'usbhid: probe of ',
+    "(WW) warning, (EE) error, (NI) not implemented, (??) unknown.",
+    "dma timeout",
+    "can\'t add hid device:",
+    "usbhid: probe of ",
+    "_OSC failed (AE_ERROR)",
+    "_OSC failed (AE_SUPPORT)",
+    "AE_ALREADY_EXISTS"
+    "ACPI _OSC request failed (AE_SUPPORT)"
+    "can\'t disable ASPM",
+    "Failed to load module \"vesa\"",
+    "Failed to load module vesa",
+    "Failed to load module \"modesetting\"",
+    "Failed to load module modesetting",
+    "Failed to load module \"glx\"",
+    "Failed to load module glx",
+    "[drm] Cannot find any crtc or sizes - going 1024x768"
     ]
 
 x86_common = [
@@ -24,9 +36,6 @@ qemux86_common = [
     'Fast TSC calibration', 
     '_OSC failed (AE_NOT_FOUND); disabling ASPM',
     'Open ACPI failed (/var/run/acpid.socket) (No such file or directory)',
-    'Failed to load module "vesa"',
-    'Failed to load module "modesetting"',
-    'Failed to load module "glx"',
     'wrong ELF class',
 ] + common_errors
 
@@ -54,6 +63,19 @@ ignore_errors = {
     'crownbay' : x86_common,
     'genericx86' : x86_common,
     'genericx86-64' : x86_common,
+    'edgerouter' : [
+        'Fatal server error:',
+        ] + common_errors,
+    'minnow' : [
+        'netlink init failed',
+        'NETLINK INITIALIZATION FAILED',
+        ] + common_errors,
+    'jasperforest' : [
+        'Activated service \'org.bluez\' failed:',
+        'Unable to find NFC netlink family',
+        'netlink init failed',
+        'NETLINK INITIALIZATION FAILED',
+        ] + common_errors,
 }
 
 log_locations = ["/var/log/","/var/log/dmesg", "/tmp/dmesg_output.log"]
-- 
2.1.0


