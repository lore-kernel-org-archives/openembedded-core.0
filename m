Return-Path: <randy.e.witt@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 2EEE8731D4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Feb 2016 17:18:27 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 18 Feb 2016 09:18:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,466,1449561600"; d="scan'208";a="915924523"
Received: from bitbang.jf.intel.com ([10.7.199.151])
	by orsmga002.jf.intel.com with ESMTP; 18 Feb 2016 09:18:02 -0800
From: Randy Witt <randy.e.witt@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 18 Feb 2016 09:17:54 -0800
Message-Id: <34bb4fbff2d992ad112d6be609efee2b2193d9ff.1455815778.git.randy.e.witt@linux.intel.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1455815778.git.randy.e.witt@linux.intel.com>
References: <cover.1455815778.git.randy.e.witt@linux.intel.com>
In-Reply-To: <cover.1455815778.git.randy.e.witt@linux.intel.com>
References: <cover.1455815778.git.randy.e.witt@linux.intel.com>
Subject: [PATCH 2/3] devtool: Don't recursively look for .devtoolbase in --basepath
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
X-List-Received-Date: Thu, 18 Feb 2016 17:18:27 -0000

If the user specifies --basepath on the commandline, only the directory
specified should be searched for .devtoolbase. Otherwise when --basepath
is a child of the sdk directory, .devtoolbase will always be found and
devtool will only show options meant to be used within an sdk.

Signed-off-by: Randy Witt <randy.e.witt@linux.intel.com>
---
 scripts/devtool | 28 ++++++++++++++++------------
 1 file changed, 16 insertions(+), 12 deletions(-)

diff --git a/scripts/devtool b/scripts/devtool
index 2d57da0b..23e9b50 100755
--- a/scripts/devtool
+++ b/scripts/devtool
@@ -192,13 +192,6 @@ def main():
 
     # Default basepath
     basepath = os.path.dirname(os.path.abspath(__file__))
-    pth = basepath
-    while pth != '' and pth != os.sep:
-        if os.path.exists(os.path.join(pth, '.devtoolbase')):
-            context.fixed_setup = True
-            basepath = pth
-            break
-        pth = os.path.dirname(pth)
 
     parser = argparse_oe.ArgumentParser(description="OpenEmbedded development tool",
                                         add_help=False,
@@ -224,11 +217,22 @@ def main():
     if global_args.basepath:
         # Override
         basepath = global_args.basepath
-    elif not context.fixed_setup:
-        basepath = os.environ.get('BUILDDIR')
-        if not basepath:
-            logger.error("This script can only be run after initialising the build environment (e.g. by using oe-init-build-env)")
-            sys.exit(1)
+        if os.path.exists(os.path.join(basepath, '.devtoolbase')):
+            context.fixed_setup = True
+    else:
+        pth = basepath
+        while pth != '' and pth != os.sep:
+            if os.path.exists(os.path.join(pth, '.devtoolbase')):
+                context.fixed_setup = True
+                basepath = pth
+                break
+            pth = os.path.dirname(pth)
+
+        if not context.fixed_setup:
+            basepath = os.environ.get('BUILDDIR')
+            if not basepath:
+                logger.error("This script can only be run after initialising the build environment (e.g. by using oe-init-build-env)")
+                sys.exit(1)
 
     logger.debug('Using basepath %s' % basepath)
 
-- 
2.5.0


