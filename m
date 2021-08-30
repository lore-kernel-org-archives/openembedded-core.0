Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by mx.groups.io with SMTP id smtpd.web12.13900.1630308851415211051
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Aug 2021 00:34:12 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.136, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10091"; a="197789536"
X-IronPort-AV: E=Sophos;i="5.84,362,1620716400"; 
   d="scan'208";a="197789536"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2021 00:34:12 -0700
X-IronPort-AV: E=Sophos;i="5.84,362,1620716400"; 
   d="scan'208";a="509469244"
Received: from hongkekh-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.215.234.105])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2021 00:34:10 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 1/9] icu: increase pkgdata command buffer size
Date: Mon, 30 Aug 2021 15:33:52 +0800
Message-Id: <6cb98cbd789d53768c5d26729f10655762114e6e.1630306698.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1630306698.git.anuj.mittal@intel.com>
References: <cover.1630306698.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Joe Slater <joe.slater@windriver.com>

Mitigate pathname truncation when installing in a project
with a very long pathname.

Signed-off-by: Joe Slater <joe.slater@windriver.com>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 ...pkgdata-increase-command-buffer-size.patch | 46 +++++++++++++++++++
 meta/recipes-support/icu/icu_68.2.bb          |  1 +
 2 files changed, 47 insertions(+)
 create mode 100644 meta/recipes-support/icu/icu/0001-pkgdata-increase-command-buffer-size.patch

diff --git a/meta/recipes-support/icu/icu/0001-pkgdata-increase-command-buffer-size.patch b/meta/recipes-support/icu/icu/0001-pkgdata-increase-command-buffer-size.patch
new file mode 100644
index 0000000000..a5483568bb
--- /dev/null
+++ b/meta/recipes-support/icu/icu/0001-pkgdata-increase-command-buffer-size.patch
@@ -0,0 +1,46 @@
+From ab6b1acdeed76899f8227c38ab7e7675c7673ff1 Mon Sep 17 00:00:00 2001
+From: Joe Slater <joe.slater@windriver.com>
+Date: Thu, 5 Aug 2021 09:23:48 -0700
+Subject: [PATCH 1/1] pkgdata: increase command buffer size
+
+Make cmd LARGE_BUFFER_SIZE to avoid pathname truncation
+when install paths are longer than about 150 characters.
+
+https://unicode-org.atlassian.net/browse/ICU-21702 has been
+created to address this issue and error reporting.
+
+Upstream-Status: Submitted [ICU-21702 opened]
+
+Signed-off-by: Joe Slater <joe.slater@windriver.com>
+---
+ source/tools/pkgdata/pkgdata.cpp | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/source/tools/pkgdata/pkgdata.cpp b/source/tools/pkgdata/pkgdata.cpp
+index 5ab682e..d4b70ef 100644
+--- a/tools/pkgdata/pkgdata.cpp
++++ b/tools/pkgdata/pkgdata.cpp
+@@ -1131,17 +1131,17 @@ normal_symlink_mode:
+ 
+ static int32_t pkg_installLibrary(const char *installDir, const char *targetDir, UBool noVersion) {
+     int32_t result = 0;
+-    char cmd[SMALL_BUFFER_MAX_SIZE];
++    char cmd[LARGE_BUFFER_MAX_SIZE];
+ 
+     auto ret = snprintf(cmd,
+-            SMALL_BUFFER_MAX_SIZE,
++            LARGE_BUFFER_MAX_SIZE,
+             "cd %s && %s %s %s%s%s",
+             targetDir,
+             pkgDataFlags[INSTALL_CMD],
+             libFileNames[LIB_FILE_VERSION],
+             installDir, PKGDATA_FILE_SEP_STRING, libFileNames[LIB_FILE_VERSION]);
+     (void)ret;
+-    U_ASSERT(0 <= ret && ret < SMALL_BUFFER_MAX_SIZE);
++    U_ASSERT(0 <= ret && ret < LARGE_BUFFER_MAX_SIZE);
+ 
+     result = runCommand(cmd);
+ 
+-- 
+2.29.2
+
diff --git a/meta/recipes-support/icu/icu_68.2.bb b/meta/recipes-support/icu/icu_68.2.bb
index 1ca87feee4..130212d245 100644
--- a/meta/recipes-support/icu/icu_68.2.bb
+++ b/meta/recipes-support/icu/icu_68.2.bb
@@ -107,6 +107,7 @@ SRC_URI = "${BASE_SRC_URI};name=code \
            file://filter.json \
            file://fix-install-manx.patch \
            file://0001-icu-Added-armeb-support.patch \
+           file://0001-pkgdata-increase-command-buffer-size.patch \
            "
 
 SRC_URI_append_class-target = "\
-- 
2.31.1

