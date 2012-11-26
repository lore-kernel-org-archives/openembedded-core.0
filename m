Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Qi.Chen@windriver.com>) id 1TcvKh-000583-KE
	for openembedded-core@lists.openembedded.org;
	Mon, 26 Nov 2012 10:50:35 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id qAQ9aJ2V018698
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Nov 2012 01:36:19 -0800 (PST)
Received: from chenqi-OptiPlex-760.corp.ad.wrs.com (128.224.163.154) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.318.4; Mon, 26 Nov 2012 01:36:18 -0800
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 26 Nov 2012 17:36:33 +0800
Message-ID: <0e1a7142878a4da2e94f2194ed922f5bb27c89c2.1353582422.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1353582422.git.Qi.Chen@windriver.com>
References: <cover.1353582422.git.Qi.Chen@windriver.com>
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
X-List-Received-Date: Mon, 26 Nov 2012 09:50:36 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

Add pkgconfig support for libassuan

[YOCTO# 2453]

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../files/libassuan-add-pkgconfig-support.patch    |   33 ++++++++++++++++++++
 meta/recipes-support/libassuan/libassuan_2.0.3.bb  |   10 ++++--
 2 files changed, 41 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-support/libassuan/files/libassuan-add-pkgconfig-support.patch

diff --git a/meta/recipes-support/libassuan/files/libassuan-add-pkgconfig-support.patch b/meta/recipes-support/libassuan/files/libassuan-add-pkgconfig-support.patch
new file mode 100644
index 0000000..e086501
--- /dev/null
+++ b/meta/recipes-support/libassuan/files/libassuan-add-pkgconfig-support.patch
@@ -0,0 +1,33 @@
+Upstream-Status: Inappropriate [distribution]
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+
+Index: configure.ac
+=======================================================================
+--- a/configure.ac
++++ b/configure.ac
+@@ -380,5 +380,5 @@ AC_CONFIG_FILES([doc/Makefile])
+ AC_CONFIG_FILES([tests/Makefile])
+ AC_CONFIG_FILES([src/libassuan-config], [chmod +x src/libassuan-config])
+ AC_CONFIG_FILES([src/versioninfo.rc])
+-
++AC_CONFIG_FILES([src/assuan.pc])
+ AC_OUTPUT
+
+Index: src/assuan.pc.in
+=======================================================================
+--- /dev/null
++++ b/src/assuan.pc.in
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
diff --git a/meta/recipes-support/libassuan/libassuan_2.0.3.bb b/meta/recipes-support/libassuan/libassuan_2.0.3.bb
index 2a8963e..330f573 100644
--- a/meta/recipes-support/libassuan/libassuan_2.0.3.bb
+++ b/meta/recipes-support/libassuan/libassuan_2.0.3.bb
@@ -10,9 +10,15 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=f27defe1e96c2e1ecd4e0c9be8967949 \
 
 DEPENDS = "libgpg-error"
 
-SRC_URI = "ftp://ftp.gnupg.org/gcrypt/libassuan/libassuan-${PV}.tar.bz2"
+SRC_URI = "ftp://ftp.gnupg.org/gcrypt/libassuan/libassuan-${PV}.tar.bz2 \
+	   file://libassuan-add-pkgconfig-support.patch"
 
 SRC_URI[md5sum] = "179d1918325fdb928c7bd90b8a514fc7"
 SRC_URI[sha256sum] = "bad5682374c76bcc0abb1a7a34c9557af6874a477500748e64a7d3def79cac1b"
 
-inherit autotools binconfig
+inherit autotools binconfig pkgconfig
+
+do_install_append() {
+	install -d ${D}/${libdir}/pkgconfig
+	install -m 0644 ${S}/src/assuan.pc ${D}/${libdir}/pkgconfig/
+}
-- 
1.7.9.5



