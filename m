Return-Path: <mariano.lopez@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id D23D4773A5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Feb 2016 23:31:28 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 24 Feb 2016 15:31:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,495,1449561600"; d="scan'208";a="894058265"
Received: from yctb01.ostc.intel.com (HELO yctb01.otcr.intel.com)
	([10.54.69.55])
	by orsmga001.jf.intel.com with ESMTP; 24 Feb 2016 15:31:29 -0800
From: mariano.lopez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Wed, 24 Feb 2016 15:27:08 +0000
Message-Id: <5648c9e910e63de9aa29e1625ddab5e3804f179e.1456327117.git.mariano.lopez@linux.intel.com>
X-Mailer: git-send-email 2.6.2
In-Reply-To: <cover.1456327117.git.mariano.lopez@linux.intel.com>
References: <cover.1456327117.git.mariano.lopez@linux.intel.com>
In-Reply-To: <cover.1456327117.git.mariano.lopez@linux.intel.com>
References: <cover.1456327117.git.mariano.lopez@linux.intel.com>
Subject: [PATCH 3/3] cve-check.bbclass: Add class
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
X-List-Received-Date: Wed, 24 Feb 2016 23:31:29 -0000

From: Mariano Lopez <mariano.lopez@linux.intel.com>

This class adds a new task for all the recipes to use
cve-check-tool in order to look for public CVEs affecting
the packages generated.

It is possible to use this class when building an image,
building a recipe, or using the "world" or "universe" cases.

In order to use this class it must be inherited at some
point and it will add the task automatically to every recipe.

[YOCTO #7515]

Co-authored by Ross Burton & Mariano Lopez

Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Mariano Lopez <mariano.lopez@linux.intel.com>
---
 meta/classes/cve-check.bbclass | 229 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 229 insertions(+)
 create mode 100644 meta/classes/cve-check.bbclass

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
new file mode 100644
index 0000000..69d90f3
--- /dev/null
+++ b/meta/classes/cve-check.bbclass
@@ -0,0 +1,229 @@
+#
+CVE_CHECK_DB_DIR ?= "${DL_DIR}/CVE_CHECK"
+CVE_CHECK_DB_FILE ?= "${CVE_CHECK_DB_DIR}/nvd.db"
+
+CVE_CHECK_LOCAL_DIR ?= "${WORKDIR}/cve"
+CVE_CHECK_LOCAL_FILE ?= "${CVE_CHECK_LOCAL_DIR}/cve.log"
+CVE_CHECK_TMP_FILE ?= "${TMPDIR}/cve_check"
+
+CVE_CHECK_DIR ??= "${DEPLOY_DIR}/cve"
+CVE_CHECK_MANIFEST ?= "${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.cve"
+CVE_CHECK_COPY_FILES ??= "1"
+CVE_CHECK_CREATE_MANIFEST ??= "1"
+
+# Whitelist for packages (PN)
+cve_check_pn_whitelist () {
+    glibc-locale
+}
+
+# Whitelist for CVE and version of package
+python cve_check_cve_whitelist () {
+    {"CVE-2014-2524": ("6.3",), \
+    }
+}
+
+python do_cve_check () {
+    """
+    Check recipe for patched and unpatched CVEs
+    """
+
+    if os.path.exists(d.getVar("CVE_CHECK_TMP_FILE", True)):
+        patched_cves = get_patches_cves(d)
+        patched, unpatched = check_cves(d, patched_cves)
+        if patched or unpatched:
+            cve_data = get_cve_info(d, patched + unpatched)
+            cve_write_data(d, patched, unpatched, cve_data)
+    else:
+        bb.note("Failed to update CVE database, skipping CVE check")
+}
+
+addtask cve_check before do_build
+do_cve_check[depends] = "cve-check-tool-native:do_populate_cve_db"
+do_cve_check[nostamp] = "1"
+
+python cve_check_cleanup () {
+    """
+    Delete the file used to gather all the CVE information.
+    """
+    import bb.utils
+
+    tmp_file = e.data.getVar("CVE_CHECK_TMP_FILE", True)
+    bb.utils.remove(tmp_file)
+}
+
+addhandler cve_check_cleanup
+cve_check_cleanup[eventmask] = "bb.cooker.CookerExit"
+
+python cve_check_write_rootfs_manifest () {
+    """
+    Create CVE manifest when building an image
+    """
+
+    import shutil
+    from bb.utils import mkdirhier
+
+    if os.path.exists(d.getVar("CVE_CHECK_TMP_FILE", True)) and \
+            d.getVar("CVE_CHECK_CREATE_MANIFEST", True) == "1":
+        bb.note("Writing rootfs CVE manifest")
+        deploy_dir = d.getVar("DEPLOY_DIR_IMAGE", True)
+        link_name = d.getVar("IMAGE_LINK_NAME", True)
+        manifest_name = d.getVar("CVE_CHECK_MANIFEST", True)
+        cve_tmp_file = d.getVar("CVE_CHECK_TMP_FILE", True)
+
+        shutil.copyfile(cve_tmp_file, manifest_name)
+
+        if manifest_name is not None and os.path.exists(manifest_name):
+            manifest_link = os.path.join(deploy_dir, "%s.cve" % link_name)
+            if os.path.exists(manifest_link):
+                if d.getVar('RM_OLD_IMAGE', True) == "1" and \
+                        os.path.exists(os.path.realpath(manifest_link)):
+                    os.remove(os.path.realpath(manifest_link))
+                os.remove(manifest_link)
+            os.symlink(os.path.basename(manifest_name), manifest_link)
+            bb.plain("Image CVE report stored in: %s" % manifest_name)
+}
+
+ROOTFS_POSTPROCESS_COMMAND_prepend = "cve_check_write_rootfs_manifest; "
+
+
+def get_patches_cves(d):
+    """
+    Get patches that solve CVEs using the "CVE: " tag.
+    """
+
+    import re
+
+    pn = d.getVar("PN", True)
+    cve_match = re.compile("CVE:( CVE\-\d+\-\d+)+")
+    patched_cves = set()
+    for url in src_patches(d):
+        patch_file = bb.fetch.decodeurl(url)[2]
+        with open(patch_file, "r") as f:
+            patch_text = f.read()
+
+        # Search for the "CVE: " line
+        match = cve_match.search(patch_text)
+        if match:
+            # Get only the CVEs without the "CVE: " tag
+            cves = patch_text[match.start()+5:match.end()]
+            for cve in cves.split():
+                patched_cves.add(cve)
+
+    return patched_cves
+
+def check_cves(d, patched_cves):
+    """
+    Run cve-check-tool looking for patched and unpatched CVEs.
+    """
+
+    from bb.utils import export_proxies
+    import ast, csv, tempfile, subprocess, StringIO
+
+    cves_patched = []
+    cves_unpatched = []
+    bpn = d.getVar("BPN", True)
+    pv = d.getVar("PV", True)
+    cves = " ".join(patched_cves)
+    cve_dir = d.getVar("CVE_CHECK_DB_DIR", True)
+    cve_whitelist = ast.literal_eval(d.getVar("cve_check_cve_whitelist", True).strip())
+    cmd = "cve-check-tool --no-html --csv --not-affected -t faux -d %s" % cve_dir
+
+    # If the recipe has been whitlisted we return empty lists
+    if d.getVar("PN", True) in d.getVar("cve_check_pn_whitelist", True).split():
+        return ([], [])
+
+    # It is needed to export the proxies to download the database using HTTP
+    export_proxies(d)
+    # Write the faux CSV file to be used with cve-check-tool
+    fd, faux = tempfile.mkstemp(prefix="cve-faux-")
+    with os.fdopen(fd, "w") as f:
+        f.write("%s,%s,%s," % (bpn, pv, cves))
+
+    cmd += " %s" % faux
+    try:
+        popen = subprocess.Popen(cmd, shell=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
+        output, error = popen.communicate()
+    except:
+        bb.warn("Couldn't check CVEs %s" % str(sys.exc_info()))
+    finally:
+        os.remove(faux)
+
+    for row in csv.reader(StringIO.StringIO(output)):
+        if row[2]:
+            for cve in row[2].split():
+                # Skip if the CVE has been whitlisted for the current version
+                if pv not in cve_whitelist.get(cve,[]):
+                    cves_unpatched.append(cve)
+        if row[3]:
+            for cve in row[3].split():
+                cves_patched.append(cve)
+
+    return (cves_patched, cves_unpatched)
+
+def get_cve_info(d, cves):
+    """
+    Get CVE information from the database used by cve-check-tool.
+    """
+
+    try:
+        import sqlite3
+    except ImportError:
+        from pysqlite2 import dbapi2 as sqlite3
+
+    cve_data = {}
+    db_file = d.getVar("CVE_CHECK_DB_FILE", True)
+    placeholder = ",".join("?" * len(cves))
+    query = "SELECT * FROM NVD WHERE id IN (%s)" % placeholder
+    conn = sqlite3.connect(db_file)
+    cur = conn.cursor()
+    for row in cur.execute(query, tuple(cves)):
+        cve_data[row[0]] = {}
+        cve_data[row[0]]["summary"] = row[1]
+        cve_data[row[0]]["score"] = row[2]
+        cve_data[row[0]]["modified"] = row[3]
+        cve_data[row[0]]["vector"] = row[4]
+    conn.close()
+
+    return cve_data
+
+def cve_write_data(d, patched, unpatched, cve_data):
+    """
+    Write CVE information in WORKDIR; and to CVE_CHECK_DIR, and
+    CVE manifest if enabled.
+    """
+
+    from bb.utils import mkdirhier
+
+    cve_file = d.getVar("CVE_CHECK_LOCAL_FILE", True)
+    nvd_link = "https://web.nvd.nist.gov/view/vuln/detail?vulnId="
+    write_string = ""
+    mkdirhier(d.getVar("CVE_CHECK_LOCAL_DIR", True))
+
+    for cve in sorted(cve_data):
+        write_string += "PACKAGE NAME: %s\n" % d.getVar("PN", True)
+        write_string += "PACKAGE VERSION: %s\n" % d.getVar("PV", True)
+        write_string += "CVE: %s\n" % cve
+        if cve in patched:
+            write_string += "CVE STATUS: Patched\n"
+        else:
+            write_string += "CVE STATUS: Unpatched\n"
+            bb.warn("Found unpatched CVE, for more information check %s" % cve_file)
+        write_string += "CVE SUMMARY: %s\n" % cve_data[cve]["summary"]
+        write_string += "CVSS v2 BASE SCORE: %s\n" % cve_data[cve]["score"]
+        write_string += "VECTOR: %s\n" % cve_data[cve]["vector"]
+        write_string += "MORE INFORMATION: %s%s\n\n" % (nvd_link, cve)
+
+    with open(cve_file, "w") as f:
+        f.write(write_string)
+
+    if d.getVar("CVE_CHECK_COPY_FILES", True) == "1":
+        cve_dir = d.getVar("CVE_CHECK_DIR", True)
+        mkdirhier(cve_dir)
+        deploy_file = os.path.join(cve_dir, d.getVar("PN", True))
+        with open(deploy_file, "w") as f:
+            f.write(write_string)
+
+    if d.getVar("CVE_CHECK_CREATE_MANIFEST", True) == "1":
+        with open(d.getVar("CVE_CHECK_TMP_FILE", True), "a") as f:
+            f.write("%s" % write_string)
+
-- 
2.6.2


