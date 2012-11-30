Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Qi.Chen@windriver.com>) id 1TeHBW-00060W-0B
	for openembedded-core@lists.openembedded.org;
	Fri, 30 Nov 2012 04:22:39 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id qAU38Lbb015989
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Nov 2012 19:08:21 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.163.154) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.318.4; Thu, 29 Nov 2012 19:08:20 -0800
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 30 Nov 2012 11:08:43 +0800
Message-ID: <fe9165f254427054e95569b22c840e3f3443a8be.1354084523.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1354084523.git.Qi.Chen@windriver.com>
References: <cover.1354084523.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Cc: Zhenfeng.Zhao@windriver.com
Subject: [PATCH 2/3] qt4-native: make qt4-native work with long building path
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
X-List-Received-Date: Fri, 30 Nov 2012 03:23:00 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

If the TMPDIR has more than 256 chars, building qt4-native fails.
This violates the 410 length limit of TMPDIR.

This patch makes building qt4-native succeed with a long building
path (410 for example) by extending its static arrays' sizes by
256 chars.

[YOCTO #2766]

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 ...e-qt4-native-work-with-long-building-path.patch |   82 ++++++++++++++++++++
 meta/recipes-qt/qt4/qt4-native.inc                 |    3 +-
 2 files changed, 84 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-qt/qt4/qt4-4.8.3/0001-make-qt4-native-work-with-long-building-path.patch

diff --git a/meta/recipes-qt/qt4/qt4-4.8.3/0001-make-qt4-native-work-with-long-building-path.patch b/meta/recipes-qt/qt4/qt4-4.8.3/0001-make-qt4-native-work-with-long-building-path.patch
new file mode 100644
index 0000000..74f4e1a
--- /dev/null
+++ b/meta/recipes-qt/qt4/qt4-4.8.3/0001-make-qt4-native-work-with-long-building-path.patch
@@ -0,0 +1,82 @@
+Upstream-Status: Pending
+
+Make qt4-native work with long building path.
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+
+Index: configure
+=====================================================================
+--- a/configure
++++ b/configure
+@@ -4764,8 +4764,8 @@ DEMOS_PATH_STR=`"$relpath/config.tests/unix/padstring" 268 "qt_demopath=$QT_INST
+ TODAY=`date +%Y-%m-%d`
+ cat > "$outpath/src/corelib/global/qconfig.cpp.new" <<EOF
+ /* License Info */
+-static const char qt_configure_licensee_str          [256 + 12] = "$LICENSE_USER_STR";
+-static const char qt_configure_licensed_products_str [256 + 12] = "$LICENSE_PRODUCTS_STR";
++static const char qt_configure_licensee_str          [512 + 12] = "$LICENSE_USER_STR";
++static const char qt_configure_licensed_products_str [512 + 12] = "$LICENSE_PRODUCTS_STR";
+ 
+ /* Installation date */
+ static const char qt_configure_installation          [12+11]    = "qt_instdate=$TODAY";
+@@ -4790,36 +4790,36 @@ if [ ! -z "$QT_HOST_PREFIX" ]; then
+ 
+ #if defined(QT_BOOTSTRAPPED) || defined(QT_BUILD_QMAKE)
+ /* Installation Info */
+-static const char qt_configure_prefix_path_str       [256 + 12] = "$HOSTPREFIX_PATH_STR";
+-static const char qt_configure_documentation_path_str[256 + 12] = "$HOSTDOCUMENTATION_PATH_STR";
+-static const char qt_configure_headers_path_str      [256 + 12] = "$HOSTHEADERS_PATH_STR";
+-static const char qt_configure_libraries_path_str    [256 + 12] = "$HOSTLIBRARIES_PATH_STR";
+-static const char qt_configure_binaries_path_str     [256 + 12] = "$HOSTBINARIES_PATH_STR";
+-static const char qt_configure_plugins_path_str      [256 + 12] = "$HOSTPLUGINS_PATH_STR";
+-static const char qt_configure_imports_path_str      [256 + 12] = "$HOSTIMPORTS_PATH_STR";
+-static const char qt_configure_data_path_str         [256 + 12] = "$HOSTDATA_PATH_STR";
+-static const char qt_configure_translations_path_str [256 + 12] = "$HOSTTRANSLATIONS_PATH_STR";
+-static const char qt_configure_settings_path_str     [256 + 12] = "$HOSTSETTINGS_PATH_STR";
+-static const char qt_configure_examples_path_str     [256 + 12] = "$HOSTEXAMPLES_PATH_STR";
+-static const char qt_configure_demos_path_str        [256 + 12] = "$HOSTDEMOS_PATH_STR";
++static const char qt_configure_prefix_path_str       [512 + 12] = "$HOSTPREFIX_PATH_STR";
++static const char qt_configure_documentation_path_str[512 + 12] = "$HOSTDOCUMENTATION_PATH_STR";
++static const char qt_configure_headers_path_str      [512 + 12] = "$HOSTHEADERS_PATH_STR";
++static const char qt_configure_libraries_path_str    [512 + 12] = "$HOSTLIBRARIES_PATH_STR";
++static const char qt_configure_binaries_path_str     [512 + 12] = "$HOSTBINARIES_PATH_STR";
++static const char qt_configure_plugins_path_str      [512 + 12] = "$HOSTPLUGINS_PATH_STR";
++static const char qt_configure_imports_path_str      [512 + 12] = "$HOSTIMPORTS_PATH_STR";
++static const char qt_configure_data_path_str         [512 + 12] = "$HOSTDATA_PATH_STR";
++static const char qt_configure_translations_path_str [512 + 12] = "$HOSTTRANSLATIONS_PATH_STR";
++static const char qt_configure_settings_path_str     [512 + 12] = "$HOSTSETTINGS_PATH_STR";
++static const char qt_configure_examples_path_str     [512 + 12] = "$HOSTEXAMPLES_PATH_STR";
++static const char qt_configure_demos_path_str        [512 + 12] = "$HOSTDEMOS_PATH_STR";
+ #else // QT_BOOTSTRAPPED
+ EOF
+ fi
+ 
+ cat >> "$outpath/src/corelib/global/qconfig.cpp.new" <<EOF
+ /* Installation Info */
+-static const char qt_configure_prefix_path_str       [256 + 12] = "$PREFIX_PATH_STR";
+-static const char qt_configure_documentation_path_str[256 + 12] = "$DOCUMENTATION_PATH_STR";
+-static const char qt_configure_headers_path_str      [256 + 12] = "$HEADERS_PATH_STR";
+-static const char qt_configure_libraries_path_str    [256 + 12] = "$LIBRARIES_PATH_STR";
+-static const char qt_configure_binaries_path_str     [256 + 12] = "$BINARIES_PATH_STR";
+-static const char qt_configure_plugins_path_str      [256 + 12] = "$PLUGINS_PATH_STR";
+-static const char qt_configure_imports_path_str      [256 + 12] = "$IMPORTS_PATH_STR";
+-static const char qt_configure_data_path_str         [256 + 12] = "$DATA_PATH_STR";
+-static const char qt_configure_translations_path_str [256 + 12] = "$TRANSLATIONS_PATH_STR";
+-static const char qt_configure_settings_path_str     [256 + 12] = "$SETTINGS_PATH_STR";
+-static const char qt_configure_examples_path_str     [256 + 12] = "$EXAMPLES_PATH_STR";
+-static const char qt_configure_demos_path_str        [256 + 12] = "$DEMOS_PATH_STR";
++static const char qt_configure_prefix_path_str       [512 + 12] = "$PREFIX_PATH_STR";
++static const char qt_configure_documentation_path_str[512 + 12] = "$DOCUMENTATION_PATH_STR";
++static const char qt_configure_headers_path_str      [512 + 12] = "$HEADERS_PATH_STR";
++static const char qt_configure_libraries_path_str    [512 + 12] = "$LIBRARIES_PATH_STR";
++static const char qt_configure_binaries_path_str     [512 + 12] = "$BINARIES_PATH_STR";
++static const char qt_configure_plugins_path_str      [512 + 12] = "$PLUGINS_PATH_STR";
++static const char qt_configure_imports_path_str      [512 + 12] = "$IMPORTS_PATH_STR";
++static const char qt_configure_data_path_str         [512 + 12] = "$DATA_PATH_STR";
++static const char qt_configure_translations_path_str [512 + 12] = "$TRANSLATIONS_PATH_STR";
++static const char qt_configure_settings_path_str     [512 + 12] = "$SETTINGS_PATH_STR";
++static const char qt_configure_examples_path_str     [512 + 12] = "$EXAMPLES_PATH_STR";
++static const char qt_configure_demos_path_str        [512 + 12] = "$DEMOS_PATH_STR";
+ EOF
+ 
+ if [ ! -z "$QT_HOST_PREFIX" ]; then
diff --git a/meta/recipes-qt/qt4/qt4-native.inc b/meta/recipes-qt/qt4/qt4-native.inc
index ad20723..42e2801 100644
--- a/meta/recipes-qt/qt4/qt4-native.inc
+++ b/meta/recipes-qt/qt4/qt4-native.inc
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.LGPL;md5=fbc093901857fcd118f065f900982c24 \
                     file://LICENSE.GPL3;md5=babc5b6b77441da277f5c06b2e547720 \
                     file://LGPL_EXCEPTION.txt;md5=411080a56ff917a5a1aa08c98acae354"
 
-INC_PR = "r18"
+INC_PR = "r19"
 
 inherit native
 
@@ -17,6 +17,7 @@ SRC_URI = "http://releases.qt-project.org/qt4/source/qt-everywhere-opensource-sr
            file://0001-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch \
            file://0002-qkbdtty_qws-fix-build-with-old-kernel-headers.patch \
            file://0003-webkit2-set-OUTPUT_DIR-value-if-empty.patch \
+	   file://0001-make-qt4-native-work-with-long-building-path.patch \
            file://g++.conf \
            file://linux.conf \
 	"
-- 
1.7.9.5



