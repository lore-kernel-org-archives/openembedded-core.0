Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 00B696FF78
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 May 2016 10:21:47 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 20 May 2016 03:21:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,339,1459839600"; d="scan'208";a="981112878"
Received: from eoong-mobl3.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.173.83])
	by orsmga002.jf.intel.com with ESMTP; 20 May 2016 03:21:46 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 May 2016 22:21:18 +1200
Message-Id: <1463739678-1036-1-git-send-email-paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <a26d0661f3d73db1cecd0d1d30e7cbc0b8e396dc.1462849565.git.paul.eggleton@linux.intel.com>
References: <a26d0661f3d73db1cecd0d1d30e7cbc0b8e396dc.1462849565.git.paul.eggleton@linux.intel.com>
Subject: [PATCH v2] devtool: sdk-update: drop support for local updates
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
X-List-Received-Date: Fri, 20 May 2016 10:21:49 -0000

Having two code paths here makes maintenance difficult, and it doesn't
seem likely that you would use the local case in real usage anyway, so
drop the local support entirely.

This should allow us to resolve [YOCTO #9301].

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
Changes since v1:
 * Dropped test for local update functionality as well

 meta/lib/oeqa/sdkext/sdk_update.py |   3 -
 scripts/lib/devtool/sdk.py         | 188 +++++++++++++++----------------------
 2 files changed, 76 insertions(+), 115 deletions(-)

diff --git a/meta/lib/oeqa/sdkext/sdk_update.py b/meta/lib/oeqa/sdkext/sdk_update.py
index 7a2a6fe..2ade839 100644
--- a/meta/lib/oeqa/sdkext/sdk_update.py
+++ b/meta/lib/oeqa/sdkext/sdk_update.py
@@ -30,9 +30,6 @@ class SdkUpdateTest(oeSDKExtTest):
     def test_sdk_update_http(self):
         output = self._run("devtool sdk-update \"%s\"" % self.http_url)
 
-    def test_sdk_update_local(self):
-        output = self._run("devtool sdk-update \"%s\"" % self.publish_dir)
-
     @classmethod
     def tearDownClass(self):
         self.http_service.stop()
diff --git a/scripts/lib/devtool/sdk.py b/scripts/lib/devtool/sdk.py
index 46fd12b..922277b 100644
--- a/scripts/lib/devtool/sdk.py
+++ b/scripts/lib/devtool/sdk.py
@@ -107,7 +107,7 @@ def check_manifest(fn, basepath):
     return changedfiles
 
 def sdk_update(args, config, basepath, workspace):
-    # Fetch locked-sigs.inc file from remote/local destination
+    """Entry point for devtool sdk-update command"""
     updateserver = args.updateserver
     if not updateserver:
         updateserver = config.get('SDK', 'updateserver', '')
@@ -122,10 +122,9 @@ def sdk_update(args, config, basepath, workspace):
     else:
         logger.debug("Found conf/locked-sigs.inc in %s" % basepath)
 
-    if ':' in updateserver:
-        is_remote = True
-    else:
-        is_remote = False
+    if not '://' in updateserver:
+        logger.error("Update server must be a URL")
+        return -1
 
     layers_dir = os.path.join(basepath, 'layers')
     conf_dir = os.path.join(basepath, 'conf')
@@ -139,120 +138,85 @@ def sdk_update(args, config, basepath, workspace):
     finally:
         tinfoil.shutdown()
 
-    if not is_remote:
-        # devtool sdk-update /local/path/to/latest/sdk
-        new_locked_sig_file_path = os.path.join(updateserver, 'conf/locked-sigs.inc')
-        if not os.path.exists(new_locked_sig_file_path):
-            logger.error("%s doesn't exist or is not an extensible SDK" % updateserver)
-            return -1
-        else:
-            logger.debug("Found conf/locked-sigs.inc in %s" % updateserver)
-        update_dict = generate_update_dict(new_locked_sig_file_path, old_locked_sig_file_path)
-        logger.debug("update_dict = %s" % update_dict)
-        newsdk_path = updateserver
-        sstate_dir = os.path.join(newsdk_path, 'sstate-cache')
-        if not os.path.exists(sstate_dir):
-            logger.error("sstate-cache directory not found under %s" % newsdk_path)
-            return 1
-        sstate_objects = get_sstate_objects(update_dict, sstate_dir)
-        logger.debug("sstate_objects = %s" % sstate_objects)
-        if len(sstate_objects) == 0:
-            logger.info("No need to update.")
+    tmpsdk_dir = tempfile.mkdtemp()
+    try:
+        os.makedirs(os.path.join(tmpsdk_dir, 'conf'))
+        new_locked_sig_file_path = os.path.join(tmpsdk_dir, 'conf', 'locked-sigs.inc')
+        # Fetch manifest from server
+        tmpmanifest = os.path.join(tmpsdk_dir, 'conf', 'sdk-conf-manifest')
+        ret = subprocess.call("wget -q -O %s %s/conf/sdk-conf-manifest" % (tmpmanifest, updateserver), shell=True)
+        changedfiles = check_manifest(tmpmanifest, basepath)
+        if not changedfiles:
+            logger.info("Already up-to-date")
             return 0
-        logger.info("Installing sstate objects into %s", basepath)
-        install_sstate_objects(sstate_objects, updateserver.rstrip('/'), basepath)
-        logger.info("Updating configuration files")
-        new_conf_dir = os.path.join(updateserver, 'conf')
-        shutil.rmtree(conf_dir)
-        shutil.copytree(new_conf_dir, conf_dir)
-        logger.info("Updating layers")
-        new_layers_dir = os.path.join(updateserver, 'layers')
-        shutil.rmtree(layers_dir)
-        ret = subprocess.call("cp -a %s %s" % (new_layers_dir, layers_dir), shell=True)
-        if ret != 0:
-            logger.error("Copying %s to %s failed" % (new_layers_dir, layers_dir))
-            return ret
-    else:
-        # devtool sdk-update http://myhost/sdk
-        tmpsdk_dir = tempfile.mkdtemp()
-        try:
-            os.makedirs(os.path.join(tmpsdk_dir, 'conf'))
-            new_locked_sig_file_path = os.path.join(tmpsdk_dir, 'conf', 'locked-sigs.inc')
-            # Fetch manifest from server
-            tmpmanifest = os.path.join(tmpsdk_dir, 'conf', 'sdk-conf-manifest')
-            ret = subprocess.call("wget -q -O %s %s/conf/sdk-conf-manifest" % (tmpmanifest, updateserver), shell=True)
-            changedfiles = check_manifest(tmpmanifest, basepath)
-            if not changedfiles:
-                logger.info("Already up-to-date")
-                return 0
-            # Update metadata
-            logger.debug("Updating metadata via git ...")
-            #Check for the status before doing a fetch and reset
-            if os.path.exists(os.path.join(basepath, 'layers/.git')):
-                out = subprocess.check_output("git status --porcelain", shell=True, cwd=layers_dir)
-                if not out:
-                    ret = subprocess.call("git fetch --all; git reset --hard", shell=True, cwd=layers_dir)
-                else:
-                    logger.error("Failed to update metadata as there have been changes made to it. Aborting.");
-                    logger.error("Changed files:\n%s" % out);
-                    return -1
+        # Update metadata
+        logger.debug("Updating metadata via git ...")
+        #Check for the status before doing a fetch and reset
+        if os.path.exists(os.path.join(basepath, 'layers/.git')):
+            out = subprocess.check_output("git status --porcelain", shell=True, cwd=layers_dir)
+            if not out:
+                ret = subprocess.call("git fetch --all; git reset --hard", shell=True, cwd=layers_dir)
             else:
-                ret = -1
+                logger.error("Failed to update metadata as there have been changes made to it. Aborting.");
+                logger.error("Changed files:\n%s" % out);
+                return -1
+        else:
+            ret = -1
+        if ret != 0:
+            ret = subprocess.call("git clone %s/layers/.git" % updateserver, shell=True, cwd=tmpsdk_dir)
+            if ret != 0:
+                logger.error("Updating metadata via git failed")
+                return ret
+        logger.debug("Updating conf files ...")
+        for changedfile in changedfiles:
+            ret = subprocess.call("wget -q -O %s %s/%s" % (changedfile, updateserver, changedfile), shell=True, cwd=tmpsdk_dir)
             if ret != 0:
-                ret = subprocess.call("git clone %s/layers/.git" % updateserver, shell=True, cwd=tmpsdk_dir)
-                if ret != 0:
-                    logger.error("Updating metadata via git failed")
-                    return ret
-            logger.debug("Updating conf files ...")
-            for changedfile in changedfiles:
-                ret = subprocess.call("wget -q -O %s %s/%s" % (changedfile, updateserver, changedfile), shell=True, cwd=tmpsdk_dir)
-                if ret != 0:
-                    logger.error("Updating %s failed" % changedfile)
-                    return ret
+                logger.error("Updating %s failed" % changedfile)
+                return ret
 
-            # Check if UNINATIVE_CHECKSUM changed
-            uninative = False
-            if 'conf/local.conf' in changedfiles:
-                def read_uninative_checksums(fn):
-                    chksumitems = []
-                    with open(fn, 'r') as f:
-                        for line in f:
-                            if line.startswith('UNINATIVE_CHECKSUM'):
-                                splitline = re.split(r'[\[\]"\']', line)
-                                if len(splitline) > 3:
-                                    chksumitems.append((splitline[1], splitline[3]))
-                    return chksumitems
+        # Check if UNINATIVE_CHECKSUM changed
+        uninative = False
+        if 'conf/local.conf' in changedfiles:
+            def read_uninative_checksums(fn):
+                chksumitems = []
+                with open(fn, 'r') as f:
+                    for line in f:
+                        if line.startswith('UNINATIVE_CHECKSUM'):
+                            splitline = re.split(r'[\[\]"\']', line)
+                            if len(splitline) > 3:
+                                chksumitems.append((splitline[1], splitline[3]))
+                return chksumitems
 
-                oldsums = read_uninative_checksums(os.path.join(basepath, 'conf/local.conf'))
-                newsums = read_uninative_checksums(os.path.join(tmpsdk_dir, 'conf/local.conf'))
-                if oldsums != newsums:
-                    uninative = True
-                    for buildarch, chksum in newsums:
-                        uninative_file = os.path.join('downloads', 'uninative', chksum, '%s-nativesdk-libc.tar.bz2' % buildarch)
-                        mkdir(os.path.join(tmpsdk_dir, os.path.dirname(uninative_file)))
-                        ret = subprocess.call("wget -q -O %s %s/%s" % (uninative_file, updateserver, uninative_file), shell=True, cwd=tmpsdk_dir)
+            oldsums = read_uninative_checksums(os.path.join(basepath, 'conf/local.conf'))
+            newsums = read_uninative_checksums(os.path.join(tmpsdk_dir, 'conf/local.conf'))
+            if oldsums != newsums:
+                uninative = True
+                for buildarch, chksum in newsums:
+                    uninative_file = os.path.join('downloads', 'uninative', chksum, '%s-nativesdk-libc.tar.bz2' % buildarch)
+                    mkdir(os.path.join(tmpsdk_dir, os.path.dirname(uninative_file)))
+                    ret = subprocess.call("wget -q -O %s %s/%s" % (uninative_file, updateserver, uninative_file), shell=True, cwd=tmpsdk_dir)
 
-            # Ok, all is well at this point - move everything over
-            tmplayers_dir = os.path.join(tmpsdk_dir, 'layers')
-            if os.path.exists(tmplayers_dir):
-                shutil.rmtree(layers_dir)
-                shutil.move(tmplayers_dir, layers_dir)
-            for changedfile in changedfiles:
-                destfile = os.path.join(basepath, changedfile)
-                os.remove(destfile)
-                shutil.move(os.path.join(tmpsdk_dir, changedfile), destfile)
-            os.remove(os.path.join(conf_dir, 'sdk-conf-manifest'))
-            shutil.move(tmpmanifest, conf_dir)
-            if uninative:
-                shutil.rmtree(os.path.join(basepath, 'downloads', 'uninative'))
-                shutil.move(os.path.join(tmpsdk_dir, 'downloads', 'uninative'), os.path.join(basepath, 'downloads'))
+        # Ok, all is well at this point - move everything over
+        tmplayers_dir = os.path.join(tmpsdk_dir, 'layers')
+        if os.path.exists(tmplayers_dir):
+            shutil.rmtree(layers_dir)
+            shutil.move(tmplayers_dir, layers_dir)
+        for changedfile in changedfiles:
+            destfile = os.path.join(basepath, changedfile)
+            os.remove(destfile)
+            shutil.move(os.path.join(tmpsdk_dir, changedfile), destfile)
+        os.remove(os.path.join(conf_dir, 'sdk-conf-manifest'))
+        shutil.move(tmpmanifest, conf_dir)
+        if uninative:
+            shutil.rmtree(os.path.join(basepath, 'downloads', 'uninative'))
+            shutil.move(os.path.join(tmpsdk_dir, 'downloads', 'uninative'), os.path.join(basepath, 'downloads'))
 
-            if not sstate_mirrors:
-                with open(os.path.join(conf_dir, 'site.conf'), 'a') as f:
-                    f.write('SCONF_VERSION = "%s"\n' % site_conf_version)
-                    f.write('SSTATE_MIRRORS_append = " file://.* %s/sstate-cache/PATH \\n "\n' % updateserver)
-        finally:
-            shutil.rmtree(tmpsdk_dir)
+        if not sstate_mirrors:
+            with open(os.path.join(conf_dir, 'site.conf'), 'a') as f:
+                f.write('SCONF_VERSION = "%s"\n' % site_conf_version)
+                f.write('SSTATE_MIRRORS_append = " file://.* %s/sstate-cache/PATH \\n "\n' % updateserver)
+    finally:
+        shutil.rmtree(tmpsdk_dir)
 
     if not args.skip_prepare:
         # Find all potentially updateable tasks
-- 
2.5.5


