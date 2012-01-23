Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RpOrX-0004vP-Sy
	for openembedded-core@lists.openembedded.org;
	Mon, 23 Jan 2012 19:43:28 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 23 Jan 2012 10:34:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="59212273"
Received: from unknown (HELO swold-mobl.lan) ([10.255.14.82])
	by AZSMGA002.ch.intel.com with ESMTP; 23 Jan 2012 10:34:45 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 Jan 2012 10:34:26 -0800
Message-Id: <8cfef7e928fa69b16e8e1724805b407925ec86d4.1327343524.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <cover.1327343523.git.sgw@linux.intel.com>
References: <cover.1327343523.git.sgw@linux.intel.com>
In-Reply-To: <cover.1327343523.git.sgw@linux.intel.com>
References: <cover.1327343523.git.sgw@linux.intel.com>
Subject: [PATCH v2 21/21] gcc: move shared .a to their own package
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
X-List-Received-Date: Mon, 23 Jan 2012 18:43:29 -0000

Keep the *_nonshared.a in the libgcc-dev package as
required for linking, moved the other *.a libraries
into their respective packages (libstdc++ and libssp).

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-devtools/gcc/gcc-4.6.inc             |    2 +-
 meta/recipes-devtools/gcc/gcc-package-runtime.inc |    9 +++++++--
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc-4.6.inc b/meta/recipes-devtools/gcc/gcc-4.6.inc
index ca0d41d..758c93e 100644
--- a/meta/recipes-devtools/gcc/gcc-4.6.inc
+++ b/meta/recipes-devtools/gcc/gcc-4.6.inc
@@ -1,6 +1,6 @@
 require gcc-common.inc
 
-PR = "r21"
+PR = "r22"
 
 # Third digit in PV should be incremented after a minor release
 # happens from this branch on gcc e.g. currently its 4.6.0
diff --git a/meta/recipes-devtools/gcc/gcc-package-runtime.inc b/meta/recipes-devtools/gcc/gcc-package-runtime.inc
index 7ac68f2..feb8735 100644
--- a/meta/recipes-devtools/gcc/gcc-package-runtime.inc
+++ b/meta/recipes-devtools/gcc/gcc-package-runtime.inc
@@ -3,10 +3,12 @@ PACKAGES = "\
   libstdc++ \
   libstdc++-precompile-dev \
   libstdc++-dev \
+  libstdc++-staticdev \
   libg2c \
   libg2c-dev \
   libssp \
   libssp-dev \
+  libssp-staticdev \
   libgfortran \
   libgfortran-dev \
   libmudflap \
@@ -31,8 +33,9 @@ FILES_libstdc++-dev = "\
   ${includedir}/c++/ \
   ${libdir}/libstdc++.so \
   ${libdir}/libstdc++.la \
+  ${libdir}/libsupc++.la"
+FILES_libstdc++-staticdev = "\
   ${libdir}/libstdc++.a \
-  ${libdir}/libsupc++.la \
   ${libdir}/libsupc++.a"
 
 FILES_libstdc++-precompile-dev = "${includedir}/c++/${TARGET_SYS}/bits/*.gch"
@@ -40,9 +43,11 @@ FILES_libstdc++-precompile-dev = "${includedir}/c++/${TARGET_SYS}/bits/*.gch"
 FILES_libssp = "${libdir}/libssp.so.*"
 FILES_libssp-dev = " \
   ${libdir}/libssp*.so \
-  ${libdir}/libssp*.a \
+  ${libdir}/libssp*_nonshared.a \
   ${libdir}/libssp*.la \
   ${libdir}/gcc/${TARGET_SYS}/${BINV}/include/ssp"
+FILES_libssp-staticdev = " \
+  ${libdir}/libssp*.a"
 
 FILES_libgfortran = "${libdir}/libgfortran.so.*"
 FILES_libgfortran-dev = " \
-- 
1.7.6.5



