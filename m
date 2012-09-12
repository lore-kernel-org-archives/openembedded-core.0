Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <constantinx.musca@intel.com>) id 1TBmde-00045i-AU
	for openembedded-core@lists.openembedded.org;
	Wed, 12 Sep 2012 15:05:54 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 12 Sep 2012 05:53:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,408,1344236400"; d="scan'208";a="192025860"
Received: from jira-pc (HELO localhost.localdomain) ([10.237.105.66])
	by orsmga001.jf.intel.com with ESMTP; 12 Sep 2012 05:53:14 -0700
From: Constantin Musca <constantinx.musca@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 12 Sep 2012 14:58:18 +0300
Message-Id: <1347451098-16659-1-git-send-email-constantinx.musca@intel.com>
X-Mailer: git-send-email 1.7.9.5
Cc: Constantin Musca <constantinx.musca@intel.com>
Subject: [PATCH] patch.bbclass: Use one TMPDIR per patching process
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
X-List-Received-Date: Wed, 12 Sep 2012 13:05:54 -0000

We must use one TMPDIR per process (/tmp/${PID}) so that the patching
processes don't generate the same temp file name (the "patch" program
uses the TMPDIR environment variable for deciding where to create the
temp files).

[YOCTO #3070]

Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
---
 meta/classes/patch.bbclass |   11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/meta/classes/patch.bbclass b/meta/classes/patch.bbclass
index a724972..d010438 100644
--- a/meta/classes/patch.bbclass
+++ b/meta/classes/patch.bbclass
@@ -139,6 +139,13 @@ python patch_do_patch() {
     path = os.getenv('PATH')
     os.putenv('PATH', d.getVar('PATH', True))
 
+    import shutil
+    process_tmpdir = os.path.join('/tmp', str(os.getpid()))
+    if os.path.exists(process_tmpdir):
+        shutil.rmtree(process_tmpdir)
+    os.makedirs(process_tmpdir)
+    os.environ['TMPDIR'] = process_tmpdir
+
     for patch in src_patches(d):
         _, _, local, _, _, parm = bb.decodeurl(patch)
 
@@ -161,11 +168,15 @@ python patch_do_patch() {
         try:
             patchset.Import({"file":local, "strippath": parm['striplevel']}, True)
         except Exception as exc:
+            shutil.rmtree(process_tmpdir)
             bb.fatal(str(exc))
         try:
             resolver.Resolve()
         except bb.BBHandledException as e:
+            shutil.rmtree(process_tmpdir)
             bb.fatal(str(e))
+
+    shutil.rmtree(process_tmpdir)
 }
 patch_do_patch[vardepsexclude] = "PATCHRESOLVE"
 
-- 
1.7.9.5



