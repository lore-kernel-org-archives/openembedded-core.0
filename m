Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 04D4373E11
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Aug 2015 07:06:41 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t7K76gdw013484
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Aug 2015 00:06:42 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.211) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.235.1; Thu, 20 Aug 2015 00:06:41 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 20 Aug 2015 15:07:03 +0800
Message-ID: <cd47fe141d2a0036294838ecb1729a4293453825.1440054343.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1440054343.git.Qi.Chen@windriver.com>
References: <cover.1440054343.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH V2 7/7] devtool: add sdk.py plugin
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
X-List-Received-Date: Thu, 20 Aug 2015 07:06:42 -0000
Content-Type: text/plain

This plugin is only enabled when devtool is used within the extensible
SDK. It is used to update the current SDK from a local or remote server.

E.g.
devtool sdk-update /mnt/sdk-repo/
devtool sdk-update http://mysdkhost/sdk

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 scripts/lib/devtool/sdk.py | 188 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 188 insertions(+)
 create mode 100644 scripts/lib/devtool/sdk.py

diff --git a/scripts/lib/devtool/sdk.py b/scripts/lib/devtool/sdk.py
new file mode 100644
index 0000000..9bc21ea
--- /dev/null
+++ b/scripts/lib/devtool/sdk.py
@@ -0,0 +1,188 @@
+# Development tool - sdk-update command plugin
+
+import os
+import subprocess
+import logging
+import glob
+import shutil
+import errno
+import sys
+from devtool import exec_build_env_command, setup_tinfoil
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
+        parser_sdk = subparsers.add_parser('sdk-update', help='Update SDK components from a nominated destination')
+        parser_sdk.add_argument('updateserver', help='The update server to fetch latest SDK components')
+        parser_sdk.set_defaults(func=sdk_update)
-- 
1.9.1


