Received: from [192.55.52.88] (helo=mga01.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1T66NM-0001EN-QH
	for openembedded-core@lists.openembedded.org;
	Mon, 27 Aug 2012 22:57:37 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 27 Aug 2012 13:45:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,322,1344236400"; d="scan'208";a="214562843"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.121.136])
	by fmsmga002.fm.intel.com with ESMTP; 27 Aug 2012 13:45:17 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 27 Aug 2012 21:45:14 +0100
Message-Id: <2a46b989f4c6ec2080471086b8e32482cd1e1804.1346099015.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1346099015.git.paul.eggleton@linux.intel.com>
References: <cover.1346099015.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1346099015.git.paul.eggleton@linux.intel.com>
References: <cover.1346099015.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/1] lib/oe/sstatesig.py: add signature data query function
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
X-List-Received-Date: Mon, 27 Aug 2012 20:57:37 -0000

Add a function that can be used from BitBake code which will find
signature data (sigdata/siginfo) files based on specified criteria, and
hook it into BitBake as bb.siggen.find_siginfo.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/lib/oe/sstatesig.py |   81 ++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 81 insertions(+)

diff --git a/meta/lib/oe/sstatesig.py b/meta/lib/oe/sstatesig.py
index 20d94b2..749029b 100644
--- a/meta/lib/oe/sstatesig.py
+++ b/meta/lib/oe/sstatesig.py
@@ -74,3 +74,84 @@ class SignatureGeneratorOEBasicHash(bb.siggen.SignatureGeneratorBasicHash):
 # Insert these classes into siggen's namespace so it can see and select them
 bb.siggen.SignatureGeneratorOEBasic = SignatureGeneratorOEBasic
 bb.siggen.SignatureGeneratorOEBasicHash = SignatureGeneratorOEBasicHash
+
+
+def find_siginfo(pn, taskname, taskhashlist, d):
+    """ Find signature data files for comparison purposes """
+
+    import fnmatch
+
+    if taskhashlist:
+        hashfiles = {}
+
+    if not taskname:
+        # We have to derive pn and taskname
+        key = pn
+        splitit = key.split('.bb.')
+        taskname = splitit[1]
+        pn = os.path.basename(splitit[0]).split('_')[0]
+        if key.startswith('virtual:native:'):
+            pn = pn + '-native'
+
+    # First search in stamps dir
+    stampdir = d.getVar('TMPDIR', True) + '/stamps'
+    filespec = '%s-*.%s.sigdata.*' % (pn, taskname)
+    filedates = {}
+    foundall = False
+    for root, dirs, files in os.walk(stampdir):
+        for fn in files:
+            if fnmatch.fnmatch(fn, filespec):
+                fullpath = os.path.join(root, fn)
+                match = False
+                if taskhashlist:
+                    for taskhash in taskhashlist:
+                        if fn.endswith('.%s' % taskhash):
+                            hashfiles[taskhash] = fullpath
+                            if len(hashfiles) == len(taskhashlist):
+                                foundall = True
+                                break
+                else:
+                    filedates[fullpath] = os.stat(fullpath).st_mtime
+        if foundall:
+            break
+
+    if len(filedates) < 2 and not foundall:
+        # That didn't work, look in sstate-cache
+        hashes = taskhashlist or ['*']
+        localdata = bb.data.createCopy(d)
+        for hashval in hashes:
+            localdata.setVar('PACKAGE_ARCH', '*')
+            localdata.setVar('TARGET_VENDOR', '*')
+            localdata.setVar('TARGET_OS', '*')
+            localdata.setVar('PN', pn)
+            localdata.setVar('PV', '*')
+            localdata.setVar('PR', '*')
+            localdata.setVar('BB_TASKHASH', hashval)
+            if pn.endswith('-native') or pn.endswith('-crosssdk') or pn.endswith('-cross'):
+                localdata.setVar('SSTATE_EXTRAPATH', "${NATIVELSBSTRING}/")
+            sstatename = d.getVarFlag(taskname, "sstate-name")
+            if not sstatename:
+                sstatename = taskname
+            filespec = '%s_%s.*.siginfo' % (localdata.getVar('SSTATE_PKG', True), sstatename)
+
+            if hashval != '*':
+                sstatedir = "%s/%s" % (d.getVar('SSTATE_DIR', True), hashval[:2])
+            else:
+                sstatedir = d.getVar('SSTATE_DIR', True)
+
+            filedates = {}
+            for root, dirs, files in os.walk(sstatedir):
+                for fn in files:
+                    fullpath = os.path.join(root, fn)
+                    if fnmatch.fnmatch(fullpath, filespec):
+                        if taskhashlist:
+                            hashfiles[hashval] = fullpath
+                        else:
+                            filedates[fullpath] = os.stat(fullpath).st_mtime
+
+    if taskhashlist:
+        return hashfiles
+    else:
+        return filedates
+
+bb.siggen.find_siginfo = find_siginfo
-- 
1.7.9.5



