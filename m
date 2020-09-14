Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by mx.groups.io with SMTP id smtpd.web12.52931.1600054465296891228
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Sep 2020 20:34:25 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.100, mailfrom: chee.yang.lee@intel.com)
IronPort-SDR: DnYVvMBwKqzFNYNkh9TIt19OJE7PyLYSUJAle3tM/Vl2noXjZjLAtlovB8dwfhvOKlGPBJKyVG
 paE2Hql06lDg==
X-IronPort-AV: E=McAfee;i="6000,8403,9743"; a="223206013"
X-IronPort-AV: E=Sophos;i="5.76,424,1592895600"; 
   d="scan'208";a="223206013"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2020 20:34:24 -0700
IronPort-SDR: XcbnpCHez6D0WGAl56U/IpJaYiZQz93+xjDPLGI116+AoZlF5SF9r72GgCudU5+hg6Z70gFYAX
 HMi42e+dRjPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,424,1592895600"; 
   d="scan'208";a="506194727"
Received: from andromeda01.png.intel.com (HELO guest1-ubuntu1804.png.intel.com) ([10.221.183.10])
  by fmsmga006.fm.intel.com with ESMTP; 13 Sep 2020 20:34:23 -0700
From: "Lee Chee Yang" <chee.yang.lee@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2] cve-check: use ALLOWLIST
Date: Mon, 14 Sep 2020 11:34:21 +0800
Message-Id: <20200914033421.48381-1-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.17.1

From: Lee Chee Yang <chee.yang.lee@intel.com>

use allowlist instead of whitelist.
Replace CVE_CHECK_PN_WHITELIST with CVE_CHECK_PN_ALLOWLIST.
Replace CVE_CHECK_WHITELIST with CVE_CHECK_ALLOWLIST.

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
---
 meta/classes/cve-check.bbclass                | 47 ++++++++++---------
 .../openssl/openssl_1.1.1g.bb                 |  2 +-
 meta/recipes-core/glibc/glibc_2.32.bb         |  2 +-
 meta/recipes-devtools/cmake/cmake.inc         |  2 +-
 meta/recipes-devtools/python/python3_3.8.5.bb |  2 +-
 meta/recipes-devtools/rsync/rsync_3.2.3.bb    |  2 +-
 .../iputils/iputils_s20200821.bb              |  2 +-
 meta/recipes-extended/procps/procps_3.3.16.bb |  2 +-
 .../libpng/libpng_1.6.37.bb                   |  2 +-
 .../libsndfile/libsndfile1_1.0.28.bb          |  2 +-
 meta/recipes-support/lz4/lz4_1.9.2.bb         |  2 +-
 meta/recipes-support/sqlite/sqlite3_3.33.0.bb |  2 +-
 12 files changed, 35 insertions(+), 34 deletions(-)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
index 02fef7c205..4a4570daab 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -40,15 +40,15 @@ CVE_CHECK_MANIFEST ?= "${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.cve
 CVE_CHECK_COPY_FILES ??= "1"
 CVE_CHECK_CREATE_MANIFEST ??= "1"
 
-# Whitelist for packages (PN)
-CVE_CHECK_PN_WHITELIST ?= ""
+# Allowlist for packages (PN)
+CVE_CHECK_PN_ALLOWLIST ?= ""
 
-# Whitelist for CVE. If a CVE is found, then it is considered patched.
+# Allowlist for CVE. If a CVE is found, then it is considered patched.
 # The value is a string containing space separated CVE values:
-# 
-# CVE_CHECK_WHITELIST = 'CVE-2014-2524 CVE-2018-1234'
-# 
-CVE_CHECK_WHITELIST ?= ""
+#
+# CVE_CHECK_ALLOWLIST = 'CVE-2014-2524 CVE-2018-1234'
+#
+CVE_CHECK_ALLOWLIST ?= ""
 
 python cve_save_summary_handler () {
     import shutil
@@ -87,10 +87,10 @@ python do_cve_check () {
             patched_cves = get_patches_cves(d)
         except FileNotFoundError:
             bb.fatal("Failure in searching patches")
-        whitelisted, patched, unpatched = check_cves(d, patched_cves)
+        allowlisted, patched, unpatched = check_cves(d, patched_cves)
         if patched or unpatched:
             cve_data = get_cve_info(d, patched + unpatched)
-            cve_write_data(d, patched, unpatched, whitelisted, cve_data)
+            cve_write_data(d, patched, unpatched, allowlisted, cve_data)
     else:
         bb.note("No CVE database found, skipping CVE check")
 
@@ -213,15 +213,16 @@ def check_cves(d, patched_cves):
         return ([], [], [])
     pv = d.getVar("CVE_VERSION").split("+git")[0]
 
-    # If the recipe has been whitlisted we return empty lists
-    if d.getVar("PN") in d.getVar("CVE_CHECK_PN_WHITELIST").split():
-        bb.note("Recipe has been whitelisted, skipping check")
+    if d.getVar("CVE_CHECK_PN_WHITELIST"):
+        bb.warn("CVE_CHECK_PN_WHITELIST is deprecated, please use CVE_CHECK_PN_ALLOWLIST.")
+    # If the recipe has been allowlisted we return empty lists
+    if d.getVar("PN") in d.getVar("CVE_CHECK_PN_ALLOWLIST").split():
+        bb.note("Recipe has been allowlisted, skipping check")
         return ([], [], [])
 
-    old_cve_whitelist =  d.getVar("CVE_CHECK_CVE_WHITELIST")
-    if old_cve_whitelist:
-        bb.warn("CVE_CHECK_CVE_WHITELIST is deprecated, please use CVE_CHECK_WHITELIST.")
-    cve_whitelist = d.getVar("CVE_CHECK_WHITELIST").split()
+    if d.getVar("CVE_CHECK_CVE_WHITELIST") or d.getVar("CVE_CHECK_WHITELIST"):
+        bb.warn("CVE_CHECK_CVE_WHITELIST and CVE_CHECK_WHITELIST is deprecated, please use CVE_CHECK_ALLOWLIST.")
+    cve_allowlist = d.getVar("CVE_CHECK_ALLOWLIST").split()
 
     import sqlite3
     db_file = d.expand("file:${CVE_CHECK_DB_FILE}?mode=ro")
@@ -238,9 +239,9 @@ def check_cves(d, patched_cves):
         for cverow in conn.execute("SELECT DISTINCT ID FROM PRODUCTS WHERE PRODUCT IS ? AND VENDOR LIKE ?", (product, vendor)):
             cve = cverow[0]
 
-            if cve in cve_whitelist:
-                bb.note("%s-%s has been whitelisted for %s" % (product, pv, cve))
-                # TODO: this should be in the report as 'whitelisted'
+            if cve in cve_allowlist:
+                bb.note("%s-%s has been allowlisted for %s" % (product, pv, cve))
+                # TODO: this should be in the report as 'allowlisted'
                 patched_cves.add(cve)
                 continue
             elif cve in patched_cves:
@@ -294,7 +295,7 @@ def check_cves(d, patched_cves):
 
     conn.close()
 
-    return (list(cve_whitelist), list(patched_cves), cves_unpatched)
+    return (list(cve_allowlist), list(patched_cves), cves_unpatched)
 
 def get_cve_info(d, cves):
     """
@@ -318,7 +319,7 @@ def get_cve_info(d, cves):
     conn.close()
     return cve_data
 
-def cve_write_data(d, patched, unpatched, whitelisted, cve_data):
+def cve_write_data(d, patched, unpatched, allowlisted, cve_data):
     """
     Write CVE information in WORKDIR; and to CVE_CHECK_DIR, and
     CVE manifest if enabled.
@@ -334,8 +335,8 @@ def cve_write_data(d, patched, unpatched, whitelisted, cve_data):
         write_string += "PACKAGE NAME: %s\n" % d.getVar("PN")
         write_string += "PACKAGE VERSION: %s%s\n" % (d.getVar("EXTENDPE"), d.getVar("PV"))
         write_string += "CVE: %s\n" % cve
-        if cve in whitelisted:
-            write_string += "CVE STATUS: Whitelisted\n"
+        if cve in allowlisted:
+            write_string += "CVE STATUS: Allowlisted\n"
         elif cve in patched:
             write_string += "CVE STATUS: Patched\n"
         else:
diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.1g.bb b/meta/recipes-connectivity/openssl/openssl_1.1.1g.bb
index 815955837b..b162157015 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.1.1g.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.1.1g.bb
@@ -212,4 +212,4 @@ CVE_PRODUCT = "openssl:openssl"
 
 # Only affects OpenSSL >= 1.1.1 in combination with Apache < 2.4.37
 # Apache in meta-webserver is already recent enough
-CVE_CHECK_WHITELIST += "CVE-2019-0190"
+CVE_CHECK_ALLOWLIST += "CVE-2019-0190"
diff --git a/meta/recipes-core/glibc/glibc_2.32.bb b/meta/recipes-core/glibc/glibc_2.32.bb
index 7049e61625..fc36ded36d 100644
--- a/meta/recipes-core/glibc/glibc_2.32.bb
+++ b/meta/recipes-core/glibc/glibc_2.32.bb
@@ -1,7 +1,7 @@
 require glibc.inc
 require glibc-version.inc
 
-CVE_CHECK_WHITELIST += "CVE-2020-10029"
+CVE_CHECK_ALLOWLIST += "CVE-2020-10029"
 
 DEPENDS += "gperf-native bison-native make-native"
 
diff --git a/meta/recipes-devtools/cmake/cmake.inc b/meta/recipes-devtools/cmake/cmake.inc
index fa1b818ae4..c86bac2f50 100644
--- a/meta/recipes-devtools/cmake/cmake.inc
+++ b/meta/recipes-devtools/cmake/cmake.inc
@@ -28,4 +28,4 @@ UPSTREAM_CHECK_REGEX = "cmake-(?P<pver>\d+(\.\d+)+)\.tar"
 
 # This is specific to the npm package that installs cmake, so isn't
 # relevant to OpenEmbedded
-CVE_CHECK_WHITELIST += "CVE-2016-10642"
+CVE_CHECK_ALLOWLIST += "CVE-2016-10642"
diff --git a/meta/recipes-devtools/python/python3_3.8.5.bb b/meta/recipes-devtools/python/python3_3.8.5.bb
index cabe5dc075..bb1b65e645 100644
--- a/meta/recipes-devtools/python/python3_3.8.5.bb
+++ b/meta/recipes-devtools/python/python3_3.8.5.bb
@@ -49,7 +49,7 @@ UPSTREAM_CHECK_REGEX = "[Pp]ython-(?P<pver>\d+(\.\d+)+).tar"
 CVE_PRODUCT = "python"
 
 # This is not exploitable when glibc has CVE-2016-10739 fixed.
-CVE_CHECK_WHITELIST += "CVE-2019-18348"
+CVE_CHECK_ALLOWLIST += "CVE-2019-18348"
 
 PYTHON_MAJMIN = "3.8"
 
diff --git a/meta/recipes-devtools/rsync/rsync_3.2.3.bb b/meta/recipes-devtools/rsync/rsync_3.2.3.bb
index 375efa0dea..18f3f7c079 100644
--- a/meta/recipes-devtools/rsync/rsync_3.2.3.bb
+++ b/meta/recipes-devtools/rsync/rsync_3.2.3.bb
@@ -17,7 +17,7 @@ SRC_URI = "https://download.samba.org/pub/${BPN}/src/${BP}.tar.gz \
 SRC_URI[sha256sum] = "becc3c504ceea499f4167a260040ccf4d9f2ef9499ad5683c179a697146ce50e"
 
 # -16548 required for v3.1.3pre1. Already in v3.1.3.
-CVE_CHECK_WHITELIST += " CVE-2017-16548 "
+CVE_CHECK_ALLOWLIST += " CVE-2017-16548 "
 
 inherit autotools-brokensep
 
diff --git a/meta/recipes-extended/iputils/iputils_s20200821.bb b/meta/recipes-extended/iputils/iputils_s20200821.bb
index 28dd194a12..950810ebda 100644
--- a/meta/recipes-extended/iputils/iputils_s20200821.bb
+++ b/meta/recipes-extended/iputils/iputils_s20200821.bb
@@ -21,7 +21,7 @@ UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>s\d+)"
 
 # Fixed in 2000-10-10, but the versioning of iputils
 # breaks the version order.
-CVE_CHECK_WHITELIST += "CVE-2000-1213 CVE-2000-1214"
+CVE_CHECK_ALLOWLIST += "CVE-2000-1213 CVE-2000-1214"
 
 PACKAGECONFIG ??= "libcap rarpd \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'ipv6', 'ninfod traceroute6', '', d)} \
diff --git a/meta/recipes-extended/procps/procps_3.3.16.bb b/meta/recipes-extended/procps/procps_3.3.16.bb
index 2810ebd285..6c3243c012 100644
--- a/meta/recipes-extended/procps/procps_3.3.16.bb
+++ b/meta/recipes-extended/procps/procps_3.3.16.bb
@@ -73,4 +73,4 @@ python __anonymous() {
 
 # 'ps' isn't suitable for use as a security tool so whitelist this CVE.
 # https://bugzilla.redhat.com/show_bug.cgi?id=1575473#c3
-CVE_CHECK_WHITELIST += "CVE-2018-1121"
+CVE_CHECK_ALLOWLIST += "CVE-2018-1121"
diff --git a/meta/recipes-multimedia/libpng/libpng_1.6.37.bb b/meta/recipes-multimedia/libpng/libpng_1.6.37.bb
index 8c53d11642..43e54b06cf 100644
--- a/meta/recipes-multimedia/libpng/libpng_1.6.37.bb
+++ b/meta/recipes-multimedia/libpng/libpng_1.6.37.bb
@@ -29,4 +29,4 @@ FILES_${PN}-tools = "${bindir}/png-fix-itxt ${bindir}/pngfix ${bindir}/pngcp"
 BBCLASSEXTEND = "native nativesdk"
 
 # CVE-2019-17371 is actually a memory leak in gif2png 2.x
-CVE_CHECK_WHITELIST += "CVE-2019-17371"
+CVE_CHECK_ALLOWLIST += "CVE-2019-17371"
diff --git a/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb b/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb
index b100108766..ce3226657e 100644
--- a/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb
+++ b/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb
@@ -40,4 +40,4 @@ do_install_append() {
 
 # This can't be replicated and is just a memory leak.
 # https://github.com/erikd/libsndfile/issues/398
-CVE_CHECK_WHITELIST += "CVE-2018-13419"
+CVE_CHECK_ALLOWLIST += "CVE-2018-13419"
diff --git a/meta/recipes-support/lz4/lz4_1.9.2.bb b/meta/recipes-support/lz4/lz4_1.9.2.bb
index 6510156ed0..1efd6ac8b7 100644
--- a/meta/recipes-support/lz4/lz4_1.9.2.bb
+++ b/meta/recipes-support/lz4/lz4_1.9.2.bb
@@ -19,7 +19,7 @@ UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>.*)"
 S = "${WORKDIR}/git"
 
 # Fixed in r118, which is larger than the current version.
-CVE_CHECK_WHITELIST += "CVE-2014-4715"
+CVE_CHECK_ALLOWLIST += "CVE-2014-4715"
 
 EXTRA_OEMAKE = "PREFIX=${prefix} CC='${CC}' DESTDIR=${D} LIBDIR=${libdir} INCLUDEDIR=${includedir} BUILD_STATIC=no"
 
diff --git a/meta/recipes-support/sqlite/sqlite3_3.33.0.bb b/meta/recipes-support/sqlite/sqlite3_3.33.0.bb
index 611a1bd923..c5900a8131 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.33.0.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.33.0.bb
@@ -7,4 +7,4 @@ SRC_URI = "http://www.sqlite.org/2020/sqlite-autoconf-${SQLITE_PV}.tar.gz"
 SRC_URI[sha256sum] = "106a2c48c7f75a298a7557bcc0d5f4f454e5b43811cc738b7ca294d6956bbb15"
 
 # -19242 is only an issue in specific development branch commits
-CVE_CHECK_WHITELIST += "CVE-2019-19242"
+CVE_CHECK_ALLOWLIST += "CVE-2019-19242"
-- 
2.17.1

