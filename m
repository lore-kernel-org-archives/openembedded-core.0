Return-Path: <petter@technux.se>
Received: from bin-vsp-out-02.atm.binero.net (bin-mail-out-05.binero.net
	[195.74.38.228])
	by mail.openembedded.org (Postfix) with ESMTP id 135066AC3B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Nov 2015 09:56:35 +0000 (UTC)
X-Halon-ID: cc287cb3-9290-11e5-bdaa-005056917f90
Authorized-sender: petter@technux.se
Received: from elxbvzzwp1-cy.lan (unknown [81.229.90.163])
	by bin-vsp-out-02.atm.binero.net (Halon Mail Gateway) with ESMTPSA;
	Tue, 24 Nov 2015 10:50:30 +0100 (CET)
From: =?UTF-8?q?Petter=20Mab=C3=A4cker?= <petter@technux.se>
To: openembedded-core@lists.openembedded.org
Date: Tue, 24 Nov 2015 10:50:17 +0100
Message-Id: <8f4869905b04a2a87970e91d91852d487606c8ff.1448358455.git.petter@technux.se>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <014aa84864010a55eeb75c81327332fc4e5501ce.1448358455.git.petter@technux.se>
References: <014aa84864010a55eeb75c81327332fc4e5501ce.1448358455.git.petter@technux.se>
In-Reply-To: <cover.1448358455.git.petter@technux.se>
References: <cover.1448358455.git.petter@technux.se>
MIME-Version: 1.0
Subject: [PATCH 2/2] readline: apply missing upstream patches
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
X-List-Received-Date: Tue, 24 Nov 2015 09:56:36 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Some readline-6.3 upstream patches was missing. Also ensure that the
upstream patches are applied in the same way as in readline-5.2.

Remove 'readline-dispatch-multikey.patch' and
'readline-cve-2014-2524.patch' since they are already included in
upstream patches 'readline63-002' and 'readline63-003'.

[YOCTO #8451]

Signed-off-by: Petter Mabäcker <petter@technux.se>
---
 .../readline-6.3/readline-cve-2014-2524.patch      | 43 ----------------------
 .../readline-6.3/readline-dispatch-multikey.patch  | 32 ----------------
 meta/recipes-core/readline/readline_6.3.bb         | 31 ++++++++++++++--
 3 files changed, 27 insertions(+), 79 deletions(-)
 delete mode 100644 meta/recipes-core/readline/readline-6.3/readline-cve-2014-2524.patch
 delete mode 100644 meta/recipes-core/readline/readline-6.3/readline-dispatch-multikey.patch

diff --git a/meta/recipes-core/readline/readline-6.3/readline-cve-2014-2524.patch b/meta/recipes-core/readline/readline-6.3/readline-cve-2014-2524.patch
deleted file mode 100644
index 98a9d81..0000000
--- a/meta/recipes-core/readline/readline-6.3/readline-cve-2014-2524.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-readline: Security Advisory - readline - CVE-2014-2524
-
-Upstream-Status: Backport
-
-Signed-off-by: Yue Tao <yue.tao@windriver.com>
-
-			   READLINE PATCH REPORT
-			   =====================
-
-Readline-Release: 6.3
-Patch-ID: readline63-003
-
-Bug-Reported-by:
-Bug-Reference-ID:
-Bug-Reference-URL:
-
-Bug-Description:
-
-There are debugging functions in the readline release that are theoretically
-exploitable as security problems.  They are not public functions, but have
-global linkage.
-
-Patch (apply with `patch -p0'):
-
-*** ../readline-6.3/util.c	2013-09-02 13:36:12.000000000 -0400
---- util.c	2014-03-20 10:25:53.000000000 -0400
-***************
-*** 477,480 ****
---- 479,483 ----
-  }
-  
-+ #if defined (DEBUG)
-  #if defined (USE_VARARGS)
-  static FILE *_rl_tracefp;
-***************
-*** 539,542 ****
---- 542,546 ----
-  }
-  #endif
-+ #endif /* DEBUG */
-  
-  
-
diff --git a/meta/recipes-core/readline/readline-6.3/readline-dispatch-multikey.patch b/meta/recipes-core/readline/readline-6.3/readline-dispatch-multikey.patch
deleted file mode 100644
index 54d1ac6..0000000
--- a/meta/recipes-core/readline/readline-6.3/readline-dispatch-multikey.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 8ef852a5be72c75e17f2510bea52455f809b56ce Mon Sep 17 00:00:00 2001
-From: Chet Ramey <chet.ramey@case.edu>
-Date: Fri, 28 Mar 2014 14:07:42 -0400
-Subject: [PATCH 04/10] Readline-6.3 patch 2
-
-Fixes multi-key issue identified in this thread:
-http://lists.gnu.org/archive/html/bug-readline/2014-03/msg00010.html
-
-Upstream-Status: Backport
-
-Signed-off-by: Saul Wold <sgw@linux.intel.com>
----
- readline.c | 3 ++-
- 1 files changed, 2 insertions(+), 1 deletions(-)
-
-diff --git a/readline.c b/readline.c
-index eb4eae3..abb29a0 100644
---- a/readline.c
-+++ b/readline.c
-@@ -744,7 +744,8 @@ _rl_dispatch_callback (cxt)
-     r = _rl_subseq_result (r, cxt->oldmap, cxt->okey, (cxt->flags & KSEQ_SUBSEQ));
- 
-   RL_CHECK_SIGNALS ();
--  if (r == 0)			/* success! */
-+  /* We only treat values < 0 specially to simulate recursion. */
-+  if (r >= 0 || (r == -1 && (cxt->flags & KSEQ_SUBSEQ) == 0))	/* success! or failure! */
-     {
-       _rl_keyseq_chain_dispose ();
-       RL_UNSETSTATE (RL_STATE_MULTIKEY);
--- 
-1.8.3.1
-
diff --git a/meta/recipes-core/readline/readline_6.3.bb b/meta/recipes-core/readline/readline_6.3.bb
index dbb9f0a..8ec7c4a 100644
--- a/meta/recipes-core/readline/readline_6.3.bb
+++ b/meta/recipes-core/readline/readline_6.3.bb
@@ -1,11 +1,34 @@
 require readline.inc
 
-SRC_URI += "file://configure-fix.patch \
+SRC_URI += "${GNU_MIRROR}/readline/readline-6.3-patches/readline63-001;name=patch1;apply=yes;striplevel=0 \
+            ${GNU_MIRROR}/readline/readline-6.3-patches/readline63-002;name=patch2;apply=yes;striplevel=0 \
+            ${GNU_MIRROR}/readline/readline-6.3-patches/readline63-003;name=patch3;apply=yes;striplevel=0 \
+            ${GNU_MIRROR}/readline/readline-6.3-patches/readline63-004;name=patch4;apply=yes;striplevel=0 \
+            ${GNU_MIRROR}/readline/readline-6.3-patches/readline63-005;name=patch5;apply=yes;striplevel=0 \
+            ${GNU_MIRROR}/readline/readline-6.3-patches/readline63-006;name=patch6;apply=yes;striplevel=0 \
+            ${GNU_MIRROR}/readline/readline-6.3-patches/readline63-007;name=patch7;apply=yes;striplevel=0 \
+            ${GNU_MIRROR}/readline/readline-6.3-patches/readline63-008;name=patch8;apply=yes;striplevel=0 \
+            file://configure-fix.patch \
             file://config-dirent-symbols.patch \
-            file://norpath.patch \
-            file://readline-cve-2014-2524.patch;striplevel=0 \
-            file://readline-dispatch-multikey.patch"
+            file://norpath.patch"
 
 SRC_URI[archive.md5sum] = "33c8fb279e981274f485fd91da77e94a"
 SRC_URI[archive.sha256sum] = "56ba6071b9462f980c5a72ab0023893b65ba6debb4eeb475d7a563dc65cafd43"
 
+SRC_URI[patch1.md5sum]    = "4343f5ea9b0f42447f102fb61576b398"
+SRC_URI[patch1.sha256sum] = "1a79bbb6eaee750e0d6f7f3d059b30a45fc54e8e388a8e05e9c3ae598590146f"
+SRC_URI[patch2.md5sum]    = "700295212f7e2978577feaee584afddb"
+SRC_URI[patch2.sha256sum] = "39e304c7a526888f9e112e733848215736fb7b9d540729b9e31f3347b7a1e0a5"
+SRC_URI[patch3.md5sum]    = "af4963862f5156fbf9111c2c6fa86ed7"
+SRC_URI[patch3.sha256sum] = "ec41bdd8b00fd884e847708513df41d51b1243cecb680189e31b7173d01ca52f"
+SRC_URI[patch4.md5sum]    = "11f9def89803a5052db3ba72394ce14f"
+SRC_URI[patch4.sha256sum] = "4547b906fb2570866c21887807de5dee19838a60a1afb66385b272155e4355cc"
+SRC_URI[patch5.md5sum]    = "93721c31cd225393f80cb3aadb165544"
+SRC_URI[patch5.sha256sum] = "877788f9228d1a9907a4bcfe3d6dd0439c08d728949458b41208d9bf9060274b"
+SRC_URI[patch6.md5sum]    = "71dc6ecce66d1489b96595f55d142a52"
+SRC_URI[patch6.sha256sum] = "5c237ab3c6c97c23cf52b2a118adc265b7fb411b57c93a5f7c221d50fafbe556"
+SRC_URI[patch7.md5sum]    = "062a08ed60679d3c4878710b3d595b65"
+SRC_URI[patch7.sha256sum] = "4d79b5a2adec3c2e8114cbd3d63c1771f7c6cf64035368624903d257014f5bea"
+SRC_URI[patch8.md5sum]    = "ee1c04072154826870848d8b218d7b04"
+SRC_URI[patch8.sha256sum] = "3bc093cf526ceac23eb80256b0ec87fa1735540d659742107b6284d635c43787"
+
-- 
1.9.1


