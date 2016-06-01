Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 4F08E77336
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Jun 2016 12:35:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u51CZeIO006852; Wed, 1 Jun 2016 13:35:53 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id vI8tWzu0JDHB; Wed,  1 Jun 2016 13:35:53 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u51CZpGE006881
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 1 Jun 2016 13:35:52 +0100
Received: from richard by hex with local (Exim 4.86)
	(envelope-from <richard@rpsys.net>)
	id 1b85NH-0000l0-Cn; Wed, 01 Jun 2016 13:35:51 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Wed,  1 Jun 2016 13:35:31 +0100
Message-Id: <1464784540-2786-13-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1464784540-2786-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1464784540-2786-1-git-send-email-richard.purdie@linuxfoundation.org>
Subject: [PATCH 13/22] scripts: Fix encoding errors for python3
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
X-List-Received-Date: Wed, 01 Jun 2016 12:35:57 -0000

From: Ed Bartosh <ed.bartosh@linux.intel.com>

Moved call of decode('utf-8') as close as possible to
call of subprocess API to avoid calling it in a lot of
other places.

Decoded binary data to utf-8 where appropriate to fix devtool
and recipetool tests in python 3 environment.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oe/patch.py                             | 5 ++++-
 scripts/lib/devtool/__init__.py                  | 1 +
 scripts/lib/recipetool/append.py                 | 4 ++--
 scripts/lib/recipetool/create.py                 | 4 ++--
 scripts/lib/recipetool/create_buildsys_python.py | 2 +-
 5 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/meta/lib/oe/patch.py b/meta/lib/oe/patch.py
index a25fd52..4a0d3f7 100644
--- a/meta/lib/oe/patch.py
+++ b/meta/lib/oe/patch.py
@@ -292,7 +292,10 @@ class GitApplyTree(PatchTree):
     def decodeAuthor(line):
         from email.header import decode_header
         authorval = line.split(':', 1)[1].strip().replace('"', '')
-        return decode_header(authorval)[0][0]
+        result =  decode_header(authorval)[0][0]
+        if hasattr(result, 'decode'):
+            result = result.decode('utf-8')
+        return result
 
     @staticmethod
     def interpretPatchHeader(headerlines):
diff --git a/scripts/lib/devtool/__init__.py b/scripts/lib/devtool/__init__.py
index 6f5bb8d..7005363 100644
--- a/scripts/lib/devtool/__init__.py
+++ b/scripts/lib/devtool/__init__.py
@@ -69,6 +69,7 @@ def exec_watch(cmd, **options):
     buf = ''
     while True:
         out = process.stdout.read(1)
+        out = out.decode('utf-8')
         if out:
             sys.stdout.write(out)
             sys.stdout.flush()
diff --git a/scripts/lib/recipetool/append.py b/scripts/lib/recipetool/append.py
index 35756b08..5d73d30 100644
--- a/scripts/lib/recipetool/append.py
+++ b/scripts/lib/recipetool/append.py
@@ -90,7 +90,7 @@ def find_target_file(targetpath, d, pkglist=None):
                             if fnmatch.fnmatchcase(fullpth, targetpath):
                                 recipes[targetpath].append(pn)
                     elif line.startswith('pkg_preinst_') or line.startswith('pkg_postinst_'):
-                        scriptval = line.split(':', 1)[1].strip().decode('string_escape')
+                        scriptval = line.split(':', 1)[1].strip().encode('utf-8').decode('unicode_escape')
                         if 'update-alternatives --install %s ' % targetpath in scriptval:
                             recipes[targetpath].append('?%s' % pn)
                         elif targetpath_re.search(scriptval):
@@ -172,7 +172,7 @@ def get_source_path(cmdelements):
     """Find the source path specified within a command"""
     command = cmdelements[0]
     if command in ['install', 'cp']:
-        helptext = subprocess.check_output('LC_ALL=C %s --help' % command, shell=True)
+        helptext = subprocess.check_output('LC_ALL=C %s --help' % command, shell=True).decode('utf-8')
         argopts = ''
         argopt_line_re = re.compile('^-([a-zA-Z0-9]), --[a-z-]+=')
         for line in helptext.splitlines():
diff --git a/scripts/lib/recipetool/create.py b/scripts/lib/recipetool/create.py
index e3e01e3..744ff1b 100644
--- a/scripts/lib/recipetool/create.py
+++ b/scripts/lib/recipetool/create.py
@@ -851,14 +851,14 @@ def crunch_license(licfile):
                 continue
             # Squash spaces, and replace smart quotes, double quotes
             # and backticks with single quotes
-            line = oe.utils.squashspaces(line.strip()).decode("utf-8")
+            line = oe.utils.squashspaces(line.strip())
             line = line.replace(u"\u2018", "'").replace(u"\u2019", "'").replace(u"\u201c","'").replace(u"\u201d", "'").replace('"', '\'').replace('`', '\'')
             if line:
                 lictext.append(line)
 
     m = hashlib.md5()
     try:
-        m.update(' '.join(lictext))
+        m.update(' '.join(lictext).encode('utf-8'))
         md5val = m.hexdigest()
     except UnicodeEncodeError:
         md5val = None
diff --git a/scripts/lib/recipetool/create_buildsys_python.py b/scripts/lib/recipetool/create_buildsys_python.py
index 5cbea2a..55cce0e 100644
--- a/scripts/lib/recipetool/create_buildsys_python.py
+++ b/scripts/lib/recipetool/create_buildsys_python.py
@@ -516,7 +516,7 @@ class PythonRecipeHandler(RecipeHandler):
         except (OSError, subprocess.CalledProcessError):
             pass
         else:
-            for line in dep_output.splitlines():
+            for line in dep_output.decode('utf-8').splitlines():
                 line = line.rstrip()
                 dep, filename = line.split('\t', 1)
                 if filename.endswith('/setup.py'):
-- 
2.5.0


