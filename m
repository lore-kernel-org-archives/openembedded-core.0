Return-Path: <douglas.royds@taitradio.com>
Received: from smtp0.taitradio.net (unknown [202.37.96.22])
	by mail.openembedded.org (Postfix) with SMTP id 3144D7997A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Sep 2018 02:58:37 +0000 (UTC)
Received: from acheron.taitradio.net (unknown [172.16.169.141])
	by smtp0.taitradio.net (Postfix) with ESMTP id 82D40220372;
	Fri, 14 Sep 2018 14:58:37 +1200 (NZST)
From: Douglas Royds <douglas.royds@taitradio.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 14 Sep 2018 14:58:15 +1200
Message-Id: <20180914025817.7315-5-douglas.royds@taitradio.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180914025817.7315-1-douglas.royds@taitradio.com>
References: <20180912012707.30046-1-douglas.royds@taitradio.com>
	<20180914025817.7315-1-douglas.royds@taitradio.com>
Subject: [PATCH v2 4/6] Reproducible: Find the git repo in WORKDIR/git or S first
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
X-List-Received-Date: Fri, 14 Sep 2018 02:58:38 -0000

Change the search regime for find_git_folder():

1. WORKDIR/git: This is the default git fetcher unpack path
2. ${S}
3. Go looking for .git/ under the WORKDIR as a last resort.

linux-yocto:
We had an existing (silent) defect. The linux-yocto recipes all specify
two git SRC_URIs, one for the kernel source itself, the other for the
kmeta data (config fragments and friends). find_git_folder() was finding
the git checkout for the kmeta data, but due to a typo in the git log -1
--pretty=%ct line, we were (silently) reading the source_date_epoch from
the ${S} directory = STAGING_KERNEL_DIR, which is empty. If your
build/ happened to be inside a git checkout, git would walk up the
directory tree, and silently read the commit timestamp from this other
git checkout. The correct path to read the git commit timestamp from is
the "gitpath", being that found by find_git_folder(), though this
function was incorrectly finding the kmeta data checkout, not the kernel
source tree.

Non-kernel git recipes:
The default git fetcher clones and checks out the sources at
WORKDIR/git/ regardless of the setting of S (unless subpath or
destsuffix is set). find_git_folder() now looks for the
WORKDIR/git/.git/ directory first.

Non-yocto linux kernels:
Kernel recipes that don't inherit kernel-yocto should always set
S = ${WORKDIR}/git, so that when base_do_unpack_append() in
kernel.bbclass moves the checkout down to the STAGING_KERNEL_DIR and
symlinks it as WORKDIR/git, the build can still work by following the
symlink. We were previously failing to follow the symlink in the
os.walk(), but we now look first for WORKDIR/git/.git/, and find it due
to the symlink.

If none of the above mechanisms work for finding the git checkout,
perhaps there was a subpath or destsuffix specified in the SRC_URI.
We go looking for the git checkout under the WORKDIR as a last resort.

Signed-off-by: Douglas Royds <douglas.royds@taitradio.com>
---
 meta/classes/reproducible_build.bbclass | 35 ++++++++++++++++---------
 1 file changed, 23 insertions(+), 12 deletions(-)

diff --git a/meta/classes/reproducible_build.bbclass b/meta/classes/reproducible_build.bbclass
index 3f3790dfe3..42cb37b042 100644
--- a/meta/classes/reproducible_build.bbclass
+++ b/meta/classes/reproducible_build.bbclass
@@ -61,28 +61,39 @@ def get_source_date_epoch_from_known_files(d, sourcedir):
                 source_date_epoch = mtime
     return source_date_epoch
 
-def find_git_folder(workdir):
-    exclude = set(["temp", "license-destdir", "patches", "recipe-sysroot-native", "recipe-sysroot", "pseudo", "build", "image", "sysroot-destdir"])
+def find_git_folder(d, sourcedir):
+    # First guess: WORKDIR/git
+    # This is the default git fetcher unpack path
+    workdir = d.getVar('WORKDIR')
+    gitpath = os.path.join(workdir, "git/.git")
+    if os.path.isdir(gitpath):
+        return gitpath
+
+    # Second guess: ${S}
+    gitpath = os.path.join(sourcedir, ".git")
+    if os.path.isdir(gitpath):
+        return gitpath
+
+    # Perhaps there was a subpath or destsuffix specified.
+    # Go looking in the WORKDIR
+    exclude = set(["build", "image", "license-destdir", "patches", "pseudo",
+                   "recipe-sysroot", "recipe-sysroot-native", "sysroot-destdir", "temp"])
     for root, dirs, files in os.walk(workdir, topdown=True):
         dirs[:] = [d for d in dirs if d not in exclude]
         if '.git' in dirs:
             return root
 
+    bb.warn("Failed to find a git repository in WORKDIR: %s" % workdir)
+    return None
+
 def get_source_date_epoch_from_git(d, sourcedir):
     source_date_epoch = None
     if "git://" in d.getVar('SRC_URI'):
-        workdir = d.getVar('WORKDIR')
-        gitpath = find_git_folder(workdir)
+        gitpath = find_git_folder(d, sourcedir)
         if gitpath:
             import subprocess
-            if os.path.isdir(os.path.join(gitpath,".git")):
-                try:
-                    source_date_epoch = int(subprocess.check_output(['git','log','-1','--pretty=%ct'], cwd=sourcedir))
-                    bb.debug(1, "git repo path:%s sde: %d" % (gitpath,source_date_epoch))
-                except subprocess.CalledProcessError as grepexc:
-                    bb.debug(1, "Expected git repository not found, (path: %s) error:%d" % (gitpath, grepexc.returncode))
-        else:
-            bb.warn("Failed to find a git repository for path:%s" % workdir)
+            source_date_epoch = int(subprocess.check_output(['git','log','-1','--pretty=%ct'], cwd=gitpath))
+            bb.debug(1, "git repo path: %s sde: %d" % (gitpath, source_date_epoch))
     return source_date_epoch
 
 def get_source_date_epoch_from_youngest_file(d, sourcedir):
-- 
2.17.1


