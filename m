Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id B38E8601D4
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Jul 2016 21:58:56 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga102.fm.intel.com with ESMTP; 04 Jul 2016 14:58:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,576,1459839600"; d="scan'208";a="840599275"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga003.jf.intel.com with ESMTP; 04 Jul 2016 14:58:57 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.68])
	by linux.intel.com (Postfix) with ESMTP id C64906A4080
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Jul 2016 14:58:51 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 Jul 2016 00:48:10 +0300
Message-Id: <93dad913ea82a654731441eb3f818fc71121b8b4.1467668390.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1467668390.git.ed.bartosh@linux.intel.com>
References: <cover.1467668390.git.ed.bartosh@linux.intel.com>
In-Reply-To: <cover.1467668390.git.ed.bartosh@linux.intel.com>
References: <cover.1467668390.git.ed.bartosh@linux.intel.com>
Subject: [PATCH 2/4] bitbake-worker: don't reassign sys.stdout
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
X-List-Received-Date: Mon, 04 Jul 2016 21:58:56 -0000

Worker needs input stream in binary mode as it reads binary content
from it. Current code does it by detaching a buffer from sys.stdin
and assigning it back to sys.stdin.

Detached buffer is io.BufferedReader in binary mode. This operation
is implicit as its purpose is not easily understandable from the code.
Replacing it with fdopen(sys.stdin.fileno(), 'rb') should make the
code more understandable.

Assigning the buffer to sys.stdin is not needed as worker doesn't
use sys.stdin. Moreover, it leads to difficult to debug issues down
the stack. For example, devpyshell doesn't work without reopening
sys.stdin in text mode. This is not needed anymore after this fix as
sys.stdin is not changed in worker code and remains in text mode.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 bitbake/bin/bitbake-worker    | 3 +--
 meta/classes/devshell.bbclass | 2 --
 2 files changed, 1 insertion(+), 4 deletions(-)

diff --git a/bitbake/bin/bitbake-worker b/bitbake/bin/bitbake-worker
index 5d062a2..963b4cd 100755
--- a/bitbake/bin/bitbake-worker
+++ b/bitbake/bin/bitbake-worker
@@ -436,8 +436,7 @@ class BitbakeWorker(object):
             self.build_pipes[pipe].read()
 
 try:
-    sys.stdin = sys.stdin.detach()
-    worker = BitbakeWorker(sys.stdin)
+    worker = BitbakeWorker(os.fdopen(sys.stdin.fileno(), 'rb'))
     if not profiling:
         worker.serve()
     else:
diff --git a/meta/classes/devshell.bbclass b/meta/classes/devshell.bbclass
index 041ed15..ce76ffe 100644
--- a/meta/classes/devshell.bbclass
+++ b/meta/classes/devshell.bbclass
@@ -65,8 +65,6 @@ def devpyshell(d):
         os.dup2(m, sys.stdout.fileno())
         os.dup2(m, sys.stderr.fileno())
 
-        sys.stdin = os.fdopen(sys.stdin.fileno(), 'r', 0)
-
         bb.utils.nonblockingfd(sys.stdout)
         bb.utils.nonblockingfd(sys.stderr)
         bb.utils.nonblockingfd(sys.stdin)
-- 
2.1.4


