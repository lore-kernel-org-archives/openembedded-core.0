Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 75E4371633
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jan 2016 12:00:15 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga102.jf.intel.com with ESMTP; 22 Jan 2016 04:00:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,330,1449561600"; d="scan'208";a="732272670"
Received: from unknown (HELO peggleto-mobl.ger.corp.intel.com)
	([10.255.181.236])
	by orsmga003.jf.intel.com with ESMTP; 22 Jan 2016 04:00:14 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 23 Jan 2016 00:59:51 +1300
Message-Id: <0264a76646185fc496b3940b084a7a5449dc7d5d.1453463789.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1453463789.git.paul.eggleton@linux.intel.com>
References: <cover.1453463789.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1453463789.git.paul.eggleton@linux.intel.com>
References: <cover.1453463789.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 04/14] devtool: sdk-update: improve SDK update process robustness
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
X-List-Received-Date: Fri, 22 Jan 2016 12:00:15 -0000

Make the following improvements to the SDK update process:

* Use a manifest file with sha256sums to track files other than sstate
  and metadata that we need to update - e.g. conf files. This allows us
  to handle where files such as auto.conf may or may not be present,
  as well as the configuration changing without affecting task signatures
  - we still want the config files copied in that case rather than it
  saying nothing needs to be done.
* Write the SSTATE_MIRRORS_append to site.conf rather than local.conf
  so that local.conf remains static (since we don't want to trigger an
  update every time). Also, If there is an SSTATE_MIRRORS value already
  set in the configuration we can skip this and assume it contains the
  needed packages.
* Allow the update process to be run in any directory, don't assume
  we're already at the base of the SDK
* Where practical, fetch remote files into a temporary location and
  then move them to the desired location at the end, to avoid a
  failed update leaving the SDK in a broken state.
* Update all installed do_populate_sysroot / do_packagedata tasks
  instead of using the SDK targets. This ensures any item installed
  through dependencies after installation (e.g. when running
  "devtool build") won't go stale.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/populate_sdk_ext.bbclass |  16 +++++
 scripts/lib/devtool/sdk.py            | 118 ++++++++++++++++++++++++----------
 2 files changed, 100 insertions(+), 34 deletions(-)

diff --git a/meta/classes/populate_sdk_ext.bbclass b/meta/classes/populate_sdk_ext.bbclass
index ebb57bb..bb8831b 100644
--- a/meta/classes/populate_sdk_ext.bbclass
+++ b/meta/classes/populate_sdk_ext.bbclass
@@ -47,6 +47,7 @@ SDK_TITLE_task-populate-sdk-ext = "${@d.getVar('DISTRO_NAME', True) or d.getVar(
 python copy_buildsystem () {
     import re
     import shutil
+    import glob
     import oe.copy_buildsystem
 
     oe_init_env_script = d.getVar('OE_INIT_ENV_SCRIPT', True)
@@ -224,6 +225,21 @@ python copy_buildsystem () {
             if name.endswith("_package.tgz"):
                 f = os.path.join(root, name)
                 os.remove(f)
+
+    # Write manifest file
+    # Note: at the moment we cannot include the env setup script here to keep
+    # it updated, since it gets modified during SDK installation (see
+    # sdk_ext_postinst() below) thus the checksum we take here would always
+    # be different.
+    manifest_file_list = ['conf/*']
+    manifest_file = os.path.join(baseoutpath, 'conf', 'sdk-conf-manifest')
+    with open(manifest_file, 'w') as f:
+        for item in manifest_file_list:
+            for fn in glob.glob(os.path.join(baseoutpath, item)):
+                if fn == manifest_file:
+                    continue
+                chksum = bb.utils.sha256_file(fn)
+                f.write('%s\t%s\n' % (chksum, os.path.relpath(fn, baseoutpath)))
 }
 
 def extsdk_get_buildtools_filename(d):
diff --git a/scripts/lib/devtool/sdk.py b/scripts/lib/devtool/sdk.py
index 4fcd36a..80ea871 100644
--- a/scripts/lib/devtool/sdk.py
+++ b/scripts/lib/devtool/sdk.py
@@ -75,6 +75,21 @@ def install_sstate_objects(sstate_objects, src_sdk, dest_sdk):
         logger.debug("Copying %s to %s" % (sb, dst))
         shutil.copy(sb, dst)
 
+def check_manifest(fn, basepath):
+    import bb.utils
+    changedfiles = []
+    with open(fn, 'r') as f:
+        for line in f:
+            splitline = line.split()
+            if len(splitline) > 1:
+                chksum = splitline[0]
+                fpath = splitline[1]
+                curr_chksum = bb.utils.sha256_file(os.path.join(basepath, fpath))
+                if chksum != curr_chksum:
+                    logger.debug('File %s changed: old csum = %s, new = %s' % (os.path.join(basepath, fpath), curr_chksum, chksum))
+                    changedfiles.append(fpath)
+    return changedfiles
+
 def sdk_update(args, config, basepath, workspace):
     # Fetch locked-sigs.inc file from remote/local destination
     updateserver = args.updateserver
@@ -98,6 +113,18 @@ def sdk_update(args, config, basepath, workspace):
     else:
         is_remote = False
 
+    layers_dir = os.path.join(basepath, 'layers')
+    conf_dir = os.path.join(basepath, 'conf')
+
+    # Grab variable values
+    tinfoil = setup_tinfoil(config_only=True, basepath=basepath)
+    try:
+        stamps_dir = tinfoil.config_data.getVar('STAMPS_DIR', True)
+        sstate_mirrors = tinfoil.config_data.getVar('SSTATE_MIRRORS', True)
+        site_conf_version = tinfoil.config_data.getVar('SITE_CONF_VERSION', True)
+    finally:
+        tinfoil.shutdown()
+
     if not is_remote:
         # devtool sdk-update /local/path/to/latest/sdk
         new_locked_sig_file_path = os.path.join(updateserver, 'conf/locked-sigs.inc')
@@ -121,16 +148,14 @@ def sdk_update(args, config, basepath, workspace):
         install_sstate_objects(sstate_objects, updateserver.rstrip('/'), basepath)
         logger.info("Updating configuration files")
         new_conf_dir = os.path.join(updateserver, 'conf')
-        old_conf_dir = os.path.join(basepath, 'conf')
-        shutil.rmtree(old_conf_dir)
-        shutil.copytree(new_conf_dir, old_conf_dir)
+        shutil.rmtree(conf_dir)
+        shutil.copytree(new_conf_dir, conf_dir)
         logger.info("Updating layers")
         new_layers_dir = os.path.join(updateserver, 'layers')
-        old_layers_dir = os.path.join(basepath, 'layers')
-        shutil.rmtree(old_layers_dir)
-        ret = subprocess.call("cp -a %s %s" % (new_layers_dir, old_layers_dir), shell=True)
+        shutil.rmtree(layers_dir)
+        ret = subprocess.call("cp -a %s %s" % (new_layers_dir, layers_dir), shell=True)
         if ret != 0:
-            logger.error("Copying %s to %s failed" % (new_layers_dir, old_layers_dir))
+            logger.error("Copying %s to %s failed" % (new_layers_dir, layers_dir))
             return ret
     else:
         # devtool sdk-update http://myhost/sdk
@@ -138,50 +163,75 @@ def sdk_update(args, config, basepath, workspace):
         try:
             os.makedirs(os.path.join(tmpsdk_dir, 'conf'))
             new_locked_sig_file_path = os.path.join(tmpsdk_dir, 'conf', 'locked-sigs.inc')
-            # Fetch locked-sigs.inc from update server
-            ret = subprocess.call("wget -q -O - %s/conf/locked-sigs.inc > %s" % (updateserver, new_locked_sig_file_path), shell=True)
-            if ret != 0:
-                logger.error("Fetching conf/locked-sigs.inc from %s to %s failed" % (updateserver, new_locked_sig_file_path))
-                return ret
-            else:
-                logger.info("Fetching conf/locked-sigs.inc from %s to %s succeeded" % (updateserver, new_locked_sig_file_path))
-            update_dict = generate_update_dict(new_locked_sig_file_path, old_locked_sig_file_path)
-            logger.debug("update_dict = %s" % update_dict)
-            if len(update_dict) == 0:
-                logger.info("No need to update.")
+            # Fetch manifest from server
+            tmpmanifest = os.path.join(tmpsdk_dir, 'conf', 'sdk-conf-manifest')
+            ret = subprocess.call("wget -q -O %s %s/conf/sdk-conf-manifest" % (tmpmanifest, updateserver), shell=True)
+            changedfiles = check_manifest(tmpmanifest, basepath)
+            if not changedfiles:
+                logger.info("Already up-to-date")
                 return 0
             # Update metadata
-            logger.debug("Updating meta data via git ...")
+            logger.debug("Updating metadata via git ...")
             # Try using 'git pull', if failed, use 'git clone'
             if os.path.exists(os.path.join(basepath, 'layers/.git')):
-                ret = subprocess.call("cd layers && git pull %s/layers/.git" % updateserver, shell=True)
+                ret = subprocess.call("git pull %s/layers/.git" % updateserver, shell=True, cwd=layers_dir)
             else:
                 ret = -1
             if ret != 0:
-                ret = subprocess.call("rm -rf layers && git clone %s/layers/.git" % updateserver, shell=True)
-            if ret != 0:
-                logger.error("Updating meta data via git failed")
-                return ret
+                ret = subprocess.call("git clone %s/layers/.git" % updateserver, shell=True, cwd=tmpsdk_dir)
+                if ret != 0:
+                    logger.error("Updating metadata via git failed")
+                    return ret
             logger.debug("Updating conf files ...")
-            conf_files = ['local.conf', 'bblayers.conf', 'devtool.conf', 'locked-sigs.inc']
-            for conf in conf_files:
-                ret = subprocess.call("wget -q -O - %s/conf/%s > conf/%s" % (updateserver, conf, conf), shell=True)
+            for changedfile in changedfiles:
+                ret = subprocess.call("wget -q -O %s %s/%s" % (changedfile, updateserver, changedfile), shell=True, cwd=tmpsdk_dir)
                 if ret != 0:
-                    logger.error("Update %s failed" % conf)
+                    logger.error("Updating %s failed" % changedfile)
                     return ret
-            with open(os.path.join(basepath, 'conf/local.conf'), 'a') as f:
-                f.write('SSTATE_MIRRORS_append = " file://.* %s/sstate-cache/PATH \\n "\n' % updateserver)
+
+            # Ok, all is well at this point - move everything over
+            tmplayers_dir = os.path.join(tmpsdk_dir, 'layers')
+            if os.path.exists(tmplayers_dir):
+                shutil.rmtree(layers_dir)
+                shutil.move(tmplayers_dir, layers_dir)
+            for changedfile in changedfiles:
+                destfile = os.path.join(basepath, changedfile)
+                os.remove(destfile)
+                shutil.move(os.path.join(tmpsdk_dir, changedfile), destfile)
+            os.remove(os.path.join(conf_dir, 'sdk-conf-manifest'))
+            shutil.move(tmpmanifest, conf_dir)
+
+            if not sstate_mirrors:
+                with open(os.path.join(conf_dir, 'site.conf'), 'a') as f:
+                    f.write('SCONF_VERSION = "%s"\n' % site_conf_version)
+                    f.write('SSTATE_MIRRORS_append = " file://.* %s/sstate-cache/PATH \\n "\n' % updateserver)
         finally:
             shutil.rmtree(tmpsdk_dir)
 
     if not args.skip_prepare:
+        # Find all potentially updateable tasks
+        sdk_update_targets = []
+        tasks = ['do_populate_sysroot', 'do_packagedata']
+        for root, _, files in os.walk(stamps_dir):
+            for fn in files:
+                if not '.sigdata.' in fn:
+                    for task in tasks:
+                        if '.%s.' % task in fn or '.%s_setscene.' % task in fn:
+                            sdk_update_targets.append('%s:%s' % (os.path.basename(root), task))
         # Run bitbake command for the whole SDK
-        sdk_update_targets = config.get('SDK', 'sdk_update_targets', config.get('SDK', 'sdk_targets'))
         logger.info("Preparing build system... (This may take some time.)")
         try:
-            exec_build_env_command(config.init_path, basepath, 'bitbake %s --setscene-only' % sdk_update_targets)
-        except:
-            logger.error('bitbake %s failed' % sdk_update_targets)
+            exec_build_env_command(config.init_path, basepath, 'bitbake --setscene-only %s' % ' '.join(sdk_update_targets), stderr=subprocess.STDOUT)
+            output, _ = exec_build_env_command(config.init_path, basepath, 'bitbake -n %s' % ' '.join(sdk_update_targets), stderr=subprocess.STDOUT)
+            runlines = []
+            for line in output.splitlines():
+                if 'Running task ' in line:
+                    runlines.append(line)
+            if runlines:
+                logger.error('Unexecuted tasks found in preparation log:\n  %s' % '\n  '.join(runlines))
+                return -1
+        except bb.process.ExecutionError as e:
+            logger.error('Preparation failed:\n%s' % e.stdout)
             return -1
     return 0
 
-- 
2.5.0


