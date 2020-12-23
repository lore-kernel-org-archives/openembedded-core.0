Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by mx.groups.io with SMTP id smtpd.web08.10356.1608736828373082275
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Dec 2020 07:20:28 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.136, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: 9wcKNbyjtwGrurBNaI+Bptp0jNgP9QLpVmJCqogXdxLnzmcy6iaVXB9V2NgQ2QUtqoo7VMtdYJ
 6pRPZeUGTfOA==
X-IronPort-AV: E=McAfee;i="6000,8403,9843"; a="155236103"
X-IronPort-AV: E=Sophos;i="5.78,441,1599548400"; 
   d="scan'208";a="155236103"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2020 07:19:26 -0800
IronPort-SDR: 2aeZyk+0t1qcIGXobQUWHb+kehgwLd4T7I5fZsD0DoexO9cbj9mBAzvDHQOgg8GbJmi/tKtiiT
 nqM6wI8CczXA==
X-IronPort-AV: E=Sophos;i="5.78,441,1599548400"; 
   d="scan'208";a="374027650"
Received: from btang1-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.249.75.173])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2020 07:19:24 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 24/35] kea: fix reproducibility
Date: Wed, 23 Dec 2020 23:18:34 +0800
Message-Id: <cc7122b8f77efcb3d54c1c8160996cb732702b84.1608735614.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1608735614.git.anuj.mittal@intel.com>
References: <cover.1608735614.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 5f486c39a766f921fb4374165b6e342dd87244ec)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 ...er_unittest_support.cc-do-not-write-.patch | 27 +++++++++++++++++
 meta/recipes-connectivity/kea/kea_1.7.10.bb   | 29 +++++++++++--------
 2 files changed, 44 insertions(+), 12 deletions(-)
 create mode 100644 meta/recipes-connectivity/kea/files/0001-src-lib-log-logger_unittest_support.cc-do-not-write-.patch

diff --git a/meta/recipes-connectivity/kea/files/0001-src-lib-log-logger_unittest_support.cc-do-not-write-.patch b/meta/recipes-connectivity/kea/files/0001-src-lib-log-logger_unittest_support.cc-do-not-write-.patch
new file mode 100644
index 0000000000..226bc5b311
--- /dev/null
+++ b/meta/recipes-connectivity/kea/files/0001-src-lib-log-logger_unittest_support.cc-do-not-write-.patch
@@ -0,0 +1,27 @@
+From 9985a03f13da4d7bb0a433f7305d2ffae3d82a27 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Tue, 10 Nov 2020 15:57:03 +0000
+Subject: [PATCH] src/lib/log/logger_unittest_support.cc: do not write build
+ path into binary
+
+This breaks reproducibility and is needed only in unit testing.
+
+Upstream-Status: Inappropriate [oe-core specific]
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ src/lib/log/logger_unittest_support.cc | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/lib/log/logger_unittest_support.cc b/src/lib/log/logger_unittest_support.cc
+index 58dbef8..9a2929c 100644
+--- a/src/lib/log/logger_unittest_support.cc
++++ b/src/lib/log/logger_unittest_support.cc
+@@ -84,7 +84,7 @@ void initLogger(isc::log::Severity severity, int dbglevel) {
+     const char* localfile = getenv("KEA_LOGGER_LOCALMSG");
+ 
+     // Set a directory for creating lockfiles when running tests
+-    setenv("KEA_LOCKFILE_DIR", TOP_BUILDDIR, 0);
++    //setenv("KEA_LOCKFILE_DIR", TOP_BUILDDIR, 0);
+ 
+     // Initialize logging
+     initLogger(root, isc::log::DEBUG, isc::log::MAX_DEBUG_LEVEL, localfile);
diff --git a/meta/recipes-connectivity/kea/kea_1.7.10.bb b/meta/recipes-connectivity/kea/kea_1.7.10.bb
index c9a5819e47..dc4482adcc 100644
--- a/meta/recipes-connectivity/kea/kea_1.7.10.bb
+++ b/meta/recipes-connectivity/kea/kea_1.7.10.bb
@@ -7,18 +7,18 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=68d95543d2096459290a4e6b9ceccffa"
 
 DEPENDS = "boost log4cplus openssl"
 
-SRC_URI = "\
-    http://ftp.isc.org/isc/kea/${PV}/${BP}.tar.gz \
-    file://0001-keactrl.in-create-var-lib-kea-and-var-run-kea-folder.patch \
-    file://kea-dhcp4.service \
-    file://kea-dhcp6.service \
-    file://kea-dhcp-ddns.service \
-    file://kea-dhcp4-server \
-    file://kea-dhcp6-server \
-    file://kea-dhcp-ddns-server \
-    file://fix-multilib-conflict.patch \
-    file://fix_pid_keactrl.patch \
-"
+SRC_URI = "http://ftp.isc.org/isc/kea/${PV}/${BP}.tar.gz \
+           file://0001-keactrl.in-create-var-lib-kea-and-var-run-kea-folder.patch \
+           file://kea-dhcp4.service \
+           file://kea-dhcp6.service \
+           file://kea-dhcp-ddns.service \
+           file://kea-dhcp4-server \
+           file://kea-dhcp6-server \
+           file://kea-dhcp-ddns-server \
+           file://fix-multilib-conflict.patch \
+           file://fix_pid_keactrl.patch \
+           file://0001-src-lib-log-logger_unittest_support.cc-do-not-write-.patch \
+           "
 SRC_URI[sha256sum] = "4e121f0e58b175a827581c69cb1d60778647049fa47f142940dddc9ce58f3c82"
 
 inherit autotools systemd update-rc.d
@@ -50,6 +50,11 @@ do_configure_prepend() {
     sed -i "s:@abs_top_srcdir@:@abs_top_srcdir_placeholder@:g" ${S}/src/bin/admin/kea-admin.in
 }
 
+# patch out build host paths for reproducibility
+do_compile_prepend_class-target() {
+        sed -i -e "s,${WORKDIR},,g" ${B}/config.report
+}
+
 do_install_append() {
     install -d ${D}${sysconfdir}/init.d
     install -d ${D}${systemd_system_unitdir}
-- 
2.29.2

