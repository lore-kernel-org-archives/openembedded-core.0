Return-Path: <gtertych@cisco.com>
Received: from aer-iport-1.cisco.com (aer-iport-1.cisco.com [173.38.203.51])
	by mail.openembedded.org (Postfix) with ESMTP id 2F0CC79A5C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Oct 2018 16:25:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=cisco.com; i=@cisco.com; l=8147; q=dns/txt; s=iport;
	t=1539188711; x=1540398311;
	h=from:to:cc:subject:date:message-id:mime-version:
	content-transfer-encoding;
	bh=E0u+R8n+M6zo9hw8Pxqj31WGXwXCzK75AIuV9ilLH90=;
	b=Sjxo8Ad+znc9LLWpZ5dHa3DFb5zRfrvMbGD8nX0Xd+irmTSrRG8qfkL6
	aly6y80Pjc4C3GpbclHQH2YIZ9GB1p23ySuByZqRSYs07Pk0gz6zQWPVa
	ko+hKD/shiLvB/X4KPJ0pgfQ2q0karF17FwKoiyS6+JEHXjHPxv+XuGoY o=;
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0BWAAD0Jr5b/xbLJq1kGgEBAQEBAgE?=
	=?us-ascii?q?BAQEHAgEBAQGBZYFaKoFTEiiMaZZij3kNhGyEczgWAQMBAQIBAQJtKIVyATM?=
	=?us-ascii?q?TgVGCVkuBdQ2mZYR3hGQUhwiENoFBP4VKg0SFbAKIVYVcb02OGQmQRgsXgU+?=
	=?us-ascii?q?HeYZDiROMeYFZIUGBFHAVO4JskFg8MIoSgkwBAQ?=
X-IronPort-AV: E=Sophos;i="5.54,364,1534809600"; 
   d="scan'208";a="7142856"
Received: from aer-iport-nat.cisco.com (HELO aer-core-3.cisco.com)
	([173.38.203.22])
	by aer-iport-1.cisco.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	10 Oct 2018 16:25:10 +0000
Received: from think.cisco.com (dhcp-10-61-106-181.cisco.com [10.61.106.181])
	by aer-core-3.cisco.com (8.15.2/8.15.2) with ESMTP id w9AGP9xh020074;
	Wed, 10 Oct 2018 16:25:10 GMT
From: grygorii tertychnyi <gtertych@cisco.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 10 Oct 2018 19:25:11 +0300
Message-Id: <20181010162511.7273-3-gtertych@cisco.com>
X-Mailer: git-send-email 2.19.0
MIME-Version: 1.0
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-SMTP-Client: 10.61.106.181, dhcp-10-61-106-181.cisco.com
X-Outbound-Node: aer-core-3.cisco.com
Cc: xe-linux-external@cisco.com
Subject: [PATCH v3 3/3] cve-report.bbclass: add class
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
X-List-Received-Date: Wed, 10 Oct 2018 16:25:11 -0000
Content-Transfer-Encoding: 8bit

Implements "report_cve" and "report_patched" tasks.

"report_patched" prepares image manifest with patched CVE info.
"report_cve" runs cvert-* scripts to generate kernel and package CVE reports.

You can configure it to set report filenames, reuse NVD feeds,
stop after manifest generation and ignore specific classes,
like native, nativesdk, etc.

Signed-off-by: grygorii tertychnyi <gtertych@cisco.com>
---

Changes in v3:
 o no kernel part

 meta/classes/cve-report.bbclass | 216 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 216 insertions(+)
 create mode 100644 meta/classes/cve-report.bbclass

diff --git a/meta/classes/cve-report.bbclass b/meta/classes/cve-report.bbclass
new file mode 100644
index 000000000000..35d58d0821a9
--- /dev/null
+++ b/meta/classes/cve-report.bbclass
@@ -0,0 +1,216 @@
+# Class to inherit when you want to generate a CVE reports.
+#
+# Generates package list file and package CVE report.
+#
+# Example:
+#   echo 'INHERIT += "cve-report"' >> conf/local.conf
+#   bitbake -c report_cve core-image-minimal
+#
+# Variables to be passed to "cvert-*" scripts:
+#
+# CVE_REPORT_MODE[foss]
+#     Path to the CVE FOSS report to be generated.
+#
+# CVE_REPORT_MODE[restore]
+#     Path to the CVE dump data file.
+#
+#     E.g. for multiple MACHINEs:
+#     (1) generate CVE dump:
+#         cvert-update --store /path/to/cvedump $TEMP/nvdfeed
+#     (2) for mach in $(get_machine_list); do
+#             (source oe-init-build-env "build-$mach";
+#             echo 'CVE_REPORT_MODE[restore] = "/path/to/cvedump"' >> conf/local.conf;
+#             echo 'CVE_REPORT_MODE[foss] = "/path/to/report-foss-'${mach}'"' >> conf/local.conf;
+#             MACHINE=$mach bitbake -c report_cve core-image-minimal)
+#         done
+#
+# CVE_REPORT_MODE[offline]
+#     Either "0" or "1". Offline mode ("--offline" parameter for cvert-* scripts).
+#
+# CVE_REPORT_MODE[feeddir]
+#     Path to the NVD feed directory.
+#
+# CVE_REPORT_MODE[packagelist]
+#     Path to the package list file to be generated.
+#
+# CVE_REPORT_MODE[packageonly]
+#     Either "0" or "1". Generate package list file, then stop.
+#
+# CVE_REPORT_MODE[blacklist]
+#     Ignore specific class.
+#
+
+CVE_REPORT_MODE[foss] ?= "${LOG_DIR}/cvert/report-foss.txt"
+CVE_REPORT_MODE[offline] ?= "0"
+CVE_REPORT_MODE[feeddir] ?= "${LOG_DIR}/nvdfeeds"
+CVE_REPORT_MODE[packagelist] ?= "${LOG_DIR}/cvert/package.lst"
+CVE_REPORT_MODE[packageonly] ?= "0"
+CVE_REPORT_MODE[blacklist] ?= "native,nativesdk,cross,crosssdk,cross-canadian,packagegroup,image"
+
+CVE_PRODUCT ??= "${BPN}"
+CVE_VERSION ??= "${PV}"
+
+addhandler generate_report_handler
+generate_report_handler[eventmask] = "bb.event.BuildCompleted"
+
+def cvert_update(d):
+    """Update NVD storage and prepare CVE dump"""
+
+    import tempfile
+    import subprocess
+
+    bb.utils.export_proxies(d)
+
+    dump = os.path.join(d.getVar("LOG_DIR"), "cvedump")
+
+    bb.note("Updating CVE database: %s" % dump)
+
+    cmd = [
+        "cvert-update",
+        "--store", dump,
+        "--debug",
+        d.getVarFlag("CVE_REPORT_MODE", "feeddir")
+    ]
+
+    if d.getVarFlag("CVE_REPORT_MODE", "offline") != "0":
+        cmd.append("--offline")
+
+    try:
+        bb.debug(2, "Call '%s'" % " ".join(cmd))
+        output = subprocess.check_output(cmd, stderr=subprocess.STDOUT).decode()
+        bb.debug(2, "Output: %s" % output)
+    except subprocess.CalledProcessError as e:
+        bb.error("Failed to run cvert-update: '%s'\n%s: %s" % (" ".join(cmd), e, e.output))
+
+    return dump
+
+# copied from cve-check.bbclass
+def get_patches_cves(d):
+    """Get patches that solve CVEs using the "CVE: " tag"""
+
+    import re
+
+    pn = d.getVar("PN")
+    cve_match = re.compile("CVE:( CVE\-\d{4}\-\d+)+")
+
+    # Matches last CVE-1234-211432 in the file name, also if written
+    # with small letters. Not supporting multiple CVE id's in a single
+    # file name.
+    cve_file_name_match = re.compile(".*([Cc][Vv][Ee]\-\d{4}\-\d+)")
+
+    patched_cves = set()
+    bb.debug(2, "Looking for patches that solves CVEs for %s" % pn)
+    for url in src_patches(d):
+        patch_file = bb.fetch.decodeurl(url)[2]
+
+        # Check patch file name for CVE ID
+        fname_match = cve_file_name_match.search(patch_file)
+        if fname_match:
+            cve = fname_match.group(1).upper()
+            patched_cves.add(cve)
+            bb.debug(2, "Found CVE %s from patch file name %s" % (cve, patch_file))
+
+        with open(patch_file, "r", encoding="utf-8") as f:
+            try:
+                patch_text = f.read()
+            except UnicodeDecodeError:
+                bb.debug(1, "Failed to read patch %s using UTF-8 encoding"
+                        " trying with iso8859-1" %  patch_file)
+                f.close()
+                with open(patch_file, "r", encoding="iso8859-1") as f:
+                    patch_text = f.read()
+
+        # Search for one or more "CVE: " lines
+        text_match = False
+        for match in cve_match.finditer(patch_text):
+            # Get only the CVEs without the "CVE: " tag
+            cves = patch_text[match.start()+5:match.end()]
+            for cve in cves.split():
+                bb.debug(2, "Patch %s solves %s" % (patch_file, cve))
+                patched_cves.add(cve)
+                text_match = True
+
+        if not fname_match and not text_match:
+            bb.debug(2, "Patch %s doesn't solve CVEs" % patch_file)
+
+    return patched_cves
+
+
+python generate_report_handler() {
+    if d.getVarFlag("CVE_REPORT_MODE", "packageonly") != "0":
+        return
+
+    import subprocess
+
+    restore = d.getVarFlag("CVE_REPORT_MODE", "restore")
+
+    if not restore:
+        restore = cvert_update(d)
+
+    if os.path.exists(d.getVarFlag("CVE_REPORT_MODE", "packagelist")):
+        report_foss = d.getVarFlag("CVE_REPORT_MODE", "foss")
+
+        bb.note("Generating CVE FOSS report: %s" % report_foss)
+
+        cmd = [
+            "cvert-foss",
+            "--restore", restore,
+            "--output", report_foss,
+            d.getVarFlag("CVE_REPORT_MODE", "packagelist")
+        ]
+
+        try:
+            bb.debug(2, "Call '%s'" % " ".join(cmd))
+            output = subprocess.check_output(cmd, stderr=subprocess.STDOUT).decode()
+            bb.debug(2, "Output: %s" % output)
+        except subprocess.CalledProcessError as e:
+            bb.error("Failed to run cvert-foss: '%s'\n%s: %s" % (" ".join(cmd), e, e.output))
+}
+
+addhandler build_started
+build_started[eventmask] = "bb.event.BuildStarted"
+
+python build_started() {
+    packagelist = d.getVarFlag("CVE_REPORT_MODE", "packagelist")
+    bb.utils.remove(packagelist)
+    bb.utils.mkdirhier(os.path.dirname(packagelist))
+    bb.note("Package list: ", packagelist)
+}
+
+addtask do_report_cve after do_report_patched
+
+do_report_cve[recrdeptask] = "do_report_cve do_report_patched"
+do_report_cve[recideptask] = "do_${BB_DEFAULT_TASK}"
+do_report_cve[nostamp] = "1"
+
+do_report_cve() {
+    :
+}
+
+python do_report_patched() {
+    if not d.getVar("SRC_URI"):
+        return
+
+    cve_product = d.getVar("CVE_PRODUCT")
+
+    if not cve_product:
+        return
+
+    cve_version = d.getVar("CVE_VERSION")
+    patched_cves = get_patches_cves(d)
+
+    with open(d.getVarFlag("CVE_REPORT_MODE", "packagelist"), "a") as fil:
+        fil.write("%s,%s,%s\n" % (cve_product, cve_version, " ".join(patched_cves)))
+        bb.debug(2, "Append to package-list: '%s,%s,%s'" % (cve_product, cve_version, " ".join(patched_cves)))
+}
+
+addtask do_report_patched after do_unpack before do_build
+
+do_report_patched[nostamp] = "1"
+
+python() {
+    for b in d.getVarFlag("CVE_REPORT_MODE", "blacklist").split(","):
+        if bb.data.inherits_class(b, d):
+            bb.build.deltask("do_report_patched", d)
+            break
+}
-- 
2.10.3.dirty


