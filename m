Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <yao.zhao@windriver.com>) id 1SuUwg-0003vn-AO
	for openembedded-core@lists.openembedded.org;
	Thu, 26 Jul 2012 22:46:06 +0200
Received: from yzhao2-OptiPlex-990.corp.ad.wrs.com
	(yzhao2-optiplex-990.corp.ad.wrs.com [128.224.147.210])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q6QKYY8P008453
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jul 2012 13:34:34 -0700 (PDT)
From: Yao Zhao <yao.zhao@windriver.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 26 Jul 2012 16:34:19 -0400
Message-Id: <1343334859-21249-1-git-send-email-yao.zhao@windriver.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH v3] bzip2-native: handling native path issue
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
X-List-Received-Date: Thu, 26 Jul 2012 20:46:06 -0000

follow Richard's approach, modify bzip2-native recipe to install bzip2 package
binaries to STAGING_BINDIR_NATIVE/bzip2-native to avoid problems when other
package is doing upack to reference bzip2. libbz2.so* still installs to
STAGING_LIBDIR_NATIVE.

change python-native to depends on bzip2-replacement-native instead of
bzip2-full-native and add EXTRANATIVEPATH for bzip2-native.

Didn't add bzip2native.bbclass as python-native is the only user so far.

Signed-off-by: Yao Zhao <yao.zhao@windriver.com>
---
 .../recipes-devtools/python/python-native_2.7.3.bb |    4 +++-
 meta/recipes-extended/bzip2/bzip2_1.0.6.bb         |    4 +++-
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/python/python-native_2.7.3.bb b/meta/recipes-devtools/python/python-native_2.7.3.bb
index c89f9f9..d450949 100644
--- a/meta/recipes-devtools/python/python-native_2.7.3.bb
+++ b/meta/recipes-devtools/python/python-native_2.7.3.bb
@@ -1,5 +1,7 @@
 require python.inc
-DEPENDS = "openssl-native bzip2-full-native zlib-native readline-native sqlite3-native"
+
+EXTRANATIVEPATH += "bzip2-native"
+DEPENDS = "openssl-native bzip2-replacement-native zlib-native readline-native sqlite3-native"
 PR = "${INC_PR}.1"
 
 SRC_URI += "file://04-default-is-optimized.patch \
diff --git a/meta/recipes-extended/bzip2/bzip2_1.0.6.bb b/meta/recipes-extended/bzip2/bzip2_1.0.6.bb
index 43b462a..e0c710b 100644
--- a/meta/recipes-extended/bzip2/bzip2_1.0.6.bb
+++ b/meta/recipes-extended/bzip2/bzip2_1.0.6.bb
@@ -24,6 +24,8 @@ inherit autotools update-alternatives
 ALTERNATIVE_PRIORITY = "100"
 ALTERNATIVE_${PN} = "bunzip2 bzcat"
 
+#install binaries to bzip2-native under sysroot for replacement-native
+EXTRA_OECONF_virtclass-native += "--bindir=${STAGING_BINDIR_NATIVE}/${PN}"
 do_configure_prepend () {
 	cp ${WORKDIR}/configure.ac ${S}/
 	cp ${WORKDIR}/Makefile.am ${S}/
@@ -40,5 +42,5 @@ FILES_libbz2-staticdev = "${libdir}/*.a"
 SECTION_libbz2-staticdev = "devel"
 RDEPENDS_libbz2-staticdev = "libbz2-dev (= ${EXTENDPKGV})"
 
-PROVIDES_append_virtclass-native = " bzip2-full-native"
+PROVIDES_append_virtclass-native = " bzip2-replacement-native"
 BBCLASSEXTEND = "native"
-- 
1.7.9.5



