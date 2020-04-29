Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [])
 by mx.groups.io with SMTP id smtpd.web11.65.1588130056750187135
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Apr 2020 20:14:23 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: <nil>, mailfrom: wangmy@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.73,329,1583164800"; 
   d="scan'208";a="90727567"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 29 Apr 2020 11:14:18 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id 876914BCC88B
	for <openembedded-core@lists.openembedded.org>; Wed, 29 Apr 2020 11:14:12 +0800 (CST)
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.80) by
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Wed, 29 Apr 2020 11:14:11 +0800
Received: from localhost.localdomain (10.167.225.33) by
 G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Wed, 29 Apr 2020 11:14:19 +0800
From: "Wang Mingyu" <wangmy@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [OE-core] [PATCH v2] json-c: upgrade 0.13.1 -> 0.14
Date: Wed, 29 Apr 2020 04:13:56 -0700
Message-ID: <20200429111356.34973-2-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200429111356.34973-1-wangmy@cn.fujitsu.com>
References: <20200429111356.34973-1-wangmy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-yoursite-MailScanner-ID: 876914BCC88B.A216C
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

From: Wang Mingyu <wangmy@cn.fujitsu.com>

add-disable-werror-option-to-configure.patch
removed since it is included in 0.14

Make mode changes from autotools to cmake.

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 ...d-disable-werror-option-to-configure.patch | 45 -------------------
 .../{json-c_0.13.1.bb => json-c_0.14.bb}      |  9 ++--
 2 files changed, 3 insertions(+), 51 deletions(-)
 delete mode 100644 meta/recipes-devtools/json-c/json-c/add-disable-werror-option-to-configure.patch
 rename meta/recipes-devtools/json-c/{json-c_0.13.1.bb => json-c_0.14.bb} (70%)

diff --git a/meta/recipes-devtools/json-c/json-c/add-disable-werror-option-to-configure.patch b/meta/recipes-devtools/json-c/json-c/add-disable-werror-option-to-configure.patch
deleted file mode 100644
index 0c20c8458a..0000000000
--- a/meta/recipes-devtools/json-c/json-c/add-disable-werror-option-to-configure.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-json-c: Backport --disable-werror patch to allow compilation under icecc
-
-icecc preprocesses source files locally before shipping them off to be compiled
-on remote hosts. This preprocessing removes comments, including /* fallthough */
-comments in switch statements that normally prevent an implicit-fallthrough
-warning, see https://github.com/icecc/icecream/issues/419
-
-Rather than turning off -Werror, the upstream project has implemented a
-configure option, --disable-werror, in response to Ross's
-https://github.com/json-c/json-c/issues/489
-
-This patch from
-https://github.com/json-c/json-c/commit/21c886534f8927fdc0fb5f8647394f3e0e0874b8
-
-Upstream-Status: Backport [Not yet released]
-Signed-off-by: Douglas Royds <douglas.royds@taitradio.com>
-
-From 21c886534f8927fdc0fb5f8647394f3e0e0874b8 Mon Sep 17 00:00:00 2001
-From: Pierce Lopez <pierce.lopez@gmail.com>
-Date: Sun, 9 Jun 2019 10:52:08 -0400
-Subject: [PATCH] build: add --disable-werror option to configure
-
-to omit -Werror compiler option
----
- configure.ac | 7 ++++++-
- 1 file changed, 6 insertions(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index 272ea6af9c..798fd5b747 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -165,7 +165,12 @@ AS_IF([test "x$enable_Bsymbolic" = "xcheck"],
- AS_IF([test "x$enable_Bsymbolic" = "xyes"], [JSON_BSYMBOLIC_LDFLAGS=-Wl[,]-Bsymbolic-functions])
- AC_SUBST(JSON_BSYMBOLIC_LDFLAGS)
- 
--AX_APPEND_COMPILE_FLAGS([-Wall -Werror -Wcast-qual -Wno-error=deprecated-declarations])
-+AC_ARG_ENABLE([werror],
-+    AS_HELP_STRING([--disable-werror], [avoid treating compiler warnings as fatal errors]))
-+
-+AS_IF([test "x$enable_werror" != "xno"], [AX_APPEND_COMPILE_FLAGS([-Werror])])
-+
-+AX_APPEND_COMPILE_FLAGS([-Wall -Wcast-qual -Wno-error=deprecated-declarations])
- AX_APPEND_COMPILE_FLAGS([-Wextra -Wwrite-string -Wno-unused-parameter])
- AX_APPEND_COMPILE_FLAGS([-D_GNU_SOURCE])
- 
diff --git a/meta/recipes-devtools/json-c/json-c_0.13.1.bb b/meta/recipes-devtools/json-c/json-c_0.14.bb
similarity index 70%
rename from meta/recipes-devtools/json-c/json-c_0.13.1.bb
rename to meta/recipes-devtools/json-c/json-c_0.14.bb
index 522879f21f..15226d2a3f 100644
--- a/meta/recipes-devtools/json-c/json-c_0.13.1.bb
+++ b/meta/recipes-devtools/json-c/json-c_0.14.bb
@@ -5,18 +5,15 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=de54b60fbbc35123ba193fea8ee216f2"
 
 SRC_URI = "https://s3.amazonaws.com/json-c_releases/releases/${BP}.tar.gz \
-           file://add-disable-werror-option-to-configure.patch \
            "
-SRC_URI[md5sum] = "04969ad59cc37bddd83741a08b98f350"
-SRC_URI[sha256sum] = "b87e608d4d3f7bfdd36ef78d56d53c74e66ab278d318b71e6002a369d36f4873"
+SRC_URI[md5sum] = "72cbb065b43376d825cd521d115ae1f6"
+SRC_URI[sha256sum] = "b377de08c9b23ca3b37d9a9828107dff1de5ce208ff4ebb35005a794f30c6870"
 
 UPSTREAM_CHECK_URI = "https://github.com/${BPN}/${BPN}/releases"
 UPSTREAM_CHECK_REGEX = "json-c-(?P<pver>\d+(\.\d+)+)-\d+"
 
 RPROVIDES_${PN} = "libjson"
 
-inherit autotools
-
-EXTRA_OECONF = "--disable-werror"
+inherit cmake
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1



