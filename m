Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by mx.groups.io with SMTP id smtpd.web08.17084.1627890833514922652
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Aug 2021 00:53:54 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.136, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10063"; a="193002140"
X-IronPort-AV: E=Sophos;i="5.84,288,1620716400"; 
   d="scan'208";a="193002140"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2021 00:53:36 -0700
X-IronPort-AV: E=Sophos;i="5.84,288,1620716400"; 
   d="scan'208";a="478655289"
Received: from chewchoo-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.215.228.46])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2021 00:53:35 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 33/37] yocto-check-layer: ensure that all layer dependencies are tested too
Date: Mon,  2 Aug 2021 15:52:20 +0800
Message-Id: <4a5bcd5fe81f0b6d1b8fac700eb19f1651809109.1627890114.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1627890114.git.anuj.mittal@intel.com>
References: <cover.1627890114.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Nicolas Dechesne <nicolas.dechesne@linaro.org>

In order to be compliant with the YP compatible status, a layer also
needs to ensure that all its dependencies are compatible
too. Currently yocto-check-layer only checks the requested layer,
without testing any dependencies.

With this change, all dependencies are also checked by default, so the
summary printed at the end will give a clear picture whether all
dependencies pass the script or not.

Using --no-auto-dependency can be used to skip that.

Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 45d59b774b95c91193a8376b83c05291d555e5c8)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 scripts/yocto-check-layer | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/scripts/yocto-check-layer b/scripts/yocto-check-layer
index 8e94a03b11..6975b09502 100755
--- a/scripts/yocto-check-layer
+++ b/scripts/yocto-check-layer
@@ -24,7 +24,7 @@ import scriptpath
 scriptpath.add_oe_lib_path()
 scriptpath.add_bitbake_lib_path()
 
-from checklayer import LayerType, detect_layers, add_layers, add_layer_dependencies, get_signatures, check_bblayers
+from checklayer import LayerType, detect_layers, add_layers, add_layer_dependencies, get_layer_dependencies, get_signatures, check_bblayers
 from oeqa.utils.commands import get_bb_vars
 
 PROGNAME = 'yocto-check-layer'
@@ -51,6 +51,8 @@ def main():
             help='File to output log (optional)', action='store')
     parser.add_argument('--dependency', nargs="+",
             help='Layers to process for dependencies', action='store')
+    parser.add_argument('--no-auto-dependency', help='Disable automatic testing of dependencies',
+            action='store_true')
     parser.add_argument('--machines', nargs="+",
             help='List of MACHINEs to be used during testing', action='store')
     parser.add_argument('--additional-layers', nargs="+",
@@ -121,6 +123,21 @@ def main():
     if not layers:
         return 1
 
+    # Find all dependencies, and get them checked too
+    if not args.no_auto_dependency:
+        depends = []
+        for layer in layers:
+            layer_depends = get_layer_dependencies(layer, dep_layers, logger)
+            if layer_depends:
+                for d in layer_depends:
+                    if d not in depends:
+                        depends.append(d)
+
+        for d in depends:
+            if d not in layers:
+                logger.info("Adding %s to the list of layers to test, as a dependency", d['name'])
+                layers.append(d)
+
     shutil.copyfile(bblayersconf, bblayersconf + '.backup')
     def cleanup_bblayers(signum, frame):
         shutil.copyfile(bblayersconf + '.backup', bblayersconf)
-- 
2.31.1

