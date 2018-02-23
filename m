Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id F394071AB9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Feb 2018 03:03:03 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	22 Feb 2018 19:03:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.47,381,1515484800"; d="scan'208";a="30026571"
Received: from vsharmab-mobl.amr.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.249.74.120])
	by orsmga003.jf.intel.com with ESMTP; 22 Feb 2018 19:03:03 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 23 Feb 2018 16:02:13 +1300
Message-Id: <9f7cbbf46ab6467f3d3f5bbaaf3c3dd2e86df4a9.1519354910.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <cover.1519354910.git.paul.eggleton@linux.intel.com>
References: <cover.1519354910.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 5/8] devtool: deploy-target: don't specify ssh/scp port unless user does
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
X-List-Received-Date: Fri, 23 Feb 2018 03:03:04 -0000

If the user doesn't specify a port then we should avoid specifying one
on the ssh/scp command line in case the user has configured one for the
host they are connecting to, which was being overridden unnecessarily.

Fixes [YOCTO #12381].

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/lib/devtool/deploy.py | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/scripts/lib/devtool/deploy.py b/scripts/lib/devtool/deploy.py
index 9cc492788b6..52e261d5600 100644
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
2.14.3


