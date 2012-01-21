Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RoTTG-0001lG-BC
	for openembedded-core@lists.openembedded.org;
	Sat, 21 Jan 2012 06:26:34 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 20 Jan 2012 21:18:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="101117534"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.14.79])
	by orsmga002.jf.intel.com with ESMTP; 20 Jan 2012 21:18:47 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Jan 2012 21:18:38 -0800
Message-Id: <a6a863bec95ca8b6835a5515062fe8a48b6c3e06.1327123057.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <cover.1327123057.git.sgw@linux.intel.com>
References: <cover.1327123057.git.sgw@linux.intel.com>
In-Reply-To: <cover.1327123057.git.sgw@linux.intel.com>
References: <cover.1327123057.git.sgw@linux.intel.com>
Subject: [PATCH 20/20] gcc: refactor packages for staticdev
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
X-List-Received-Date: Sat, 21 Jan 2012 05:26:41 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-devtools/gcc/gcc-4.6.inc             |    2 +-
 meta/recipes-devtools/gcc/gcc-package-runtime.inc |    9 +++++++--
 meta/recipes-devtools/gcc/libgcc_4.6.bb           |    4 +++-
 3 files changed, 11 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc-4.6.inc b/meta/recipes-devtools/gcc/gcc-4.6.inc
index 4bbb2d2..541b473 100644
--- a/meta/recipes-devtools/gcc/gcc-4.6.inc
+++ b/meta/recipes-devtools/gcc/gcc-4.6.inc
@@ -1,6 +1,6 @@
 require gcc-common.inc
 
-PR = "r20"
+PR = "r21"
 
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
diff --git a/meta/recipes-devtools/gcc/libgcc_4.6.bb b/meta/recipes-devtools/gcc/libgcc_4.6.bb
index dd0a7be..0c50988 100644
--- a/meta/recipes-devtools/gcc/libgcc_4.6.bb
+++ b/meta/recipes-devtools/gcc/libgcc_4.6.bb
@@ -7,14 +7,16 @@ PACKAGES = "\
   ${PN} \
   ${PN}-dev \
   ${PN}-dbg \
+  libgcov-dev \
   "
 
 FILES_${PN} = "${base_libdir}/libgcc*.so.*"
 FILES_${PN}-dev = " \
   ${base_libdir}/libgcc*.so \
   ${libdir}/${TARGET_SYS}/${BINV}/crt* \
-  ${libdir}/${TARGET_SYS}/${BINV}/libgcov.a \
   ${libdir}/${TARGET_SYS}/${BINV}/libgcc*"
+FILES_libgcov-dev = " \
+  ${libdir}/${TARGET_SYS}/${BINV}/libgcov.a \
 
 FILES_${PN}-dbg += "${base_libdir}/.debug/"
 
-- 
1.7.6.5



