Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 141C370100
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Nov 2016 20:05:54 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga104.jf.intel.com with ESMTP; 15 Nov 2016 12:05:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,496,1473145200"; d="scan'208";a="31635475"
Received: from nnasirin-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com.fritz.box) ([10.255.185.211])
	by orsmga005.jf.intel.com with ESMTP; 15 Nov 2016 12:05:53 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 16 Nov 2016 09:05:45 +1300
Message-Id: <c043f6db9e72bcd0f2301e65dab54fbbec7b6378.1479240326.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <cover.1479240326.git.paul.eggleton@linux.intel.com>
References: <cover.1479240326.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1479240326.git.paul.eggleton@linux.intel.com>
References: <cover.1479240326.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/1] devtool: modify: support recipes with only local files as source
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
X-List-Received-Date: Tue, 15 Nov 2016 20:05:54 -0000

The hello-mod recipe is unusual in that it has only local files in
SRC_URI and builds these out of ${WORKDIR}. When you use devtool modify
on it, devtool puts all of those files in an "oe-local-files"
subdirectory of the source tree, which is not ${S} (or ${B}) any more
and thus building the recipe afterwards fails. It's a bit of a hack, but
symlink the files in oe-local-files into the source tree (and commit the
symlinks with an ignored commit so that the repo is clean) to work
around the problem. We only do this at time of extraction, so any files
added to or removed from oe-local-files after that won't be handled, but
I think there's a limit to how far we should go to support these kinds
of recipes - ultimately they are anomalies.

I initially tried a hacky workaround where I set effectively set B =
"${WORKDIR}" and that allowed it to build, but other things such as the
LIC_FILES_CHKSUM checks still broke because they expected to find files
in ${S}. Another hack where I set the sourcetree to point to the
oe-local-files subdirectory works for hello-mod but not for makedevs
since whilst that is similar, unlike hello-mod it does in fact have
files in the source tree (since it has a patch that adds COPYING) and
thus the same issue occurred.

Also tweak one of the tests that tries devtool modify / update-recipe on
the makedevs recipe to try building it since that would have caught this
issue.

Fixes [YOCTO #10616].

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/lib/oeqa/selftest/devtool.py |  2 ++
 scripts/lib/devtool/standard.py   | 23 +++++++++++++++++++++++
 2 files changed, 25 insertions(+)

diff --git a/meta/lib/oeqa/selftest/devtool.py b/meta/lib/oeqa/selftest/devtool.py
index 46f5a0b..b5f850f 100644
--- a/meta/lib/oeqa/selftest/devtool.py
+++ b/meta/lib/oeqa/selftest/devtool.py
@@ -874,6 +874,8 @@ class DevtoolTests(DevtoolBase):
         result = runCmd('devtool modify %s -x %s' % (testrecipe, tempdir))
         # Check git repo
         self._check_src_repo(tempdir)
+        # Try building just to ensure we haven't broken that
+        bitbake("%s" % testrecipe)
         # Edit / commit local source
         runCmd('echo "/* Foobar */" >> oe-local-files/makedevs.c', cwd=tempdir)
         runCmd('echo "Foo" > oe-local-files/new-local', cwd=tempdir)
diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index 4523048..891f308 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -673,6 +673,29 @@ def _extract_source(srctree, keep_temp, devbranch, sync, d):
 
             shutil.move(srcsubdir, srctree)
 
+            if os.path.abspath(d.getVar('S', True)) == os.path.abspath(d.getVar('WORKDIR', True)):
+                # If recipe extracts to ${WORKDIR}, symlink the files into the srctree
+                # (otherwise the recipe won't build as expected)
+                local_files_dir = os.path.join(srctree, 'oe-local-files')
+                addfiles = []
+                for root, _, files in os.walk(local_files_dir):
+                    relpth = os.path.relpath(root, local_files_dir)
+                    if relpth != '.':
+                        bb.utils.mkdirhier(os.path.join(srctree, relpth))
+                    for fn in files:
+                        if fn == '.gitignore':
+                            continue
+                        destpth = os.path.join(srctree, relpth, fn)
+                        if os.path.exists(destpth):
+                            os.unlink(destpth)
+                        os.symlink('oe-local-files/%s' % fn, destpth)
+                        addfiles.append(os.path.join(relpth, fn))
+                if addfiles:
+                    bb.process.run('git add %s' % ' '.join(addfiles), cwd=srctree)
+                useroptions = []
+                oe.patch.GitApplyTree.gitCommandUserOptions(useroptions, d=d)
+                bb.process.run('git %s commit -a -m "Committing local file symlinks\n\n%s"' % (' '.join(useroptions), oe.patch.GitApplyTree.ignore_commit_prefix), cwd=srctree)
+
         if kconfig:
             logger.info('Copying kernel config to srctree')
             shutil.copy2(kconfig, srctree)
-- 
2.5.5


