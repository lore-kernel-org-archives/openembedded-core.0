Return-Path: <tom.zanussi@intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id BCBFB6E91D
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Feb 2014 01:17:02 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by azsmga101.ch.intel.com with ESMTP; 03 Feb 2014 17:17:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,776,1384329600"; d="scan'208";a="469379625"
Received: from unknown (HELO localhost) ([10.255.13.52])
	by fmsmga001.fm.intel.com with ESMTP; 03 Feb 2014 17:17:02 -0800
From: Tom Zanussi <tom.zanussi@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  3 Feb 2014 19:16:54 -0600
Message-Id: <77905d08bc13b7b0e12ee12aa77ccf4f4c4adc00.1391476329.git.tom.zanussi@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1391476329.git.tom.zanussi@linux.intel.com>
References: <cover.1391476329.git.tom.zanussi@linux.intel.com>
Cc: Tom Zanussi <tom.zanussi@linux.intel.com>
Subject: [PATCH 1/7] wic: Move some common items to oe.misc
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
X-List-Received-Date: Tue, 04 Feb 2014 01:17:03 -0000

Move a couple items into a more common location since they're going to
need to be accessible from source plugins.

Signed-off-by: Tom Zanussi <tom.zanussi@linux.intel.com>
---
 scripts/lib/image/engine.py                            | 11 -----------
 scripts/lib/mic/kickstart/custom_commands/partition.py |  2 --
 scripts/lib/mic/utils/oe/misc.py                       | 12 ++++++++++++
 3 files changed, 12 insertions(+), 13 deletions(-)

diff --git a/scripts/lib/image/engine.py b/scripts/lib/image/engine.py
index b3a9c74..0e8b89e 100644
--- a/scripts/lib/image/engine.py
+++ b/scripts/lib/image/engine.py
@@ -60,17 +60,6 @@ def verify_build_env():
     return True
 
 
-def get_line_val(line, key):
-    """
-    Extract the value from the VAR="val" string
-    """
-    if line.startswith(key + "="):
-        stripped_line = line.split('=')[1]
-        stripped_line = stripped_line.replace('\"', '')
-        return stripped_line
-    return None
-
-
 def find_artifacts(image_name):
     """
     Gather the build artifacts for the current image (the image_name
diff --git a/scripts/lib/mic/kickstart/custom_commands/partition.py b/scripts/lib/mic/kickstart/custom_commands/partition.py
index 4b11195..fe8e55a 100644
--- a/scripts/lib/mic/kickstart/custom_commands/partition.py
+++ b/scripts/lib/mic/kickstart/custom_commands/partition.py
@@ -31,8 +31,6 @@ from mic.utils.oe.misc import *
 
 from mic.kickstart.custom_commands import *
 
-BOOTDD_EXTRA_SPACE = 16384
-
 class Wic_PartData(Mic_PartData):
     removedKeywords = Mic_PartData.removedKeywords
     removedAttrs = Mic_PartData.removedAttrs
diff --git a/scripts/lib/mic/utils/oe/misc.py b/scripts/lib/mic/utils/oe/misc.py
index 9edaa23..097d44c 100644
--- a/scripts/lib/mic/utils/oe/misc.py
+++ b/scripts/lib/mic/utils/oe/misc.py
@@ -106,3 +106,15 @@ def get_wks_var(key):
 
 def add_wks_var(key, val):
     wks_vars[key] = val
+
+BOOTDD_EXTRA_SPACE = 16384
+
+def get_line_val(line, key):
+    """
+    Extract the value from the VAR="val" string
+    """
+    if line.startswith(key + "="):
+        stripped_line = line.split('=')[1]
+        stripped_line = stripped_line.replace('\"', '')
+        return stripped_line
+    return None
-- 
1.8.3.1


