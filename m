Return-Path: <psaavedra@igalia.com>
X-Greylist: delayed 1546 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 06 Jul 2018 10:16:23 UTC
Received: from fanzine.igalia.com (fanzine.igalia.com [91.117.99.155])
	by mail.openembedded.org (Postfix) with ESMTP id ED89160602
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Jul 2018 10:16:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Message-Id:Date:Subject:To:From;
	bh=84W/5UrI5BI+tID9qcXrqPrerCGsonhKDYDhAVGYG7s=; 
	b=dwyWOwNpzXoQ+dIYdnDUnoUj8OeC4D2CELMoUXlmRx4X/aNeGWMCgmxQBH+Aw1RW3B0hF5As0g6/Qld81Zo0cNVSlOm9xr1d4omGeCjmL8epA4UyjXPGC3BhF6OT8M8KNEgVeMTS/YVg17TTdUpgitq90ejarQK575Wh3BTECc3Rs2Gxs04dmllnY35BhSV9yYWDnW+zBU530Lz1t6lopVFSY1s7KBD/vtEgUEAQj8ODgZou1YyN25dJdLaGvsbJMXrBxmYpjDK5PmYYInGdoeC+TLbKAAsG1D5Qr14fjJfh2N9/IwRjQJNDvcNGqe73WnvPlVwL12DcIrFUUdVGtw==;
Received: from buildbox.local.igalia.com ([192.168.10.88])
	by fanzine.igalia.com with esmtp (Exim) id 1fbNNt-000344-TR
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Jul 2018 11:50:38 +0200
From: Pablo Saavedra <psaavedra@igalia.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  6 Jul 2018 11:50:23 +0200
Message-Id: <20180706095023.102107-1-psaavedra@igalia.com>
X-Mailer: git-send-email 2.11.0
Subject: [poky][PATCH] Jail patch_task_patch_prefunc in classes/patch into the workdir
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
X-List-Received-Date: Fri, 06 Jul 2018 10:16:24 -0000

With PATCHTOOL=git patches the changes in the patch_task_postfunc
of the classes/patch. This works OK when the S dir is a Git repo
but doesn't if the source is a tarball.

The while condition in the patch_task_patch_prefunc must be
jailed into the WORKDIR. In the opposite, when you are executing
the recipe out of a Git subtree the function simply fails but when
your recipes are into a Git repo the patch_task_postfunc execute a
commit over your BSP local Git repo adding the changes in an
arbitrary Git repo found in the path from the SOURCE directory to
the '/'. This situation is highly probable in  cases like ~home
directories under the control of a .git repo or Yocto BSP which
manage the meta layers as git submodules.

This patch fix the changes introduced in

  classes/patch: when PATCHTOOL = "git" double-check the repository
  commit: 86ab56b55164393924b5e688b20e8f3f3f8fc578
  Author: Paul Eggleton <paul.eggleton@linux.intel.com>
  Date:   Tue Dec 5 14:36:58 2017 +1300

  classes/patch: when PATCHTOOL = "git" double-check the repository

  If a bug is present or the user has set PATCHTOOL = "git" on a source
  tree that isn't git, if we try to perform git operations (such as
  committing or changing branches) when extracting source, then we might
  in fact be running those operations on the metadata repository if the
  build directory is underneath, say, poky or OE-Core, and that could
  make a mess. Check if the source tree is a git repository and refuse
  to continue if it isn't.
---
 meta/classes/patch.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/patch.bbclass b/meta/classes/patch.bbclass
index 2fc6925e49..3e0a181821 100644
--- a/meta/classes/patch.bbclass
+++ b/meta/classes/patch.bbclass
@@ -33,7 +33,7 @@ python patch_task_patch_prefunc() {
     if (testsrcdir + os.sep).startswith(workdir + os.sep):
         # Double-check that either workdir or S or some directory in-between is a git repository
         found = False
-        while testsrcdir != '/':
+        while testsrcdir != workdir:
             if os.path.exists(os.path.join(testsrcdir, '.git')):
                 found = True
                 break
-- 
2.11.0


