Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 9042A727DC
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Feb 2015 14:05:35 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga103.jf.intel.com with ESMTP; 05 Feb 2015 05:59:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.09,524,1418112000"; d="scan'208";a="647782353"
Received: from mhgreen-mobl5.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.19.49])
	by orsmga001.jf.intel.com with ESMTP; 05 Feb 2015 06:04:08 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Feb 2015 14:04:00 +0000
Message-Id: <06e63bf744c468f810331f48313633607f14009c.1423144990.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <cover.1423144990.git.paul.eggleton@linux.intel.com>
References: <cover.1423144990.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1423144990.git.paul.eggleton@linux.intel.com>
References: <cover.1423144990.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 2/2] recipetool: improve command-line help
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
X-List-Received-Date: Thu, 05 Feb 2015 14:05:36 -0000

Based on feedback from Scott Rifenbark <scott.m.rifenbark@intel.com>

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/lib/recipetool/create.py | 8 +++++---
 scripts/recipetool               | 6 +++---
 2 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/scripts/lib/recipetool/create.py b/scripts/lib/recipetool/create.py
index 38f5ead..290fc13 100644
--- a/scripts/lib/recipetool/create.py
+++ b/scripts/lib/recipetool/create.py
@@ -406,10 +406,12 @@ def convert_debian(debpath):
 
 
 def register_command(subparsers):
-    parser_create = subparsers.add_parser('create', help='Create a new recipe')
+    parser_create = subparsers.add_parser('create',
+                                          help='Create a new recipe',
+                                          description='Creates a new recipe from a source tree')
     parser_create.add_argument('source', help='Path or URL to source')
-    parser_create.add_argument('-o', '--outfile', help='Full path and filename to recipe to add', required=True)
+    parser_create.add_argument('-o', '--outfile', help='Specify filename for recipe to create', required=True)
     parser_create.add_argument('-m', '--machine', help='Make recipe machine-specific as opposed to architecture-specific', action='store_true')
-    parser_create.add_argument('-x', '--externalsrc', help='Assuming source is a URL, fetch it and extract it to the specified directory')
+    parser_create.add_argument('-x', '--extract-to', metavar='EXTRACTPATH', help='Assuming source is a URL, fetch it and extract it to the directory specified as %(metavar)s')
     parser_create.set_defaults(func=create_recipe)
 
diff --git a/scripts/recipetool b/scripts/recipetool
index 70e6b6c..2cfa763 100755
--- a/scripts/recipetool
+++ b/scripts/recipetool
@@ -49,11 +49,11 @@ def main():
         sys.exit(1)
 
     parser = argparse.ArgumentParser(description="OpenEmbedded recipe tool",
-                                     epilog="Use %(prog)s <command> --help to get help on a specific command")
+                                     epilog="Use %(prog)s <subcommand> --help to get help on a specific command")
     parser.add_argument('-d', '--debug', help='Enable debug output', action='store_true')
     parser.add_argument('-q', '--quiet', help='Print only errors', action='store_true')
-    parser.add_argument('--color', help='Colorize output', choices=['auto', 'always', 'never'], default='auto')
-    subparsers = parser.add_subparsers()
+    parser.add_argument('--color', choices=['auto', 'always', 'never'], default='auto', help='Colorize output (where %(metavar)s is %(choices)s)', metavar='COLOR')
+    subparsers = parser.add_subparsers(title='subcommands', metavar='<subcommand>')
 
     scriptutils.load_plugins(logger, plugins, os.path.join(scripts_path, 'lib', 'recipetool'))
     registered = False
-- 
1.9.3


