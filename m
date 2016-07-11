Return-Path: <mariano.lopez@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 9D7C760589
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jul 2016 20:59:00 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga102.fm.intel.com with ESMTP; 11 Jul 2016 13:58:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,348,1464678000"; d="scan'208";a="993112603"
Received: from yctb01.ostc.intel.com (HELO yctb01.otcr.intel.com)
	([10.54.69.55])
	by orsmga001.jf.intel.com with ESMTP; 11 Jul 2016 13:58:57 -0700
From: mariano.lopez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Jul 2016 12:52:41 +0000
Message-Id: <5249539744d86c132ab2566a3bb99de260880e6d.1468241364.git.mariano.lopez@linux.intel.com>
X-Mailer: git-send-email 2.6.6
In-Reply-To: <cover.1456412549.git.mariano.lopez@linux.intel.com>
References: <cover.1456412549.git.mariano.lopez@linux.intel.com>
In-Reply-To: <cover.1468241364.git.mariano.lopez@linux.intel.com>
References: <cover.1468241364.git.mariano.lopez@linux.intel.com>
Subject: [PATCHv3 1/2] cve-check-tool: Add recipe
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
X-List-Received-Date: Mon, 11 Jul 2016 20:59:03 -0000

From: Mariano Lopez <mariano.lopez@linux.intel.com>

cve-check-tool is a program for public CVEs checking.
This tool also seek to determine if a vulnerability has
been addressed by a patch.

The recipe also includes the do_populate_cve_db task
that will populate the database used by the tool.

[YOCTO #7515]

Signed-off-by: Mariano Lopez <mariano.lopez@linux.intel.com>
---
 .../cve-check-tool/cve-check-tool_5.6.4.bb         | 55 ++++++++++++++++++++++
 1 file changed, 55 insertions(+)
 create mode 100644 meta/recipes-devtools/cve-check-tool/cve-check-tool_5.6.4.bb

diff --git a/meta/recipes-devtools/cve-check-tool/cve-check-tool_5.6.4.bb b/meta/recipes-devtools/cve-check-tool/cve-check-tool_5.6.4.bb
new file mode 100644
index 0000000..0cf64e4
--- /dev/null
+++ b/meta/recipes-devtools/cve-check-tool/cve-check-tool_5.6.4.bb
@@ -0,0 +1,55 @@
+SUMMARY = "cve-check-tool"
+DESCRIPTION = "cve-check-tool is a tool for checking known (public) CVEs.\
+The tool will identify potentially vunlnerable software packages within Linux distributions through version matching."
+HOMEPAGE = "https://github.com/ikeydoherty/cve-check-tool"
+SECTION = "Development/Tools"
+LICENSE = "GPL-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=e8c1458438ead3c34974bc0be3a03ed6"
+
+SRC_URI = "https://github.com/ikeydoherty/${BPN}/releases/download/v${PV}/${BP}.tar.xz"
+
+SRC_URI[md5sum] = "c5f4247140fc9be3bf41491d31a34155"
+SRC_URI[sha256sum] = "b8f283be718af8d31232ac1bfc10a0378fb958aaaa49af39168f8acf501e6a5b"
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
+        if bb.data.inherits_class('cve-check', d):
+            time_utc = time.gmtime(time.time())
+            time_format = "%Y-%m-%d %H:%M:%S"
+            with open(cve_file, "w") as f:
+                f.write("CVE database was updated on %s UTC\n\n"
+                        % time.strftime(time_format, time_utc))
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
+BBCLASSEXTEND = "native"
-- 
2.6.6


