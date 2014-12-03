Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 234C365C9F
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Dec 2014 08:07:46 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id sB387hO4004555
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL);
	Wed, 3 Dec 2014 00:07:43 -0800 (PST)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Wed, 3 Dec 2014 00:07:43 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <ross.burton@intel.com>
Date: Wed, 3 Dec 2014 16:07:36 +0800
Message-ID: <e244ff1b47f222735225397cd99326b4c685f5ea.1417593851.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1417593851.git.hongxu.jia@windriver.com>
References: <cover.1417593851.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] Revert "fixup"
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
X-List-Received-Date: Wed, 03 Dec 2014 08:07:48 -0000
Content-Type: text/plain

This reverts commit 28e3f8ca6ff681f7a88c44b5c62390fa16be816b.

Revert "busybox : fix do_compile failed on qemumips when DEBUG_BUILD (ICE)"
Since the gcc has resolved this, so we revert the workaround patch.
---
 .../fix-ice-on-mips-while-compiling-with-g-O.patch | 65 ----------------------
 1 file changed, 65 deletions(-)
 delete mode 100644 meta/recipes-core/busybox/busybox/fix-ice-on-mips-while-compiling-with-g-O.patch

diff --git a/meta/recipes-core/busybox/busybox/fix-ice-on-mips-while-compiling-with-g-O.patch b/meta/recipes-core/busybox/busybox/fix-ice-on-mips-while-compiling-with-g-O.patch
deleted file mode 100644
index d8bf5da..0000000
--- a/meta/recipes-core/busybox/busybox/fix-ice-on-mips-while-compiling-with-g-O.patch
+++ /dev/null
@@ -1,65 +0,0 @@
-shell/ash.c: fix ice on mips while compiling with -g -O
-
-Build busybox on mips with -g -O, there is a ice failure:
-...
-shell/ash.c:8758:1: internal compiler error: in dwarf2out_var_location, at dwarf2out.c:21264
-...
-Please submit a full bug report,
-with preprocessed source if appropriate.
-See <http://gcc.gnu.org/bugs.html> for instructions.
-{standard input}: Assembler messages:
-{standard input}: Warning: missing .end at end of assembly
-{standard input}: Error: open CFI at the end of file; missing .cfi_endproc directive
-...
-
-The following line caused the ice failure on mips:
-...
-void evaltreenr(union node *, int) __attribute__ ((alias("evaltree"),__noreturn__));
-...
-So remove evaltreenr which was a alias of evaltree, and use evaltree
-to instead.
-
-Upstream-Status: Pending
-
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
----
- shell/ash.c | 9 ++-------
- 1 file changed, 2 insertions(+), 7 deletions(-)
-
-diff --git a/shell/ash.c b/shell/ash.c
-index 71ef9a6..4462e40 100644
---- a/shell/ash.c
-+++ b/shell/ash.c
-@@ -8490,11 +8490,6 @@ evaltree(union node *n, int flags)
- 	TRACE(("leaving evaltree (no interrupts)\n"));
- }
- 
--#if !defined(__alpha__) || (defined(__GNUC__) && __GNUC__ >= 3)
--static
--#endif
--void evaltreenr(union node *, int) __attribute__ ((alias("evaltree"),__noreturn__));
--
- static void
- evalloop(union node *n, int flags)
- {
-@@ -8621,7 +8616,7 @@ evalsubshell(union node *n, int flags)
- 			flags &= ~EV_TESTED;
-  nofork:
- 		redirect(n->nredir.redirect, 0);
--		evaltreenr(n->nredir.n, flags);
-+		evaltree(n->nredir.n, flags);
- 		/* never returns */
- 	}
- 	status = 0;
-@@ -8740,7 +8735,7 @@ evalpipe(union node *n, int flags)
- 				dup2(pip[1], 1);
- 				close(pip[1]);
- 			}
--			evaltreenr(lp->n, flags);
-+			evaltree(lp->n, flags);
- 			/* never returns */
- 		}
- 		if (prevfd >= 0)
--- 
-1.9.1
-
-- 
1.9.1


