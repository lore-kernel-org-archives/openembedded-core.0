Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id D127A7232F
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Dec 2014 06:16:54 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id sB56Glb6009614
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL);
	Thu, 4 Dec 2014 22:16:47 -0800 (PST)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Thu, 4 Dec 2014 22:16:47 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <ross.burton@intel.com>,
	<richard.purdie@linuxfoundation.org>
Date: Fri, 5 Dec 2014 14:16:40 +0800
Message-ID: <e9073e57c09185d894ad3a13f6d373582e054dc0.1417759913.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1417759913.git.hongxu.jia@windriver.com>
References: <cover.1417759913.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] archiver: execute the probable tasks between do_unpack and do_patch
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
X-List-Received-Date: Fri, 05 Dec 2014 06:16:55 -0000
Content-Type: text/plain

While archiver inherited, we edit a recipe (such
as gzip) to insert four tasks between do_patch and
do_unpack:
...
addtask test1 after do_unpack before do_patch
addtask test2 after do_unpack before do_test1
addtask test3 after do_test2 before do_test1
addtask test4 after do_test2 before do_test1
...

While building the recipe, the archiver will
missing these four task in do_unpack_and_patch.
Because it is hardcoded to execute do_unpach and
do_patch, did not consider the probable tasks
between them.

We make use of the value of BB_TASKDEPDATA which
provided by metadata to compute the probable
tasks between do_unpack and do_patch and execute
them.

[Yocto #7018]

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/classes/archiver.bbclass | 119 +++++++++++++++++++++++++++++++++++++++---
 1 file changed, 112 insertions(+), 7 deletions(-)

diff --git a/meta/classes/archiver.bbclass b/meta/classes/archiver.bbclass
index b598aa3..d52fe99 100644
--- a/meta/classes/archiver.bbclass
+++ b/meta/classes/archiver.bbclass
@@ -269,6 +269,113 @@ def create_diff_gz(d, src_orig, src, ar_outdir):
     subprocess.call(diff_cmd, shell=True)
     bb.utils.remove(src_patched, recurse=True)
 
+# It helps to compute task dependencies between begin and end.
+# Here is an example, in a recipe we insert four tasks between do_patch
+# and do_unpack:
+# addtask test1 after do_unpack before do_patch
+# addtask test2 after do_unpack before do_test1
+# addtask test3 after do_test2 before do_test1
+# addtask test4 after do_test2 before do_test1
+#
+# We want to list the order of task dependencies:
+# ['do_unpack', 'do_test2', 'do_test3', 'do_test4', 'do_test1', 'do_patch']
+def list_sorted_tasks(begin, end, d):
+    parent_graph = construct_parent_graph(begin, end, d)
+
+    # Sort tasks according to the number of parent tasks incrementally
+    return [x[0] for x in sorted(parent_graph.iteritems(), key = lambda d:len(d[1]))]
+
+# List all parents for each tasks, such as:
+# From
+# task_deps = {
+#   'do_patch': ['do_test1', 'do_unpack'],
+#   'do_test1': ['do_test4', 'do_test3', 'do_test2', 'do_unpack']
+#   'do_test2': ['do_unpack'],
+#   'do_test3': ['do_test2'],
+#   'do_test4': ['do_test2']
+# }
+# to the parent graph we counstruct:
+# parent_graph = {
+#   'do_patch': ['do_test1', 'do_test2', 'do_test3', 'do_test4', 'do_unpack'],
+#   'do_test1': ['do_test4', 'do_test3', 'do_test2', 'do_unpack'],
+#   'do_test2': ['do_unpack'],
+#   'do_test3': ['do_test2', 'do_unpack'],
+#   'do_test4': ['do_test2', 'do_unpack'],
+#   'do_unpack': []
+# }
+#
+# We are not care about circualar dependency, the bitbake parser will do the
+# checking.
+def construct_parent_graph(begin, end, d):
+    task_deps = construct_task_deps(d)
+    def list_parents(task):
+        if task == begin:
+            return []
+        parents = task_deps[task]
+        for ptask in task_deps[task]:
+            parents += [x for x in list_parents(ptask) if x not in parents]
+        return parents
+
+    parent_graph = dict()
+    # All the tasks we need listed in the end's parent
+    end_parent = list_parents(end)
+    parent_graph[end] = end_parent
+    for task in end_parent:
+        parent_graph[task] = list_parents(task)
+
+    return parent_graph
+
+# Construct task_deps from BB_TASKDEPDATA, it lists parents for each
+# task within the current recipe, such as:
+# From
+# BB_TASKDEPDATA = {
+#   0: ['gzip', 'do_test1', '**/gzip_1.6.bb', set([1, 18, 19, 20])],
+#   1: ['gzip', 'do_unpack', '**/gzip_1.6.bb', set([5, 6])],
+#   2: ['gzip', 'do_patch', '**/gzip_1.6.bb', set([0, 1, 24])],
+#   ...
+#   5: ['gzip', 'do_fetch', '**/gzip_1.6.bb', set([])],
+#   6: ['gzip', 'do_wrlbuildlink', '**/gzip_1.6.bb', set([])],
+#   ...
+#   14: ['gzip', 'do_unpack_and_patch', '**/gzip_1.6.bb', set([2, 14])]
+#   ...
+#   18: ['gzip', 'do_test4', '**/gzip_1.6.bb', set([20])],
+#   19: ['gzip', 'do_test3', '**/gzip_1.6.bb', set([20])],
+#   20: ['gzip', 'do_test2', '**/gzip_1.6.bb', set([1])],
+#   ...
+#   24: ['quilt-native', 'do_populate_sysroot', '**/quilt-native_0.63.bb', set([23])],
+# }
+# to the task deps we counstruct:
+# task_deps = {
+#   'do_test2': ['do_unpack'],
+#   'do_test3': ['do_test2'],
+#   'do_fetch': [],
+#   'do_test1': ['do_unpack', 'do_test4', 'do_test3', 'do_test2'],
+#   'do_test4': ['do_test2'],
+#   'do_patch': ['do_test1', 'do_unpack'],
+#   'do_unpack_and_patch': ['do_patch'],
+#   'do_unpack': ['do_fetch', 'do_wrlbuildlink'],
+#   'do_wrlbuildlink': []
+# }
+def construct_task_deps(d):
+    taskdepdata = d.getVar('BB_TASKDEPDATA', True)
+    pn = d.getVar('PN', True)
+    task_deps = dict()
+    for task_id in taskdepdata:
+        # Filter out dep task which is not in the current recipe
+        if pn != taskdepdata[task_id][0]:
+            continue
+
+        task =  taskdepdata[task_id][1]
+        dep_ids = taskdepdata[task_id][3]
+        task_deps[task] = list()
+        for dep_id in dep_ids:
+            if pn != taskdepdata[dep_id][0] or dep_id == task_id:
+                continue
+            dep_task = taskdepdata[dep_id][1]
+            task_deps[task].append(dep_task)
+
+    return task_deps
+
 # Run do_unpack and do_patch
 python do_unpack_and_patch() {
     if d.getVarFlag('ARCHIVER_MODE', 'src', True) not in \
@@ -286,13 +393,11 @@ python do_unpack_and_patch() {
     # do_patch required 'B' existed).
     bb.utils.mkdirhier(d.getVar('B', True))
 
-    # The kernel source is ready after do_validate_branches
-    if bb.data.inherits_class('kernel-yocto', d):
-        bb.build.exec_func('do_unpack', d)
-        bb.build.exec_func('do_kernel_checkout', d)
-        bb.build.exec_func('do_validate_branches', d)
-    else:
-        bb.build.exec_func('do_unpack', d)
+    tasks = list_sorted_tasks('do_unpack', 'do_patch', d)
+    bb.note('execute %s in do_unpack_and_patch' % tasks)
+    # Do not execute 'do_patch' here
+    for task in tasks[0:-1]:
+        bb.build.exec_func(task, d)
 
     # Save the original source for creating the patches
     if d.getVarFlag('ARCHIVER_MODE', 'diff', True) == '1':
-- 
1.9.1


