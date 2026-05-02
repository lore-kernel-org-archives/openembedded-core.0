Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F385DCD3430
	for <webhook@archiver.kernel.org>; Sat,  2 May 2026 16:31:36 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9526.1777739488362066954
 for <openembedded-core@lists.openembedded.org>;
 Sat, 02 May 2026 09:31:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=VH04fsEc;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-43cfce3a195so1374315f8f.2
        for <openembedded-core@lists.openembedded.org>; Sat, 02 May 2026 09:31:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1777739486; x=1778344286; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ELBB9WGWdfh/0ePyM2f4S+19qna2PAyeWzL2PTMnKhs=;
        b=VH04fsEcXDsjYK9x0MIUwNpracSlMraCpv1lx7DH+Og9wwpHGrENLfgzszA8BlZ8UR
         kdxHMl0HaFDUoeT+dNMd61f5UwCCHsIJRPG8XlmxZ3QvvJ51o9zhRL5KL/+e8lyHxfw8
         +O9OfcH8X4naw2eF8nSfRXZ6MujxyaMtmHRFE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777739486; x=1778344286;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ELBB9WGWdfh/0ePyM2f4S+19qna2PAyeWzL2PTMnKhs=;
        b=TW7GT+ynljaBT2MW0eEoBZ1M2nenKjXxptNiy358ZVgAjruZMcIi9vgfDQNILca3tC
         evBhwcK+YDbSLUmLrArrwBRudiDJ9t0aDrFCke4Skxq50M5rYfmCqX6myhuj8beCG1Zu
         EwqjfrYPByhVw5TtKRcCGesFYNmZ9IycJangjHM35ayZvK11luFa0wW+w23mv7t2QTAs
         Z8FHsMd5Aus9WDjy+z/YOf8dRf74VKYjJ+moOaMum8+/ZtWOu168yyYSwIrcKh7B+kvz
         2cN7acJT67mN6W2gI79dgkni/t5mghPu05NHEjLaDBl0oKn4lpsCEPo6eLnv108NeZ2n
         7Pkw==
X-Gm-Message-State: AOJu0YzTbLwevOeMl2U5Y11E6A+VFhnk1XSZrNtyPkaQVl7FxdwIP6pm
	YKKzr69hA5zfiDUyL6yIlQim3oCDqHkFePivdO4tz1BO3hGsrBxb9Lx6L71mOzq4oRpqaYALXy/
	8f4JPBdIdPsjHm2PIq0HQhZsvN1CDvjnVXVE3hJnbZL/GJ+1bYvC1v0zxl8AeEb2wX7g2tYx8ZO
	nf8aiaq/7GSi/vEpY=
X-Gm-Gg: AeBDieshNC/M+utSoXBiF/zroSj8IVfjKkKd2O3hzF3l0cot4BvbXtd6/cWa1b+tw01
	j4JH5rmFRhKTbUXYRw7+evemT0CuePb9tj1xmbKHzChMyx9QAf3duauW41lK6ZCmHGIWWj1T5Q3
	yOmttH6a9cwEgaWshJ2q8RvRWFYZVBNBzApPvl1FzsDUyLLvuags4w9pmjwAHcdySqcFdfX87CC
	rP417BI5McdW1Cc8hzT/j/hgbAUC5sZ2FsKGBG/T8P7TPw8iljvESo0hW6GUDWbkfmp7E7GEjdN
	KrzvgfuhFz07UzsT8QHcm5w/tAxE4Xk/GTtnIiR/7jcmmncu1FLlnb4QjrVfq3ow98fbgkfwY5H
	OF4kdaFGIdRu0m0Hh4jQU6fU2/BhDRbWA+A7OfbIiKmXVrHA7RG8qhDzYMHQrx09uwZGgx11vqs
	/ZAAUZmChV3CYTqDTNDSeiM3HPeh/6Viu/2bHFJUP0yVseliSxjj7s6190eKr7rHetLq/mKJqr+
	A==
X-Received: by 2002:a05:6000:2f83:b0:43e:b0f8:66f1 with SMTP id ffacd0b85a97d-44bb7450253mr5650181f8f.43.1777739485984;
        Sat, 02 May 2026 09:31:25 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:8635:4fc6:d16e:90be])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-44a986aac01sm11971926f8f.31.2026.05.02.09.31.24
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 May 2026 09:31:24 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 56/62] ruby: upgrade 4.0.2 -> 4.0.3
Date: Sat,  2 May 2026 17:29:16 +0100
Message-ID: <20260502162929.1377831-56-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260502162929.1377831-1-richard.purdie@linuxfoundation.org>
References: <20260502162929.1377831-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Gm-Spam: 0
X-Gm-Phishy: 0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 02 May 2026 16:31:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236365

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../0001-Don-t-save-the-original-name-and-timestamp.patch   | 5 +----
 .../0001-extmk-fix-cross-compilation-of-external-gems.patch | 6 +++---
 ...-vm_dump.c-Define-REG_S1-and-REG_S2-for-musl-riscv.patch | 4 ++--
 .../ruby/0002-Obey-LDFLAGS-for-the-link-of-libruby.patch    | 6 +++---
 .../ruby/0003-rdoc-build-reproducible-documentation.patch   | 5 +----
 ...b-mkmf.rb-sort-list-of-object-files-in-generated-M.patch | 6 +++---
 ...Mark-Gemspec-reproducible-change-fixing-784225-too.patch | 6 +++---
 .../ruby/ruby/0006-Make-gemspecs-reproducible.patch         | 5 +----
 ...0007-Skip-test_rm_r_no_permissions-test-under-root.patch | 4 ++--
 meta/recipes-devtools/ruby/{ruby_4.0.2.bb => ruby_4.0.3.bb} | 2 +-
 10 files changed, 20 insertions(+), 29 deletions(-)
 rename meta/recipes-devtools/ruby/{ruby_4.0.2.bb => ruby_4.0.3.bb} (98%)

diff --git a/meta/recipes-devtools/ruby/ruby/0001-Don-t-save-the-original-name-and-timestamp.patch b/meta/recipes-devtools/ruby/ruby/0001-Don-t-save-the-original-name-and-timestamp.patch
index 0f24d2ea0b8..2c48ca184d7 100644
--- a/meta/recipes-devtools/ruby/ruby/0001-Don-t-save-the-original-name-and-timestamp.patch
+++ b/meta/recipes-devtools/ruby/ruby/0001-Don-t-save-the-original-name-and-timestamp.patch
@@ -1,4 +1,4 @@
-From 2cedad6b2beb908a8fb80da0e45e5055dca65e99 Mon Sep 17 00:00:00 2001
+From 73edbaf1a89e05e92f91ed97348a65c4ce740cea Mon Sep 17 00:00:00 2001
 From: Changqing Li <changqing.li@windriver.com>
 Date: Fri, 27 Feb 2026 16:59:24 +0800
 Subject: [PATCH] Don't save the original name and timestamp
@@ -28,6 +28,3 @@ index 874c3ef..eb99a70 100755
  def Compressors.for(type)
    ext = File.extname(type)
    if compress = fetch(ext, nil)
--- 
-2.34.1
-
diff --git a/meta/recipes-devtools/ruby/ruby/0001-extmk-fix-cross-compilation-of-external-gems.patch b/meta/recipes-devtools/ruby/ruby/0001-extmk-fix-cross-compilation-of-external-gems.patch
index dc33fa9d802..3bf80b16136 100644
--- a/meta/recipes-devtools/ruby/ruby/0001-extmk-fix-cross-compilation-of-external-gems.patch
+++ b/meta/recipes-devtools/ruby/ruby/0001-extmk-fix-cross-compilation-of-external-gems.patch
@@ -1,4 +1,4 @@
-From 2d19806e1d221df9400b25bd67f3e0b7a21bb702 Mon Sep 17 00:00:00 2001
+From f2ea81d4707614309cda02be59dd6ccbde9b2441 Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@jci.com>
 Date: Mon, 30 Sep 2019 16:57:01 +0100
 Subject: [PATCH] extmk: fix cross-compilation of external gems
@@ -16,10 +16,10 @@ Signed-off-by: André Draszik <andre.draszik@jci.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/ext/extmk.rb b/ext/extmk.rb
-index 1d16545..ad971ea 100755
+index 8f847f4..c8a8d9f 100755
 --- a/ext/extmk.rb
 +++ b/ext/extmk.rb
-@@ -434,8 +434,8 @@ else
+@@ -427,8 +427,8 @@ else
  end
  $ruby = [$ruby]
  $ruby << "-I'$(topdir)'"
diff --git a/meta/recipes-devtools/ruby/ruby/0001-vm_dump.c-Define-REG_S1-and-REG_S2-for-musl-riscv.patch b/meta/recipes-devtools/ruby/ruby/0001-vm_dump.c-Define-REG_S1-and-REG_S2-for-musl-riscv.patch
index 4f81d0a19d3..32d55cde9f0 100644
--- a/meta/recipes-devtools/ruby/ruby/0001-vm_dump.c-Define-REG_S1-and-REG_S2-for-musl-riscv.patch
+++ b/meta/recipes-devtools/ruby/ruby/0001-vm_dump.c-Define-REG_S1-and-REG_S2-for-musl-riscv.patch
@@ -1,4 +1,4 @@
-From a5c27826e7561eafcb8dab061e07349232457f10 Mon Sep 17 00:00:00 2001
+From 875543f1bc5da190543e2696a47cfaaf939e1549 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Tue, 25 Jan 2022 20:29:14 -0800
 Subject: [PATCH] vm_dump.c: Define REG_S1 and REG_S2 for musl/riscv
@@ -14,7 +14,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 5 insertions(+)
 
 diff --git a/vm_dump.c b/vm_dump.c
-index 99339fd..8c5bb03 100644
+index e2b4804..0b7d868 100644
 --- a/vm_dump.c
 +++ b/vm_dump.c
 @@ -40,6 +40,11 @@
diff --git a/meta/recipes-devtools/ruby/ruby/0002-Obey-LDFLAGS-for-the-link-of-libruby.patch b/meta/recipes-devtools/ruby/ruby/0002-Obey-LDFLAGS-for-the-link-of-libruby.patch
index 8ef0c903e8b..11aec879343 100644
--- a/meta/recipes-devtools/ruby/ruby/0002-Obey-LDFLAGS-for-the-link-of-libruby.patch
+++ b/meta/recipes-devtools/ruby/ruby/0002-Obey-LDFLAGS-for-the-link-of-libruby.patch
@@ -1,4 +1,4 @@
-From 3949b3ff01c642b6b9ada9b12dd3083cc930544a Mon Sep 17 00:00:00 2001
+From c460fce052e04a8126f5e0554f68359ef986c5f8 Mon Sep 17 00:00:00 2001
 From: Christopher Larson <chris_larson@mentor.com>
 Date: Thu, 5 May 2016 10:59:07 -0700
 Subject: [PATCH] Obey LDFLAGS for the link of libruby
@@ -10,10 +10,10 @@ Upstream-Status: Pending
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/template/Makefile.in b/template/Makefile.in
-index 6b97279..a49b53d 100644
+index 443c394..5f706db 100644
 --- a/template/Makefile.in
 +++ b/template/Makefile.in
-@@ -120,7 +120,7 @@ ENABLE_SHARED = @ENABLE_SHARED@
+@@ -129,7 +129,7 @@ ENABLE_SHARED = @ENABLE_SHARED@
  LDSHARED = @LIBRUBY_LDSHARED@
  DLDSHARED = @DLDSHARED@
  XDLDFLAGS = @DLDFLAGS@
diff --git a/meta/recipes-devtools/ruby/ruby/0003-rdoc-build-reproducible-documentation.patch b/meta/recipes-devtools/ruby/ruby/0003-rdoc-build-reproducible-documentation.patch
index bf57f97d7e9..863960839dd 100644
--- a/meta/recipes-devtools/ruby/ruby/0003-rdoc-build-reproducible-documentation.patch
+++ b/meta/recipes-devtools/ruby/ruby/0003-rdoc-build-reproducible-documentation.patch
@@ -1,4 +1,4 @@
-From 02cd20470448676d97d77c2e6789ecce43f0e21c Mon Sep 17 00:00:00 2001
+From 3a335538594d0eb3da6155a64b473a46fd06ce76 Mon Sep 17 00:00:00 2001
 From: Christian Hofstaedtler <zeha@debian.org>
 Date: Tue, 10 Oct 2017 15:04:34 -0300
 Subject: [PATCH] rdoc: build reproducible documentation
@@ -38,6 +38,3 @@ index 065caa4..cfa1f33 100644
            gz.orig_name = dest.basename.to_s
            gz.write data
            gz.close
--- 
-2.34.1
-
diff --git a/meta/recipes-devtools/ruby/ruby/0004-lib-mkmf.rb-sort-list-of-object-files-in-generated-M.patch b/meta/recipes-devtools/ruby/ruby/0004-lib-mkmf.rb-sort-list-of-object-files-in-generated-M.patch
index 5ca182313b5..2c1f857d75a 100644
--- a/meta/recipes-devtools/ruby/ruby/0004-lib-mkmf.rb-sort-list-of-object-files-in-generated-M.patch
+++ b/meta/recipes-devtools/ruby/ruby/0004-lib-mkmf.rb-sort-list-of-object-files-in-generated-M.patch
@@ -1,4 +1,4 @@
-From 932489b67ce9cdf5590a17927ea40d9ea6623668 Mon Sep 17 00:00:00 2001
+From e94b898d11e3bd5c412aa3b772040870cddf36c7 Mon Sep 17 00:00:00 2001
 From: Reiner Herrmann <reiner@reiner-h.de>
 Date: Tue, 10 Oct 2017 15:06:13 -0300
 Subject: [PATCH] lib/mkmf.rb: sort list of object files in generated Makefile
@@ -17,10 +17,10 @@ Signed-off-by: Reiner Herrmann <reiner@reiner-h.de>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/lib/mkmf.rb b/lib/mkmf.rb
-index 99f3764..62377b6 100644
+index 38a5a15..ead7f0c 100644
 --- a/lib/mkmf.rb
 +++ b/lib/mkmf.rb
-@@ -2480,7 +2480,7 @@ LOCAL_LIBS = #{$LOCAL_LIBS}
+@@ -2493,7 +2493,7 @@ LOCAL_LIBS = #{$LOCAL_LIBS}
  LIBS = #{$LIBRUBYARG} #{$libs} #{$LIBS}
  ORIG_SRCS = #{orig_srcs.collect(&File.method(:basename)).join(' ')}
  SRCS = $(ORIG_SRCS) #{(srcs - orig_srcs).collect(&File.method(:basename)).join(' ')}
diff --git a/meta/recipes-devtools/ruby/ruby/0005-Mark-Gemspec-reproducible-change-fixing-784225-too.patch b/meta/recipes-devtools/ruby/ruby/0005-Mark-Gemspec-reproducible-change-fixing-784225-too.patch
index fd7d3340f3c..746d1022928 100644
--- a/meta/recipes-devtools/ruby/ruby/0005-Mark-Gemspec-reproducible-change-fixing-784225-too.patch
+++ b/meta/recipes-devtools/ruby/ruby/0005-Mark-Gemspec-reproducible-change-fixing-784225-too.patch
@@ -1,4 +1,4 @@
-From 410331577481f331074405e9629ca8db5303aaa8 Mon Sep 17 00:00:00 2001
+From f21e09b9c8f5975887cd85e3ec4dcf9838f62575 Mon Sep 17 00:00:00 2001
 From: Lucas Kanashiro <kanashiro@debian.org>
 Date: Fri, 1 Nov 2019 15:25:17 -0300
 Subject: [PATCH] Make gemspecs reproducible
@@ -12,10 +12,10 @@ Upstream-Status: Backport [debian]
  1 file changed, 3 insertions(+), 1 deletion(-)
 
 diff --git a/lib/rubygems/specification.rb b/lib/rubygems/specification.rb
-index 0b905a7..a102e3c 100644
+index 503f0a4..5d33b09 100644
 --- a/lib/rubygems/specification.rb
 +++ b/lib/rubygems/specification.rb
-@@ -1709,7 +1709,9 @@ class Gem::Specification < Gem::BasicSpecification
+@@ -1705,7 +1705,9 @@ class Gem::Specification < Gem::BasicSpecification
                  raise(Gem::InvalidSpecificationException,
                        "invalid date format in specification: #{date.inspect}")
                end
diff --git a/meta/recipes-devtools/ruby/ruby/0006-Make-gemspecs-reproducible.patch b/meta/recipes-devtools/ruby/ruby/0006-Make-gemspecs-reproducible.patch
index aac2bc1502d..cdfa2144d7f 100644
--- a/meta/recipes-devtools/ruby/ruby/0006-Make-gemspecs-reproducible.patch
+++ b/meta/recipes-devtools/ruby/ruby/0006-Make-gemspecs-reproducible.patch
@@ -1,4 +1,4 @@
-From 4d25e9ce0b2795009dd066d7959cf51c4292a343 Mon Sep 17 00:00:00 2001
+From 2a18efc076a20bc270215a802d72618ad0605f91 Mon Sep 17 00:00:00 2001
 From: Lucas Kanashiro <kanashiro@debian.org>
 Date: Fri, 1 Nov 2019 15:25:17 -0300
 Subject: [PATCH] Make gemspecs reproducible
@@ -78,6 +78,3 @@ index cabc916..f9581b8 100644
    spec.authors       = ["Akinori MUSHA", "Hajimu UMEMOTO"]
    spec.email         = ["knu@idaemons.org", "ume@mahoroba.org"]
  
--- 
-2.34.1
-
diff --git a/meta/recipes-devtools/ruby/ruby/0007-Skip-test_rm_r_no_permissions-test-under-root.patch b/meta/recipes-devtools/ruby/ruby/0007-Skip-test_rm_r_no_permissions-test-under-root.patch
index 780b59092f2..93b74068588 100644
--- a/meta/recipes-devtools/ruby/ruby/0007-Skip-test_rm_r_no_permissions-test-under-root.patch
+++ b/meta/recipes-devtools/ruby/ruby/0007-Skip-test_rm_r_no_permissions-test-under-root.patch
@@ -1,4 +1,4 @@
-From eb5a5db74d29fd6369e9871ba1bb254aa0f22f42 Mon Sep 17 00:00:00 2001
+From 4a48511f45606eff4e03f004fb6aea6f8ccd1eaf Mon Sep 17 00:00:00 2001
 From: Jiaying Song <jiaying.song.cn@windriver.com>
 Date: Mon, 7 Jul 2025 15:05:57 +0800
 Subject: [PATCH] Skip test_rm_r_no_permissions test under root
@@ -13,7 +13,7 @@ Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/test/fileutils/test_fileutils.rb b/test/fileutils/test_fileutils.rb
-index d2096a0..80e3368 100644
+index 92308d9..5db74f4 100644
 --- a/test/fileutils/test_fileutils.rb
 +++ b/test/fileutils/test_fileutils.rb
 @@ -768,8 +768,8 @@ class TestFileUtils < Test::Unit::TestCase
diff --git a/meta/recipes-devtools/ruby/ruby_4.0.2.bb b/meta/recipes-devtools/ruby/ruby_4.0.3.bb
similarity index 98%
rename from meta/recipes-devtools/ruby/ruby_4.0.2.bb
rename to meta/recipes-devtools/ruby/ruby_4.0.3.bb
index 89d8d5b1551..56f167379cb 100644
--- a/meta/recipes-devtools/ruby/ruby_4.0.2.bb
+++ b/meta/recipes-devtools/ruby/ruby_4.0.3.bb
@@ -48,7 +48,7 @@ do_configure:prepend() {
 
 DEPENDS:append:libc-musl = " libucontext"
 
-SRC_URI[sha256sum] = "51502b26b50b68df4963336ca41e368cde92c928faf91654de4c4c1791f82aac"
+SRC_URI[sha256sum] = "77964acc370d5c8375b9502e5ba6c13c03ef91ab9eb9f521c84fb42b9c9a6b0f"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG += "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"

