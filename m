Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Stw3k-0004Xt-VZ
	for openembedded-core@lists.openembedded.org;
	Wed, 25 Jul 2012 09:31:05 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 25 Jul 2012 00:19:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="172897590"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.97])
	by azsmga001.ch.intel.com with ESMTP; 25 Jul 2012 00:19:31 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 25 Jul 2012 00:19:15 -0700
Message-Id: <dea96a1e24d9d72673761ecd48939f400d96c676.1343200454.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1343200454.git.sgw@linux.intel.com>
References: <cover.1343200454.git.sgw@linux.intel.com>
In-Reply-To: <cover.1343200454.git.sgw@linux.intel.com>
References: <cover.1343200454.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 21/28] gcc-cross-initial: Stage self sufficient fixed limits.h
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
X-List-Received-Date: Wed, 25 Jul 2012 07:31:08 -0000

From: Khem Raj <raj.khem@gmail.com>

currently gcc installs a limits.h which references to another
limits.h which it expects from target sysroot and that header
in target sysroot will come from eglibc. So we need to break
this catch-22 and hence we install a self sufficient limits.h
which is then happy when referenced and doesnt complain about
missing limits.h from target sysroot.

This is mostly used when eglibc-initial configure is run

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-devtools/gcc/gcc-4.7.inc           |    2 +-
 meta/recipes-devtools/gcc/gcc-cross-initial.inc |   10 ++++++++++
 2 files changed, 11 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc-4.7.inc b/meta/recipes-devtools/gcc/gcc-4.7.inc
index 43d77ec..709d7d8 100644
--- a/meta/recipes-devtools/gcc/gcc-4.7.inc
+++ b/meta/recipes-devtools/gcc/gcc-4.7.inc
@@ -1,6 +1,6 @@
 require gcc-common.inc
 
-PR = "r7"
+PR = "r8"
 
 # Third digit in PV should be incremented after a minor release
 # happens from this branch on gcc e.g. currently its 4.7.1
diff --git a/meta/recipes-devtools/gcc/gcc-cross-initial.inc b/meta/recipes-devtools/gcc/gcc-cross-initial.inc
index 93a6d78..aee46a6 100644
--- a/meta/recipes-devtools/gcc/gcc-cross-initial.inc
+++ b/meta/recipes-devtools/gcc/gcc-cross-initial.inc
@@ -27,3 +27,13 @@ EXTRA_OECONF = "--with-newlib \
 do_compile () {
     oe_runmake all-gcc all-target-libgcc
 }
+# fixed limits.h infact includes the so called real limits.h
+# which should come from libc but when we build libc-initial
+# then bunch of configure tests include fixed limits.h which in turn
+# includes real limits.h but this real limits.h is not staged yet
+# so we overwirte the generated include-fixed/limits.h for gcc-cross-initial
+# to get rid references to real limits.h
+
+do_install_append1() {
+    cp gcc/include-fixed/limits.h ${D}${gcclibdir}/${TARGET_SYS}/${BINV}/include-fixed/limits.h
+}
-- 
1.7.7.6



