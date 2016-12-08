Return-Path: <huangqy.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 8D8786067C
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Dec 2016 05:31:20 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; d="scan'208";a="13716758"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 08 Dec 2016 13:31:22 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id ABFF446704A5
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Dec 2016 13:31:21 +0800 (CST)
Received: from localhost.localdomain (10.167.226.81) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.319.2; Thu, 8 Dec 2016 13:31:22 +0800
From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 8 Dec 2016 05:31:29 -0800
Message-ID: <1481203889-54311-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.167.226.81]
X-yoursite-MailScanner-ID: ABFF446704A5.A6BF4
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: huangqy.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH v2] slang: 2.3.0 -> 2.3.1
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
X-List-Received-Date: Thu, 08 Dec 2016 05:31:22 -0000
Content-Type: text/plain

1)Upgrade slang from 2.3.0 to 2.3.1.
2)Delete 0001-Fix-error-conflicting-types-for-posix_close.patch, since it is integrated upstream.

Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
---
 ...x-error-conflicting-types-for-posix_close.patch | 39 ----------------------
 .../slang/{slang_2.3.0.bb => slang_2.3.1.bb}       |  6 ++--
 2 files changed, 3 insertions(+), 42 deletions(-)
 delete mode 100644 meta/recipes-extended/slang/slang/0001-Fix-error-conflicting-types-for-posix_close.patch
 rename meta/recipes-extended/slang/{slang_2.3.0.bb => slang_2.3.1.bb} (90%)

diff --git a/meta/recipes-extended/slang/slang/0001-Fix-error-conflicting-types-for-posix_close.patch b/meta/recipes-extended/slang/slang/0001-Fix-error-conflicting-types-for-posix_close.patch
deleted file mode 100644
index 57ebfe4..0000000
--- a/meta/recipes-extended/slang/slang/0001-Fix-error-conflicting-types-for-posix_close.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 96eb7e29822151823a66a1eb59f1fa4aead5ae08 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 31 Aug 2015 06:33:21 +0000
-Subject: [PATCH] Fix  error: conflicting types for 'posix_close'
-
-Exposed while compiling on musl
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
-Upstream-Status: Pending
-
- src/slposio.c | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/src/slposio.c b/src/slposio.c
-index 9ce9697..9ff9bfe 100644
---- a/src/slposio.c
-+++ b/src/slposio.c
-@@ -363,7 +363,7 @@ static int posix_close_fd (int *fd)
-    return 0;
- }
- 
--static int posix_close (SLFile_FD_Type *f)
-+static int posix_closex (SLFile_FD_Type *f)
- {
-    int status = do_close (f);
- 
-@@ -1001,7 +1001,7 @@ static SLang_Intrin_Fun_Type Fd_Name_Table [] =
-    MAKE_INTRINSIC_2("write", posix_write, V, F, B),
-    MAKE_INTRINSIC_1("dup_fd", posix_dup, V, F),
-    MAKE_INTRINSIC_2("dup2_fd", posix_dup2, I, F, I),
--   MAKE_INTRINSIC_1("close", posix_close, I, F),
-+   MAKE_INTRINSIC_1("close", posix_closex, I, F),
-    MAKE_INTRINSIC_1("_close", posix_close_fd, I, I),
- #if defined(TTYNAME_R)
-    MAKE_INTRINSIC_0("ttyname", posix_ttyname, V),
--- 
-2.5.1
-
diff --git a/meta/recipes-extended/slang/slang_2.3.0.bb b/meta/recipes-extended/slang/slang_2.3.1.bb
similarity index 90%
rename from meta/recipes-extended/slang/slang_2.3.0.bb
rename to meta/recipes-extended/slang/slang_2.3.1.bb
index d5967d2..7bf3af6 100644
--- a/meta/recipes-extended/slang/slang_2.3.0.bb
+++ b/meta/recipes-extended/slang/slang_2.3.1.bb
@@ -19,11 +19,11 @@ SRC_URI = "http://www.jedsoft.org/releases/${BPN}/${BP}.tar.bz2 \
            file://rpathfix.patch \
            file://fix-check-pcre.patch \
            file://slang-fix-the-iconv-existence-checking.patch \
-           file://0001-Fix-error-conflicting-types-for-posix_close.patch \
            file://no-x.patch \
           "
-SRC_URI[md5sum] = "3bcc790460d52db1316c20395b7ac2f1"
-SRC_URI[sha256sum] = "f95224060f45e0d8212a5039b339afa5f1a94a1bb0298e796104e5b12e926129"
+
+SRC_URI[md5sum] = "bd46d1dc17a50c72004ad842829d7b1f"
+SRC_URI[sha256sum] = "a810d5da7b0c0c8c335393c6b4f12884be6fa7696d9ca9521ef21316a4e00f9d"
 
 UPSTREAM_CHECK_URI = "http://www.jedsoft.org/releases/slang/"
 PREMIRRORS_append = "\n http://www.jedsoft.org/releases/slang/.* http://www.jedsoft.org/releases/slang/old/ \n"
-- 
2.7.4




