Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Qi.Chen@windriver.com>) id 1TfThP-0005fA-3o
	for openembedded-core@lists.openembedded.org;
	Mon, 03 Dec 2012 11:56:36 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id qB3AgAux027902
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 3 Dec 2012 02:42:10 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.163.154) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.318.4; Mon, 3 Dec 2012 02:42:09 -0800
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 3 Dec 2012 18:42:35 +0800
Message-ID: <3da8aa341fcd5908e8d6d943c70982aca51fc50e.1354531187.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1354531187.git.Qi.Chen@windriver.com>
References: <cover.1354531187.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Cc: Zhenfeng.Zhao@windriver.com
Subject: [PATCH 4/4] libassuan: add pkgconfig support
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
X-List-Received-Date: Mon, 03 Dec 2012 10:56:38 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

Add pkgconfig support to libassuan.

[YOCTO #2453]

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../files/libassuan-add-pkgconfig-support.patch    |   57 ++++++++++++++++++++
 meta/recipes-support/libassuan/libassuan_2.0.3.bb  |    5 +-
 2 files changed, 60 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-support/libassuan/files/libassuan-add-pkgconfig-support.patch

diff --git a/meta/recipes-support/libassuan/files/libassuan-add-pkgconfig-support.patch b/meta/recipes-support/libassuan/files/libassuan-add-pkgconfig-support.patch
new file mode 100644
index 0000000..d0f3067
--- /dev/null
+++ b/meta/recipes-support/libassuan/files/libassuan-add-pkgconfig-support.patch
@@ -0,0 +1,57 @@
+Upstream-Status: Pending
+
+Add pkgconfig support to libassuan.
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+
+Index: Makefile.am
+==============================================================
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -21,11 +21,14 @@
+ ACLOCAL_AMFLAGS = -I m4
+ AUTOMAKE_OPTIONS = dist-bzip2 no-dist-gzip
+ 
++pkgconfigdir = $(libdir)/pkgconfig
++pkgconfig_DATA = assuan.pc
++
+ EXTRA_DIST = config.rpath autogen.sh README.GIT                  	\
+              ChangeLog-2011 doc/ChangeLog-2011 src/ChangeLog-2011 	\
+              tests/ChangeLog-2011 contrib/ChangeLog-2011     		\
+              build-aux/gitlog-to-changelog build-aux/git-log-footer	\
+-             build-aux/git-log-fix
++             build-aux/git-log-fix assuan.pc.in
+ 
+ SUBDIRS = m4 src doc tests
+ 
+Index: assuan.pc.in
+==============================================================
+--- /dev/null
++++ b/assuan.pc.in
+@@ -0,0 +1,12 @@
++prefix=@prefix@
++exec_prefix=@exec_prefix@
++libdir=@libdir@
++includedir=@includedir@
++
++Name: libassuan
++Description: IPC library used by GnuPG and GPGME
++Requires:
++Version: @VERSION@
++Libs: -L${libdir} -lassuan
++Libs.private: -lgpg-error
++Cflags: -I${includedir}
+Index: configure.ac
+==============================================================
+--- a/configure.ac
++++ b/configure.ac
+@@ -380,5 +380,5 @@ AC_CONFIG_FILES([doc/Makefile])
+ AC_CONFIG_FILES([tests/Makefile])
+ AC_CONFIG_FILES([src/libassuan-config], [chmod +x src/libassuan-config])
+ AC_CONFIG_FILES([src/versioninfo.rc])
+-
++AC_CONFIG_FILES([assuan.pc])
+ AC_OUTPUT
+-- 
+1.7.5.4
+
diff --git a/meta/recipes-support/libassuan/libassuan_2.0.3.bb b/meta/recipes-support/libassuan/libassuan_2.0.3.bb
index 2a8963e..f0d7c9f 100644
--- a/meta/recipes-support/libassuan/libassuan_2.0.3.bb
+++ b/meta/recipes-support/libassuan/libassuan_2.0.3.bb
@@ -10,9 +10,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=f27defe1e96c2e1ecd4e0c9be8967949 \
 
 DEPENDS = "libgpg-error"
 
-SRC_URI = "ftp://ftp.gnupg.org/gcrypt/libassuan/libassuan-${PV}.tar.bz2"
+SRC_URI = "ftp://ftp.gnupg.org/gcrypt/libassuan/libassuan-${PV}.tar.bz2 \
+	   file://libassuan-add-pkgconfig-support.patch"
 
 SRC_URI[md5sum] = "179d1918325fdb928c7bd90b8a514fc7"
 SRC_URI[sha256sum] = "bad5682374c76bcc0abb1a7a34c9557af6874a477500748e64a7d3def79cac1b"
 
-inherit autotools binconfig
+inherit autotools binconfig pkgconfig
-- 
1.7.9.5



