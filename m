Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id C91F870031
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Sep 2016 14:28:11 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga101.jf.intel.com with ESMTP; 29 Sep 2016 07:28:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,415,1470726000"; d="scan'208";a="15040334"
Received: from wegenerj-mobl1.ger.corp.intel.com (HELO
	mqz-osx-suse64.fi.intel.com) ([10.252.44.79])
	by orsmga004.jf.intel.com with ESMTP; 29 Sep 2016 07:28:12 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 29 Sep 2016 17:28:00 +0300
Message-Id: <1475159288-31921-4-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.6.6
In-Reply-To: <1475159288-31921-1-git-send-email-markus.lehtonen@linux.intel.com>
References: <1475159288-31921-1-git-send-email-markus.lehtonen@linux.intel.com>
Subject: [PATCH 03/11] scripts/buildstats-diff: implement BSTask class
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
X-List-Received-Date: Thu, 29 Sep 2016 14:28:12 -0000

New class representing buildstats data of a single task.

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 scripts/buildstats-diff | 51 +++++++++++++++++++++++++++++++------------------
 1 file changed, 32 insertions(+), 19 deletions(-)

diff --git a/scripts/buildstats-diff b/scripts/buildstats-diff
index 7728b6d..22c44ff 100755
--- a/scripts/buildstats-diff
+++ b/scripts/buildstats-diff
@@ -62,11 +62,26 @@ def to_datetime_obj(obj):
         return datetime.utcfromtimestamp(obj).replace(tzinfo=TIMEZONES['UTC'])
 
 
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
+        return self['rusage']['ru_stime'] + self['rusage']['ru_utime'] + \
+               self['child_rusage']['ru_stime'] + self['child_rusage']['ru_utime']
+
+
 def read_buildstats_file(buildstat_file):
     """Convert buildstat text file into dict/json"""
-    bs_json = {'iostat': {},
-               'rusage': {},
-               'child_rusage': {}}
+    bs_task = BSTask()
     log.debug("Reading task buildstats from %s", buildstat_file)
     with open(buildstat_file) as fobj:
         for line in fobj.readlines():
@@ -74,12 +89,12 @@ def read_buildstats_file(buildstat_file):
             val = val.strip()
             if key == 'Started':
                 start_time = to_datetime_obj(float(val))
-                bs_json['start_time'] = start_time
+                bs_task['start_time'] = start_time
             elif key == 'Ended':
                 end_time = to_datetime_obj(float(val))
             elif key.startswith('IO '):
                 split = key.split()
-                bs_json['iostat'][split[1]] = int(val)
+                bs_task['iostat'][split[1]] = int(val)
             elif key.find('rusage') >= 0:
                 split = key.split()
                 ru_key = split[-1]
@@ -89,11 +104,11 @@ def read_buildstats_file(buildstat_file):
                     val = int(val)
                 ru_type = 'rusage' if split[0] == 'rusage' else \
                                                   'child_rusage'
-                bs_json[ru_type][ru_key] = val
+                bs_task[ru_type][ru_key] = val
             elif key == 'Status':
-                bs_json['status'] = val
-    bs_json['elapsed_time'] = end_time - start_time
-    return bs_json
+                bs_task['status'] = val
+    bs_task['elapsed_time'] = end_time - start_time
+    return bs_task
 
 
 def read_buildstats_dir(bs_dir):
@@ -170,6 +185,10 @@ def read_buildstats_json(path):
             recipe_bs['nevr'] = "{}-{}-{}".format(recipe_bs['name'], recipe_bs['version'], recipe_bs['revision'])
         else:
             recipe_bs['nevr'] = "{}-{}_{}-{}".format(recipe_bs['name'], recipe_bs['epoch'], recipe_bs['version'], recipe_bs['revision'])
+
+        for task, data in recipe_bs['tasks'].copy().items():
+            recipe_bs['tasks'][task] = BSTask(data)
+
         buildstats[recipe_bs['name']] = recipe_bs
 
     return buildstats
@@ -253,12 +272,6 @@ def print_ver_diff(bs1, bs2):
             print(fmt_str.format(pkg, field1, field2, maxlen=maxlen))
 
 
-def task_time(task):
-    """Calculate sum of user and system time taken by a task"""
-    cputime = task['rusage']['ru_stime'] + task['rusage']['ru_utime'] + \
-              task['child_rusage']['ru_stime'] + task['child_rusage']['ru_utime']
-    return cputime
-
 
 def print_task_diff(bs1, bs2, min_val=0, min_absdiff=0, sort_by=('absdiff',)):
     """Diff task execution times"""
@@ -283,8 +296,8 @@ def print_task_diff(bs1, bs2, min_val=0, min_absdiff=0, sort_by=('absdiff',)):
             if len(task) > task_maxlen:
                 task_maxlen = len(task)
 
-            t1 = task_time(bs1[pkg]['tasks'][task]) if task in tasks1 else 0
-            t2 = task_time(bs2[pkg]['tasks'][task]) if task in tasks2 else 0
+            t1 = bs1[pkg]['tasks'][task].cputime if task in tasks1 else 0
+            t2 = bs2[pkg]['tasks'][task].cputime if task in tasks2 else 0
             task_op = '  '
             if t1 == 0:
                 reldiff = float('inf')
@@ -334,8 +347,8 @@ def print_timediff_summary(bs1, bs2):
     def total_cputime(buildstats):
         sum = 0.0
         for recipe_data in buildstats.values():
-            for task_data in recipe_data['tasks'].values():
-                sum += task_time(task_data)
+            for bs_task in recipe_data['tasks'].values():
+                sum += bs_task.cputime
         return sum
 
     def hms_time(secs):
-- 
2.6.6


