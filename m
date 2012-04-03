Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1SF9q4-0001lz-AF
	for openembedded-core@lists.openembedded.org;
	Tue, 03 Apr 2012 21:56:24 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q33JlEEl029700
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 3 Apr 2012 12:47:14 -0700 (PDT)
Received: from localhost.localdomain (172.25.34.110) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.1.255.0; Tue, 3 Apr 2012 12:47:13 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 3 Apr 2012 14:47:02 -0500
Message-ID: <ae6adff67aec52a7bf1c60d0dc47cb50a7db3be2.1333481624.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1333481624.git.mark.hatle@windriver.com>
References: <cover.1333481624.git.mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.110]
Subject: [PATCH 2/7] conf/machine/include: Cleanup IA tunings to match README
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
X-List-Received-Date: Tue, 03 Apr 2012 19:56:24 -0000
Content-Type: text/plain

We perform a basic cleanup of the IA32 architecture and related
tunings in order to match the rules and descriptions within the
new tuning README file.

A number of small issues were corrected in the "c3" tuning to
bring it inline with the README.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/conf/machine/include/ia32/README        |   24 ++++++++++++++++++++++++
 meta/conf/machine/include/ia32/arch-ia32.inc |   26 ++++++++++++++------------
 meta/conf/machine/include/tune-c3.inc        |   12 +++++++++---
 meta/conf/machine/include/tune-core2.inc     |   16 +++++++++-------
 meta/conf/machine/include/tune-i586.inc      |    8 +++-----
 5 files changed, 59 insertions(+), 27 deletions(-)
 create mode 100644 meta/conf/machine/include/ia32/README

diff --git a/meta/conf/machine/include/ia32/README b/meta/conf/machine/include/ia32/README
new file mode 100644
index 0000000..8f80a5b
--- /dev/null
+++ b/meta/conf/machine/include/ia32/README
@@ -0,0 +1,24 @@
+2012/03/30 - Mark Hatle <mark.hatle@windriver.com>
+ - Initial version
+
+Most of the items for the IA architecture are defined in the single 
+arch-ia32 file.
+
+Three ABIs are define, m32, mx32 and m64.
+
+The following is the list of ia32 specific variables:
+
+X86ARCH32 - This is the 32-bit architecture GNU canonical arch, TUNE_ARCH.
+
+X86ARCH64 - This is the 64-bit architecture GNU canonical arch, TUNE_ARCH.
+
+The TUNE_PKGARCH is defined as follows:
+
+TUNE_PKGARCH = ${TUNE_PKGARCH_tune-${DEFAULTTUNE}}
+
+The package architecture for 32-bit targets is historical and generally
+set to to match the core compatible processor type, i.e. i386.
+
+For 64-bit architectures, the architecture is expected to end in '_64'.
+
+If the x32 ABI is used, then the _64 is further extended with a '_x32'.
diff --git a/meta/conf/machine/include/ia32/arch-ia32.inc b/meta/conf/machine/include/ia32/arch-ia32.inc
index 0931c26..a5dae88 100644
--- a/meta/conf/machine/include/ia32/arch-ia32.inc
+++ b/meta/conf/machine/include/ia32/arch-ia32.inc
@@ -7,6 +7,8 @@ TARGET_FPU ?= ""
 X86ARCH32 ?= "i586"
 X86ARCH64 ?= "x86_64"
 
+TUNE_PKGARCH = "${TUNE_PKGARCH_tune-${DEFAULTTUNE}}"
+
 # ELF32 ABI
 TUNEVALID[m32] = "IA32 ELF32 standard ABI"
 TUNECONFLICTS[m32] = "m64 mx32"
@@ -29,21 +31,21 @@ TUNECONFLICT[m64] = "m32 mx32"
 TUNE_ARCH .= "${@bb.utils.contains("TUNE_FEATURES", "m64", "${X86ARCH64}", "" ,d)}"
 TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "m64", "-m64", "", d)}"
 
-TUNE_PKGARCH ?= "${@bb.utils.contains("TUNE_FEATURES", "m32", "x86", "x86_64", d)}"
-
 # Default Tune configurations
 AVAILTUNES += "x86"
-TUNE_FEATURES_tune-x86 ?= "m32"
-BASE_LIB_tune-x86 ?= "lib"
-PACKAGE_EXTRA_ARCHS_tune-x86 = "x86"
+TUNE_FEATURES_tune-x86 = "m32"
+BASE_LIB_tune-x86 = "lib"
+TUNE_PKGARCH_tune-x86 = "x86"
+PACKAGE_EXTRA_ARCHS_tune-x86 = "${TUNE_PKGARCH_tune-x86}"
 
 AVAILTUNES += "x86-64"
-TUNE_FEATURES_tune-x86-64 ?= "m64"
-BASE_LIB_tune-x86-64 ?= "lib64"
-PACKAGE_EXTRA_ARCHS_tune-x86-64 = "x86_64"
+TUNE_FEATURES_tune-x86-64 = "m64"
+BASE_LIB_tune-x86-64 = "lib64"
+TUNE_PKGARCH_tune-x86-64 = "x86_64"
+PACKAGE_EXTRA_ARCHS_tune-x86-64 = "${TUNE_PKGARCH_tune-x86-64}"
 
 AVAILTUNES += "x86-64-x32"
-TUNE_FEATURES_tune-x86-64-x32 ?= "mx32"
-BASE_LIB_tune-x86-64-x32 ?= "libx32"
-PACKAGE_EXTRA_ARCHS_tune-x86-64-x32 = "x86_64_x32"
-TUNE_PKGARCH .= "${@bb.utils.contains("TUNE_FEATURES", "mx32", "_x32", "", d)}"
+TUNE_FEATURES_tune-x86-64-x32 = "mx32"
+BASE_LIB_tune-x86-64-x32 = "libx32"
+TUNE_PKGARCH_tune-x86-64-x32 = "x86_64_x32"
+PACKAGE_EXTRA_ARCHS_tune-x86-64-x32 = "${TUNE_PKGARCH_tune-x86-64-x32}"
diff --git a/meta/conf/machine/include/tune-c3.inc b/meta/conf/machine/include/tune-c3.inc
index e1569f5..06fac8f 100644
--- a/meta/conf/machine/include/tune-c3.inc
+++ b/meta/conf/machine/include/tune-c3.inc
@@ -1,6 +1,12 @@
 require conf/machine/include/ia32/arch-ia32.inc
 
-TUNE_PKGARCH = "i586"
+TUNEVALID[c3] = "VIA Cyrix III or VIA C3 specific optimizations"
+TUNECONFLICT[c3] = "m64 mx32"
+TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "c3", "-march=c3 -mtune=c3", "", d)}"
 
-TUNE_CCARGS = "-march=c3 -mtune=c3"
-PACKAGE_EXTRA_ARCHS = "i386 i486 i586"
+AVAILTUNES += "c3"
+TUNE_FEATURES_tune-c3 = "${TUNE_FEATURES_tune-x86} c3"
+BASE_LIBS_tune-c3 = "${BASE_LIB_tune-x86}"
+# The following should likely be something other then i586...
+TUNE_PKGARCH_tune-c3 = "i586"
+PACKAGE_EXTRA_ARCHS_tune-c3 = "${PACKAGE_EXTRA_ARCHS_tune-x86} i386 i486 i586"
diff --git a/meta/conf/machine/include/tune-core2.inc b/meta/conf/machine/include/tune-core2.inc
index 7cde511..338ba73 100644
--- a/meta/conf/machine/include/tune-core2.inc
+++ b/meta/conf/machine/include/tune-core2.inc
@@ -1,5 +1,4 @@
 DEFAULTTUNE ?= "core2"
-TUNE_PKGARCH ?= "${@bb.utils.contains("TUNE_FEATURES", "m32", "core2", "core2_64", d)}"
 
 require conf/machine/include/tune-i586.inc
 
@@ -9,16 +8,19 @@ TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "core2", "-march=core2 -ms
 
 # Extra tune selections
 AVAILTUNES += "core2"
-TUNE_FEATURES_tune-core2 ?= "${TUNE_FEATURES_tune-x86} core2"
-BASE_LIB_tune-core2 ?= "lib"
+TUNE_FEATURES_tune-core2 = "${TUNE_FEATURES_tune-x86} core2"
+BASE_LIB_tune-core2 = "lib"
+TUNE_PKGARCH_tune-core2 = "core2"
 PACKAGE_EXTRA_ARCHS_tune-core2 = "${PACKAGE_EXTRA_ARCHS_tune-x86} i386 i486 i586 i686 core2"
 
 AVAILTUNES += "core2-64"
-TUNE_FEATURES_tune-core2-64 ?= "${TUNE_FEATURES_tune-x86-64} core2"
-BASE_LIB_tune-core2-64 ?= "lib64"
+TUNE_FEATURES_tune-core2-64 = "${TUNE_FEATURES_tune-x86-64} core2"
+BASE_LIB_tune-core2-64 = "lib64"
+TUNE_PKGARCH_tune-core2-64 = "core2_64"
 PACKAGE_EXTRA_ARCHS_tune-core2-64 = "${PACKAGE_EXTRA_ARCHS_tune-x86-64} core2_64"
 
 AVAILTUNES += "core2-64-x32"
-TUNE_FEATURES_tune-core2-64-x32 ?= "${TUNE_FEATURES_tune-x86-64-x32} core2"
-BASE_LIB_tune-core2-64-x32 ?= "libx32"
+TUNE_FEATURES_tune-core2-64-x32 = "${TUNE_FEATURES_tune-x86-64-x32} core2"
+BASE_LIB_tune-core2-64-x32 = "libx32"
+TUNE_PKGARCH_tune-core2-64-x32 = "core2_64_x32"
 PACKAGE_EXTRA_ARCHS_tune-core2-64-x32 = "${PACKAGE_EXTRA_ARCHS_tune-x86-64-x32} core2_64_x32"
diff --git a/meta/conf/machine/include/tune-i586.inc b/meta/conf/machine/include/tune-i586.inc
index a40ce18..afa9c92 100644
--- a/meta/conf/machine/include/tune-i586.inc
+++ b/meta/conf/machine/include/tune-i586.inc
@@ -1,6 +1,4 @@
 DEFAULTTUNE ?= "i586"
-TUNE_PKGARCH_TMP = "${@bb.utils.contains("TUNE_FEATURES", "m32", "x86", "x86_64", d)}"
-TUNE_PKGARCH ?= "${@bb.utils.contains("TUNE_FEATURES", "i586", "i586", TUNE_PKGARCH_TMP, d)}"
 
 require conf/machine/include/ia32/arch-ia32.inc
 
@@ -10,7 +8,7 @@ TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "i586", "-march=i586", "",
 
 # Extra tune selections
 AVAILTUNES += "i586"
-TUNE_FEATURES_tune-i586 ?= "${TUNE_FEATURES_tune-x86} i586"
-BASE_LIB_tune-i586 ?= "lib"
+TUNE_FEATURES_tune-i586 = "${TUNE_FEATURES_tune-x86} i586"
+BASE_LIB_tune-i586 = "lib"
+TUNE_PKGARCH_tune-i586 = "i586"
 PACKAGE_EXTRA_ARCHS_tune-i586 = "${PACKAGE_EXTRA_ARCHS_tune-x86} i386 i486 i586"
-
-- 
1.7.1



