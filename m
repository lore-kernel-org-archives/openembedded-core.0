Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 0BF157630F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Jul 2015 13:05:12 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga103.jf.intel.com with ESMTP; 27 Jul 2015 06:05:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,554,1432623600"; d="scan'208";a="530926367"
Received: from rmoore5-mobl1.amr.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.8.162])
	by FMSMGA003.fm.intel.com with ESMTP; 27 Jul 2015 06:05:10 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 27 Jul 2015 14:03:59 +0100
Message-Id: <3ecc9823b78e272cbba51f94ccee7e97d40e1eb9.1438001581.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1438001581.git.paul.eggleton@linux.intel.com>
References: <cover.1438001581.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1438001581.git.paul.eggleton@linux.intel.com>
References: <cover.1438001581.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 04/11] oeqa/utils/qemurunner: avoid blocking on stty when running under oe-selftest
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
X-List-Received-Date: Mon, 27 Jul 2015 13:05:13 -0000

runqemu-internal runs stty to return the terminal to its previous state
in case QEMU hasn't done that properly (which it at least used to do
when it crashed). For some reason I have yet to determine, stty blocks
(on tcsetattr() according to gdb) when run within QemuRunner() under
oe-selftest, with the result that we always wait until the timeout and
then we kill the script, which adds an extra delay after QEMU is
stopped. Naturally you would assume that this is something to do with
the nature of the terminal under which it is being run; however no
amount of playing around with stdin/stdout/stderr seemed to fix the
issue, apart from passing in subprocess.PIPE as stdin which makes stty
error out with "stty: standard input: Inappropriate ioctl for device". I
was also unable to come up with a reliable test for the terminal which
we could use inside runqemu-internal to avoid calling stty. For now, go
with the stdin=subprocess.PIPE workaround to at least avoid the delay
with minimal ill effect.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/lib/oeqa/utils/qemurunner.py | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemurunner.py
index 4de3c64..11186d6 100644
--- a/meta/lib/oeqa/utils/qemurunner.py
+++ b/meta/lib/oeqa/utils/qemurunner.py
@@ -94,7 +94,11 @@ class QemuRunner:
             self.qemuparams = self.qemuparams[:-1] + " " + qemuparams + " " + '\"'
 
         launch_cmd = 'runqemu %s %s %s' % (self.machine, self.rootfs, self.qemuparams)
-        self.runqemu = subprocess.Popen(launch_cmd,shell=True,stdout=subprocess.PIPE,stderr=subprocess.STDOUT,preexec_fn=os.setpgrp)
+        # FIXME: We pass in stdin=subprocess.PIPE here to work around stty
+        # blocking at the end of the runqemu script when using this within
+        # oe-selftest (this makes stty error out immediately). There ought
+        # to be a proper fix but this will suffice for now.
+        self.runqemu = subprocess.Popen(launch_cmd, shell=True, stdout=subprocess.PIPE, stderr=subprocess.STDOUT, stdin=subprocess.PIPE, preexec_fn=os.setpgrp)
 
         logger.info("runqemu started, pid is %s" % self.runqemu.pid)
         logger.info("waiting at most %s seconds for qemu pid" % self.runqemutime)
-- 
2.1.0


