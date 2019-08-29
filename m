Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4E5527F39B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Aug 2019 20:43:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id ABA3F1851F;
	Thu, 29 Aug 2019 22:43:22 +0200 (CEST)
X-Axis-User: NO
X-Axis-NonUser: YES
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id pACsQYTbGZhF; Thu, 29 Aug 2019 22:43:21 +0200 (CEST)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bastet.se.axis.com (Postfix) with ESMTPS id A0A0D183A1;
	Thu, 29 Aug 2019 22:43:21 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8B9C01A07E;
	Thu, 29 Aug 2019 22:43:21 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 80A121A07D;
	Thu, 29 Aug 2019 22:43:21 +0200 (CEST)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder02.se.axis.com (Postfix) with ESMTP;
	Thu, 29 Aug 2019 22:43:21 +0200 (CEST)
Received: from saur.se.axis.com (saur.se.axis.com [10.92.3.10])
	by thoth.se.axis.com (Postfix) with ESMTP id 74A352A9;
	Thu, 29 Aug 2019 22:43:21 +0200 (CEST)
Received: from saur.se.axis.com (localhost [127.0.0.1])
	by saur.se.axis.com (8.15.2/8.15.2) with ESMTPS id x7TKhLnA028433
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 29 Aug 2019 22:43:21 +0200
Received: (from pkj@localhost)
	by saur.se.axis.com (8.15.2/8.15.2/Submit) id x7TKhLPi028432;
	Thu, 29 Aug 2019 22:43:21 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Date: Thu, 29 Aug 2019 22:43:02 +0200
Message-Id: <20190829204302.28348-1-pkj@axis.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH] devtool: Avoid failure for recipes with S == WORKDIR and no local files
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
X-List-Received-Date: Thu, 29 Aug 2019 20:43:22 -0000
Content-Transfer-Encoding: 8bit

When extracting the sources for a recipe that has S == WORKDIR and no
local files in the SRC_URI (which, e.g., can happen for a recipe with
a URI that has the unpack=false attribute), the extraction fails with
the following backtrace:

  Traceback (most recent call last):
    File ".../scripts/devtool", line 344, in <module>
      ret = main()
    File ".../scripts/devtool", line 331, in main
      ret = args.func(args, config, basepath, workspace)
    File ".../poky/scripts/lib/devtool/standard.py", line 762, in
    modify
      initial_rev, _ = _extract_source(srctree, args.keep_temp,
      args.branch, False, config, basepath, workspace,
      args.fixed_setup, rd, tinfoil, no_overrides=args.no_overrides)
    File ".../poky/scripts/lib/devtool/standard.py", line 647, in
    _extract_source
      bb.process.run('git %s commit -a -m "Committing local file
      symlinks\n\n%s"' % (' '.join(useroptions),
      oe.patch.GitApplyTree.ignore_commit_prefix), cwd=srctree)
    File ".../poky/bitbake/lib/bb/process.py", line 178, in run
      raise ExecutionError(cmd, pipe.returncode, stdout, stderr)
  bb.process.ExecutionError: Execution of 'git commit -a -m
  "Committing local file symlinks

  %% ignore"' failed with exit code 1:
  On branch devtool
  nothing to commit, working tree clean

This is because no files were found in the oe-local-files directory
and consequently no symbolic links were added using `git add`, but the
`git commit` command was still executed.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 scripts/lib/devtool/standard.py | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index 96af488798..9eeaefb79c 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -482,9 +482,9 @@ def symlink_oelocal_files_srctree(rd,srctree):
                 addfiles.append(os.path.join(relpth, fn))
         if addfiles:
             bb.process.run('git add %s' % ' '.join(addfiles), cwd=srctree)
-        useroptions = []
-        oe.patch.GitApplyTree.gitCommandUserOptions(useroptions, d=rd)
-        bb.process.run('git %s commit -a -m "Committing local file symlinks\n\n%s"' % (' '.join(useroptions), oe.patch.GitApplyTree.ignore_commit_prefix), cwd=srctree)
+            useroptions = []
+            oe.patch.GitApplyTree.gitCommandUserOptions(useroptions, d=rd)
+            bb.process.run('git %s commit -m "Committing local file symlinks\n\n%s"' % (' '.join(useroptions), oe.patch.GitApplyTree.ignore_commit_prefix), cwd=srctree)
 
 
 def _extract_source(srctree, keep_temp, devbranch, sync, config, basepath, workspace, fixed_setup, d, tinfoil, no_overrides=False):
-- 
2.21.0


