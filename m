Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Rvlyd-0001XF-0N
	for openembedded-core@lists.openembedded.org;
	Fri, 10 Feb 2012 09:37:07 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 10 Feb 2012 00:28:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="116213860"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.14.208])
	by fmsmga001.fm.intel.com with ESMTP; 10 Feb 2012 00:28:59 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 10 Feb 2012 00:28:48 -0800
Message-Id: <3db7eaac1eaa544334d768610407e449c8f136e0.1328862318.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <cover.1328862318.git.sgw@linux.intel.com>
References: <cover.1328862318.git.sgw@linux.intel.com>
In-Reply-To: <cover.1328862318.git.sgw@linux.intel.com>
References: <cover.1328862318.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 13/20] sat-solver: Fix build with zlib 1.2.6
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
X-List-Received-Date: Fri, 10 Feb 2012 08:37:07 -0000

From: Khem Raj <raj.khem@gmail.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...fopen.c-Forward-port-to-zlib-1.2.6-gzFile.patch |   57 ++++++++++++++++++++
 meta/recipes-extended/sat-solver/sat-solver_git.bb |    3 +-
 2 files changed, 59 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-extended/sat-solver/sat-solver/0001-sat_xfopen.c-Forward-port-to-zlib-1.2.6-gzFile.patch

diff --git a/meta/recipes-extended/sat-solver/sat-solver/0001-sat_xfopen.c-Forward-port-to-zlib-1.2.6-gzFile.patch b/meta/recipes-extended/sat-solver/sat-solver/0001-sat_xfopen.c-Forward-port-to-zlib-1.2.6-gzFile.patch
new file mode 100644
index 0000000..402d16e
--- /dev/null
+++ b/meta/recipes-extended/sat-solver/sat-solver/0001-sat_xfopen.c-Forward-port-to-zlib-1.2.6-gzFile.patch
@@ -0,0 +1,57 @@
+From bbbb4fb9b7c85fde90608710dff09480696c6567 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 9 Feb 2012 16:01:56 -0800
+Subject: [PATCH] sat_xfopen.c: Forward port to zlib 1.2.6 gzFile
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Upstream-Status: Pending
+---
+ ext/sat_xfopen.c |   10 +++++-----
+ 1 files changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/ext/sat_xfopen.c b/ext/sat_xfopen.c
+index cf943cf..b3d458d 100644
+--- a/ext/sat_xfopen.c
++++ b/ext/sat_xfopen.c
+@@ -16,16 +16,16 @@
+ 
+ static ssize_t cookie_gzread(void *cookie, char *buf, size_t nbytes)
+ {
+-  return gzread((gzFile *)cookie, buf, nbytes);
++  return gzread((gzFile)cookie, buf, nbytes);
+ }
+ 
+ static int
+ cookie_gzclose(void *cookie)
+ {
+-  return gzclose((gzFile *)cookie);
++  return gzclose((gzFile)cookie);
+ }
+ 
+-static FILE *mygzfopen(gzFile* gzf)
++static FILE *mygzfopen(gzFile gzf)
+ {
+ #ifdef HAVE_FUNOPEN
+   return funopen(
+@@ -49,7 +49,7 @@ FILE *
+ sat_xfopen(const char *fn, const char *mode)
+ {
+   char *suf;
+-  gzFile *gzf;
++  gzFile gzf;
+ 
+   if (!fn)
+     return 0;
+@@ -68,7 +68,7 @@ FILE *
+ sat_xfopen_fd(const char *fn, int fd, const char *mode)
+ {
+   char *suf;
+-  gzFile *gzf;
++  gzFile gzf;
+ 
+   suf = fn ? strrchr(fn, '.') : 0;
+   if (!mode)
+-- 
+1.7.5.4
+
diff --git a/meta/recipes-extended/sat-solver/sat-solver_git.bb b/meta/recipes-extended/sat-solver/sat-solver_git.bb
index e243c6a..9d8422f 100644
--- a/meta/recipes-extended/sat-solver/sat-solver_git.bb
+++ b/meta/recipes-extended/sat-solver/sat-solver_git.bb
@@ -8,7 +8,7 @@ DEPENDS = "libcheck rpm zlib expat db"
 
 SRCREV = "0a7378d5f482f477a01cf1690d76871ab8bdcc32"
 PV = "0.0-git${SRCPV}"
-PR = "r12"
+PR = "r13"
 
 PARALLEL_MAKE=""
 
@@ -19,6 +19,7 @@ SRC_URI = "git://github.com/openSUSE/sat-solver.git;protocol=git \
            file://db5.patch \
            file://sat-solver_core.patch \
            file://fix_gcc-4.6.0_compile_issue.patch \
+           file://0001-sat_xfopen.c-Forward-port-to-zlib-1.2.6-gzFile.patch \
           "
 
 S = "${WORKDIR}/git"
-- 
1.7.6.5



