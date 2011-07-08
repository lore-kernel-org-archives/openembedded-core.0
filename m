Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1QfBTW-0007Rz-99
	for openembedded-core@lists.openembedded.org;
	Fri, 08 Jul 2011 15:52:10 +0200
Received: by ywa12 with SMTP id 12so819733ywa.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Jul 2011 06:48:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=9Bfg2UpO+9ae64HhpajyIS+esJqFR5RlolAjRQ6z72k=;
	b=JRplOmQYmcUIYMjnZ/b5ICK2LwX6jMttGNG3HBA4/c3gkh5Zd/T7/TmKApEqwxgyHG
	DBBCUqKF7RQKFDYF5Lm5qi79OmK9/Kq4GQGvYKKzqYJhW5DZmcpSehQsRaLvO24Wx98g
	1Ifb9o8xkLhIhkLLbzEU5QLzgiAw24tWLugLA=
Received: by 10.150.165.18 with SMTP id n18mr2099076ybe.155.1310132896894;
	Fri, 08 Jul 2011 06:48:16 -0700 (PDT)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id p50sm2650140yhj.0.2011.07.08.06.48.14
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 08 Jul 2011 06:48:16 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Fri,  8 Jul 2011 13:47:45 +0000
Message-Id: <4ed38d13d68e132c90e0c41cb9584c414334e01c.1310132765.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1310132765.git.otavio@ossystems.com.br>
References: <cover.1310132765.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1310132765.git.otavio@ossystems.com.br>
References: <cover.1310132765.git.otavio@ossystems.com.br>
Subject: [PATCH 6/8] cmake: add nativesdk and target versions
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
X-List-Received-Date: Fri, 08 Jul 2011 13:52:11 -0000

Adds a recipe that provides the nativesdk and target versions of
CMake.

This recipe is based on code from OpenEmbeeded (rev
b1f2e1501c19540617a829b37415c0616101c7ad).

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 .../cmake/cmake/dont-run-cross-binaries.patch      |   22 ++++++++++
 meta/recipes-devtools/cmake/cmake_2.8.3.bb         |   45 ++++++++++++++++++++
 2 files changed, 67 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-devtools/cmake/cmake/dont-run-cross-binaries.patch
 create mode 100644 meta/recipes-devtools/cmake/cmake_2.8.3.bb

diff --git a/meta/recipes-devtools/cmake/cmake/dont-run-cross-binaries.patch b/meta/recipes-devtools/cmake/cmake/dont-run-cross-binaries.patch
new file mode 100644
index 0000000..4eb1794
--- /dev/null
+++ b/meta/recipes-devtools/cmake/cmake/dont-run-cross-binaries.patch
@@ -0,0 +1,22 @@
+cmake: don't run cross-binaries on host machine
+
+When doing the cross build we obviously cannot run those binaries on
+host since they can be binary incompatible.
+
+Upstream-Status: Inappropriate [embedded specific]
+
+Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
+
+diff -ru cmake-2.8.2.orig/CMakeLists.txt cmake-2.8.2/CMakeLists.txt
+--- cmake-2.8.2.orig/CMakeLists.txt	2010-07-28 00:48:42.000000000 +0200
++++ cmake-2.8.2/CMakeLists.txt	2010-07-28 01:05:17.000000000 +0200
+@@ -518,7 +518,8 @@
+ 
+ # build the remaining subdirectories
+ ADD_SUBDIRECTORY(Source)
+-ADD_SUBDIRECTORY(Utilities)
++# Come on! Running the cross-binaries on host is not a good idea.
++#ADD_SUBDIRECTORY(Utilities)
+ ADD_SUBDIRECTORY(Tests)
+ 
+ # add a test
diff --git a/meta/recipes-devtools/cmake/cmake_2.8.3.bb b/meta/recipes-devtools/cmake/cmake_2.8.3.bb
new file mode 100644
index 0000000..d1048ed
--- /dev/null
+++ b/meta/recipes-devtools/cmake/cmake_2.8.3.bb
@@ -0,0 +1,45 @@
+require cmake.inc
+
+inherit cmake
+
+DEPENDS += "curl expat zlib libarchive ncurses"
+
+PR = "${INC_PR}.0"
+
+SRC_URI += "file://dont-run-cross-binaries.patch"
+
+SRC_URI[md5sum] = "a76a44b93acf5e3badda9de111385921"
+SRC_URI[sha256sum] = "689ed02786b5cefa5515c7716784ee82a82e8ece6be5a3d629ac3cc0c05fc288"
+
+# Strip ${prefix} from ${docdir}, set result into docdir_stripped
+python () {
+    prefix=bb.data.getVar("prefix", d, 1)
+    docdir=bb.data.getVar("docdir", d, 1)
+
+    if not docdir.startswith(prefix):
+	raise bb.build.FuncFailed('docdir must contain prefix as its prefix')
+
+    docdir_stripped = docdir[len(prefix):]
+    if len(docdir_stripped) > 0 and docdir_stripped[0] == '/':
+	docdir_stripped = docdir_stripped[1:]
+
+    bb.data.setVar("docdir_stripped", docdir_stripped, d)
+}
+
+EXTRA_OECMAKE=" \
+    -DCMAKE_DOC_DIR=${docdir_stripped}/cmake-${CMAKE_MAJOR_VERSION} \
+    -DCMAKE_USE_SYSTEM_LIBRARIES=1 \
+    -DKWSYS_CHAR_IS_SIGNED=1 \
+    ${@base_contains('DISTRO_FEATURES', 'largefile', '-DKWSYS_LFS_WORKS=1', '-DKWSYS_LFS_DISABLE=1', d)} \
+"
+
+# FIXME: Hack due gcc-crosssdk not being able to detect those automatically
+CXXFLAGS_virtclass-nativesdk += " \
+   -I${STAGING_DIR_HOST}${SDKPATHNATIVE}/usr/include/c++ \
+   -I${STAGING_DIR_HOST}${SDKPATHNATIVE}/usr/include/c++/${TARGET_SYS} \
+   "
+
+FILES_${PN} += "${datadir}/cmake-${CMAKE_MAJOR_VERSION}"
+FILES_${PN}-doc += "${docdir}/cmake-${CMAKE_MAJOR_VERSION}"
+
+BBCLASSEXTEND = "nativesdk"
-- 
1.7.2.5



