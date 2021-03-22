Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
 by mx.groups.io with SMTP id smtpd.web08.9595.1616399473918398918
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Mar 2021 00:51:14 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.1.11, mailfrom: mingli.yu@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 12M7oww5021925
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Mon, 22 Mar 2021 00:51:07 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Mon, 22 Mar 2021 00:51:05 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2106.2 via Frontend Transport; Mon, 22 Mar 2021 00:51:05 -0700
From: "Yu, Mingli" <mingli.yu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH v3 2/2] elfutils: remove 0004-Disable-the-test-to-convert-euc-jp.patch
Date: Mon, 22 Mar 2021 15:51:03 +0800
Message-ID: <20210322075103.9694-2-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210322075103.9694-1-mingli.yu@windriver.com>
References: <166D65C2E097270E.28077@lists.openembedded.org>
 <20210322075103.9694-1-mingli.yu@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain

From: Mingli Yu <mingli.yu@windriver.com>

The below m4 macros files shipped with recipe will be removed if the
recipe use AM_GNU_GETTEXT.
gettext.m4
iconv.m4
lib-ld.m4
lib-link.m4
lib-prefix.m4
nls.m4 po.m4
progtest.m4

After elfutils upgrades to 0.183, it begins to use AM_GNU_GETTEXT as the
commit (dd52d2ab Modernize gettext infrastructure) included, so the above
m4 macros files such as iconv.m4 is removed and it's bad as we need to
patch against iconv.m4 shipped with elfutils.

So remove 0004-Disable-the-test-to-convert-euc-jp.patch and move the logic
to gettext-mininal which provides iconv.m4 now to fix the gap and also fix
the below build issue.
  $ bitbake elfutils -cconfigure && bitbake elfutils -cpatch -f

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 .../elfutils/elfutils_0.183.bb                |  1 -
 ...4-Disable-the-test-to-convert-euc-jp.patch | 42 -------------------
 2 files changed, 43 deletions(-)
 delete mode 100644 meta/recipes-devtools/elfutils/files/0004-Disable-the-test-to-convert-euc-jp.patch

diff --git a/meta/recipes-devtools/elfutils/elfutils_0.183.bb b/meta/recipes-devtools/elfutils/elfutils_0.183.bb
index 16ed7c9ddb..c0833686de 100644
--- a/meta/recipes-devtools/elfutils/elfutils_0.183.bb
+++ b/meta/recipes-devtools/elfutils/elfutils_0.183.bb
@@ -14,7 +14,6 @@ SRC_URI = "https://sourceware.org/elfutils/ftp/${PV}/${BP}.tar.bz2 \
            file://0001-dso-link-change.patch \
            file://0002-Fix-elf_cvt_gunhash-if-dest-and-src-are-same.patch \
            file://0003-fixheadercheck.patch \
-           file://0004-Disable-the-test-to-convert-euc-jp.patch \
            file://0006-Fix-build-on-aarch64-musl.patch \
            file://0001-libasm-may-link-with-libbz2-if-found.patch \
            file://0001-libelf-elf_end.c-check-data_list.data.d.d_buf-before.patch \
diff --git a/meta/recipes-devtools/elfutils/files/0004-Disable-the-test-to-convert-euc-jp.patch b/meta/recipes-devtools/elfutils/files/0004-Disable-the-test-to-convert-euc-jp.patch
deleted file mode 100644
index f407bdd0be..0000000000
--- a/meta/recipes-devtools/elfutils/files/0004-Disable-the-test-to-convert-euc-jp.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From cd36f34c722dd0babd7beb13c968aa0780c9f726 Mon Sep 17 00:00:00 2001
-From: Hongxu Jia <hongxu.jia@windriver.com>
-Date: Tue, 15 Aug 2017 17:24:06 +0800
-Subject: [PATCH] Disable the test to convert euc-jp
-
-Remove the test "Test against HP-UX 11.11 bug:
-No converter from EUC-JP to UTF-8 is provided"
-since we don't support HP-UX and if the euc-jp is not
-installed on the host, the dependence will be built without
-iconv support and will cause guild-native building fail.
-
-Upstream-Status: Inappropriate [OE specific]
-
-Signed-off-by: Roy Li <rongqing.li@windriver.com>
-
-Rebase to 0.170
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
-
----
- m4/iconv.m4 | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/m4/iconv.m4 b/m4/iconv.m4
-index aa159c5..d16312b 100644
---- a/m4/iconv.m4
-+++ b/m4/iconv.m4
-@@ -165,6 +165,7 @@ AC_DEFUN([AM_ICONV_LINK],
-       }
-   }
- #endif
-+#if 0
-   /* Test against HP-UX 11.11 bug: No converter from EUC-JP to UTF-8 is
-      provided.  */
-   if (/* Try standardized names.  */
-@@ -176,6 +177,7 @@ AC_DEFUN([AM_ICONV_LINK],
-       /* Try HP-UX names.  */
-       && iconv_open ("utf8", "eucJP") == (iconv_t)(-1))
-     result |= 16;
-+#endif
-   return result;
- ]])],
-           [am_cv_func_iconv_works=yes], ,
-- 
2.17.1

