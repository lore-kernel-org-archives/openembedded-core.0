Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RQQBy-0001Vb-RG
	for openembedded-core@lists.openembedded.org;
	Tue, 15 Nov 2011 22:05:19 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 15 Nov 2011 12:58:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,517,1315206000"; d="scan'208";a="37410714"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.35])
	by AZSMGA002.ch.intel.com with ESMTP; 15 Nov 2011 12:58:52 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 15 Nov 2011 12:58:40 -0800
Message-Id: <5ff12326cc59879d61ffb5741827f8ae02249337.1321389699.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1321389699.git.sgw@linux.intel.com>
References: <cover.1321389699.git.sgw@linux.intel.com>
In-Reply-To: <cover.1321389699.git.sgw@linux.intel.com>
References: <cover.1321389699.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 08/16] file: update to 5.09
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
X-List-Received-Date: Tue, 15 Nov 2011 21:05:19 -0000

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



