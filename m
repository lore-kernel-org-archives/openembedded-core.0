Return-Path: <alejandro.hernandez@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 20D0B7017B
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Jan 2017 22:33:29 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga103.jf.intel.com with ESMTP; 03 Jan 2017 14:33:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,457,1477983600"; d="scan'208";a="209315232"
Received: from yctb02.ostc.intel.com (HELO yctb02.otcr.jf.intel.com)
	([10.54.69.56])
	by fmsmga004.fm.intel.com with ESMTP; 03 Jan 2017 14:33:28 -0800
From: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  3 Jan 2017 22:30:39 +0000
Message-Id: <5e3840aa19de9b634469c852a7c1446262ab73ab.1482363237.git.alejandro.hernandez@linux.intel.com>
X-Mailer: git-send-email 2.6.6
In-Reply-To: <cover.1482363237.git.alejandro.hernandez@linux.intel.com>
References: <cover.1482363237.git.alejandro.hernandez@linux.intel.com>
In-Reply-To: <cover.1482363237.git.alejandro.hernandez@linux.intel.com>
References: <cover.1482363237.git.alejandro.hernandez@linux.intel.com>
Subject: [PATCH 3/6] ksize.py: Python 3 fixes
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
X-List-Received-Date: Tue, 03 Jan 2017 22:33:30 -0000

From: Tom Zanussi <tom.zanussi@linux.intel.com>

String errors and partial __cmp__ fix.

Signed-off-by: Tom Zanussi <tom.zanussi@linux.intel.com>
---
 scripts/tiny/ksize.py | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/scripts/tiny/ksize.py b/scripts/tiny/ksize.py
index b9d2b19..ea1ca7f 100755
--- a/scripts/tiny/ksize.py
+++ b/scripts/tiny/ksize.py
@@ -41,7 +41,7 @@ def usage():
 class Sizes:
     def __init__(self, glob):
         self.title = glob
-        p = Popen("size -t " + glob, shell=True, stdout=PIPE, stderr=PIPE)
+        p = Popen("size -t " + str(glob), shell=True, stdout=PIPE, stderr=PIPE)
         output = p.communicate()[0].splitlines()
         if len(output) > 2:
             sizes = output[-1].split()[0:4]
@@ -62,18 +62,18 @@ class Report:
         r = Report(filename, title)
         path = os.path.dirname(filename)
 
-        p = Popen("ls " + path + "/*.o | grep -v built-in.o",
+        p = Popen("ls " + str(path) + "/*.o | grep -v built-in.o",
                   shell=True, stdout=PIPE, stderr=PIPE)
         glob = ' '.join(p.communicate()[0].splitlines())
-        oreport = Report(glob, path + "/*.o")
-        oreport.sizes.title = path + "/*.o"
+        oreport = Report(glob, str(path) + "/*.o")
+        oreport.sizes.title = str(path) + "/*.o"
         r.parts.append(oreport)
 
         if subglob:
             p = Popen("ls " + subglob, shell=True, stdout=PIPE, stderr=PIPE)
             for f in p.communicate()[0].splitlines():
                 path = os.path.dirname(f)
-                r.parts.append(Report.create(f, path, path + "/*/built-in.o"))
+                r.parts.append(Report.create(f, path, str(path) + "/*/built-in.o"))
             r.parts.sort(reverse=True)
 
         for b in r.parts:
@@ -116,6 +116,13 @@ class Report:
                self.deltas["data"], self.deltas["bss"]))
         print("\n")
 
+    def __lt__(this, that):
+        if that is None:
+            return 1
+        if not isinstance(that, Report):
+            raise TypeError
+        return this.sizes.total < that.sizes.total
+
     def __cmp__(this, that):
         if that is None:
             return 1
-- 
2.6.6


