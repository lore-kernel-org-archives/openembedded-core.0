Return-Path: <Chong.Lu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 9525971EC3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Oct 2014 01:59:52 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s9V1xpKe029714
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Oct 2014 18:59:52 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Thu, 30 Oct 2014 18:59:51 -0700
From: Chong Lu <Chong.Lu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 31 Oct 2014 09:56:32 +0800
Message-ID: <b7733fcdfaea20fb9ad43aee02ebe0cdbedc3cc2.1414720498.git.Chong.Lu@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1414720498.git.Chong.Lu@windriver.com>
References: <cover.1414720498.git.Chong.Lu@windriver.com>
MIME-Version: 1.0
Subject: [PATCH V2 1/1] libxml2: fix python path and add libxml2-python
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
X-List-Received-Date: Fri, 31 Oct 2014 01:59:55 -0000
Content-Type: text/plain

From: Robert Yang <liezhi.yang@windriver.com>

We have libxml2-python for native and nativesdk, but don't have it for
target, and can't find the reason from the git log, libxml2-python is
widely used, after looked into it's configure.in, we can add it
by PACKAGECONFIG.

The previous --with-python=${STAGING_BINDIR}/python is incorrect, it
acted as work becase it's conigure can check automatically, python is in
${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN}, as known as
${PYTHON}.

Add python to PACKAGECONFIG, since createrepo rdepends on libxml2-python.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-core/libxml/libxml2.inc | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/meta/recipes-core/libxml/libxml2.inc b/meta/recipes-core/libxml/libxml2.inc
index c729c19..2bdfed0 100644
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
 	sed -i -e '/.*ansidecl.h.*/d' ${S}/configure.in
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
1.9.1


