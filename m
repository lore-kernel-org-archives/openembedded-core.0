Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A97D8C5B555
	for <webhook@archiver.kernel.org>; Fri,  6 Jun 2025 13:31:30 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.web11.33567.1749216681336986063
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Jun 2025 06:31:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KyMtCFct;
 spf=pass (domain: gmail.com, ip: 209.85.208.52, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-60766191202so1812885a12.1
        for <openembedded-core@lists.openembedded.org>; Fri, 06 Jun 2025 06:31:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749216680; x=1749821480; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=rjSE2d7OXarjCAYr6M1LMoHiPGgiypJBbdFV0PF2jzU=;
        b=KyMtCFctPoLn7z+d94eojQfKeAaD2R/rLZ+fLa0Agi8JQ1EmQgHDmCRzgfu6wSiK+C
         ArolJPfy9qGwwyT2bYbTtsD1Cm+WtCqH87CmOtQI2Eyfi8wXyr8ALNC/KFH5omFvISX/
         fdzUiigGJ3rOkeNJ7koHYWxp/ptE5SotpPvikB01N58AXVMXo8DMoO4701q0InkZVYQ6
         JbN3E5RQc8xj1khJaJrVdUs2JoBavZqgEJL7X8767for2eIbkDMHtb2zl4UVENpsNGq6
         I9KGW55YidDTAwQBhIObVdchfbcz5/i26pBX8WUhpX8WV1DPeg8i+Xii43xaWEtZZ8wl
         kGXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749216680; x=1749821480;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rjSE2d7OXarjCAYr6M1LMoHiPGgiypJBbdFV0PF2jzU=;
        b=JJRTAG/GSyvX1jSHpdAoRn/Ip9JiMbkS7nCKYlqsUYzs4zwkqDw7Sp3zm/ZABh2zvL
         oKKkqmJQWMGmmpoEBTPURFLPK0BS/v/oZRiNgj5lkttr2RjggBGVs2ekDh3W6iYEqqhT
         3UjrZ94WXs4qH57xoYikKT/T3KoYIIdz2kdxBAkNVGAAAdG7w/gVPm/booemq4Qh5EP4
         BnwgMt04BxWgZieJd0wJQHnsy7VfsaTg9vjKWsq8kjakdKmdrkwRcYnSYy+ipxKUCnoP
         9fBT9OYa4IAL7lVaoJC6HJhKOnP34feNcC7ShUn4QmjqLOESq8+z4NI1Uixo7Rj/AJGD
         vLzw==
X-Gm-Message-State: AOJu0YyiQ3AICSH/Suqc1J3gwHws8Gpc/SS1Crmi7bvs/SyZD3r9FOvb
	WIBE6peOj2+YJurzmAtF+GWNx9g13pcL2ir8iD6dE9mI+Wx10/2tk3u61h33Gw==
X-Gm-Gg: ASbGnctWzTQcRBIuLdeqifLLlEf5sIaU5ptn8yxzc736zbRpcU1d3bCLZk8lnBcDas6
	vMQ7QfeuVmYs6u0iOnNj6Bsmh8DzHcJXSvpgxNKfRMf2OTG9ZO4FYhvG5P+7RqPreiIykEx2SXF
	tCB2f2f19SE3xiJHBor68E5nS/kLYOMlknX2JIzG3YeLHSAmY8trm1k3rCbzqibyR9OmRmF8VN+
	jXY15AhHB9ZkJ5C6nJPf3o9VFLciTeJzaMp8w2RdMstwnhX02xdkh2Lk2EseGPRvylPELV6UUug
	euY8dDXNLZCz+MbTBv93aAr4w9/CpH7oJAXB8WSLADqEBdPyrMYngcevuyQJx5PR++I=
X-Google-Smtp-Source: AGHT+IHrBKDQ6/RV+xGxqGTxPS8B4IsGv8kZzun2pnsGJ60wG0IdRYSm+i0s0CSvpXZS9TBS0U5k0g==
X-Received: by 2002:a05:6402:234d:b0:5f8:9607:3147 with SMTP id 4fb4d7f45d1cf-60773af4bd3mr2792446a12.6.1749216679272;
        Fri, 06 Jun 2025 06:31:19 -0700 (PDT)
Received: from localhost.localdomain ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-607783c2e93sm1026530a12.45.2025.06.06.06.31.18
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jun 2025 06:31:18 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] bc: upgrade 1.08.1 -> 1.08.2
Date: Fri,  6 Jun 2025 15:31:18 +0200
Message-ID: <20250606133118.882464-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Jun 2025 13:31:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218140

Changes:
  - Remove last vestages of K&R C; this allows gcc-15+ to compile
    the code without special options.
  - Some typo and formatting fixes in the documentation.

The above change also allowed dropping the relevant patch, that fixed
gcc15 compatibility: 0001-getopt-Add-missing-params-to-getopt-getenv-signature.patch

License-Update: added copyright years to the file header.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 ...ng-params-to-getopt-getenv-signature.patch | 40 -------------------
 .../bc/{bc_1.08.1.bb => bc_1.08.2.bb}         |  5 +--
 2 files changed, 2 insertions(+), 43 deletions(-)
 delete mode 100644 meta/recipes-extended/bc/bc/0001-getopt-Add-missing-params-to-getopt-getenv-signature.patch
 rename meta/recipes-extended/bc/{bc_1.08.1.bb => bc_1.08.2.bb} (81%)

diff --git a/meta/recipes-extended/bc/bc/0001-getopt-Add-missing-params-to-getopt-getenv-signature.patch b/meta/recipes-extended/bc/bc/0001-getopt-Add-missing-params-to-getopt-getenv-signature.patch
deleted file mode 100644
index f43f336075..0000000000
--- a/meta/recipes-extended/bc/bc/0001-getopt-Add-missing-params-to-getopt-getenv-signature.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From 493997b0d2c3dc6469f967d8f619ed934667c71e Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 22 Mar 2025 18:33:08 -0700
-Subject: [PATCH] getopt: Add missing params to getopt/getenv signatures
-
-This ensures it can compile with GCC 15 on musl
-
-Upstream-Status: Submitted [sent to bug-bc@gnu.org]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- h/getopt.h   | 2 +-
- lib/getopt.c | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/h/getopt.h b/h/getopt.h
-index cc45f46..5ea5eac 100644
---- a/h/getopt.h
-+++ b/h/getopt.h
-@@ -141,7 +141,7 @@ struct option
-    errors, only prototype getopt for the GNU C library.  */
- extern int getopt (int ___argc, char *const *___argv, const char *__shortopts);
- #else /* not __GNU_LIBRARY__ */
--extern int getopt ();
-+extern int getopt (int,  char * const*, const char *);
- #endif /* __GNU_LIBRARY__ */
- 
- #ifndef __need_getopt
-diff --git a/lib/getopt.c b/lib/getopt.c
-index b270074..3e6d071 100644
---- a/lib/getopt.c
-+++ b/lib/getopt.c
-@@ -197,7 +197,7 @@ static char *posixly_correct;
-    whose names are inconsistent.  */
- 
- #ifndef getenv
--extern char *getenv ();
-+extern char *getenv (const char*);
- #endif
- 
- #endif /* not __GNU_LIBRARY__ */
diff --git a/meta/recipes-extended/bc/bc_1.08.1.bb b/meta/recipes-extended/bc/bc_1.08.2.bb
similarity index 81%
rename from meta/recipes-extended/bc/bc_1.08.1.bb
rename to meta/recipes-extended/bc/bc_1.08.2.bb
index 5fbbe7ef6a..cebfed9642 100644
--- a/meta/recipes-extended/bc/bc_1.08.1.bb
+++ b/meta/recipes-extended/bc/bc_1.08.2.bb
@@ -5,7 +5,7 @@ DESCRIPTION = "bc is an arbitrary precision numeric processing language. Syntax
 LICENSE = "GPL-3.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
                     file://COPYING.LIB;md5=6a6a8e020838b23406c81b19c1d46df6 \
-                    file://bc/bcdefs.h;endline=17;md5=4295c06df9e833519a342f7b5d43db06 \
+                    file://bc/bcdefs.h;endline=17;md5=f4a0239b216b8407783955e74938f190 \
                     file://dc/dc.h;endline=18;md5=bad31533d57fe5948c996f9ef6643206 \
                     file://lib/number.c;endline=20;md5=cf43068cc88f837731dc53240456cfaf"
 
@@ -13,9 +13,8 @@ SECTION = "base"
 DEPENDS = "flex-native"
 
 SRC_URI = "${GNU_MIRROR}/${BPN}/${BP}.tar.gz \
-           file://0001-getopt-Add-missing-params-to-getopt-getenv-signature.patch \
            file://run-ptest"
-SRC_URI[sha256sum] = "b71457ffeb210d7ea61825ff72b3e49dc8f2c1a04102bbe23591d783d1bfe996"
+SRC_URI[sha256sum] = "ae470fec429775653e042015edc928d07c8c3b2fc59765172a330d3d87785f86"
 
 inherit autotools texinfo update-alternatives ptest
 

