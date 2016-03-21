Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 209386FFD3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Mar 2016 05:14:23 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga104.fm.intel.com with ESMTP; 20 Mar 2016 22:14:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,369,1455004800"; d="scan'208";a="938122137"
Received: from edeshpan-mobl5.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.136.133])
	by orsmga002.jf.intel.com with ESMTP; 20 Mar 2016 22:14:22 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 21 Mar 2016 18:14:00 +1300
Message-Id: <9ee928171a99cc61c37aa59de4848743001df1e0.1458537176.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <cover.1458537176.git.paul.eggleton@linux.intel.com>
References: <cover.1458537176.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1458537176.git.paul.eggleton@linux.intel.com>
References: <cover.1458537176.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/9] devtool: sdk-install: add option to allow building from source
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
X-List-Received-Date: Mon, 21 Mar 2016 05:14:23 -0000

By default the sdk-install subcommand expects to restore the requested
items from sstate and fails if it can't. If the user is OK with building
from source, add a -s/--allow-build option to allow them to do that. In
the process, ensure we show the status output while we're installing.

Also add the missing header to the top of the file.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/lib/devtool/sdk.py | 21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/scripts/lib/devtool/sdk.py b/scripts/lib/devtool/sdk.py
index 22c5279..b1905f9 100644
--- a/scripts/lib/devtool/sdk.py
+++ b/scripts/lib/devtool/sdk.py
@@ -1,4 +1,19 @@
 # Development tool - sdk-update command plugin
+#
+# Copyright (C) 2015-2016 Intel Corporation
+#
+# This program is free software; you can redistribute it and/or modify
+# it under the terms of the GNU General Public License version 2 as
+# published by the Free Software Foundation.
+#
+# This program is distributed in the hope that it will be useful,
+# but WITHOUT ANY WARRANTY; without even the implied warranty of
+# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+# GNU General Public License for more details.
+#
+# You should have received a copy of the GNU General Public License along
+# with this program; if not, write to the Free Software Foundation, Inc.,
+# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
 
 import os
 import subprocess
@@ -278,8 +293,11 @@ def sdk_install(args, config, basepath, workspace):
                 if recipe.endswith('-native') and 'package' in task:
                     continue
                 install_tasks.append('%s:%s' % (recipe, task))
+        options = ''
+        if not args.allow_build:
+            options += ' --setscene-only'
         try:
-            exec_build_env_command(config.init_path, basepath, 'bitbake --setscene-only %s' % ' '.join(install_tasks))
+            exec_build_env_command(config.init_path, basepath, 'bitbake %s %s' % (options, ' '.join(install_tasks)), watch=True)
         except bb.process.ExecutionError as e:
             raise DevtoolError('Failed to install %s:\n%s' % (recipe, str(e)))
         failed = False
@@ -312,4 +330,5 @@ def register_commands(subparsers, context):
                                                    description='Installs additional recipe development files into the SDK. (You can use "devtool search" to find available recipes.)',
                                                    group='sdk')
         parser_sdk_install.add_argument('recipename', help='Name of the recipe to install the development artifacts for', nargs='+')
+        parser_sdk_install.add_argument('-s', '--allow-build', help='Allow building requested item(s) from source', action='store_true')
         parser_sdk_install.set_defaults(func=sdk_install)
-- 
2.5.5


