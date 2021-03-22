Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web09.110.1616450082443223153
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Mar 2021 14:54:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=RcYK/PLJ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f48.google.com with SMTP id j18so18731333wra.2
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Mar 2021 14:54:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3m6ZnyT+3OA2ko32R7LOwNI/jH9LXanE+sfBVdrG840=;
        b=RcYK/PLJoSJEb7QSpX0yKmxdjl5EP1veiFoked0vcTbCWF1i6n0dfGFYZDe9OQ2/X/
         0b4S66pcmGeRuMDvgNsFTxisivebThk+z8lXlIhjzm8lvX2Merxkrnzcn4ztD/rRPtzS
         KHnG16jADVnIWyTKQBJZp+zGnZNGjNWrRvJ2E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3m6ZnyT+3OA2ko32R7LOwNI/jH9LXanE+sfBVdrG840=;
        b=EU1YAZuc8U/HBsnh6TQYTE7V+XEl45Hn9pE9wCZQcLddvoXZpkgrLWXMioVTB3uMW3
         pemkL4VjiaZ555QktSgtjB8UfMrCU8xsltdOwu7uiiwXp8izZ9igSjEQ/NqQ6Sfm3ffq
         RRkSbdhZff7DrUaCddSpU8umCKff3zizWUk/sxX7B6NbiEg4P7sIZZlO8sr3UyNFSFFd
         8ESe01Y5jE2wQwgi/8hzE1cG3RjMLPanluBkEHQmQKdjeVo7HbsYXFsccD26MSiPGrfy
         a6Ciu99ApiKzJEvOnq9w2CjGE7aBYL6yUzEnBuyNfCumrOl6yrEGP3+P+7DrZn1bGp/7
         XZoA==
X-Gm-Message-State: AOAM531EiWySrGiqEjkuvyIZHIpVYAEVzjSJuFt31j/4A3m67KCCkqnF
	OexC5r6Z26wtV8p/kfOUT11siA5HNLngIw==
X-Google-Smtp-Source: ABdhPJxu9Sm3Uov4vxwsPl1kbKS0w/YOr072Hyp434FV/y2EZyUjZOmUPbWpNd9y5h1NM0FSCMTbnw==
X-Received: by 2002:a5d:4ac7:: with SMTP id y7mr599286wrs.395.1616450080502;
        Mon, 22 Mar 2021 14:54:40 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:d9d1:ce9a:66bd:fc35])
        by smtp.gmail.com with ESMTPSA id q4sm624135wma.20.2021.03.22.14.54.40
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Mar 2021 14:54:40 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] site/elfutils/libunistring: Drop patching for iconv and set in site file
Date: Mon, 22 Mar 2021 21:54:39 +0000
Message-Id: <20210322215439.315685-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The standard macros from gettext for iconv include problematic tests which
we've been patching out adhoc. Stop doing this and set results in the site
files instead which is simpler, more maintainable and peforms better too
as an added bonus.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../elfutils/elfutils_0.183.bb                |  1 -
 ...4-Disable-the-test-to-convert-euc-jp.patch | 42 --------------
 ...m4-remove-the-test-to-convert-euc-jp.patch | 56 -------------------
 .../libunistring/libunistring_0.9.10.bb       |  1 -
 meta/site/common-linux                        |  3 +
 5 files changed, 3 insertions(+), 100 deletions(-)
 delete mode 100644 meta/recipes-devtools/elfutils/files/0004-Disable-the-test-to-convert-euc-jp.patch
 delete mode 100644 meta/recipes-support/libunistring/libunistring/iconv-m4-remove-the-test-to-convert-euc-jp.patch

diff --git a/meta/recipes-devtools/elfutils/elfutils_0.183.bb b/meta/recipes-devtools/elfutils/elfutils_0.183.bb
index 16ed7c9ddbf..c0833686de9 100644
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
index f407bdd0be5..00000000000
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
diff --git a/meta/recipes-support/libunistring/libunistring/iconv-m4-remove-the-test-to-convert-euc-jp.patch b/meta/recipes-support/libunistring/libunistring/iconv-m4-remove-the-test-to-convert-euc-jp.patch
deleted file mode 100644
index 9e8ce2270da..00000000000
--- a/meta/recipes-support/libunistring/libunistring/iconv-m4-remove-the-test-to-convert-euc-jp.patch
+++ /dev/null
@@ -1,56 +0,0 @@
-From 30562065ba9e4c238e76100b5f9f0c5add0e635b Mon Sep 17 00:00:00 2001
-From: Jackie Huang <jackie.huang@windriver.com>
-Date: Tue, 5 Dec 2017 09:30:36 +0200
-Subject: [PATCH] remove the test to convert euc-jp
-
-Remove the test "Test against HP-UX 11.11 bug:
-No converter from EUC-JP to UTF-8 is provided"
-since we don't support HP-UX and if the euc-jp is not
-installed on the host, libunistring will be built without
-iconv support and will cause guild-native configure fail.
-
-Upstream-Status: Inappropriate [OE specific]
-
-Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
----
----
- gnulib-m4/iconv.m4 | 23 -----------------------
- 1 file changed, 23 deletions(-)
-
-diff --git a/gnulib-m4/iconv.m4 b/gnulib-m4/iconv.m4
-index b33ecd0..73b6aa1 100644
---- a/gnulib-m4/iconv.m4
-+++ b/gnulib-m4/iconv.m4
-@@ -165,29 +165,6 @@ AC_DEFUN([AM_ICONV_LINK],
-       }
-   }
- #endif
--  /* Test against HP-UX 11.11 bug: No converter from EUC-JP to UTF-8 is
--     provided.  */
--  {
--    /* Try standardized names.  */
--    iconv_t cd1 = iconv_open ("UTF-8", "EUC-JP");
--    /* Try IRIX, OSF/1 names.  */
--    iconv_t cd2 = iconv_open ("UTF-8", "eucJP");
--    /* Try AIX names.  */
--    iconv_t cd3 = iconv_open ("UTF-8", "IBM-eucJP");
--    /* Try HP-UX names.  */
--    iconv_t cd4 = iconv_open ("utf8", "eucJP");
--    if (cd1 == (iconv_t)(-1) && cd2 == (iconv_t)(-1)
--        && cd3 == (iconv_t)(-1) && cd4 == (iconv_t)(-1))
--      result |= 16;
--    if (cd1 != (iconv_t)(-1))
--      iconv_close (cd1);
--    if (cd2 != (iconv_t)(-1))
--      iconv_close (cd2);
--    if (cd3 != (iconv_t)(-1))
--      iconv_close (cd3);
--    if (cd4 != (iconv_t)(-1))
--      iconv_close (cd4);
--  }
-   return result;
- ]])],
-           [am_cv_func_iconv_works=yes], ,
--- 
-2.4.0
-
diff --git a/meta/recipes-support/libunistring/libunistring_0.9.10.bb b/meta/recipes-support/libunistring/libunistring_0.9.10.bb
index 97fac4ecfa6..0a7b18ed08e 100644
--- a/meta/recipes-support/libunistring/libunistring_0.9.10.bb
+++ b/meta/recipes-support/libunistring/libunistring_0.9.10.bb
@@ -20,7 +20,6 @@ LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=6a6a8e020838b23406c81b19c1d46df6 \
                    "
 
 SRC_URI = "${GNU_MIRROR}/libunistring/libunistring-${PV}.tar.gz \
-           file://iconv-m4-remove-the-test-to-convert-euc-jp.patch \
            file://0001-Unset-need_charset_alias-when-building-for-musl.patch \
 "
 SRC_URI[md5sum] = "0d3274e9838396b12200f8b54ddaf43b"
diff --git a/meta/site/common-linux b/meta/site/common-linux
index 1c1fdafbb06..8f23adeab42 100644
--- a/meta/site/common-linux
+++ b/meta/site/common-linux
@@ -1,6 +1,9 @@
 # gettext - these add sleep delays otherwise
 gl_cv_func_sleep_works=${gl_cv_func_sleep_works=yes}
 gl_cv_header_working_fcntl_h=${gl_cv_header_working_fcntl_h=yes}
+# the euc-jp tests in iconv.m4 break elfutils and libunistring depending on the
+# host locales installed. Avoid this by skipping the tests, we're not on HP-UX!
+am_cv_func_iconv_works=${am_cv_func_iconv_works=yes}
 
 # apr
 ac_cv_file__dev_zero=${ac_cv_file__dev_zero=yes}
-- 
2.30.2

