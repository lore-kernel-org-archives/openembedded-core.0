Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Sg8Ny-0008Qv-Tc
	for openembedded-core@lists.openembedded.org;
	Sun, 17 Jun 2012 07:50:55 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 16 Jun 2012 22:40:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="181103297"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.105])
	by fmsmga002.fm.intel.com with ESMTP; 16 Jun 2012 22:40:10 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 16 Jun 2012 22:39:52 -0700
Message-Id: <d46aff273ef1dd7f8cf4511d0154a546033b8dad.1339911478.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1339911478.git.sgw@linux.intel.com>
References: <cover.1339911478.git.sgw@linux.intel.com>
In-Reply-To: <cover.1339911478.git.sgw@linux.intel.com>
References: <cover.1339911478.git.sgw@linux.intel.com>
Subject: [Consolidated Pull 08/23] sat-solver: Fix build on uclibc
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
X-List-Received-Date: Sun, 17 Jun 2012 05:50:55 -0000

From: Khem Raj <raj.khem@gmail.com>

futimes is not available on uclibc so use utimes
qsort is also not as expected by sat-solver therefore
for uclibc we resort to using internal version of
qsort

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../sat-solver/sat-solver/futimes.patch            |   32 ++++++++++++++++++++
 meta/recipes-extended/sat-solver/sat-solver_git.bb |    3 ++
 2 files changed, 35 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-extended/sat-solver/sat-solver/futimes.patch

diff --git a/meta/recipes-extended/sat-solver/sat-solver/futimes.patch b/meta/recipes-extended/sat-solver/sat-solver/futimes.patch
new file mode 100644
index 0000000..b24d852
--- /dev/null
+++ b/meta/recipes-extended/sat-solver/sat-solver/futimes.patch
@@ -0,0 +1,32 @@
+This patch uses utimes instead of futimes for uclibc
+since futimes is not available
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Index: git/examples/solv.c
+===================================================================
+--- git.orig/examples/solv.c	2012-06-01 12:06:22.041552848 -0700
++++ git/examples/solv.c	2012-06-01 12:49:17.417677449 -0700
+@@ -1027,7 +1027,8 @@
+   int flags;
+ 
+   cinfo = repo->appdata;
+-  if (!(fp = fopen(calccachepath(repo, repoext), "r")))
++  const char* fname = calccachepath(repo, repoext);
++  if (!(fp = fopen(fname, "r")))
+     return 0;
+   if (fseek(fp, -sizeof(mycookie), SEEK_END) || fread(mycookie, sizeof(mycookie), 1, fp) != 1)
+     {
+@@ -1068,7 +1069,11 @@
+       memcpy(cinfo->extcookie, myextcookie, sizeof(myextcookie));
+     }
+   if (mark)
++#ifdef __UCLIBC__
++    utimes(fname, 0);	/* try to set modification time */
++#else
+     futimes(fileno(fp), 0);	/* try to set modification time */
++#endif
+   fclose(fp);
+   return 1;
+ }
diff --git a/meta/recipes-extended/sat-solver/sat-solver_git.bb b/meta/recipes-extended/sat-solver/sat-solver_git.bb
index b0382f6..e1054e9 100644
--- a/meta/recipes-extended/sat-solver/sat-solver_git.bb
+++ b/meta/recipes-extended/sat-solver/sat-solver_git.bb
@@ -20,6 +20,7 @@ SRC_URI = "git://github.com/openSUSE/sat-solver.git;protocol=git \
            file://sat-solver_core.patch \
            file://fix_gcc-4.6.0_compile_issue.patch \
            file://0001-sat_xfopen.c-Forward-port-to-zlib-1.2.6-gzFile.patch \
+           file://futimes.patch \
           "
 
 S = "${WORKDIR}/git"
@@ -28,6 +29,8 @@ EXTRA_OECMAKE += "-DRPM5=RPM5 -DOE_CORE=OE_CORE"
 
 EXTRA_OECMAKE += " -DLIB=${@os.path.basename('${libdir}')}"
 
+TUNE_CCARGS_append_libc-uclibc = " -DUSE_OWN_QSORT=1 "
+
 inherit cmake pkgconfig
 
 RDEPENDS_${PN} = "rpm-libs"
-- 
1.7.7.6



