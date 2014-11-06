Return-Path: <sgw@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 91D7F7201C
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Nov 2014 05:08:55 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 05 Nov 2014 21:08:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.07,324,1413270000"; d="scan'208";a="627443322"
Received: from unknown (HELO swold-linux.amr.corp.intel.com) ([10.255.13.89])
	by fmsmga002.fm.intel.com with ESMTP; 05 Nov 2014 21:08:56 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  5 Nov 2014 21:08:54 -0800
Message-Id: <1415250534-16350-6-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1415250534-16350-1-git-send-email-sgw@linux.intel.com>
References: <1415250534-16350-1-git-send-email-sgw@linux.intel.com>
Subject: [PATCH 5/5] readline: Patch for readline multikey dispatch issue
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
X-List-Received-Date: Thu, 06 Nov 2014 05:08:55 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
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
index 2ae73ea..03132db 100644
--- a/meta/recipes-core/readline/readline_6.3.bb
+++ b/meta/recipes-core/readline/readline_6.3.bb
@@ -1,6 +1,7 @@
 require readline.inc
 
-SRC_URI_append = " file://readline63-003"
+SRC_URI_append = " file://readline63-003 \
+                   file://readline-dispatch-multikey.patch"
 
 SRC_URI[archive.md5sum] = "33c8fb279e981274f485fd91da77e94a"
 SRC_URI[archive.sha256sum] = "56ba6071b9462f980c5a72ab0023893b65ba6debb4eeb475d7a563dc65cafd43"
-- 
1.8.3.1


