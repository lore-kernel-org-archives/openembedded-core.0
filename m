Return-Path: <mariano.lopez@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 12B9365CBB
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Mar 2016 22:09:26 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga101.jf.intel.com with ESMTP; 22 Mar 2016 15:09:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,379,1455004800"; d="scan'208";a="674045755"
Received: from yctb01.ostc.intel.com (HELO yctb01.otcr.intel.com)
	([10.54.69.55])
	by FMSMGA003.fm.intel.com with ESMTP; 22 Mar 2016 15:09:20 -0700
From: mariano.lopez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Tue, 22 Mar 2016 14:04:03 +0000
Message-Id: <2a3f66935e742266c0a074f7f80c4917fd2b3f7e.1458655100.git.mariano.lopez@linux.intel.com>
X-Mailer: git-send-email 2.6.2
In-Reply-To: <cover.1458655100.git.mariano.lopez@linux.intel.com>
References: <cover.1458655100.git.mariano.lopez@linux.intel.com>
In-Reply-To: <cover.1458655100.git.mariano.lopez@linux.intel.com>
References: <cover.1458655100.git.mariano.lopez@linux.intel.com>
Subject: [PATCH 4/4] archiver.bbclass: Fix tar name for git repositories
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
X-List-Received-Date: Tue, 22 Mar 2016 22:09:27 -0000

From: Mariano Lopez <mariano.lopez@linux.intel.com>

When archiving the original source, the git repositories have the name as
they are in the $DL_DIR plus the source revision; i.e.
"git.yoctoproject.org.linux-yocto-4.4.git.89419d8b90_dadb436904.tar.gz".
This change set the tar name to $PF.tar.gz instead, to have consistency with
the others archives created by the class.

Signed-off-by: Mariano Lopez <mariano.lopez@linux.intel.com>
---
 meta/classes/archiver.bbclass | 21 ++++++---------------
 1 file changed, 6 insertions(+), 15 deletions(-)

diff --git a/meta/classes/archiver.bbclass b/meta/classes/archiver.bbclass
index d709f78..7758f3c 100644
--- a/meta/classes/archiver.bbclass
+++ b/meta/classes/archiver.bbclass
@@ -126,21 +126,9 @@ python do_ar_original() {
         if os.path.isfile(local):
             shutil.copy(local, ar_outdir)
         elif os.path.isdir(local):
-            basename = os.path.basename(local)
-
             tmpdir = tempfile.mkdtemp(dir=d.getVar('ARCHIVER_WORKDIR', True))
             fetch.unpack(tmpdir, (url,))
-
-            os.chdir(tmpdir)
-            # We eliminate any AUTOINC+ in the revision.
-            try:
-                src_rev = bb.fetch2.get_srcrev(d).replace('AUTOINC+','')
-            except:
-                src_rev = 'NOREV'
-            tarname = os.path.join(ar_outdir, basename + '.' + src_rev + '.tar.gz')
-            tar = tarfile.open(tarname, 'w:gz')
-            tar.add('.')
-            tar.close()
+            create_tarball(d, tmpdir + '/.', '', ar_outdir)
 
     # Emit patch series files for 'original'
     bb.note('Writing patch series files...')
@@ -222,8 +210,11 @@ def create_tarball(d, srcdir, suffix, ar_outdir):
         return
 
     bb.utils.mkdirhier(ar_outdir)
-    tarname = os.path.join(ar_outdir, '%s-%s.tar.gz' % \
-            (d.getVar('PF', True), suffix))
+    if suffix:
+        filename = '%s-%s.tar.gz' % (d.getVar('PF', True), suffix)
+    else:
+        filename = '%s.tar.gz' % d.getVar('PF', True)
+    tarname = os.path.join(ar_outdir, filename)
 
     srcdir = srcdir.rstrip('/')
     dirname = os.path.dirname(srcdir)
-- 
2.6.2


