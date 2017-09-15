Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 678A478682
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Sep 2017 13:04:42 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	15 Sep 2017 06:04:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.42,396,1500966000"; d="scan'208";a="1172538609"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by orsmga001.jf.intel.com with ESMTP; 15 Sep 2017 06:04:42 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 15 Sep 2017 16:04:37 +0300
Message-Id: <338382eef042f00da861620d4fc1823e8032cacb.1505480244.git.markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.12.3
In-Reply-To: <cover.1505480244.git.markus.lehtonen@linux.intel.com>
References: <cover.1505480244.git.markus.lehtonen@linux.intel.com>
In-Reply-To: <cover.1505480244.git.markus.lehtonen@linux.intel.com>
References: <cover.1505480244.git.markus.lehtonen@linux.intel.com>
Subject: [PATCH 1/4] scripts/buildstats-diff: move code to lib/buildstats.py
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
X-List-Received-Date: Fri, 15 Sep 2017 13:04:42 -0000

Move over code from buildstats-diff to new scripts/lib/buildstats.py
module in order to share code related to buildstats processing.  Also,
refactor the code, introducing new classes to make the code readable,
maintainable and easier to debug.

[YOCTO #11381]

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 scripts/buildstats-diff   | 278 +++++-------------------------------------
 scripts/lib/buildstats.py | 301 ++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 329 insertions(+), 250 deletions(-)
 create mode 100644 scripts/lib/buildstats.py

diff --git a/scripts/buildstats-diff b/scripts/buildstats-diff
index 8e64480eb3..ce82dabee9 100755
--- a/scripts/buildstats-diff
+++ b/scripts/buildstats-diff
@@ -15,15 +15,18 @@
 #
 import argparse
 import glob
-import json
 import logging
 import math
 import os
-import re
 import sys
-from collections import namedtuple
 from operator import attrgetter
 
+# Import oe libs
+scripts_path = os.path.dirname(os.path.realpath(__file__))
+sys.path.append(os.path.join(scripts_path, 'lib'))
+from buildstats import BuildStats, diff_buildstats, taskdiff_fields
+
+
 # Setup logging
 logging.basicConfig(level=logging.INFO, format="%(levelname)s: %(message)s")
 log = logging.getLogger()
@@ -34,196 +37,16 @@ class ScriptError(Exception):
     pass
 
 
-taskdiff_fields = ('pkg', 'pkg_op', 'task', 'task_op', 'value1', 'value2',
-                   'absdiff', 'reldiff')
-TaskDiff = namedtuple('TaskDiff', ' '.join(taskdiff_fields))
-
-
-class BSTask(dict):
-    def __init__(self, *args, **kwargs):
-        self['start_time'] = None
-        self['elapsed_time'] = None
-        self['status'] = None
-        self['iostat'] = {}
-        self['rusage'] = {}
-        self['child_rusage'] = {}
-        super(BSTask, self).__init__(*args, **kwargs)
-
-    @property
-    def cputime(self):
-        """Sum of user and system time taken by the task"""
-        rusage = self['rusage']['ru_stime'] + self['rusage']['ru_utime']
-        if self['child_rusage']:
-            # Child rusage may have been optimized out
-            return rusage + self['child_rusage']['ru_stime'] + self['child_rusage']['ru_utime']
-        else:
-            return rusage
-
-    @property
-    def walltime(self):
-        """Elapsed wall clock time"""
-        return self['elapsed_time']
-
-    @property
-    def read_bytes(self):
-        """Bytes read from the block layer"""
-        return self['iostat']['read_bytes']
-
-    @property
-    def write_bytes(self):
-        """Bytes written to the block layer"""
-        return self['iostat']['write_bytes']
-
-    @property
-    def read_ops(self):
-        """Number of read operations on the block layer"""
-        if self['child_rusage']:
-            # Child rusage may have been optimized out
-            return self['rusage']['ru_inblock'] + self['child_rusage']['ru_inblock']
-        else:
-            return self['rusage']['ru_inblock']
-
-    @property
-    def write_ops(self):
-        """Number of write operations on the block layer"""
-        if self['child_rusage']:
-            # Child rusage may have been optimized out
-            return self['rusage']['ru_oublock'] + self['child_rusage']['ru_oublock']
-        else:
-            return self['rusage']['ru_oublock']
-
-
-def read_buildstats_file(buildstat_file):
-    """Convert buildstat text file into dict/json"""
-    bs_task = BSTask()
-    log.debug("Reading task buildstats from %s", buildstat_file)
-    end_time = None
-    with open(buildstat_file) as fobj:
-        for line in fobj.readlines():
-            key, val = line.split(':', 1)
-            val = val.strip()
-            if key == 'Started':
-                start_time = float(val)
-                bs_task['start_time'] = start_time
-            elif key == 'Ended':
-                end_time = float(val)
-            elif key.startswith('IO '):
-                split = key.split()
-                bs_task['iostat'][split[1]] = int(val)
-            elif key.find('rusage') >= 0:
-                split = key.split()
-                ru_key = split[-1]
-                if ru_key in ('ru_stime', 'ru_utime'):
-                    val = float(val)
-                else:
-                    val = int(val)
-                ru_type = 'rusage' if split[0] == 'rusage' else \
-                                                  'child_rusage'
-                bs_task[ru_type][ru_key] = val
-            elif key == 'Status':
-                bs_task['status'] = val
-    if end_time is not None and start_time is not None:
-        bs_task['elapsed_time'] = end_time - start_time
-    else:
-        raise ScriptError("{} looks like a invalid buildstats file".format(buildstat_file))
-    return bs_task
-
-
-def read_buildstats_dir(bs_dir):
-    """Read buildstats directory"""
-    def split_nevr(nevr):
-        """Split name and version information from recipe "nevr" string"""
-        n_e_v, revision = nevr.rsplit('-', 1)
-        match = re.match(r'^(?P<name>\S+)-((?P<epoch>[0-9]{1,5})_)?(?P<version>[0-9]\S*)$',
-                         n_e_v)
-        if not match:
-            # If we're not able to parse a version starting with a number, just
-            # take the part after last dash
-            match = re.match(r'^(?P<name>\S+)-((?P<epoch>[0-9]{1,5})_)?(?P<version>[^-]+)$',
-                             n_e_v)
-        name = match.group('name')
-        version = match.group('version')
-        epoch = match.group('epoch')
-        return name, epoch, version, revision
-
-    if not os.path.isfile(os.path.join(bs_dir, 'build_stats')):
-        raise ScriptError("{} does not look like a buildstats directory".format(bs_dir))
-
-    log.debug("Reading buildstats directory %s", bs_dir)
-
-    buildstats = {}
-    subdirs = os.listdir(bs_dir)
-    for dirname in subdirs:
-        recipe_dir = os.path.join(bs_dir, dirname)
-        if not os.path.isdir(recipe_dir):
-            continue
-        name, epoch, version, revision = split_nevr(dirname)
-        recipe_bs = {'nevr': dirname,
-                     'name': name,
-                     'epoch': epoch,
-                     'version': version,
-                     'revision': revision,
-                     'tasks': {}}
-        for task in os.listdir(recipe_dir):
-            recipe_bs['tasks'][task] = [read_buildstats_file(
-                    os.path.join(recipe_dir, task))]
-        if name in buildstats:
-            raise ScriptError("Cannot handle multiple versions of the same "
-                              "package ({})".format(name))
-        buildstats[name] = recipe_bs
-
-    return buildstats
-
-
-def bs_append(dst, src):
-    """Append data from another buildstats"""
-    if set(dst.keys()) != set(src.keys()):
-        raise ScriptError("Refusing to join buildstats, set of packages is "
-                          "different")
-    for pkg, data in dst.items():
-        if data['nevr'] != src[pkg]['nevr']:
-            raise ScriptError("Refusing to join buildstats, package version "
-                              "differs: {} vs. {}".format(data['nevr'], src[pkg]['nevr']))
-        if set(data['tasks'].keys()) != set(src[pkg]['tasks'].keys()):
-            raise ScriptError("Refusing to join buildstats, set of tasks "
-                              "in {} differ".format(pkg))
-        for taskname, taskdata in data['tasks'].items():
-            taskdata.extend(src[pkg]['tasks'][taskname])
-
-
-def read_buildstats_json(path):
-    """Read buildstats from JSON file"""
-    buildstats = {}
-    with open(path) as fobj:
-        bs_json = json.load(fobj)
-    for recipe_bs in bs_json:
-        if recipe_bs['name'] in buildstats:
-            raise ScriptError("Cannot handle multiple versions of the same "
-                              "package ({})".format(recipe_bs['name']))
-
-        if recipe_bs['epoch'] is None:
-            recipe_bs['nevr'] = "{}-{}-{}".format(recipe_bs['name'], recipe_bs['version'], recipe_bs['revision'])
-        else:
-            recipe_bs['nevr'] = "{}-{}_{}-{}".format(recipe_bs['name'], recipe_bs['epoch'], recipe_bs['version'], recipe_bs['revision'])
-
-        for task, data in recipe_bs['tasks'].copy().items():
-            recipe_bs['tasks'][task] = [BSTask(data)]
-
-        buildstats[recipe_bs['name']] = recipe_bs
-
-    return buildstats
-
-
 def read_buildstats(path, multi):
     """Read buildstats"""
     if not os.path.exists(path):
         raise ScriptError("No such file or directory: {}".format(path))
 
     if os.path.isfile(path):
-        return read_buildstats_json(path)
+        return BuildStats.from_file_json(path)
 
     if os.path.isfile(os.path.join(path, 'build_stats')):
-        return read_buildstats_dir(path)
+        return BuildStats.from_dir(path)
 
     # Handle a non-buildstat directory
     subpaths = sorted(glob.glob(path + '/*'))
@@ -238,17 +61,16 @@ def read_buildstats(path, multi):
     bs = None
     for subpath in subpaths:
         if os.path.isfile(subpath):
-            tmpbs = read_buildstats_json(subpath)
+            _bs = BuildStats.from_file_json(subpath)
         else:
-            tmpbs = read_buildstats_dir(subpath)
-        if not bs:
-            bs = tmpbs
+            _bs = BuildStats.from_dir(subpath)
+        if bs is None:
+            bs = _bs
         else:
-            log.debug("Joining buildstats")
-            bs_append(bs, tmpbs)
-
+            bs.aggregate(_bs)
     if not bs:
         raise ScriptError("No buildstats found under {}".format(path))
+
     return bs
 
 
@@ -266,11 +88,11 @@ def print_ver_diff(bs1, bs2):
     common_pkgs = pkgs2.intersection(pkgs1)
     if common_pkgs:
         for pkg in common_pkgs:
-            if bs1[pkg]['epoch'] != bs2[pkg]['epoch']:
+            if bs1[pkg].epoch != bs2[pkg].epoch:
                 echanged.append(pkg)
-            elif bs1[pkg]['version'] != bs2[pkg]['version']:
+            elif bs1[pkg].version != bs2[pkg].version:
                 vchanged.append(pkg)
-            elif bs1[pkg]['revision'] != bs2[pkg]['revision']:
+            elif bs1[pkg].revision != bs2[pkg].revision:
                 rchanged.append(pkg)
             else:
                 unchanged.append(pkg)
@@ -288,37 +110,37 @@ def print_ver_diff(bs1, bs2):
         print("\nNEW PACKAGES:")
         print("-------------")
         for pkg in sorted(new_pkgs):
-            print(fmt_str.format(pkg, bs2[pkg]['nevr'], maxlen=maxlen))
+            print(fmt_str.format(pkg, bs2[pkg].nevr, maxlen=maxlen))
 
     if deleted_pkgs:
         print("\nDELETED PACKAGES:")
         print("-----------------")
         for pkg in sorted(deleted_pkgs):
-            print(fmt_str.format(pkg, bs1[pkg]['nevr'], maxlen=maxlen))
+            print(fmt_str.format(pkg, bs1[pkg].nevr, maxlen=maxlen))
 
     fmt_str = "  {0:{maxlen}} {1:<20}    ({2})"
     if rchanged:
         print("\nREVISION CHANGED:")
         print("-----------------")
         for pkg in sorted(rchanged):
-            field1 = "{} -> {}".format(pkg, bs1[pkg]['revision'], bs2[pkg]['revision'])
-            field2 = "{} -> {}".format(bs1[pkg]['nevr'], bs2[pkg]['nevr'])
+            field1 = "{} -> {}".format(pkg, bs1[pkg].revision, bs2[pkg].revision)
+            field2 = "{} -> {}".format(bs1[pkg].nevr, bs2[pkg].nevr)
             print(fmt_str.format(pkg, field1, field2, maxlen=maxlen))
 
     if vchanged:
         print("\nVERSION CHANGED:")
         print("----------------")
         for pkg in sorted(vchanged):
-            field1 = "{} -> {}".format(bs1[pkg]['version'], bs2[pkg]['version'])
-            field2 = "{} -> {}".format(bs1[pkg]['nevr'], bs2[pkg]['nevr'])
+            field1 = "{} -> {}".format(bs1[pkg].version, bs2[pkg].version)
+            field2 = "{} -> {}".format(bs1[pkg].nevr, bs2[pkg].nevr)
             print(fmt_str.format(pkg, field1, field2, maxlen=maxlen))
 
     if echanged:
         print("\nEPOCH CHANGED:")
         print("--------------")
         for pkg in sorted(echanged):
-            field1 = "{} -> {}".format(bs1[pkg]['epoch'], bs2[pkg]['epoch'])
-            field2 = "{} -> {}".format(bs1[pkg]['nevr'], bs2[pkg]['nevr'])
+            field1 = "{} -> {}".format(bs1[pkg].epoch, bs2[pkg].epoch)
+            field2 = "{} -> {}".format(bs1[pkg].nevr, bs2[pkg].nevr)
             print(fmt_str.format(pkg, field1, field2, maxlen=maxlen))
 
 
@@ -359,12 +181,10 @@ def print_task_diff(bs1, bs2, val_type, min_val=0, min_absdiff=0, sort_by=('absd
         """Get cumulative sum of all tasks"""
         total = 0.0
         for recipe_data in buildstats.values():
-            for bs_task in recipe_data['tasks'].values():
-                total += sum([getattr(b, val_type) for b in bs_task]) / len(bs_task)
+            for bs_task in recipe_data.tasks.values():
+                total += getattr(bs_task, val_type)
         return total
 
-    tasks_diff = []
-
     if min_val:
         print("Ignoring tasks less than {} ({})".format(
                 val_to_str(min_val, True), val_to_str(min_val)))
@@ -373,49 +193,7 @@ def print_task_diff(bs1, bs2, val_type, min_val=0, min_absdiff=0, sort_by=('absd
                 val_to_str(min_absdiff, True), val_to_str(min_absdiff)))
 
     # Prepare the data
-    pkgs = set(bs1.keys()).union(set(bs2.keys()))
-    for pkg in pkgs:
-        tasks1 = bs1[pkg]['tasks'] if pkg in bs1 else {}
-        tasks2 = bs2[pkg]['tasks'] if pkg in bs2 else {}
-        if not tasks1:
-            pkg_op = '+ '
-        elif not tasks2:
-            pkg_op = '- '
-        else:
-            pkg_op = '  '
-
-        for task in set(tasks1.keys()).union(set(tasks2.keys())):
-            task_op = '  '
-            if task in tasks1:
-                # Average over all values
-                val1 = [getattr(b, val_type) for b in bs1[pkg]['tasks'][task]]
-                val1 = sum(val1) / len(val1)
-            else:
-                task_op = '+ '
-                val1 = 0
-            if task in tasks2:
-                # Average over all values
-                val2 = [getattr(b, val_type) for b in bs2[pkg]['tasks'][task]]
-                val2 = sum(val2) / len(val2)
-            else:
-                val2 = 0
-                task_op = '- '
-
-            if val1 == 0:
-                reldiff = float('inf')
-            else:
-                reldiff = 100 * (val2 - val1) / val1
-
-            if max(val1, val2) < min_val:
-                log.debug("Filtering out %s:%s (%s)", pkg, task,
-                          val_to_str(max(val1, val2)))
-                continue
-            if abs(val2 - val1) < min_absdiff:
-                log.debug("Filtering out %s:%s (difference of %s)", pkg, task,
-                          val_to_str(val2-val1))
-                continue
-            tasks_diff.append(TaskDiff(pkg, pkg_op, task, task_op, val1, val2,
-                                       val2-val1, reldiff))
+    tasks_diff = diff_buildstats(bs1, bs2, val_type, min_val, min_absdiff)
 
     # Sort our list
     for field in reversed(sort_by):
diff --git a/scripts/lib/buildstats.py b/scripts/lib/buildstats.py
new file mode 100644
index 0000000000..9eb60b1c69
--- /dev/null
+++ b/scripts/lib/buildstats.py
@@ -0,0 +1,301 @@
+#
+# Copyright (c) 2017, Intel Corporation.
+#
+# This program is free software; you can redistribute it and/or modify it
+# under the terms and conditions of the GNU General Public License,
+# version 2, as published by the Free Software Foundation.
+#
+# This program is distributed in the hope it will be useful, but WITHOUT
+# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+# FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
+# more details.
+#
+"""Functionality for analyzing buildstats"""
+import json
+import logging
+import os
+import re
+from collections import namedtuple
+from statistics import mean
+
+
+log = logging.getLogger()
+
+
+taskdiff_fields = ('pkg', 'pkg_op', 'task', 'task_op', 'value1', 'value2',
+                   'absdiff', 'reldiff')
+TaskDiff = namedtuple('TaskDiff', ' '.join(taskdiff_fields))
+
+
+class BSError(Exception):
+    """Error handling of buildstats"""
+    pass
+
+
+class BSTask(dict):
+    def __init__(self, *args, **kwargs):
+        self['start_time'] = None
+        self['elapsed_time'] = None
+        self['status'] = None
+        self['iostat'] = {}
+        self['rusage'] = {}
+        self['child_rusage'] = {}
+        super(BSTask, self).__init__(*args, **kwargs)
+
+    @property
+    def cputime(self):
+        """Sum of user and system time taken by the task"""
+        rusage = self['rusage']['ru_stime'] + self['rusage']['ru_utime']
+        if self['child_rusage']:
+            # Child rusage may have been optimized out
+            return rusage + self['child_rusage']['ru_stime'] + self['child_rusage']['ru_utime']
+        else:
+            return rusage
+
+    @property
+    def walltime(self):
+        """Elapsed wall clock time"""
+        return self['elapsed_time']
+
+    @property
+    def read_bytes(self):
+        """Bytes read from the block layer"""
+        return self['iostat']['read_bytes']
+
+    @property
+    def write_bytes(self):
+        """Bytes written to the block layer"""
+        return self['iostat']['write_bytes']
+
+    @property
+    def read_ops(self):
+        """Number of read operations on the block layer"""
+        if self['child_rusage']:
+            # Child rusage may have been optimized out
+            return self['rusage']['ru_inblock'] + self['child_rusage']['ru_inblock']
+        else:
+            return self['rusage']['ru_inblock']
+
+    @property
+    def write_ops(self):
+        """Number of write operations on the block layer"""
+        if self['child_rusage']:
+            # Child rusage may have been optimized out
+            return self['rusage']['ru_oublock'] + self['child_rusage']['ru_oublock']
+        else:
+            return self['rusage']['ru_oublock']
+
+    @classmethod
+    def from_file(cls, buildstat_file):
+        """Read buildstat text file"""
+        bs_task = cls()
+        log.debug("Reading task buildstats from %s", buildstat_file)
+        end_time = None
+        with open(buildstat_file) as fobj:
+            for line in fobj.readlines():
+                key, val = line.split(':', 1)
+                val = val.strip()
+                if key == 'Started':
+                    start_time = float(val)
+                    bs_task['start_time'] = start_time
+                elif key == 'Ended':
+                    end_time = float(val)
+                elif key.startswith('IO '):
+                    split = key.split()
+                    bs_task['iostat'][split[1]] = int(val)
+                elif key.find('rusage') >= 0:
+                    split = key.split()
+                    ru_key = split[-1]
+                    if ru_key in ('ru_stime', 'ru_utime'):
+                        val = float(val)
+                    else:
+                        val = int(val)
+                    ru_type = 'rusage' if split[0] == 'rusage' else \
+                                                      'child_rusage'
+                    bs_task[ru_type][ru_key] = val
+                elif key == 'Status':
+                    bs_task['status'] = val
+        if end_time is not None and start_time is not None:
+            bs_task['elapsed_time'] = end_time - start_time
+        else:
+            raise BSError("{} looks like a invalid buildstats file".format(buildstat_file))
+        return bs_task
+
+
+class BSTaskAggregate(object):
+    """Class representing multiple runs of the same task"""
+    properties = ('cputime', 'walltime', 'read_bytes', 'write_bytes',
+                  'read_ops', 'write_ops')
+
+    def __init__(self, tasks=None):
+        self._tasks = tasks or []
+        self._properties = {}
+
+    def __getattr__(self, name):
+        if name in self.properties:
+            if name not in self._properties:
+                # Calculate properties on demand only. We only provide mean
+                # value, so far
+                self._properties[name] = mean([getattr(t, name) for t in self._tasks])
+            return self._properties[name]
+        else:
+            raise AttributeError("'BSTaskAggregate' has no attribute '{}'".format(name))
+
+    def append(self, task):
+        """Append new task"""
+        # Reset pre-calculated properties
+        assert isinstance(task, BSTask), "Type is '{}' instead of 'BSTask'".format(type(task))
+        self._properties = {}
+        self._tasks.append(task)
+
+
+class BSRecipe(object):
+    """Class representing buildstats of one recipe"""
+    def __init__(self, name, epoch, version, revision):
+        self.name = name
+        self.epoch = epoch
+        self.version = version
+        self.revision = revision
+        if epoch is None:
+            self.nevr = "{}-{}-{}".format(name, version, revision)
+        else:
+            self.nevr = "{}-{}_{}-{}".format(name, epoch, version, revision)
+        self.tasks = {}
+
+    def aggregate(self, bsrecipe):
+        """Aggregate data of another recipe buildstats"""
+        if self.nevr != bsrecipe.nevr:
+            raise ValueError("Refusing to aggregate buildstats, recipe version "
+                             "differs: {} vs. {}".format(self.nevr, bsrecipe.nevr))
+        if set(self.tasks.keys()) != set(bsrecipe.tasks.keys()):
+            raise ValueError("Refusing to aggregate buildstats, set of tasks "
+                             "in {} differ".format(self.name))
+
+        for taskname, taskdata in bsrecipe.tasks.items():
+            if not isinstance(self.tasks[taskname], BSTaskAggregate):
+                self.tasks[taskname] = BSTaskAggregate([self.tasks[taskname]])
+            self.tasks[taskname].append(taskdata)
+
+
+class BuildStats(dict):
+    """Class representing buildstats of one build"""
+
+    @classmethod
+    def from_json(cls, bs_json):
+        """Create new BuildStats object from JSON object"""
+        buildstats = cls()
+        for recipe in bs_json:
+            if recipe['name'] in buildstats:
+                raise BSError("Cannot handle multiple versions of the same "
+                              "package ({})".format(recipe['name']))
+            bsrecipe = BSRecipe(recipe['name'], recipe['epoch'],
+                                recipe['version'], recipe['revision'])
+            for task, data in recipe['tasks'].items():
+                bsrecipe.tasks[task] = BSTask(data)
+
+            buildstats[recipe['name']] = bsrecipe
+
+        return buildstats
+
+    @staticmethod
+    def from_file_json(path):
+        """Load buildstats from a JSON file"""
+        with open(path) as fobj:
+            bs_json = json.load(fobj)
+        return BuildStats.from_json(bs_json)
+
+
+    @staticmethod
+    def split_nevr(nevr):
+        """Split name and version information from recipe "nevr" string"""
+        n_e_v, revision = nevr.rsplit('-', 1)
+        match = re.match(r'^(?P<name>\S+)-((?P<epoch>[0-9]{1,5})_)?(?P<version>[0-9]\S*)$',
+                         n_e_v)
+        if not match:
+            # If we're not able to parse a version starting with a number, just
+            # take the part after last dash
+            match = re.match(r'^(?P<name>\S+)-((?P<epoch>[0-9]{1,5})_)?(?P<version>[^-]+)$',
+                             n_e_v)
+        name = match.group('name')
+        version = match.group('version')
+        epoch = match.group('epoch')
+        return name, epoch, version, revision
+
+    @classmethod
+    def from_dir(cls, path):
+        """Load buildstats from a buildstats directory"""
+        if not os.path.isfile(os.path.join(path, 'build_stats')):
+            raise BSError("{} does not look like a buildstats directory".format(path))
+
+        log.debug("Reading buildstats directory %s", path)
+
+        buildstats = cls()
+        subdirs = os.listdir(path)
+        for dirname in subdirs:
+            recipe_dir = os.path.join(path, dirname)
+            if not os.path.isdir(recipe_dir):
+                continue
+            name, epoch, version, revision = cls.split_nevr(dirname)
+            bsrecipe = BSRecipe(name, epoch, version, revision)
+            for task in os.listdir(recipe_dir):
+                bsrecipe.tasks[task] = BSTask.from_file(
+                    os.path.join(recipe_dir, task))
+            if name in buildstats:
+                raise BSError("Cannot handle multiple versions of the same "
+                              "package ({})".format(name))
+            buildstats[name] = bsrecipe
+
+        return buildstats
+
+    def aggregate(self, buildstats):
+        """Aggregate other buildstats into this"""
+        if set(self.keys()) != set(buildstats.keys()):
+            raise ValueError("Refusing to aggregate buildstats, set of "
+                             "recipes is different")
+        for pkg, data in buildstats.items():
+            self[pkg].aggregate(data)
+
+
+def diff_buildstats(bs1, bs2, stat_attr, min_val=None, min_absdiff=None):
+    """Compare the tasks of two buildstats"""
+    tasks_diff = []
+    pkgs = set(bs1.keys()).union(set(bs2.keys()))
+    for pkg in pkgs:
+        tasks1 = bs1[pkg].tasks if pkg in bs1 else {}
+        tasks2 = bs2[pkg].tasks if pkg in bs2 else {}
+        if not tasks1:
+            pkg_op = '+'
+        elif not tasks2:
+            pkg_op = '-'
+        else:
+            pkg_op = ' '
+
+        for task in set(tasks1.keys()).union(set(tasks2.keys())):
+            task_op = ' '
+            if task in tasks1:
+                val1 = getattr(bs1[pkg].tasks[task], stat_attr)
+            else:
+                task_op = '+'
+                val1 = 0
+            if task in tasks2:
+                val2 = getattr(bs2[pkg].tasks[task], stat_attr)
+            else:
+                val2 = 0
+                task_op = '-'
+
+            if val1 == 0:
+                reldiff = float('inf')
+            else:
+                reldiff = 100 * (val2 - val1) / val1
+
+            if min_val and max(val1, val2) < min_val:
+                log.debug("Filtering out %s:%s (%s)", pkg, task,
+                          max(val1, val2))
+                continue
+            if min_absdiff and abs(val2 - val1) < min_absdiff:
+                log.debug("Filtering out %s:%s (difference of %s)", pkg, task,
+                          val2-val1)
+                continue
+            tasks_diff.append(TaskDiff(pkg, pkg_op, task, task_op, val1, val2,
+                                       val2-val1, reldiff))
+    return tasks_diff
-- 
2.12.3


