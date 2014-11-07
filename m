Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 0EA057067B
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Nov 2014 13:58:01 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 07 Nov 2014 05:58:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.07,332,1413270000"; d="scan'208";a="628322944"
Received: from moyraecc-mobl.ger.corp.intel.com (HELO
	peggleto-mobl5.isw.intel.com) ([10.252.122.2])
	by fmsmga002.fm.intel.com with ESMTP; 07 Nov 2014 05:57:11 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  7 Nov 2014 13:57:07 +0000
Message-Id: <917b9e1f76ffeb3395b8ee2d4e3ea158bd3299b7.1415368521.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <cover.1415368521.git.paul.eggleton@linux.intel.com>
References: <cover.1415368521.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1415368521.git.paul.eggleton@linux.intel.com>
References: <cover.1415368521.git.paul.eggleton@linux.intel.com>
Subject: [dizzy][PATCH 2/2] readline: Patch for readline multikey dispatch issue
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
X-List-Received-Date: Fri, 07 Nov 2014 13:58:03 -0000

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


