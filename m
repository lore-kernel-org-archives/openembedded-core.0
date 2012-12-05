Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1TgEzv-0006FC-Mz
	for openembedded-core@lists.openembedded.org;
	Wed, 05 Dec 2012 14:26:47 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 05 Dec 2012 05:11:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,221,1355126400"; d="scan'208";a="252334003"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.122.253])
	by orsmga002.jf.intel.com with ESMTP; 05 Dec 2012 05:12:22 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  5 Dec 2012 13:12:19 +0000
Message-Id: <1354713139-9517-1-git-send-email-paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] meta/lib/oe/sstatesig: fix locating stamp files
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 05 Dec 2012 13:26:47 -0000

Fixes "bitbake-diffsigs -t" for changes to the stamp directory layout,
and this time uses the actual value of STAMP to get the location of
sigdata files in the stamp directory rather than trying to do it
manually, which should be a little more robust.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/lib/oe/sstatesig.py |   42 +++++++++++++++++++++++-------------------
 1 file changed, 23 insertions(+), 19 deletions(-)

diff --git a/meta/lib/oe/sstatesig.py b/meta/lib/oe/sstatesig.py
index 39f9ccf..79a410e 100644
--- a/meta/lib/oe/sstatesig.py
+++ b/meta/lib/oe/sstatesig.py
@@ -80,6 +80,7 @@ def find_siginfo(pn, taskname, taskhashlist, d):
     """ Find signature data files for comparison purposes """
 
     import fnmatch
+    import glob
 
     if taskhashlist:
         hashfiles = {}
@@ -93,27 +94,30 @@ def find_siginfo(pn, taskname, taskhashlist, d):
         if key.startswith('virtual:native:'):
             pn = pn + '-native'
 
-    # First search in stamps dir
-    stampdir = d.getVar('TMPDIR', True) + '/stamps'
-    filespec = '%s-*.%s.sigdata.*' % (pn, taskname)
     filedates = {}
+
+    # First search in stamps dir
+    localdata = d.createCopy()
+    localdata.setVar('MULTIMACH_TARGET_SYS', '*')
+    localdata.setVar('PN', pn)
+    localdata.setVar('PV', '*')
+    localdata.setVar('PR', '*')
+    localdata.setVar('EXTENDPE', '')
+    stamp = localdata.getVar('STAMP', True)
+    filespec = '%s.%s.sigdata.*' % (stamp, taskname)
     foundall = False
-    for root, dirs, files in os.walk(stampdir):
-        for fn in files:
-            if fnmatch.fnmatch(fn, filespec):
-                fullpath = os.path.join(root, fn)
-                match = False
-                if taskhashlist:
-                    for taskhash in taskhashlist:
-                        if fn.endswith('.%s' % taskhash):
-                            hashfiles[taskhash] = fullpath
-                            if len(hashfiles) == len(taskhashlist):
-                                foundall = True
-                                break
-                else:
-                    filedates[fullpath] = os.stat(fullpath).st_mtime
-        if foundall:
-            break
+    import glob
+    for fullpath in glob.glob(filespec):
+	match = False
+	if taskhashlist:
+	    for taskhash in taskhashlist:
+		if fullpath.endswith('.%s' % taskhash):
+		    hashfiles[taskhash] = fullpath
+		    if len(hashfiles) == len(taskhashlist):
+			foundall = True
+			break
+	else:
+	    filedates[fullpath] = os.stat(fullpath).st_mtime
 
     if len(filedates) < 2 and not foundall:
         # That didn't work, look in sstate-cache
-- 
1.7.10.4



