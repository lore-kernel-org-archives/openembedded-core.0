Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id E571873175
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 May 2016 23:25:00 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga101.fm.intel.com with ESMTP; 10 May 2016 16:25:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,606,1455004800"; d="scan'208";a="700145634"
Received: from keanhoon-mobl1.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.145.253])
	by FMSMGA003.fm.intel.com with ESMTP; 10 May 2016 16:24:59 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 May 2016 11:24:17 +1200
Message-Id: <0282f0c10e85fa22504f02c2aa6c4406e9dcd4f6.1462921503.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <cover.1462921503.git.paul.eggleton@linux.intel.com>
References: <cover.1462921503.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1462921503.git.paul.eggleton@linux.intel.com>
References: <cover.1462921503.git.paul.eggleton@linux.intel.com>
Subject: [RFC PATCH 3/6] fetch2: implement progress support
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
X-List-Received-Date: Tue, 10 May 2016 23:25:02 -0000

Implement progress reporting support specifically for the fetchers. For
fetch tasks we don't necessarily know which fetcher will be used (we
might initially be fetching a git:// URI, but if we instead download a
mirror tarball we may fetch that over http using wget). These programs
also have different abilities as far as reporting progress goes (e.g.
wget gives us percentage complete and rate, git gives this some of the
time depending on what stage it's at). Additionally we filter out the
progress output before it makes it to the logs, in order to prevent the
logs filling up with junk.

At the moment this is only implemented for the wget and git fetchers
since they are the most commonly used (and svn doesn't seem to support
any kind of progress output, at least not without doing a relatively
expensive remote file listing first).

Part of the implementation for [YOCTO #5383].

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 bitbake/lib/bb/build.py           | 31 ++++++++++++++++++++++++++
 bitbake/lib/bb/fetch2/__init__.py |  4 ++--
 bitbake/lib/bb/fetch2/git.py      | 47 +++++++++++++++++++++++++++++++++++++--
 bitbake/lib/bb/fetch2/wget.py     | 26 +++++++++++++++++++++-
 4 files changed, 103 insertions(+), 5 deletions(-)

diff --git a/bitbake/lib/bb/build.py b/bitbake/lib/bb/build.py
index 0b28492..8cb80cf 100644
--- a/bitbake/lib/bb/build.py
+++ b/bitbake/lib/bb/build.py
@@ -200,6 +200,37 @@ class ProgressHandler(object):
             self._lastevent = ts
             self._progress = progress
 
+class LineFilterProgressHandler(ProgressHandler):
+    """
+    A ProgressHandler variant that provides the ability to filter out
+    the lines if they contain progress information. Additionally, it
+    filters out anything before the last line feed on a line. This can
+    be used to keep the logs clean of output that we've only enabled for
+    getting progress, assuming that that can be done on a per-line
+    basis.
+    """
+    def __init__(self, d, outfile=None):
+        self._linebuffer = ''
+        super(LineFilterProgressHandler, self).__init__(d, outfile)
+
+    def write(self, string):
+        self._linebuffer += string
+        while True:
+            breakpos = self._linebuffer.find('\n') + 1
+            if breakpos == 0:
+                break
+            line = self._linebuffer[:breakpos]
+            self._linebuffer = self._linebuffer[breakpos:]
+            # Drop any line feeds and anything that precedes them
+            lbreakpos = line.rfind('\r') + 1
+            if lbreakpos:
+                line = line[lbreakpos:]
+            if self.writeline(line):
+                super(LineFilterProgressHandler, self).write(line)
+
+    def writeline(self, line):
+        return True
+
 class BasicProgressHandler(ProgressHandler):
     def __init__(self, d, regex=r'(\d+)%', outfile=None):
         super(BasicProgressHandler, self).__init__(d, outfile)
diff --git a/bitbake/lib/bb/fetch2/__init__.py b/bitbake/lib/bb/fetch2/__init__.py
index 6ef0c6f..394c31c 100644
--- a/bitbake/lib/bb/fetch2/__init__.py
+++ b/bitbake/lib/bb/fetch2/__init__.py
@@ -784,7 +784,7 @@ def localpath(url, d):
     fetcher = bb.fetch2.Fetch([url], d)
     return fetcher.localpath(url)
 
-def runfetchcmd(cmd, d, quiet=False, cleanup=None):
+def runfetchcmd(cmd, d, quiet=False, cleanup=None, log=None):
     """
     Run cmd returning the command output
     Raise an error if interrupted or cmd fails
@@ -825,7 +825,7 @@ def runfetchcmd(cmd, d, quiet=False, cleanup=None):
     error_message = ""
 
     try:
-        (output, errors) = bb.process.run(cmd, shell=True, stderr=subprocess.PIPE)
+        (output, errors) = bb.process.run(cmd, log=log, shell=True, stderr=subprocess.PIPE)
         success = True
     except bb.process.NotFoundError as e:
         error_message = "Fetch command %s" % (e.command)
diff --git a/bitbake/lib/bb/fetch2/git.py b/bitbake/lib/bb/fetch2/git.py
index 526668b..c0160fd 100644
--- a/bitbake/lib/bb/fetch2/git.py
+++ b/bitbake/lib/bb/fetch2/git.py
@@ -71,11 +71,53 @@ import os
 import re
 import bb
 import errno
+import bb.build
 from   bb    import data
 from   bb.fetch2 import FetchMethod
 from   bb.fetch2 import runfetchcmd
 from   bb.fetch2 import logger
 
+
+class GitProgressHandler(bb.build.LineFilterProgressHandler):
+    """Extract progress information from git output"""
+    def __init__(self, d):
+        self._buffer = ''
+        self._count = 0
+        super(GitProgressHandler, self).__init__(d)
+        # Send an initial progress event so the bar gets shown
+        bb.event.fire(bb.build.TaskProgress(0, -1), self._data)
+
+    def write(self, string):
+        self._buffer += string
+        stages = ['Counting objects', 'Compressing objects', 'Receiving objects', 'Resolving deltas']
+        stage_weights = [0.2, 0.05, 0.5, 0.25]
+        stagenum = 0
+        for i, stage in reversed(list(enumerate(stages))):
+            if stage in self._buffer:
+                stagenum = i
+                self._buffer = ''
+                break
+        self._status = stages[stagenum]
+        percs = re.findall(r'(\d+)%', string)
+        if percs:
+            progress = int(round((int(percs[-1]) * stage_weights[stagenum]) + (sum(stage_weights[:stagenum]) * 100)))
+            rates = re.findall(r'([\d.]+ [a-zA-Z]*/s+)', string)
+            if rates:
+                rate = rates[-1]
+            else:
+                rate = None
+            self.update(progress, rate)
+        else:
+            if stagenum == 0:
+                percs = re.findall(r': (\d+)', string)
+                if percs:
+                    count = int(percs[-1])
+                    if count > self._count:
+                        self._count = count
+                        bb.event.fire(bb.build.TaskProgress(0, -count), self._data)
+        super(GitProgressHandler, self).write(string)
+
+
 class Git(FetchMethod):
     """Class to fetch a module or modules from git repositories"""
     def init(self, d):
@@ -196,10 +238,11 @@ class Git(FetchMethod):
             # We do this since git will use a "-l" option automatically for local urls where possible
             if repourl.startswith("file://"):
                 repourl = repourl[7:]
-            clone_cmd = "%s clone --bare --mirror %s %s" % (ud.basecmd, repourl, ud.clonedir)
+            clone_cmd = "LANG=C %s clone --bare --mirror %s %s --progress" % (ud.basecmd, repourl, ud.clonedir)
             if ud.proto.lower() != 'file':
                 bb.fetch2.check_network_access(d, clone_cmd)
-            runfetchcmd(clone_cmd, d)
+            progresshandler = GitProgressHandler(d)
+            runfetchcmd(clone_cmd, d, log=progresshandler)
 
         os.chdir(ud.clonedir)
         # Update the checkout if needed
diff --git a/bitbake/lib/bb/fetch2/wget.py b/bitbake/lib/bb/fetch2/wget.py
index 8bc9e93..c07c3c8 100644
--- a/bitbake/lib/bb/fetch2/wget.py
+++ b/bitbake/lib/bb/fetch2/wget.py
@@ -31,6 +31,7 @@ import subprocess
 import os
 import logging
 import bb
+import bb.build
 import urllib
 from   bb import data
 from   bb.fetch2 import FetchMethod
@@ -41,6 +42,27 @@ from   bb.utils import export_proxies
 from   bs4 import BeautifulSoup
 from   bs4 import SoupStrainer
 
+class WgetProgressHandler(bb.build.LineFilterProgressHandler):
+    """
+    Extract progress information from wget output.
+    Note: relies on --progress=dot --show-progress being specified on the
+    wget command line.
+    """
+    def __init__(self, d):
+        super(WgetProgressHandler, self).__init__(d)
+        # Send an initial progress event so the bar gets shown
+        bb.event.fire(bb.build.TaskProgress(0, 0), self._data)
+
+    def writeline(self, line):
+        percs = re.findall(r'(\d+)%\s+([\d.]+[A-Z])', line)
+        if percs:
+            progress = int(percs[-1][0])
+            rate = percs[-1][1] + '/s'
+            self.update(progress, rate)
+            return False
+        return True
+
+
 class Wget(FetchMethod):
     """Class to fetch urls via 'wget'"""
     def supports(self, ud, d):
@@ -70,9 +92,11 @@ class Wget(FetchMethod):
 
     def _runwget(self, ud, d, command, quiet):
 
+        progresshandler = WgetProgressHandler(d)
+
         logger.debug(2, "Fetching %s using command '%s'" % (ud.url, command))
         bb.fetch2.check_network_access(d, command)
-        runfetchcmd(command, d, quiet)
+        runfetchcmd(command + ' --progress=dot --show-progress', d, quiet, log=progresshandler)
 
     def download(self, ud, d):
         """Fetch urls"""
-- 
2.5.5


