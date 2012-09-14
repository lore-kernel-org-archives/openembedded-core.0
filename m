Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <constantinx.musca@intel.com>) id 1TCWjs-0001ib-69
	for openembedded-core@lists.openembedded.org;
	Fri, 14 Sep 2012 16:19:24 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 14 Sep 2012 07:06:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,423,1344236400"; d="scan'208";a="222171440"
Received: from costin-desktop (HELO localhost.localdomain) ([10.237.105.66])
	by fmsmga001.fm.intel.com with ESMTP; 14 Sep 2012 07:06:46 -0700
From: Constantin Musca <constantinx.musca@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 14 Sep 2012 16:12:01 +0300
Message-Id: <1347628321-25057-1-git-send-email-constantinx.musca@intel.com>
X-Mailer: git-send-email 1.7.9.5
Cc: Constantin Musca <constantinx.musca@intel.com>
Subject: [PATCH] patch.bbclass: increase security
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
X-List-Received-Date: Fri, 14 Sep 2012 14:19:24 -0000

- Use mkdtemp for generating temp dir names
- Use bb.utils.remove for removing temp dirs
- Add comment for explaining the "patch" workaround

Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
---
 meta/classes/patch.bbclass |   16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/meta/classes/patch.bbclass b/meta/classes/patch.bbclass
index d010438..4b535d9 100644
--- a/meta/classes/patch.bbclass
+++ b/meta/classes/patch.bbclass
@@ -139,10 +139,14 @@ python patch_do_patch() {
     path = os.getenv('PATH')
     os.putenv('PATH', d.getVar('PATH', True))
 
-    import shutil
-    process_tmpdir = os.path.join('/tmp', str(os.getpid()))
+    # We must use one TMPDIR per process (/tmp/${PID}${random_chars})
+    # so that the "patch" processes don't generate the same temp
+    # file name.
+
+    import tempfile
+    process_tmpdir = tempfile.mkdtemp(prefix=str(os.getpid()))
     if os.path.exists(process_tmpdir):
-        shutil.rmtree(process_tmpdir)
+        bb.utils.remove(process_tmpdir, True)
     os.makedirs(process_tmpdir)
     os.environ['TMPDIR'] = process_tmpdir
 
@@ -168,15 +172,15 @@ python patch_do_patch() {
         try:
             patchset.Import({"file":local, "strippath": parm['striplevel']}, True)
         except Exception as exc:
-            shutil.rmtree(process_tmpdir)
+            bb.utils.remove(process_tmpdir, True)
             bb.fatal(str(exc))
         try:
             resolver.Resolve()
         except bb.BBHandledException as e:
-            shutil.rmtree(process_tmpdir)
+            bb.utils.remove(process_tmpdir, True)
             bb.fatal(str(e))
 
-    shutil.rmtree(process_tmpdir)
+    bb.utils.remove(process_tmpdir, True)
 }
 patch_do_patch[vardepsexclude] = "PATCHRESOLVE"
 
-- 
1.7.9.5



