Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by mx.groups.io with SMTP id smtpd.web10.1106.1585723198610933239
 for <openembedded-core@lists.openembedded.org>;
 Tue, 31 Mar 2020 23:39:58 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.31, mailfrom: chee.yang.lee@intel.com)
IronPort-SDR: UtSHGSfwhCs1YfVLScCIe5lqQJLvA5fpMkabKJnq8UhVvu3F1KnlyMRBa5BuaqSni/AU754Dhw
 rny6Gx+5Tecw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2020 23:39:57 -0700
IronPort-SDR: eyacdUQ+B/YaftZtx2b/cuLPUv/RrsXASRabEPTxhYTljLWsP6XJEbF13NcUa0q94dUFqd/O4L
 elzjxXmZX0Yw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,330,1580803200"; 
   d="scan'208";a="328331829"
Received: from andromeda02.png.intel.com ([10.221.183.11])
  by orsmga001.jf.intel.com with ESMTP; 31 Mar 2020 23:39:57 -0700
From: "Lee Chee Yang" <chee.yang.lee@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] wic: align layer plugin path
Date: Wed,  1 Apr 2020 14:39:56 +0800
Message-Id: <1585723196-48886-1-git-send-email-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.7.4

From: Lee Chee Yang <chee.yang.lee@intel.com>

wic look for external layer source plugin under scripts/lib/
while other tools look for lib/.

allow wic to check for source plugin at both scripts/lib/ and
lib/ to align with other tools while avoid breaking any existing
source plugin in external layer.

[YOCTO #13056]

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
---
 scripts/lib/wic/help.py       |  3 ++-
 scripts/lib/wic/pluginbase.py | 11 ++++++-----
 2 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/scripts/lib/wic/help.py b/scripts/lib/wic/help.py
index 4d342fc..1e3d06a 100644
--- a/scripts/lib/wic/help.py
+++ b/scripts/lib/wic/help.py
@@ -536,7 +536,8 @@ DESCRIPTION
 
     Source plugins can also be implemented and added by external
     layers - any plugins found in a scripts/lib/wic/plugins/source/
-    directory in an external layer will also be made available.
+    or lib/wic/plugins/source/ directory in an external layer will
+    also be made available.
 
     When the wic implementation needs to invoke a partition-specific
     implementation, it looks for the plugin that has the same name as
diff --git a/scripts/lib/wic/pluginbase.py b/scripts/lib/wic/pluginbase.py
index f74d643..d9b4e57 100644
--- a/scripts/lib/wic/pluginbase.py
+++ b/scripts/lib/wic/pluginbase.py
@@ -18,7 +18,7 @@ from wic.misc import get_bitbake_var
 
 PLUGIN_TYPES = ["imager", "source"]
 
-SCRIPTS_PLUGIN_DIR = "scripts/lib/wic/plugins"
+SCRIPTS_PLUGIN_DIR = ["scripts/lib/wic/plugins", "lib/wic/plugins"]
 
 logger = logging.getLogger('wic')
 
@@ -38,10 +38,11 @@ class PluginMgr:
             cls._plugin_dirs = [os.path.join(os.path.dirname(__file__), 'plugins')]
             layers = get_bitbake_var("BBLAYERS") or ''
             for layer_path in layers.split():
-                path = os.path.join(layer_path, SCRIPTS_PLUGIN_DIR)
-                path = os.path.abspath(os.path.expanduser(path))
-                if path not in cls._plugin_dirs and os.path.isdir(path):
-                    cls._plugin_dirs.insert(0, path)
+                for script_plugin_dir in SCRIPTS_PLUGIN_DIR:
+                    path = os.path.join(layer_path, script_plugin_dir)
+                    path = os.path.abspath(os.path.expanduser(path))
+                    if path not in cls._plugin_dirs and os.path.isdir(path):
+                        cls._plugin_dirs.insert(0, path)
 
         if ptype not in PLUGINS:
             # load all ptype plugins
-- 
2.7.4

