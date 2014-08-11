Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 381BE70B1B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Aug 2014 02:23:55 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s7B2Nt0B025665
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 10 Aug 2014 19:23:55 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Sun, 10 Aug 2014 19:23:55 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 11 Aug 2014 10:23:46 +0800
Message-ID: <ca551373b076b49e99da113a94f2d3e74e9f56b6.1407723356.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1407723356.git.hongxu.jia@windriver.com>
References: <cover.1407723356.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Cc: saul.wold@intel.com
Subject: [PATCH 1/1] guile: workaround ice ssa corruption while DEBUG_BUILD
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
X-List-Received-Date: Mon, 11 Aug 2014 02:24:01 -0000
Content-Type: text/plain

Add:
MACHINE = "qemux86-64"
DEBUG_BUILD = "1"
to local.conf and there was a ssa corruption to build guile:
..
Unable to coalesce ssa_names 48 and 3476 which are marked as MUST COALESCE.
sp_48(ab) and  sp_3476(ab)
guile-2.0.11/libguile/vm-engine.c: In function 'vm_debug_engine':
guile-2.0.11/libguile/vm.c:673:19: internal compiler error: SSA corruption
 #define VM_NAME   vm_debug_engine
                   ^
guile-2.0.11/libguile/vm-engine.c:39:1: note: in expansion of macro 'VM_NAME'
 VM_NAME (SCM vm, SCM program, SCM *argv, int nargs)
 ^
Please submit a full bug report,
with preprocessed source if appropriate.
See <http://gcc.gnu.org/bugs.html> for instructions.
...

Tweak libguile/vm-i-system.c to check the value of nshuf to workaround it.
The tweak didn't change previous logic.

[YOCTO #6411]

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../files/workaround-ice-ssa-corruption.patch      | 60 ++++++++++++++++++++++
 meta/recipes-devtools/guile/guile_2.0.11.bb        |  1 +
 2 files changed, 61 insertions(+)
 create mode 100644 meta/recipes-devtools/guile/files/workaround-ice-ssa-corruption.patch

diff --git a/meta/recipes-devtools/guile/files/workaround-ice-ssa-corruption.patch b/meta/recipes-devtools/guile/files/workaround-ice-ssa-corruption.patch
new file mode 100644
index 0000000..6c34838
--- /dev/null
+++ b/meta/recipes-devtools/guile/files/workaround-ice-ssa-corruption.patch
@@ -0,0 +1,60 @@
+libguile/vm-i-system.c: workaround ice ssa corruption while compiling with option -g -O
+
+While compiling with option -g -O, there was a ssa corruption:
+..
+Unable to coalesce ssa_names 48 and 3476 which are marked as MUST COALESCE.
+sp_48(ab) and  sp_3476(ab)
+guile-2.0.11/libguile/vm-engine.c: In function 'vm_debug_engine':
+guile-2.0.11/libguile/vm.c:673:19: internal compiler error: SSA corruption
+ #define VM_NAME   vm_debug_engine
+                   ^
+guile-2.0.11/libguile/vm-engine.c:39:1: note: in expansion of macro 'VM_NAME'
+ VM_NAME (SCM vm, SCM program, SCM *argv, int nargs)
+ ^
+Please submit a full bug report,
+with preprocessed source if appropriate.
+See <http://gcc.gnu.org/bugs.html> for instructions.
+...
+
+Tweak libguile/vm-i-system.c to add boundary value check to workaround it.
+
+Upstream-Status: Pending
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ libguile/vm-i-system.c | 20 ++++++++++++++++----
+ 1 file changed, 16 insertions(+), 4 deletions(-)
+
+diff --git a/libguile/vm-i-system.c b/libguile/vm-i-system.c
+--- a/libguile/vm-i-system.c
++++ b/libguile/vm-i-system.c
+@@ -625,10 +625,22 @@ VM_DEFINE_INSTRUCTION (47, bind_optionals_shuffle, "bind-optionals/shuffle", 6,
+   /* now shuffle up, from walk to ntotal */
+   {
+     scm_t_ptrdiff nshuf = sp - walk + 1, i;
+-    sp = (fp - 1) + ntotal + nshuf;
+-    CHECK_OVERFLOW ();
+-    for (i = 0; i < nshuf; i++)
+-      sp[-i] = walk[nshuf-i-1];
++    /* check the value of nshuf to workaround ice ssa corruption */
++    /* while compiling with -O -g */
++    if (nshuf > 0)
++    {
++      sp = (fp - 1) + ntotal + nshuf;
++      CHECK_OVERFLOW ();
++      for (i = 0; i < nshuf; i++)
++        sp[-i] = walk[nshuf-i-1];
++    }
++    else
++    {
++      sp = (fp - 1) + ntotal + nshuf;
++      CHECK_OVERFLOW ();
++      for (i = 0; i < nshuf; i++)
++        sp[-i] = walk[nshuf-i-1];
++    }
+   }
+   /* and fill optionals & keyword args with SCM_UNDEFINED */
+   while (walk <= (fp - 1) + ntotal)
+-- 
+1.9.1
+
diff --git a/meta/recipes-devtools/guile/guile_2.0.11.bb b/meta/recipes-devtools/guile/guile_2.0.11.bb
index d19460a..f1b255b 100644
--- a/meta/recipes-devtools/guile/guile_2.0.11.bb
+++ b/meta/recipes-devtools/guile/guile_2.0.11.bb
@@ -19,6 +19,7 @@ SRC_URI = "${GNU_MIRROR}/guile/guile-${PV}.tar.xz \
            file://opensuse/guile-64bit.patch \
            file://guile_2.0.6_fix_sed_error.patch \
            file://arm_endianness.patch \
+           file://workaround-ice-ssa-corruption.patch \
            "
 
 #           file://debian/0001-Change-guile-to-guile-X.Y-for-info-pages.patch
-- 
1.9.1


