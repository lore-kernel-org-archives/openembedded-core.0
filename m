Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E9BDC64ED8
	for <webhook@archiver.kernel.org>; Wed,  8 Feb 2023 07:21:54 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web10.3126.1675840910613950144
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Feb 2023 23:21:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=l4hr5jVJ;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id j29-20020a05600c1c1d00b003dc52fed235so743814wms.1
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Feb 2023 23:21:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1ETVemfKbmlNWnd3nzEzlgyTvWOoIdbhzTrIYQRDFDs=;
        b=l4hr5jVJs0d4k/ImCmWAk93bjJYau3nXpWzpN482XpZ978JyvGiLRzg58acZjvrRGV
         5gKxBh0bVYBbtAbPhFcMVVGmNz6eCjQ5f/aDPHuhVsVb3HVQ1JjrXhX2Ul4aBkoTpm8L
         7e3k0og+dktVv4LLAR/uf4RO+s0YAfLomB/HrNHzl0qNTlho5P7E7TBnBZXPWxr/qL/K
         67v7H73RzZAlp6w8dEWuYPXrPgBnd2fSZMy65TXNHC9KLdWte8ANcL6VLizs4a841q2O
         elQAce7Hr2X8VP2XpPjvugKKuAjaBCv/tyI0+q15O9OtEZRUq4GRI95DhQkRdU7havOu
         hWOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1ETVemfKbmlNWnd3nzEzlgyTvWOoIdbhzTrIYQRDFDs=;
        b=TieoXp8a0B9ZtEId4MK4SnRdeevbcPk9zvxQ5haVzrg/LA5pbbIqadzNHNz0/th9X3
         ntoS0U1T62CWbq0mZW4VRIV7gF0wbnu1xcunxfuzo2jC2ZONQCRvf6WFvjlmp2CjQGp3
         Ye0xgrbSL6+oRG7UpxlYs+1CWJPxa3/OKNUt2sA8cS1C0PG2Dt88HWgAzEeNo7Dv2Km1
         gN6xYk0ex0Vz/T7JvX4AEBFkyZk+I+y3ueFmoRkAAEIbSupPJ4N+3WJXzMwWxd4v8Nh2
         ToHlpB4pVfGqqT/PS8pt2s7QhcNGeuhcHc70jqfydQjGHIeCgVVazewqqRnog5AFb6NQ
         iR7g==
X-Gm-Message-State: AO0yUKWnS51V2K2HNb632PD+kBVA7zjZnqOaoz3HcvloYFf0kgJimD3G
	r6nZV33nfEWIKATNtv1yQT5ucJ0e24k=
X-Google-Smtp-Source: AK7set8AkuTn2xYdBjjAj+VWiSfGEA1MwBSR8foHMA5ct0e+hhkgMJFXoPVnNlMfdGb7UUj1IGN3JA==
X-Received: by 2002:a05:600c:3197:b0:3df:f7f3:d007 with SMTP id s23-20020a05600c319700b003dff7f3d007mr5664696wmp.17.1675840909130;
        Tue, 07 Feb 2023 23:21:49 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id l16-20020a05600c2cd000b003daffc2ecdesm1087926wmc.13.2023.02.07.23.21.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Feb 2023 23:21:48 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 03/52] diffutils: update 3.8 -> 3.9
Date: Wed,  8 Feb 2023 08:20:54 +0100
Message-Id: <20230208072143.2930292-3-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230208072143.2930292-1-alex@linutronix.de>
References: <20230208072143.2930292-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Feb 2023 07:21:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176843

Drop patch as issue fixed upstream.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...001-Skip-strip-trailing-cr-test-case.patch | 11 +++----
 ...a-standard-layout-so-glibc-and-musl-.patch | 33 -------------------
 .../{diffutils_3.8.bb => diffutils_3.9.bb}    |  3 +-
 3 files changed, 6 insertions(+), 41 deletions(-)
 delete mode 100644 meta/recipes-extended/diffutils/diffutils/0001-mcontext-is-not-a-standard-layout-so-glibc-and-musl-.patch
 rename meta/recipes-extended/diffutils/{diffutils_3.8.bb => diffutils_3.9.bb} (88%)

diff --git a/meta/recipes-extended/diffutils/diffutils/0001-Skip-strip-trailing-cr-test-case.patch b/meta/recipes-extended/diffutils/diffutils/0001-Skip-strip-trailing-cr-test-case.patch
index aac1c43465..8b88c308f2 100644
--- a/meta/recipes-extended/diffutils/diffutils/0001-Skip-strip-trailing-cr-test-case.patch
+++ b/meta/recipes-extended/diffutils/diffutils/0001-Skip-strip-trailing-cr-test-case.patch
@@ -1,4 +1,4 @@
-From bd7fb8be2ae2d75347cf7733302d5093046ffa85 Mon Sep 17 00:00:00 2001
+From 027229d25392b22d7280c0abbc3efde4f467d167 Mon Sep 17 00:00:00 2001
 From: Peiran Hong <peiran.hong@windriver.com>
 Date: Thu, 5 Sep 2019 15:42:22 -0400
 Subject: [PATCH] Skip strip-trailing-cr test case
@@ -10,19 +10,21 @@ package.
 Upstream-Status: Inappropriate [embedded specific]
 
 Signed-off-by: Peiran Hong <peiran.hong@windriver.com>
+
 ---
  tests/Makefile.am | 4 +++-
  1 file changed, 3 insertions(+), 1 deletion(-)
 
 diff --git a/tests/Makefile.am b/tests/Makefile.am
-index 83a7c9d..04d51b5 100644
+index d98df82..757ea52 100644
 --- a/tests/Makefile.am
 +++ b/tests/Makefile.am
-@@ -21,8 +21,10 @@ TESTS = \
+@@ -21,9 +21,11 @@ TESTS = \
    stdin \
    strcoll-0-names \
    filename-quoting \
 -  strip-trailing-cr \
+   timezone \
    colors
 +# Skipping this test since it requires valgrind
 +# and thus is too heavy for diffutils package
@@ -30,6 +32,3 @@ index 83a7c9d..04d51b5 100644
  
  XFAIL_TESTS = large-subopt
  
--- 
-2.21.0
-
diff --git a/meta/recipes-extended/diffutils/diffutils/0001-mcontext-is-not-a-standard-layout-so-glibc-and-musl-.patch b/meta/recipes-extended/diffutils/diffutils/0001-mcontext-is-not-a-standard-layout-so-glibc-and-musl-.patch
deleted file mode 100644
index 4928e1eaff..0000000000
--- a/meta/recipes-extended/diffutils/diffutils/0001-mcontext-is-not-a-standard-layout-so-glibc-and-musl-.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From f385ad6639380eb6dfa8b8eb4a5ba65dd12db744 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 25 Mar 2022 13:43:19 -0700
-Subject: [PATCH] mcontext is not a standard layout so glibc and musl differ
-
-This is already applied to libsigsegv upstream, hopefully next version
-of grep will update its internal copy and we can drop this patch
-
-Upstream-Status: Backport [https://git.savannah.gnu.org/gitweb/?p=libsigsegv.git;a=commitdiff;h=a6ff69873110c0a8ba6f7fd90532dbc11224828c]
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- lib/sigsegv.c | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/lib/sigsegv.c b/lib/sigsegv.c
-index 998c827..b6f4841 100644
---- a/lib/sigsegv.c
-+++ b/lib/sigsegv.c
-@@ -219,8 +219,8 @@ int libsigsegv_version = LIBSIGSEGV_VERSION;
- #   define SIGSEGV_FAULT_STACKPOINTER  ((ucontext_t *) ucp)->uc_mcontext.gp_regs[1]
- #  else /* 32-bit */
- /* both should be equivalent */
--#   if 0
--#    define SIGSEGV_FAULT_STACKPOINTER  ((ucontext_t *) ucp)->uc_mcontext.regs->gpr[1]
-+#   if ! defined __GLIBC__
-+#    define SIGSEGV_FAULT_STACKPOINTER  ((ucontext_t *) ucp)->uc_regs->gregs[1]
- #   else
- #    define SIGSEGV_FAULT_STACKPOINTER  ((ucontext_t *) ucp)->uc_mcontext.uc_regs->gregs[1]
- #   endif
--- 
-2.35.1
-
diff --git a/meta/recipes-extended/diffutils/diffutils_3.8.bb b/meta/recipes-extended/diffutils/diffutils_3.9.bb
similarity index 88%
rename from meta/recipes-extended/diffutils/diffutils_3.8.bb
rename to meta/recipes-extended/diffutils/diffutils_3.9.bb
index 8889c83ee2..2bb9e6f32d 100644
--- a/meta/recipes-extended/diffutils/diffutils_3.8.bb
+++ b/meta/recipes-extended/diffutils/diffutils_3.9.bb
@@ -6,10 +6,9 @@ require diffutils.inc
 SRC_URI = "${GNU_MIRROR}/diffutils/diffutils-${PV}.tar.xz \
            file://run-ptest \
            file://0001-Skip-strip-trailing-cr-test-case.patch \
-           file://0001-mcontext-is-not-a-standard-layout-so-glibc-and-musl-.patch \
            "
 
-SRC_URI[sha256sum] = "a6bdd7d1b31266d11c4f4de6c1b748d4607ab0231af5188fc2533d0ae2438fec"
+SRC_URI[sha256sum] = "d80d3be90a201868de83d78dad3413ad88160cc53bcc36eb9eaf7c20dbf023f1"
 
 EXTRA_OECONF += "ac_cv_path_PR_PROGRAM=${bindir}/pr --without-libsigsegv-prefix"
 
-- 
2.30.2


