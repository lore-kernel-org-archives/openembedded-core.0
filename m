Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Wenzong.Fan@windriver.com>) id 1QXVJl-0001kt-3A
	for openembedded-core@lists.openembedded.org;
	Fri, 17 Jun 2011 11:26:21 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p5H9MqlP023299
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jun 2011 02:22:52 -0700 (PDT)
Received: from localhost.localdomain (128.224.162.28) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.1.255.0; Fri, 17 Jun 2011 02:22:51 -0700
From: <wenzong.fan@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 17 Jun 2011 17:19:14 +0800
Message-ID: <1a80a4e3bd1868367784ed77e7912935eb30748b.1308302102.git.wenzong.fan@windriver.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1308302102.git.wenzong.fan@windriver.com>
References: <cover.1308302102.git.wenzong.fan@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] ccache: Integrate ccache-native
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
X-List-Received-Date: Fri, 17 Jun 2011 09:26:21 -0000
Content-Type: text/plain

From: Wenzong Fan <wenzong.fan@windriver.com>

1) Add ccache as a native tool, for getting it built automatically make
it as the dependency of bzip2; Also, the ccache will be included by SDK
images;

2) Set CCACHE on a per recipe basis and add task 'mkccachedir' to create
the CCACHE_DIR while start a package building;

3) Remove the duplicate 'ccache.inc' from 'meta/class/'.

Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
---
 meta/classes/base.bbclass                    |    1 +
 meta/classes/ccache.bbclass                  |   21 +++++++++++++++++++++
 meta/classes/ccache.inc                      |   11 -----------
 meta/conf/bitbake.conf                       |    1 +
 meta/recipes-core/tasks/task-core-sdk.bb     |    1 +
 meta/recipes-devtools/ccache/ccache.inc      |   16 ++++++++++++++++
 meta/recipes-devtools/ccache/ccache_3.1.5.bb |    8 ++++++++
 meta/recipes-extended/bzip2/bzip2_1.0.6.bb   |    2 ++
 8 files changed, 50 insertions(+), 11 deletions(-)
 create mode 100644 meta/classes/ccache.bbclass
 delete mode 100644 meta/classes/ccache.inc
 create mode 100644 meta/recipes-devtools/ccache/ccache.inc
 create mode 100644 meta/recipes-devtools/ccache/ccache_3.1.5.bb

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index 119b052..a329b4e 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -2,6 +2,7 @@ BB_DEFAULT_TASK ?= "build"
 
 inherit patch
 inherit staging
+inherit ccache
 
 inherit mirrors
 inherit utils
diff --git a/meta/classes/ccache.bbclass b/meta/classes/ccache.bbclass
new file mode 100644
index 0000000..be37c18
--- /dev/null
+++ b/meta/classes/ccache.bbclass
@@ -0,0 +1,21 @@
+# Make ${CCACHE_DIR} if it is not existing
+
+python ccache_do_mkccachedir(){
+	import os
+
+	ccache = bb.data.getVar('CCACHE', d, True)
+	ccache_dir = bb.data.getVar('CCACHE_DIR', d, True)
+	if len(ccache) == 0 or len(ccache_dir) == 0:
+		return
+
+	try:
+		if not os.path.isdir(ccache_dir):
+			bb.note("Creating " + ccache_dir)
+			os.makedirs(ccache_dir)
+	except bb.fetch2.BBFetchException, e:
+		raise bb.build.FuncFailed(e)
+}
+
+addtask mkccachedir before do_configure
+
+EXPORT_FUNCTIONS do_mkccachedir
diff --git a/meta/classes/ccache.inc b/meta/classes/ccache.inc
deleted file mode 100644
index d830a1b..0000000
--- a/meta/classes/ccache.inc
+++ /dev/null
@@ -1,11 +0,0 @@
-# Make ccache use a TMPDIR specific ccache directory if using the crosscompiler,
-# since it isn't likely to be useful with any other toolchain than the one we just
-# built, and would otherwise push more useful things out of the default cache.
-
-CCACHE_DIR_TARGET = "${TMPDIR}/ccache"
-
-python () {
-    if not bb.data.inherits_class('native', d) and not bb.data.inherits_class('cross', d):
-        bb.data.setVar('CCACHE_DIR', '${CCACHE_DIR_TARGET}', d)
-        bb.data.setVarFlag('CCACHE_DIR', 'export', '1', d)
-}
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 6d8a674..64b3651 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -391,6 +391,7 @@ export PATH
 CCACHE = "${@bb.which(bb.data.getVar('PATH', d, 1), 'ccache') and 'ccache '}"
 TOOLCHAIN_OPTIONS = " --sysroot=${STAGING_DIR_TARGET}"
 
+export CCACHE_DIR = "${TMPDIR}/ccache/${TARGET_SYS}/${PN}"
 export CC = "${CCACHE}${HOST_PREFIX}gcc ${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS}"
 export CXX = "${CCACHE}${HOST_PREFIX}g++ ${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS}"
 export F77 = "${CCACHE}${HOST_PREFIX}g77 ${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS}"
diff --git a/meta/recipes-core/tasks/task-core-sdk.bb b/meta/recipes-core/tasks/task-core-sdk.bb
index 4aee0c2..52fdd75 100644
--- a/meta/recipes-core/tasks/task-core-sdk.bb
+++ b/meta/recipes-core/tasks/task-core-sdk.bb
@@ -25,6 +25,7 @@ RDEPENDS_task-core-sdk = "\
     coreutils \
     cpp \
     cpp-symlinks \
+    ccache \
     diffutils \
     gcc \
     gcc-symlinks \
diff --git a/meta/recipes-devtools/ccache/ccache.inc b/meta/recipes-devtools/ccache/ccache.inc
new file mode 100644
index 0000000..e9f7344
--- /dev/null
+++ b/meta/recipes-devtools/ccache/ccache.inc
@@ -0,0 +1,16 @@
+SUMMARY = "a fast C/C++ compiler cache"
+DESCRIPTION = "ccache is a compiler cache. It speeds up recompilation \
+by caching the result of previous compilations and detecting when the \
+same compilation is being done again. Supported languages are C, C\+\+, \
+Objective-C and Objective-C++."
+HOMEPAGE = "http://ccache.samba.org"
+SECTION = "devel"
+LICENSE = "GPLv3+"
+
+SRC_URI = "http://samba.org/ftp/ccache/ccache-${PV}.tar.gz"
+
+inherit autotools
+
+BBCLASSEXTEND = "native"
+
+TARGET_CC_ARCH += "${LDFLAGS}"
diff --git a/meta/recipes-devtools/ccache/ccache_3.1.5.bb b/meta/recipes-devtools/ccache/ccache_3.1.5.bb
new file mode 100644
index 0000000..9a967b2
--- /dev/null
+++ b/meta/recipes-devtools/ccache/ccache_3.1.5.bb
@@ -0,0 +1,8 @@
+require ccache.inc
+
+PR = "r0"
+LICENSE = "GPLv3+"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=80e92ec45d4fca91f127864fb9e5d932"
+
+SRC_URI[md5sum] = "b1a9684828eae68382d6afc98ce80d24"
+SRC_URI[sha256sum] = "54afc35c672ce451e04a478cfc0eb74c1ba184e27ef24881206602aa0eb94d63"
diff --git a/meta/recipes-extended/bzip2/bzip2_1.0.6.bb b/meta/recipes-extended/bzip2/bzip2_1.0.6.bb
index f5b9ac1..4d445a5 100644
--- a/meta/recipes-extended/bzip2/bzip2_1.0.6.bb
+++ b/meta/recipes-extended/bzip2/bzip2_1.0.6.bb
@@ -6,6 +6,8 @@ HOMEPAGE = "http://www.bzip.org/"
 SECTION = "console/utils"
 LICENSE = "bzip2"
 LIC_FILES_CHKSUM = "file://LICENSE;beginline=8;endline=37;md5=40d9d1eb05736d1bfc86cfdd9106e6b2"
+
+DEPENDS = "ccache-native"
 PR = "r3"
 
 SRC_URI = "http://www.bzip.org/${PV}/${BPN}-${PV}.tar.gz \
-- 
1.7.0.4



