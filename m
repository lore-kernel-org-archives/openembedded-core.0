Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 5AD316FF04
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Nov 2015 02:11:15 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga103.fm.intel.com with ESMTP; 22 Nov 2015 18:11:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,334,1444719600"; d="scan'208";a="692213549"
Received: from echoo1-mobl1.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.170.181])
	by orsmga003.jf.intel.com with ESMTP; 22 Nov 2015 18:11:13 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 Nov 2015 15:09:37 +1300
Message-Id: <96581ee4836cae0804b4754b918faac1fc4399d8.1448244474.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1448244474.git.paul.eggleton@linux.intel.com>
References: <cover.1448244474.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1448244474.git.paul.eggleton@linux.intel.com>
References: <cover.1448244474.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 18/18] recipetool: make plugin registration function name consistent with devtool
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
X-List-Received-Date: Mon, 23 Nov 2015 02:11:16 -0000

This should have been register_commands rather than register_command;
I used register_commands in devtool so lets change this here to be
consistent with that. (Since this is extensible through layers though we
need to remain compatible with the old name, so fall back to that if the
new function name isn't there.)

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/lib/recipetool/append.py    | 2 +-
 scripts/lib/recipetool/create.py    | 2 +-
 scripts/lib/recipetool/newappend.py | 2 +-
 scripts/lib/recipetool/setvar.py    | 2 +-
 scripts/recipetool                  | 6 +++++-
 5 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/scripts/lib/recipetool/append.py b/scripts/lib/recipetool/append.py
index 7fe4115..fc2008c 100644
--- a/scripts/lib/recipetool/append.py
+++ b/scripts/lib/recipetool/append.py
@@ -433,7 +433,7 @@ def target_path(targetpath):
     return targetpath
 
 
-def register_command(subparsers):
+def register_commands(subparsers):
     common = argparse.ArgumentParser(add_help=False)
     common.add_argument('-m', '--machine', help='Make bbappend changes specific to a machine only', metavar='MACHINE')
     common.add_argument('-w', '--wildcard-version', help='Use wildcard to make the bbappend apply to any recipe version', action='store_true')
diff --git a/scripts/lib/recipetool/create.py b/scripts/lib/recipetool/create.py
index 15aa9bd..2d75046 100644
--- a/scripts/lib/recipetool/create.py
+++ b/scripts/lib/recipetool/create.py
@@ -436,7 +436,7 @@ def convert_debian(debpath):
     return values
 
 
-def register_command(subparsers):
+def register_commands(subparsers):
     parser_create = subparsers.add_parser('create',
                                           help='Create a new recipe',
                                           description='Creates a new recipe from a source tree')
diff --git a/scripts/lib/recipetool/newappend.py b/scripts/lib/recipetool/newappend.py
index 4eeac0e..f9b8d85 100644
--- a/scripts/lib/recipetool/newappend.py
+++ b/scripts/lib/recipetool/newappend.py
@@ -97,7 +97,7 @@ def newappend(args):
     print(append_path)
 
 
-def register_command(subparsers):
+def register_commands(subparsers):
     parser = subparsers.add_parser('newappend',
                                    help='Create a bbappend for the specified target in the specified layer')
     parser.add_argument('-w', '--wildcard-version', help='Use wildcard to make the bbappend apply to any recipe version', action='store_true')
diff --git a/scripts/lib/recipetool/setvar.py b/scripts/lib/recipetool/setvar.py
index 18e3281..657d2b6 100644
--- a/scripts/lib/recipetool/setvar.py
+++ b/scripts/lib/recipetool/setvar.py
@@ -62,7 +62,7 @@ def setvar(args):
     return 0
 
 
-def register_command(subparsers):
+def register_commands(subparsers):
     parser_setvar = subparsers.add_parser('setvar',
                                           help='Set a variable within a recipe',
                                           description='Adds/updates the value a variable is set to in a recipe')
diff --git a/scripts/recipetool b/scripts/recipetool
index 4af0bfb..791a66a 100755
--- a/scripts/recipetool
+++ b/scripts/recipetool
@@ -82,7 +82,11 @@ def main():
 
     registered = False
     for plugin in plugins:
-        if hasattr(plugin, 'register_command'):
+        if hasattr(plugin, 'register_commands'):
+            registered = True
+            plugin.register_commands(subparsers)
+        elif hasattr(plugin, 'register_command'):
+            # Legacy function name
             registered = True
             plugin.register_command(subparsers)
         if hasattr(plugin, 'tinfoil_init'):
-- 
2.1.0


