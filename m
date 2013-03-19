Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1UHvC2-0005NB-9N
	for openembedded-core@lists.openembedded.org;
	Tue, 19 Mar 2013 12:59:05 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 19 Mar 2013 04:41:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,872,1355126400"; d="scan'208";a="304385686"
Received: from unknown (HELO helios.amr.corp.intel.com) ([10.255.13.154])
	by orsmga002.jf.intel.com with ESMTP; 19 Mar 2013 04:41:43 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Mar 2013 11:41:39 +0000
Message-Id: <010736a549a548e9690cbe3669fdaecb94d9459e.1363692967.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1363692967.git.paul.eggleton@linux.intel.com>
References: <cover.1363692967.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1363692967.git.paul.eggleton@linux.intel.com>
References: <cover.1363692967.git.paul.eggleton@linux.intel.com>
Subject: [RFC PATCH 2/2] packagegroup-core-tools-debug: split out Eclipse packages
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 19 Mar 2013 11:59:07 -0000

Split out the packages added for Eclipse remote debugging to a separate
package group so that we can avoid pulling them in if not using Eclipse.

Fixes [YOCTO #3251].

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/core-image.bbclass                              |    2 ++
 meta/conf/local.conf.sample                                  |    1 +
 .../packagegroups/packagegroup-core-eclipse-debug.bb         |   10 ++++++++++
 .../packagegroups/packagegroup-core-tools-debug.bb           |    2 --
 meta/recipes-extended/images/core-image-lsb-sdk.bb           |    2 +-
 meta/recipes-rt/images/core-image-rt-sdk.bb                  |    2 +-
 meta/recipes-sato/images/core-image-sato-sdk.bb              |    2 +-
 7 files changed, 16 insertions(+), 5 deletions(-)
 create mode 100644 meta/recipes-core/packagegroups/packagegroup-core-eclipse-debug.bb

diff --git a/meta/classes/core-image.bbclass b/meta/classes/core-image.bbclass
index 4c70d32..86df91d 100644
--- a/meta/classes/core-image.bbclass
+++ b/meta/classes/core-image.bbclass
@@ -16,6 +16,7 @@ LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3
 # - x11-base            - X server with minimal environment
 # - x11-sato            - OpenedHand Sato environment
 # - tools-debug         - debugging tools
+# - eclipse-debug       - Eclipse remote debugging support
 # - tools-profile       - profiling tools
 # - tools-testapps      - tools usable to make some device tests
 # - tools-sdk           - SDK (C/C++ compiler, autotools, etc.)
@@ -35,6 +36,7 @@ PACKAGE_GROUP_x11 = "packagegroup-core-x11"
 PACKAGE_GROUP_x11-base = "packagegroup-core-x11-base"
 PACKAGE_GROUP_x11-sato = "packagegroup-core-x11-sato"
 PACKAGE_GROUP_tools-debug = "packagegroup-core-tools-debug"
+PACKAGE_GROUP_eclipse-debug = "packagegroup-core-eclipse-debug"
 PACKAGE_GROUP_tools-profile = "packagegroup-core-tools-profile"
 PACKAGE_GROUP_tools-testapps = "packagegroup-core-tools-testapps"
 PACKAGE_GROUP_tools-sdk = "packagegroup-core-sdk packagegroup-core-standalone-sdk-target"
diff --git a/meta/conf/local.conf.sample b/meta/conf/local.conf.sample
index 18de2dd..e1f8c5b 100644
--- a/meta/conf/local.conf.sample
+++ b/meta/conf/local.conf.sample
@@ -119,6 +119,7 @@ PACKAGE_CLASSES ?= "package_ipk"
 #                     (useful if you want to develop against libs in the image)
 #  "tools-sdk"      - add development tools (gcc, make, pkgconfig etc.)
 #  "tools-debug"    - add debugging tools (gdb, strace)
+#  "eclipse-debug"  - add Eclipse remote debugging support
 #  "tools-profile"  - add profiling tools (oprofile, exmap, lttng, valgrind)
 #  "tools-testapps" - add useful testing tools (ts_print, aplay, arecord etc.)
 #  "debug-tweaks"   - make an image suitable for development
diff --git a/meta/recipes-core/packagegroups/packagegroup-core-eclipse-debug.bb b/meta/recipes-core/packagegroups/packagegroup-core-eclipse-debug.bb
new file mode 100644
index 0000000..e7b013d
--- /dev/null
+++ b/meta/recipes-core/packagegroups/packagegroup-core-eclipse-debug.bb
@@ -0,0 +1,10 @@
+SUMMARY = "Remote debugging tools for Eclipse integration"
+LICENSE = "MIT"
+
+inherit packagegroup
+
+RDEPENDS_${PN} = "\
+    gdbserver \
+    tcf-agent \
+    openssh-sftp-server \
+    "
diff --git a/meta/recipes-core/packagegroups/packagegroup-core-tools-debug.bb b/meta/recipes-core/packagegroups/packagegroup-core-tools-debug.bb
index a6280fb..f72aae4 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-tools-debug.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-tools-debug.bb
@@ -22,8 +22,6 @@ MTRACE_libc-glibc = "libc-mtrace"
 RDEPENDS_${PN} = "\
     gdb \
     gdbserver \
-    tcf-agent \
-    openssh-sftp-server \
     strace \
     ${MTRACE} \
     "
diff --git a/meta/recipes-extended/images/core-image-lsb-sdk.bb b/meta/recipes-extended/images/core-image-lsb-sdk.bb
index da8c250..c77425f 100644
--- a/meta/recipes-extended/images/core-image-lsb-sdk.bb
+++ b/meta/recipes-extended/images/core-image-lsb-sdk.bb
@@ -4,7 +4,7 @@ DESCRIPTION = "Basic image without X support suitable for Linux Standard Base \
 (LSB) implementations. It includes the full meta-toolchain, plus development \
 headers and libraries to form a standalone SDK."
 
-IMAGE_FEATURES += "tools-sdk dev-pkgs tools-debug tools-profile tools-testapps debug-tweaks"
+IMAGE_FEATURES += "tools-sdk dev-pkgs tools-debug eclipse-debug tools-profile tools-testapps debug-tweaks"
 
 IMAGE_INSTALL += "kernel-dev"
 
diff --git a/meta/recipes-rt/images/core-image-rt-sdk.bb b/meta/recipes-rt/images/core-image-rt-sdk.bb
index 58f983f..db7d581 100644
--- a/meta/recipes-rt/images/core-image-rt-sdk.bb
+++ b/meta/recipes-rt/images/core-image-rt-sdk.bb
@@ -5,7 +5,7 @@ tools for real-time use. It includes the full meta-toolchain, development \
 headers and libraries to form a standalone SDK."
 DEPENDS = "linux-yocto-rt"
 
-IMAGE_FEATURES += "dev-pkgs tools-sdk tools-debug tools-profile tools-testapps debug-tweaks"
+IMAGE_FEATURES += "dev-pkgs tools-sdk tools-debug eclipse-debug tools-profile tools-testapps debug-tweaks"
 
 IMAGE_INSTALL += "rt-tests hwlatdetect kernel-dev"
 
diff --git a/meta/recipes-sato/images/core-image-sato-sdk.bb b/meta/recipes-sato/images/core-image-sato-sdk.bb
index 1caca40..882c2bf 100644
--- a/meta/recipes-sato/images/core-image-sato-sdk.bb
+++ b/meta/recipes-sato/images/core-image-sato-sdk.bb
@@ -5,7 +5,7 @@ core-image-sato plus meta-toolchain, development headers and libraries to \
 form a standalone SDK."
 
 IMAGE_FEATURES += "dev-pkgs tools-sdk qt4-pkgs \
-	tools-debug tools-profile tools-testapps debug-tweaks ssh-server-openssh"
+	tools-debug eclipse-debug tools-profile tools-testapps debug-tweaks ssh-server-openssh"
 
 IMAGE_INSTALL += "kernel-dev"
 
-- 
1.7.10.4



