Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SqnhL-0006sq-M4
	for openembedded-core@lists.openembedded.org;
	Mon, 16 Jul 2012 17:58:59 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 16 Jul 2012 08:47:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="193443307"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.178])
	by fmsmga002.fm.intel.com with ESMTP; 16 Jul 2012 08:47:38 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 16 Jul 2012 08:47:10 -0700
Message-Id: <add2c772cd404e8bea4828959fcb5ee33c35c048.1342453118.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1342453118.git.sgw@linux.intel.com>
References: <cover.1342453118.git.sgw@linux.intel.com>
In-Reply-To: <cover.1342453118.git.sgw@linux.intel.com>
References: <cover.1342453118.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 04/30] rpm_5.4.9.bb: fix builds on systems with older libc
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
X-List-Received-Date: Mon, 16 Jul 2012 15:58:59 -0000

From: Matthew McClintock <msm@freescale.com>

| dbconvert.o: In function `rpmdb_convert':
| /local/jenkins/jobs/yocto-upstream/workspace/label/master/machine/p4080ds/poky/master/tmp/work/x86_64-linux/rpm-native-5.4.9-r45/rpm-5.4.9/tools/dbconvert.c:126: warning: the use of `tempnam' is dangerous, better use `mkstemp'
| dbconvert.o: In function `main':
| dbconvert.c:(.text+0x923): undefined reference to `htobe32'
| dbconvert.c:(.text+0xaa4): undefined reference to `htole32'
| dbconvert.c:(.text+0xac9): undefined reference to `htole32'

Signed-off-by: Matthew McClintock <msm@freescale.com>
Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-devtools/rpm/rpm/dbconvert.patch |   27 +++++++++++++++++++++++++
 meta/recipes-devtools/rpm/rpm_5.4.9.bb        |    3 +-
 2 files changed, 29 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-devtools/rpm/rpm/dbconvert.patch

diff --git a/meta/recipes-devtools/rpm/rpm/dbconvert.patch b/meta/recipes-devtools/rpm/rpm/dbconvert.patch
new file mode 100644
index 0000000..27dba8c
--- /dev/null
+++ b/meta/recipes-devtools/rpm/rpm/dbconvert.patch
@@ -0,0 +1,27 @@
+Upstream-Status: Not applicable
+
+Hack to prevent unneeded demo app from building on older libc
+where it will break the build
+
+Index: rpm-5.4.9/tools/Makefile.am
+===================================================================
+--- rpm-5.4.9.orig/tools/Makefile.am
++++ rpm-5.4.9/tools/Makefile.am
+@@ -24,7 +24,7 @@ AM_CFLAGS = $(OPENMP_CFLAGS)
+ 
+ EXTRA_DIST =	hashtab.h bsdiff.1 bspatch.1 dotgraph.hh
+ 
+-EXTRA_PROGRAMS = augtool cudftool dbconvert debugedit \
++EXTRA_PROGRAMS = augtool cudftool debugedit \
+ 	nix-build nix-channel nix-collect-garbage nix-copy-closure \
+ 	nix-env nix-hash nix-install-package nix-instantiate \
+ 	nix-log2xml nix-prefetch-url nix-pull nix-push nix-store nix-worker \
+@@ -60,7 +60,7 @@ pkgbin_PROGRAMS =	\
+ 	rpmcache rpmdigest rpmrepo rpmspecdump \
+ 	rpmcmp rpmdeps rpmdeps-oecore sqlite3 @WITH_KEYUTILS_RPMKEY@ @WITH_LIBELF_DEBUGEDIT@
+ if WITH_DB
+-pkgbin_PROGRAMS +=	dbconvert
++pkgbin_PROGRAMS +=	
+ endif
+ dist_man_MANS =		rpmgrep.1
+ 
diff --git a/meta/recipes-devtools/rpm/rpm_5.4.9.bb b/meta/recipes-devtools/rpm/rpm_5.4.9.bb
index 6ef1aae..e276cc3 100644
--- a/meta/recipes-devtools/rpm/rpm_5.4.9.bb
+++ b/meta/recipes-devtools/rpm/rpm_5.4.9.bb
@@ -43,7 +43,7 @@ LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=2d5025d4aa3495befef8f17206a5b0a1"
 
 DEPENDS = "libpcre attr acl popt ossp-uuid file"
-PR = "r45"
+PR = "r46"
 
 # rpm2cpio is a shell script, which is part of the rpm src.rpm.  It is needed
 # in order to extract the distribution SRPM into a format we can extract...
@@ -75,6 +75,7 @@ SRC_URI = "http://www.rpm5.org/files/rpm/rpm-5.4/rpm-5.4.9-0.20120508.src.rpm;ex
 	   file://uclibc-support.patch \
 	   file://rpmatch.patch \
 	   file://fstack-protector-configure-check.patch \
+	   file://dbconvert.patch \
 	  "
 
 SRC_URI[md5sum] = "60d56ace884340c1b3fcac6a1d58e768"
-- 
1.7.7.6



