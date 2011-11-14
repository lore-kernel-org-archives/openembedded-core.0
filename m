Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RPoG0-0002D5-Pa
	for openembedded-core@lists.openembedded.org;
	Mon, 14 Nov 2011 05:34:57 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 13 Nov 2011 20:28:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="75055141"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.15.217])
	by orsmga001.jf.intel.com with ESMTP; 13 Nov 2011 20:28:17 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 13 Nov 2011 20:28:07 -0800
Message-Id: <ea91dca877e862237311259da18d75571b8d75cf.1321244755.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1321244755.git.sgw@linux.intel.com>
References: <cover.1321244755.git.sgw@linux.intel.com>
In-Reply-To: <cover.1321244755.git.sgw@linux.intel.com>
References: <cover.1321244755.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 17/21] file: update to 5.09
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
X-List-Received-Date: Mon, 14 Nov 2011 04:34:57 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../file/file/fix_version_check.patch              |   21 ++++++++++++++++++++
 .../file/{file_5.04.bb => file_5.09.bb}            |    9 +++----
 2 files changed, 25 insertions(+), 5 deletions(-)
 create mode 100644 meta/recipes-devtools/file/file/fix_version_check.patch
 rename meta/recipes-devtools/file/{file_5.04.bb => file_5.09.bb} (79%)

diff --git a/meta/recipes-devtools/file/file/fix_version_check.patch b/meta/recipes-devtools/file/file/fix_version_check.patch
new file mode 100644
index 0000000..bd24ccb
--- /dev/null
+++ b/meta/recipes-devtools/file/file/fix_version_check.patch
@@ -0,0 +1,21 @@
+Since we are cross-compiling and need to have a cover script this
+version check sees "file.real-5.09" not "file-5.09", so fix the
+sed.
+
+Upstream-Status: Inapproriate [build-specific]
+
+Signed-off-by: Saul Wold <sgw@linux.intel.com>
+
+Index: file-5.09/magic/Makefile.am
+===================================================================
+--- file-5.09.orig/magic/Makefile.am
++++ file-5.09/magic/Makefile.am
+@@ -260,7 +260,7 @@ ${MAGIC}: $(EXTRA_DIST) $(FILE_COMPILE_D
+ 	@(if expr "${FILE_COMPILE}" : '.*/.*' > /dev/null; then \
+ 	    echo "Using ${FILE_COMPILE} to generate ${MAGIC}" > /dev/null; \
+ 	  else \
+-	    v=$$(file --version | sed -e s/file-// -e q); \
++	    v=$$(file --version | sed -e s/file.real-// -e q); \
+ 	    if [ "$$v" != "${PACKAGE_VERSION}" ]; then \
+ 		echo "Cannot use the installed version of file ($$v) to"; \
+ 		echo "cross-compile file ${PACKAGE_VERSION}"; \
diff --git a/meta/recipes-devtools/file/file_5.04.bb b/meta/recipes-devtools/file/file_5.09.bb
similarity index 79%
rename from meta/recipes-devtools/file/file_5.04.bb
rename to meta/recipes-devtools/file/file_5.09.bb
index 1f9c78e..9b2f3a4 100644
--- a/meta/recipes-devtools/file/file_5.04.bb
+++ b/meta/recipes-devtools/file/file_5.09.bb
@@ -10,16 +10,15 @@ LIC_FILES_CHKSUM = "file://COPYING;beginline=2;md5=6a7382872edb68d33e1a9398b6e03
 
 DEPENDS = "zlib file-native"
 DEPENDS_virtclass-native = "zlib-native"
-PR = "r2"
+PR = "r0"
 
 SRC_URI = "ftp://ftp.astron.com/pub/file/file-${PV}.tar.gz \
-           file://stringb-compat.patch \
-           file://ge-le.patch \
+           file://fix_version_check.patch \
            file://dump \
            file://filesystems"
 
-SRC_URI[md5sum] = "accade81ff1cc774904b47c72c8aeea0"
-SRC_URI[sha256sum] = "4c9e6e7994e74cb3386374ae91b055d26ac96b9d3e82fd157ae2d62e87a4260c"
+SRC_URI[md5sum] = "6fd7cd6c4281e68fe9ec6644ce0fac6f"
+SRC_URI[sha256sum] = "bde1c9830ee6c234871778faae8277fdcf775fbb16dea63c8251e24b7c2f869c"
 
 inherit autotools
 
-- 
1.7.6.4



