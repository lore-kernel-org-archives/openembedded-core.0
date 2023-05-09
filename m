Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2ABBCC7EE33
	for <webhook@archiver.kernel.org>; Tue,  9 May 2023 17:24:04 +0000 (UTC)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
 by mx.groups.io with SMTP id smtpd.web11.39300.1683653037905742652
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 May 2023 10:23:58 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=f+5N9g42;
 spf=pass (domain: gmail.com, ip: 209.85.208.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-50bc1612940so11534395a12.2
        for <openembedded-core@lists.openembedded.org>; Tue, 09 May 2023 10:23:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683653036; x=1686245036;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f40wNGZC6HQMd2a6GIIc8wFbI26TXVpOoeP11tKYQWI=;
        b=f+5N9g425+6dOhY/sNrhM7niZhy7WIofgHT1imasZ3USyV4Pga7zgMPBipJQzIgarX
         fHOjyuAwiPq+S0ckYBgypR1ohjjW+gKPchsLmyE+jFPALh+WytHr2ve/iRcyvXT9+kGl
         iahu5jnju07xodn/3OKm+AtCKOo1gPgWfd4ikp0N0Y+dpvli4gJmA8m6DN8TcVRAlKk1
         bUykAUGKuJw3e4ypyX39gEOewR/Bxe2av1imR3UtnQtJqNnYTmQzHEJSlMu1LSUyDC1t
         /5Am7uft758Vbf1CFcrARk/TcF08kAef4Iw0CN2eQLL4IGqKio8LIQ99HuuSz34HhYQr
         F5cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683653036; x=1686245036;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f40wNGZC6HQMd2a6GIIc8wFbI26TXVpOoeP11tKYQWI=;
        b=MlWISHqu6pv/Wr9Uu0GKVb1SlHIGZVKDY2R+tJGUQwulwzE1XtLKkqiEGrroiv8DBA
         WY95B2Jbp2+ozq/+iqTo8gKpbZfY4M0hodfTobTqA9+7Gw9sRvCshRNqeKAmCq0GSEUC
         VT6fn4hJYkCTvM7M6+CmqJK8IBCYilWVOsWZYVuC0i5k04WqjXcFMfV8FwNf0ROj0mUj
         8ymp35sqq/nW7SRLeXiDRtgWXH35k+kWMSieDEUMU2fpQ/zanccwOoHI644xli9OFpJU
         DyD9bkTsAmrNMQhCg+8SBnLu4UuLzFG5FzAiziDric4fHlB7SVVuG+vSTwGvgGwCb2qU
         18Eg==
X-Gm-Message-State: AC+VfDzkjJjzcX3i8bTkhA3kKpweI1xXKOEowWA2xzBUSShwHOTtzfZq
	fB+JLU9hoxUWhToNCXk1OFNG2ZSdFYI=
X-Google-Smtp-Source: ACHHUZ7EA02+bVWFZXnG3f07gkFY27+ZdaWkgkE1heWCEHkgLUGAQ6osYDzpls7626thaP3DzLZMNQ==
X-Received: by 2002:a17:906:9b94:b0:94f:3f92:c7b0 with SMTP id dd20-20020a1709069b9400b0094f3f92c7b0mr13363782ejc.60.1683653036349;
        Tue, 09 May 2023 10:23:56 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id jz24-20020a17090775f800b0096347ef816dsm1578252ejc.64.2023.05.09.10.23.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 May 2023 10:23:56 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 13/27] perl: update 5.36.0 -> 5.36.1
Date: Tue,  9 May 2023 19:23:30 +0200
Message-Id: <20230509172344.1516743-13-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230509172344.1516743-1-alex@linutronix.de>
References: <20230509172344.1516743-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 May 2023 17:24:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181068

Drop gcc 12 patch, as upstream rejected it, and then (presumably) fixed gcc 12 issues differently.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../files/0001-Fix-build-with-gcc-12.patch    | 143 ------------------
 .../perl/files/perl-configpm-switch.patch     |   2 +-
 .../perl/{perl_5.36.0.bb => perl_5.36.1.bb}   |   3 +-
 3 files changed, 2 insertions(+), 146 deletions(-)
 delete mode 100644 meta/recipes-devtools/perl/files/0001-Fix-build-with-gcc-12.patch
 rename meta/recipes-devtools/perl/{perl_5.36.0.bb => perl_5.36.1.bb} (99%)

diff --git a/meta/recipes-devtools/perl/files/0001-Fix-build-with-gcc-12.patch b/meta/recipes-devtools/perl/files/0001-Fix-build-with-gcc-12.patch
deleted file mode 100644
index 1d98e1389b5..00000000000
--- a/meta/recipes-devtools/perl/files/0001-Fix-build-with-gcc-12.patch
+++ /dev/null
@@ -1,143 +0,0 @@
-From ee957eb9e4ec29a462cdbb2f3bbe29d4270534ef Mon Sep 17 00:00:00 2001
-From: Mingli Yu <mingli.yu@windriver.com>
-Date: Thu, 2 Jun 2022 13:01:37 +0800
-Subject: [PATCH] proto.h: Fix build with gcc-12
-
-Fixes:
-  In function 'dynprep',
-    inlined from 'S_sortsv_flags_impl' at pp_sort.c:358:20,
-    inlined from 'sortsv_amagic_i_ncmp' at pp_sort.c:572:5:
-    pp_sort.c:1232:1: error: inlining failed in call to 'always_inline' 'S_amagic_i_ncmp': function not considered for inlining
-  1232 | S_amagic_i_ncmp(pTHX_ SV *const a, SV *const b)
-
-Upstream-Status: Submitted [https://github.com/Perl/perl5/pull/19808]
-
-Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
----
- proto.h | 42 ++++++++++++++----------------------------
- 1 file changed, 14 insertions(+), 28 deletions(-)
-
-diff --git a/proto.h b/proto.h
-index faca6d1..3a76c04 100644
---- a/proto.h
-+++ b/proto.h
-@@ -5606,50 +5606,43 @@ STATIC SSize_t	S_unpack_rec(pTHX_ struct tempsym* symptr, const char *s, const c
- #endif
- #if defined(PERL_IN_PP_SORT_C)
- #ifndef PERL_NO_INLINE_FUNCTIONS
--PERL_STATIC_FORCE_INLINE I32	S_amagic_cmp(pTHX_ SV *const str1, SV *const str2)
--			__attribute__always_inline__;
-+PERL_STATIC_FORCE_INLINE I32	S_amagic_cmp(pTHX_ SV *const str1, SV *const str2);
- #define PERL_ARGS_ASSERT_AMAGIC_CMP	\
- 	assert(str1); assert(str2)
- #endif
- 
- #ifndef PERL_NO_INLINE_FUNCTIONS
--PERL_STATIC_FORCE_INLINE I32	S_amagic_cmp_desc(pTHX_ SV *const str1, SV *const str2)
--			__attribute__always_inline__;
-+PERL_STATIC_FORCE_INLINE I32	S_amagic_cmp_desc(pTHX_ SV *const str1, SV *const str2);
- #define PERL_ARGS_ASSERT_AMAGIC_CMP_DESC	\
- 	assert(str1); assert(str2)
- #endif
- 
- #ifndef PERL_NO_INLINE_FUNCTIONS
--PERL_STATIC_FORCE_INLINE I32	S_amagic_i_ncmp(pTHX_ SV *const a, SV *const b)
--			__attribute__always_inline__;
-+PERL_STATIC_FORCE_INLINE I32	S_amagic_i_ncmp(pTHX_ SV *const a, SV *const b);
- #define PERL_ARGS_ASSERT_AMAGIC_I_NCMP	\
- 	assert(a); assert(b)
- #endif
- 
- #ifndef PERL_NO_INLINE_FUNCTIONS
--PERL_STATIC_FORCE_INLINE I32	S_amagic_i_ncmp_desc(pTHX_ SV *const a, SV *const b)
--			__attribute__always_inline__;
-+PERL_STATIC_FORCE_INLINE I32	S_amagic_i_ncmp_desc(pTHX_ SV *const a, SV *const b);
- #define PERL_ARGS_ASSERT_AMAGIC_I_NCMP_DESC	\
- 	assert(a); assert(b)
- #endif
- 
- #ifndef PERL_NO_INLINE_FUNCTIONS
--PERL_STATIC_FORCE_INLINE I32	S_amagic_ncmp(pTHX_ SV *const a, SV *const b)
--			__attribute__always_inline__;
-+PERL_STATIC_FORCE_INLINE I32	S_amagic_ncmp(pTHX_ SV *const a, SV *const b);
- #define PERL_ARGS_ASSERT_AMAGIC_NCMP	\
- 	assert(a); assert(b)
- #endif
- 
- #ifndef PERL_NO_INLINE_FUNCTIONS
--PERL_STATIC_FORCE_INLINE I32	S_amagic_ncmp_desc(pTHX_ SV *const a, SV *const b)
--			__attribute__always_inline__;
-+PERL_STATIC_FORCE_INLINE I32	S_amagic_ncmp_desc(pTHX_ SV *const a, SV *const b);
- #define PERL_ARGS_ASSERT_AMAGIC_NCMP_DESC	\
- 	assert(a); assert(b)
- #endif
- 
- #ifndef PERL_NO_INLINE_FUNCTIONS
--PERL_STATIC_FORCE_INLINE I32	S_cmp_desc(pTHX_ SV *const str1, SV *const str2)
--			__attribute__always_inline__;
-+PERL_STATIC_FORCE_INLINE I32	S_cmp_desc(pTHX_ SV *const str1, SV *const str2);
- #define PERL_ARGS_ASSERT_CMP_DESC	\
- 	assert(str1); assert(str2)
- #endif
-@@ -5671,51 +5664,44 @@ PERL_STATIC_FORCE_INLINE void	S_sortsv_flags_impl(pTHX_ SV** array, size_t num_e
- #endif
- 
- #ifndef PERL_NO_INLINE_FUNCTIONS
--PERL_STATIC_FORCE_INLINE I32	S_sv_i_ncmp(pTHX_ SV *const a, SV *const b)
--			__attribute__always_inline__;
-+PERL_STATIC_FORCE_INLINE I32	S_sv_i_ncmp(pTHX_ SV *const a, SV *const b);
- #define PERL_ARGS_ASSERT_SV_I_NCMP	\
- 	assert(a); assert(b)
- #endif
- 
- #ifndef PERL_NO_INLINE_FUNCTIONS
--PERL_STATIC_FORCE_INLINE I32	S_sv_i_ncmp_desc(pTHX_ SV *const a, SV *const b)
--			__attribute__always_inline__;
-+PERL_STATIC_FORCE_INLINE I32	S_sv_i_ncmp_desc(pTHX_ SV *const a, SV *const b);
- #define PERL_ARGS_ASSERT_SV_I_NCMP_DESC	\
- 	assert(a); assert(b)
- #endif
- 
- #ifndef PERL_NO_INLINE_FUNCTIONS
--PERL_STATIC_FORCE_INLINE I32	S_sv_ncmp(pTHX_ SV *const a, SV *const b)
--			__attribute__always_inline__;
-+PERL_STATIC_FORCE_INLINE I32	S_sv_ncmp(pTHX_ SV *const a, SV *const b);
- #define PERL_ARGS_ASSERT_SV_NCMP	\
- 	assert(a); assert(b)
- #endif
- 
- #ifndef PERL_NO_INLINE_FUNCTIONS
--PERL_STATIC_FORCE_INLINE I32	S_sv_ncmp_desc(pTHX_ SV *const a, SV *const b)
--			__attribute__always_inline__;
-+PERL_STATIC_FORCE_INLINE I32	S_sv_ncmp_desc(pTHX_ SV *const a, SV *const b);
- #define PERL_ARGS_ASSERT_SV_NCMP_DESC	\
- 	assert(a); assert(b)
- #endif
- 
- #  if defined(USE_LOCALE_COLLATE)
- #ifndef PERL_NO_INLINE_FUNCTIONS
--PERL_STATIC_FORCE_INLINE I32	S_amagic_cmp_locale(pTHX_ SV *const str1, SV *const str2)
--			__attribute__always_inline__;
-+PERL_STATIC_FORCE_INLINE I32	S_amagic_cmp_locale(pTHX_ SV *const str1, SV *const str2);
- #define PERL_ARGS_ASSERT_AMAGIC_CMP_LOCALE	\
- 	assert(str1); assert(str2)
- #endif
- 
- #ifndef PERL_NO_INLINE_FUNCTIONS
--PERL_STATIC_FORCE_INLINE I32	S_amagic_cmp_locale_desc(pTHX_ SV *const str1, SV *const str2)
--			__attribute__always_inline__;
-+PERL_STATIC_FORCE_INLINE I32	S_amagic_cmp_locale_desc(pTHX_ SV *const str1, SV *const str2);
- #define PERL_ARGS_ASSERT_AMAGIC_CMP_LOCALE_DESC	\
- 	assert(str1); assert(str2)
- #endif
- 
- #ifndef PERL_NO_INLINE_FUNCTIONS
--PERL_STATIC_FORCE_INLINE I32	S_cmp_locale_desc(pTHX_ SV *const str1, SV *const str2)
--			__attribute__always_inline__;
-+PERL_STATIC_FORCE_INLINE I32	S_cmp_locale_desc(pTHX_ SV *const str1, SV *const str2);
- #define PERL_ARGS_ASSERT_CMP_LOCALE_DESC	\
- 	assert(str1); assert(str2)
- #endif
--- 
-2.25.1
-
diff --git a/meta/recipes-devtools/perl/files/perl-configpm-switch.patch b/meta/recipes-devtools/perl/files/perl-configpm-switch.patch
index f80de889748..7ca7c7d12fe 100644
--- a/meta/recipes-devtools/perl/files/perl-configpm-switch.patch
+++ b/meta/recipes-devtools/perl/files/perl-configpm-switch.patch
@@ -1,4 +1,4 @@
-From 055d4c31f41611b7d7fb6b0e38b3818a053de38d Mon Sep 17 00:00:00 2001
+From e789c1a0c9de5928a3b49f5b9d81b63636f5c7bb Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Sun, 27 May 2007 21:04:11 +0000
 Subject: [PATCH] perl: 5.8.7 -> 5.8.8 (from OE)
diff --git a/meta/recipes-devtools/perl/perl_5.36.0.bb b/meta/recipes-devtools/perl/perl_5.36.1.bb
similarity index 99%
rename from meta/recipes-devtools/perl/perl_5.36.0.bb
rename to meta/recipes-devtools/perl/perl_5.36.1.bb
index b8dba00f188..f7d66e6ed90 100644
--- a/meta/recipes-devtools/perl/perl_5.36.0.bb
+++ b/meta/recipes-devtools/perl/perl_5.36.1.bb
@@ -17,7 +17,6 @@ SRC_URI = "https://www.cpan.org/src/5.0/perl-${PV}.tar.gz;name=perl \
            file://0002-Constant-Fix-up-shebang.patch \
            file://determinism.patch \
            file://0001-cpan-Sys-Syslog-Makefile.PL-Fix-_PATH_LOG-for-determ.patch \
-           file://0001-Fix-build-with-gcc-12.patch \
            "
 SRC_URI:append:class-native = " \
            file://perl-configpm-switch.patch \
@@ -26,7 +25,7 @@ SRC_URI:append:class-target = " \
            file://encodefix.patch \
 "
 
-SRC_URI[perl.sha256sum] = "e26085af8ac396f62add8a533c3a0ea8c8497d836f0689347ac5abd7b7a4e00a"
+SRC_URI[perl.sha256sum] = "68203665d8ece02988fc77dc92fccbb297a83a4bb4b8d07558442f978da54cc1"
 
 B = "${WORKDIR}/perl-${PV}-build"
 
-- 
2.30.2


