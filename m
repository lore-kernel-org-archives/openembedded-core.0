Return-Path: <mariano.lopez@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id D794E6FFFE
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Aug 2016 03:10:59 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga105.jf.intel.com with ESMTP; 24 Aug 2016 20:01:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,573,1464678000"; d="scan'208";a="160610142"
Received: from yctb01.ostc.intel.com (HELO yctb01.otcr.intel.com)
	([10.54.69.55])
	by fmsmga004.fm.intel.com with ESMTP; 24 Aug 2016 20:01:30 -0700
From: mariano.lopez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Wed, 24 Aug 2016 18:58:34 +0000
Message-Id: <2ea1073b1b15da51334a47814732d809fc1d4a3a.1472060412.git.mariano.lopez@linux.intel.com>
X-Mailer: git-send-email 2.6.6
In-Reply-To: <cover.1472060412.git.mariano.lopez@linux.intel.com>
References: <cover.1472060412.git.mariano.lopez@linux.intel.com>
In-Reply-To: <cover.1472060412.git.mariano.lopez@linux.intel.com>
References: <cover.1472060412.git.mariano.lopez@linux.intel.com>
Subject: [PATCHv4 1/2] cve-check-tool: Add recipe
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
X-List-Received-Date: Thu, 25 Aug 2016 03:11:00 -0000

From: Mariano Lopez <mariano.lopez@linux.intel.com>

cve-check-tool is a program for public CVEs checking.
This tool also seek to determine if a vulnerability has
been addressed by a patch.

The recipe also includes the do_populate_cve_db task
that will populate the database used by the tool.

[YOCTO #7515]

Signed-off-by: Mariano Lopez <mariano.lopez@linux.intel.com>
---
 .../cve-check-tool/cve-check-tool_5.6.4.bb         | 59 ++++++++++++++++++++++
 .../check-for-malloc_trim-before-using-it.patch    | 51 +++++++++++++++++++
 2 files changed, 110 insertions(+)
 create mode 100644 meta/recipes-devtools/cve-check-tool/cve-check-tool_5.6.4.bb
 create mode 100644 meta/recipes-devtools/cve-check-tool/files/check-for-malloc_trim-before-using-it.patch

diff --git a/meta/recipes-devtools/cve-check-tool/cve-check-tool_5.6.4.bb b/meta/recipes-devtools/cve-check-tool/cve-check-tool_5.6.4.bb
new file mode 100644
index 0000000..56a3b99
--- /dev/null
+++ b/meta/recipes-devtools/cve-check-tool/cve-check-tool_5.6.4.bb
@@ -0,0 +1,59 @@
+SUMMARY = "cve-check-tool"
+DESCRIPTION = "cve-check-tool is a tool for checking known (public) CVEs.\
+The tool will identify potentially vunlnerable software packages within Linux distributions through version matching."
+HOMEPAGE = "https://github.com/ikeydoherty/cve-check-tool"
+SECTION = "Development/Tools"
+LICENSE = "GPL-2.0+"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=e8c1458438ead3c34974bc0be3a03ed6"
+
+SRC_URI = "https://github.com/ikeydoherty/${BPN}/releases/download/v${PV}/${BP}.tar.xz \
+           file://check-for-malloc_trim-before-using-it.patch \
+          "
+
+SRC_URI[md5sum] = "c5f4247140fc9be3bf41491d31a34155"
+SRC_URI[sha256sum] = "b8f283be718af8d31232ac1bfc10a0378fb958aaaa49af39168f8acf501e6a5b"
+
+DEPENDS = "libcheck glib-2.0 json-glib curl libxml2 sqlite3 openssl ca-certificates"
+
+RDEPENDS_${PN} = "ca-certificates"
+
+inherit pkgconfig autotools
+
+EXTRA_OECONF = "--disable-coverage"
+CFLAGS += "-Wno-error=pedantic"
+
+python do_populate_cve_db () {
+    import subprocess
+    import time
+
+    if d.getVar("BB_NO_NETWORK", True) == "1":
+        bb.error("BB_NO_NETWORK is set; Can't update cve-check-tool database, "
+                  "CVEs won't be checked")
+        return
+
+    bb.utils.export_proxies(d)
+    # In case we don't inherit cve-check class, use default values defined in the class.
+    cve_dir = d.getVar("CVE_CHECK_DB_DIR", True) or d.expand("${DL_DIR}/CVE_CHECK")
+    cve_file = d.getVar("CVE_CHECK_TMP_FILE", True) or d.expand("${TMPDIR}/cve_check")
+    cve_cmd = "cve-check-update"
+    cmd = [cve_cmd, "-d", cve_dir]
+    bb.debug(1, "Updating cve-check-tool database located in %s" % cve_dir)
+    try:
+        output = subprocess.check_output(cmd, stderr=subprocess.STDOUT)
+        bb.debug(2, "Command '%s' returned:\n%s" % ("\n".join(cmd), output))
+        time_utc = time.gmtime(time.time())
+        time_format = "%Y-%m-%d %H:%M:%S"
+        with open(cve_file, "w") as f:
+            f.write("CVE database was updated on %s UTC\n\n"
+                    % time.strftime(time_format, time_utc))
+
+    except subprocess.CalledProcessError as e:
+        bb.warn("Error in executing cve-check-update: %s (output %s)" % (e, e.output))
+        if bb.data.inherits_class('cve-check', d):
+            bb.warn("Failed to update cve-check-tool database, CVEs won't be checked")
+}
+
+addtask populate_cve_db after do_populate_sysroot
+do_populate_cve_db[nostamp] = "1"
+
+BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-devtools/cve-check-tool/files/check-for-malloc_trim-before-using-it.patch b/meta/recipes-devtools/cve-check-tool/files/check-for-malloc_trim-before-using-it.patch
new file mode 100644
index 0000000..0774ad9
--- /dev/null
+++ b/meta/recipes-devtools/cve-check-tool/files/check-for-malloc_trim-before-using-it.patch
@@ -0,0 +1,51 @@
+From ce64633b9733e962b8d8482244301f614d8b5845 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 22 Aug 2016 22:54:24 -0700
+Subject: [PATCH] Check for malloc_trim before using it
+
+malloc_trim is gnu specific and not all libc
+implement it, threfore write a configure check
+to poke for it first and use the define to
+guard its use.
+
+Helps in compiling on musl based systems
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Submitted [https://github.com/ikeydoherty/cve-check-tool/pull/48]
+ configure.ac | 2 ++
+ src/core.c   | 4 ++--
+ 2 files changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index d3b66ce..79c3542 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -19,6 +19,8 @@ m4_define([json_required_version], [0.16.0])
+ m4_define([openssl_required_version],[1.0.0])
+ # TODO: Set minimum sqlite
+ 
++AC_CHECK_FUNCS_ONCE(malloc_trim)
++
+ PKG_CHECK_MODULES(CVE_CHECK_TOOL,
+                  [
+                   glib-2.0 >= glib_required_version,
+diff --git a/src/core.c b/src/core.c
+index 6263031..0d5df29 100644
+--- a/src/core.c
++++ b/src/core.c
+@@ -498,9 +498,9 @@ bool cve_db_load(CveDB *self, const char *fname)
+         }
+ 
+         b = true;
+-
++#ifdef HAVE_MALLOC_TRIM
+         malloc_trim(0);
+-
++#endif
+         xmlFreeTextReader(r);
+         if (fd) {
+                 close(fd);
+-- 
+2.9.3
+
-- 
2.6.6


