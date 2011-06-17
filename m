Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1QXaSk-0004fo-PK
	for openembedded-core@lists.openembedded.org;
	Fri, 17 Jun 2011 16:55:58 +0200
Received: by mail-gy0-f175.google.com with SMTP id 5so806330gyd.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jun 2011 07:52:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:sender:from:to:cc:subject:date:message-id
	:x-mailer:in-reply-to:references:in-reply-to:references;
	bh=Gh5QahxebJ+Qe0GTPEqAfUU53Gsb6U9K9KvTNlRnXkI=;
	b=WGM2YJVpNsp4Z/dX2P8vO/5zI95/kfgigLaYL69l5yNrYdbIDKpAkM3r/DRoC0MQG3
	cnOODq/I49IvFsqFNmW/YJJp/FsXptr7EXc+RYTyfFbvexavk6YUrx00oxD6W36IwyZs
	XTh2g382CUER9LogJFDoficKDc+CG4OT03duA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references;
	b=FMQgbVGD+rFGxJ2BlQdgNXY3YHyJ4V/SAtAYZ08ISLg5iZEwxS3gQKb6e5YP+tyLyf
	kyssx/cebF4gAD895elgP3fFhzl9+YpNFvESxElu/yXefKzbTYC86I8z49xkn1zMfLI0
	Wcp6zHAv6buHWwXF1/1ZTwo2UZjZ9oue8rC38=
Received: by 10.236.152.9 with SMTP id c9mr3796266yhk.38.1308322350985;
	Fri, 17 Jun 2011 07:52:30 -0700 (PDT)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id k10sm1754092yhj.50.2011.06.17.07.52.28
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 17 Jun 2011 07:52:30 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Fri, 17 Jun 2011 14:51:43 +0000
Message-Id: <f4239a4c1ed0d18dc8db93ea8c140587722843bc.1308322247.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1308322247.git.otavio@ossystems.com.br>
References: <cover.1308322247.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1308322247.git.otavio@ossystems.com.br>
References: <cover.1308322247.git.otavio@ossystems.com.br>
Subject: [PATCH 9/9] cmake: add nativesdk and target versions
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
X-List-Received-Date: Fri, 17 Jun 2011 14:55:59 -0000

Adds a recipe that provides the nativesdk and target versions of
CMake.

This recipe is based on code from OpenEmbeeded (rev
b1f2e1501c19540617a829b37415c0616101c7ad).

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 .../cmake/cmake/dont-run-cross-binaries.patch      |   22 +++++++++
 meta/recipes-devtools/cmake/cmake_2.8.3.bb         |   48 ++++++++++++++++++++
 2 files changed, 70 insertions(+), 0 deletions(-)
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
index 0000000..93c98c3
--- /dev/null
+++ b/meta/recipes-devtools/cmake/cmake_2.8.3.bb
@@ -0,0 +1,48 @@
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
+# This is compiler & target dependant, but it seems cmake does not in fact use this value.
+    -DKWSYS_CHAR_IS_SIGNED=1 \
+# This disables large file support. Hopefully nobody processes >2G files on the target.
+# If you want to enable this, add -DWKSYS_LFS_WORKS=1
+    -DKWSYS_LFS_DISABLE=1 \
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



