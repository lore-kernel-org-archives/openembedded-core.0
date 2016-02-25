Return-Path: <mariano.lopez@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 9DDDC77342
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Feb 2016 23:12:21 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 25 Feb 2016 15:12:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,498,1449561600"; d="scan'208";a="921333698"
Received: from yctb01.ostc.intel.com (HELO yctb01.otcr.intel.com)
	([10.54.69.55])
	by orsmga002.jf.intel.com with ESMTP; 25 Feb 2016 15:12:23 -0800
From: mariano.lopez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Thu, 25 Feb 2016 15:07:53 +0000
Message-Id: <adf9ff7272a20d4daa759b2c9a6c7c11c4a45b73.1456412549.git.mariano.lopez@linux.intel.com>
X-Mailer: git-send-email 2.6.2
In-Reply-To: <cover.1456412549.git.mariano.lopez@linux.intel.com>
References: <cover.1456412549.git.mariano.lopez@linux.intel.com>
In-Reply-To: <cover.1456412549.git.mariano.lopez@linux.intel.com>
References: <cover.1456412549.git.mariano.lopez@linux.intel.com>
Subject: [PATCHv2 1/2] cve-check-tool: Add recipe
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
X-List-Received-Date: Thu, 25 Feb 2016 23:12:21 -0000

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
 .../change_logic_cve_get_file_parent.patch         | 45 ++++++++++++++++++
 .../cve-check-tool/cve-check-tool_5.6.bb           | 54 ++++++++++++++++++++++
 2 files changed, 99 insertions(+)
 create mode 100644 meta/recipes-devtools/cve-check-tool/cve-check-tool/change_logic_cve_get_file_parent.patch
 create mode 100644 meta/recipes-devtools/cve-check-tool/cve-check-tool_5.6.bb

diff --git a/meta/recipes-devtools/cve-check-tool/cve-check-tool/change_logic_cve_get_file_parent.patch b/meta/recipes-devtools/cve-check-tool/cve-check-tool/change_logic_cve_get_file_parent.patch
new file mode 100644
index 0000000..077de88
--- /dev/null
+++ b/meta/recipes-devtools/cve-check-tool/cve-check-tool/change_logic_cve_get_file_parent.patch
@@ -0,0 +1,45 @@
+From 22cc9186909f98f024d78a08504d0bf532806de0 Mon Sep 17 00:00:00 2001
+From: Mariano Lopez <mariano.lopez@linux.intel.com>
+Date: Thu, 18 Feb 2016 14:26:02 +0000
+Subject: [PATCH] util.c: Change logic in cve_get_file_parent()
+
+Function cve_get_file_parent() will try to get the
+realpath and the get the dirname. If the file used
+to get parent doesn't exist the call will fail.
+
+This problem is present when using another directory
+for the database, realpath() won't find the nvd.db
+file and the program will exit quitely.
+
+This patch will first get the dirname and the get
+the realpath to avoid failing when the doesn't exist.
+
+Upstream-Status: Accepted [Release v5.6.3]
+
+Signed-off-by: Mariano Lopez <mariano.lopez@linux.intel.com>
+---
+ src/library/util.c | 8 +++-----
+ 1 file changed, 3 insertions(+), 5 deletions(-)
+
+diff --git a/src/library/util.c b/src/library/util.c
+index 8a20728..4d4a576 100644
+--- a/src/library/util.c
++++ b/src/library/util.c
+@@ -184,11 +184,9 @@ bool cve_is_dir(const char *p)
+ 
+ char *cve_get_file_parent(const char *p)
+ {
+-        char *r = realpath(p, NULL);
+-        if (!r) {
+-                return NULL;
+-        }
+-        return dirname(r);
++        autofree(char) *d = strdup(p);
++        char *r = realpath(dirname(d), NULL);
++        return r;
+ }
+ 
+ bool cve_file_set_text(const char *path, char *text)
+-- 
+2.6.2
+
diff --git a/meta/recipes-devtools/cve-check-tool/cve-check-tool_5.6.bb b/meta/recipes-devtools/cve-check-tool/cve-check-tool_5.6.bb
new file mode 100644
index 0000000..2315058
--- /dev/null
+++ b/meta/recipes-devtools/cve-check-tool/cve-check-tool_5.6.bb
@@ -0,0 +1,54 @@
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
+addtask populate_cve_db after do_populate_sysroot
+do_populate_cve_db[nostamp] = "1"
+
+BBCLASSEXTEND = "native"
-- 
2.6.2


