Received: from mga05.intel.com (mga05.intel.com [])
 by mx.groups.io with SMTP id smtpd.web10.2077.1593651261154006625
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Jul 2020 17:54:22 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: e2iA9xBPlnK44659fXqv9mIY04RO/qk8Kd6QCghsCGn+N/MZA0YwTHwMEkUb9Z8ZXY8I6pqEZa
 sL3Zb5RuV11g==
X-IronPort-AV: E=McAfee;i="6000,8403,9669"; a="231628777"
X-IronPort-AV: E=Sophos;i="5.75,302,1589266800"; 
   d="scan'208";a="231628777"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2020 17:54:22 -0700
IronPort-SDR: GvWVJYlwBJq49J/Uoo7/im8hsEmdffZWTe7WYcvDcIXxMPIhIA08H7Rk3zVtB8Jt4qWj0Bq2e2
 t/WPA7+vRqrQ==
X-IronPort-AV: E=Sophos;i="5.75,302,1589266800"; 
   d="scan'208";a="481801516"
Received: from anmitta2-mobl1.gar.corp.intel.com ([10.249.69.56])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2020 17:54:21 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [zeus][PATCH 02/10] python3: make gdbm optional
Date: Thu,  2 Jul 2020 08:54:04 +0800
Message-Id: <033a63507d1ccd423b8023575729ff089614303b.1593474787.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <cover.1593474787.git.anuj.mittal@intel.com>
References: <cover.1593474787.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Alexander Kanavin <alex.kanavin@gmail.com>

The use case is building a gpl3-free image, without having
to rely on outdated recipes from meta-gplv2 layer.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 ...report-missing-dependencies-for-disa.patch | 31 +++++++++++++++++++
 ...tutils-prefix-is-inside-staging-area.patch |  2 +-
 meta/recipes-devtools/python/python3_3.7.7.bb | 18 ++++++++---
 3 files changed, 46 insertions(+), 5 deletions(-)
 create mode 100644 meta/recipes-devtools/python/python3/0017-setup.py-do-not-report-missing-dependencies-for-disa.patch

diff --git a/meta/recipes-devtools/python/python3/0017-setup.py-do-not-report-missing-dependencies-for-disa.patch b/meta/recipes-devtools/python/python3/0017-setup.py-do-not-report-missing-dependencies-for-disa.patch
new file mode 100644
index 0000000000..c15295c034
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/0017-setup.py-do-not-report-missing-dependencies-for-disa.patch
@@ -0,0 +1,31 @@
+From e3b59cb9658e1d3efa3535840939a0fa92a70a5a Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Mon, 7 Oct 2019 13:22:14 +0200
+Subject: [PATCH] setup.py: do not report missing dependencies for disabled
+ modules
+
+Reporting those missing dependencies is misleading as the modules would not
+have been built anyway. This particularly matters in oe-core's automated
+build completeness checker which relies on the report.
+
+Upstream-Status: Inappropriate [oe-core specific]
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ setup.py | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/setup.py b/setup.py
+index 4b53668..0097643 100644
+--- a/setup.py
++++ b/setup.py
+@@ -365,6 +365,10 @@ class PyBuildExt(build_ext):
+                 print("%-*s   %-*s   %-*s" % (longest, e, longest, f,
+                                               longest, g))
+ 
++        # There is no need to report missing module dependencies,
++        # if the modules have been disabled in the first place.
++        missing = list(set(missing) - set(sysconf_dis))
++
+         if missing:
+             print()
+             print("Python build finished successfully!")
diff --git a/meta/recipes-devtools/python/python3/12-distutils-prefix-is-inside-staging-area.patch b/meta/recipes-devtools/python/python3/12-distutils-prefix-is-inside-staging-area.patch
index 0bafec73c0..d49604ba4d 100644
--- a/meta/recipes-devtools/python/python3/12-distutils-prefix-is-inside-staging-area.patch
+++ b/meta/recipes-devtools/python/python3/12-distutils-prefix-is-inside-staging-area.patch
@@ -1,4 +1,4 @@
-From 6229502e5ae6cbb22240594f002638e9ef78f831 Mon Sep 17 00:00:00 2001
+From a274ba778838824efcacaba57c415b7262f779ec Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Tue, 14 May 2013 15:00:26 -0700
 Subject: [PATCH] python3: Add target and native recipes
diff --git a/meta/recipes-devtools/python/python3_3.7.7.bb b/meta/recipes-devtools/python/python3_3.7.7.bb
index bff84f640b..be67c81d7c 100644
--- a/meta/recipes-devtools/python/python3_3.7.7.bb
+++ b/meta/recipes-devtools/python/python3_3.7.7.bb
@@ -28,6 +28,7 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
            file://reformat_sysconfig.py \
            file://0001-Use-FLAG_REF-always-for-interned-strings.patch \
            file://0001-test_locale.py-correct-the-test-output-format.patch \
+           file://0017-setup.py-do-not-report-missing-dependencies-for-disa.patch \
            file://0001-bpo-39503-CVE-2020-8492-Fix-AbstractBasicAuthHandler.patch \
            "
 
@@ -67,7 +68,7 @@ ALTERNATIVE_LINK_NAME[python-config] = "${bindir}/python${PYTHON_BINABI}-config"
 ALTERNATIVE_TARGET[python-config] = "${bindir}/python${PYTHON_BINABI}-config-${MULTILIB_SUFFIX}"
 
 
-DEPENDS = "bzip2-replacement-native libffi bzip2 gdbm openssl sqlite3 zlib virtual/libintl xz virtual/crypt util-linux libtirpc libnsl2"
+DEPENDS = "bzip2-replacement-native libffi bzip2 openssl sqlite3 zlib virtual/libintl xz virtual/crypt util-linux libtirpc libnsl2"
 DEPENDS_append_class-target = " python3-native"
 DEPENDS_append_class-nativesdk = " python3-native"
 
@@ -92,13 +93,22 @@ python() {
         d.setVar('PACKAGECONFIG_PGO', '')
 }
 
-PACKAGECONFIG_class-target ??= "readline ${PACKAGECONFIG_PGO}"
-PACKAGECONFIG_class-native ??= "readline"
-PACKAGECONFIG_class-nativesdk ??= "readline"
+PACKAGECONFIG_class-target ??= "readline ${PACKAGECONFIG_PGO} gdbm"
+PACKAGECONFIG_class-native ??= "readline gdbm"
+PACKAGECONFIG_class-nativesdk ??= "readline gdbm"
 PACKAGECONFIG[readline] = ",,readline"
 # Use profile guided optimisation by running PyBench inside qemu-user
 PACKAGECONFIG[pgo] = "--enable-optimizations,,qemu-native"
 PACKAGECONFIG[tk] = ",,tk"
+PACKAGECONFIG[gdbm] = ",,gdbm"
+
+do_configure_prepend () {
+    mkdir -p ${B}/Modules
+    cat > ${B}/Modules/Setup.local << EOF
+*disabled*
+${@bb.utils.contains('PACKAGECONFIG', 'gdbm', '', '_gdbm _dbm', d)}
+EOF
+}
 
 CPPFLAGS_append = " -I${STAGING_INCDIR}/ncursesw -I${STAGING_INCDIR}/uuid"
 
-- 
2.25.4

