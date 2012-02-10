Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Rvlye-0001XF-W7
	for openembedded-core@lists.openembedded.org;
	Fri, 10 Feb 2012 09:37:09 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 10 Feb 2012 00:29:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="116213867"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.14.208])
	by fmsmga001.fm.intel.com with ESMTP; 10 Feb 2012 00:29:00 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 10 Feb 2012 00:28:52 -0800
Message-Id: <a66d237ab75f7c31c57a240ab402f1c1874cdde4.1328862318.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <cover.1328862318.git.sgw@linux.intel.com>
References: <cover.1328862318.git.sgw@linux.intel.com>
In-Reply-To: <cover.1328862318.git.sgw@linux.intel.com>
References: <cover.1328862318.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 17/20] gcc-4.6: Some small performance tweaks
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
X-List-Received-Date: Fri, 10 Feb 2012 08:37:09 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

a) Use the system zlib to avoid building it for each gcc.
b) -initial and -intermediate don't need plugins or lto-plugin
   so disable them.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/gcc/gcc-4.6.inc |   14 ++++++++------
 1 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc-4.6.inc b/meta/recipes-devtools/gcc/gcc-4.6.inc
index 758c93e..ece378d 100644
--- a/meta/recipes-devtools/gcc/gcc-4.6.inc
+++ b/meta/recipes-devtools/gcc/gcc-4.6.inc
@@ -23,7 +23,7 @@ BRANCH = "gcc-4_6-branch"
 FILESPATH = "${@base_set_filespath([ '${FILE_DIRNAME}/gcc-4.6' ], d)}"
 
 DEPENDS =+ "mpfr gmp libmpc"
-NATIVEDEPS = "mpfr-native gmp-native libmpc-native"
+NATIVEDEPS = "mpfr-native gmp-native libmpc-native zlib-native"
 
 LICENSE="GPL-3.0-with-GCC-exception & GPLv3"
 
@@ -86,16 +86,12 @@ B = "${WORKDIR}/${BRANCH}/build.${HOST_SYS}.${TARGET_SYS}"
 FORTRAN = ""
 JAVA = ""
 
-#EXTRA_OECONF_BASE = "  --enable-cheaders=c_std \
-#			--enable-libssp \
-#			--disable-bootstrap \
-#			--disable-libgomp \
-#			--disable-libmudflap"
 EXTRA_OECONF_BASE = " --enable-lto \
 			--enable-libssp \
 			--disable-bootstrap \
 			--disable-libgomp \
 			--disable-libmudflap \
+			--with-system-zlib \
 			--with-linker-hash-style=${LINKER_HASH_STYLE} \
 			--enable-cheaders=c_global "
 
@@ -103,11 +99,17 @@ EXTRA_OECONF_INITIAL = "--disable-libmudflap \
 			--disable-libgomp \
 			--disable-libssp \
 			--disable-libquadmath \
+			--with-system-zlib \
+			--disable-lto \
+			--disable-plugin \
 			--enable-decimal-float=no"
 
 EXTRA_OECONF_INTERMEDIATE = "--disable-libmudflap \
 				--disable-libgomp \
 				--disable-libquadmath \
+				--with-system-zlib \
+				--disable-lto \
+				--disable-plugin \
 				--disable-libssp"
 
 EXTRA_OECONF_append_linux-uclibc = " --disable-decimal-float "
-- 
1.7.6.5



