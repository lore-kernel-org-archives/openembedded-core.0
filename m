Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 158D6767EF
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Aug 2015 03:17:58 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t7A3HwKR010994
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 9 Aug 2015 20:17:58 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.211) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.235.1; Sun, 9 Aug 2015 20:17:57 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 10 Aug 2015 11:18:04 +0800
Message-ID: <dd54452b17ce0907c59d8f1fee0406265ae80533.1438667914.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1438667914.git.Qi.Chen@windriver.com>
References: <cover.1438667914.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 6/8] oe-publish-sdk: add script
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
X-List-Received-Date: Mon, 10 Aug 2015 03:17:58 -0000
Content-Type: text/plain

Add a script to publish extensible SDK to a specified destination.

oe-publish-sdk <ext-sdk> <destination>

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 scripts/oe-publish-sdk | 124 +++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 124 insertions(+)
 create mode 100755 scripts/oe-publish-sdk

diff --git a/scripts/oe-publish-sdk b/scripts/oe-publish-sdk
new file mode 100755
index 0000000..90bedac
--- /dev/null
+++ b/scripts/oe-publish-sdk
@@ -0,0 +1,124 @@
+#!/usr/bin/env python
+
+# OpenEmbedded SDK Tool
+
+# oe-publish-sdk publish <ext-sdk> <destination>
+# <ext-sdk>: extensible SDK to publish
+# <destination>: local or remote location which servers as an SDK update server
+# e.g.
+# oe-publish-sdk publish sdk-ext.sh /mnt/poky/sdk-ext
+# oe-publish-sdk publish sdk-ext.sh user@host:/opt/poky/sdk-ext
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
+    is_remote = False
+    if ':' in destination:
+        is_remote = True
+
+    if not is_remote:
+        dest_sdk = os.path.join(destination, sdk_basename)
+        logger.debug("dest_sdk = %s" % dest_sdk)
+        mkdir(destination)
+        if os.path.exists(dest_sdk):
+            os.remove(dest_sdk)
+        if (os.stat(target_sdk).st_dev == os.stat(destination).st_dev):
+            os.link(target_sdk, dest_sdk)
+        else:
+            shutil.copy(target_sdk, dest_sdk)
+        # Unpack the SDK to get the sstate objects and manifests
+        # so that client side could do updates
+        logger.debug("Unpacking %s to %s ..." % (dest_sdk, destination))
+        ret = subprocess.call("sh %s -n -y -d %s" % (dest_sdk, destination), shell=True)
+        if ret == 0:
+            logger.info('Successfully unpacked %s to %s' % (dest_sdk, destination))
+        else:
+            logger.error('Failed to unpack %s to %s' % (dest_sdk, destination))
+
+        return ret
+    else:
+        host, destdir = destination.split(':')
+        logger.debug('Making sure %s on %s exists' % (destdir, host))
+        ret = subprocess.call("ssh %s 'rm -rf %s && mkdir -p %s'" % (host, destdir, destdir), shell=True)
+        if ret != 0:
+            logger.error("Making directory %s on %s failed" % (destdir, host))
+            return ret
+        logger.debug('Copying %s to %s' % (target_sdk, destination))
+        ret = subprocess.call("scp %s %s" % (target_sdk, destination), shell=True)
+        if ret != 0:
+            logger.error("scp failed")
+            return ret
+        dest_sdk = os.path.join(destdir, sdk_basename)
+        cmd = 'sh %s -n -y -d %s && cd %s/layers && git init . && mv .git/hooks/post-update.sample .git/hooks/post-update && git add . && git commit -m "init repo"' % (dest_sdk, destdir, destdir)
+        logger.debug("cmd is %s" % cmd)
+        logger.debug("Unpacking %s in %s" % (dest_sdk, destination))
+        ret = subprocess.call("ssh %s '%s'" % (host, cmd), shell=True)
+        if ret != 0:
+            logger.error("Failed to unpack SDK on %s" % destination)
+            return ret
+        else:
+            logger.info("Successfully published SDK to %s" % destination)
+            return 0
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
1.9.1


