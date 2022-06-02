Return-Path: <mingli.yu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AA36C43334
	for <webhook@archiver.kernel.org>; Thu,  2 Jun 2022 05:46:48 +0000 (UTC)
Received: from mail1.wrs.com (mail1.wrs.com [147.11.3.146])
 by mx.groups.io with SMTP id smtpd.web10.3371.1654148803635320939
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Jun 2022 22:46:44 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid
 domain name (domain: windriver.com, ip: 147.11.3.146,
 mailfrom: mingli.yu@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com
 [147.11.82.252])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 2525kgOc021653
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
 Wed, 1 Jun 2022 22:46:42 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Wed, 1 Jun 2022 22:46:41 -0700
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Wed, 1 Jun 2022 22:46:41 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] perl: Fix build with gcc-12
Date: Thu, 2 Jun 2022 13:46:40 +0800
Message-ID: <20220602054640.3543512-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Jun 2022 05:46:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166461

From: Mingli Yu <mingli.yu@windriver.com>

Fix the build failure when debug build is enabled.
Add DEBUG_BUILD = "1" in conf/local.conf.
 $ bitbake perl
  | In function 'dynprep',
    inlined from 'S_sortsv_flags_impl' at pp_sort.c:358:20,
    inlined from 'sortsv_amagic_i_ncmp' at pp_sort.c:572:5:
  |  pp_sort.c:1232:1: error: inlining failed in call to 'always_inline' 'S_amagic_i_ncmp': function not considered for inlining
  | 1232 | S_amagic_i_ncmp(pTHX_ SV *const a, SV *const b)

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 .../files/0001-Fix-build-with-gcc-12.patch    | 143 ++++++++++++++++++
 meta/recipes-devtools/perl/perl_5.34.1.bb     |   1 +
 2 files changed, 144 insertions(+)
 create mode 100644 meta/recipes-devtools/perl/files/0001-Fix-build-with-gcc-12.patch

diff --git a/meta/recipes-devtools/perl/files/0001-Fix-build-with-gcc-12.patch b/meta/recipes-devtools/perl/files/0001-Fix-build-with-gcc-12.patch
new file mode 100644
index 0000000000..1d98e1389b
--- /dev/null
+++ b/meta/recipes-devtools/perl/files/0001-Fix-build-with-gcc-12.patch
@@ -0,0 +1,143 @@
+From ee957eb9e4ec29a462cdbb2f3bbe29d4270534ef Mon Sep 17 00:00:00 2001
+From: Mingli Yu <mingli.yu@windriver.com>
+Date: Thu, 2 Jun 2022 13:01:37 +0800
+Subject: [PATCH] proto.h: Fix build with gcc-12
+
+Fixes:
+  In function 'dynprep',
+    inlined from 'S_sortsv_flags_impl' at pp_sort.c:358:20,
+    inlined from 'sortsv_amagic_i_ncmp' at pp_sort.c:572:5:
+    pp_sort.c:1232:1: error: inlining failed in call to 'always_inline' 'S_amagic_i_ncmp': function not considered for inlining
+  1232 | S_amagic_i_ncmp(pTHX_ SV *const a, SV *const b)
+
+Upstream-Status: Submitted [https://github.com/Perl/perl5/pull/19808]
+
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+---
+ proto.h | 42 ++++++++++++++----------------------------
+ 1 file changed, 14 insertions(+), 28 deletions(-)
+
+diff --git a/proto.h b/proto.h
+index faca6d1..3a76c04 100644
+--- a/proto.h
++++ b/proto.h
+@@ -5606,50 +5606,43 @@ STATIC SSize_t	S_unpack_rec(pTHX_ struct tempsym* symptr, const char *s, const c
+ #endif
+ #if defined(PERL_IN_PP_SORT_C)
+ #ifndef PERL_NO_INLINE_FUNCTIONS
+-PERL_STATIC_FORCE_INLINE I32	S_amagic_cmp(pTHX_ SV *const str1, SV *const str2)
+-			__attribute__always_inline__;
++PERL_STATIC_FORCE_INLINE I32	S_amagic_cmp(pTHX_ SV *const str1, SV *const str2);
+ #define PERL_ARGS_ASSERT_AMAGIC_CMP	\
+ 	assert(str1); assert(str2)
+ #endif
+ 
+ #ifndef PERL_NO_INLINE_FUNCTIONS
+-PERL_STATIC_FORCE_INLINE I32	S_amagic_cmp_desc(pTHX_ SV *const str1, SV *const str2)
+-			__attribute__always_inline__;
++PERL_STATIC_FORCE_INLINE I32	S_amagic_cmp_desc(pTHX_ SV *const str1, SV *const str2);
+ #define PERL_ARGS_ASSERT_AMAGIC_CMP_DESC	\
+ 	assert(str1); assert(str2)
+ #endif
+ 
+ #ifndef PERL_NO_INLINE_FUNCTIONS
+-PERL_STATIC_FORCE_INLINE I32	S_amagic_i_ncmp(pTHX_ SV *const a, SV *const b)
+-			__attribute__always_inline__;
++PERL_STATIC_FORCE_INLINE I32	S_amagic_i_ncmp(pTHX_ SV *const a, SV *const b);
+ #define PERL_ARGS_ASSERT_AMAGIC_I_NCMP	\
+ 	assert(a); assert(b)
+ #endif
+ 
+ #ifndef PERL_NO_INLINE_FUNCTIONS
+-PERL_STATIC_FORCE_INLINE I32	S_amagic_i_ncmp_desc(pTHX_ SV *const a, SV *const b)
+-			__attribute__always_inline__;
++PERL_STATIC_FORCE_INLINE I32	S_amagic_i_ncmp_desc(pTHX_ SV *const a, SV *const b);
+ #define PERL_ARGS_ASSERT_AMAGIC_I_NCMP_DESC	\
+ 	assert(a); assert(b)
+ #endif
+ 
+ #ifndef PERL_NO_INLINE_FUNCTIONS
+-PERL_STATIC_FORCE_INLINE I32	S_amagic_ncmp(pTHX_ SV *const a, SV *const b)
+-			__attribute__always_inline__;
++PERL_STATIC_FORCE_INLINE I32	S_amagic_ncmp(pTHX_ SV *const a, SV *const b);
+ #define PERL_ARGS_ASSERT_AMAGIC_NCMP	\
+ 	assert(a); assert(b)
+ #endif
+ 
+ #ifndef PERL_NO_INLINE_FUNCTIONS
+-PERL_STATIC_FORCE_INLINE I32	S_amagic_ncmp_desc(pTHX_ SV *const a, SV *const b)
+-			__attribute__always_inline__;
++PERL_STATIC_FORCE_INLINE I32	S_amagic_ncmp_desc(pTHX_ SV *const a, SV *const b);
+ #define PERL_ARGS_ASSERT_AMAGIC_NCMP_DESC	\
+ 	assert(a); assert(b)
+ #endif
+ 
+ #ifndef PERL_NO_INLINE_FUNCTIONS
+-PERL_STATIC_FORCE_INLINE I32	S_cmp_desc(pTHX_ SV *const str1, SV *const str2)
+-			__attribute__always_inline__;
++PERL_STATIC_FORCE_INLINE I32	S_cmp_desc(pTHX_ SV *const str1, SV *const str2);
+ #define PERL_ARGS_ASSERT_CMP_DESC	\
+ 	assert(str1); assert(str2)
+ #endif
+@@ -5671,51 +5664,44 @@ PERL_STATIC_FORCE_INLINE void	S_sortsv_flags_impl(pTHX_ SV** array, size_t num_e
+ #endif
+ 
+ #ifndef PERL_NO_INLINE_FUNCTIONS
+-PERL_STATIC_FORCE_INLINE I32	S_sv_i_ncmp(pTHX_ SV *const a, SV *const b)
+-			__attribute__always_inline__;
++PERL_STATIC_FORCE_INLINE I32	S_sv_i_ncmp(pTHX_ SV *const a, SV *const b);
+ #define PERL_ARGS_ASSERT_SV_I_NCMP	\
+ 	assert(a); assert(b)
+ #endif
+ 
+ #ifndef PERL_NO_INLINE_FUNCTIONS
+-PERL_STATIC_FORCE_INLINE I32	S_sv_i_ncmp_desc(pTHX_ SV *const a, SV *const b)
+-			__attribute__always_inline__;
++PERL_STATIC_FORCE_INLINE I32	S_sv_i_ncmp_desc(pTHX_ SV *const a, SV *const b);
+ #define PERL_ARGS_ASSERT_SV_I_NCMP_DESC	\
+ 	assert(a); assert(b)
+ #endif
+ 
+ #ifndef PERL_NO_INLINE_FUNCTIONS
+-PERL_STATIC_FORCE_INLINE I32	S_sv_ncmp(pTHX_ SV *const a, SV *const b)
+-			__attribute__always_inline__;
++PERL_STATIC_FORCE_INLINE I32	S_sv_ncmp(pTHX_ SV *const a, SV *const b);
+ #define PERL_ARGS_ASSERT_SV_NCMP	\
+ 	assert(a); assert(b)
+ #endif
+ 
+ #ifndef PERL_NO_INLINE_FUNCTIONS
+-PERL_STATIC_FORCE_INLINE I32	S_sv_ncmp_desc(pTHX_ SV *const a, SV *const b)
+-			__attribute__always_inline__;
++PERL_STATIC_FORCE_INLINE I32	S_sv_ncmp_desc(pTHX_ SV *const a, SV *const b);
+ #define PERL_ARGS_ASSERT_SV_NCMP_DESC	\
+ 	assert(a); assert(b)
+ #endif
+ 
+ #  if defined(USE_LOCALE_COLLATE)
+ #ifndef PERL_NO_INLINE_FUNCTIONS
+-PERL_STATIC_FORCE_INLINE I32	S_amagic_cmp_locale(pTHX_ SV *const str1, SV *const str2)
+-			__attribute__always_inline__;
++PERL_STATIC_FORCE_INLINE I32	S_amagic_cmp_locale(pTHX_ SV *const str1, SV *const str2);
+ #define PERL_ARGS_ASSERT_AMAGIC_CMP_LOCALE	\
+ 	assert(str1); assert(str2)
+ #endif
+ 
+ #ifndef PERL_NO_INLINE_FUNCTIONS
+-PERL_STATIC_FORCE_INLINE I32	S_amagic_cmp_locale_desc(pTHX_ SV *const str1, SV *const str2)
+-			__attribute__always_inline__;
++PERL_STATIC_FORCE_INLINE I32	S_amagic_cmp_locale_desc(pTHX_ SV *const str1, SV *const str2);
+ #define PERL_ARGS_ASSERT_AMAGIC_CMP_LOCALE_DESC	\
+ 	assert(str1); assert(str2)
+ #endif
+ 
+ #ifndef PERL_NO_INLINE_FUNCTIONS
+-PERL_STATIC_FORCE_INLINE I32	S_cmp_locale_desc(pTHX_ SV *const str1, SV *const str2)
+-			__attribute__always_inline__;
++PERL_STATIC_FORCE_INLINE I32	S_cmp_locale_desc(pTHX_ SV *const str1, SV *const str2);
+ #define PERL_ARGS_ASSERT_CMP_LOCALE_DESC	\
+ 	assert(str1); assert(str2)
+ #endif
+-- 
+2.25.1
+
diff --git a/meta/recipes-devtools/perl/perl_5.34.1.bb b/meta/recipes-devtools/perl/perl_5.34.1.bb
index 0e9d0c032e..4b9d2e2c50 100644
--- a/meta/recipes-devtools/perl/perl_5.34.1.bb
+++ b/meta/recipes-devtools/perl/perl_5.34.1.bb
@@ -17,6 +17,7 @@ SRC_URI = "https://www.cpan.org/src/5.0/perl-${PV}.tar.gz;name=perl \
            file://0002-Constant-Fix-up-shebang.patch \
            file://determinism.patch \
            file://0001-cpan-Sys-Syslog-Makefile.PL-Fix-_PATH_LOG-for-determ.patch \
+           file://0001-Fix-build-with-gcc-12.patch \
            "
 SRC_URI:append:class-native = " \
            file://perl-configpm-switch.patch \
-- 
2.25.1


