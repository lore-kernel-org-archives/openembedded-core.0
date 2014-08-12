Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 382BE70CE5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Aug 2014 12:10:20 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s7CCAKCh025357
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 12 Aug 2014 05:10:20 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Tue, 12 Aug 2014 05:10:20 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 12 Aug 2014 20:10:16 +0800
Message-ID: <a1db5e5522c0d2f772ad0a48b00f9ea4744451ad.1407845300.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1407845300.git.hongxu.jia@windriver.com>
References: <cover.1407845300.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Cc: saul.wold@intel.com
Subject: [PATCH 1/1] busybox : fix do_compile failed on qemumips when DEBUG_BUILD (ICE)
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
X-List-Received-Date: Tue, 12 Aug 2014 12:10:21 -0000
Content-Type: text/plain

Build busybox on mips with -g -O, there is a ice failure:
...
shell/ash.c:8758:1: internal compiler error: in dwarf2out_var_location, at dwarf2out.c:21264
...
Please submit a full bug report,
with preprocessed source if appropriate.
See <http://gcc.gnu.org/bugs.html> for instructions.
{standard input}: Assembler messages:
{standard input}: Warning: missing .end at end of assembly
{standard input}: Error: open CFI at the end of file; missing .cfi_endproc directive
...

The following line caused the ice failure on mips:
...
void evaltreenr(union node *, int) __attribute__ ((alias("evaltree"),__noreturn__));
...
So remove evaltreenr which was a alias of evaltree, and use evaltree
to instead.

[YOCTO #6625]

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../fix-ice-on-mips-while-compiling-with-g-O.patch | 65 ++++++++++++++++++++++
 meta/recipes-core/busybox/busybox_1.22.1.bb        |  4 ++
 2 files changed, 69 insertions(+)
 create mode 100644 meta/recipes-core/busybox/busybox/fix-ice-on-mips-while-compiling-with-g-O.patch

diff --git a/meta/recipes-core/busybox/busybox/fix-ice-on-mips-while-compiling-with-g-O.patch b/meta/recipes-core/busybox/busybox/fix-ice-on-mips-while-compiling-with-g-O.patch
new file mode 100644
index 0000000..d8bf5da
--- /dev/null
+++ b/meta/recipes-core/busybox/busybox/fix-ice-on-mips-while-compiling-with-g-O.patch
@@ -0,0 +1,65 @@
+shell/ash.c: fix ice on mips while compiling with -g -O
+
+Build busybox on mips with -g -O, there is a ice failure:
+...
+shell/ash.c:8758:1: internal compiler error: in dwarf2out_var_location, at dwarf2out.c:21264
+...
+Please submit a full bug report,
+with preprocessed source if appropriate.
+See <http://gcc.gnu.org/bugs.html> for instructions.
+{standard input}: Assembler messages:
+{standard input}: Warning: missing .end at end of assembly
+{standard input}: Error: open CFI at the end of file; missing .cfi_endproc directive
+...
+
+The following line caused the ice failure on mips:
+...
+void evaltreenr(union node *, int) __attribute__ ((alias("evaltree"),__noreturn__));
+...
+So remove evaltreenr which was a alias of evaltree, and use evaltree
+to instead.
+
+Upstream-Status: Pending
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ shell/ash.c | 9 ++-------
+ 1 file changed, 2 insertions(+), 7 deletions(-)
+
+diff --git a/shell/ash.c b/shell/ash.c
+index 71ef9a6..4462e40 100644
+--- a/shell/ash.c
++++ b/shell/ash.c
+@@ -8490,11 +8490,6 @@ evaltree(union node *n, int flags)
+ 	TRACE(("leaving evaltree (no interrupts)\n"));
+ }
+ 
+-#if !defined(__alpha__) || (defined(__GNUC__) && __GNUC__ >= 3)
+-static
+-#endif
+-void evaltreenr(union node *, int) __attribute__ ((alias("evaltree"),__noreturn__));
+-
+ static void
+ evalloop(union node *n, int flags)
+ {
+@@ -8621,7 +8616,7 @@ evalsubshell(union node *n, int flags)
+ 			flags &= ~EV_TESTED;
+  nofork:
+ 		redirect(n->nredir.redirect, 0);
+-		evaltreenr(n->nredir.n, flags);
++		evaltree(n->nredir.n, flags);
+ 		/* never returns */
+ 	}
+ 	status = 0;
+@@ -8740,7 +8735,7 @@ evalpipe(union node *n, int flags)
+ 				dup2(pip[1], 1);
+ 				close(pip[1]);
+ 			}
+-			evaltreenr(lp->n, flags);
++			evaltree(lp->n, flags);
+ 			/* never returns */
+ 		}
+ 		if (prevfd >= 0)
+-- 
+1.9.1
+
diff --git a/meta/recipes-core/busybox/busybox_1.22.1.bb b/meta/recipes-core/busybox/busybox_1.22.1.bb
index 46641e1..0cd2b3a 100644
--- a/meta/recipes-core/busybox/busybox_1.22.1.bb
+++ b/meta/recipes-core/busybox/busybox_1.22.1.bb
@@ -32,6 +32,10 @@ SRC_URI = "http://www.busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://0001-build-system-Specify-nostldlib-when-linking-to-.o-fi.patch \
 "
 
+SRC_URI_append_mips = " \
+    ${@base_conditional( "DEBUG_BUILD", "1", "file://fix-ice-on-mips-while-compiling-with-g-O.patch", "", d )} \
+"
+
 SRC_URI[tarball.md5sum] = "337d1a15ab1cb1d4ed423168b1eb7d7e"
 SRC_URI[tarball.sha256sum] = "ae0b029d0a9e4dd71a077a790840e496dd838998e4571b87b60fed7462b6678b"
 
-- 
1.9.1


