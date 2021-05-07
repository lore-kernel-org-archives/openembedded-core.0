Received: from mga02.intel.com (mga02.intel.com [])
 by mx.groups.io with SMTP id smtpd.web12.6883.1620370974892359593
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 May 2021 00:03:22 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: CWtAD5lZQB3ASm9FE/rZ5G7tFY6f2i/tTZhWN7E9VjK+UjULBmSEjmMkc6fv2qyBYiODKzylz4
 rid68axFwF6w==
X-IronPort-AV: E=McAfee;i="6200,9189,9976"; a="185794796"
X-IronPort-AV: E=Sophos;i="5.82,279,1613462400"; 
   d="scan'208";a="185794796"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2021 00:03:21 -0700
IronPort-SDR: W07QwXeebcMGSxUnjKs/SYLniw3/JIDmBeN/lxzU3lTVC5cHGzz9lNQDqV9Dks6n27v2esp4El
 pA8T3GkTwTXw==
X-IronPort-AV: E=Sophos;i="5.82,279,1613462400"; 
   d="scan'208";a="407331678"
Received: from sthum-mobl6.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.215.243.238])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2021 00:03:20 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 23/31] webkitgtk: Fix reproducibility in minibrowser
Date: Fri,  7 May 2021 15:02:35 +0800
Message-Id: <283e6adb30a1946d4b870ab0f2d69c1b230a70e4.1620370571.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1620370571.git.anuj.mittal@intel.com>
References: <cover.1620370571.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Khem Raj <raj.khem@gmail.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 8f08ca440b6c2ad3494808ffa4ec6091722c0339)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../0001-MiniBrowser-Fix-reproduciblity.patch | 31 +++++++++++++++++++
 meta/recipes-sato/webkit/webkitgtk_2.30.5.bb  |  1 +
 2 files changed, 32 insertions(+)
 create mode 100644 meta/recipes-sato/webkit/webkitgtk/0001-MiniBrowser-Fix-reproduciblity.patch

diff --git a/meta/recipes-sato/webkit/webkitgtk/0001-MiniBrowser-Fix-reproduciblity.patch b/meta/recipes-sato/webkit/webkitgtk/0001-MiniBrowser-Fix-reproduciblity.patch
new file mode 100644
index 0000000000..98d2d1ded9
--- /dev/null
+++ b/meta/recipes-sato/webkit/webkitgtk/0001-MiniBrowser-Fix-reproduciblity.patch
@@ -0,0 +1,31 @@
+From dcf9ae0dc0b4510eddbeeea09e11edfb123f95af Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 2 May 2021 13:10:49 -0700
+Subject: [PATCH] MiniBrowser: Fix reproduciblity
+
+Do not emit references to source dir in generated sourcecode
+
+Upstream-Status: Submitted [https://bugs.webkit.org/show_bug.cgi?id=225283]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ Tools/MiniBrowser/gtk/CMakeLists.txt | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/Tools/MiniBrowser/gtk/CMakeLists.txt b/Tools/MiniBrowser/gtk/CMakeLists.txt
+index 93b62521..482d3b00 100644
+--- a/Tools/MiniBrowser/gtk/CMakeLists.txt
++++ b/Tools/MiniBrowser/gtk/CMakeLists.txt
+@@ -51,8 +51,8 @@ add_custom_command(
+     OUTPUT ${MiniBrowser_DERIVED_SOURCES_DIR}/BrowserMarshal.c
+            ${MiniBrowser_DERIVED_SOURCES_DIR}/BrowserMarshal.h
+     MAIN_DEPENDENCY ${MiniBrowser_DIR}/browser-marshal.list
+-    COMMAND glib-genmarshal --prefix=browser_marshal ${MiniBrowser_DIR}/browser-marshal.list --body > ${MiniBrowser_DERIVED_SOURCES_DIR}/BrowserMarshal.c
+-    COMMAND glib-genmarshal --prefix=browser_marshal ${MiniBrowser_DIR}/browser-marshal.list --header > ${MiniBrowser_DERIVED_SOURCES_DIR}/BrowserMarshal.h
++    COMMAND glib-genmarshal --prefix=browser_marshal ${MiniBrowser_DIR}/browser-marshal.list --body --skip-source > ${MiniBrowser_DERIVED_SOURCES_DIR}/BrowserMarshal.c
++    COMMAND glib-genmarshal --prefix=browser_marshal ${MiniBrowser_DIR}/browser-marshal.list --header --skip-source > ${MiniBrowser_DERIVED_SOURCES_DIR}/BrowserMarshal.h
+     VERBATIM)
+ 
+ if (USE_GTK4)
+-- 
+2.31.1
+
diff --git a/meta/recipes-sato/webkit/webkitgtk_2.30.5.bb b/meta/recipes-sato/webkit/webkitgtk_2.30.5.bb
index cdc3f9b584..1fefc75c49 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.30.5.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.30.5.bb
@@ -20,6 +20,7 @@ SRC_URI = "https://www.webkitgtk.org/releases/${BPN}-${PV}.tar.xz \
            file://reduce-memory-overheads.patch \
            file://0001-Extend-atomics-check-to-include-1-byte-CAS-test.patch \
            file://musl-lower-stack-usage.patch \
+           file://0001-MiniBrowser-Fix-reproduciblity.patch \
            "
 
 SRC_URI[sha256sum] = "7d0dab08e3c5ae07bec80b2822ef42e952765d5724cac86eb23999bfed5a7f1f"
-- 
2.30.2

