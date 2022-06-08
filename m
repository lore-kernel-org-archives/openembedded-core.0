Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38E5CCCA47F
	for <webhook@archiver.kernel.org>; Wed,  8 Jun 2022 14:40:39 +0000 (UTC)
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com
 [209.85.215.174])
 by mx.groups.io with SMTP id smtpd.web11.7241.1654699237963107941
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jun 2022 07:40:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=nf4GaRIL;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.174,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f174.google.com with SMTP id r71so19109228pgr.0
        for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jun 2022 07:40:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=rPVVTsLoivUJ1nfbHJM8XjX3k62CYLFhDv4Boj7jNng=;
        b=nf4GaRILMyVrKHhFrRD7KAI54k5sJh+9Bahexg8cJT0kpbxGn/YP+TofFjrC4mKsIV
         Ry3qylU1/9zkxNRlYGlWeEw7IqqbcDsWCp1jPPFzI+W81XfnUV7/3K182Bdgd7zhYc+i
         oqP/aaDLwQfZ4Hm8zI4U6PoIzt5B0sWO5j3dT+gxxnroFAp430yDaJz0Y86mbh0qsIMZ
         ESJYwhm+xFF0XOLiI9di3mUAkOwi1HBAQwA8e7X2jzOVisR/YGu3TecNiBXLNbuCb3+e
         8lQOxAsrFaZYtpbDUCtXjdF8qjCmISxHE/pZM3qJ7OMSZw53NS3GN3qGxh6zii0YW/FM
         DNzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rPVVTsLoivUJ1nfbHJM8XjX3k62CYLFhDv4Boj7jNng=;
        b=2H2dZTwdoRAHvzXBnlqUp1NY3sEs11mrmzF5/iwPGl+xc/d+pgQVAws+dlyVIgoo6w
         VAPAevIS9IejlezMLOeu83Bm5YOf3lWWX/nxoHomSHjO7FLJna6ZhLde/solSOs6x/ap
         VTKQBhzbnr4AidEbak5M+i1uxbLYy1zJQE8vOfD5HxeoYILc7ALRJPIhgRTT/VtUlRpo
         pFqWRhL+EbhqPYvvfnQ8hx7JfJILDxEeXISOdrWsu1QZmY47VSf7YW5LmjeMwlwylrb4
         p7dLkp1g8kb1CZBw44sEfR7Z29jfhlOLGWiBqle3j5jEGI8cOEh3mAQOdKZj0HuvJ20w
         W39Q==
X-Gm-Message-State: AOAM5334R80HtEwuz2IWogYlyxb+GHpOi9UBEqlvfmyOGzWwcBiE9gk4
	nQYOStAQ9iNbtCPvgr/Y3KdlFVVHp0lVkhn+
X-Google-Smtp-Source: 
 ABdhPJyTuJAIi4UbSivYIu+2mkNkTzb/iDcBBZzNpXp86J2dVTbKJYAdtJwqbkiB83el0S1S6rIoRA==
X-Received: by 2002:a05:6a00:248a:b0:51b:f461:8318 with SMTP id
 c10-20020a056a00248a00b0051bf4618318mr23147500pfv.47.1654699236828;
        Wed, 08 Jun 2022 07:40:36 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 i4-20020aa787c4000000b0051bc581b62asm12945213pfo.121.2022.06.08.07.40.35
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jun 2022 07:40:35 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 17/22] perl: Fix build with gcc-12
Date: Wed,  8 Jun 2022 04:39:30 -1000
Message-Id: 
 <4eb85dbace4d6d2cccdeed96b4aee80a8fc24e37.1654698895.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1654698895.git.steve@sakoman.com>
References: <cover.1654698895.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Jun 2022 14:40:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166728

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
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 880296e68cfd92cfd4c9474972c8d8e6f21a2a40)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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


