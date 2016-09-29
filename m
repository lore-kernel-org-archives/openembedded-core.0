Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 52B4A7017B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Sep 2016 14:28:19 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga101.jf.intel.com with ESMTP; 29 Sep 2016 07:28:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,415,1470726000"; d="scan'208";a="15040357"
Received: from wegenerj-mobl1.ger.corp.intel.com (HELO
	mqz-osx-suse64.fi.intel.com) ([10.252.44.79])
	by orsmga004.jf.intel.com with ESMTP; 29 Sep 2016 07:28:20 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 29 Sep 2016 17:28:08 +0300
Message-Id: <1475159288-31921-12-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.6.6
In-Reply-To: <1475159288-31921-1-git-send-email-markus.lehtonen@linux.intel.com>
References: <1475159288-31921-1-git-send-email-markus.lehtonen@linux.intel.com>
Subject: [PATCH 11/11] scripts/buildstats-diff: implement --multi option
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
X-List-Received-Date: Thu, 29 Sep 2016 14:28:19 -0000

Makes it possible to average over multiple buildstats. If --multi is
specified (and the given path is a directory) the script will read all
buildstats from the given directory and use averaged values calculated
from them.

All of the buildstats must be from a "similar" build, meaning that no
differences in package versions or tasks are allowed. Otherwise, the
script will exit with an error.

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 scripts/buildstats-diff | 99 ++++++++++++++++++++++++++++++++++++-------------
 1 file changed, 73 insertions(+), 26 deletions(-)

diff --git a/scripts/buildstats-diff b/scripts/buildstats-diff
index c5c48d3..f918a6d 100755
--- a/scripts/buildstats-diff
+++ b/scripts/buildstats-diff
@@ -158,26 +158,15 @@ def read_buildstats_dir(bs_dir):
         epoch = match.group('epoch')
         return name, epoch, version, revision
 
-    if os.path.isfile(os.path.join(bs_dir, 'build_stats')):
-        top_dir = bs_dir
-    elif os.path.exists(bs_dir):
-        subdirs = sorted(glob.glob(bs_dir + '/*'))
-        if len(subdirs) > 1:
-            log.warning("Multiple buildstats found, using the first one")
-        top_dir = subdirs[0]
-    else:
-        raise ScriptError("No such directory: {}".format(bs_dir))
-    log.debug("Reading buildstats directory %s", top_dir)
-    subdirs = os.listdir(top_dir)
+    if not os.path.isfile(os.path.join(bs_dir, 'build_stats')):
+        raise ScriptError("{} does not look like a buildstats directory".format(bs_dir))
 
-    # Handle "old" style directory structure
-    if len(subdirs) == 1 and re.match('^20[0-9]{12}$', subdirs[0]):
-        top_dir = os.path.join(top_dir, subdirs[0])
-        subdirs = os.listdir(top_dir)
+    log.debug("Reading buildstats directory %s", bs_dir)
 
     buildstats = {}
+    subdirs = os.listdir(bs_dir)
     for dirname in subdirs:
-        recipe_dir = os.path.join(top_dir, dirname)
+        recipe_dir = os.path.join(bs_dir, dirname)
         if not os.path.isdir(recipe_dir):
             continue
         name, epoch, version, revision = split_nevr(dirname)
@@ -188,8 +177,8 @@ def read_buildstats_dir(bs_dir):
                      'revision': revision,
                      'tasks': {}}
         for task in os.listdir(recipe_dir):
-            recipe_bs['tasks'][task] = read_buildstats_file(
-                    os.path.join(recipe_dir, task))
+            recipe_bs['tasks'][task] = [read_buildstats_file(
+                    os.path.join(recipe_dir, task))]
         if name in buildstats:
             raise ScriptError("Cannot handle multiple versions of the same "
                               "package ({})".format(name))
@@ -198,6 +187,22 @@ def read_buildstats_dir(bs_dir):
     return buildstats
 
 
+def bs_append(dst, src):
+    """Append data from another buildstats"""
+    if set(dst.keys()) != set(src.keys()):
+        raise ScriptError("Refusing to join buildstats, set of packages is "
+                          "different")
+    for pkg, data in dst.items():
+        if data['nevr'] != src[pkg]['nevr']:
+            raise ScriptError("Refusing to join buildstats, package version "
+                              "differs: {} vs. {}".format(data['nevr'], src[pkg]['nevr']))
+        if set(data['tasks'].keys()) != set(src[pkg]['tasks'].keys()):
+            raise ScriptError("Refusing to join buildstats, set of tasks "
+                              "in {} differ".format(pkg))
+        for taskname, taskdata in data['tasks'].items():
+            taskdata.extend(src[pkg]['tasks'][taskname])
+
+
 def read_buildstats_json(path):
     """Read buildstats from JSON file"""
     buildstats = {}
@@ -214,20 +219,50 @@ def read_buildstats_json(path):
             recipe_bs['nevr'] = "{}-{}_{}-{}".format(recipe_bs['name'], recipe_bs['epoch'], recipe_bs['version'], recipe_bs['revision'])
 
         for task, data in recipe_bs['tasks'].copy().items():
-            recipe_bs['tasks'][task] = BSTask(data)
+            recipe_bs['tasks'][task] = [BSTask(data)]
 
         buildstats[recipe_bs['name']] = recipe_bs
 
     return buildstats
 
 
-def read_buildstats(path):
+def read_buildstats(path, multi):
     """Read buildstats"""
+    if not os.path.exists(path):
+        raise ScriptError("No such file or directory: {}".format(path))
+
     if os.path.isfile(path):
         return read_buildstats_json(path)
-    else:
+
+    if os.path.isfile(os.path.join(path, 'build_stats')):
         return read_buildstats_dir(path)
 
+    # Handle a non-buildstat directory
+    subpaths = sorted(glob.glob(path + '/*'))
+    if len(subpaths) > 1:
+        if multi:
+            log.info("Averaging over {} buildstats from {}".format(
+                     len(subpaths), path))
+        else:
+            raise ScriptError("Multiple buildstats found in '{}'. Please give "
+                              "a single buildstat directory of use the --multi "
+                              "option".format(path))
+    bs = None
+    for subpath in subpaths:
+        if os.path.isfile(subpath):
+            tmpbs = read_buildstats_json(subpath)
+        else:
+            tmpbs = read_buildstats_dir(subpath)
+        if not bs:
+            bs = tmpbs
+        else:
+            log.debug("Joining buildstats")
+            bs_append(bs, tmpbs)
+
+    if not bs:
+        raise ScriptError("No buildstats found under {}".format(path))
+    return bs
+
 
 def print_ver_diff(bs1, bs2):
     """Print package version differences"""
@@ -337,7 +372,7 @@ def print_task_diff(bs1, bs2, val_type, min_val=0, min_absdiff=0, sort_by=('absd
         total = 0.0
         for recipe_data in buildstats.values():
             for bs_task in recipe_data['tasks'].values():
-                total += getattr(bs_task, val_type)
+                total += sum([getattr(b, val_type) for b in bs_task]) / len(bs_task)
         return total
 
     tasks_diff = []
@@ -364,12 +399,16 @@ def print_task_diff(bs1, bs2, val_type, min_val=0, min_absdiff=0, sort_by=('absd
         for task in set(tasks1.keys()).union(set(tasks2.keys())):
             task_op = '  '
             if task in tasks1:
-                val1 = getattr(bs1[pkg]['tasks'][task], val_type)
+                # Average over all values
+                val1 = [getattr(b, val_type) for b in bs1[pkg]['tasks'][task]]
+                val1 = sum(val1) / len(val1)
             else:
                 task_op = '+ '
                 val1 = 0
             if task in tasks2:
-                val2 = getattr(bs2[pkg]['tasks'][task], val_type)
+                # Average over all values
+                val2 = [getattr(b, val_type) for b in bs2[pkg]['tasks'][task]]
+                val2 = sum(val2) / len(val2)
             else:
                 val2 = 0
                 task_op = '- '
@@ -470,11 +509,19 @@ Script for comparing buildstats of two separate builds."""
                         help="Comma-separated list of field sort order. "
                              "Prepend the field name with '-' for reversed sort. "
                              "Available fields are: {}".format(', '.join(taskdiff_fields)))
+    parser.add_argument('--multi', action='store_true',
+                        help="Read all buildstats from the given paths and "
+                             "average over them")
     parser.add_argument('buildstats1', metavar='BUILDSTATS1', help="'Left' buildstat")
     parser.add_argument('buildstats2', metavar='BUILDSTATS2', help="'Right' buildstat")
 
     args = parser.parse_args(argv)
 
+    # We do not nedd/want to read all buildstats if we just want to look at the
+    # package versions
+    if args.ver_diff:
+        args.multi = False
+
     # Handle defaults for the filter arguments
     if args.min_val is min_val_defaults:
         args.min_val = min_val_defaults[args.diff_attr]
@@ -500,8 +547,8 @@ def main(argv=None):
         sort_by.append(field)
 
     try:
-        bs1 = read_buildstats(args.buildstats1)
-        bs2 = read_buildstats(args.buildstats2)
+        bs1 = read_buildstats(args.buildstats1, args.multi)
+        bs2 = read_buildstats(args.buildstats2, args.multi)
 
         if args.ver_diff:
             print_ver_diff(bs1, bs2)
-- 
2.6.6


