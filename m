Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id D159C731F9
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Jan 2016 11:16:40 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 06 Jan 2016 03:16:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,528,1444719600"; d="scan'208";a="875594320"
Received: from ngochun1-mobl.ccr.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.145.179])
	by fmsmga001.fm.intel.com with ESMTP; 06 Jan 2016 03:16:39 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  7 Jan 2016 00:15:45 +1300
Message-Id: <3bd50779917e6ae02a67c70824697a74892aa277.1452078721.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1452078721.git.paul.eggleton@linux.intel.com>
References: <cover.1452078721.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1452078721.git.paul.eggleton@linux.intel.com>
References: <cover.1452078721.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 04/14] devtool: sdk-update: fix not using updateserver config file option
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
X-List-Received-Date: Wed, 06 Jan 2016 11:16:41 -0000

We read the updateserver setting from the config file but we never
actually used that value - the code then went on to use only the value
supplied on the command line.

Fix courtesy of Dmitry Rozhkov <dmitry.rozhkov@intel.com>

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/lib/devtool/sdk.py | 30 +++++++++++++++---------------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/scripts/lib/devtool/sdk.py b/scripts/lib/devtool/sdk.py
index 47b9a7e..afe52cf 100644
--- a/scripts/lib/devtool/sdk.py
+++ b/scripts/lib/devtool/sdk.py
@@ -86,7 +86,7 @@ def sdk_update(args, config, basepath, workspace):
         updateserver = config.get('SDK', 'updateserver', '')
     if not updateserver:
         raise DevtoolError("Update server not specified in config file, you must specify it on the command line")
-    logger.debug("updateserver: %s" % args.updateserver)
+    logger.debug("updateserver: %s" % updateserver)
 
     # Make sure we are using sdk-update from within SDK
     logger.debug("basepath = %s" % basepath)
@@ -97,35 +97,35 @@ def sdk_update(args, config, basepath, workspace):
     else:
         logger.debug("Found conf/locked-sigs.inc in %s" % basepath)
 
-    if ':' in args.updateserver:
+    if ':' in updateserver:
         is_remote = True
     else:
         is_remote = False
 
     if not is_remote:
         # devtool sdk-update /local/path/to/latest/sdk
-        new_locked_sig_file_path = os.path.join(args.updateserver, 'conf/locked-sigs.inc')
+        new_locked_sig_file_path = os.path.join(updateserver, 'conf/locked-sigs.inc')
         if not os.path.exists(new_locked_sig_file_path):
-            logger.error("%s doesn't exist or is not an extensible SDK" % args.updateserver)
+            logger.error("%s doesn't exist or is not an extensible SDK" % updateserver)
             return -1
         else:
-            logger.debug("Found conf/locked-sigs.inc in %s" % args.updateserver)
+            logger.debug("Found conf/locked-sigs.inc in %s" % updateserver)
         update_dict = generate_update_dict(new_locked_sig_file_path, old_locked_sig_file_path)
         logger.debug("update_dict = %s" % update_dict)
-        sstate_objects = get_sstate_objects(update_dict, args.updateserver)
+        sstate_objects = get_sstate_objects(update_dict, updateserver)
         logger.debug("sstate_objects = %s" % sstate_objects)
         if len(sstate_objects) == 0:
             logger.info("No need to update.")
             return 0
         logger.info("Installing sstate objects into %s", basepath)
-        install_sstate_objects(sstate_objects, args.updateserver.rstrip('/'), basepath)
+        install_sstate_objects(sstate_objects, updateserver.rstrip('/'), basepath)
         logger.info("Updating configuration files")
-        new_conf_dir = os.path.join(args.updateserver, 'conf')
+        new_conf_dir = os.path.join(updateserver, 'conf')
         old_conf_dir = os.path.join(basepath, 'conf')
         shutil.rmtree(old_conf_dir)
         shutil.copytree(new_conf_dir, old_conf_dir)
         logger.info("Updating layers")
-        new_layers_dir = os.path.join(args.updateserver, 'layers')
+        new_layers_dir = os.path.join(updateserver, 'layers')
         old_layers_dir = os.path.join(basepath, 'layers')
         shutil.rmtree(old_layers_dir)
         ret = subprocess.call("cp -a %s %s" % (new_layers_dir, old_layers_dir), shell=True)
@@ -140,12 +140,12 @@ def sdk_update(args, config, basepath, workspace):
         os.makedirs(tmpsdk_dir)
         os.makedirs(os.path.join(tmpsdk_dir, 'conf'))
         # Fetch locked-sigs.inc from update server
-        ret = subprocess.call("wget -q -O - %s/conf/locked-sigs.inc > %s/locked-sigs.inc" % (args.updateserver, os.path.join(tmpsdk_dir, 'conf')), shell=True)
+        ret = subprocess.call("wget -q -O - %s/conf/locked-sigs.inc > %s/locked-sigs.inc" % (updateserver, os.path.join(tmpsdk_dir, 'conf')), shell=True)
         if ret != 0:
-            logger.error("Fetching conf/locked-sigs.inc from %s to %s/locked-sigs.inc failed" % (args.updateserver, os.path.join(tmpsdk_dir, 'conf')))
+            logger.error("Fetching conf/locked-sigs.inc from %s to %s/locked-sigs.inc failed" % (updateserver, os.path.join(tmpsdk_dir, 'conf')))
             return ret
         else:
-            logger.info("Fetching conf/locked-sigs.inc from %s to %s/locked-sigs.inc succeeded" % (args.updateserver, os.path.join(tmpsdk_dir, 'conf')))
+            logger.info("Fetching conf/locked-sigs.inc from %s to %s/locked-sigs.inc succeeded" % (updateserver, os.path.join(tmpsdk_dir, 'conf')))
         new_locked_sig_file_path = os.path.join(tmpsdk_dir, 'conf/locked-sigs.inc')
         update_dict = generate_update_dict(new_locked_sig_file_path, old_locked_sig_file_path)
         logger.debug("update_dict = %s" % update_dict)
@@ -160,19 +160,19 @@ def sdk_update(args, config, basepath, workspace):
         else:
             ret = -1
         if ret != 0:
-            ret = subprocess.call("rm -rf layers && git clone %s/layers" % args.updateserver, shell=True)
+            ret = subprocess.call("rm -rf layers && git clone %s/layers" % updateserver, shell=True)
         if ret != 0:
             logger.error("Updating meta data via git failed")
             return ret
         logger.debug("Updating conf files ...")
         conf_files = ['local.conf', 'bblayers.conf', 'devtool.conf', 'locked-sigs.inc']
         for conf in conf_files:
-            ret = subprocess.call("wget -q -O - %s/conf/%s > conf/%s" % (args.updateserver, conf, conf), shell=True)
+            ret = subprocess.call("wget -q -O - %s/conf/%s > conf/%s" % (updateserver, conf, conf), shell=True)
             if ret != 0:
                 logger.error("Update %s failed" % conf)
                 return ret
         with open(os.path.join(basepath, 'conf/local.conf'), 'a') as f:
-            f.write('SSTATE_MIRRORS_append = " file://.* %s/sstate-cache/PATH \\n "\n' % args.updateserver)
+            f.write('SSTATE_MIRRORS_append = " file://.* %s/sstate-cache/PATH \\n "\n' % updateserver)
 
     # Run bitbake command for the whole SDK
     sdk_targets = config.get('SDK', 'sdk_targets')
-- 
2.5.0


