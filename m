Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Qi.Chen@windriver.com>) id 1TfThM-0005er-Ha
	for openembedded-core@lists.openembedded.org;
	Mon, 03 Dec 2012 11:56:29 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id qB3Ag8Xt027899
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 3 Dec 2012 02:42:08 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.163.154) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.318.4; Mon, 3 Dec 2012 02:42:06 -0800
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 3 Dec 2012 18:42:33 +0800
Message-ID: <4973f2f88641f8a8c02b0062b31f159977d9ba0a.1354531187.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1354531187.git.Qi.Chen@windriver.com>
References: <cover.1354531187.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Cc: Zhenfeng.Zhao@windriver.com
Subject: [PATCH 2/4] ICU: add pkgconfig support
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
X-List-Received-Date: Mon, 03 Dec 2012 10:56:29 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

Add pkgconfig support to ICU.

[YOCTO #2453]

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../icu/files/icu-add-pkgconfig-support.patch      |   43 ++++++++++++++++++++
 meta/recipes-support/icu/icu-3.6.inc               |   11 +++++
 meta/recipes-support/icu/icu_3.6.bb                |    2 +-
 3 files changed, 55 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/icu/files/icu-add-pkgconfig-support.patch

diff --git a/meta/recipes-support/icu/files/icu-add-pkgconfig-support.patch b/meta/recipes-support/icu/files/icu-add-pkgconfig-support.patch
new file mode 100644
index 0000000..c7cd9d5
--- /dev/null
+++ b/meta/recipes-support/icu/files/icu-add-pkgconfig-support.patch
@@ -0,0 +1,43 @@
+Upstream-Status: Inappropriate [version]
+ICU-3.6 has no pkgconfig, so I add it here. 
+But ICU has had pkgconfig support since 4.6.
+So this patch is inappropriate to upstream.
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+
+Index: configure.in
+=============================================================
+--- a/configure.in
++++ b/configure.in
+@@ -1057,4 +1057,7 @@ echo "This may cause ICU to fail to build. Please make sure that GNU make"
+ echo "is in your PATH so that this configure script can detect its location."
+ fi
+ 
++AC_CONFIG_FILES([icu.pc])
++AC_OUTPUT
++
+ $as_unset _CXX_CXXSUFFIX
+
+Index: icu.pc.in
+=============================================================
+--- /dev/null
++++ b/icu.pc.in
+@@ -0,0 +1,15 @@
++# Process this file with autoconf to produce a pkg-config metadata file.
++
++prefix=@prefix@
++exec_prefix=@exec_prefix@
++libdir=@libdir@
++includedir=@includedir@
++unicode_version=@UNICODE_VERSION@
++
++Name: ICU
++Description: International Component for Unicode libraries
++Requires:
++Version: @VERSION@
++Libs: -L${libdir} -licui18n -licuuc -licudata
++Libs.private: -L{libdir} -lpthread -lm
++Cflags: -I${includedir} -O2 -pipe -g -feliminate-unused-debug-types
+-- 
+1.7.11.2
+
diff --git a/meta/recipes-support/icu/icu-3.6.inc b/meta/recipes-support/icu/icu-3.6.inc
index 272f6d1..8caf71c 100644
--- a/meta/recipes-support/icu/icu-3.6.inc
+++ b/meta/recipes-support/icu/icu-3.6.inc
@@ -7,6 +7,7 @@ BASE_SRC_URI = "ftp://ftp.software.ibm.com/software/globalization/icu/3.6/icu4c-
            file://fix-parallel-build.patch \
            file://use-g++-for-linking.patch \
            file://larger-cmd-size.patch \
+	   file://icu-add-pkgconfig-support.patch \
            "
 SRC_URI = "${BASE_SRC_URI} \
            file://noldlibpath.patch \
@@ -28,6 +29,12 @@ inherit autotools pkgconfig binconfig
 do_configure() {
 	libtoolize --force
 	gnu-configize --force
+	if [ "${PN}" != "icu-native" ]; then
+		OLD=`pwd`
+		cd ${S}
+		autoconf
+		cd ${OLD}
+	fi
 	oe_runconf
 	if [ "${PN}" != "icu-native" ]; then
 		# In the non-native case we need to make substitutions to use
@@ -45,6 +52,10 @@ do_compile() {
 
 do_install_append() {
         chmod +x ${D}${libdir}/lib*
+	if [ "${PN}" != "icu-native" ]; then
+		install -d ${D}/${libdir}/pkgconfig
+        	install -m 0644 ${S}/icu.pc ${D}/${libdir}/pkgconfig
+	fi
 }
 
 PACKAGES =+ "libicudata libicuuc libicui18n libicule libiculx libicutu libicuio"
diff --git a/meta/recipes-support/icu/icu_3.6.bb b/meta/recipes-support/icu/icu_3.6.bb
index f941acf..f50abe2 100644
--- a/meta/recipes-support/icu/icu_3.6.bb
+++ b/meta/recipes-support/icu/icu_3.6.bb
@@ -1,6 +1,6 @@
 require icu-3.6.inc
 
-PR = "r9"
+PR = "r10"
 
 SRC_URI[md5sum] = "6243f7a19e03e05403ce84e597510d4c"
 SRC_URI[sha256sum] = "5135e8d69d6206d320515df7aeee7027711ab1aef9d8dbf29571a97a9746b041"
-- 
1.7.9.5



