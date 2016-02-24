Return-Path: <mariano.lopez@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id BDE577737A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Feb 2016 23:31:25 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 24 Feb 2016 15:31:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,495,1449561600"; d="scan'208";a="894058239"
Received: from yctb01.ostc.intel.com (HELO yctb01.otcr.intel.com)
	([10.54.69.55])
	by orsmga001.jf.intel.com with ESMTP; 24 Feb 2016 15:31:26 -0800
From: mariano.lopez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Wed, 24 Feb 2016 15:27:06 +0000
Message-Id: <d027b2178315a8b1832aeaf042e211b2974063f2.1456327117.git.mariano.lopez@linux.intel.com>
X-Mailer: git-send-email 2.6.2
In-Reply-To: <cover.1456327117.git.mariano.lopez@linux.intel.com>
References: <cover.1456327117.git.mariano.lopez@linux.intel.com>
In-Reply-To: <cover.1456327117.git.mariano.lopez@linux.intel.com>
References: <cover.1456327117.git.mariano.lopez@linux.intel.com>
Subject: [PATCH 1/3] cve-check-tool: Add recipe
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
X-List-Received-Date: Wed, 24 Feb 2016 23:31:25 -0000

From: Mariano Lopez <mariano.lopez@linux.intel.com>

cve-check-tool is a program to for checking public CVEs.
This tool also seek to determine if a vulnerability has
been addressed by a patch.

The recipe also includes the do_populate_cve_db task
that will populate the database used by the tool. This
task is added when the cve-check class has been inherited.

[YOCTO #7515]

Co-authored by Elena Reshetova & Mariano Lopez

Signed-off-by: Mariano Lopez <mariano.lopez@linux.intel.com>
---
 .../cve-check-tool/cve-check-tool_5.6.bb           | 61 ++++++++++++++++++++++
 1 file changed, 61 insertions(+)
 create mode 100644 meta/recipes-devtools/cve-check-tool/cve-check-tool_5.6.bb

diff --git a/meta/recipes-devtools/cve-check-tool/cve-check-tool_5.6.bb b/meta/recipes-devtools/cve-check-tool/cve-check-tool_5.6.bb
new file mode 100644
index 0000000..b173eab
--- /dev/null
+++ b/meta/recipes-devtools/cve-check-tool/cve-check-tool_5.6.bb
@@ -0,0 +1,61 @@
+SUMMARY = "cve-check-tool"
+DESCRIPTION = "cve-check-tool is a tool for checking known (public) CVEs.\
+The tool will identify potentially vunlnerable software packages within Linux distributions through version matching."
+HOMEPAGE = "https://github.com/ikeydoherty/cve-check-tool"
+SECTION = "Development/Tools"
+LICENSE = "GPL-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=e8c1458438ead3c34974bc0be3a03ed6"
+
+SRC_URI = "https://github.com/ikeydoherty/${BPN}/releases/download/v${PV}/${BP}.tar.xz \
+            file://change_logic_cve_get_file_parent.patch"
+
+SRC_URI[md5sum] = "30f32e6254580162eacfcc437a144463"
+SRC_URI[sha256sum] = "d35af2bfa014b9d7cdc9c59ec0bd7df40c22dfcd57244c9099c0aa9bdc9c0cb4"
+
+DEPENDS = "libcheck glib-2.0 json-glib curl libxml2 sqlite3 openssl"
+
+inherit pkgconfig autotools
+
+EXTRA_OECONF = "--disable-static"
+
+python () {
+    # If the cve-check class is inherited it is needed to populate the
+    # CVE database before checking the CVEs for all recipes.
+    pn = d.getVar("PN", True)
+    if pn.endswith("-native") and bb.data.inherits_class('cve-check', d):
+        bb.build.addtask("do_populate_cve_db", "do_build", "do_populate_sysroot", d)
+}
+
+python do_populate_cve_db () {
+    import subprocess
+    import time
+    from bb.utils import export_proxies
+
+    export_proxies(d)
+    fail_text = "Failed to update database"
+    error_str = fail_text
+    cve_dir = d.getVar("CVE_CHECK_DB_DIR", True)
+    cmd = "cve-check-update -d %s" % cve_dir
+    bb.debug(1, "Updating cve-check-tool database located in %s" % cve_dir)
+    try:
+        popen = subprocess.Popen(cmd, shell=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
+        output, error = popen.communicate()
+        bb.debug(2, "Command %s returned:\n%s" % (cmd, output.decode()))
+        error_str = error.decode()
+        bb.debug(2, "Command %s errors:\n%s" % (cmd, error_str))
+    except:
+        bb.warn("Error in executing cve-check-update: %s" % str(sys.exc_info()))
+
+    if fail_text in error_str:
+        bb.warn("Failed to update cve-check-tool database, CVEs won't be checked")
+    else:
+        utc_time = time.gmtime(time.time())
+        format_time = "%Y-%m-%d %H:%M:%S"
+        with open(d.getVar("CVE_CHECK_TMP_FILE", True), "w") as f:
+            f.write("CVE database was updated on %s UTC\n\n"
+                    % time.strftime(format_time, utc_time))
+}
+
+do_populate_cve_db[nostamp] = "1"
+
+BBCLASSEXTEND = "native"
-- 
2.6.2


