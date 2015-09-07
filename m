Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 7BCDD76FDE
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Sep 2015 12:42:50 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga101.jf.intel.com with ESMTP; 07 Sep 2015 05:42:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,485,1437462000"; d="scan'208";a="556940060"
Received: from wmurray-mobl3.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.25.6])
	by FMSMGA003.fm.intel.com with ESMTP; 07 Sep 2015 05:42:50 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  7 Sep 2015 13:42:26 +0100
Message-Id: <67d1bce3e012ae33dfc85e3ae78aeab0c2f55499.1441629547.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1441629547.git.paul.eggleton@linux.intel.com>
References: <cover.1441629547.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1441629547.git.paul.eggleton@linux.intel.com>
References: <cover.1441629547.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 10/11] oe-publish-sdk: add script
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
X-List-Received-Date: Mon, 07 Sep 2015 12:42:50 -0000

From: "Qi.Chen@windriver.com" <Qi.Chen@windriver.com>

Add a script to publish an extensible SDK that has previously been built
to a specified destination. This published SDK is intended to be
accessed by the devtool sdk-update command from an installed copy of the
extensible SDK.

e.g.
oe-publish-sdk <ext-sdk> <destination>

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/oe-publish-sdk | 143 +++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 143 insertions(+)
 create mode 100755 scripts/oe-publish-sdk

diff --git a/scripts/oe-publish-sdk b/scripts/oe-publish-sdk
new file mode 100755
index 0000000..1737c9f
--- /dev/null
+++ b/scripts/oe-publish-sdk
@@ -0,0 +1,143 @@
+#!/usr/bin/env python
+
+# OpenEmbedded SDK publishing tool
+
+# oe-publish-sdk publish <ext-sdk> <destination>
+# <ext-sdk>: extensible SDK to publish (path to the installer shell script)
+# <destination>: local or remote location which servers as an SDK update server
+# e.g.
+# oe-publish-sdk /path/to/sdk-ext.sh /mnt/poky/sdk-ext
+# oe-publish-sdk /path/to/sdk-ext.sh user@host:/opt/poky/sdk-ext
+#
+
+import sys
+import os
+import argparse
+import glob
+import re
+import subprocess
+import logging
+import shutil
+import errno
+
+scripts_path = os.path.dirname(os.path.realpath(__file__))
+lib_path = scripts_path + '/lib'
+sys.path = sys.path + [lib_path]
+import scriptutils
+logger = scriptutils.logger_create('sdktool')
+
+def mkdir(d):
+    try:
+        os.makedirs(d)
+    except OSError as e:
+        if e.errno != errno.EEXIST:
+            raise e
+
+def publish(args):
+    logger.debug("In publish function")
+    target_sdk = args.sdk
+    destination = args.dest
+    logger.debug("target_sdk = %s, update_server = %s" % (target_sdk, destination))
+    sdk_basename = os.path.basename(target_sdk)
+
+    # Ensure the SDK exists
+    if not os.path.exists(target_sdk):
+        logger.error("%s doesn't exist" % target_sdk)
+        return -1
+
+    if ':' in destination:
+        is_remote = True
+        host, destdir = destination.split(':')
+        dest_sdk = os.path.join(destdir, sdk_basename)
+    else:
+        is_remote = False
+        dest_sdk = os.path.join(destination, sdk_basename)
+
+    # Making sure the directory exists
+    logger.debug("Making sure the destination directory exists")
+    if not is_remote:
+        mkdir(destination)
+    else:
+        cmd = "ssh %s 'mkdir -p %s'" % (host, destdir)
+        ret = subprocess.call(cmd, shell=True)
+        if ret != 0:
+            logger.error("Making directory %s on %s failed" % (destdir, host))
+            return ret
+
+    # Copying the SDK to the destination
+    logger.info("Copying the SDK to destination")
+    if not is_remote:
+        if os.path.exists(dest_sdk):
+            os.remove(dest_sdk)
+        if (os.stat(target_sdk).st_dev == os.stat(destination).st_dev):
+            os.link(target_sdk, dest_sdk)
+        else:
+            shutil.copy(target_sdk, dest_sdk)
+    else:
+        cmd = "scp %s %s" % (target_sdk, destination)
+        ret = subprocess.call(cmd, shell=True)
+        if ret != 0:
+            logger.error("scp %s %s failed" % (target_sdk, destination))
+            return ret
+
+    # Unpack the SDK
+    logger.info("Unpacking SDK")
+    if not is_remote:
+        cmd = "sh %s -n -y -d %s" % (dest_sdk, destination)
+        ret = subprocess.call(cmd, shell=True)
+        if ret == 0:
+            logger.info('Successfully unpacked %s to %s' % (dest_sdk, destination))
+        else:
+            logger.error('Failed to unpack %s to %s' % (dest_sdk, destination))
+            return ret
+    else:
+        cmd = "ssh %s 'sh %s -n -y -d %s'" % (host, dest_sdk, destdir)
+        ret = subprocess.call(cmd, shell=True)
+        if ret == 0:
+            logger.info('Successfully unpacked %s to %s' % (dest_sdk, destdir))
+        else:
+            logger.error('Failed to unpack %s to %s' % (dest_sdk, destdir))
+            return ret
+
+    # Setting up the git repo
+    if not is_remote:
+        cmd = 'set -e; cd %s/layers; if [ ! -e .git ]; then git init .; mv .git/hooks/post-update.sample .git/hooks/post-update; fi; git add -A .; git commit -q -m "init repo" || true;' % destination
+    else:
+        cmd = "ssh %s 'set -e; cd %s/layers; if [ ! -e .git ]; then git init .; mv .git/hooks/post-update.sample .git/hooks/post-update; fi; git add -A .; git commit -q -m \"init repo\" || true;'" % (host, destdir)
+    ret = subprocess.call(cmd, shell=True)
+    if ret == 0:
+        logger.info('SDK published successfully')
+    else:
+        logger.error('Failed to set up layer git repo')
+    return ret
+
+
+def main():
+    parser = argparse.ArgumentParser(description="OpenEmbedded development tool",
+                                     epilog="Use %(prog)s <subcommand> --help to get help on a specific command")
+    parser.add_argument('-d', '--debug', help='Enable debug output', action='store_true')
+    parser.add_argument('-q', '--quiet', help='Print only errors', action='store_true')
+
+    parser.add_argument('sdk', help='Extensible SDK to publish')
+    parser.add_argument('dest', help='Destination to publish SDK to')
+
+    parser.set_defaults(func=publish)
+
+    args = parser.parse_args()
+
+    if args.debug:
+        logger.setLevel(logging.DEBUG)
+    elif args.quiet:
+        logger.setLevel(logging.ERROR)
+
+    ret = args.func(args)
+    return ret
+
+if __name__ == "__main__":
+    try:
+        ret = main()
+    except Exception:
+        ret = 1
+        import traceback
+        traceback.print_exc(5)
+    sys.exit(ret)
-- 
2.1.0


