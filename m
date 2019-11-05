Return-Path: <peter.kjellerstedt@axis.com>
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
	by mail.openembedded.org (Postfix) with ESMTP id BEB117F96F
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Nov 2019 22:08:49 +0000 (UTC)
IronPort-SDR: fx246lrbZ1qG/cTbA1zBDoCli9xT88UH/w9arbWCN7k9FSrgD7aVuFB41vjnP9qTdHu4MSt5KX
	Cflg73NESZ4tU3QFIIrDJJ2zrm9NEcVWPiGQyfy1HLuOUcq9e9CDXcpxa8Ku/ZegRLiFVXUF8/
	NRVfLH4rEU935kKiUMe9f+5olbhze6ztt11Kd7HLwXZkZ9rCe+JPLVZhLjZ3cNHu7ywyJQKKFA
	RmeSyl8i7txQOU0/y0TlFBWznWUUjUcLHBpPBsY6JUB6FL3diOPSRWuZLD58j0WnxLWEzxpT/f
	Isk=
X-IronPort-AV: E=Sophos;i="5.68,271,1569276000"; 
   d="scan'208";a="2115962"
X-Axis-User: NO
X-Axis-NonUser: YES
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 Nov 2019 23:08:34 +0100
Message-Id: <db72b344e5ead3a0504df459e6037176a458029a.1572991610.git.pkj@axis.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <cover.1572991610.git.pkj@axis.com>
References: <cover.1572991610.git.pkj@axis.com>
MIME-Version: 1.0
Subject: [warrior][PATCHv2 4/9] devtool: Avoid failure for recipes with S == WORKDIR and no local files
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
X-List-Received-Date: Tue, 05 Nov 2019 22:08:50 -0000
Content-Transfer-Encoding: 8bit

From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>

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
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 scripts/lib/devtool/standard.py | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index aca74b1fc6..dcb6bf9540 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -637,9 +637,9 @@ def _extract_source(srctree, keep_temp, devbranch, sync, config, basepath, works
                         addfiles.append(os.path.join(relpth, fn))
                 if addfiles:
                     bb.process.run('git add %s' % ' '.join(addfiles), cwd=srctree)
-                useroptions = []
-                oe.patch.GitApplyTree.gitCommandUserOptions(useroptions, d=d)
-                bb.process.run('git %s commit -a -m "Committing local file symlinks\n\n%s"' % (' '.join(useroptions), oe.patch.GitApplyTree.ignore_commit_prefix), cwd=srctree)
+                    useroptions = []
+                    oe.patch.GitApplyTree.gitCommandUserOptions(useroptions, d=d)
+                    bb.process.run('git %s commit -m "Committing local file symlinks\n\n%s"' % (' '.join(useroptions), oe.patch.GitApplyTree.ignore_commit_prefix), cwd=srctree)
 
         if is_kernel_yocto:
             logger.info('Copying kernel config to srctree')
-- 
2.21.0


