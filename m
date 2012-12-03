Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Qi.Chen@windriver.com>) id 1TfThL-0005eq-LZ
	for openembedded-core@lists.openembedded.org;
	Mon, 03 Dec 2012 11:56:28 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id qB3Ag5Jt001827
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 3 Dec 2012 02:42:05 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.163.154) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.318.4; Mon, 3 Dec 2012 02:42:05 -0800
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 3 Dec 2012 18:42:32 +0800
Message-ID: <ecc73c2c7117b760bb15d22d4ad2c89c23ca3383.1354531187.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1354531187.git.Qi.Chen@windriver.com>
References: <cover.1354531187.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Cc: Zhenfeng.Zhao@windriver.com
Subject: [PATCH 1/4] libksba: add pkgconfig support
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
X-List-Received-Date: Mon, 03 Dec 2012 10:56:28 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

Add pkgconfig support to libksba.

[YOCTO #2453]

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../libksba/ksba-add-pkgconfig-support.patch       |   57 ++++++++++++++++++++
 meta/recipes-support/libksba/libksba_1.3.0.bb      |    8 +--
 2 files changed, 62 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-support/libksba/libksba/ksba-add-pkgconfig-support.patch

diff --git a/meta/recipes-support/libksba/libksba/ksba-add-pkgconfig-support.patch b/meta/recipes-support/libksba/libksba/ksba-add-pkgconfig-support.patch
new file mode 100644
index 0000000..a60002a
--- /dev/null
+++ b/meta/recipes-support/libksba/libksba/ksba-add-pkgconfig-support.patch
@@ -0,0 +1,57 @@
+Upstream-Status: Pending
+
+Add pkgconfig support to libksba.
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+
+Index: Makefile.am
+===============================================================
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -21,6 +21,9 @@
+ ACLOCAL_AMFLAGS = -I m4 -I gl/m4
+ AUTOMAKE_OPTIONS = dist-bzip2 no-dist-gzip
+ 
++pkgconfigdir = ${libdir}/pkgconfig
++pkgconfig_DATA = ksba.pc
++
+ # (A suitable gitlog-to-changelog script can be found in GnuPG master.)
+ GITLOG_TO_CHANGELOG=gitlog-to-changelog
+ 
+Index: configure.ac
+===============================================================
+--- a/configure.ac
++++ b/configure.ac
+@@ -399,6 +399,7 @@ m4/Makefile
+ gl/Makefile
+ src/Makefile
+ src/ksba-config
+ src/versioninfo.rc
++ksba.pc
+ tests/Makefile
+ doc/Makefile
+
+Index: src/ksba.pc.in
+===============================================================
+--- /dev/null
++++ b/ksba.pc.in
+@@ -0,0 +1,16 @@
++prefix=@prefix@
++exec_prefix=@exec_prefix@
++libdir=@libdir@
++includedir=@includedir@
++
++# API info
++api_version=@KSBA_CONFIG_API_VERSION@
++
++Name: ksba
++Description: Libksba provides an easy API to create and parse X.509 and CMS related objects
++Requires:
++Version: @VERSION@
++Libs: -L${libdir} -lksba
++Libs.private: -L{libdir} -lgpg-error
++Cflags: -I${includedir}
++
+-- 
+1.7.5.4
+
diff --git a/meta/recipes-support/libksba/libksba_1.3.0.bb b/meta/recipes-support/libksba/libksba_1.3.0.bb
index 506d7c0..45bc35a 100644
--- a/meta/recipes-support/libksba/libksba_1.3.0.bb
+++ b/meta/recipes-support/libksba/libksba_1.3.0.bb
@@ -6,13 +6,15 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=fd541d83f75d038c4e0617b672ed8bda \
                     file://COPYING.GPLv3;md5=2f31b266d3440dd7ee50f92cf67d8e6c \
                     file://COPYING.LGPLv3;md5=e6a600fd5e1d9cbde2d983680233ad02 \
                    "
-PR = "r0"
+PR = "r1"
 
 DEPENDS = "libgpg-error"
 
-inherit autotools binconfig
+inherit autotools binconfig pkgconfig
 
-SRC_URI = "ftp://ftp.gnupg.org/gcrypt/${BPN}/${BPN}-${PV}.tar.bz2"
+SRC_URI = "ftp://ftp.gnupg.org/gcrypt/${BPN}/${BPN}-${PV}.tar.bz2 \
+           file://ksba-add-pkgconfig-support.patch"
 
 SRC_URI[md5sum] = "cd86fad9c9d360b2cf80449f8a4a4075"
 SRC_URI[sha256sum] = "5a61eed50550d4d0dcb47457ce7b6a90f8e719d42a3b25f7e79333e8cd721971"
+
-- 
1.7.9.5



