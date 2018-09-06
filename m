Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5BA4A7953E
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Sep 2018 06:51:21 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w866pMJN013219
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 5 Sep 2018 23:51:22 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.218) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.408.0; Wed, 5 Sep 2018 23:51:21 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 6 Sep 2018 14:56:15 +0800
Message-ID: <a74b019a7a5b01a8a0f9933f5d628f3e1fd8252f.1536216942.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1536216942.git.Qi.Chen@windriver.com>
References: <cover.1536216942.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] build.py: add clean option to 'devtool build' command
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
X-List-Received-Date: Thu, 06 Sep 2018 06:51:21 -0000
Content-Type: text/plain

Add -c (--clean) optiont to 'devtool build' command so that users
could easily clean things up when using devtool.

I encountered a problem about do_prepare_recipe_sysroot failure
when using `devtool build' command and I found myself in a situation
where I either have to use `bitbake' command to clean things up or
use `rm' to remove the directories under ${WORKDIR}.

So add a clean option as it would be helpful when users want to clean
things up to prepare an environment for a clean build.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 scripts/lib/devtool/build.py | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/scripts/lib/devtool/build.py b/scripts/lib/devtool/build.py
index 252379e..ba9593f 100644
--- a/scripts/lib/devtool/build.py
+++ b/scripts/lib/devtool/build.py
@@ -54,7 +54,11 @@ def build(args, config, basepath, workspace):
     """Entry point for the devtool 'build' subcommand"""
     workspacepn = check_workspace_recipe(workspace, args.recipename, bbclassextend=True)
 
-    build_tasks = _get_build_tasks(config)
+    if args.clean:
+        # use clean instead of cleansstate to avoid messing things up in eSDK
+        build_tasks = ['do_clean']
+    else:
+        build_tasks = _get_build_tasks(config)
 
     bbappend = workspace[workspacepn]['bbappend']
     if args.disable_parallel_make:
@@ -83,4 +87,5 @@ def register_commands(subparsers, context):
                                          group='working', order=50)
     parser_build.add_argument('recipename', help='Recipe to build')
     parser_build.add_argument('-s', '--disable-parallel-make', action="store_true", help='Disable make parallelism')
+    parser_build.add_argument('-c', '--clean', action='store_true', help='clean up recipe building results')
     parser_build.set_defaults(func=build)
-- 
1.9.1


