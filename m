Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 8619B77196
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Feb 2016 09:39:53 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga103.jf.intel.com with ESMTP; 19 Feb 2016 01:39:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,469,1449561600"; d="scan'208";a="50773852"
Received: from eyeoh10-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.132.216])
	by fmsmga004.fm.intel.com with ESMTP; 19 Feb 2016 01:39:52 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 19 Feb 2016 22:38:56 +1300
Message-Id: <7c5b9d24688c2f1dc59ddfcce7e701ce6509e84a.1455874585.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1455874585.git.paul.eggleton@linux.intel.com>
References: <cover.1455874585.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1455874585.git.paul.eggleton@linux.intel.com>
References: <cover.1455874585.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 08/14] devtool: sdk-update: tweak command-line handling of updateserver
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
X-List-Received-Date: Fri, 19 Feb 2016 09:39:53 -0000

Get the default value for updateserver from the configuration file and
show it in the help; also only make the parameter optional if it's
specified. This means we can also drop the check in the function as
argparse will then ensure it's specified if there's no config setting.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/lib/devtool/sdk.py | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/scripts/lib/devtool/sdk.py b/scripts/lib/devtool/sdk.py
index f6c5434..fbf2e79 100644
--- a/scripts/lib/devtool/sdk.py
+++ b/scripts/lib/devtool/sdk.py
@@ -95,8 +95,6 @@ def sdk_update(args, config, basepath, workspace):
     updateserver = args.updateserver
     if not updateserver:
         updateserver = config.get('SDK', 'updateserver', '')
-    if not updateserver:
-        raise DevtoolError("Update server not specified in config file, you must specify it on the command line")
     logger.debug("updateserver: %s" % updateserver)
 
     # Make sure we are using sdk-update from within SDK
@@ -297,9 +295,14 @@ def register_commands(subparsers, context):
     """Register devtool subcommands from the sdk plugin"""
     if context.fixed_setup:
         parser_sdk = subparsers.add_parser('sdk-update',
-                                           help='Update SDK components from a nominated location',
+                                           help='Update SDK components',
+                                           description='Updates installed SDK components from a remote server',
                                            group='sdk')
-        parser_sdk.add_argument('updateserver', help='The update server to fetch latest SDK components from', nargs='?')
+        updateserver = context.config.get('SDK', 'updateserver', '')
+        if updateserver:
+            parser_sdk.add_argument('updateserver', help='The update server to fetch latest SDK components from (default %s)' % updateserver, nargs='?')
+        else:
+            parser_sdk.add_argument('updateserver', help='The update server to fetch latest SDK components from')
         parser_sdk.add_argument('--skip-prepare', action="store_true", help='Skip re-preparing the build system after updating (for debugging only)')
         parser_sdk.set_defaults(func=sdk_update)
 
-- 
2.5.0


