Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 7685473232
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Sep 2015 12:42:51 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga101.jf.intel.com with ESMTP; 07 Sep 2015 05:42:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,485,1437462000"; d="scan'208";a="556940061"
Received: from wmurray-mobl3.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.25.6])
	by FMSMGA003.fm.intel.com with ESMTP; 07 Sep 2015 05:42:51 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  7 Sep 2015 13:42:27 +0100
Message-Id: <257ea5b57ff0c53cf53d816a1c26c2619968f6b0.1441629547.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1441629547.git.paul.eggleton@linux.intel.com>
References: <cover.1441629547.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1441629547.git.paul.eggleton@linux.intel.com>
References: <cover.1441629547.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 11/11] devtool: add mechanism for updating extensible SDK
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
X-List-Received-Date: Mon, 07 Sep 2015 12:42:51 -0000

From: "Qi.Chen@windriver.com" <Qi.Chen@windriver.com>

Enable updating the installed extensible SDK from a local or remote
server, avoiding the need to install it again from scratch when
updating. (This assumes that the updated SDK has been built and then
published somewhere using the oe-publish-sdk script beforehand.)

This plugin is only enabled when devtool is used within the extensible
SDK since it doesn't make sense to use it next to a normal install of
the build system.

E.g.
devtool sdk-update /mnt/sdk-repo/
devtool sdk-update http://mysdkhost/sdk

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/populate_sdk_ext.bbclass |   6 ++
 scripts/lib/devtool/sdk.py            | 197 ++++++++++++++++++++++++++++++++++
 2 files changed, 203 insertions(+)
 create mode 100644 scripts/lib/devtool/sdk.py

diff --git a/meta/classes/populate_sdk_ext.bbclass b/meta/classes/populate_sdk_ext.bbclass
index 0b012eb..4ef8838 100644
--- a/meta/classes/populate_sdk_ext.bbclass
+++ b/meta/classes/populate_sdk_ext.bbclass
@@ -18,6 +18,7 @@ SDK_RELOCATE_AFTER_INSTALL_task-populate-sdk-ext = "0"
 SDK_LOCAL_CONF_WHITELIST ?= ""
 SDK_LOCAL_CONF_BLACKLIST ?= "CONF_VERSION BB_NUMBER_THREADS PARALLEL_MAKE PRSERV_HOST"
 SDK_INHERIT_BLACKLIST ?= "buildhistory icecc"
+SDK_UPDATE_URL ?= ""
 
 SDK_TARGETS ?= "${PN}"
 OE_INIT_ENV_SCRIPT ?= "oe-init-build-env"
@@ -85,6 +86,11 @@ python copy_buildsystem () {
     config.set('General', 'bitbake_subdir', conf_bbpath)
     config.set('General', 'init_path', conf_initpath)
     config.set('General', 'core_meta_subdir', core_meta_subdir)
+    config.add_section('SDK')
+    config.set('SDK', 'sdk_targets', d.getVar('SDK_TARGETS', True))
+    updateurl = d.getVar('SDK_UPDATE_URL', True)
+    if updateurl:
+        config.set('SDK', 'updateserver', updateurl)
     bb.utils.mkdirhier(os.path.join(baseoutpath, 'conf'))
     with open(os.path.join(baseoutpath, 'conf', 'devtool.conf'), 'w') as f:
         config.write(f)
diff --git a/scripts/lib/devtool/sdk.py b/scripts/lib/devtool/sdk.py
new file mode 100644
index 0000000..2f416b3
--- /dev/null
+++ b/scripts/lib/devtool/sdk.py
@@ -0,0 +1,197 @@
+# Development tool - sdk-update command plugin
+
+import os
+import subprocess
+import logging
+import glob
+import shutil
+import errno
+import sys
+from devtool import exec_build_env_command, setup_tinfoil, DevtoolError
+
+logger = logging.getLogger('devtool')
+
+def plugin_init(pluginlist):
+    """Plugin initialization"""
+    pass
+
+def parse_locked_sigs(sigfile_path):
+    """Return <pn:task>:<hash> dictionary"""
+    sig_dict = {}
+    with open(sigfile_path) as f:
+        lines = f.readlines()
+        for line in lines:
+            if ':' in line:
+                taskkey, _, hashval = line.rpartition(':')
+                sig_dict[taskkey.strip()] = hashval.split()[0]
+    return sig_dict
+
+def generate_update_dict(sigfile_new, sigfile_old):
+    """Return a dict containing <pn:task>:<hash> which indicates what need to be updated"""
+    update_dict = {}
+    sigdict_new = parse_locked_sigs(sigfile_new)
+    sigdict_old = parse_locked_sigs(sigfile_old)
+    for k in sigdict_new:
+        if k not in sigdict_old:
+            update_dict[k] = sigdict_new[k]
+            continue
+        if sigdict_new[k] != sigdict_old[k]:
+            update_dict[k] = sigdict_new[k]
+            continue
+    return update_dict
+
+def get_sstate_objects(update_dict, newsdk_path):
+    """Return a list containing sstate objects which are to be installed"""
+    sstate_objects = []
+    # Ensure newsdk_path points to an extensible SDK
+    sstate_dir = os.path.join(newsdk_path, 'sstate-cache')
+    if not os.path.exists(sstate_dir):
+        logger.error("sstate-cache directory not found under %s" % newsdk_path)
+        raise
+    for k in update_dict:
+        files = set()
+        hashval = update_dict[k]
+        p = sstate_dir + '/' + hashval[:2] + '/*' + hashval + '*.tgz'
+        files |= set(glob.glob(p))
+        p = sstate_dir + '/*/' + hashval[:2] + '/*' + hashval + '*.tgz'
+        files |= set(glob.glob(p))
+        files = list(files)
+        if len(files) == 1:
+            sstate_objects.extend(files)
+        elif len(files) > 1:
+            logger.error("More than one matching sstate object found for %s" % hashval)
+
+    return sstate_objects
+
+def mkdir(d):
+    try:
+        os.makedirs(d)
+    except OSError as e:
+        if e.errno != errno.EEXIST:
+            raise e
+
+def install_sstate_objects(sstate_objects, src_sdk, dest_sdk):
+    """Install sstate objects into destination SDK"""
+    sstate_dir = os.path.join(dest_sdk, 'sstate-cache')
+    if not os.path.exists(sstate_dir):
+        logger.error("Missing sstate-cache directory in %s, it might not be an extensible SDK." % dest_sdk)
+        raise
+    for sb in sstate_objects:
+        dst = sb.replace(src_sdk, dest_sdk)
+        destdir = os.path.dirname(dst)
+        mkdir(destdir)
+        logger.debug("Copying %s to %s" % (sb, dst))
+        shutil.copy(sb, dst)
+
+def sdk_update(args, config, basepath, workspace):
+    # Fetch locked-sigs.inc file from remote/local destination
+    from ConfigParser import NoSectionError
+    updateserver = args.updateserver
+    if not updateserver:
+        try:
+            updateserver = config.get('SDK', 'updateserver', None)
+        except NoSectionError:
+            pass
+    if not updateserver:
+        raise DevtoolError("Update server not specified in config file, you must specify it on the command line")
+    logger.debug("updateserver: %s" % args.updateserver)
+
+    # Make sure we are using sdk-update from within SDK
+    logger.debug("basepath = %s" % basepath)
+    old_locked_sig_file_path = os.path.join(basepath, 'conf/locked-sigs.inc')
+    if not os.path.exists(old_locked_sig_file_path):
+        logger.error("Not using devtool's sdk-update command from within an extensible SDK. Please specify correct basepath via --basepath option")
+        return -1
+    else:
+        logger.debug("Found conf/locked-sigs.inc in %s" % basepath)
+
+    if ':' in args.updateserver:
+        is_remote = True
+    else:
+        is_remote = False
+
+    if not is_remote:
+        # devtool sdk-update /local/path/to/latest/sdk
+        new_locked_sig_file_path = os.path.join(args.updateserver, 'conf/locked-sigs.inc')
+        if not os.path.exists(new_locked_sig_file_path):
+            logger.error("%s doesn't exist or is not an extensible SDK" % args.updateserver)
+            return -1
+        else:
+            logger.debug("Found conf/locked-sigs.inc in %s" % args.updateserver)
+        update_dict = generate_update_dict(new_locked_sig_file_path, old_locked_sig_file_path)
+        logger.debug("update_dict = %s" % update_dict)
+        sstate_objects = get_sstate_objects(update_dict, args.updateserver)
+        logger.debug("sstate_objects = %s" % sstate_objects)
+        if len(sstate_objects) == 0:
+            logger.info("No need to update.")
+            return 0
+        logger.info("Installing sstate objects into %s", basepath)
+        install_sstate_objects(sstate_objects, args.updateserver.rstrip('/'), basepath)
+        logger.info("Updating configuration files")
+        new_conf_dir = os.path.join(args.updateserver, 'conf')
+        old_conf_dir = os.path.join(basepath, 'conf')
+        shutil.rmtree(old_conf_dir)
+        shutil.copytree(new_conf_dir, old_conf_dir)
+        logger.info("Updating layers")
+        new_layers_dir = os.path.join(args.updateserver, 'layers')
+        old_layers_dir = os.path.join(basepath, 'layers')
+        shutil.rmtree(old_layers_dir)
+        shutil.copytree(new_layers_dir, old_layers_dir)
+    else:
+        # devtool sdk-update http://myhost/sdk
+        tmpsdk_dir = '/tmp/sdk-ext'
+        if os.path.exists(tmpsdk_dir):
+            shutil.rmtree(tmpsdk_dir)
+        os.makedirs(tmpsdk_dir)
+        os.makedirs(os.path.join(tmpsdk_dir, 'conf'))
+        # Fetch locked-sigs.inc from update server
+        ret = subprocess.call("wget -q -O - %s/conf/locked-sigs.inc > %s/locked-sigs.inc" % (args.updateserver, os.path.join(tmpsdk_dir, 'conf')), shell=True)
+        if ret != 0:
+            logger.error("Fetching conf/locked-sigs.inc from %s to %s/locked-sigs.inc failed" % (args.updateserver, os.path.join(tmpsdk_dir, 'conf')))
+            return ret
+        else:
+            logger.info("Fetching conf/locked-sigs.inc from %s to %s/locked-sigs.inc succeeded" % (args.updateserver, os.path.join(tmpsdk_dir, 'conf')))
+        new_locked_sig_file_path = os.path.join(tmpsdk_dir, 'conf/locked-sigs.inc')
+        update_dict = generate_update_dict(new_locked_sig_file_path, old_locked_sig_file_path)
+        logger.debug("update_dict = %s" % update_dict)
+        if len(update_dict) == 0:
+            logger.info("No need to update.")
+            return 0
+        # Update metadata
+        logger.debug("Updating meta data via git ...")
+        # Try using 'git pull', if failed, use 'git clone'
+        if os.path.exists(os.path.join(basepath, 'layers/.git')):
+            ret = subprocess.call("cd layers && git pull", shell=True)
+        else:
+            ret = -1
+        if ret != 0:
+            ret = subprocess.call("rm -rf layers && git clone %s/layers" % args.updateserver, shell=True)
+        if ret != 0:
+            logger.error("Updating meta data via git failed")
+            return ret
+        logger.debug("Updating conf files ...")
+        conf_files = ['local.conf', 'bblayers.conf', 'devtool.conf', 'work-config.inc', 'locked-sigs.inc']
+        for conf in conf_files:
+            ret = subprocess.call("wget -q -O - %s/conf/%s > conf/%s" % (args.updateserver, conf, conf), shell=True)
+            if ret != 0:
+                logger.error("Update %s failed" % conf)
+                return ret
+        with open(os.path.join(basepath, 'conf/local.conf'), 'a') as f:
+            f.write('SSTATE_MIRRORS_append = " file://.* %s/sstate-cache/PATH \\n "\n' % args.updateserver)
+
+    # Run bitbake command for the whole SDK
+    sdk_targets = config.get('SDK', 'sdk_targets')
+    logger.info("Executing 'bitbake %s' ... (This may take some time.)" % sdk_targets)
+    try:
+        exec_build_env_command(config.init_path, basepath, 'bitbake %s' % sdk_targets)
+    except:
+        logger.error('bitbake %s failed' % sdk_targets)
+        return -1
+    return 0
+
+def register_commands(subparsers, context):
+    """Register devtool subcommands from the sdk plugin"""
+    if context.fixed_setup:
+        parser_sdk = subparsers.add_parser('sdk-update', help='Update SDK components from a nominated location')
+        parser_sdk.add_argument('updateserver', help='The update server to fetch latest SDK components from', nargs='?')
+        parser_sdk.set_defaults(func=sdk_update)
-- 
2.1.0


