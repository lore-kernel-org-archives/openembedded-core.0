Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id BB5E962136
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Mar 2016 06:16:13 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u2N6Fro5008076
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 22 Mar 2016 23:15:53 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Tue, 22 Mar 2016 23:15:52 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <ross.burton@intel.com>, <richard.purdie@linuxfoundation.org>,
	<bruce.ashfield@gmail.com>, <mark.hatle@windriver.com>
Date: Wed, 23 Mar 2016 02:15:43 -0400
Message-ID: <05235f1672ae04cf2aa7dc4bbd58a4ce27b9efda.1458713426.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1458713426.git.hongxu.jia@windriver.com>
References: <cover.1458713426.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 03/15] fix_buildpaths.bbclass: add bbclass to fix build path
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
X-List-Received-Date: Wed, 23 Mar 2016 06:16:14 -0000
Content-Type: text/plain

Define variable PACKAGE_BUILDPATH_TEXT_FILES to list files that have
build paths and remove these paths at do_package time. It supports
package override while files exist in conditionally generated package.
(such as ${PN}-ptest is conditionally generated)

Define variable PACKAGE_BUILDPATH_TEXT_PATTERNS to list build path
patterns, which used by sed, it removes --sysroot and
-fdebug-prefix-map in text files by default.

Define python function to remove build path in variable.

Define python function to remove build path in python compiled
code.

[YOCTO #9169]

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/classes/fix_buildpaths.bbclass | 55 +++++++++++++++++++++++++++++++++++++
 1 file changed, 55 insertions(+)
 create mode 100644 meta/classes/fix_buildpaths.bbclass

diff --git a/meta/classes/fix_buildpaths.bbclass b/meta/classes/fix_buildpaths.bbclass
new file mode 100644
index 0000000..440a1b2
--- /dev/null
+++ b/meta/classes/fix_buildpaths.bbclass
@@ -0,0 +1,55 @@
+PACKAGE_PREPROCESS_FUNCS += 'remove_buildpath_package_preprocess'
+
+def list_package_buildpath_text_files(d):
+    files = d.getVar('PACKAGE_BUILDPATH_TEXT_FILES', True) or ''
+
+    # Support package override
+    for pn in d.getVar('PACKAGES', True).split():
+        files += d.getVar('PACKAGE_BUILDPATH_TEXT_FILES_%s' % pn, True) or ''
+
+    return files
+
+remove_buildpath_package_preprocess () {
+	buildpath_files="${@list_package_buildpath_text_files(d)}"
+
+	# Remove build paths in text files
+	for file in $buildpath_files;do
+		sed -i ${PACKAGE_BUILDPATH_TEXT_PATTERNS} ${PKGD}$file
+	done
+}
+
+# List build path patterns, which used by sed, it removes
+# --sysroot and -fdebug-prefix-map by default.
+PACKAGE_BUILDPATH_TEXT_PATTERNS = " \
+    -e 's:--sysroot=${STAGING_DIR_TARGET}::g' \
+    -e 's:-fdebug-prefix-map=${WORKDIR}=/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}::g' \
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


