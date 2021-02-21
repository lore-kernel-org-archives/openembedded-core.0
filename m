Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web11.26554.1613945842370399283
 for <openembedded-core@lists.openembedded.org>;
 Sun, 21 Feb 2021 14:17:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=LJX0pbJB;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f42.google.com with SMTP id p3so1653266wmc.2
        for <openembedded-core@lists.openembedded.org>; Sun, 21 Feb 2021 14:17:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=7hryA69ijfxTFqlfkDxSzjY0ov0uBo8L84pRJTFUzXs=;
        b=LJX0pbJBeqPG2LuAn+6g1VbgGf9JqhnHHbzTKAzvwxCYFAM6BpOdAMc4Tl/xaQhZ0+
         tW66LhXdiG37VWKUZZ04rwfOPvogwenaZiCFFHwyKTnWsXnUQ6RpH2t4RfOBX6C+yfih
         7rdLppRZsv39Jo/VIdqqwzB0pABtzeNyD3Zhc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7hryA69ijfxTFqlfkDxSzjY0ov0uBo8L84pRJTFUzXs=;
        b=Q5we/O1hi+jJqX8IZlinewaRcK+RaCvfhBbeZNE70sR7zfTXPzQtS9Xs8VHFurIkOS
         fF23ZM7qnU50flbfgJge0hbccW85DCw+S4rm5YBgc/AjF1NvG9AxKoQQyT1YY2y2lqiF
         NM3HFB27asYpt9hXYLgX9NOB47AjEPBF/LwBaieGIbPIu7ozBM4n5sJBgJ6rNycNCJ9v
         iTvX13BvXlpP4E9SCjP1os/guy+UFwtU9a0wGOD3EStHYGWXmskTEuDKcerGC5KOiNxt
         pV+8LMTIV5d+LzTD3v5Xw8yGTOuGq5oGXO/2RevC8/PDyM91W24B7ziJrstNbv/1nN6Q
         gJhw==
X-Gm-Message-State: AOAM530QmgIk9nz1t4VmBsEYkh8bhD00EqpmGkTU3RakhE/RssG2aM2Q
	35FyUA+35g39LXU/WCPTrIdWQF66j6yo9Q==
X-Google-Smtp-Source: ABdhPJwTMA1l2OGzMFD+NpyyUjjzOeCkgG5tvAlu1PqNBnK8RscZGrdpjW1aOPenvAqUH81LFBexaw==
X-Received: by 2002:a7b:c8c5:: with SMTP id f5mr8666217wml.82.1613945840902;
        Sun, 21 Feb 2021 14:17:20 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:6747:849:8224:46bc])
        by smtp.gmail.com with ESMTPSA id m4sm10196612wrb.87.2021.02.21.14.17.20
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Feb 2021 14:17:20 -0800 (PST)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 7/7] libpcre: Drop old/stale patch
Date: Sun, 21 Feb 2021 22:17:17 +0000
Message-Id: <20210221221717.3714714-7-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210221221717.3714714-1-richard.purdie@linuxfoundation.org>
References: <20210221221717.3714714-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

According to my tests this incorrect symbols resolution at runtime no
longer happens. Ubuntu is still carrying the patch but also probably
doesn't need to, they are also on a much older version. It sounds
like there was once a linkage bug somewhere which has likely been
resolved since.

Drop the patch as it doesn't seem needed anymore. If it were a real
issue it should be submitted upstream too, the status is incorrect.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../libpcre/fix-pcre-name-collision.patch     | 41 -------------------
 meta/recipes-support/libpcre/libpcre_8.44.bb  |  1 -
 2 files changed, 42 deletions(-)
 delete mode 100644 meta/recipes-support/libpcre/libpcre/fix-pcre-name-collision.patch

diff --git a/meta/recipes-support/libpcre/libpcre/fix-pcre-name-collision.patch b/meta/recipes-support/libpcre/libpcre/fix-pcre-name-collision.patch
deleted file mode 100644
index 89b44f6aa6f..00000000000
--- a/meta/recipes-support/libpcre/libpcre/fix-pcre-name-collision.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-Upstream-Status: Inappropriate [debian patch]
-
-This patch address a namespace collision with libc.
-
-Although there is no "#include <regex.h>" in the source file, at
-runtime, it's unintentionally linked to the libc version, the regcomp of
-libc is called instead the pcre one using pcre's data structure...
-that looks like a disaster.
-
-Can patch is from Debian (and Ubuntu 11.04alpha has it also).
-
-[sgw: added patch comment]
-Signed-off-by: Qing He <qing.he@intel.com>
-Signed-off-by: Saul Wold <sgw@linux.intel.com>
-
---- a/pcreposix.h	2010-05-17 00:17:23.000000000 +0800
-+++ b/pcreposix.h	2009-01-15 04:32:17.000000000 +0800
-@@ -133,14 +130,19 @@
- 
- /* The functions */
- 
--PCREPOSIX_EXP_DECL int regcomp(regex_t *, const char *, int);
--PCREPOSIX_EXP_DECL int regexec(const regex_t *, const char *, size_t,
-+PCREPOSIX_EXP_DECL int pcreposix_regcomp(regex_t *, const char *, int);
-+PCREPOSIX_EXP_DECL int pcreposix_regexec(const regex_t *, const char *, size_t,
-                      regmatch_t *, int);
--PCREPOSIX_EXP_DECL size_t regerror(int, const regex_t *, char *, size_t);
--PCREPOSIX_EXP_DECL void regfree(regex_t *);
-+PCREPOSIX_EXP_DECL size_t pcreposix_regerror(int, const regex_t *, char *, size_t);
-+PCREPOSIX_EXP_DECL void pcreposix_regfree(regex_t *);
- 
- #ifdef __cplusplus
- }   /* extern "C" */
- #endif
- 
-+#define regcomp pcreposix_regcomp
-+#define regexec pcreposix_regexec
-+#define regerror pcreposix_regerror
-+#define regfree pcreposix_regfree
-+
- #endif /* End of pcreposix.h */
diff --git a/meta/recipes-support/libpcre/libpcre_8.44.bb b/meta/recipes-support/libpcre/libpcre_8.44.bb
index e5471e81da3..cd80dc7345b 100644
--- a/meta/recipes-support/libpcre/libpcre_8.44.bb
+++ b/meta/recipes-support/libpcre/libpcre_8.44.bb
@@ -8,7 +8,6 @@ SECTION = "devel"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENCE;md5=3bb381a66a5385b246d4877922e7511e"
 SRC_URI = "https://ftp.pcre.org/pub/pcre/pcre-${PV}.tar.bz2 \
-           file://fix-pcre-name-collision.patch \
            file://run-ptest \
            file://Makefile \
            "
-- 
2.27.0

