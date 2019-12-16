Return-Path: <akuster808@gmail.com>
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com
	[209.85.216.45])
	by mail.openembedded.org (Postfix) with ESMTP id 303927FDB1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Dec 2019 16:00:18 +0000 (UTC)
Received: by mail-pj1-f45.google.com with SMTP id o11so3156923pjp.9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Dec 2019 08:00:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version:in-reply-to:references
	:content-transfer-encoding;
	bh=D789KSiBZyq0onz80h8JmanAVg7At77qfV3WY6kt4Og=;
	b=VMXSuqun02MF42qnz6omTI5CbvQF80Y92Z91YB/OdlukkzPIpUZGfnE0rAY4PNuNBk
	2cjwcrwUTgeg3ZIWXBsZJCvJzA4ytL2bsv8q3UctTMj7MZDjqssIAcNfSk7UZpMmopUt
	A0jAR83bDjaQqapO/1NYjMmLEKIrCXNQt9ebFOS/J7XNsWCA1gwnymnRa+krnseA++YO
	0ATHU/x3Dy5Oa2+HHdIXNUmwk5zrQSFTk4mQZvwVCgZJLBZ7mbODLqI8RuUmQPg4p0g3
	FjX0p69QQeTjupFJyHV6I+SZy7oa0ZJMGdE0YtU7ZmGwTEKaclmj0w6Nb5E3WIJP2MWW
	6kaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:in-reply-to:references:content-transfer-encoding;
	bh=D789KSiBZyq0onz80h8JmanAVg7At77qfV3WY6kt4Og=;
	b=QHsBfA0djhGpcHBzm8Mx8JWoCWn5BEJq2Mg9Beb/H8eZ9Yk5cC0M05wFAvGm1v2nQ5
	PeGmSedmjcRniuKiuRUrDCj45/EAk/qUgMVbOnL6ZmfEG+Xp9yZV13AlUKZubs79emHw
	qFmwxL1UQ3I6CnGzCGmBc0AkN2ntnzXVqKRecTjmtTh/ern81eOE2E/WDr4ol+ima0GE
	sZaccmFtpeic/imzeEmFJ4ffIhR7oTlEvmcpwdN6Z84n75MDvxyI9G4GnNpFuSOEvB+z
	7PWZjRTj7jxFArO2f8blYDPIchnO+HG3YsNYCp7/ORe5W2kX38m5Qq4Aa0/RAraLcriv
	ozzg==
X-Gm-Message-State: APjAAAUCzRARcY6zYEORwkjHenghpx5KjJwYy+89T1Oe7iqRn311zb9b
	qPp1ojxBrHBD3tuVvi549fEIu5WsdFg=
X-Google-Smtp-Source: APXvYqz+qEHDbM5EiQVoSi2H35pN1yUCpwXlPmbTaI50x+R7bJ2zM/1avDjci97d6D86y7XNtCnd4w==
X-Received: by 2002:a17:902:b709:: with SMTP id
	d9mr16854977pls.235.1576512017706; 
	Mon, 16 Dec 2019 08:00:17 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:e5c5:31c9:a010:f145])
	by smtp.gmail.com with ESMTPSA id
	g6sm19568697pjl.25.2019.12.16.08.00.16
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 16 Dec 2019 08:00:16 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 16 Dec 2019 07:59:56 -0800
Message-Id: <beeed02f9831e75c3f773e44d7efc726f1ff859c.1576511913.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
In-Reply-To: <cover.1576511913.git.akuster808@gmail.com>
References: <cover.1576511913.git.akuster808@gmail.com>
Subject: [thud 06/18] cve-check: backport rewrite from master
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
X-List-Received-Date: Mon, 16 Dec 2019 16:00:18 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Ross Burton <ross.burton@intel.com>

As detailed at [1] the XML feeds provided by NIST are being discontinued on
October 9th 2019.  As cve-check-tool uses these feeds, cve-check.bbclass will be
inoperable after this date.

To ensure that cve-check continues working, backport the following commits from
master to move away from the unmaintained cve-check-tool to our own Python code
that fetches the JSON:

546d14135c5 cve-update-db: New recipe to update CVE database
bc144b028f6 cve-check: Remove dependency to cve-check-tool-native
7f62a20b32a cve-check: Manage CVE_PRODUCT with more than one name
3bf63bc6084 cve-check: Consider CVE that affects versions with less than operator
c0eabd30d7b cve-update-db: Use std library instead of urllib3
27eb839ee65 cve-check: be idiomatic
09be21f4d17 cve-update-db: Manage proxy if needed.
975793e3825 cve-update-db: do_populate_cve_db depends on do_fetch
0325dd72714 cve-update-db: Catch request.urlopen errors.
4078da92b49 cve-check: Depends on cve-update-db-native
f7676e9a38d cve-update-db: Use NVD CPE data to populate PRODUCTS table
bc0195be1b1 cve-check: Update unpatched CVE matching
c807c2a6409 cve-update-db-native: Skip recipe when cve-check class is not loaded.
07bb8b25e17 cve-check: remove redundant readline CVE whitelisting
5388ed6d137 cve-check-tool: remove
270ac00cb43 cve-check.bbclass: initialize to_append
e6bf9000987 cve-check: allow comparison of Vendor as well as Product
91770338f76 cve-update-db-native: use SQL placeholders instead of format strings
7069302a4cc cve-check: Replace CVE_CHECK_CVE_WHITELIST by CVE_CHECK_WHITELIST
78de2cb39d7 cve-update-db-native: Remove hash column from database.
4b301030cf9 cve-update-db-native: use os.path.join instead of +
f0d822fad2a cve-update-db: actually inherit native
b309840b6aa cve-update-db-native: use executemany() to optimise CPE insertion
bb4e53af33d cve-update-db-native: improve metadata parsing
94227459792 cve-update-db-native: clean up JSON fetching
95438d52b73 cve-update-db-native: fix https proxy issues
1f9a963b9ff glibc: exclude child recipes from CVE scanning

[1] https://nvd.nist.gov/General/News/XML-Vulnerability-Feed-Retirement

(From OE-Core rev: 8c87e78547c598cada1bce92e7b25d85b994e2eb)

Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/classes/cve-check.bbclass                     | 142 ++++++++------
 meta/conf/distro/include/maintainers.inc           |   1 +
 meta/recipes-core/glibc/glibc-locale.inc           |   3 +
 meta/recipes-core/glibc/glibc-mtrace.inc           |   3 +
 meta/recipes-core/glibc/glibc-scripts.inc          |   3 +
 meta/recipes-core/meta/cve-update-db-native.bb     | 195 +++++++++++++++++++
 .../cve-check-tool/cve-check-tool_5.6.4.bb         |  62 ------
 ...01-Fix-freeing-memory-allocated-by-sqlite.patch |  50 -----
 ...ow-overriding-default-CA-certificate-file.patch | 215 ---------------------
 ...ogress-in-percent-when-downloading-CVE-db.patch | 135 -------------
 ...are-computed-vs-expected-sha256-digit-str.patch |  52 -----
 .../check-for-malloc_trim-before-using-it.patch    |  51 -----
 12 files changed, 292 insertions(+), 620 deletions(-)
 create mode 100644 meta/recipes-core/meta/cve-update-db-native.bb
 delete mode 100644 meta/recipes-devtools/cve-check-tool/cve-check-tool_5.6.4.bb
 delete mode 100644 meta/recipes-devtools/cve-check-tool/files/0001-Fix-freeing-memory-allocated-by-sqlite.patch
 delete mode 100644 meta/recipes-devtools/cve-check-tool/files/0001-curl-allow-overriding-default-CA-certificate-file.patch
 delete mode 100644 meta/recipes-devtools/cve-check-tool/files/0001-print-progress-in-percent-when-downloading-CVE-db.patch
 delete mode 100644 meta/recipes-devtools/cve-check-tool/files/0001-update-Compare-computed-vs-expected-sha256-digit-str.patch
 delete mode 100644 meta/recipes-devtools/cve-check-tool/files/check-for-malloc_trim-before-using-it.patch

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
index 743bc08..c00d291 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -26,7 +26,7 @@ CVE_PRODUCT ??= "${BPN}"
 CVE_VERSION ??= "${PV}"
 
 CVE_CHECK_DB_DIR ?= "${DL_DIR}/CVE_CHECK"
-CVE_CHECK_DB_FILE ?= "${CVE_CHECK_DB_DIR}/nvd.db"
+CVE_CHECK_DB_FILE ?= "${CVE_CHECK_DB_DIR}/nvdcve_1.0.db"
 
 CVE_CHECK_LOG ?= "${T}/cve.log"
 CVE_CHECK_TMP_FILE ?= "${TMPDIR}/cve_check"
@@ -37,32 +37,33 @@ CVE_CHECK_COPY_FILES ??= "1"
 CVE_CHECK_CREATE_MANIFEST ??= "1"
 
 # Whitelist for packages (PN)
-CVE_CHECK_PN_WHITELIST = "\
-    glibc-locale \
-"
+CVE_CHECK_PN_WHITELIST ?= ""
 
-# Whitelist for CVE and version of package
-CVE_CHECK_CVE_WHITELIST = "{\
-    'CVE-2014-2524': ('6.3','5.2',), \
-}"
+# Whitelist for CVE. If a CVE is found, then it is considered patched.
+# The value is a string containing space separated CVE values:
+# 
+# CVE_CHECK_WHITELIST = 'CVE-2014-2524 CVE-2018-1234'
+# 
+CVE_CHECK_WHITELIST ?= ""
 
 python do_cve_check () {
     """
     Check recipe for patched and unpatched CVEs
     """
 
-    if os.path.exists(d.getVar("CVE_CHECK_TMP_FILE")):
+    if os.path.exists(d.getVar("CVE_CHECK_DB_FILE")):
         patched_cves = get_patches_cves(d)
         patched, unpatched = check_cves(d, patched_cves)
         if patched or unpatched:
             cve_data = get_cve_info(d, patched + unpatched)
             cve_write_data(d, patched, unpatched, cve_data)
     else:
-        bb.note("Failed to update CVE database, skipping CVE check")
+        bb.note("No CVE database found, skipping CVE check")
+
 }
 
 addtask cve_check after do_unpack before do_build
-do_cve_check[depends] = "cve-check-tool-native:do_populate_sysroot cve-check-tool-native:do_populate_cve_db"
+do_cve_check[depends] = "cve-update-db-native:do_populate_cve_db"
 do_cve_check[nostamp] = "1"
 
 python cve_check_cleanup () {
@@ -163,65 +164,94 @@ def get_patches_cves(d):
 
 def check_cves(d, patched_cves):
     """
-    Run cve-check-tool looking for patched and unpatched CVEs.
+    Connect to the NVD database and find unpatched cves.
     """
-
     import ast, csv, tempfile, subprocess, io
+    from distutils.version import LooseVersion
 
-    cves_patched = []
     cves_unpatched = []
-    bpn = d.getVar("CVE_PRODUCT")
+    # CVE_PRODUCT can contain more than one product (eg. curl/libcurl)
+    products = d.getVar("CVE_PRODUCT").split()
     # If this has been unset then we're not scanning for CVEs here (for example, image recipes)
-    if not bpn:
+    if not products:
         return ([], [])
     pv = d.getVar("CVE_VERSION").split("+git")[0]
-    cves = " ".join(patched_cves)
-    cve_db_dir = d.getVar("CVE_CHECK_DB_DIR")
-    cve_whitelist = ast.literal_eval(d.getVar("CVE_CHECK_CVE_WHITELIST"))
-    cve_cmd = "cve-check-tool"
-    cmd = [cve_cmd, "--no-html", "--skip-update", "--csv", "--not-affected", "-t", "faux", "-d", cve_db_dir]
 
     # If the recipe has been whitlisted we return empty lists
     if d.getVar("PN") in d.getVar("CVE_CHECK_PN_WHITELIST").split():
         bb.note("Recipe has been whitelisted, skipping check")
         return ([], [])
 
-    try:
-        # Write the faux CSV file to be used with cve-check-tool
-        fd, faux = tempfile.mkstemp(prefix="cve-faux-")
-        with os.fdopen(fd, "w") as f:
-            for pn in bpn.split():
-                f.write("%s,%s,%s,\n" % (pn, pv, cves))
-        cmd.append(faux)
-
-        output = subprocess.check_output(cmd).decode("utf-8")
-        bb.debug(2, "Output of command %s:\n%s" % ("\n".join(cmd), output))
-    except subprocess.CalledProcessError as e:
-        bb.warn("Couldn't check for CVEs: %s (output %s)" % (e, e.output))
-    finally:
-        os.remove(faux)
-
-    for row in csv.reader(io.StringIO(output)):
-        # Third row has the unpatched CVEs
-        if row[2]:
-            for cve in row[2].split():
-                # Skip if the CVE has been whitlisted for the current version
-                if pv in cve_whitelist.get(cve,[]):
-                    bb.note("%s-%s has been whitelisted for %s" % (bpn, pv, cve))
+    old_cve_whitelist =  d.getVar("CVE_CHECK_CVE_WHITELIST")
+    if old_cve_whitelist:
+        bb.warn("CVE_CHECK_CVE_WHITELIST is deprecated, please use CVE_CHECK_WHITELIST.")
+    cve_whitelist = d.getVar("CVE_CHECK_WHITELIST").split()
+
+    import sqlite3
+    db_file = d.getVar("CVE_CHECK_DB_FILE")
+    conn = sqlite3.connect(db_file)
+
+    for product in products:
+        c = conn.cursor()
+        if ":" in product:
+            vendor, product = product.split(":", 1)
+            c.execute("SELECT * FROM PRODUCTS WHERE PRODUCT IS ? AND VENDOR IS ?", (product, vendor))
+        else:
+            c.execute("SELECT * FROM PRODUCTS WHERE PRODUCT IS ?", (product,))
+
+        for row in c:
+            cve = row[0]
+            version_start = row[3]
+            operator_start = row[4]
+            version_end = row[5]
+            operator_end = row[6]
+
+            if cve in cve_whitelist:
+                bb.note("%s-%s has been whitelisted for %s" % (product, pv, cve))
+            elif cve in patched_cves:
+                bb.note("%s has been patched" % (cve))
+            else:
+                to_append = False
+                if (operator_start == '=' and pv == version_start):
+                    cves_unpatched.append(cve)
                 else:
+                    if operator_start:
+                        try:
+                            to_append_start =  (operator_start == '>=' and LooseVersion(pv) >= LooseVersion(version_start))
+                            to_append_start |= (operator_start == '>' and LooseVersion(pv) > LooseVersion(version_start))
+                        except:
+                            bb.note("%s: Failed to compare %s %s %s for %s" %
+                                    (product, pv, operator_start, version_start, cve))
+                            to_append_start = False
+                    else:
+                        to_append_start = False
+
+                    if operator_end:
+                        try:
+                            to_append_end  = (operator_end == '<=' and LooseVersion(pv) <= LooseVersion(version_end))
+                            to_append_end |= (operator_end == '<' and LooseVersion(pv) < LooseVersion(version_end))
+                        except:
+                            bb.note("%s: Failed to compare %s %s %s for %s" %
+                                    (product, pv, operator_end, version_end, cve))
+                            to_append_end = False
+                    else:
+                        to_append_end = False
+
+                    if operator_start and operator_end:
+                        to_append = to_append_start and to_append_end
+                    else:
+                        to_append = to_append_start or to_append_end
+
+                if to_append:
                     cves_unpatched.append(cve)
-                    bb.debug(2, "%s-%s is not patched for %s" % (bpn, pv, cve))
-        # Fourth row has patched CVEs
-        if row[3]:
-            for cve in row[3].split():
-                cves_patched.append(cve)
-                bb.debug(2, "%s-%s is patched for %s" % (bpn, pv, cve))
+                bb.debug(2, "%s-%s is not patched for %s" % (product, pv, cve))
+    conn.close()
 
-    return (cves_patched, cves_unpatched)
+    return (list(patched_cves), cves_unpatched)
 
 def get_cve_info(d, cves):
     """
-    Get CVE information from the database used by cve-check-tool.
+    Get CVE information from the database.
 
     Unfortunately the only way to get CVE info is set the output to
     html (hard to parse) or query directly the database.
@@ -241,9 +271,10 @@ def get_cve_info(d, cves):
     for row in cur.execute(query, tuple(cves)):
         cve_data[row[0]] = {}
         cve_data[row[0]]["summary"] = row[1]
-        cve_data[row[0]]["score"] = row[2]
-        cve_data[row[0]]["modified"] = row[3]
-        cve_data[row[0]]["vector"] = row[4]
+        cve_data[row[0]]["scorev2"] = row[2]
+        cve_data[row[0]]["scorev3"] = row[3]
+        cve_data[row[0]]["modified"] = row[4]
+        cve_data[row[0]]["vector"] = row[5]
     conn.close()
 
     return cve_data
@@ -270,7 +301,8 @@ def cve_write_data(d, patched, unpatched, cve_data):
             unpatched_cves.append(cve)
             write_string += "CVE STATUS: Unpatched\n"
         write_string += "CVE SUMMARY: %s\n" % cve_data[cve]["summary"]
-        write_string += "CVSS v2 BASE SCORE: %s\n" % cve_data[cve]["score"]
+        write_string += "CVSS v2 BASE SCORE: %s\n" % cve_data[cve]["scorev2"]
+        write_string += "CVSS v3 BASE SCORE: %s\n" % cve_data[cve]["scorev3"]
         write_string += "VECTOR: %s\n" % cve_data[cve]["vector"]
         write_string += "MORE INFORMATION: %s%s\n\n" % (nvd_link, cve)
 
diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 672f067..c027901 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -116,6 +116,7 @@ RECIPE_MAINTAINER_pn-cryptodev-tests = "Robert Yang <liezhi.yang@windriver.com>"
 RECIPE_MAINTAINER_pn-cups = "Chen Qi <Qi.Chen@windriver.com>"
 RECIPE_MAINTAINER_pn-curl = "Armin Kuster <akuster808@gmail.com>"
 RECIPE_MAINTAINER_pn-cve-check-tool = "Ross Burton <ross.burton@intel.com>"
+RECIPE_MAINTAINER_pn-cve-update-db-native = "Ross Burton <ross.burton@intel.com>"
 RECIPE_MAINTAINER_pn-cwautomacros = "Ross Burton <ross.burton@intel.com>"
 RECIPE_MAINTAINER_pn-db = "Mark Hatle <mark.hatle@windriver.com>"
 RECIPE_MAINTAINER_pn-dbus = "Chen Qi <Qi.Chen@windriver.com>"
diff --git a/meta/recipes-core/glibc/glibc-locale.inc b/meta/recipes-core/glibc/glibc-locale.inc
index 1b676dc..97d83cb 100644
--- a/meta/recipes-core/glibc/glibc-locale.inc
+++ b/meta/recipes-core/glibc/glibc-locale.inc
@@ -95,3 +95,6 @@ do_install () {
 inherit libc-package
 
 BBCLASSEXTEND = "nativesdk"
+
+# Don't scan for CVEs as glibc will be scanned
+CVE_PRODUCT = ""
diff --git a/meta/recipes-core/glibc/glibc-mtrace.inc b/meta/recipes-core/glibc/glibc-mtrace.inc
index d703c14..ef9d60e 100644
--- a/meta/recipes-core/glibc/glibc-mtrace.inc
+++ b/meta/recipes-core/glibc/glibc-mtrace.inc
@@ -11,3 +11,6 @@ do_install() {
 	install -d -m 0755 ${D}${bindir}
 	install -m 0755 ${SRC}/mtrace ${D}${bindir}/
 }
+
+# Don't scan for CVEs as glibc will be scanned
+CVE_PRODUCT = ""
diff --git a/meta/recipes-core/glibc/glibc-scripts.inc b/meta/recipes-core/glibc/glibc-scripts.inc
index 2a2b415..14a14e4 100644
--- a/meta/recipes-core/glibc/glibc-scripts.inc
+++ b/meta/recipes-core/glibc/glibc-scripts.inc
@@ -18,3 +18,6 @@ do_install() {
 # sotruss script requires sotruss-lib.so (given by libsotruss package), 
 # to produce trace of the library calls.
 RDEPENDS_${PN} += "libsotruss"
+
+# Don't scan for CVEs as glibc will be scanned
+CVE_PRODUCT = ""
diff --git a/meta/recipes-core/meta/cve-update-db-native.bb b/meta/recipes-core/meta/cve-update-db-native.bb
new file mode 100644
index 0000000..2c427a5
--- /dev/null
+++ b/meta/recipes-core/meta/cve-update-db-native.bb
@@ -0,0 +1,195 @@
+SUMMARY = "Updates the NVD CVE database"
+LICENSE = "MIT"
+
+INHIBIT_DEFAULT_DEPS = "1"
+
+inherit native
+
+deltask do_unpack
+deltask do_patch
+deltask do_configure
+deltask do_compile
+deltask do_install
+deltask do_populate_sysroot
+
+python () {
+    if not d.getVar("CVE_CHECK_DB_FILE"):
+        raise bb.parse.SkipRecipe("Skip recipe when cve-check class is not loaded.")
+}
+
+python do_populate_cve_db() {
+    """
+    Update NVD database with json data feed
+    """
+
+    import sqlite3, urllib, urllib.parse, shutil, gzip
+    from datetime import date
+
+    BASE_URL = "https://nvd.nist.gov/feeds/json/cve/1.0/nvdcve-1.0-"
+    YEAR_START = 2002
+
+    db_dir = os.path.join(d.getVar("DL_DIR"), 'CVE_CHECK')
+    db_file = os.path.join(db_dir, 'nvdcve_1.0.db')
+    json_tmpfile = os.path.join(db_dir, 'nvd.json.gz')
+    proxy = d.getVar("https_proxy")
+
+    if proxy:
+        # instantiate an opener but do not install it as the global
+        # opener unless if we're really sure it's applicable for all
+        # urllib requests
+        proxy_handler = urllib.request.ProxyHandler({'https': proxy})
+        proxy_opener = urllib.request.build_opener(proxy_handler)
+    else:
+        proxy_opener = None
+
+    cve_f = open(os.path.join(d.getVar("TMPDIR"), 'cve_check'), 'a')
+
+    if not os.path.isdir(db_dir):
+        os.mkdir(db_dir)
+
+    # Connect to database
+    conn = sqlite3.connect(db_file)
+    c = conn.cursor()
+
+    initialize_db(c)
+
+    for year in range(YEAR_START, date.today().year + 1):
+        year_url = BASE_URL + str(year)
+        meta_url = year_url + ".meta"
+        json_url = year_url + ".json.gz"
+
+        # Retrieve meta last modified date
+
+        response = None
+
+        if proxy_opener:
+            response = proxy_opener.open(meta_url)
+        else:
+            req = urllib.request.Request(meta_url)
+            response = urllib.request.urlopen(req)
+
+        if response:
+            for l in response.read().decode("utf-8").splitlines():
+                key, value = l.split(":", 1)
+                if key == "lastModifiedDate":
+                    last_modified = value
+                    break
+            else:
+                bb.warn("Cannot parse CVE metadata, update failed")
+                return
+
+        # Compare with current db last modified date
+        c.execute("select DATE from META where YEAR = ?", (year,))
+        meta = c.fetchone()
+        if not meta or meta[0] != last_modified:
+            # Clear products table entries corresponding to current year
+            c.execute("delete from PRODUCTS where ID like ?", ('CVE-%d%%' % year,))
+
+            # Update db with current year json file
+            try:
+                if proxy_opener:
+                    response = proxy_opener.open(json_url)
+                else:
+                    req = urllib.request.Request(json_url)
+                    response = urllib.request.urlopen(req)
+
+                if response:
+                    update_db(c, gzip.decompress(response.read()).decode('utf-8'))
+                c.execute("insert or replace into META values (?, ?)", [year, last_modified])
+            except urllib.error.URLError as e:
+                cve_f.write('Warning: CVE db update error, CVE data is outdated.\n\n')
+                bb.warn("Cannot parse CVE data (%s), update failed" % e.reason)
+                return
+
+        # Update success, set the date to cve_check file.
+        if year == date.today().year:
+            cve_f.write('CVE database update : %s\n\n' % date.today())
+
+    cve_f.close()
+    conn.commit()
+    conn.close()
+}
+
+def initialize_db(c):
+    c.execute("CREATE TABLE IF NOT EXISTS META (YEAR INTEGER UNIQUE, DATE TEXT)")
+    c.execute("CREATE TABLE IF NOT EXISTS NVD (ID TEXT UNIQUE, SUMMARY TEXT, \
+        SCOREV2 TEXT, SCOREV3 TEXT, MODIFIED INTEGER, VECTOR TEXT)")
+    c.execute("CREATE TABLE IF NOT EXISTS PRODUCTS (ID TEXT, \
+        VENDOR TEXT, PRODUCT TEXT, VERSION_START TEXT, OPERATOR_START TEXT, \
+        VERSION_END TEXT, OPERATOR_END TEXT)")
+
+def parse_node_and_insert(c, node, cveId):
+    # Parse children node if needed
+    for child in node.get('children', ()):
+        parse_node_and_insert(c, child, cveId)
+
+    def cpe_generator():
+        for cpe in node.get('cpe_match', ()):
+            if not cpe['vulnerable']:
+                return
+            cpe23 = cpe['cpe23Uri'].split(':')
+            vendor = cpe23[3]
+            product = cpe23[4]
+            version = cpe23[5]
+
+            if version != '*':
+                # Version is defined, this is a '=' match
+                yield [cveId, vendor, product, version, '=', '', '']
+            else:
+                # Parse start version, end version and operators
+                op_start = ''
+                op_end = ''
+                v_start = ''
+                v_end = ''
+
+                if 'versionStartIncluding' in cpe:
+                    op_start = '>='
+                    v_start = cpe['versionStartIncluding']
+
+                if 'versionStartExcluding' in cpe:
+                    op_start = '>'
+                    v_start = cpe['versionStartExcluding']
+
+                if 'versionEndIncluding' in cpe:
+                    op_end = '<='
+                    v_end = cpe['versionEndIncluding']
+
+                if 'versionEndExcluding' in cpe:
+                    op_end = '<'
+                    v_end = cpe['versionEndExcluding']
+
+                yield [cveId, vendor, product, v_start, op_start, v_end, op_end]
+
+    c.executemany("insert into PRODUCTS values (?, ?, ?, ?, ?, ?, ?)", cpe_generator())
+
+def update_db(c, jsondata):
+    import json
+    root = json.loads(jsondata)
+
+    for elt in root['CVE_Items']:
+        if not elt['impact']:
+            continue
+
+        cveId = elt['cve']['CVE_data_meta']['ID']
+        cveDesc = elt['cve']['description']['description_data'][0]['value']
+        date = elt['lastModifiedDate']
+        accessVector = elt['impact']['baseMetricV2']['cvssV2']['accessVector']
+        cvssv2 = elt['impact']['baseMetricV2']['cvssV2']['baseScore']
+
+        try:
+            cvssv3 = elt['impact']['baseMetricV3']['cvssV3']['baseScore']
+        except:
+            cvssv3 = 0.0
+
+        c.execute("insert or replace into NVD values (?, ?, ?, ?, ?, ?)",
+                [cveId, cveDesc, cvssv2, cvssv3, date, accessVector])
+
+        configurations = elt['configurations']['nodes']
+        for config in configurations:
+            parse_node_and_insert(c, config, cveId)
+
+
+addtask do_populate_cve_db before do_fetch
+do_populate_cve_db[nostamp] = "1"
+
+EXCLUDE_FROM_WORLD = "1"
diff --git a/meta/recipes-devtools/cve-check-tool/cve-check-tool_5.6.4.bb b/meta/recipes-devtools/cve-check-tool/cve-check-tool_5.6.4.bb
deleted file mode 100644
index 1c84fb1..0000000
--- a/meta/recipes-devtools/cve-check-tool/cve-check-tool_5.6.4.bb
+++ /dev/null
@@ -1,62 +0,0 @@
-SUMMARY = "cve-check-tool"
-DESCRIPTION = "cve-check-tool is a tool for checking known (public) CVEs.\
-The tool will identify potentially vunlnerable software packages within Linux distributions through version matching."
-HOMEPAGE = "https://github.com/ikeydoherty/cve-check-tool"
-SECTION = "Development/Tools"
-LICENSE = "GPL-2.0+"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=e8c1458438ead3c34974bc0be3a03ed6"
-
-SRC_URI = "https://github.com/ikeydoherty/${BPN}/releases/download/v${PV}/${BP}.tar.xz \
-           file://check-for-malloc_trim-before-using-it.patch \
-           file://0001-print-progress-in-percent-when-downloading-CVE-db.patch \
-           file://0001-curl-allow-overriding-default-CA-certificate-file.patch \
-           file://0001-update-Compare-computed-vs-expected-sha256-digit-str.patch \
-           file://0001-Fix-freeing-memory-allocated-by-sqlite.patch \
-          "
-
-SRC_URI[md5sum] = "c5f4247140fc9be3bf41491d31a34155"
-SRC_URI[sha256sum] = "b8f283be718af8d31232ac1bfc10a0378fb958aaaa49af39168f8acf501e6a5b"
-
-UPSTREAM_CHECK_URI = "https://github.com/ikeydoherty/cve-check-tool/releases"
-
-DEPENDS = "libcheck glib-2.0 json-glib curl libxml2 sqlite3 openssl ca-certificates"
-
-RDEPENDS_${PN} = "ca-certificates"
-
-inherit pkgconfig autotools
-
-EXTRA_OECONF = "--disable-coverage --enable-relative-plugins"
-CFLAGS_append = " -Wno-error=pedantic"
-
-do_populate_cve_db() {
-    if [ "${BB_NO_NETWORK}" = "1" ] ; then
-        bbwarn "BB_NO_NETWORK is set; Can't update cve-check-tool database, new CVEs won't be detected"
-        return
-    fi
-
-    # In case we don't inherit cve-check class, use default values defined in the class.
-    cve_dir="${CVE_CHECK_DB_DIR}"
-    cve_file="${CVE_CHECK_TMP_FILE}"
-
-    [ -z "${cve_dir}" ] && cve_dir="${DL_DIR}/CVE_CHECK"
-    [ -z "${cve_file}" ] && cve_file="${TMPDIR}/cve_check"
-
-    unused="${@bb.utils.export_proxies(d)}"
-    bbdebug 2 "Updating cve-check-tool database located in $cve_dir"
-    # --cacert works around curl-native not finding the CA bundle
-    if cve-check-update --cacert ${sysconfdir}/ssl/certs/ca-certificates.crt -d "$cve_dir" ; then
-        printf "CVE database was updated on %s UTC\n\n" "$(LANG=C date --utc +'%F %T')" > "$cve_file"
-    else
-        bbwarn "Error in executing cve-check-update"
-        if [ "${@'1' if bb.data.inherits_class('cve-check', d) else '0'}" -ne 0 ] ; then
-            bbwarn "Failed to update cve-check-tool database, CVEs won't be checked"
-        fi
-    fi
-}
-
-addtask populate_cve_db after do_populate_sysroot
-do_populate_cve_db[depends] = "cve-check-tool-native:do_populate_sysroot"
-do_populate_cve_db[nostamp] = "1"
-do_populate_cve_db[progress] = "percent"
-
-BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-devtools/cve-check-tool/files/0001-Fix-freeing-memory-allocated-by-sqlite.patch b/meta/recipes-devtools/cve-check-tool/files/0001-Fix-freeing-memory-allocated-by-sqlite.patch
deleted file mode 100644
index 4a82cf2..0000000
--- a/meta/recipes-devtools/cve-check-tool/files/0001-Fix-freeing-memory-allocated-by-sqlite.patch
+++ /dev/null
@@ -1,50 +0,0 @@
-From a3353429652f83bb8b0316500faa88fa2555542d Mon Sep 17 00:00:00 2001
-From: Peter Marko <peter.marko@siemens.com>
-Date: Thu, 13 Apr 2017 23:09:52 +0200
-Subject: [PATCH] Fix freeing memory allocated by sqlite
-
-Upstream-Status: Backport
-Signed-off-by: Peter Marko <peter.marko@siemens.com>
----
- src/core.c | 8 ++++----
- 1 file changed, 4 insertions(+), 4 deletions(-)
-
-diff --git a/src/core.c b/src/core.c
-index 6263031..6788f16 100644
---- a/src/core.c
-+++ b/src/core.c
-@@ -82,7 +82,7 @@ static bool ensure_table(CveDB *self)
-         rc = sqlite3_exec(self->db, query, NULL, NULL, &err);
-         if (rc != SQLITE_OK) {
-                 fprintf(stderr, "ensure_table(): %s\n", err);
--                free(err);
-+                sqlite3_free(err);
-                 return false;
-         }
-         
-@@ -91,7 +91,7 @@ static bool ensure_table(CveDB *self)
-         rc = sqlite3_exec(self->db, query, NULL, NULL, &err);
-         if (rc != SQLITE_OK) {
-                 fprintf(stderr, "ensure_table(): %s\n", err);
--                free(err);
-+                sqlite3_free(err);
-                 return false;
-         }
- 
-@@ -99,11 +99,11 @@ static bool ensure_table(CveDB *self)
-         rc = sqlite3_exec(self->db, query, NULL, NULL, &err);
-         if (rc != SQLITE_OK) {
-                 fprintf(stderr, "ensure_table(): %s\n", err);
--                free(err);
-+                sqlite3_free(err);
-                 return false;
-         }
-         if (err) {
--                free(err);
-+                sqlite3_free(err);
-         }
- 
-         return true;
--- 
-2.1.4
-
diff --git a/meta/recipes-devtools/cve-check-tool/files/0001-curl-allow-overriding-default-CA-certificate-file.patch b/meta/recipes-devtools/cve-check-tool/files/0001-curl-allow-overriding-default-CA-certificate-file.patch
deleted file mode 100644
index 3d8ebd1..0000000
--- a/meta/recipes-devtools/cve-check-tool/files/0001-curl-allow-overriding-default-CA-certificate-file.patch
+++ /dev/null
@@ -1,215 +0,0 @@
-From 825a9969dea052b02ba868bdf39e676349f10dce Mon Sep 17 00:00:00 2001
-From: Jussi Kukkonen <jussi.kukkonen@intel.com>
-Date: Thu, 9 Feb 2017 14:51:28 +0200
-Subject: [PATCH] curl: allow overriding default CA certificate file
-
-Similar to curl, --cacert can now be used in cve-check-tool and
-cve-check-update to override the default CA certificate file. Useful
-in cases where the system default is unsuitable (for example,
-out-dated) or broken (as in OE's current native libcurl, which embeds
-a path string from one build host and then uses it on another although
-the right path may have become something different).
-
-Upstream-Status: Submitted [https://github.com/ikeydoherty/cve-check-tool/pull/45]
-
-Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
-
-
-Took Patrick Ohlys original patch from meta-security-isafw, rebased
-on top of other patches.
-
-Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
----
- src/library/cve-check-tool.h |  1 +
- src/library/fetch.c          | 10 +++++++++-
- src/library/fetch.h          |  3 ++-
- src/main.c                   |  5 ++++-
- src/update-main.c            |  4 +++-
- src/update.c                 | 12 +++++++-----
- src/update.h                 |  2 +-
- 7 files changed, 27 insertions(+), 10 deletions(-)
-
-diff --git a/src/library/cve-check-tool.h b/src/library/cve-check-tool.h
-index e4bb5b1..f89eade 100644
---- a/src/library/cve-check-tool.h
-+++ b/src/library/cve-check-tool.h
-@@ -43,6 +43,7 @@ typedef struct CveCheckTool {
-     bool bugs;                          /**<Whether bug tracking is enabled */
-     GHashTable *mapping;                /**<CVE Mapping */
-     const char *output_file;            /**<Output file, if any */
-+    const char *cacert_file;            /**<Non-default SSL certificate file, if any */
- } CveCheckTool;
- 
- /**
-diff --git a/src/library/fetch.c b/src/library/fetch.c
-index 0fe6d76..8f998c3 100644
---- a/src/library/fetch.c
-+++ b/src/library/fetch.c
-@@ -60,7 +60,8 @@ static int progress_callback_new(void *ptr, curl_off_t dltotal, curl_off_t dlnow
- }
- 
- FetchStatus fetch_uri(const char *uri, const char *target, bool verbose,
--                      unsigned int start_percent, unsigned int end_percent)
-+                      unsigned int start_percent, unsigned int end_percent,
-+                      const char *cacert_file)
- {
-         FetchStatus ret = FETCH_STATUS_FAIL;
-         CURLcode res;
-@@ -74,6 +75,13 @@ FetchStatus fetch_uri(const char *uri, const char *target, bool verbose,
-                 return ret;
-         }
- 
-+        if (cacert_file) {
-+                res = curl_easy_setopt(curl, CURLOPT_CAINFO, cacert_file);
-+                if (res != CURLE_OK) {
-+                        goto bail;
-+                }
-+        }
-+
-         if (stat(target, &st) == 0) {
-                 res = curl_easy_setopt(curl, CURLOPT_TIMECONDITION, CURL_TIMECOND_IFMODSINCE);
-                 if (res != CURLE_OK) {
-diff --git a/src/library/fetch.h b/src/library/fetch.h
-index 4cce5d1..836c7d7 100644
---- a/src/library/fetch.h
-+++ b/src/library/fetch.h
-@@ -29,7 +29,8 @@ typedef enum {
-  * @return A FetchStatus, indicating the operation taken
-  */
- FetchStatus fetch_uri(const char *uri, const char *target, bool verbose,
--                      unsigned int this_percent, unsigned int next_percent);
-+                      unsigned int this_percent, unsigned int next_percent,
-+                      const char *cacert_file);
- 
- /**
-  * Attempt to extract the given gzipped file
-diff --git a/src/main.c b/src/main.c
-index 8e6f158..ae69d47 100644
---- a/src/main.c
-+++ b/src/main.c
-@@ -280,6 +280,7 @@ static bool csv_mode = false;
- static char *modified_stamp = NULL;
- static gchar *mapping_file = NULL;
- static gchar *output_file = NULL;
-+static gchar *cacert_file = NULL;
- 
- static GOptionEntry _entries[] = {
-         { "not-patched", 'n', 0, G_OPTION_ARG_NONE, &hide_patched, "Hide patched/addressed CVEs", NULL },
-@@ -294,6 +295,7 @@ static GOptionEntry _entries[] = {
-         { "csv", 'c', 0, G_OPTION_ARG_NONE, &csv_mode, "Output CSV formatted data only", NULL },
-         { "mapping", 'M', 0, G_OPTION_ARG_STRING, &mapping_file, "Path to a mapping file", NULL},
-         { "output-file", 'o', 0, G_OPTION_ARG_STRING, &output_file, "Path to the output file (output plugin specific)", NULL},
-+        { "cacert", 'C', 0, G_OPTION_ARG_STRING, &cacert_file, "Path to the combined SSL certificates file (system default is used if not set)", NULL},
-         { .short_name = 0 }
- };
- 
-@@ -492,6 +494,7 @@ int main(int argc, char **argv)
- 
-         quiet = csv_mode || !no_html;
-         self->output_file = output_file;
-+        self->cacert_file = cacert_file;
- 
-         if (!csv_mode && self->output_file) {
-                 quiet = false;
-@@ -530,7 +533,7 @@ int main(int argc, char **argv)
-                 if (status) {
-                         fprintf(stderr, "Update of db forced\n");
-                         cve_db_unlock();
--                        if (!update_db(quiet, db_path->str)) {
-+                        if (!update_db(quiet, db_path->str, self->cacert_file)) {
-                                 fprintf(stderr, "DB update failure\n");
-                                 goto cleanup;
-                         }
-diff --git a/src/update-main.c b/src/update-main.c
-index 2379cfa..c52d9d0 100644
---- a/src/update-main.c
-+++ b/src/update-main.c
-@@ -43,11 +43,13 @@ the Free Software Foundation; either version 2 of the License, or\n\
- static gchar *nvds = NULL;
- static bool _show_version = false;
- static bool _quiet = false;
-+static const char *_cacert_file = NULL;
- 
- static GOptionEntry _entries[] = {
-         { "nvd-dir", 'd', 0, G_OPTION_ARG_STRING, &nvds, "NVD directory in filesystem", NULL },
-         { "version", 'v', 0, G_OPTION_ARG_NONE, &_show_version, "Show version", NULL },
-         { "quiet", 'q', 0, G_OPTION_ARG_NONE, &_quiet, "Run silently", NULL },
-+        { "cacert", 'C', 0, G_OPTION_ARG_STRING, &_cacert_file, "Path to the combined SSL certificates file (system default is used if not set)", NULL},
-         { .short_name = 0 }
- };
- 
-@@ -88,7 +90,7 @@ int main(int argc, char **argv)
-                 goto end;
-         }
- 
--        if (update_db(_quiet, db_path->str)) {
-+        if (update_db(_quiet, db_path->str, _cacert_file)) {
-                 ret = EXIT_SUCCESS;
-         } else {
-                 fprintf(stderr, "Failed to update database\n");
-diff --git a/src/update.c b/src/update.c
-index 070560a..8cb4a39 100644
---- a/src/update.c
-+++ b/src/update.c
-@@ -267,7 +267,8 @@ static inline void update_end(int fd, const char *update_fname, bool ok)
- 
- static int do_fetch_update(int year, const char *db_dir, CveDB *cve_db,
-                            bool db_exist, bool verbose,
--                           unsigned int this_percent, unsigned int next_percent)
-+                           unsigned int this_percent, unsigned int next_percent,
-+                           const char *cacert_file)
- {
-         const char nvd_uri[] = URI_PREFIX;
-         autofree(cve_string) *uri_meta = NULL;
-@@ -331,14 +332,14 @@ refetch:
-         }
- 
-         /* Fetch NVD META file */
--        st = fetch_uri(uri_meta->str, nvdcve_meta->str, verbose, this_percent, this_percent);
-+        st = fetch_uri(uri_meta->str, nvdcve_meta->str, verbose, this_percent, this_percent, cacert_file);
-         if (st == FETCH_STATUS_FAIL) {
-                 fprintf(stderr, "Failed to fetch %s\n", uri_meta->str);
-                 return -1;
-         }
- 
-         /* Fetch NVD XML file */
--        st = fetch_uri(uri_data_gz->str, nvdcve_data_gz->str, verbose, this_percent, next_percent);
-+        st = fetch_uri(uri_data_gz->str, nvdcve_data_gz->str, verbose, this_percent, next_percent, cacert_file);
-         switch (st) {
-         case FETCH_STATUS_FAIL:
-                 fprintf(stderr, "Failed to fetch %s\n", uri_data_gz->str);
-@@ -391,7 +392,7 @@ refetch:
-         return 0;
- }
- 
--bool update_db(bool quiet, const char *db_file)
-+bool update_db(bool quiet, const char *db_file, const char *cacert_file)
- {
-         autofree(char) *db_dir = NULL;
-         autofree(CveDB) *cve_db = NULL;
-@@ -466,7 +467,8 @@ bool update_db(bool quiet, const char *db_file)
-                 if (!quiet)
-                         fprintf(stderr, "completed: %u%%\r", start_percent);
-                 rc = do_fetch_update(y, db_dir, cve_db, db_exist, !quiet,
--                                     start_percent, end_percent);
-+                                     start_percent, end_percent,
-+                                     cacert_file);
-                 switch (rc) {
-                 case 0:
-                         if (!quiet)
-diff --git a/src/update.h b/src/update.h
-index b8e9911..ceea0c3 100644
---- a/src/update.h
-+++ b/src/update.h
-@@ -15,7 +15,7 @@ cve_string *get_db_path(const char *path);
- 
- int update_required(const char *db_file);
- 
--bool update_db(bool quiet, const char *db_file);
-+bool update_db(bool quiet, const char *db_file, const char *cacert_file);
- 
- 
- /*
--- 
-2.1.4
-
diff --git a/meta/recipes-devtools/cve-check-tool/files/0001-print-progress-in-percent-when-downloading-CVE-db.patch b/meta/recipes-devtools/cve-check-tool/files/0001-print-progress-in-percent-when-downloading-CVE-db.patch
deleted file mode 100644
index 8ea6f68..0000000
--- a/meta/recipes-devtools/cve-check-tool/files/0001-print-progress-in-percent-when-downloading-CVE-db.patch
+++ /dev/null
@@ -1,135 +0,0 @@
-From e9ed26cde63f8ca7607a010a518329339f8c02d3 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
-Date: Mon, 26 Sep 2016 12:12:41 +0100
-Subject: [PATCH] print progress in percent when downloading CVE db
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Upstream-Status: Pending
-Signed-off-by: André Draszik <git@andred.net>
----
- src/library/fetch.c | 28 +++++++++++++++++++++++++++-
- src/library/fetch.h |  3 ++-
- src/update.c        | 16 ++++++++++++----
- 3 files changed, 41 insertions(+), 6 deletions(-)
-
-diff --git a/src/library/fetch.c b/src/library/fetch.c
-index 06d4b30..0fe6d76 100644
---- a/src/library/fetch.c
-+++ b/src/library/fetch.c
-@@ -37,13 +37,37 @@ static size_t write_func(void *ptr, size_t size, size_t nmemb, struct fetch_t *f
-         return fwrite(ptr, size, nmemb, f->f);
- }
- 
--FetchStatus fetch_uri(const char *uri, const char *target, bool verbose)
-+struct percent_t {
-+        unsigned int start;
-+        unsigned int end;
-+};
-+
-+static int progress_callback_new(void *ptr, curl_off_t dltotal, curl_off_t dlnow, curl_off_t ultotal, curl_off_t ulnow)
-+{
-+        (void) ultotal;
-+        (void) ulnow;
-+
-+        struct percent_t *percent = (struct percent_t *) ptr;
-+
-+        if (dltotal && percent && percent->end >= percent->start) {
-+                unsigned int diff = percent->end - percent->start;
-+                if (diff) {
-+                        fprintf(stderr,"completed: %"CURL_FORMAT_CURL_OFF_T"%%\r", percent->start + (diff * dlnow / dltotal));
-+                }
-+        }
-+
-+        return 0;
-+}
-+
-+FetchStatus fetch_uri(const char *uri, const char *target, bool verbose,
-+                      unsigned int start_percent, unsigned int end_percent)
- {
-         FetchStatus ret = FETCH_STATUS_FAIL;
-         CURLcode res;
-         struct stat st;
-         CURL *curl = NULL;
-         struct fetch_t *f = NULL;
-+        struct percent_t percent = { .start = start_percent, .end = end_percent };
- 
-         curl = curl_easy_init();
-         if (!curl) {
-@@ -67,6 +91,8 @@ FetchStatus fetch_uri(const char *uri, const char *target, bool verbose)
-         }
-         if (verbose) {
-                 (void)curl_easy_setopt(curl, CURLOPT_NOPROGRESS, 0L);
-+                (void)curl_easy_setopt(curl, CURLOPT_XFERINFODATA, &percent);
-+                (void)curl_easy_setopt(curl, CURLOPT_XFERINFOFUNCTION, progress_callback_new);
-         }
-         res = curl_easy_setopt(curl, CURLOPT_WRITEFUNCTION, (curl_write_callback)write_func);
-         if (res != CURLE_OK) {
-diff --git a/src/library/fetch.h b/src/library/fetch.h
-index 70c3779..4cce5d1 100644
---- a/src/library/fetch.h
-+++ b/src/library/fetch.h
-@@ -28,7 +28,8 @@ typedef enum {
-  * @param verbose Whether to be verbose
-  * @return A FetchStatus, indicating the operation taken
-  */
--FetchStatus fetch_uri(const char *uri, const char *target, bool verbose);
-+FetchStatus fetch_uri(const char *uri, const char *target, bool verbose,
-+                      unsigned int this_percent, unsigned int next_percent);
- 
- /**
-  * Attempt to extract the given gzipped file
-diff --git a/src/update.c b/src/update.c
-index 30fbe96..eaeeefd 100644
---- a/src/update.c
-+++ b/src/update.c
-@@ -266,7 +266,8 @@ static inline void update_end(int fd, const char *update_fname, bool ok)
- }
- 
- static int do_fetch_update(int year, const char *db_dir, CveDB *cve_db,
--                           bool db_exist, bool verbose)
-+                           bool db_exist, bool verbose,
-+                           unsigned int this_percent, unsigned int next_percent)
- {
-         const char nvd_uri[] = URI_PREFIX;
-         autofree(cve_string) *uri_meta = NULL;
-@@ -330,14 +331,14 @@ refetch:
-         }
- 
-         /* Fetch NVD META file */
--        st = fetch_uri(uri_meta->str, nvdcve_meta->str, verbose);
-+        st = fetch_uri(uri_meta->str, nvdcve_meta->str, verbose, this_percent, this_percent);
-         if (st == FETCH_STATUS_FAIL) {
-                 fprintf(stderr, "Failed to fetch %s\n", uri_meta->str);
-                 return -1;
-         }
- 
-         /* Fetch NVD XML file */
--        st = fetch_uri(uri_data_gz->str, nvdcve_data_gz->str, verbose);
-+        st = fetch_uri(uri_data_gz->str, nvdcve_data_gz->str, verbose, this_percent, next_percent);
-         switch (st) {
-         case FETCH_STATUS_FAIL:
-                 fprintf(stderr, "Failed to fetch %s\n", uri_data_gz->str);
-@@ -459,10 +460,17 @@ bool update_db(bool quiet, const char *db_file)
-         for (int i = YEAR_START; i <= year+1; i++) {
-                 int y = i > year ? -1 : i;
-                 int rc;
-+                unsigned int start_percent = ((i+0 - YEAR_START) * 100) / (year+2 - YEAR_START);
-+                unsigned int end_percent = ((i+1 - YEAR_START) * 100) / (year+2 - YEAR_START);
- 
--                rc = do_fetch_update(y, db_dir, cve_db, db_exist, !quiet);
-+                if (!quiet)
-+                        fprintf(stderr, "completed: %u%%\r", start_percent);
-+                rc = do_fetch_update(y, db_dir, cve_db, db_exist, !quiet,
-+                                     start_percent, end_percent);
-                 switch (rc) {
-                 case 0:
-+                        if (!quiet)
-+                                fprintf(stderr,"completed: %u%%\r", end_percent);
-                         continue;
-                 case ENOMEM:
-                         goto oom;
--- 
-2.9.3
-
diff --git a/meta/recipes-devtools/cve-check-tool/files/0001-update-Compare-computed-vs-expected-sha256-digit-str.patch b/meta/recipes-devtools/cve-check-tool/files/0001-update-Compare-computed-vs-expected-sha256-digit-str.patch
deleted file mode 100644
index 458c0cc..0000000
--- a/meta/recipes-devtools/cve-check-tool/files/0001-update-Compare-computed-vs-expected-sha256-digit-str.patch
+++ /dev/null
@@ -1,52 +0,0 @@
-From b0426e63c9ac61657e029f689bcb8dd051e752c6 Mon Sep 17 00:00:00 2001
-From: Sergey Popovich <popovich_sergei@mail.ua>
-Date: Fri, 21 Apr 2017 07:32:23 -0700
-Subject: [PATCH] update: Compare computed vs expected sha256 digit string
- ignoring case
-
-We produce sha256 digest string using %x snprintf()
-qualifier for each byte of digest which uses alphabetic
-characters from "a" to "f" in lower case to represent
-integer values from 10 to 15.
-
-Previously all of the NVD META files supply sha256
-digest string for corresponding XML file in lower case.
-
-However due to some reason this changed recently to
-provide digest digits in upper case causing fetched
-data consistency checks to fail. This prevents database
-from being updated periodically.
-
-While commit c4f6e94 (update: Do not treat sha256 failure
-as fatal if requested) adds useful option to skip
-digest validation at all and thus provides workaround for
-this situation, it might be unacceptable for some
-deployments where we need to ensure that downloaded
-data is consistent before start parsing it and update
-SQLite database.
-
-Use strcasecmp() to compare two digest strings case
-insensitively and addressing this case.
-
-Upstream-Status: Backport
-Signed-off-by: Sergey Popovich <popovich_sergei@mail.ua>
----
- src/update.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/update.c b/src/update.c
-index 8588f38..3cc6b67 100644
---- a/src/update.c
-+++ b/src/update.c
-@@ -187,7 +187,7 @@ static bool nvdcve_data_ok(const char *meta, const char *data)
-                 snprintf(&csum_data[idx], len, "%02hhx", digest[i]);
-         }
- 
--        ret = streq(csum_meta, csum_data);
-+        ret = !strcasecmp(csum_meta, csum_data);
- 
- err_unmap:
-         munmap(buffer, length);
--- 
-2.11.0
-
diff --git a/meta/recipes-devtools/cve-check-tool/files/check-for-malloc_trim-before-using-it.patch b/meta/recipes-devtools/cve-check-tool/files/check-for-malloc_trim-before-using-it.patch
deleted file mode 100644
index 0774ad9..0000000
--- a/meta/recipes-devtools/cve-check-tool/files/check-for-malloc_trim-before-using-it.patch
+++ /dev/null
@@ -1,51 +0,0 @@
-From ce64633b9733e962b8d8482244301f614d8b5845 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 22 Aug 2016 22:54:24 -0700
-Subject: [PATCH] Check for malloc_trim before using it
-
-malloc_trim is gnu specific and not all libc
-implement it, threfore write a configure check
-to poke for it first and use the define to
-guard its use.
-
-Helps in compiling on musl based systems
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
-Upstream-Status: Submitted [https://github.com/ikeydoherty/cve-check-tool/pull/48]
- configure.ac | 2 ++
- src/core.c   | 4 ++--
- 2 files changed, 4 insertions(+), 2 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index d3b66ce..79c3542 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -19,6 +19,8 @@ m4_define([json_required_version], [0.16.0])
- m4_define([openssl_required_version],[1.0.0])
- # TODO: Set minimum sqlite
- 
-+AC_CHECK_FUNCS_ONCE(malloc_trim)
-+
- PKG_CHECK_MODULES(CVE_CHECK_TOOL,
-                  [
-                   glib-2.0 >= glib_required_version,
-diff --git a/src/core.c b/src/core.c
-index 6263031..0d5df29 100644
---- a/src/core.c
-+++ b/src/core.c
-@@ -498,9 +498,9 @@ bool cve_db_load(CveDB *self, const char *fname)
-         }
- 
-         b = true;
--
-+#ifdef HAVE_MALLOC_TRIM
-         malloc_trim(0);
--
-+#endif
-         xmlFreeTextReader(r);
-         if (fd) {
-                 close(fd);
--- 
-2.9.3
-
-- 
2.7.4


