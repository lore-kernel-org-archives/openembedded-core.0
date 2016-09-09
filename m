Return-Path: <brian.avery@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id F371660116
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Sep 2016 16:37:31 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga101.fm.intel.com with ESMTP; 09 Sep 2016 09:37:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,305,1470726000"; 
   d="scan'208";a="6607337"
Received: from bavery-ws-desk.jf.intel.com ([10.7.201.28])
	by orsmga005.jf.intel.com with ESMTP; 09 Sep 2016 09:37:32 -0700
From: bavery <brian.avery@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  9 Sep 2016 09:38:54 -0700
Message-Id: <aa9e2ec2a13162874be2386318dc7883676655c3.1473438968.git.brian.avery@intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1473438968.git.brian.avery@intel.com>
References: <cover.1473438968.git.brian.avery@intel.com>
Subject: [PATCH 1/1] qemurunner: print out the runqemu command
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
X-List-Received-Date: Fri, 09 Sep 2016 16:37:32 -0000

This logs the launch command that was used for runqemu while running -c
testimage.  This way, if I'd like to easily launch qemu manually in
order to debug a failed test, I know what commmand was run to create
the qemu instance.

Signed-off-by: bavery <brian.avery@intel.com>
---
 meta/lib/oeqa/utils/qemurunner.py | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemurunner.py
index 9783ff8..1f98682 100644
--- a/meta/lib/oeqa/utils/qemurunner.py
+++ b/meta/lib/oeqa/utils/qemurunner.py
@@ -141,6 +141,8 @@ class QemuRunner:
         else:
             logger.info('Not using kvm for runqemu')
         launch_cmd += 'tcpserial=%s %s %s %s' % (self.serverport, self.machine, self.rootfs, self.qemuparams)
+        logger.info('launchcmd=%s'%(launch_cmd))
+
         # FIXME: We pass in stdin=subprocess.PIPE here to work around stty
         # blocking at the end of the runqemu script when using this within
         # oe-selftest (this makes stty error out immediately). There ought
@@ -149,12 +151,12 @@ class QemuRunner:
         output = self.runqemu.stdout
 
         #
-        # We need the preexec_fn above so that all runqemu processes can easily be killed 
+        # We need the preexec_fn above so that all runqemu processes can easily be killed
         # (by killing their process group). This presents a problem if this controlling
-        # process itself is killed however since those processes don't notice the death 
+        # process itself is killed however since those processes don't notice the death
         # of the parent and merrily continue on.
         #
-        # Rather than hack runqemu to deal with this, we add something here instead. 
+        # Rather than hack runqemu to deal with this, we add something here instead.
         # Basically we fork off another process which holds an open pipe to the parent
         # and also is setpgrp. If/when the pipe sees EOF from the parent dieing, it kills
         # the process group. This is like pctrl's PDEATHSIG but for a process group
-- 
1.9.1


