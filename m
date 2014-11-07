Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 000E865CDB
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Nov 2014 13:54:02 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga103.fm.intel.com with ESMTP; 07 Nov 2014 05:47:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,862,1389772800"; d="scan'208";a="413010240"
Received: from moyraecc-mobl.ger.corp.intel.com (HELO
	peggleto-mobl5.isw.intel.com) ([10.252.122.2])
	by FMSMGA003.fm.intel.com with ESMTP; 07 Nov 2014 05:45:17 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  7 Nov 2014 13:52:31 +0000
Message-Id: <da3e51127845fa58325392427027381ebc5cbca1.1415368311.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <cover.1415368311.git.paul.eggleton@linux.intel.com>
References: <cover.1415368311.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1415368311.git.paul.eggleton@linux.intel.com>
References: <cover.1415368311.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/1] readline: Patch for readline multikey dispatch issue
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
X-List-Received-Date: Fri, 07 Nov 2014 13:54:03 -0000

From: Saul Wold <sgw@linux.intel.com>

Signed-off-by: Saul Wold <sgw@linux.intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 .../readline-6.3/readline-dispatch-multikey.patch  | 32 ++++++++++++++++++++++
 meta/recipes-core/readline/readline_6.3.bb         |  3 +-
 2 files changed, 34 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-core/readline/readline-6.3/readline-dispatch-multikey.patch

diff --git a/meta/recipes-core/readline/readline-6.3/readline-dispatch-multikey.patch b/meta/recipes-core/readline/readline-6.3/readline-dispatch-multikey.patch
new file mode 100644
index 0000000..54d1ac6
--- /dev/null
+++ b/meta/recipes-core/readline/readline-6.3/readline-dispatch-multikey.patch
@@ -0,0 +1,32 @@
+From 8ef852a5be72c75e17f2510bea52455f809b56ce Mon Sep 17 00:00:00 2001
+From: Chet Ramey <chet.ramey@case.edu>
+Date: Fri, 28 Mar 2014 14:07:42 -0400
+Subject: [PATCH 04/10] Readline-6.3 patch 2
+
+Fixes multi-key issue identified in this thread:
+http://lists.gnu.org/archive/html/bug-readline/2014-03/msg00010.html
+
+Upstream-Status: Backport
+
+Signed-off-by: Saul Wold <sgw@linux.intel.com>
+---
+ readline.c | 3 ++-
+ 1 files changed, 2 insertions(+), 1 deletions(-)
+
+diff --git a/readline.c b/readline.c
+index eb4eae3..abb29a0 100644
+--- a/readline.c
++++ b/readline.c
+@@ -744,7 +744,8 @@ _rl_dispatch_callback (cxt)
+     r = _rl_subseq_result (r, cxt->oldmap, cxt->okey, (cxt->flags & KSEQ_SUBSEQ));
+ 
+   RL_CHECK_SIGNALS ();
+-  if (r == 0)			/* success! */
++  /* We only treat values < 0 specially to simulate recursion. */
++  if (r >= 0 || (r == -1 && (cxt->flags & KSEQ_SUBSEQ) == 0))	/* success! or failure! */
+     {
+       _rl_keyseq_chain_dispose ();
+       RL_UNSETSTATE (RL_STATE_MULTIKEY);
+-- 
+1.8.3.1
+
diff --git a/meta/recipes-core/readline/readline_6.3.bb b/meta/recipes-core/readline/readline_6.3.bb
index f02f197..55964a6 100644
--- a/meta/recipes-core/readline/readline_6.3.bb
+++ b/meta/recipes-core/readline/readline_6.3.bb
@@ -1,6 +1,7 @@
 require readline.inc
 
-SRC_URI += "file://readline63-003"
+SRC_URI += "file://readline63-003 \
+            file://readline-dispatch-multikey.patch"
 
 SRC_URI[archive.md5sum] = "33c8fb279e981274f485fd91da77e94a"
 SRC_URI[archive.sha256sum] = "56ba6071b9462f980c5a72ab0023893b65ba6debb4eeb475d7a563dc65cafd43"
-- 
1.9.3


