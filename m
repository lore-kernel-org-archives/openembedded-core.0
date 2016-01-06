Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id ADDC2731E6
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Jan 2016 11:17:01 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 06 Jan 2016 03:16:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,528,1444719600"; d="scan'208";a="875594381"
Received: from ngochun1-mobl.ccr.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.145.179])
	by fmsmga001.fm.intel.com with ESMTP; 06 Jan 2016 03:16:48 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  7 Jan 2016 00:15:48 +1300
Message-Id: <446bf2bed8c465f8726e3ed29f00f158feef98e1.1452078721.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1452078721.git.paul.eggleton@linux.intel.com>
References: <cover.1452078721.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1452078721.git.paul.eggleton@linux.intel.com>
References: <cover.1452078721.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 07/14] devtool: sdk-update: add option to skip preparation step
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
X-List-Received-Date: Wed, 06 Jan 2016 11:17:01 -0000

For debugging purposes it's useful to be able to skip the preparation
step so you can inspect what the state of the build system is first.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/lib/devtool/sdk.py | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/scripts/lib/devtool/sdk.py b/scripts/lib/devtool/sdk.py
index 2d9d911..7faefab 100644
--- a/scripts/lib/devtool/sdk.py
+++ b/scripts/lib/devtool/sdk.py
@@ -173,14 +173,15 @@ def sdk_update(args, config, basepath, workspace):
         with open(os.path.join(basepath, 'conf/local.conf'), 'a') as f:
             f.write('SSTATE_MIRRORS_append = " file://.* %s/sstate-cache/PATH \\n "\n' % updateserver)
 
-    # Run bitbake command for the whole SDK
-    sdk_targets = config.get('SDK', 'sdk_targets')
-    logger.info("Executing 'bitbake %s' ... (This may take some time.)" % sdk_targets)
-    try:
-        exec_build_env_command(config.init_path, basepath, 'bitbake %s' % sdk_targets)
-    except:
-        logger.error('bitbake %s failed' % sdk_targets)
-        return -1
+    if not args.skip_prepare:
+        # Run bitbake command for the whole SDK
+        sdk_targets = config.get('SDK', 'sdk_targets')
+        logger.info("Preparing build system... (This may take some time.)")
+        try:
+            exec_build_env_command(config.init_path, basepath, 'bitbake %s' % sdk_targets)
+        except:
+            logger.error('bitbake %s failed' % sdk_targets)
+            return -1
     return 0
 
 def register_commands(subparsers, context):
@@ -188,4 +189,5 @@ def register_commands(subparsers, context):
     if context.fixed_setup:
         parser_sdk = subparsers.add_parser('sdk-update', help='Update SDK components from a nominated location')
         parser_sdk.add_argument('updateserver', help='The update server to fetch latest SDK components from', nargs='?')
+        parser_sdk.add_argument('--skip-prepare', action="store_true", help='Skip re-preparing the build system after updating (for debugging only)')
         parser_sdk.set_defaults(func=sdk_update)
-- 
2.5.0


