Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 26BE87723E
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Jun 2016 12:36:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u51CZslS006905; Wed, 1 Jun 2016 13:35:57 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id HIecCnvXtJre; Wed,  1 Jun 2016 13:35:57 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u51CZp2u006880
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 1 Jun 2016 13:35:52 +0100
Received: from richard by hex with local (Exim 4.86)
	(envelope-from <richard@rpsys.net>)
	id 1b85NH-0000ku-CC; Wed, 01 Jun 2016 13:35:51 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Wed,  1 Jun 2016 13:35:30 +0100
Message-Id: <1464784540-2786-12-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1464784540-2786-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1464784540-2786-1-git-send-email-richard.purdie@linuxfoundation.org>
Subject: [PATCH 12/22] scripts: Replace basestring -> str for python3
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
X-List-Received-Date: Wed, 01 Jun 2016 12:36:02 -0000

From: Ed Bartosh <ed.bartosh@linux.intel.com>

Python 3 doesn't have basestring type as all string
are unicode strings.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/files/ext-sdk-prepare.py                    | 2 +-
 scripts/lib/devtool/__init__.py                  | 2 +-
 scripts/lib/recipetool/create.py                 | 2 +-
 scripts/lib/recipetool/create_buildsys_python.py | 6 +++---
 scripts/lib/scriptutils.py                       | 2 +-
 5 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/meta/files/ext-sdk-prepare.py b/meta/files/ext-sdk-prepare.py
index 605e2eb..bf0d033 100644
--- a/meta/files/ext-sdk-prepare.py
+++ b/meta/files/ext-sdk-prepare.py
@@ -8,7 +8,7 @@ import subprocess
 
 def exec_watch(cmd, **options):
     """Run program with stdout shown on sys.stdout"""
-    if isinstance(cmd, basestring) and not "shell" in options:
+    if isinstance(cmd, str) and not "shell" in options:
         options["shell"] = True
 
     process = subprocess.Popen(
diff --git a/scripts/lib/devtool/__init__.py b/scripts/lib/devtool/__init__.py
index 506d95b..6f5bb8d 100644
--- a/scripts/lib/devtool/__init__.py
+++ b/scripts/lib/devtool/__init__.py
@@ -59,7 +59,7 @@ def exec_build_env_command(init_path, builddir, cmd, watch=False, **options):
 def exec_watch(cmd, **options):
     """Run program with stdout shown on sys.stdout"""
     import bb
-    if isinstance(cmd, basestring) and not "shell" in options:
+    if isinstance(cmd, str) and not "shell" in options:
         options["shell"] = True
 
     process = subprocess.Popen(
diff --git a/scripts/lib/recipetool/create.py b/scripts/lib/recipetool/create.py
index 5a37d18..e3e01e3 100644
--- a/scripts/lib/recipetool/create.py
+++ b/scripts/lib/recipetool/create.py
@@ -167,7 +167,7 @@ class RecipeHandler(object):
         unmappedpc = []
         pcdeps = list(set(pcdeps))
         for pcdep in pcdeps:
-            if isinstance(pcdep, basestring):
+            if isinstance(pcdep, str):
                 recipe = recipemap.get(pcdep, None)
                 if recipe:
                     deps.append(recipe)
diff --git a/scripts/lib/recipetool/create_buildsys_python.py b/scripts/lib/recipetool/create_buildsys_python.py
index cc3b5a4..5cbea2a 100644
--- a/scripts/lib/recipetool/create_buildsys_python.py
+++ b/scripts/lib/recipetool/create_buildsys_python.py
@@ -245,7 +245,7 @@ class PythonRecipeHandler(RecipeHandler):
             if field not in self.bbvar_map:
                 continue
 
-            if isinstance(values, basestring):
+            if isinstance(values, str):
                 value = values
             else:
                 value = ' '.join(str(v) for v in values if v)
@@ -436,7 +436,7 @@ class PythonRecipeHandler(RecipeHandler):
                 return value
 
             value = info[variable]
-            if isinstance(value, basestring):
+            if isinstance(value, str):
                 new_value = replace_value(search, replace, value)
                 if new_value is None:
                     del info[variable]
@@ -706,7 +706,7 @@ class LiteralAstTransform(ast.NodeTransformer):
 def has_non_literals(value):
     if isinstance(value, ast.AST):
         return True
-    elif isinstance(value, basestring):
+    elif isinstance(value, str):
         return False
     elif hasattr(value, 'values'):
         return any(has_non_literals(v) for v in value.values())
diff --git a/scripts/lib/scriptutils.py b/scripts/lib/scriptutils.py
index aef19d3..bd082d8 100644
--- a/scripts/lib/scriptutils.py
+++ b/scripts/lib/scriptutils.py
@@ -103,7 +103,7 @@ def fetch_uri(d, uri, destdir, srcrev=None):
     return ret
 
 def run_editor(fn):
-    if isinstance(fn, basestring):
+    if isinstance(fn, str):
         params = '"%s"' % fn
     else:
         params = ''
-- 
2.5.0


