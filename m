Return-Path: <alejandro.delcastillo@ni.com>
Received: from ni.com (skprod3.natinst.com [130.164.80.24])
	by mail.openembedded.org (Postfix) with ESMTP id 2E1A6774D8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jan 2017 22:38:58 +0000 (UTC)
Received: from us-aus-exch1.ni.corp.natinst.com
	(us-aus-exch1.ni.corp.natinst.com [130.164.68.11])
	by us-aus-skprod3.natinst.com (8.15.0.59/8.15.0.59) with ESMTPS id
	v0RMcwIe001323
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jan 2017 16:38:58 -0600
Received: from us-aus-exch7.ni.corp.natinst.com (130.164.68.17) by
	us-aus-exch1.ni.corp.natinst.com (130.164.68.11) with Microsoft SMTP
	Server (TLS) id 15.0.1156.6; Fri, 27 Jan 2017 16:38:58 -0600
Received: from us-aus-exhub1.ni.corp.natinst.com (130.164.68.41) by
	us-aus-exch7.ni.corp.natinst.com (130.164.68.17) with Microsoft SMTP
	Server (TLS) id 15.0.1156.6; Fri, 27 Jan 2017 16:38:58 -0600
Received: from delcastillo2.amer.corp.natinst.com (130.164.49.7) by
	us-aus-exhub1.ni.corp.natinst.com (130.164.68.41) with Microsoft SMTP
	Server
	id 15.0.1156.6 via Frontend Transport; Fri, 27 Jan 2017 16:38:58 -0600
From: Alejandro del Castillo <alejandro.delcastillo@ni.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 27 Jan 2017 16:38:57 -0600
Message-ID: <1485556737-13483-1-git-send-email-alejandro.delcastillo@ni.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2017-01-27_16:, , signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
	suspectscore=14
	malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
	adjust=0 reason=mlx scancount=1 engine=8.0.1-1612050000
	definitions=main-1701270218
Subject: [PATCH] libsolv: split libsolvext into it's own pkg-config
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 27 Jan 2017 22:39:02 -0000
Content-Type: text/plain

Opkg only depends on libsolv proper, splitting libsolv-ext pkg-config
reduces opkg dependencies.

Signed-off-by: Alejandro del Castillo <alejandro.delcastillo@ni.com>
---
 ...-libsolvext-into-it-s-own-pkg-config-file.patch | 67 ++++++++++++++++++++++
 meta/recipes-extended/libsolv/libsolv_0.6.24.bb    |  1 +
 2 files changed, 68 insertions(+)
 create mode 100644 meta/recipes-extended/libsolv/libsolv/0001-Split-libsolvext-into-it-s-own-pkg-config-file.patch

diff --git a/meta/recipes-extended/libsolv/libsolv/0001-Split-libsolvext-into-it-s-own-pkg-config-file.patch b/meta/recipes-extended/libsolv/libsolv/0001-Split-libsolvext-into-it-s-own-pkg-config-file.patch
new file mode 100644
index 0000000..9d9b234
--- /dev/null
+++ b/meta/recipes-extended/libsolv/libsolv/0001-Split-libsolvext-into-it-s-own-pkg-config-file.patch
@@ -0,0 +1,67 @@
+From 0830ceffb32bdf61dab2a598b9e77f65d089074f Mon Sep 17 00:00:00 2001
+From: Alejandro del Castillo <alejandro.delcastillo@ni.com>
+Date: Fri, 27 Jan 2017 16:10:14 -0600
+Subject: [PATCH] Split libsolvext into it's own pkg-config file
+
+Upstream-Status: Submitted (https://github.com/openSUSE/libsolv/pull/177)
+
+Signed-off-by: Alejandro del Castillo <alejandro.delcastillo@ni.com>
+---
+ CMakeLists.txt                    | 4 +++-
+ libsolv.pc.in                     | 4 ++--
+ libsolv.pc.in => libsolvext.pc.in | 4 ++--
+ 3 files changed, 7 insertions(+), 5 deletions(-)
+ copy libsolv.pc.in => libsolvext.pc.in (62%)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 82034e0..0777ed9 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -384,9 +384,11 @@ MACRO (SPECFILE)
+ ENDMACRO (SPECFILE)
+ 
+ MACRO (PCFILE)
+-  MESSAGE (STATUS "Writing pkg-config file...")
++  MESSAGE (STATUS "Writing pkg-config files...")
+   CONFIGURE_FILE (${CMAKE_SOURCE_DIR}/libsolv.pc.in ${CMAKE_BINARY_DIR}/libsolv.pc @ONLY)
+   INSTALL( FILES ${CMAKE_BINARY_DIR}/libsolv.pc DESTINATION ${LIB_INSTALL_DIR}/pkgconfig )
++  CONFIGURE_FILE (${CMAKE_SOURCE_DIR}/libsolvext.pc.in ${CMAKE_BINARY_DIR}/libsolvext.pc @ONLY)
++  INSTALL( FILES ${CMAKE_BINARY_DIR}/libsolvext.pc DESTINATION ${LIB_INSTALL_DIR}/pkgconfig )
+ ENDMACRO (PCFILE)
+ 
+ SPECFILE ()
+diff --git a/libsolv.pc.in b/libsolv.pc.in
+index c82dfc4..40a8623 100644
+--- a/libsolv.pc.in
++++ b/libsolv.pc.in
+@@ -2,7 +2,7 @@ libdir=@LIB_INSTALL_DIR@
+ includedir=@INCLUDE_INSTALL_DIR@
+ 
+ Name: libsolv
+-Description: Library for solving packages and reading repositories
++Description: Library for solving packages
+ Version: @VERSION@
+-Libs: -L${libdir} -lsolvext -lsolv
++Libs: -L${libdir} -lsolv
+ Cflags: -I${includedir}
+diff --git a/libsolv.pc.in b/libsolvext.pc.in
+similarity index 62%
+copy from libsolv.pc.in
+copy to libsolvext.pc.in
+index c82dfc4..6395f39 100644
+--- a/libsolv.pc.in
++++ b/libsolvext.pc.in
+@@ -1,8 +1,8 @@
+ libdir=@LIB_INSTALL_DIR@
+ includedir=@INCLUDE_INSTALL_DIR@
+ 
+-Name: libsolv
+-Description: Library for solving packages and reading repositories
++Name: libsolvext
++Description: Library for reading repositories
+ Version: @VERSION@
+ Libs: -L${libdir} -lsolvext -lsolv
+ Cflags: -I${includedir}
+-- 
+2.7.4
+
diff --git a/meta/recipes-extended/libsolv/libsolv_0.6.24.bb b/meta/recipes-extended/libsolv/libsolv_0.6.24.bb
index a5d7b5a..6de38b5 100644
--- a/meta/recipes-extended/libsolv/libsolv_0.6.24.bb
+++ b/meta/recipes-extended/libsolv/libsolv_0.6.24.bb
@@ -8,6 +8,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.BSD;md5=62272bd11c97396d4aaf1c41bc11f7d8"
 DEPENDS = "expat zlib"
 
 SRC_URI = "git://github.com/openSUSE/libsolv.git \
+           file://0001-Split-libsolvext-into-it-s-own-pkg-config-file.patch \
           "
 SRC_URI_append_libc-musl = " file://0001-Add-fallback-fopencookie-implementation.patch"
 
-- 
2.7.4


