Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id EAFB07871D
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Dec 2017 01:41:42 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	04 Dec 2017 17:41:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.45,362,1508828400"; d="scan'208";a="181355940"
Received: from gsteoh-mobl3.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.249.76.232])
	by orsmga005.jf.intel.com with ESMTP; 04 Dec 2017 17:41:42 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 Dec 2017 14:41:13 +1300
Message-Id: <2b35c6f4e37ece0d6a7d46ed0195b88d83c162b5.1512438000.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.9.5
In-Reply-To: <cover.1512438000.git.paul.eggleton@linux.intel.com>
References: <cover.1512438000.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 04/12] devtool: deploy-target: don't specify ssh/scp port unless user does
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
X-List-Received-Date: Tue, 05 Dec 2017 01:41:43 -0000

If the user doesn't specify a port then we should avoid specifying one
on the ssh/scp command line in case the user has configured one for the
host they are connecting to, which was being overridden unnecessarily.

Fixes [YOCTO #12381].

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/lib/devtool/deploy.py | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/scripts/lib/devtool/deploy.py b/scripts/lib/devtool/deploy.py
index 9cc4927..52e261d 100644
--- a/scripts/lib/devtool/deploy.py
+++ b/scripts/lib/devtool/deploy.py
@@ -213,9 +213,7 @@ def deploy(args, config, basepath, workspace):
 
         scp_port = ''
         ssh_port = ''
-        if not args.port:
-            raise DevtoolError("If you specify -P/--port then you must provide the port to be used to connect to the target")
-        else:
+        if args.port:
             scp_port = "-P %s" % args.port
             ssh_port = "-p %s" % args.port
 
@@ -280,9 +278,7 @@ def undeploy(args, config, basepath, workspace):
 
     scp_port = ''
     ssh_port = ''
-    if not args.port:
-        raise DevtoolError("If you specify -P/--port then you must provide the port to be used to connect to the target")
-    else:
+    if args.port:
         scp_port = "-P %s" % args.port
         ssh_port = "-p %s" % args.port
 
@@ -328,7 +324,7 @@ def register_commands(subparsers, context):
     parser_deploy.add_argument('-n', '--dry-run', help='List files to be deployed only', action='store_true')
     parser_deploy.add_argument('-p', '--no-preserve', help='Do not preserve existing files', action='store_true')
     parser_deploy.add_argument('--no-check-space', help='Do not check for available space before deploying', action='store_true')
-    parser_deploy.add_argument('-P', '--port', default='22', help='Port to use for connection to the target')
+    parser_deploy.add_argument('-P', '--port', help='Specify port to use for connection to the target')
 
     strip_opts = parser_deploy.add_mutually_exclusive_group(required=False)
     strip_opts.add_argument('-S', '--strip',
@@ -350,5 +346,5 @@ def register_commands(subparsers, context):
     parser_undeploy.add_argument('-s', '--show-status', help='Show progress/status output', action='store_true')
     parser_undeploy.add_argument('-a', '--all', help='Undeploy all recipes deployed on the target', action='store_true')
     parser_undeploy.add_argument('-n', '--dry-run', help='List files to be undeployed only', action='store_true')
-    parser_undeploy.add_argument('-P', '--port', default='22', help='Port to use for connection to the target')
+    parser_undeploy.add_argument('-P', '--port', help='Specify port to use for connection to the target')
     parser_undeploy.set_defaults(func=undeploy)
-- 
2.9.5


