Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <constantinx.musca@intel.com>) id 1TCXZv-0004wf-KM
	for openembedded-core@lists.openembedded.org;
	Fri, 14 Sep 2012 17:13:11 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 14 Sep 2012 08:00:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,423,1344236400"; d="scan'208";a="192794920"
Received: from costin-desktop (HELO localhost.localdomain) ([10.237.105.66])
	by azsmga001.ch.intel.com with ESMTP; 14 Sep 2012 08:00:34 -0700
From: Constantin Musca <constantinx.musca@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 14 Sep 2012 17:05:50 +0300
Message-Id: <1347631550-30380-1-git-send-email-constantinx.musca@intel.com>
X-Mailer: git-send-email 1.7.9.5
Cc: Constantin Musca <constantinx.musca@intel.com>
Subject: [PATCH v3] patch.bbclass: increase security
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
X-List-Received-Date: Fri, 14 Sep 2012 15:13:11 -0000

- Use mkdtemp for generating temp dir names
- Use bb.utils.remove for removing temp dirs
- Add comment for explaining the "patch" workaround

[YOCTO #3070]

Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
---
 meta/classes/patch.bbclass |   16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/meta/classes/patch.bbclass b/meta/classes/patch.bbclass
index d010438..a66a0a7 100644
--- a/meta/classes/patch.bbclass
+++ b/meta/classes/patch.bbclass
@@ -139,11 +139,11 @@ python patch_do_patch() {
     path = os.getenv('PATH')
     os.putenv('PATH', d.getVar('PATH', True))
 
-    import shutil
-    process_tmpdir = os.path.join('/tmp', str(os.getpid()))
-    if os.path.exists(process_tmpdir):
-        shutil.rmtree(process_tmpdir)
-    os.makedirs(process_tmpdir)
+    # We must use one TMPDIR per process so that the "patch" processes 
+    # don't generate the same temp file name.
+
+    import tempfile
+    process_tmpdir = tempfile.mkdtemp()
     os.environ['TMPDIR'] = process_tmpdir
 
     for patch in src_patches(d):
@@ -168,15 +168,15 @@ python patch_do_patch() {
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



