Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BECD8D1F9AD
	for <webhook@archiver.kernel.org>; Tue, 15 Oct 2024 18:51:10 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web10.4735.1729018270477117974
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Oct 2024 11:51:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=Fr/kAm5B;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.181, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-71e5a62031aso2007767b3a.1
        for <openembedded-core@lists.openembedded.org>; Tue, 15 Oct 2024 11:51:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1729018270; x=1729623070; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AupKjxbYm6hkFrV/vYdoHnnGKoHUG78Uspot3OSMjZs=;
        b=Fr/kAm5BbrXn2dZe2SdvpQaonLIKAYu+h9zkg57Sokp2zZ6KtrcV1oD5cI8E/VGnve
         S15zSSQuk1D/uZBmI39/qCGmew+EULXZjCTE0dO8bTIupJvU2q5WMA69MbUcN/MFjR3W
         mYJPr3UTiV1hLaSsR8PeJnDtF0TTFycDuPY5U9mRbka3G9YMpTLMq822gPzW0VZTnVa6
         Vz9ypcYByuZJ1fEeTa4LI42U4NsnB5lgz/B2zxZWeX121RIzXoDzz4w+t/6KwAofzt9O
         i36DHtaqrY13OTffoQLcD1hqt9PNMzwEP+MbXPzP+WgRfOsVa/ve+wBdJIJO86GNvPYc
         TSfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729018270; x=1729623070;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AupKjxbYm6hkFrV/vYdoHnnGKoHUG78Uspot3OSMjZs=;
        b=MXDoMC2uZsz70sGrAFPo1gnKn3Ak3UgYyBXz4DPYY5787pdFAZROyy5HSPqWnvAUhi
         cgVLHguFVGnF+IosoPIIhpqNVub24pmJr1jkWxxS4XMVNZs0A7C+oUAN1qm2Kge/ycFM
         z5fmw+jFv71NDFOZEbaGTSSCMeObypS8s+v8V2+1Jj423ifgui6Yj/G8ShFvwQfWpxOR
         yFgGed+BBMpHFdkQHofmmj3a2wM3jhSmd82rccoEcosqxbk5yLOAfd/6mFZ3L68VVxLn
         l4R9Gjdq7QBt8NbmDTix500k9a66C5HguK/wZN/ct8+AhfM4AkbOuF6/uKIoqpLMoq0W
         hJxw==
X-Gm-Message-State: AOJu0YzrClSVwf+8HYth6UZXom4T9ChOwdN61mzkIrxv86Hrn3qKWOw6
	gcS48lHhtZbURrdS779n6M2l7HAkz8H/Q8v44rJ3tfMGDMvCznwXcVD3WXl0kCMLeIeuECqWdqu
	Y
X-Google-Smtp-Source: AGHT+IEorpPnWHBQAAz0KqbOkz2k4VzniQEprLdz+xnfCbmFExUb524Z50k27H5v6I+190lOsIVeKA==
X-Received: by 2002:a05:6a20:d487:b0:1d9:553:8a2f with SMTP id adf61e73a8af0-1d905538b87mr1956129637.21.1729018269431;
        Tue, 15 Oct 2024 11:51:09 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71e773717b9sm1616187b3a.9.2024.10.15.11.51.08
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Oct 2024 11:51:09 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 05/18] ruby: upgrade 3.2.2 -> 3.3.5
Date: Tue, 15 Oct 2024 11:50:41 -0700
Message-Id: <69ffe5bc09260918fb32bfcb29586dcaa1958a5c.1729018153.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1729018153.git.steve@sakoman.com>
References: <cover.1729018153.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Oct 2024 18:51:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205928

From: Yogita Urade <yogita.urade@windriver.com>

Includes fix for CVE-2024-41123 & CVE-2024-41946

Release notes:
https://github.com/ruby/ruby/releases/tag/v3_3_5

Rebase:
0005-Mark-Gemspec-reproducible-change-fixing-784225-too.patch
0006-Make-gemspecs-reproducible.patch

Drop:
0001-fiddle-Use-C11-_Alignof-to-define-ALIGN_OF-when-poss.patch
0002-Obey-LDFLAGS-for-the-link-of-libruby.patch
CVE-2023-36617_1.patch
CVE-2023-36617_2.patch
CVE-2024-27281.patch
CVE-2024-27282.patch
(merged upstream)

0001-template-Makefile.in-do-not-write-host-cross-cc-item.patch
0002-template-Makefile.in-filter-out-f-prefix-map.patch
remove_has_include_macros.patch
(code rewritten upstream)

License-Update: Updated LEGAL section

Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...Alignof-to-define-ALIGN_OF-when-poss.patch | 52 ----------
 ...e.in-do-not-write-host-cross-cc-item.patch | 32 ------
 ...Obey-LDFLAGS-for-the-link-of-libruby.patch | 25 -----
 ...-Makefile.in-filter-out-f-prefix-map.patch | 42 --------
 ...eproducible-change-fixing-784225-too.patch | 26 ++---
 .../0006-Make-gemspecs-reproducible.patch     | 18 ++--
 .../ruby/ruby/CVE-2023-36617_1.patch          | 56 -----------
 .../ruby/ruby/CVE-2023-36617_2.patch          | 52 ----------
 .../ruby/ruby/CVE-2024-27281.patch            | 97 -------------------
 .../ruby/ruby/CVE-2024-27282.patch            | 28 ------
 .../ruby/ruby/remove_has_include_macros.patch | 35 -------
 .../ruby/{ruby_3.2.2.bb => ruby_3.3.5.bb}     | 13 +--
 12 files changed, 25 insertions(+), 451 deletions(-)
 delete mode 100644 meta/recipes-devtools/ruby/ruby/0001-fiddle-Use-C11-_Alignof-to-define-ALIGN_OF-when-poss.patch
 delete mode 100644 meta/recipes-devtools/ruby/ruby/0001-template-Makefile.in-do-not-write-host-cross-cc-item.patch
 delete mode 100644 meta/recipes-devtools/ruby/ruby/0002-Obey-LDFLAGS-for-the-link-of-libruby.patch
 delete mode 100644 meta/recipes-devtools/ruby/ruby/0002-template-Makefile.in-filter-out-f-prefix-map.patch
 delete mode 100644 meta/recipes-devtools/ruby/ruby/CVE-2023-36617_1.patch
 delete mode 100644 meta/recipes-devtools/ruby/ruby/CVE-2023-36617_2.patch
 delete mode 100644 meta/recipes-devtools/ruby/ruby/CVE-2024-27281.patch
 delete mode 100644 meta/recipes-devtools/ruby/ruby/CVE-2024-27282.patch
 delete mode 100644 meta/recipes-devtools/ruby/ruby/remove_has_include_macros.patch
 rename meta/recipes-devtools/ruby/{ruby_3.2.2.bb => ruby_3.3.5.bb} (88%)

diff --git a/meta/recipes-devtools/ruby/ruby/0001-fiddle-Use-C11-_Alignof-to-define-ALIGN_OF-when-poss.patch b/meta/recipes-devtools/ruby/ruby/0001-fiddle-Use-C11-_Alignof-to-define-ALIGN_OF-when-poss.patch
deleted file mode 100644
index 1dff9c0f8c..0000000000
--- a/meta/recipes-devtools/ruby/ruby/0001-fiddle-Use-C11-_Alignof-to-define-ALIGN_OF-when-poss.patch
+++ /dev/null
@@ -1,52 +0,0 @@
-From 6b3c202b46b9312c5bb0789145f13d8086e70948 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sun, 15 Jan 2023 02:34:17 -0800
-Subject: [PATCH] fiddle: Use C11 _Alignof to define ALIGN_OF when possible
-
-WG14 N2350 made very clear that it is an UB having type definitions
-within "offsetof" [1]. This patch enhances the implementation of macro
-ALIGN_OF to use builtin "_Alignof" to avoid undefined behavior
-when using std=c11 or newer
-
-clang 16+ has started to flag this [2]
-
-Fixes build when using -std >= gnu11 and using clang16+
-
-Older compilers gcc < 4.9 or clang < 8 has buggy _Alignof even though it
-may support C11, exclude those compiler versions
-
-[1] https://www.open-std.org/jtc1/sc22/wg14/www/docs/n2350.htm
-[2] https://reviews.llvm.org/D133574
-
-Upstream-Status: Submitted [https://github.com/ruby/fiddle/pull/120]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- ext/fiddle/fiddle.h | 12 +++++++++++-
- 1 file changed, 11 insertions(+), 1 deletion(-)
-
-diff --git a/ext/fiddle/fiddle.h b/ext/fiddle/fiddle.h
-index 10eb9ce..ffb395e 100644
---- a/ext/fiddle/fiddle.h
-+++ b/ext/fiddle/fiddle.h
-@@ -196,7 +196,17 @@
- #endif
- #define TYPE_UINTPTR_T (-TYPE_INTPTR_T)
- 
--#define ALIGN_OF(type) offsetof(struct {char align_c; type align_x;}, align_x)
-+/* GCC releases before GCC 4.9 had a bug in _Alignof.  See GCC bug 52023
-+   <https://gcc.gnu.org/bugzilla/show_bug.cgi?id=52023>.
-+   clang versions < 8.0.0 have the same bug.  */
-+#if (!defined __STDC_VERSION__ || __STDC_VERSION__ < 201112 \
-+     || (defined __GNUC__ && __GNUC__ < 4 + (__GNUC_MINOR__ < 9) \
-+         && !defined __clang__) \
-+     || (defined __clang__ && __clang_major__ < 8))
-+# define ALIGN_OF(type) offsetof(struct {char align_c; type align_x;}, align_x)
-+#else
-+# define ALIGN_OF(type) _Alignof(type)
-+#endif
- 
- #define ALIGN_VOIDP  ALIGN_OF(void*)
- #define ALIGN_CHAR   ALIGN_OF(char)
--- 
-2.39.0
-
diff --git a/meta/recipes-devtools/ruby/ruby/0001-template-Makefile.in-do-not-write-host-cross-cc-item.patch b/meta/recipes-devtools/ruby/ruby/0001-template-Makefile.in-do-not-write-host-cross-cc-item.patch
deleted file mode 100644
index 226ef3af75..0000000000
--- a/meta/recipes-devtools/ruby/ruby/0001-template-Makefile.in-do-not-write-host-cross-cc-item.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 2368d07660a93a2c41d63f3ab6054ca4daeef820 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Tue, 17 Nov 2020 18:31:40 +0000
-Subject: [PATCH] template/Makefile.in: do not write host cross-cc items into
- target config
-
-This helps reproducibility.
-
-Upstream-Status: Inappropriate [oe-core specific]
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- template/Makefile.in | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/template/Makefile.in b/template/Makefile.in
-index 10dc826..940ee07 100644
---- a/template/Makefile.in
-+++ b/template/Makefile.in
-@@ -657,11 +657,11 @@ mjit_config.h:
- 	echo '#endif'; \
- 	quote MJIT_MIN_HEADER_NAME "$(MJIT_MIN_HEADER_NAME)"; \
- 	sep=,; \
--	quote "MJIT_CC_COMMON  " $(MJIT_CC); \
-+	quote "MJIT_CC_COMMON  " ; \
- 	quote "MJIT_CFLAGS      MJIT_ARCHFLAG" $(MJIT_CFLAGS); \
- 	quote "MJIT_OPTFLAGS   " $(MJIT_OPTFLAGS); \
- 	quote "MJIT_DEBUGFLAGS " $(MJIT_DEBUGFLAGS); \
--	quote "MJIT_LDSHARED   " $(MJIT_LDSHARED); \
-+	quote "MJIT_LDSHARED   " ; \
- 	quote "MJIT_DLDFLAGS    MJIT_ARCHFLAG" $(MJIT_DLDFLAGS); \
- 	quote "MJIT_LIBS       " $(LIBRUBYARG_SHARED); \
- 	quote 'PRELOADENV       "@PRELOADENV@"'; \
diff --git a/meta/recipes-devtools/ruby/ruby/0002-Obey-LDFLAGS-for-the-link-of-libruby.patch b/meta/recipes-devtools/ruby/ruby/0002-Obey-LDFLAGS-for-the-link-of-libruby.patch
deleted file mode 100644
index 96ae86263b..0000000000
--- a/meta/recipes-devtools/ruby/ruby/0002-Obey-LDFLAGS-for-the-link-of-libruby.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-From 21d8e7700fa0a9c4bf569dd366134060ae858832 Mon Sep 17 00:00:00 2001
-From: Christopher Larson <chris_larson@mentor.com>
-Date: Thu, 5 May 2016 10:59:07 -0700
-Subject: [PATCH] Obey LDFLAGS for the link of libruby
-
-Signed-off-by: Christopher Larson <chris_larson@mentor.com>
-Upstream-Status: Pending
-
----
- template/Makefile.in | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/template/Makefile.in b/template/Makefile.in
-index 1456313..15b98a4 100644
---- a/template/Makefile.in
-+++ b/template/Makefile.in
-@@ -127,7 +127,7 @@ ENABLE_SHARED = @ENABLE_SHARED@
- LDSHARED = @LIBRUBY_LDSHARED@
- DLDSHARED = @DLDSHARED@
- XDLDFLAGS = @DLDFLAGS@
--DLDFLAGS = @LIBRUBY_DLDFLAGS@ $(XLDFLAGS) $(ARCH_FLAG)
-+DLDFLAGS = @LIBRUBY_DLDFLAGS@ @LDFLAGS@ $(XLDFLAGS) $(ARCH_FLAG)
- SOLIBS = @SOLIBS@
- ENABLE_DEBUG_ENV = @ENABLE_DEBUG_ENV@
- MAINLIBS = $(YJIT_LIBS) @MAINLIBS@
diff --git a/meta/recipes-devtools/ruby/ruby/0002-template-Makefile.in-filter-out-f-prefix-map.patch b/meta/recipes-devtools/ruby/ruby/0002-template-Makefile.in-filter-out-f-prefix-map.patch
deleted file mode 100644
index 2efbad7513..0000000000
--- a/meta/recipes-devtools/ruby/ruby/0002-template-Makefile.in-filter-out-f-prefix-map.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-Subject: [PATCH] template/Makefile.in: filter out -f*prefix-map
-
-If we add DEBUG_PREFIX_MAP into LDFLAGS, ruby and ruby-dbg are no longer
-reproducible.  Fix this.
-
-Upstream-Status: Inappropriate [oe-core specific]
-Signed-off-by: Tony Battersby <tonyb@cybernetics.com>
----
---- a/tool/mjit_archflag.sh
-+++ b/tool/mjit_archflag.sh
-@@ -7,6 +7,20 @@ quote() {
-     echo
- }
- 
-+quote_filtered() {
-+    printf "#${indent}define $1"
-+    while shift && [ "$#" -gt 0 ]; do
-+	case "$1" in
-+	    -ffile-prefix-map=*|-fdebug-prefix-map=*|-fmacro-prefix-map=*)
-+		;;
-+	    *)
-+		printf ' "%s"'$sep "$1"
-+		;;
-+	esac
-+    done
-+    echo
-+}
-+
- archs=""
- arch_flag=""
- 
---- a/template/Makefile.in
-+++ b/template/Makefile.in
-@@ -666,7 +666,7 @@ mjit_config.h:
- 	quote "MJIT_OPTFLAGS   " $(MJIT_OPTFLAGS); \
- 	quote "MJIT_DEBUGFLAGS " $(MJIT_DEBUGFLAGS); \
- 	quote "MJIT_LDSHARED   " ; \
--	quote "MJIT_DLDFLAGS    MJIT_ARCHFLAG" $(MJIT_DLDFLAGS); \
-+	quote_filtered "MJIT_DLDFLAGS    MJIT_ARCHFLAG" $(MJIT_DLDFLAGS); \
- 	quote "MJIT_LIBS       " $(LIBRUBYARG_SHARED); \
- 	quote 'PRELOADENV       "@PRELOADENV@"'; \
- 	indent=$${archs:+'  '}; \
diff --git a/meta/recipes-devtools/ruby/ruby/0005-Mark-Gemspec-reproducible-change-fixing-784225-too.patch b/meta/recipes-devtools/ruby/ruby/0005-Mark-Gemspec-reproducible-change-fixing-784225-too.patch
index 41f206523e..0902a201ec 100644
--- a/meta/recipes-devtools/ruby/ruby/0005-Mark-Gemspec-reproducible-change-fixing-784225-too.patch
+++ b/meta/recipes-devtools/ruby/ruby/0005-Mark-Gemspec-reproducible-change-fixing-784225-too.patch
@@ -12,20 +12,20 @@ Upstream-Status: Backport [debian]
  1 file changed, 3 insertions(+), 1 deletion(-)
 
 diff --git a/lib/rubygems/specification.rb b/lib/rubygems/specification.rb
-index 0d72cee..eb7bc25 100644
+index d6eac7f..4b2e95e 100644
 --- a/lib/rubygems/specification.rb
 +++ b/lib/rubygems/specification.rb
-@@ -1691,7 +1691,9 @@ class Gem::Specification < Gem::BasicSpecification
-         raise(Gem::InvalidSpecificationException,
-               "invalid date format in specification: #{date.inspect}")
-       end
--    when Time, DateLike then
-+    when Time then
-+      Time.utc(date.utc.year, date.utc.month, date.utc.day)
-+    when DateLike then
-       Time.utc(date.year, date.month, date.day)
-     else
-       TODAY
+@@ -1707,7 +1707,9 @@ class Gem::Specification < Gem::BasicSpecification
+                 raise(Gem::InvalidSpecificationException,
+                       "invalid date format in specification: #{date.inspect}")
+               end
+-            when Time, DateLike then
++            when Time then
++              Time.utc(date.utc.year, date.utc.month, date.utc.day)
++            when DateLike then
+               Time.utc(date.year, date.month, date.day)
+             else
+               TODAY
 -- 
-2.25.1
+2.40.0
 
diff --git a/meta/recipes-devtools/ruby/ruby/0006-Make-gemspecs-reproducible.patch b/meta/recipes-devtools/ruby/ruby/0006-Make-gemspecs-reproducible.patch
index 0a87cae17f..d32e209129 100644
--- a/meta/recipes-devtools/ruby/ruby/0006-Make-gemspecs-reproducible.patch
+++ b/meta/recipes-devtools/ruby/ruby/0006-Make-gemspecs-reproducible.patch
@@ -7,7 +7,6 @@ Without an explicit date, they will get the current date and make the
 build unreproducible
 
 Upstream-Status: Backport [debian]
-
 ---
  ext/bigdecimal/bigdecimal.gemspec | 1 +
  ext/fiddle/fiddle.gemspec         | 1 +
@@ -17,12 +16,12 @@ Upstream-Status: Backport [debian]
  5 files changed, 5 insertions(+)
 
 diff --git a/ext/bigdecimal/bigdecimal.gemspec b/ext/bigdecimal/bigdecimal.gemspec
-index d215757..5148d56 100644
+index f9f3b45..b9a469d 100644
 --- a/ext/bigdecimal/bigdecimal.gemspec
 +++ b/ext/bigdecimal/bigdecimal.gemspec
-@@ -4,6 +4,7 @@ Gem::Specification.new do |s|
-   s.name          = "bigdecimal"
-   s.version       = "3.1.3"
+@@ -14,6 +14,7 @@ Gem::Specification.new do |s|
+   s.name          = name
+   s.version       = source_version
    s.authors       = ["Kenta Murata", "Zachary Scott", "Shigeo Kobayashi"]
 +  s.date          = RUBY_RELEASE_DATE
    s.email         = ["mrkn@mrkn.jp"]
@@ -41,10 +40,10 @@ index 8781093..efdca32 100644
    spec.email         = ["aaron@tenderlovemaking.com", "hsbt@ruby-lang.org"]
  
 diff --git a/ext/io/console/io-console.gemspec b/ext/io/console/io-console.gemspec
-index d26a757..cc88c55 100644
+index d4f5276..8f89611 100644
 --- a/ext/io/console/io-console.gemspec
 +++ b/ext/io/console/io-console.gemspec
-@@ -4,6 +4,7 @@ _VERSION = "0.6.0"
+@@ -4,6 +4,7 @@ _VERSION = "0.7.1"
  Gem::Specification.new do |s|
    s.name = "io-console"
    s.version = _VERSION
@@ -65,7 +64,7 @@ index 1f4798e..48743cf 100644
    spec.email         = ["knu@idaemons.org", "ume@mahoroba.org"]
  
 diff --git a/lib/rdoc/rdoc.gemspec b/lib/rdoc/rdoc.gemspec
-index 3c96f7d..fec0872 100644
+index 93a281c..cc5c155 100644
 --- a/lib/rdoc/rdoc.gemspec
 +++ b/lib/rdoc/rdoc.gemspec
 @@ -7,6 +7,7 @@ end
@@ -76,3 +75,6 @@ index 3c96f7d..fec0872 100644
    s.version = RDoc::VERSION
  
    s.authors = [
+-- 
+2.40.0
+
diff --git a/meta/recipes-devtools/ruby/ruby/CVE-2023-36617_1.patch b/meta/recipes-devtools/ruby/ruby/CVE-2023-36617_1.patch
deleted file mode 100644
index 17c7e30176..0000000000
--- a/meta/recipes-devtools/ruby/ruby/CVE-2023-36617_1.patch
+++ /dev/null
@@ -1,56 +0,0 @@
-From 2ebb50d2dc302917a6f57c1239dc9e700dfe0e34 Mon Sep 17 00:00:00 2001
-From: Nobuyoshi Nakada <nobu@ruby-lang.org>
-Date: Thu, 27 Jul 2023 15:53:01 +0800
-Subject: [PATCH] Fix quadratic backtracking on invalid relative URI
-
-https://hackerone.com/reports/1958260
-
-CVE: CVE-2023-36617
-
-Upstream-Status: Backport [https://github.com/ruby/uri/commit/9010ee2536adda10a0555ae1ed6fe2f5808e6bf1]
-
-Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
----
- lib/uri/rfc2396_parser.rb |  4 ++--
- test/uri/test_parser.rb   | 12 ++++++++++++
- 2 files changed, 14 insertions(+), 2 deletions(-)
-
-diff --git a/lib/uri/rfc2396_parser.rb b/lib/uri/rfc2396_parser.rb
-index 76a8f99..00c66cf 100644
---- a/lib/uri/rfc2396_parser.rb
-+++ b/lib/uri/rfc2396_parser.rb
-@@ -497,8 +497,8 @@ module URI
-       ret = {}
- 
-       # for URI::split
--      ret[:ABS_URI] = Regexp.new('\A\s*' + pattern[:X_ABS_URI] + '\s*\z', Regexp::EXTENDED)
--      ret[:REL_URI] = Regexp.new('\A\s*' + pattern[:X_REL_URI] + '\s*\z', Regexp::EXTENDED)
-+      ret[:ABS_URI] = Regexp.new('\A\s*+' + pattern[:X_ABS_URI] + '\s*\z', Regexp::EXTENDED)
-+      ret[:REL_URI] = Regexp.new('\A\s*+' + pattern[:X_REL_URI] + '\s*\z', Regexp::EXTENDED)
- 
-       # for URI::extract
-       ret[:URI_REF]     = Regexp.new(pattern[:URI_REF])
-diff --git a/test/uri/test_parser.rb b/test/uri/test_parser.rb
-index 72fb590..721e05e 100644
---- a/test/uri/test_parser.rb
-+++ b/test/uri/test_parser.rb
-@@ -79,4 +79,16 @@ class URI::TestParser < Test::Unit::TestCase
-     assert_equal([nil, nil, "example.com", nil, nil, "", nil, nil, nil], URI.split("//example.com"))
-     assert_equal([nil, nil, "[0::0]", nil, nil, "", nil, nil, nil], URI.split("//[0::0]"))
-   end
-+
-+  def test_rfc2822_parse_relative_uri
-+    pre = ->(length) {
-+      " " * length + "\0"
-+    }
-+    parser = URI::RFC2396_Parser.new
-+    assert_linear_performance((1..5).map {|i| 10**i}, pre: pre) do |uri|
-+      assert_raise(URI::InvalidURIError) do
-+        parser.split(uri)
-+      end
-+    end
-+  end
- end
--- 
-2.25.1
-
diff --git a/meta/recipes-devtools/ruby/ruby/CVE-2023-36617_2.patch b/meta/recipes-devtools/ruby/ruby/CVE-2023-36617_2.patch
deleted file mode 100644
index 7c51deaa42..0000000000
--- a/meta/recipes-devtools/ruby/ruby/CVE-2023-36617_2.patch
+++ /dev/null
@@ -1,52 +0,0 @@
-From eea5868120509c245216c4b5c2d4b5db1c593d0e Mon Sep 17 00:00:00 2001
-From: Nobuyoshi Nakada <nobu@ruby-lang.org>
-Date: Thu, 27 Jul 2023 16:16:30 +0800
-Subject: [PATCH] Fix quadratic backtracking on invalid port number
-
-https://hackerone.com/reports/1958260
-
-CVE: CVE-2023-36617
-
-Upstream-Status: Backport [https://github.com/ruby/uri/commit/9d7bcef1e6ad23c9c6e4932f297fb737888144c8]
-
-Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
----
- lib/uri/rfc3986_parser.rb |  2 +-
- test/uri/test_parser.rb   | 10 ++++++++++
- 2 files changed, 11 insertions(+), 1 deletion(-)
-
-diff --git a/lib/uri/rfc3986_parser.rb b/lib/uri/rfc3986_parser.rb
-index dd24a40..9b1663d 100644
---- a/lib/uri/rfc3986_parser.rb
-+++ b/lib/uri/rfc3986_parser.rb
-@@ -100,7 +100,7 @@ module URI
-         QUERY: /\A(?:%\h\h|[!$&-.0-;=@-Z_a-z~\/?])*\z/,
-         FRAGMENT: /\A(?:%\h\h|[!$&-.0-;=@-Z_a-z~\/?])*\z/,
-         OPAQUE: /\A(?:[^\/].*)?\z/,
--        PORT: /\A[\x09\x0a\x0c\x0d ]*\d*[\x09\x0a\x0c\x0d ]*\z/,
-+        PORT: /\A[\x09\x0a\x0c\x0d ]*+\d*[\x09\x0a\x0c\x0d ]*\z/,
-       }
-     end
- 
-diff --git a/test/uri/test_parser.rb b/test/uri/test_parser.rb
-index 721e05e..cee0acb 100644
---- a/test/uri/test_parser.rb
-+++ b/test/uri/test_parser.rb
-@@ -91,4 +91,14 @@ class URI::TestParser < Test::Unit::TestCase
-       end
-     end
-   end
-+
-+  def test_rfc3986_port_check
-+    pre = ->(length) {"\t" * length + "a"}
-+    uri = URI.parse("http://my.example.com")
-+    assert_linear_performance((1..5).map {|i| 10**i}, pre: pre) do |port|
-+      assert_raise(URI::InvalidComponentError) do
-+        uri.port = port
-+      end
-+    end
-+  end
- end
--- 
-2.25.1
-
diff --git a/meta/recipes-devtools/ruby/ruby/CVE-2024-27281.patch b/meta/recipes-devtools/ruby/ruby/CVE-2024-27281.patch
deleted file mode 100644
index f69f3bcf4f..0000000000
--- a/meta/recipes-devtools/ruby/ruby/CVE-2024-27281.patch
+++ /dev/null
@@ -1,97 +0,0 @@
-From da7a0c7553ef7250ca665a3fecdc01dbaacbb43d Mon Sep 17 00:00:00 2001
-From: Nobuyoshi Nakada <nobu@...>
-Date: Mon, 15 Apr 2024 11:40:00 +0000
-Subject: [PATCH] Filter marshaled objets
-
-CVE: CVE-2024-27281
-Upstream-Status: Backport [https://github.com/ruby/rdoc/commit/da7a0c7553ef7250ca665a3fecdc01dbaacbb43d]
-Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
----
- lib/rdoc/store.rb | 45 ++++++++++++++++++++++++++-------------------
- 1 file changed, 26 insertions(+), 19 deletions(-)
-
-diff --git a/lib/rdoc/store.rb b/lib/rdoc/store.rb
-index 9fc540d..5b663d7 100644
---- a/lib/rdoc/store.rb
-+++ b/lib/rdoc/store.rb
-@@ -556,9 +556,7 @@ class RDoc::Store
-   def load_cache
-     #orig_enc = @encoding
- 
--    File.open cache_path, 'rb' do |io|
--      @cache = Marshal.load io
--    end
-+    @cache = marshal_load(cache_path)
- 
-     load_enc = @cache[:encoding]
- 
-@@ -615,9 +613,7 @@ class RDoc::Store
-   def load_class_data klass_name
-     file = class_file klass_name
- 
--    File.open file, 'rb' do |io|
--      Marshal.load io
--    end
-+    marshal_load(file)
-   rescue Errno::ENOENT => e
-     error = MissingFileError.new(self, file, klass_name)
-     error.set_backtrace e.backtrace
-@@ -630,14 +626,10 @@ class RDoc::Store
-   def load_method klass_name, method_name
-     file = method_file klass_name, method_name
- 
--    File.open file, 'rb' do |io|
--      obj = Marshal.load io
--      obj.store = self
--      obj.parent =
--        find_class_or_module(klass_name) || load_class(klass_name) unless
--          obj.parent
--      obj
--    end
-+    obj = marshal_load(file)
-+    obj.store = self
-+    obj.parent ||= find_class_or_module(klass_name) || load_class(klass_name)
-+    obj
-   rescue Errno::ENOENT => e
-     error = MissingFileError.new(self, file, klass_name + method_name)
-     error.set_backtrace e.backtrace
-@@ -650,11 +642,9 @@ class RDoc::Store
-   def load_page page_name
-     file = page_file page_name
- 
--    File.open file, 'rb' do |io|
--      obj = Marshal.load io
--      obj.store = self
--      obj
--    end
-+    obj = marshal_load(file)
-+    obj.store = self
-+    obj
-   rescue Errno::ENOENT => e
-     error = MissingFileError.new(self, file, page_name)
-     error.set_backtrace e.backtrace
-@@ -976,4 +966,21 @@ class RDoc::Store
-     @unique_modules
-   end
- 
-+  private
-+  def marshal_load(file)
-+    File.open(file, 'rb') {|io| Marshal.load(io, MarshalFilter)}
-+  end
-+
-+  MarshalFilter = proc do |obj|
-+    case obj
-+    when true, false, nil, Array, Class, Encoding, Hash, Integer, String, Symbol, RDoc::Text
-+    else
-+      unless obj.class.name.start_with("RDoc::")
-+        raise TypeError, "not permitted class: #{obj.class.name}"
-+      end
-+    end
-+    obj
-+  end
-+  private_constant :MarshalFilter
-+
- end
--- 
-2.25.1
-
diff --git a/meta/recipes-devtools/ruby/ruby/CVE-2024-27282.patch b/meta/recipes-devtools/ruby/ruby/CVE-2024-27282.patch
deleted file mode 100644
index dde7979278..0000000000
--- a/meta/recipes-devtools/ruby/ruby/CVE-2024-27282.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From 989a2355808a63fc45367785c82ffd46d18c900a Mon Sep 17 00:00:00 2001
-From: Hiroshi SHIBATA <hsbt@ruby-lang.org>
-Date: Fri, 12 Apr 2024 15:01:47 +1000
-Subject: [PATCH] Fix Use-After-Free issue for Regexp
-
-Co-authored-by: Isaac Peka <7493006+isaac-peka@users.noreply.github.com>
-
-Upstream-Status: Backport [https://github.com/ruby/ruby/commit/989a2355808a63fc45367785c82ffd46d18c900a]
-CVE: CVE-2024-27282
-Signed-off-by: Ashish Sharma <asharma@mvista.com>
-
- regexec.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/regexec.c b/regexec.c
-index 73694ab14a0b0a..140691ad42489f 100644
---- a/regexec.c
-+++ b/regexec.c
-@@ -3449,8 +3449,8 @@ match_at(regex_t* reg, const UChar* str, const UChar* end,
-     CASE(OP_MEMORY_END_PUSH_REC)  MOP_IN(OP_MEMORY_END_PUSH_REC);
-       GET_MEMNUM_INC(mem, p);
-       STACK_GET_MEM_START(mem, stkp); /* should be before push mem-end. */
--      STACK_PUSH_MEM_END(mem, s);
-       mem_start_stk[mem] = GET_STACK_INDEX(stkp);
-+      STACK_PUSH_MEM_END(mem, s);
-       MOP_OUT;
-       JUMP;
- 
diff --git a/meta/recipes-devtools/ruby/ruby/remove_has_include_macros.patch b/meta/recipes-devtools/ruby/ruby/remove_has_include_macros.patch
deleted file mode 100644
index b78e3db892..0000000000
--- a/meta/recipes-devtools/ruby/ruby/remove_has_include_macros.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From e74b57febec9bd806e29025e6eeb8091e7021d75 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sun, 26 Jan 2020 11:27:40 -0800
-Subject: [PATCH] Filter out __has_include* compiler defines
-
-They are internal to compiler and this header is later on includes in C
-files, but newer gcc >= 10 complains about it.
-
-error in initial header file:
-| In file included from /tmp/20200124-86625-14hiju4.c:1:
-| /tmp/20200124-86625-11y6l6i.h:13849:9: error: "__has_include" cannot be used as a macro name
-| 13849 | #define __has_include __has_include
-|       |         ^~~~~~~~~~~~~
-| compilation terminated due to -Wfatal-errors.
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
----
- common.mk | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/common.mk b/common.mk
-index 664f750..3b8fbe6 100644
---- a/common.mk
-+++ b/common.mk
-@@ -238,6 +238,8 @@ $(TIMESTAMPDIR)/$(MJIT_HEADER:.h=)$(MJIT_HEADER_SUFFIX).time: probes.h vm.$(OBJE
- 	$(ECHO) building $(@F:.time=.h)
- 	$(Q)$(MINIRUBY) $(tooldir)/mjit_tabs.rb "$(MJIT_TABS)" \
- 		$(CPP) -DMJIT_HEADER $(MJIT_HEADER_FLAGS) $(CFLAGS) $(XCFLAGS) $(CPPFLAGS) $(srcdir)/vm.c $(CPPOUTFLAG)$(@F:.time=.h).new
-+	$(Q)sed -i -e "/#define __has_include __has_include/d" $(@F:.time=.h).new
-+	$(Q)sed -i -e "/#define __has_include_next __has_include_next/d" $(@F:.time=.h).new
- 	$(Q) $(IFCHANGE) "--timestamp=$@" $(@F:.time=.h) $(@F:.time=.h).new
- 
- $(MJIT_HEADER:.h=)$(MJIT_HEADER_SUFFIX).h: $(TIMESTAMPDIR)/$(MJIT_HEADER:.h=)$(MJIT_HEADER_SUFFIX).time
diff --git a/meta/recipes-devtools/ruby/ruby_3.2.2.bb b/meta/recipes-devtools/ruby/ruby_3.3.5.bb
similarity index 88%
rename from meta/recipes-devtools/ruby/ruby_3.2.2.bb
rename to meta/recipes-devtools/ruby/ruby_3.3.5.bb
index 508154dad5..fb0d711765 100644
--- a/meta/recipes-devtools/ruby/ruby_3.2.2.bb
+++ b/meta/recipes-devtools/ruby/ruby_3.3.5.bb
@@ -10,7 +10,7 @@ LICENSE = "Ruby | BSD-2-Clause | BSD-3-Clause | GPL-2.0-only | ISC | MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=5b8c87559868796979806100db3f3805 \
                     file://BSDL;md5=8b50bc6de8f586dc66790ba11d064d75 \
                     file://GPL;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
-                    file://LEGAL;md5=bcd74b47bbaf2051c5e49811a5faa97a \
+                    file://LEGAL;md5=81e6a4d81533b9263da4c3485a0ad883 \
                     "
 
 DEPENDS = "zlib openssl libyaml gdbm readline libffi"
@@ -20,21 +20,12 @@ DEPENDS:append:class-nativesdk = " ruby-native"
 SHRT_VER = "${@oe.utils.trim_version("${PV}", 2)}"
 SRC_URI = "http://cache.ruby-lang.org/pub/ruby/${SHRT_VER}/ruby-${PV}.tar.gz \
            file://0001-extmk-fix-cross-compilation-of-external-gems.patch \
-           file://0002-Obey-LDFLAGS-for-the-link-of-libruby.patch \
-           file://remove_has_include_macros.patch \
            file://run-ptest \
-           file://0001-template-Makefile.in-do-not-write-host-cross-cc-item.patch \
-           file://0002-template-Makefile.in-filter-out-f-prefix-map.patch \
            file://0003-rdoc-build-reproducible-documentation.patch \
            file://0004-lib-mkmf.rb-sort-list-of-object-files-in-generated-M.patch \
            file://0005-Mark-Gemspec-reproducible-change-fixing-784225-too.patch \
            file://0006-Make-gemspecs-reproducible.patch \
            file://0001-vm_dump.c-Define-REG_S1-and-REG_S2-for-musl-riscv.patch \
-           file://0001-fiddle-Use-C11-_Alignof-to-define-ALIGN_OF-when-poss.patch \
-           file://CVE-2023-36617_1.patch \
-           file://CVE-2023-36617_2.patch \
-           file://CVE-2024-27281.patch \
-           file://CVE-2024-27282.patch \
            "
 UPSTREAM_CHECK_URI = "https://www.ruby-lang.org/en/downloads/"
 
@@ -55,7 +46,7 @@ do_configure:prepend() {
 
 DEPENDS:append:libc-musl = " libucontext"
 
-SRC_URI[sha256sum] = "96c57558871a6748de5bc9f274e93f4b5aad06cd8f37befa0e8d94e7b8a423bc"
+SRC_URI[sha256sum] = "3781a3504222c2f26cb4b9eb9c1a12dbf4944d366ce24a9ff8cf99ecbce75196"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG += "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"
-- 
2.34.1


