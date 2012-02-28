Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1S2FhU-0008QZ-Ce
	for openembedded-core@lists.openembedded.org;
	Tue, 28 Feb 2012 06:34:13 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 27 Feb 2012 21:25:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="130197486"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.15.37])
	by fmsmga002.fm.intel.com with ESMTP; 27 Feb 2012 21:25:41 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 27 Feb 2012 21:25:28 -0800
Message-Id: <a7964ccbe5794c6f39ea76bc1920c6a27c61b76c.1330406574.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1330406574.git.sgw@linux.intel.com>
References: <cover.1330406574.git.sgw@linux.intel.com>
In-Reply-To: <cover.1330406574.git.sgw@linux.intel.com>
References: <cover.1330406574.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 30/36] tune-ppce5500: consolidate ppce5500 and ppc64e5500 into one tune file
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
X-List-Received-Date: Tue, 28 Feb 2012 05:34:13 -0000

From: Matthew McClintock <msm@freescale.com>

We don't need two files for this. Also this fixes some mutlilib build
issues where we were not able to select the multilib arch to be
ppce5500 or ppc64e5500.

Changes recently made to meta-fsl-ppc layer depend on this change as
well

Signed-off-by: Matthew McClintock <msm@freescale.com>
---
 meta/conf/machine/include/tune-ppce5500-32b.inc |   15 ---------------
 meta/conf/machine/include/tune-ppce5500-64b.inc |   15 ---------------
 meta/conf/machine/include/tune-ppce5500.inc     |   20 ++++++++++++++++++++
 3 files changed, 20 insertions(+), 30 deletions(-)
 delete mode 100644 meta/conf/machine/include/tune-ppce5500-32b.inc
 delete mode 100644 meta/conf/machine/include/tune-ppce5500-64b.inc
 create mode 100644 meta/conf/machine/include/tune-ppce5500.inc

diff --git a/meta/conf/machine/include/tune-ppce5500-32b.inc b/meta/conf/machine/include/tune-ppce5500-32b.inc
deleted file mode 100644
index 7a9e533..0000000
--- a/meta/conf/machine/include/tune-ppce5500-32b.inc
+++ /dev/null
@@ -1,15 +0,0 @@
-DEFAULTTUNE ?= "ppce5500"
-
-require conf/machine/include/powerpc/arch-powerpc64.inc
-
-TUNEVALID[ppce5500] = "Enable ppce5500 specific processor optimizations"
-TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "ppce5500", "-mcpu=e5500", "", d)}"
-TUNE_PKGARCH = "${@bb.utils.contains("TUNE_FEATURES", "ppce5500", "ppce5500", "${PPCPKGARCH}", d)}"
-
-AVAILTUNES = "ppce5500"
-TUNE_FEATURES_tune-ppce5500 = "m32 ppce5500"
-PACKAGE_EXTRA_ARCHS_tune-ppce5500 = "powerpc ppce5500"
-BASE_LIB_tune-ppce5500 = "lib"
-
-# glibc configure options to get e5500 specific library (for sqrt)
-GLIBC_EXTRA_OECONF += "${@bb.utils.contains("TUNE_FEATURES", "ppce5500", "--with-cpu=e5500", "", d)}"
diff --git a/meta/conf/machine/include/tune-ppce5500-64b.inc b/meta/conf/machine/include/tune-ppce5500-64b.inc
deleted file mode 100644
index 683d25f..0000000
--- a/meta/conf/machine/include/tune-ppce5500-64b.inc
+++ /dev/null
@@ -1,15 +0,0 @@
-DEFAULTTUNE ?= "ppc64e5500"
-
-require conf/machine/include/powerpc/arch-powerpc64.inc
-
-TUNEVALID[ppc64e5500] = "Enable ppc64e5500 specific processor optimizations"
-TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "ppc64e5500", "-mcpu=e5500", "", d)}"
-TUNE_PKGARCH = "${@bb.utils.contains("TUNE_FEATURES", "ppc64e5500", "ppc64e5500", "${PPCPKGARCH}", d)}"
-
-AVAILTUNES = "ppc64e5500"
-TUNE_FEATURES_tune-ppc64e5500 = "m64 ppc64e5500"
-PACKAGE_EXTRA_ARCHS_tune-ppc64e5500 = "powerpc64 ppc64e5500"
-BASE_LIB_tune-ppc64e5500 = "lib64"
-
-# glibc configure options to get e5500 specific library (for sqrt)
-GLIBC_EXTRA_OECONF += "${@bb.utils.contains("TUNE_FEATURES", "ppc64e5500", "--with-cpu=e5500", "", d)}"
diff --git a/meta/conf/machine/include/tune-ppce5500.inc b/meta/conf/machine/include/tune-ppce5500.inc
new file mode 100644
index 0000000..fe8d79d
--- /dev/null
+++ b/meta/conf/machine/include/tune-ppce5500.inc
@@ -0,0 +1,20 @@
+DEFAULTTUNE ?= "ppce5500"
+
+require conf/machine/include/powerpc/arch-powerpc64.inc
+
+TUNEVALID[e5500] = "Enable Freescale e5500 specific processor optimizations"
+TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "e5500", "-mcpu=e5500", "", d)}"
+
+AVAILTUNES += "ppce5500 ppc64e5500"
+TUNE_FEATURES_tune-ppce5500 = "m32 fpu-hard e5500"
+PACKAGE_EXTRA_ARCHS_tune-ppce5500 = "${PACKAGE_EXTRA_ARCHS_tune-powerpc} ppce5500"
+BASE_LIB_tune-ppce5500 = "lib"
+TUNE_PKGARCH_tune-ppce5500 = "ppce5500"
+
+TUNE_FEATURES_tune-ppc64e5500 = "m64 fpu-hard e5500"
+PACKAGE_EXTRA_ARCHS_tune-ppc64e5500 = "${PACKAGE_EXTRA_ARCHS_tune-powerpc64} ppc64e5500"
+BASE_LIB_tune-ppc64e5500 = "lib64"
+TUNE_PKGARCH_tune-ppc64e5500 = "ppc64e5500"
+
+# glibc configure options to get e5500 specific library (for sqrt)
+GLIBC_EXTRA_OECONF += "${@bb.utils.contains("TUNE_FEATURES", "e5500", "--with-cpu=e5500", "", d)}"
-- 
1.7.7.6



