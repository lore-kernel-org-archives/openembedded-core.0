Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 79BDD73175
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 May 2016 23:24:58 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga101.fm.intel.com with ESMTP; 10 May 2016 16:25:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,606,1455004800"; d="scan'208";a="700145628"
Received: from keanhoon-mobl1.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.145.253])
	by FMSMGA003.fm.intel.com with ESMTP; 10 May 2016 16:24:57 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 May 2016 11:24:16 +1200
Message-Id: <eb4d869ec71dacbf6efe9664dcb41036264372d0.1462921503.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <cover.1462921503.git.paul.eggleton@linux.intel.com>
References: <cover.1462921503.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1462921503.git.paul.eggleton@linux.intel.com>
References: <cover.1462921503.git.paul.eggleton@linux.intel.com>
Subject: [RFC PATCH 2/6] lib: implement basic task progress support
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
X-List-Received-Date: Tue, 10 May 2016 23:24:58 -0000

For long-running tasks where we have some output from the task that
gives us some idea of the progress of the task (such as a percentage
complete), provide the means to scrape the output for that progress
information and show it to the user in the default knotty terminal
output in the form of a progress bar. This is implemented using a new
TaskProgress event as well as some code we can insert to do output
scanning/filtering.

Any task can fire TaskProgress events; however, if you have a shell task
whose output you wish to scan for progress information, you just need to
set the "progress" varflag on the task. This can be set to:
 * "percent" to just look for a number followed by a % sign
 * "percent:<regex>" to specify your own regex matching a percentage
   value (must have a single group which matches the percentage number)
 * "outof:<regex>" to look for the specified regex matching x out of y
   items completed (must have two groups - first group needs to be x,
   second y).
We can potentially extend this in future but this should be a good
start.

Line changes such as the ones you get in git's output as it progresses
don't make it to the log files, you only get the final state of the line
so the logs aren't filled with progress information that's useless after
the fact.

Part of the implementation for [YOCTO #5383].

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 bitbake/lib/bb/build.py                | 112 +++++++++++++++++++++++++++++++++
 bitbake/lib/bb/ui/knotty.py            |  74 +++++++++++++++++++---
 bitbake/lib/bb/ui/uihelper.py          |   7 ++-
 bitbake/lib/progressbar/progressbar.py |  16 +++--
 bitbake/lib/progressbar/widgets.py     |  36 +++++++++++
 5 files changed, 231 insertions(+), 14 deletions(-)

diff --git a/bitbake/lib/bb/build.py b/bitbake/lib/bb/build.py
index a5b99ed..0b28492 100644
--- a/bitbake/lib/bb/build.py
+++ b/bitbake/lib/bb/build.py
@@ -35,6 +35,7 @@ import stat
 import bb
 import bb.msg
 import bb.process
+import re
 from contextlib import nested
 from bb import event, utils
 
@@ -138,6 +139,13 @@ class TaskInvalid(TaskBase):
         super(TaskInvalid, self).__init__(task, None, metadata)
         self._message = "No such task '%s'" % task
 
+class TaskProgress(event.Event):
+    def __init__(self, task, progress, rate=None):
+        self.task = task
+        self.progress = progress
+        self.rate = rate
+        event.Event.__init__(self)
+
 
 class LogTee(object):
     def __init__(self, logger, outfile):
@@ -161,6 +169,96 @@ class LogTee(object):
     def flush(self):
         self.outfile.flush()
 
+
+class ProgressHandler(object):
+    """
+    Base class that can pretend to be a file object well enough to be
+    used to build objects to intercept console output and determine the
+    progress of some operation.
+    """
+    def __init__(self, d, outfile=None):
+        self._progress = 0
+        self._data = d
+        self._lastevent = 0
+        if outfile:
+            self._outfile = outfile
+        else:
+            self._outfile = sys.stdout
+
+    def write(self, string):
+        self._outfile.write(string)
+
+    def flush(self):
+        self._outfile.flush()
+
+    def update(self, progress, rate=None):
+        ts = time.time()
+        if progress > 100:
+            progress = 100
+        if progress != self._progress or self._lastevent + 1 < ts:
+            bb.event.fire(bb.build.TaskProgress(0, progress, rate), self._data)
+            self._lastevent = ts
+            self._progress = progress
+
+class BasicProgressHandler(ProgressHandler):
+    def __init__(self, d, regex=r'(\d+)%', outfile=None):
+        super(BasicProgressHandler, self).__init__(d, outfile)
+        self._regex = re.compile(regex)
+        # Send an initial progress event so the bar gets shown
+        bb.event.fire(bb.build.TaskProgress(0, 0), self._data)
+
+    def write(self, string):
+        percs = self._regex.findall(string)
+        if percs:
+            progress = int(percs[-1])
+            self.update(progress)
+        super(BasicProgressHandler, self).write(string)
+
+class OutOfProgressHandler(ProgressHandler):
+    def __init__(self, d, regex, outfile=None):
+        super(OutOfProgressHandler, self).__init__(d, outfile)
+        self._regex = re.compile(regex)
+        # Send an initial progress event so the bar gets shown
+        bb.event.fire(bb.build.TaskProgress(0, 0), self._data)
+
+    def write(self, string):
+        nums = self._regex.findall(string)
+        if nums:
+            progress = (float(nums[-1][0]) / float(nums[-1][1])) * 100
+            self.update(progress)
+        super(OutOfProgressHandler, self).write(string)
+
+class MultiStageProgressReporter(object):
+    """
+    Class which allows reporting progress without the caller
+    having to know where they are in the overall sequence. Useful
+    for tasks made up of python code spread across multiple
+    classes / functions.
+    """
+    def __init__(self, d, stage_weights):
+        self._data = d
+        self._stage_weights = stage_weights
+        self._stage = 0
+        self._base_progress = 0
+        # Send an initial progress event so the bar gets shown
+        bb.event.fire(bb.build.TaskProgress(0, 0), self._data)
+
+    def next_stage(self):
+        self._stage += 1
+        if self._stage < len(self._stage_weights):
+            self._base_progress = sum(self._stage_weights[:self._stage]) * 100
+        else:
+            bb.warn('ProgressReporter: current stage beyond declared number of stages')
+            self._base_progress = 100
+        bb.event.fire(bb.build.TaskProgress(0, self._base_progress), self._data)
+
+    def update(self, stageprogress):
+        progress = self._base_progress + (stageprogress * self._stage_weights[self._stage])
+        if progress > 100:
+            progress = 100
+        bb.event.fire(bb.build.TaskProgress(0, progress), self._data)
+
+
 #
 # pythonexception allows the python exceptions generated to be raised
 # as the real exceptions (not FuncFailed) and without a backtrace at the 
@@ -341,6 +439,20 @@ exit $ret
     else:
         logfile = sys.stdout
 
+    progress = d.getVarFlag(func, 'progress', True)
+    if progress:
+        if progress == 'percent':
+            # Use default regex
+            logfile = BasicProgressHandler(d, outfile=logfile)
+        elif progress.startswith('percent:'):
+            # Use specified regex
+            logfile = BasicProgressHandler(d, regex=progress.split(':', 1)[1], outfile=logfile)
+        elif progress.startswith('outof:'):
+            # Use specified regex
+            logfile = OutOfProgressHandler(d, regex=progress.split(':', 1)[1], outfile=logfile)
+        else:
+            bb.warn('%s: invalid task progress varflag value "%s", ignoring' % (func, progress))
+
     def readfifo(data):
         lines = data.split('\0')
         for line in lines:
diff --git a/bitbake/lib/bb/ui/knotty.py b/bitbake/lib/bb/ui/knotty.py
index 010b06d..9d962b0 100644
--- a/bitbake/lib/bb/ui/knotty.py
+++ b/bitbake/lib/bb/ui/knotty.py
@@ -40,10 +40,13 @@ logger = logging.getLogger("BitBake")
 interactive = sys.stdout.isatty()
 
 class BBProgress(progressbar.ProgressBar):
-    def __init__(self, msg, maxval):
+    def __init__(self, msg, maxval, widgets=None):
         self.msg = msg
-        widgets = [progressbar.Percentage(), ' ', progressbar.Bar(), ' ',
-           progressbar.ETA()]
+        self.extrapos = -1
+        if not widgets:
+            widgets = [progressbar.Percentage(), ' ', progressbar.Bar(), ' ',
+            progressbar.ETA()]
+            self.extrapos = 4
 
         try:
             self._resize_default = signal.getsignal(signal.SIGWINCH)
@@ -55,11 +58,31 @@ class BBProgress(progressbar.ProgressBar):
         progressbar.ProgressBar._handle_resize(self, signum, frame)
         if self._resize_default:
             self._resize_default(signum, frame)
+
     def finish(self):
         progressbar.ProgressBar.finish(self)
         if self._resize_default:
             signal.signal(signal.SIGWINCH, self._resize_default)
 
+    def setmessage(self, msg):
+        self.msg = msg
+        self.widgets[0] = msg
+
+    def setextra(self, extra):
+        if extra:
+            extrastr = str(extra)
+            if extrastr[0] != ' ':
+                extrastr = ' ' + extrastr
+            if extrastr[-1] != ' ':
+                extrastr += ' '
+        else:
+            extrastr = ' '
+        self.widgets[self.extrapos] = extrastr
+
+    def _need_update(self):
+        # We always want the bar to print when update() is called
+        return True
+
 class NonInteractiveProgress(object):
     fobj = sys.stdout
 
@@ -194,15 +217,31 @@ class TerminalFilter(object):
         activetasks = self.helper.running_tasks
         failedtasks = self.helper.failed_tasks
         runningpids = self.helper.running_pids
-        if self.footer_present and (self.lastcount == self.helper.tasknumber_current) and (self.lastpids == runningpids):
+        if self.footer_present and not self.helper.needUpdate:
             return
+        self.helper.needUpdate = False
         if self.footer_present:
             self.clearFooter()
         if (not self.helper.tasknumber_total or self.helper.tasknumber_current == self.helper.tasknumber_total) and not len(activetasks):
             return
         tasks = []
         for t in runningpids:
-            tasks.append("%s (pid %s)" % (activetasks[t]["title"], t))
+            progress = activetasks[t].get("progress", None)
+            if progress is not None:
+                pbar = activetasks[t].get("progressbar", None)
+                rate = activetasks[t].get("rate", None)
+                start_time = activetasks[t].get("starttime", None)
+                if not pbar or pbar.bouncing != (progress < 0):
+                    if progress < 0:
+                        pbar = BBProgress("0: %s (pid %s) " % (activetasks[t]["title"], t), 100, widgets=[progressbar.BouncingSlider()])
+                        pbar.bouncing = True
+                    else:
+                        pbar = BBProgress("0: %s (pid %s) " % (activetasks[t]["title"], t), 100)
+                        pbar.bouncing = False
+                    activetasks[t]["progressbar"] = pbar
+                tasks.append((pbar, progress, rate, start_time))
+            else:
+                tasks.append("%s (pid %s)" % (activetasks[t]["title"], t))
 
         if self.main.shutdown:
             content = "Waiting for %s running tasks to finish:" % len(activetasks)
@@ -213,8 +252,23 @@ class TerminalFilter(object):
         print(content)
         lines = 1 + int(len(content) / (self.columns + 1))
         for tasknum, task in enumerate(tasks[:(self.rows - 2)]):
-            content = "%s: %s" % (tasknum, task)
-            print(content)
+            if isinstance(task, tuple):
+                pbar, progress, rate, start_time = task
+                if not pbar.start_time:
+                    pbar.start(False)
+                    if start_time:
+                        pbar.start_time = start_time
+                pbar.setmessage('%s:%s' % (tasknum, pbar.msg.split(':', 1)[1]))
+                if progress > -1:
+                    pbar.setextra(rate)
+                    output = pbar.update(progress)
+                else:
+                    output = pbar.update(1)
+                if not output or (len(output) <= pbar.term_width):
+                    print('')
+            else:
+                content = "%s: %s" % (tasknum, task)
+                print(content)
             lines = lines + 1 + int(len(content) / (self.columns + 1))
         self.footer_present = lines
         self.lastpids = runningpids[:]
@@ -248,7 +302,8 @@ _evt_list = [ "bb.runqueue.runQueueExitWait", "bb.event.LogExecTTY", "logging.Lo
               "bb.command.CommandExit", "bb.command.CommandCompleted",  "bb.cooker.CookerExit",
               "bb.event.MultipleProviders", "bb.event.NoProvider", "bb.runqueue.sceneQueueTaskStarted",
               "bb.runqueue.runQueueTaskStarted", "bb.runqueue.runQueueTaskFailed", "bb.runqueue.sceneQueueTaskFailed",
-              "bb.event.BuildBase", "bb.build.TaskStarted", "bb.build.TaskSucceeded", "bb.build.TaskFailedSilent"]
+              "bb.event.BuildBase", "bb.build.TaskStarted", "bb.build.TaskSucceeded", "bb.build.TaskFailedSilent",
+              "bb.build.TaskProgress"]
 
 def main(server, eventHandler, params, tf = TerminalFilter):
 
@@ -527,7 +582,8 @@ def main(server, eventHandler, params, tf = TerminalFilter):
                                   bb.event.OperationStarted,
                                   bb.event.OperationCompleted,
                                   bb.event.OperationProgress,
-                                  bb.event.DiskFull)):
+                                  bb.event.DiskFull,
+                                  bb.build.TaskProgress)):
                 continue
 
             logger.error("Unknown event: %s", event)
diff --git a/bitbake/lib/bb/ui/uihelper.py b/bitbake/lib/bb/ui/uihelper.py
index db70b76..1915e47 100644
--- a/bitbake/lib/bb/ui/uihelper.py
+++ b/bitbake/lib/bb/ui/uihelper.py
@@ -18,6 +18,7 @@
 # 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
 
 import bb.build
+import time
 
 class BBUIHelper:
     def __init__(self):
@@ -31,7 +32,7 @@ class BBUIHelper:
 
     def eventHandler(self, event):
         if isinstance(event, bb.build.TaskStarted):
-            self.running_tasks[event.pid] = { 'title' : "%s %s" % (event._package, event._task) }
+            self.running_tasks[event.pid] = { 'title' : "%s %s" % (event._package, event._task), 'starttime' : time.time() }
             self.running_pids.append(event.pid)
             self.needUpdate = True
         if isinstance(event, bb.build.TaskSucceeded):
@@ -52,6 +53,10 @@ class BBUIHelper:
             self.tasknumber_current = event.stats.completed + event.stats.active + event.stats.failed + 1
             self.tasknumber_total = event.stats.total
             self.needUpdate = True
+        if isinstance(event, bb.build.TaskProgress):
+            self.running_tasks[event.pid]['progress'] = event.progress
+            self.running_tasks[event.pid]['rate'] = event.rate
+            self.needUpdate = True
 
     def getTasks(self):
         self.needUpdate = False
diff --git a/bitbake/lib/progressbar/progressbar.py b/bitbake/lib/progressbar/progressbar.py
index 0b9dcf7..2873ad6 100644
--- a/bitbake/lib/progressbar/progressbar.py
+++ b/bitbake/lib/progressbar/progressbar.py
@@ -3,6 +3,8 @@
 # progressbar  - Text progress bar library for Python.
 # Copyright (c) 2005 Nilton Volpato
 #
+# (With some small changes after importing into BitBake)
+#
 # This library is free software; you can redistribute it and/or
 # modify it under the terms of the GNU Lesser General Public
 # License as published by the Free Software Foundation; either
@@ -261,12 +263,14 @@ class ProgressBar(object):
         now = time.time()
         self.seconds_elapsed = now - self.start_time
         self.next_update = self.currval + self.update_interval
-        self.fd.write(self._format_line() + '\r')
+        output = self._format_line()
+        self.fd.write(output + '\r')
         self.fd.flush()
         self.last_update_time = now
+        return output
 
 
-    def start(self):
+    def start(self, update=True):
         """Starts measuring time, and prints the bar at 0%.
 
         It returns self so you can use it like this:
@@ -289,8 +293,12 @@ class ProgressBar(object):
             self.update_interval = self.maxval / self.num_intervals
 
 
-        self.start_time = self.last_update_time = time.time()
-        self.update(0)
+        self.start_time = time.time()
+        if update:
+            self.last_update_time = self.start_time
+            self.update(0)
+        else:
+            self.last_update_time = 0
 
         return self
 
diff --git a/bitbake/lib/progressbar/widgets.py b/bitbake/lib/progressbar/widgets.py
index 6434ad5..77285ca 100644
--- a/bitbake/lib/progressbar/widgets.py
+++ b/bitbake/lib/progressbar/widgets.py
@@ -353,3 +353,39 @@ class BouncingBar(Bar):
         if not self.fill_left: rpad, lpad = lpad, rpad
 
         return '%s%s%s%s%s' % (left, lpad, marker, rpad, right)
+
+
+class BouncingSlider(Bar):
+    """
+    A slider that bounces back and forth in response to update() calls
+    without reference to the actual value. Based on a combination of
+    BouncingBar from a newer version of this module and RotatingMarker.
+    """
+    def __init__(self, marker='<=>'):
+        self.curmark = -1
+        self.forward = True
+        Bar.__init__(self, marker=marker)
+    def update(self, pbar, width):
+        left, marker, right = (format_updatable(i, pbar) for i in
+                               (self.left, self.marker, self.right))
+
+        width -= len(left) + len(right)
+        if width < 0:
+            return ''
+
+        if pbar.finished: return '%s%s%s' % (left, width * '=', right)
+
+        self.curmark = self.curmark + 1
+        position = int(self.curmark % (width * 2 - 1))
+        if position + len(marker) > width:
+            self.forward = not self.forward
+            self.curmark = 1
+            position = 1
+        lpad = ' ' * (position - 1)
+        rpad = ' ' * (width - len(marker) - len(lpad))
+
+        if not self.forward:
+            temp = lpad
+            lpad = rpad
+            rpad = temp
+        return '%s%s%s%s%s' % (left, lpad, marker, rpad, right)
-- 
2.5.5


