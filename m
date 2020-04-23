Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web11.970.1587618712038630888
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Apr 2020 22:11:52 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: wangmy@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.73,305,1583164800"; 
   d="scan'208";a="89684369"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 23 Apr 2020 13:11:40 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id 9552446B5FB0
	for <openembedded-core@lists.openembedded.org>; Thu, 23 Apr 2020 13:01:02 +0800 (CST)
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.80) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 23 Apr 2020 13:11:38 +0800
Received: from localhost.localdomain (10.167.225.33) by
 G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Thu, 23 Apr 2020 13:11:46 +0800
From: "Wang Mingyu" <wangmy@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [OE-core] [PATCH] json-c: upgrade 0.13.1 -> 0.14
Date: Thu, 23 Apr 2020 06:11:29 -0700
Message-ID: <20200423131129.86186-1-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-yoursite-MailScanner-ID: 9552446B5FB0.A18C7
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
 .../{json-c_0.13.1.bb => json-c_0.14.bb}      |  7 ++-
 2 files changed, 3 insertions(+), 49 deletions(-)
 delete mode 100644 meta/recipes-devtools/json-c/json-c/add-disable-werror-option-to-configure.patch
 rename meta/recipes-devtools/json-c/{json-c_0.13.1.bb => json-c_0.14.bb} (74%)

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
similarity index 74%
rename from meta/recipes-devtools/json-c/json-c_0.13.1.bb
rename to meta/recipes-devtools/json-c/json-c_0.14.bb
index 522879f21f..6f1d80c25e 100644
--- a/meta/recipes-devtools/json-c/json-c_0.13.1.bb
+++ b/meta/recipes-devtools/json-c/json-c_0.14.bb
@@ -5,17 +5,16 @@ LICENSE = "MIT"
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
+inherit cmake
 
 EXTRA_OECONF = "--disable-werror"
 
-- 
2.17.1



