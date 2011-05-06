Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1QIBsq-0006dQ-RL
	for openembedded-core@lists.openembedded.org;
	Fri, 06 May 2011 05:39:17 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 05 May 2011 20:36:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,324,1301900400"; d="scan'208";a="688948259"
Received: from nbuild2.sc.intel.com (HELO localhost) ([172.25.110.37])
	by fmsmga002.fm.intel.com with ESMTP; 05 May 2011 20:36:35 -0700
Message-Id: <b1beca97de37b365dbc12fedc231c2096c1bb565.1304652773.git.nitin.a.kamble@intel.com>
In-Reply-To: <cover.1304652773.git.nitin.a.kamble@intel.com>
References: <cover.1304652773.git.nitin.a.kamble@intel.com>
Old-Date: Thu, 5 May 2011 20:24:29 -0700
Date: Thu, 05 May 2011 20:36:35 -0700
To: openembedded-core@lists.openembedded.org,poky@yoctoproject.org
From: Nitin A Kamble <nitin.a.kamble@intel.com>
Subject: [PATCH 08/10] sat-solver: fix compilation issue with gcc 4.6.0
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 06 May 2011 03:39:17 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 .../sat-solver/fix_gcc-4.6.0_compile_issue.patch   |  115 ++++++++++++++++++++
 meta/recipes-extended/sat-solver/sat-solver_git.bb |    5 +-
 2 files changed, 119 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-extended/sat-solver/sat-solver/fix_gcc-4.6.0_compile_issue.patch

diff --git a/meta/recipes-extended/sat-solver/sat-solver/fix_gcc-4.6.0_compile_issue.patch b/meta/recipes-extended/sat-solver/sat-solver/fix_gcc-4.6.0_compile_issue.patch
new file mode 100644
index 0000000..11c727d
--- /dev/null
+++ b/meta/recipes-extended/sat-solver/sat-solver/fix_gcc-4.6.0_compile_issue.patch
@@ -0,0 +1,115 @@
+Upstream-Status="Pending"
+
+Fix the following compilation issues with gcc 4.6.0
+
+| /build_disk/poky_build/build_gcc_4.6.0/tmp/work/qemux86-poky-linux/sat-solver-0.0-git1+0a7378d5f482f477a01cf1690d76871ab8bdcc32-r9/git/ext/repo_updateinfoxml.c: In function 'startElement':
+| /build_disk/poky_build/build_gcc_4.6.0/tmp/work/qemux86-poky-linux/sat-solver-0.0-git1+0a7378d5f482f477a01cf1690d76871ab8bdcc32-r9/git/ext/repo_updateinfoxml.c:278:25: error: variable 'status' set but not used [-Werror=unused-but-set-variable]
+| /build_disk/poky_build/build_gcc_4.6.0/tmp/work/qemux86-poky-linux/sat-solver-0.0-git1+0a7378d5f482f477a01cf1690d76871ab8bdcc32-r9/git/ext/repo_updateinfoxml.c:386:36: error: variable 'src' set but not used [-Werror=unused-but-set-variable]
+| cc1: all warnings being treated as errors
+| 
+| make[2]: *** [ext/CMakeFiles/satsolverext.dir/repo_updateinfoxml.o] Error 1
+| make[2]: *** Waiting for unfinished jobs....
+| /build_disk/poky_build/build_gcc_4.6.0/tmp/work/qemux86-poky-linux/sat-solver-0.0-git1+0a7378d5f482f477a01cf1690d76871ab8bdcc32-r9/git/src/transaction.c: In function 'transaction_add_obsoleted':
+| /build_disk/poky_build/build_gcc_4.6.0/tmp/work/qemux86-poky-linux/sat-solver-0.0-git1+0a7378d5f482f477a01cf1690d76871ab8bdcc32-r9/git/src/transaction.c:1933:21: error: variable 'oldcount' set but not used [-Werror=unused-but-set-variable]
+| cc1: all warnings being treated as errors
+| 
+| make[2]: *** [src/CMakeFiles/satsolver.dir/transaction.o] Error 1
+| make[2]: Leaving directory `/build_disk/poky_build/build_gcc_4.6.0/tmp/work/qemux86-poky-linux/sat-solver-0.0-git1+0a7378d5f482f477a01cf1690d76871ab8bdcc32-r9/git'
+| make[1]: *** [src/CMakeFiles/satsolver.dir/all] Error 2
+| make[1]: *** Waiting for unfinished jobs....
+| /build_disk/poky_build/build_gcc_4.6.0/tmp/work/qemux86-poky-linux/sat-solver-0.0-git1+0a7378d5f482f477a01cf1690d76871ab8bdcc32-r9/git/ext/repo_rpmdb.c: In function 'rpm_byfp':
+| /build_disk/poky_build/build_gcc_4.6.0/tmp/work/qemux86-poky-linux/sat-solver-0.0-git1+0a7378d5f482f477a01cf1690d76871ab8bdcc32-r9/git/ext/repo_rpmdb.c:2406:20: error: variable 'headerend' set but not used [-Werror=unused-but-set-variable]
+| /build_disk/poky_build/build_gcc_4.6.0/tmp/work/qemux86-poky-linux/sat-solver-0.0-git1+0a7378d5f482f477a01cf1690d76871ab8bdcc32-r9/git/ext/repo_rpmdb.c: In function 'parsekeydata':
+| /build_disk/poky_build/build_gcc_4.6.0/tmp/work/qemux86-poky-linux/sat-solver-0.0-git1+0a7378d5f482f477a01cf1690d76871ab8bdcc32-r9/git/ext/repo_rpmdb.c:2833:29: error: variable 'scr' set but not used [-Werror=unused-but-set-variable]
+| /build_disk/poky_build/build_gcc_4.6.0/tmp/work/qemux86-poky-linux/sat-solver-0.0-git1+0a7378d5f482f477a01cf1690d76871ab8bdcc32-r9/git/ext/repo_rpmdb.c:2669:7: error: variable 'useridl' set but not used [-Werror=unused-but-set-variable]
+| /build_disk/poky_build/build_gcc_4.6.0/tmp/work/qemux86-poky-linux/sat-solver-0.0-git1+0a7378d5f482f477a01cf1690d76871ab8bdcc32-r9/git/ext/repo_rpmdb.c:2667:7: error: variable 'pubkeyl' set but not used [-Werror=unused-but-set-variable]
+| cc1: all warnings being treated as errors
+| 
+| make[2]: *** [ext/CMakeFiles/satsolverext.dir/repo_rpmdb.o] Error 1
+| make[2]: Leaving directory `/build_disk/poky_build/build_gcc_4.6.0/tmp/work/qemux86-poky-linux/sat-solver-0.0-git1+0a7378d5f482f477a01cf1690d76871ab8bdcc32-r9/git'
+| make[1]: *** [ext/CMakeFiles/satsolverext.dir/all] Error 2
+| make[1]: Leaving directory `/build_disk/poky_build/build_gcc_4.6.0/tmp/work/qemux86-poky-linux/sat-solver-0.0-git1+0a7378d5f482f477a01cf1690d76871ab8bdcc32-r9/git'
+| make: *** [all] Error 2
+| FATAL: oe_runmake failed
+| ERROR: Function 'do_compile' failed (see /build_disk/poky_build/build_gcc_4.6.0/tmp/work/qemux86-poky-linux/sat-solver-0.0-git1+0a7378d5f482f477a01cf1690d76871ab8bdcc32-r9/temp/log.do_compile.21830 for further information)
+NOTE: package sat-solver-0.0-git1+0a7378d5f482f477a01cf1690d76871ab8bdcc32-r9: task do_compile: Failed
+
+Nitin A Kamble <nitin.a.kamble@intel.com> 2011/05/05
+
+Index: git/src/transaction.c
+===================================================================
+--- git.orig/src/transaction.c
++++ git/src/transaction.c
+@@ -1930,7 +1930,7 @@ transaction_add_obsoleted(Transaction *t
+   Repo *installed = pool->installed;
+   Id p;
+   Solvable *s;
+-  int i, j, k, max, oldcount;
++  int i, j, k, max;
+   Map done;
+   Queue obsq, *steps;
+ 
+@@ -1945,7 +1945,6 @@ transaction_add_obsoleted(Transaction *t
+     return;
+   /* make room */
+   steps = &trans->steps;
+-  oldcount = steps->count;
+   queue_insertn(steps, 0, max);
+ 
+   /* now add em */
+Index: git/ext/repo_updateinfoxml.c
+===================================================================
+--- git.orig/ext/repo_updateinfoxml.c
++++ git/ext/repo_updateinfoxml.c
+@@ -275,7 +275,7 @@ startElement(void *userData, const char 
+        */
+     case STATE_UPDATE:
+       {
+-	const char *from = 0, *status = 0, *type = 0, *version = 0;
++	const char *from = 0, __attribute__((__unused__)) *status = 0, *type = 0, *version = 0;
+ 	for (; *atts; atts += 2)
+ 	  {
+ 	    if (!strcmp(*atts, "from"))
+@@ -383,7 +383,7 @@ startElement(void *userData, const char 
+        */
+     case STATE_PACKAGE:
+       {
+-	const char *arch = 0, *name = 0, *src = 0;
++	const char *arch = 0, *name = 0, __attribute__((__unused__)) *src = 0;
+ 	Id evr = makeevr_atts(pool, pd, atts); /* parse "epoch", "version", "release" */
+ 	Id n, a = 0;
+ 	Id rel_id;
+Index: git/ext/repo_rpmdb.c
+===================================================================
+--- git.orig/ext/repo_rpmdb.c
++++ git/ext/repo_rpmdb.c
+@@ -2403,7 +2403,7 @@ void *
+ rpm_byfp(FILE *fp, const char *name, void **statep)
+ {
+   struct rpm_by_state *state = *statep;
+-  int headerstart, headerend;
++  int headerstart, __attribute__((__unused__))headerend;
+   RpmHead *rpmhead;
+   int sigdsize, sigcnt, l;
+   unsigned char lead[4096];
+@@ -2664,9 +2664,9 @@ parsekeydata(Solvable *s, Repodata *data
+   unsigned char keyid[8];
+   unsigned int kcr = 0, maxex = 0;
+   unsigned char *pubkey = 0;
+-  int pubkeyl = 0;
++  int __attribute__((__unused__)) pubkeyl = 0;
+   unsigned char *userid = 0;
+-  int useridl = 0;
++  int __attribute__((__unused__)) useridl = 0;
+ 
+   for (; pl; p += l, pl -= l)
+     {
+@@ -2830,7 +2830,7 @@ parsekeydata(Solvable *s, Repodata *data
+ 	    {
+ 	      int j, ql, haveissuer;
+ 	      unsigned char *q;
+-	      unsigned int ex = 0, scr = 0;
++	      unsigned int ex = 0, __attribute__((__unused__))scr = 0;
+ 	      unsigned char issuer[8];
+ 
+ 	      // printf("V4 signature packet\n");
diff --git a/meta/recipes-extended/sat-solver/sat-solver_git.bb b/meta/recipes-extended/sat-solver/sat-solver_git.bb
index a174e76..c608bb7 100644
--- a/meta/recipes-extended/sat-solver/sat-solver_git.bb
+++ b/meta/recipes-extended/sat-solver/sat-solver_git.bb
@@ -8,7 +8,9 @@ DEPENDS = "libcheck rpm zlib expat db"
 
 SRCREV = "0a7378d5f482f477a01cf1690d76871ab8bdcc32"
 PV = "0.0-git${SRCPV}"
-PR = "r9"
+PR = "r10"
+
+PARALLEL_MAKE=""
 
 SRC_URI = "git://gitorious.org/opensuse/sat-solver.git;protocol=git \
            file://sat-solver_rpm5.patch \
@@ -16,6 +18,7 @@ SRC_URI = "git://gitorious.org/opensuse/sat-solver.git;protocol=git \
            file://cmake.patch \
            file://db5.patch \
            file://sat-solver_core.patch \
+           file://fix_gcc-4.6.0_compile_issue.patch \
           "
 
 S = "${WORKDIR}/git"
-- 
1.7.3.4



