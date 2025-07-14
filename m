Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99D9AC83F1A
	for <webhook@archiver.kernel.org>; Mon, 14 Jul 2025 16:23:43 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web10.82445.1752510218147935001
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Jul 2025 09:23:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=WG6XbZvy;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.179, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-74924255af4so3715808b3a.1
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Jul 2025 09:23:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1752510217; x=1753115017; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Wev56A66v22erHGRd+HBnA9SImQIkhtum7Ba47hORfY=;
        b=WG6XbZvyHBO9K/pAvC0d7tITqfkJTWE0ZBHF7WE8/Z3JuTo809pkynQVFAb/zi/POW
         fY8r/qDIG+ZKMuF84fzdmMN1fS2x/POv+uwd0TsCSFFrVk45pu2K0xwIbXcngr3KNfds
         2S6AmIQUgfn3Iv60k9sN/w/zbMtk6FmcdDGaUTy4KBEu7EacXEtgcPwUqTU0Gjy2BmY/
         4Q1C+KpZHxAZ6PSyxqLMBokBgRr9nyGWCRk8KlMQ4hJK5LlVmLJvT9etWsacMC9cUnDR
         uLegtRpeA0gb4aCNf8+kbPgrcFLO7tYppjonOz+YyC74S8hO55rwE/cDO148z1DGwMUn
         Dgvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752510217; x=1753115017;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Wev56A66v22erHGRd+HBnA9SImQIkhtum7Ba47hORfY=;
        b=aMbNQ2ECemPDwdm4dYt8Yjtz/eXjAN1+9B/AwsuN2/Wx8zyaNxQEjvq12KNM3aw1f/
         64eAN67c+0nMHH0tgZsjo9iwNelzTwBV1envKm8LOrHHuIAiNNsUeJQ3cEPLObDWPaTE
         2jF4nll2ja5MO1bLuZeUJc8Ek+WXe8hMKEnShfDnz/STllrtkK7Pzsfbp5zKxQa1ijmK
         GDmxLEyV5XwM7PPdBqq2AsaYZDgHar2WYn3AQPg7ov+OoVT8mB+NEb/JfvVh+O1V4a14
         DyvjS2ys4LWzV2px0oP+B1PIPtzYb//O5XAD7jYEwbLiRfGaMwYOVN9Jh67pTyV3K+CS
         HhIA==
X-Gm-Message-State: AOJu0YyKjrrlqKG9gkzvL5Dgbi6g3apz1W5y+ai/7ccXTyeIoTxlsnyO
	RBifSzRLFpobxPewVa4N4k6llOqiqUwT23AkRf9EsL/3ZhkbfzVDseYxKcRwGNQknpDL2sI+xCQ
	RPC73
X-Gm-Gg: ASbGncteiFuoDU50WPz2KmiQZM3b/erUCfOyOmbnG+oEkRmv4bdhWyeTkRQNdppn3FJ
	U0weu7V5NPFXPPAMw+fh+CSX2ueC16F08v/BqKQaAx4ef7CmMxrCXsKbq5W2kxmUSB3nAuR9PQ9
	ScZ8mIyo8915g/3D8fQFuptJbxUfs83qUeDxPUpm/7yzAB5oCHz+DGi7vDFKZNIlDfr8GjUrIKO
	BaYC0p8Jp1PpU4Y17FBimNdf+vcyk2THj2FOyYoUdN4aoVDJ+AxMHCRq1Y8depfuFSp7D4s4NVT
	cLxSua4lR1OhUmiSuT9hKqcd08LrFWa1X+ouAG1VCCMyGCngv4fslwB53vgTq4bLHqgc7XtY/l0
	yaB9JdAsAC6z7m4VcSpRKiMI=
X-Google-Smtp-Source: AGHT+IHTf8viBAPQdYOpcQ9Azd9FBirzseVDPj4o7lQekYP/y4xurrBO1G/38zX3amT1gxqj2XaK2A==
X-Received: by 2002:aa7:8881:0:b0:740:9d7c:8f5c with SMTP id d2e1a72fcca58-74ee295b2d0mr19385931b3a.18.1752510217174;
        Mon, 14 Jul 2025 09:23:37 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:4aa7:6b72:b465:3a4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74eb9dd5e8fsm10456053b3a.29.2025.07.14.09.23.36
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jul 2025 09:23:36 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar 13/15] ruby: upgrade 3.4.3 -> 3.4.4
Date: Mon, 14 Jul 2025 09:23:07 -0700
Message-ID: <76ee6464bf82b5eed525f6cd83132cc8c22a94a8.1752509862.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1752509862.git.steve@sakoman.com>
References: <cover.1752509862.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Jul 2025 16:23:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220251

From: Wang Mingyu <wangmy@fujitsu.com>

0002-Obey-LDFLAGS-for-the-link-of-libruby.patch
0005-Mark-Gemspec-reproducible-change-fixing-784225-too.patch
refreshed for 3.4.4

(From OE-Core rev: 33d75adff3c100d4c16a9dc51dd19f48e20cf328)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Divya Chellam <divya.chellam@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../ruby/0002-Obey-LDFLAGS-for-the-link-of-libruby.patch    | 6 +++---
 ...Mark-Gemspec-reproducible-change-fixing-784225-too.patch | 6 +++---
 meta/recipes-devtools/ruby/{ruby_3.4.3.bb => ruby_3.4.4.bb} | 2 +-
 3 files changed, 7 insertions(+), 7 deletions(-)
 rename meta/recipes-devtools/ruby/{ruby_3.4.3.bb => ruby_3.4.4.bb} (98%)

diff --git a/meta/recipes-devtools/ruby/ruby/0002-Obey-LDFLAGS-for-the-link-of-libruby.patch b/meta/recipes-devtools/ruby/ruby/0002-Obey-LDFLAGS-for-the-link-of-libruby.patch
index bb67df0f40..84fe9aee3d 100644
--- a/meta/recipes-devtools/ruby/ruby/0002-Obey-LDFLAGS-for-the-link-of-libruby.patch
+++ b/meta/recipes-devtools/ruby/ruby/0002-Obey-LDFLAGS-for-the-link-of-libruby.patch
@@ -1,4 +1,4 @@
-From 7e2337d8b0daf264785cb06d1d6c7d61e428a11b Mon Sep 17 00:00:00 2001
+From 2625f6c155105d352d6a1ff3a722e7896431ff91 Mon Sep 17 00:00:00 2001
 From: Christopher Larson <chris_larson@mentor.com>
 Date: Thu, 5 May 2016 10:59:07 -0700
 Subject: [PATCH] Obey LDFLAGS for the link of libruby
@@ -10,10 +10,10 @@ Upstream-Status: Pending
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/template/Makefile.in b/template/Makefile.in
-index 05432cd..41a05bb 100644
+index 8f996b8..c708b64 100644
 --- a/template/Makefile.in
 +++ b/template/Makefile.in
-@@ -119,7 +119,7 @@ ENABLE_SHARED = @ENABLE_SHARED@
+@@ -120,7 +120,7 @@ ENABLE_SHARED = @ENABLE_SHARED@
  LDSHARED = @LIBRUBY_LDSHARED@
  DLDSHARED = @DLDSHARED@
  XDLDFLAGS = @DLDFLAGS@
diff --git a/meta/recipes-devtools/ruby/ruby/0005-Mark-Gemspec-reproducible-change-fixing-784225-too.patch b/meta/recipes-devtools/ruby/ruby/0005-Mark-Gemspec-reproducible-change-fixing-784225-too.patch
index eda45dd862..190eb7d728 100644
--- a/meta/recipes-devtools/ruby/ruby/0005-Mark-Gemspec-reproducible-change-fixing-784225-too.patch
+++ b/meta/recipes-devtools/ruby/ruby/0005-Mark-Gemspec-reproducible-change-fixing-784225-too.patch
@@ -1,4 +1,4 @@
-From ff25f6dddcfbbb7b0464485bb5132458866ab51a Mon Sep 17 00:00:00 2001
+From 97051be9cb9317d2c4d61a82d6d953809e962f13 Mon Sep 17 00:00:00 2001
 From: Lucas Kanashiro <kanashiro@debian.org>
 Date: Fri, 1 Nov 2019 15:25:17 -0300
 Subject: [PATCH] Make gemspecs reproducible
@@ -12,10 +12,10 @@ Upstream-Status: Backport [debian]
  1 file changed, 3 insertions(+), 1 deletion(-)
 
 diff --git a/lib/rubygems/specification.rb b/lib/rubygems/specification.rb
-index 8f353ae..095125f 100644
+index 0b905a7..a102e3c 100644
 --- a/lib/rubygems/specification.rb
 +++ b/lib/rubygems/specification.rb
-@@ -1711,7 +1711,9 @@ class Gem::Specification < Gem::BasicSpecification
+@@ -1709,7 +1709,9 @@ class Gem::Specification < Gem::BasicSpecification
                  raise(Gem::InvalidSpecificationException,
                        "invalid date format in specification: #{date.inspect}")
                end
diff --git a/meta/recipes-devtools/ruby/ruby_3.4.3.bb b/meta/recipes-devtools/ruby/ruby_3.4.4.bb
similarity index 98%
rename from meta/recipes-devtools/ruby/ruby_3.4.3.bb
rename to meta/recipes-devtools/ruby/ruby_3.4.4.bb
index 45047b8859..39e86fdd28 100644
--- a/meta/recipes-devtools/ruby/ruby_3.4.3.bb
+++ b/meta/recipes-devtools/ruby/ruby_3.4.4.bb
@@ -48,7 +48,7 @@ do_configure:prepend() {
 
 DEPENDS:append:libc-musl = " libucontext"
 
-SRC_URI[sha256sum] = "55a4cd1dcbe5ca27cf65e89a935a482c2bb2284832939266551c0ec68b437f46"
+SRC_URI[sha256sum] = "a0597bfdf312e010efd1effaa8d7f1d7833146fdc17950caa8158ffa3dcbfa85"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG += "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"
-- 
2.43.0


