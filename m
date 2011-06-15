Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1QWjkQ-00024H-GN
	for openembedded-core@lists.openembedded.org;
	Wed, 15 Jun 2011 08:38:42 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p5F6ZFl3029075
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jun 2011 23:35:15 -0700 (PDT)
Received: from usp-ub10.corp.ad.wrs.com (128.224.163.66) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.1.255.0; Tue, 14 Jun 2011 23:35:15 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 15 Jun 2011 14:33:43 +0800
Message-ID: <0011dc7d424e3cd9dc6b682da482b72cfc4b5070.1308108460.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1308108460.git.liezhi.yang@windriver.com>
References: <cover.1308108460.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/4 V2] bitbake: share source directory
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 15 Jun 2011 06:38:42 -0000
Content-Type: text/plain

This patch is derived from Richard, it is a quick proof of concept to
show how source code could be shared between recipes which use ${B} to
have a separate build directory compared to source directory ${S}.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 bitbake/lib/bb/build.py    |    4 ++--
 bitbake/lib/bb/cache.py    |    3 +++
 bitbake/lib/bb/runqueue.py |   10 ++++++++++
 3 files changed, 15 insertions(+), 2 deletions(-)

diff --git a/bitbake/lib/bb/build.py b/bitbake/lib/bb/build.py
index 7947906..052a3bf 100644
--- a/bitbake/lib/bb/build.py
+++ b/bitbake/lib/bb/build.py
@@ -383,10 +383,10 @@ def stamp_internal(taskname, d, file_name):
         taskflagname = taskname.replace("_setscene", "")
 
     if file_name:
-        stamp = d.stamp[file_name]
+        stamp = d.stamp_base[file_name].get(taskflagname) or d.stamp[file_name]
         extrainfo = d.stamp_extrainfo[file_name].get(taskflagname) or ""
     else:
-        stamp = d.getVar('STAMP', True)
+        stamp = d.getVarFlag(taskflagname, 'stamp-base', True) or d.getVar('STAMP', True)
         file_name = d.getVar('BB_FILENAME', True)
         extrainfo = d.getVarFlag(taskflagname, 'stamp-extra-info', True) or ""
 
diff --git a/bitbake/lib/bb/cache.py b/bitbake/lib/bb/cache.py
index 6c92a93..99d7395 100644
--- a/bitbake/lib/bb/cache.py
+++ b/bitbake/lib/bb/cache.py
@@ -124,6 +124,7 @@ class CoreRecipeInfo(RecipeInfoCommon):
         self.broken = self.getvar('BROKEN', metadata)
         self.not_world = self.getvar('EXCLUDE_FROM_WORLD', metadata)
         self.stamp = self.getvar('STAMP', metadata)
+        self.stamp_base = self.flaglist('stamp-base', self.tasks, metadata)
         self.stamp_extrainfo = self.flaglist('stamp-extra-info', self.tasks, metadata)
         self.packages_dynamic = self.listvar('PACKAGES_DYNAMIC', metadata)
         self.depends          = self.depvar('DEPENDS', metadata)
@@ -151,6 +152,7 @@ class CoreRecipeInfo(RecipeInfoCommon):
         cachedata.pkg_dp = {}
 
         cachedata.stamp = {}
+        cachedata.stamp_base = {}
         cachedata.stamp_extrainfo = {}
         cachedata.fn_provides = {}
         cachedata.pn_provides = defaultdict(list)
@@ -183,6 +185,7 @@ class CoreRecipeInfo(RecipeInfoCommon):
         cachedata.pkg_pepvpr[fn] = (self.pe, self.pv, self.pr)
         cachedata.pkg_dp[fn] = self.defaultpref
         cachedata.stamp[fn] = self.stamp
+        cachedata.stamp_base[fn] = self.stamp_base
         cachedata.stamp_extrainfo[fn] = self.stamp_extrainfo
 
         provides = [self.pn]
diff --git a/bitbake/lib/bb/runqueue.py b/bitbake/lib/bb/runqueue.py
index af21eae..5ec69af 100644
--- a/bitbake/lib/bb/runqueue.py
+++ b/bitbake/lib/bb/runqueue.py
@@ -105,6 +105,11 @@ class RunQueueScheduler(object):
             if self.rq.runq_running[taskid] == 1:
                 continue
             if self.rq.runq_buildable[taskid] == 1:
+                fn = self.rqdata.taskData.fn_index[self.rqdata.runq_fnid[taskid]]
+                taskname = self.rqdata.runq_task[taskid]
+                stamp = bb.build.stampfile(taskname, self.rqdata.dataCache, fn)
+                if stamp in self.rq.build_stamps.values():
+                    continue
                 return taskid
 
     def next(self):
@@ -1009,6 +1014,7 @@ class RunQueueExecute:
         self.runq_complete = []
         self.build_pids = {}
         self.build_pipes = {}
+        self.build_stamps = {}
         self.failed_fnids = []
 
     def runqueue_process_waitpid(self):
@@ -1023,6 +1029,9 @@ class RunQueueExecute:
         del self.build_pids[result[0]]
         self.build_pipes[result[0]].close()
         del self.build_pipes[result[0]]
+        # self.build_stamps[result[0]] may not exist when use shared work directory.
+        if result[0] in self.build_stamps.keys():
+            del self.build_stamps[result[0]]
         if result[1] != 0:
             self.task_fail(task, result[1]>>8)
         else:
@@ -1319,6 +1328,7 @@ class RunQueueExecuteTasks(RunQueueExecute):
 
             self.build_pids[pid] = task
             self.build_pipes[pid] = runQueuePipe(pipein, pipeout, self.cfgData)
+            self.build_stamps[pid] = bb.build.stampfile(taskname, self.rqdata.dataCache, fn)
             self.runq_running[task] = 1
             self.stats.taskActive()
             if self.stats.active < self.number_tasks:
-- 
1.7.1



