Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 56F677703A
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Sep 2015 11:00:26 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga102.fm.intel.com with ESMTP; 02 Sep 2015 04:00:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,453,1437462000"; d="scan'208";a="796215083"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga002.jf.intel.com with ESMTP; 02 Sep 2015 04:00:27 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.65])
	by linux.intel.com (Postfix) with ESMTP id 083316A4083
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Sep 2015 03:59:34 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  2 Sep 2015 13:58:10 +0300
Message-Id: <9a5bee8fb28d18618e7feba58bb32f88cd87aaff.1441191270.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1441191270.git.ed.bartosh@linux.intel.com>
References: <cover.1441191270.git.ed.bartosh@linux.intel.com>
In-Reply-To: <cover.1441191270.git.ed.bartosh@linux.intel.com>
References: <cover.1441191270.git.ed.bartosh@linux.intel.com>
Subject: [PATCH 10/17] wic: fix pylint warning multiple-statements
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
X-List-Received-Date: Wed, 02 Sep 2015 11:00:26 -0000

Fixed pylint warning:
More than one statement on a single line (multiple-statements)

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/wic/plugin.py       |  3 ++-
 scripts/lib/wic/utils/cmdln.py  | 57 +++++++++++++++++++++++++++--------------
 scripts/lib/wic/utils/runner.py |  3 ++-
 3 files changed, 42 insertions(+), 21 deletions(-)

diff --git a/scripts/lib/wic/plugin.py b/scripts/lib/wic/plugin.py
index d714b6d..e901f80 100644
--- a/scripts/lib/wic/plugin.py
+++ b/scripts/lib/wic/plugin.py
@@ -82,7 +82,8 @@ class PluginMgr(object):
 
     def _load_all(self):
         for (pdir, loaded) in self.plugin_dirs.iteritems():
-            if loaded: continue
+            if loaded:
+                continue
 
             sys.path.insert(0, pdir)
             for mod in [x[:-3] for x in os.listdir(pdir) if x.endswith(".py")]:
diff --git a/scripts/lib/wic/utils/cmdln.py b/scripts/lib/wic/utils/cmdln.py
index d8f1c05..47654b9 100644
--- a/scripts/lib/wic/utils/cmdln.py
+++ b/scripts/lib/wic/utils/cmdln.py
@@ -443,7 +443,8 @@ class RawCmdln(cmd.Cmd):
         elif line[0] == '?':
             line = 'help ' + line[1:]
         i, n = 0, len(line)
-        while i < n and line[i] in self.identchars: i = i+1
+        while i < n and line[i] in self.identchars:
+            i = i+1
         cmd, arg = line[:i], line[i:].strip()
         return cmd, arg, line
 
@@ -499,8 +500,10 @@ class RawCmdln(cmd.Cmd):
             doc = self.__class__.__doc__  # try class docstring
             if doc is None:
                 # Try to provide some reasonable useful default help.
-                if self.cmdlooping: prefix = ""
-                else:               prefix = self.name+' '
+                if self.cmdlooping:
+                    prefix = ""
+                else:
+                    prefix = self.name+' '
                 doc = """Usage:
                     %sCOMMAND [ARGS...]
                     %shelp [COMMAND]
@@ -629,7 +632,8 @@ class RawCmdln(cmd.Cmd):
         token2canonical = self._get_canonical_map()
         aliases = {}
         for token, cmdname in token2canonical.items():
-            if token == cmdname: continue
+            if token == cmdname:
+                continue
             aliases.setdefault(cmdname, []).append(token)
 
         # Get the list of (non-hidden) commands and their
@@ -697,7 +701,8 @@ class RawCmdln(cmd.Cmd):
         helpnames = {}
         token2cmdname = self._get_canonical_map()
         for attrname, attr in self._gen_names_and_attrs():
-            if not attrname.startswith("help_"): continue
+            if not attrname.startswith("help_"):
+                continue
             helpname = attrname[5:]
             if helpname not in token2cmdname:
                 helpnames[helpname] = attr
@@ -757,8 +762,10 @@ class RawCmdln(cmd.Cmd):
 
         # Adjust argcount for possible *args and **kwargs arguments.
         argcount = co_argcount
-        if co_flags & CO_FLAGS_ARGS:   argcount += 1
-        if co_flags & CO_FLAGS_KWARGS: argcount += 1
+        if co_flags & CO_FLAGS_ARGS:
+            argcount += 1
+        if co_flags & CO_FLAGS_KWARGS:
+            argcount += 1
 
         # Determine the usage string.
         usage = "%s %s" % (self.name, cmdname)
@@ -838,8 +845,10 @@ class RawCmdln(cmd.Cmd):
             token2canonical = {}
             cmd2funcname = {} # use a dict to strip duplicates
             for attr in self.get_names():
-                if attr.startswith("do_"):    cmdname = attr[3:]
-                elif attr.startswith("_do_"): cmdname = attr[4:]
+                if attr.startswith("do_"):
+                    cmdname = attr[3:]
+                elif attr.startswith("_do_"):
+                    cmdname = attr[4:]
                 else:
                     continue
                 cmd2funcname[cmdname] = attr
@@ -1280,12 +1289,14 @@ def line2argv(line):
     i = -1
     while 1:
         i += 1
-        if i >= len(line): break
+        if i >= len(line):
+            break
         ch = line[i]
 
         if ch == "\\" and i+1 < len(line):
             # escaped char always added to arg, regardless of state
-            if arg is None: arg = ""
+            if arg is None:
+                arg = ""
             if (sys.platform == "win32"
                 or state in ("double-quoted", "single-quoted")
                ) and line[i+1] not in tuple('"\''):
@@ -1306,17 +1317,20 @@ def line2argv(line):
                 arg += ch
         elif state == "default":
             if ch == '"':
-                if arg is None: arg = ""
+                if arg is None:
+                    arg = ""
                 state = "double-quoted"
             elif ch == "'":
-                if arg is None: arg = ""
+                if arg is None:
+                    arg = ""
                 state = "single-quoted"
             elif ch in string.whitespace:
                 if arg is not None:
                     argv.append(arg)
                 arg = None
             else:
-                if arg is None: arg = ""
+                if arg is None:
+                    arg = ""
                 arg += ch
     if arg is not None:
         argv.append(arg)
@@ -1380,7 +1394,8 @@ def _dedentlines(lines, tabsize=8, skip_first_line=False):
     indents = []
     margin = None
     for i, line in enumerate(lines):
-        if i == 0 and skip_first_line: continue
+        if i == 0 and skip_first_line:
+            continue
         indent = 0
         for ch in line:
             if ch == ' ':
@@ -1393,16 +1408,19 @@ def _dedentlines(lines, tabsize=8, skip_first_line=False):
                 break
         else:
             continue # skip all-whitespace lines
-        if DEBUG: print "dedent: indent=%d: %r" % (indent, line)
+        if DEBUG:
+            print "dedent: indent=%d: %r" % (indent, line)
         if margin is None:
             margin = indent
         else:
             margin = min(margin, indent)
-    if DEBUG: print "dedent: margin=%r" % margin
+    if DEBUG:
+        print "dedent: margin=%r" % margin
 
     if margin is not None and margin > 0:
         for i, line in enumerate(lines):
-            if i == 0 and skip_first_line: continue
+            if i == 0 and skip_first_line:
+                continue
             removed = 0
             for j, ch in enumerate(line):
                 if ch == ' ':
@@ -1410,7 +1428,8 @@ def _dedentlines(lines, tabsize=8, skip_first_line=False):
                 elif ch == '\t':
                     removed += tabsize - (removed % tabsize)
                 elif ch in '\r\n':
-                    if DEBUG: print "dedent: %r: EOL -> strip up to EOL" % line
+                    if DEBUG:
+                        print "dedent: %r: EOL -> strip up to EOL" % line
                     lines[i] = lines[i][j:]
                     break
                 else:
diff --git a/scripts/lib/wic/utils/runner.py b/scripts/lib/wic/utils/runner.py
index 8d48f68..f6a1d08 100644
--- a/scripts/lib/wic/utils/runner.py
+++ b/scripts/lib/wic/utils/runner.py
@@ -90,7 +90,8 @@ def show(cmdln_or_args):
         cmd = cmdln_or_args
 
     msg = 'running command: "%s"' % cmd
-    if out: out = out.strip()
+    if out:
+        out = out.strip()
     if out:
         msg += ', with output::'
         msg += '\n  +----------------'
-- 
2.1.4


