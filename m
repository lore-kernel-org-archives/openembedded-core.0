Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id EB1D3786DD
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Dec 2017 01:37:39 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	04 Dec 2017 17:37:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.45,362,1508828400"; d="scan'208";a="184038137"
Received: from gsteoh-mobl3.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.249.76.232])
	by fmsmga006.fm.intel.com with ESMTP; 04 Dec 2017 17:37:38 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 Dec 2017 14:36:58 +1300
Message-Id: <ea98050caef43c9b771ba3e243fbecb55dc130e3.1512437788.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.9.5
In-Reply-To: <cover.1512437788.git.paul.eggleton@linux.intel.com>
References: <cover.1512437788.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 2/2] classes/patch: when PATCHTOOL = "git" double-check the repository
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
X-List-Received-Date: Tue, 05 Dec 2017 01:37:40 -0000

If a bug is present or the user has set PATCHTOOL = "git" on a source
tree that isn't git, if we try to perform git operations (such as
committing or changing branches) when extracting source, then we might
in fact be running those operations on the metadata repository if the
build directory is underneath, say, poky or OE-Core, and that could
make a mess. Check if the source tree is a git repository and refuse
to continue if it isn't.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/patch.bbclass | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/meta/classes/patch.bbclass b/meta/classes/patch.bbclass
index 930ee33..2fc6925 100644
--- a/meta/classes/patch.bbclass
+++ b/meta/classes/patch.bbclass
@@ -28,6 +28,21 @@ python patch_task_patch_prefunc() {
     # Prefunc for do_patch
     srcsubdir = d.getVar('S')
 
+    workdir = os.path.abspath(d.getVar('WORKDIR'))
+    testsrcdir = os.path.abspath(srcsubdir)
+    if (testsrcdir + os.sep).startswith(workdir + os.sep):
+        # Double-check that either workdir or S or some directory in-between is a git repository
+        found = False
+        while testsrcdir != '/':
+            if os.path.exists(os.path.join(testsrcdir, '.git')):
+                found = True
+                break
+            if testsrcdir == workdir:
+                break
+            testsrcdir = os.path.dirname(testsrcdir)
+        if not found:
+            bb.fatal('PATCHTOOL = "git" set for source tree that is not a git repository. Refusing to continue as that may result in commits being made in your metadata repository.')
+
     patchdir = os.path.join(srcsubdir, 'patches')
     if os.path.exists(patchdir):
         if os.listdir(patchdir):
-- 
2.9.5


