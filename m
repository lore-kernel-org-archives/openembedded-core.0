Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id D9173731B0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jan 2016 12:00:12 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga102.jf.intel.com with ESMTP; 22 Jan 2016 04:00:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,330,1449561600"; d="scan'208";a="732272641"
Received: from unknown (HELO peggleto-mobl.ger.corp.intel.com)
	([10.255.181.236])
	by orsmga003.jf.intel.com with ESMTP; 22 Jan 2016 04:00:12 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 23 Jan 2016 00:59:50 +1300
Message-Id: <e1f89ebd772bfe757f89ac04dccc1b510b046f38.1453463789.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1453463789.git.paul.eggleton@linux.intel.com>
References: <cover.1453463789.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1453463789.git.paul.eggleton@linux.intel.com>
References: <cover.1453463789.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 03/14] devtool: sdk-update: improve temp directory handling
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
X-List-Received-Date: Fri, 22 Jan 2016 12:00:13 -0000

* Use tempfile.mkdtemp() instead of hardcoding temp dir
* Set a variable early for the temp locked sigs file and use that
  everywhere
* Delete the temp dir at the end

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/lib/devtool/sdk.py | 75 +++++++++++++++++++++++-----------------------
 1 file changed, 38 insertions(+), 37 deletions(-)

diff --git a/scripts/lib/devtool/sdk.py b/scripts/lib/devtool/sdk.py
index 68139aa..4fcd36a 100644
--- a/scripts/lib/devtool/sdk.py
+++ b/scripts/lib/devtool/sdk.py
@@ -7,6 +7,7 @@ import glob
 import shutil
 import errno
 import sys
+import tempfile
 from devtool import exec_build_env_command, setup_tinfoil, DevtoolError
 
 logger = logging.getLogger('devtool')
@@ -133,45 +134,45 @@ def sdk_update(args, config, basepath, workspace):
             return ret
     else:
         # devtool sdk-update http://myhost/sdk
-        tmpsdk_dir = '/tmp/sdk-ext'
-        if os.path.exists(tmpsdk_dir):
-            shutil.rmtree(tmpsdk_dir)
-        os.makedirs(tmpsdk_dir)
-        os.makedirs(os.path.join(tmpsdk_dir, 'conf'))
-        # Fetch locked-sigs.inc from update server
-        ret = subprocess.call("wget -q -O - %s/conf/locked-sigs.inc > %s/locked-sigs.inc" % (updateserver, os.path.join(tmpsdk_dir, 'conf')), shell=True)
-        if ret != 0:
-            logger.error("Fetching conf/locked-sigs.inc from %s to %s/locked-sigs.inc failed" % (updateserver, os.path.join(tmpsdk_dir, 'conf')))
-            return ret
-        else:
-            logger.info("Fetching conf/locked-sigs.inc from %s to %s/locked-sigs.inc succeeded" % (updateserver, os.path.join(tmpsdk_dir, 'conf')))
-        new_locked_sig_file_path = os.path.join(tmpsdk_dir, 'conf/locked-sigs.inc')
-        update_dict = generate_update_dict(new_locked_sig_file_path, old_locked_sig_file_path)
-        logger.debug("update_dict = %s" % update_dict)
-        if len(update_dict) == 0:
-            logger.info("No need to update.")
-            return 0
-        # Update metadata
-        logger.debug("Updating meta data via git ...")
-        # Try using 'git pull', if failed, use 'git clone'
-        if os.path.exists(os.path.join(basepath, 'layers/.git')):
-            ret = subprocess.call("cd layers && git pull %s/layers/.git" % updateserver, shell=True)
-        else:
-            ret = -1
-        if ret != 0:
-            ret = subprocess.call("rm -rf layers && git clone %s/layers/.git" % updateserver, shell=True)
-        if ret != 0:
-            logger.error("Updating meta data via git failed")
-            return ret
-        logger.debug("Updating conf files ...")
-        conf_files = ['local.conf', 'bblayers.conf', 'devtool.conf', 'locked-sigs.inc']
-        for conf in conf_files:
-            ret = subprocess.call("wget -q -O - %s/conf/%s > conf/%s" % (updateserver, conf, conf), shell=True)
+        tmpsdk_dir = tempfile.mkdtemp()
+        try:
+            os.makedirs(os.path.join(tmpsdk_dir, 'conf'))
+            new_locked_sig_file_path = os.path.join(tmpsdk_dir, 'conf', 'locked-sigs.inc')
+            # Fetch locked-sigs.inc from update server
+            ret = subprocess.call("wget -q -O - %s/conf/locked-sigs.inc > %s" % (updateserver, new_locked_sig_file_path), shell=True)
             if ret != 0:
-                logger.error("Update %s failed" % conf)
+                logger.error("Fetching conf/locked-sigs.inc from %s to %s failed" % (updateserver, new_locked_sig_file_path))
                 return ret
-        with open(os.path.join(basepath, 'conf/local.conf'), 'a') as f:
-            f.write('SSTATE_MIRRORS_append = " file://.* %s/sstate-cache/PATH \\n "\n' % updateserver)
+            else:
+                logger.info("Fetching conf/locked-sigs.inc from %s to %s succeeded" % (updateserver, new_locked_sig_file_path))
+            update_dict = generate_update_dict(new_locked_sig_file_path, old_locked_sig_file_path)
+            logger.debug("update_dict = %s" % update_dict)
+            if len(update_dict) == 0:
+                logger.info("No need to update.")
+                return 0
+            # Update metadata
+            logger.debug("Updating meta data via git ...")
+            # Try using 'git pull', if failed, use 'git clone'
+            if os.path.exists(os.path.join(basepath, 'layers/.git')):
+                ret = subprocess.call("cd layers && git pull %s/layers/.git" % updateserver, shell=True)
+            else:
+                ret = -1
+            if ret != 0:
+                ret = subprocess.call("rm -rf layers && git clone %s/layers/.git" % updateserver, shell=True)
+            if ret != 0:
+                logger.error("Updating meta data via git failed")
+                return ret
+            logger.debug("Updating conf files ...")
+            conf_files = ['local.conf', 'bblayers.conf', 'devtool.conf', 'locked-sigs.inc']
+            for conf in conf_files:
+                ret = subprocess.call("wget -q -O - %s/conf/%s > conf/%s" % (updateserver, conf, conf), shell=True)
+                if ret != 0:
+                    logger.error("Update %s failed" % conf)
+                    return ret
+            with open(os.path.join(basepath, 'conf/local.conf'), 'a') as f:
+                f.write('SSTATE_MIRRORS_append = " file://.* %s/sstate-cache/PATH \\n "\n' % updateserver)
+        finally:
+            shutil.rmtree(tmpsdk_dir)
 
     if not args.skip_prepare:
         # Run bitbake command for the whole SDK
-- 
2.5.0


