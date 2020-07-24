Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by mx.groups.io with SMTP id smtpd.web12.10506.1595564186759292367
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Jul 2020 21:16:26 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.126, mailfrom: chee.yang.lee@intel.com)
IronPort-SDR: 2/sSwXYGSV/L9dGGYOdU3GK+xq6l223WFT2fXiCLMy+qdOYf2NXJcye4GNOCjDF9lStDaKjH82
 r+rqyX9I5Siw==
X-IronPort-AV: E=McAfee;i="6000,8403,9691"; a="138155655"
X-IronPort-AV: E=Sophos;i="5.75,389,1589266800"; 
   d="scan'208";a="138155655"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2020 21:16:25 -0700
IronPort-SDR: sCVxEOaHKWrPvYaWIVJl0SMmw0grrxBWrKSGA7JpIQAn4YizkHBN8cNxUpjne9Jiy6hC466g2V
 eifOnTRUqX0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,389,1589266800"; 
   d="scan'208";a="288870247"
Received: from andromeda01.png.intel.com (HELO guest1-ubuntu1804.png.intel.com) ([10.221.183.10])
  by orsmga006.jf.intel.com with ESMTP; 23 Jul 2020 21:16:24 -0700
From: "Lee Chee Yang" <chee.yang.lee@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] checklayer: check layer in BBLAYERS before test
Date: Fri, 24 Jul 2020 12:16:24 +0800
Message-Id: <20200724041624.81755-1-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.17.1

From: Lee Chee Yang <chee.yang.lee@intel.com>

layer under test should absent from BBLAYERS when running
yocto-check-layer. This allow to get signatures before layer
under test. There are existing steps to add the layer under
test to BBLAYERS after getting initial signatures.

add steps to check for layer under test in BBLAYERS before
running any test, skip test for the layer if the layer under
test exist in BBLAYERS.

[YOCTO #13176]

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
---
 scripts/lib/checklayer/__init__.py | 14 ++++++++++++++
 scripts/yocto-check-layer          |  9 ++++++++-
 2 files changed, 22 insertions(+), 1 deletion(-)

diff --git a/scripts/lib/checklayer/__init__.py b/scripts/lib/checklayer/__init__.py
index f625d59896..fe545607bb 100644
--- a/scripts/lib/checklayer/__init__.py
+++ b/scripts/lib/checklayer/__init__.py
@@ -229,6 +229,20 @@ def add_layers(bblayersconf, layers, logger):
                 f.write("\nBBLAYERS += \"%s\"\n" % path)
     return True
 
+def check_bblayers(bblayersconf, layer_path, logger):
+    '''
+    If layer_path found in BBLAYERS return True
+    '''
+    import bb.parse
+    import bb.data
+
+    ldata = bb.parse.handle(bblayersconf, bb.data.init(), include=True)
+    for bblayer in (ldata.getVar('BBLAYERS') or '').split():
+        if os.path.normpath(bblayer) == os.path.normpath(layer_path):
+            return True
+
+    return False
+
 def check_command(error_msg, cmd, cwd=None):
     '''
     Run a command under a shell, capture stdout and stderr in a single stream,
diff --git a/scripts/yocto-check-layer b/scripts/yocto-check-layer
index ca6c79bc8d..b7c83c8b54 100755
--- a/scripts/yocto-check-layer
+++ b/scripts/yocto-check-layer
@@ -24,7 +24,7 @@ import scriptpath
 scriptpath.add_oe_lib_path()
 scriptpath.add_bitbake_lib_path()
 
-from checklayer import LayerType, detect_layers, add_layers, add_layer_dependencies, get_signatures
+from checklayer import LayerType, detect_layers, add_layers, add_layer_dependencies, get_signatures, check_bblayers
 from oeqa.utils.commands import get_bb_vars
 
 PROGNAME = 'yocto-check-layer'
@@ -138,6 +138,13 @@ def main():
                 layer['type'] == LayerType.ERROR_BSP_DISTRO:
             continue
 
+        if check_bblayers(bblayersconf, layer['path'], logger):
+            logger.info("%s already in %s. To capture initial signatures, layer under test should not present "
+               "in BBLAYERS. Please remove %s from BBLAYERS." % (layer['name'], bblayersconf, layer['name']))
+            results[layer['name']] = None
+            results_status[layer['name']] = 'SKIPPED (Layer under test should not present in BBLAYERS)'
+            continue
+
         logger.info('')
         logger.info("Setting up for %s(%s), %s" % (layer['name'], layer['type'],
             layer['path']))
-- 
2.17.1

