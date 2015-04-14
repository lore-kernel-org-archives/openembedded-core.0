Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8603473D1B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Apr 2015 09:09:02 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.9) with ESMTP id t3E9939G010537
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Apr 2015 02:09:03 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 14 Apr 2015 02:09:08 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 14 Apr 2015 02:08:58 -0700
Message-ID: <39bde4872c0287e3617e2e8af5768903e1d33cfc.1429002519.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1429002519.git.liezhi.yang@windriver.com>
References: <cover.1429002519.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/6] libxml2: fix python path and add libxml2-python
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
X-List-Received-Date: Tue, 14 Apr 2015 09:09:02 -0000
Content-Type: text/plain

We have libxml2-python for native and nativesdk, but don't have it for
target, and can't find the reason from the git log, libxml2-python is
widely used, after looked into it's configure.in, we can add it
by PACKAGECONFIG.

The previous --with-python=${STAGING_BINDIR}/python is incorrect, it
acted as work becase it's conigure can check automatically, python is in
${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN}, as known as
${PYTHON}.

Add python to PACKAGECONFIG, since createrepo rdepends on
libxml2-python, otherwise the target createrepo can't work.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-core/libxml/libxml2.inc |   19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/meta/recipes-core/libxml/libxml2.inc b/meta/recipes-core/libxml/libxml2.inc
index 1314bbf..1c62254 100644
--- a/meta/recipes-core/libxml/libxml2.inc
+++ b/meta/recipes-core/libxml/libxml2.inc
@@ -9,8 +9,6 @@ LIC_FILES_CHKSUM = "file://Copyright;md5=2044417e2e5006b65a8b9067b683fcf1 \
                     file://list.c;beginline=4;endline=13;md5=cdbfa3dee51c099edb04e39f762ee907 \
                     file://trio.c;beginline=5;endline=14;md5=6c025753c86d958722ec76e94cae932e"
 
-DEPENDS_class-nativesdk = "nativesdk-python"
-DEPENDS_class-native = "python-native"
 DEPENDS =+ "zlib"
 
 SRC_URI = "ftp://xmlsoft.org/libxml2/libxml2-${PV}.tar.gz;name=libtar \
@@ -37,16 +35,17 @@ do_configure_prepend () {
 	sed -i -e '/.*ansidecl.h.*/d' ${S}/configure.ac
 }
 
-do_configure_prepend_class-nativesdk () {
-	# Ensure we get the correct site-packages path
-	export PYTHON_SITE_PACKAGES="${PYTHON_SITEPACKAGES_DIR}"
-}
+export PYTHON_SITE_PACKAGES="${PYTHON_SITEPACKAGES_DIR}"
+
+PACKAGECONFIG ??= "python"
+PACKAGECONFIG_linuxstdbase ??= ""
 
+PACKAGECONFIG[python] = "--with-python=${PYTHON},--without-python,python,python-core"
 # WARNING: zlib is require for RPM use
-EXTRA_OECONF = "--without-python --without-debug --without-legacy --with-catalog --without-docbook --with-c14n --without-lzma --with-fexceptions"
-EXTRA_OECONF_class-native = "--with-python=${STAGING_BINDIR}/python --without-legacy --without-docbook --with-c14n --without-lzma --with-zlib"
-EXTRA_OECONF_class-nativesdk = "--with-python=${STAGING_BINDIR}/python --without-legacy --without-docbook --with-c14n --without-lzma --with-zlib"
-EXTRA_OECONF_linuxstdbase = "--without-python --with-debug --with-legacy --with-docbook --with-c14n --without-lzma --with-zlib"
+EXTRA_OECONF = "--without-debug --without-legacy --with-catalog --without-docbook --with-c14n --without-lzma --with-fexceptions"
+EXTRA_OECONF_class-native = "--without-legacy --without-docbook --with-c14n --without-lzma --with-zlib"
+EXTRA_OECONF_class-nativesdk = "--without-legacy --without-docbook --with-c14n --without-lzma --with-zlib"
+EXTRA_OECONF_linuxstdbase = "--with-debug --with-legacy --with-docbook --with-c14n --without-lzma --with-zlib"
 
 # required for pythong binding
 export HOST_SYS
-- 
1.7.9.5


