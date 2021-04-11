Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web11.19432.1618156151666666989
 for <openembedded-core@lists.openembedded.org>;
 Sun, 11 Apr 2021 08:49:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=PdmJKH4V;
 spf=pass (domain: gmail.com, ip: 209.85.216.48, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f48.google.com with SMTP id em21-20020a17090b0155b029014e204a81e6so795457pjb.1
        for <openembedded-core@lists.openembedded.org>; Sun, 11 Apr 2021 08:49:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id;
        bh=StBm9G6GxWdGsco1hKR4jKAGQ/i8a/VyD4nIFTzEeCk=;
        b=PdmJKH4V2l1nJegNTGlIGJ7eTRTnAAg7lhfGtn5O264OhgdfsklT7+YIHjvzXsNZs5
         cN+OiktNy3dDU6ZFE4J7IIomTYs7WglZLonqI7PEffGXRQuPGPb6HceVK3v8usnKD9ZW
         Smnckp6lXPzVv5dnWVyGmOgO6U7lnhh/L67yE5jcdm5fMrJYo0MnDwjOZfwEJcPoylwY
         FidBMr3nCRK0fWUTk5l6/XhI8/FxUGLEdhOgi0sstDjMAfLtOmkm2LYaOnYXi4iSIGN8
         A+WS7VU/+ai1MjhP4+E9NQwZS+dPImjObJ672Z7wZg4CT1Nt8wsKEUlZ8wgE1KZCOaqJ
         lN+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id;
        bh=StBm9G6GxWdGsco1hKR4jKAGQ/i8a/VyD4nIFTzEeCk=;
        b=R5DGE6Xo1Np4K8vvH/F8kTdX/ug06rGancRUBrdZvEDs0H2W95Ko6OLIn/UDmFHLU1
         w/NOTQi8N4QdOBEYsTuekKi7iFKCKo+B1fsF95xrUUolGCrmu10xP8IRVSRRoLR//SgT
         AFxe3c+R6Jhq9gPP/9o4v/Rb2VStoPvO2jYsZPrKQDdhmgm7Bj9Nn78htI91CPVBEaSS
         RRZ7Phon/dLbQztAtTVGy5gaQu2KI/9C7/2PsEvMJIsEjDvWM3pmHf45Fdi8WVF4gxyZ
         gu1aDo/5cOtjtCEhiZelqrn9ij1RwedViGzJZiwc9XXjYmlEBNPVCidm+gmHUWUMsJeb
         4Hww==
X-Gm-Message-State: AOAM530QQiXvfNHZ/KBuqxBBboQT7ihB57bNOz58D+WbqEh5zta6fcfW
	qqs8E+jy/uDKQ6iO9Us+/qvtarsTKYE=
X-Google-Smtp-Source: ABdhPJxtu0HES80sRpqRUiwssZBKsw2sHTgvaczlQpBhffOshtjnPtlxgiy06mr8pKcY4XcI73s/oA==
X-Received: by 2002:a17:902:7c94:b029:e6:e1d7:62b7 with SMTP id y20-20020a1709027c94b02900e6e1d762b7mr21882669pll.29.1618156150639;
        Sun, 11 Apr 2021 08:49:10 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:b887:cf12:9d4d:daab])
        by smtp.gmail.com with ESMTPSA id 23sm8630547pgo.53.2021.04.11.08.49.09
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Apr 2021 08:49:10 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] binutils: rename BRANCH var
Date: Sun, 11 Apr 2021 08:49:00 -0700
Message-Id: <20210411154900.20331-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1

If BRANCH is defined in local.conf then that name is used to d/l sources
for binutils. You will get this error:

Fetcher failure for URL: 'git://sourceware.org/git/binutils-gdb.git;branch=hardknott;protocol=git'. Unable to fetch URL from any source.

Rename to SRCBRANCH like glibc has to avoid the more common variable name BRANCH.

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-devtools/binutils/binutils-2.36.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/binutils/binutils-2.36.inc b/meta/recipes-devtools/binutils/binutils-2.36.inc
index 2968291889..f638f02e8f 100644
--- a/meta/recipes-devtools/binutils/binutils-2.36.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.36.inc
@@ -19,13 +19,13 @@ def binutils_branch_version(d):
 PV = "2.36.1"
 CVE_VERSION = "2.36.1"
 BINUPV = "${@binutils_branch_version(d)}"
-#BRANCH = "binutils-${BINUPV}-branch"
-BRANCH ?= "binutils-2_36-branch"
+#SRCBRANCH = "binutils-${BINUPV}-branch"
+SRCBRANCH ?= "binutils-2_36-branch"
 
 UPSTREAM_CHECK_GITTAGREGEX = "binutils-(?P<pver>\d+_(\d_?)*)"
 
 SRCREV ?= "7651a4871c225925ffdfda0a8c91a6ed370cd9a1"
-BINUTILS_GIT_URI ?= "git://sourceware.org/git/binutils-gdb.git;branch=${BRANCH};protocol=git"
+BINUTILS_GIT_URI ?= "git://sourceware.org/git/binutils-gdb.git;branch=${SRCBRANCH};protocol=git"
 SRC_URI = "\
      ${BINUTILS_GIT_URI} \
      file://0004-configure-widen-the-regexp-for-SH-architectures.patch \
-- 
2.17.1

