Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by mx.groups.io with SMTP id smtpd.web12.1750.1587625184793735407
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Apr 2020 23:59:44 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.43, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: A4JNmBxhi+IolLpsu3j2joi82A4XXc0lKSnnSz/xcSItzKzSi8Oulqwos67RKoj8a0UEDFFA79
 rZj/EJYXizsQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2020 23:59:44 -0700
IronPort-SDR: z++7mDtV+vC7VHIMKj+nb9tIaCB+zrsMpI1cMIMArsLRYXg+UE+ZXT7x+940qrleVvlV+JiDC+
 YeYwlxTd2UOQ==
X-IronPort-AV: E=Sophos;i="5.73,306,1583222400"; 
   d="scan'208";a="365917642"
Received: from anmitta2-mobl1.gar.corp.intel.com ([10.249.69.137])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2020 23:59:42 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [zeus][PATCH] python3-native: Should not search the system for headers/libraries.
Date: Thu, 23 Apr 2020 14:59:35 +0800
Message-Id: <20200423065935.183789-1-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.25.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jeremy Puhlman <jpuhlman@mvista.com>

The specific issue here is rpc/rpc.h, but its likely more general.
/usr/include is searched for rpc/rpc.h and if it exists on the
system, it changes behavior. If you are using the extended buildtools
tarball on a machine that has /usr/include/rpc/rpc.h, it will decide
that is good enough and not continue to search. nis fails to build
because /usr/include and /usr/lib are not part of the include/link
paths for the buildtools tarball compiler(nor should they be).

This makes it so python3-native will not build if you are using the
extended buildtools tarball, but from a larger issue perspective it
is building in likely different ways depending on what machine it
is building on.

libtirpc is already a depend so we shouldn't need the hosts rpc/rcp.h.

(From OE-Core rev: f37dfc7907ae7bac08d40468ddde2e5b8bba030c)

Signed-off-by: Jeremy A. Puhlman <jpuhlman@mvista.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 400743867de587579dee85388c30190f353f80c8)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 ...-search-system-for-headers-libraries.patch | 29 +++++++++++++++++++
 meta/recipes-devtools/python/python3_3.7.7.bb |  1 +
 2 files changed, 30 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3/0001-Don-t-search-system-for-headers-libraries.patch

diff --git a/meta/recipes-devtools/python/python3/0001-Don-t-search-system-for-headers-libraries.patch b/meta/recipes-devtools/python/python3/0001-Don-t-search-system-for-headers-libraries.patch
new file mode 100644
index 0000000000..acf8e1e9b5
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/0001-Don-t-search-system-for-headers-libraries.patch
@@ -0,0 +1,29 @@
+From 85e8f86ad2b7dec0848cd55b8e810a5e2722b20a Mon Sep 17 00:00:00 2001
+From: Jeremy Puhlman <jpuhlman@mvista.com>
+Date: Wed, 4 Mar 2020 00:06:42 +0000
+Subject: [PATCH] Don't search system for headers/libraries
+
+Upstream-Status: Inappropriate [oe-core specific]
+Signed-off-by: Jeremy Puhlman <jpuhlman@mvista.com>
+---
+ setup.py | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/setup.py b/setup.py
+index 9da1b3a..59782c0 100644
+--- a/setup.py
++++ b/setup.py
+@@ -674,8 +674,8 @@ class PyBuildExt(build_ext):
+             add_dir_to_list(self.compiler.include_dirs,
+                             sysconfig.get_config_var("INCLUDEDIR"))
+ 
+-        system_lib_dirs = ['/lib64', '/usr/lib64', '/lib', '/usr/lib']
+-        system_include_dirs = ['/usr/include']
++        system_lib_dirs = []
++        system_include_dirs = []
+         # lib_dirs and inc_dirs are used to search for files;
+         # if a file is found in one of those directories, it can
+         # be assumed that no additional -I,-L directives are needed.
+-- 
+2.24.1
+
diff --git a/meta/recipes-devtools/python/python3_3.7.7.bb b/meta/recipes-devtools/python/python3_3.7.7.bb
index 823eb2f8fd..0a78cdab44 100644
--- a/meta/recipes-devtools/python/python3_3.7.7.bb
+++ b/meta/recipes-devtools/python/python3_3.7.7.bb
@@ -33,6 +33,7 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
 SRC_URI_append_class-native = " \
            file://0001-distutils-sysconfig-append-STAGING_LIBDIR-python-sys.patch \
            file://12-distutils-prefix-is-inside-staging-area.patch \
+           file://0001-Don-t-search-system-for-headers-libraries.patch \
            "
 SRC_URI_append_class-nativesdk = " \
            file://0001-main.c-if-OEPYTHON3HOME-is-set-use-instead-of-PYTHON.patch \
-- 
2.25.3

