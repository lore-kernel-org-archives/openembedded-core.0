Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7C90C60124
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Mar 2016 07:23:31 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u2A7NS53028917
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Wed, 9 Mar 2016 23:23:29 -0800
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Wed, 9 Mar 2016 23:23:27 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <liezhi.yang@windriver.com>,
	<ross.burton@intel.com>, <richard.purdie@linuxfoundation.org>
Date: Thu, 10 Mar 2016 02:23:06 -0500
Message-ID: <80ec1822b421bc0adb5e6774853766d383dc17c2.1457593651.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1457593651.git.hongxu.jia@windriver.com>
References: <cover.1457593651.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 01/18] fix_buildpaths.bbclass: add bbclass to fix build path
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
X-List-Received-Date: Thu, 10 Mar 2016 07:23:33 -0000
Content-Type: text/plain

Define variable PACKAGE_BUILDPATH_TEXT_FILES to list files that have
build paths and remove these paths at do_package time.

Define variable PACKAGE_BUILDPATH_TEXT_PATTERNS to list build path
patterns, which used by sed, it removes --sysroot and
-fdebug-prefix-map in text files by default.

Define python function to remove build path in variable.

Define python function to remove build path in python compiled
code.

[YOCTO #9169]

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/classes/fix_buildpaths.bbclass | 44 +++++++++++++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)
 create mode 100644 meta/classes/fix_buildpaths.bbclass

diff --git a/meta/classes/fix_buildpaths.bbclass b/meta/classes/fix_buildpaths.bbclass
new file mode 100644
index 0000000..49dbf11
--- /dev/null
+++ b/meta/classes/fix_buildpaths.bbclass
@@ -0,0 +1,44 @@
+PACKAGE_PREPROCESS_FUNCS += "${@base_conditional('PACKAGE_BUILDPATH_TEXT_FILES','', '', 'remove_buildpath_package_preprocess', d)}"
+remove_buildpath_package_preprocess () {
+	# Remove build paths in text files
+	for file in ${PACKAGE_BUILDPATH_TEXT_FILES};do
+		sed -i ${PACKAGE_BUILDPATH_TEXT_PATTERNS} ${PKGD}$file
+	done
+}
+
+# List build path patterns, which used by sed, it removes
+# --sysroot and -fdebug-prefix-map by default.
+PACKAGE_BUILDPATH_TEXT_PATTERNS = " \
+    -e 's:--sysroot=${STAGING_DIR_TARGET}::g' \
+    -e 's:-fdebug-prefix-map=${B}=/usr/src/${BPN}::g' \
+    -e 's:-fdebug-prefix-map=${S}=/usr/src/${BPN}::g' \
+    -e 's:-fdebug-prefix-map=${STAGING_DIR_NATIVE}=::g' \
+    -e 's:-fdebug-prefix-map=${STAGING_DIR_HOST}=::g' \
+"
+
+# List files which have build paths, and remove these paths.
+PACKAGE_BUILDPATH_TEXT_FILES ??= ""
+
+# Remove build path in variable
+def remove_buildpath_variable(d, var):
+    val = d.getVar(var, True) or ''
+
+    toolchain_opts = d.getVar('TOOLCHAIN_OPTIONS', True)
+    val = val.replace(toolchain_opts, '')
+
+    debug_flags = d.getVar('DEBUG_FLAGS', True).split()
+    for opt in debug_flags:
+        if '-fdebug-prefix-map=' in opt:
+            val = val.replace(opt, '')
+
+    return val
+
+# Remove build path in python compiled code which
+# located in root_path
+def remove_buildpath_bytecode(root_path, byte_code):
+    import py_compile
+
+    file = root_path + byte_code[0:-1]
+    dfile = byte_code[0:-1]
+    py_compile.compile(file, dfile=dfile)
+
-- 
1.9.1


