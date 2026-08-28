Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EDD2C61DE6
	for <webhook@archiver.kernel.org>; Fri, 28 Aug 2026 19:38:34 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3059.1787945908556332933
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Aug 2026 12:38:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=TRIqZ6vm;
 spf=pass (domain: smile.fr, ip: 209.85.128.52, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-49554ebb87dso16513615e9.3
        for <openembedded-core@lists.openembedded.org>; Fri, 28 Aug 2026 12:38:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1787945907; x=1788550707; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=kqnd1CR31gM2AVJaE3uS2ijA3anY6ul6AVn2HRnofTU=;
        b=TRIqZ6vm0WKo9F58pByw5CEvEaAO9eOjy0Dw6ticEmPsathqeBdssJE7DD8G86lf9q
         xMtSRvC6gZmxwFLOsgDiGpcvF2F6ZTtjbyjnDLuElyzTx9TJaWSSO00hNwYaUmgh46dB
         Xh3zkORhzdJEzFhjCYJkza044JYOcgFb5y/EY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787945907; x=1788550707;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=kqnd1CR31gM2AVJaE3uS2ijA3anY6ul6AVn2HRnofTU=;
        b=A1m/nQ8y8sVHQVm6lKI4eRnI/oTLdoWdTQh02uOmx98UP/zt2nSbZJ2p5jjfDmR0jo
         9QtNNQebjH4wzW5m7qsjLOK7Ke3HmV4RVjQOjMHyEv2pbMJv7f7NcILHmr8B3sBqKfZc
         8CmwUqgKlIAHaeeqQAGG6CrcDBdJ3ilTlrNggaj9rrnjScSoUQAL9NaufUO7nu6gR31N
         hIH1tgT0+AiOUFYl2yARc/etqPRfYGp9yOtqo17qsJuDiKj9B6CsnvaHmG86VIrudIuk
         p8O5sx1ua9Up8KSVZXUAZXt6eZDnXhevfH6W6F5mca85xnDkt3I1Sh0lft2RBPV1ysD9
         9LZA==
X-Gm-Message-State: AFuF++nI6m1+sqgQ04OfnRV+928JqP//rIbBapHxEgug7hxnV9RhOa+a
	GF7P78RMlb4kyXSg02ht1WBubPif+C/wNRfR7X9KjIqiudkUdG12SHvI8yKIj3OkMLndHbhv4Uu
	LclKnJ+Y=
X-Gm-Gg: AR+sD10XO00+bKh8aqVKjyV+ZESxP8h5owG7grNQZRP1Vuc4chuuw/8qchPi+V6Okq2
	nloOtKIru7LlfKfZQXJ3Jq1fTR3DYBWWWimetRC2jPsZeYezc+TMy11o+38hL0+F9weY9NOZJRb
	b4li713DWYCKhHKtqx3YSjGrX4tdvLEE0b81hfioI4BdppPvv+7gFitK7tB7grnctWUBPxTPAZf
	z+nWqF3xe2cbOnlcydBLZ1Tcep+2Jc2AzddT6g/ixAcJ8t55J2Yw6lHDtnS6ZgjA7ETSTX7CJLC
	ACIWKkeXhGqrmk6BHFuj9crx6vJLrbwG6qxN/9tR4Jue6CSz/qScCBlDkoemHTILjK0kNnLovYp
	geW6g2rr6o3PSfHbNtnwZwsUcKbOuIW/5SN95H5WtJhOeN7W8L8uZwyKnMCxjrvCJQJbEXxj99E
	g0hk8U8xcAg8zGrWhWmzAC2s/JdScNVY7+Uxc1DjjUxNhVnp10e70U7D9hKZMr++nyvmxYCRvSr
	bj45FFEsHWVRWUUGMZM8Zvyy143kRvJcKJq991wFFR6FHG9VIuvlnJ6kMfzuuyY
X-Received: by 2002:a05:600c:a106:b0:49b:92df:87be with SMTP id 5b1f17b1804b1-49b92df8833mr104985005e9.4.1787945906606;
        Fri, 28 Aug 2026 12:38:26 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b497fa9c5sm147703115e9.4.2026.08.28.12.38.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 12:38:26 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 39/56] ruby: upgrade 4.0.3 -> 4.0.5
Date: Fri, 28 Aug 2026 21:35:49 +0200
Message-ID: <f32d8e6b8dcd59c7adba155379cd1616b08d0541.1787945536.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1787945536.git.yoann.congal@smile.fr>
References: <cover.1787945536.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Aug 2026 19:38:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244600

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(From OE-Core rev: e176e2295bb6c4ac186c6c7187606827fbd5ffee)

Release notes:
* https://www.ruby-lang.org/en/news/2026/05/11/ruby-4-0-4-released/
* This is a routine update that includes bugfixes.
* https://www.ruby-lang.org/en/news/2026/05/20/ruby-4-0-5-released/
* This release only contains a security fix for CVE-2026-46727:
  Use-after-free in pthread-based getaddrinfo timeout handler and a
  build system regression in Ruby 4.0.4 under C locale

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 ...-Don-t-save-the-original-name-and-timestamp.patch |  2 +-
 ...xtmk-fix-cross-compilation-of-external-gems.patch |  2 +-
 ...p.c-Define-REG_S1-and-REG_S2-for-musl-riscv.patch |  2 +-
 .../0002-Obey-LDFLAGS-for-the-link-of-libruby.patch  |  2 +-
 .../0003-rdoc-build-reproducible-documentation.patch | 12 ++++++------
 ...rb-sort-list-of-object-files-in-generated-M.patch |  2 +-
 ...mspec-reproducible-change-fixing-784225-too.patch |  6 +++---
 .../ruby/ruby/0006-Make-gemspecs-reproducible.patch  | 10 +++++-----
 ...ip-test_rm_r_no_permissions-test-under-root.patch |  2 +-
 .../ruby/{ruby_4.0.3.bb => ruby_4.0.5.bb}            |  2 +-
 10 files changed, 21 insertions(+), 21 deletions(-)
 rename meta/recipes-devtools/ruby/{ruby_4.0.3.bb => ruby_4.0.5.bb} (98%)

diff --git a/meta/recipes-devtools/ruby/ruby/0001-Don-t-save-the-original-name-and-timestamp.patch b/meta/recipes-devtools/ruby/ruby/0001-Don-t-save-the-original-name-and-timestamp.patch
index 2c48ca184d7..b5bcfab9247 100644
--- a/meta/recipes-devtools/ruby/ruby/0001-Don-t-save-the-original-name-and-timestamp.patch
+++ b/meta/recipes-devtools/ruby/ruby/0001-Don-t-save-the-original-name-and-timestamp.patch
@@ -1,4 +1,4 @@
-From 73edbaf1a89e05e92f91ed97348a65c4ce740cea Mon Sep 17 00:00:00 2001
+From efd3a6d0f0cef4b2313a106f1a00e7d4a597d510 Mon Sep 17 00:00:00 2001
 From: Changqing Li <changqing.li@windriver.com>
 Date: Fri, 27 Feb 2026 16:59:24 +0800
 Subject: [PATCH] Don't save the original name and timestamp
diff --git a/meta/recipes-devtools/ruby/ruby/0001-extmk-fix-cross-compilation-of-external-gems.patch b/meta/recipes-devtools/ruby/ruby/0001-extmk-fix-cross-compilation-of-external-gems.patch
index 3bf80b16136..e00ce7bb73f 100644
--- a/meta/recipes-devtools/ruby/ruby/0001-extmk-fix-cross-compilation-of-external-gems.patch
+++ b/meta/recipes-devtools/ruby/ruby/0001-extmk-fix-cross-compilation-of-external-gems.patch
@@ -1,4 +1,4 @@
-From f2ea81d4707614309cda02be59dd6ccbde9b2441 Mon Sep 17 00:00:00 2001
+From 7c1f11416499ce7cd1e6874840df2498e922ab78 Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@jci.com>
 Date: Mon, 30 Sep 2019 16:57:01 +0100
 Subject: [PATCH] extmk: fix cross-compilation of external gems
diff --git a/meta/recipes-devtools/ruby/ruby/0001-vm_dump.c-Define-REG_S1-and-REG_S2-for-musl-riscv.patch b/meta/recipes-devtools/ruby/ruby/0001-vm_dump.c-Define-REG_S1-and-REG_S2-for-musl-riscv.patch
index 32d55cde9f0..8ae4202e601 100644
--- a/meta/recipes-devtools/ruby/ruby/0001-vm_dump.c-Define-REG_S1-and-REG_S2-for-musl-riscv.patch
+++ b/meta/recipes-devtools/ruby/ruby/0001-vm_dump.c-Define-REG_S1-and-REG_S2-for-musl-riscv.patch
@@ -1,4 +1,4 @@
-From 875543f1bc5da190543e2696a47cfaaf939e1549 Mon Sep 17 00:00:00 2001
+From 4b66682db87a92d20c5ef0a00ea6eef41526d0cc Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Tue, 25 Jan 2022 20:29:14 -0800
 Subject: [PATCH] vm_dump.c: Define REG_S1 and REG_S2 for musl/riscv
diff --git a/meta/recipes-devtools/ruby/ruby/0002-Obey-LDFLAGS-for-the-link-of-libruby.patch b/meta/recipes-devtools/ruby/ruby/0002-Obey-LDFLAGS-for-the-link-of-libruby.patch
index 11aec879343..af4f7684427 100644
--- a/meta/recipes-devtools/ruby/ruby/0002-Obey-LDFLAGS-for-the-link-of-libruby.patch
+++ b/meta/recipes-devtools/ruby/ruby/0002-Obey-LDFLAGS-for-the-link-of-libruby.patch
@@ -1,4 +1,4 @@
-From c460fce052e04a8126f5e0554f68359ef986c5f8 Mon Sep 17 00:00:00 2001
+From e1cb706a8653c632419803f8d36f3dd2d787face Mon Sep 17 00:00:00 2001
 From: Christopher Larson <chris_larson@mentor.com>
 Date: Thu, 5 May 2016 10:59:07 -0700
 Subject: [PATCH] Obey LDFLAGS for the link of libruby
diff --git a/meta/recipes-devtools/ruby/ruby/0003-rdoc-build-reproducible-documentation.patch b/meta/recipes-devtools/ruby/ruby/0003-rdoc-build-reproducible-documentation.patch
index 863960839dd..5c038a50cc2 100644
--- a/meta/recipes-devtools/ruby/ruby/0003-rdoc-build-reproducible-documentation.patch
+++ b/meta/recipes-devtools/ruby/ruby/0003-rdoc-build-reproducible-documentation.patch
@@ -1,4 +1,4 @@
-From 3a335538594d0eb3da6155a64b473a46fd06ce76 Mon Sep 17 00:00:00 2001
+From 8476953b735fabad857ddfe78dd3ffcbef4028c5 Mon Sep 17 00:00:00 2001
 From: Christian Hofstaedtler <zeha@debian.org>
 Date: Tue, 10 Oct 2017 15:04:34 -0300
 Subject: [PATCH] rdoc: build reproducible documentation
@@ -13,13 +13,13 @@ Signed-off-by: Christian Hofstaedtler <zeha@debian.org>
 rebase to version 4.0.1
 Signed-off-by: Changqing Li <changqing.li@windriver.com>
 ---
- .bundle/gems/rdoc-7.0.3/lib/rdoc/generator/json_index.rb | 4 ++--
+ .bundle/gems/rdoc-7.0.4/lib/rdoc/generator/json_index.rb | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
 
-diff --git a/.bundle/gems/rdoc-7.0.3/lib/rdoc/generator/json_index.rb b/.bundle/gems/rdoc-7.0.3/lib/rdoc/generator/json_index.rb
-index 065caa4..cfa1f33 100644
---- a/.bundle/gems/rdoc-7.0.3/lib/rdoc/generator/json_index.rb
-+++ b/.bundle/gems/rdoc-7.0.3/lib/rdoc/generator/json_index.rb
+diff --git a/.bundle/gems/rdoc-7.0.4/lib/rdoc/generator/json_index.rb b/.bundle/gems/rdoc-7.0.4/lib/rdoc/generator/json_index.rb
+index c61391d..9115dbd 100644
+--- a/.bundle/gems/rdoc-7.0.4/lib/rdoc/generator/json_index.rb
++++ b/.bundle/gems/rdoc-7.0.4/lib/rdoc/generator/json_index.rb
 @@ -176,7 +176,7 @@ class RDoc::Generator::JsonIndex
      debug_msg "Writing gzipped search index to %s" % outfile
  
diff --git a/meta/recipes-devtools/ruby/ruby/0004-lib-mkmf.rb-sort-list-of-object-files-in-generated-M.patch b/meta/recipes-devtools/ruby/ruby/0004-lib-mkmf.rb-sort-list-of-object-files-in-generated-M.patch
index 2c1f857d75a..0ba10724cb0 100644
--- a/meta/recipes-devtools/ruby/ruby/0004-lib-mkmf.rb-sort-list-of-object-files-in-generated-M.patch
+++ b/meta/recipes-devtools/ruby/ruby/0004-lib-mkmf.rb-sort-list-of-object-files-in-generated-M.patch
@@ -1,4 +1,4 @@
-From e94b898d11e3bd5c412aa3b772040870cddf36c7 Mon Sep 17 00:00:00 2001
+From 9fa6d40d1f7eed5be981c034c3f36bd4a3b5efab Mon Sep 17 00:00:00 2001
 From: Reiner Herrmann <reiner@reiner-h.de>
 Date: Tue, 10 Oct 2017 15:06:13 -0300
 Subject: [PATCH] lib/mkmf.rb: sort list of object files in generated Makefile
diff --git a/meta/recipes-devtools/ruby/ruby/0005-Mark-Gemspec-reproducible-change-fixing-784225-too.patch b/meta/recipes-devtools/ruby/ruby/0005-Mark-Gemspec-reproducible-change-fixing-784225-too.patch
index 746d1022928..4a10f861dc7 100644
--- a/meta/recipes-devtools/ruby/ruby/0005-Mark-Gemspec-reproducible-change-fixing-784225-too.patch
+++ b/meta/recipes-devtools/ruby/ruby/0005-Mark-Gemspec-reproducible-change-fixing-784225-too.patch
@@ -1,4 +1,4 @@
-From f21e09b9c8f5975887cd85e3ec4dcf9838f62575 Mon Sep 17 00:00:00 2001
+From 265381bc616fa281a58b3761c33620c465884ca8 Mon Sep 17 00:00:00 2001
 From: Lucas Kanashiro <kanashiro@debian.org>
 Date: Fri, 1 Nov 2019 15:25:17 -0300
 Subject: [PATCH] Make gemspecs reproducible
@@ -12,10 +12,10 @@ Upstream-Status: Backport [debian]
  1 file changed, 3 insertions(+), 1 deletion(-)
 
 diff --git a/lib/rubygems/specification.rb b/lib/rubygems/specification.rb
-index 503f0a4..5d33b09 100644
+index 2db9352..925b7a0 100644
 --- a/lib/rubygems/specification.rb
 +++ b/lib/rubygems/specification.rb
-@@ -1705,7 +1705,9 @@ class Gem::Specification < Gem::BasicSpecification
+@@ -1714,7 +1714,9 @@ class Gem::Specification < Gem::BasicSpecification
                  raise(Gem::InvalidSpecificationException,
                        "invalid date format in specification: #{date.inspect}")
                end
diff --git a/meta/recipes-devtools/ruby/ruby/0006-Make-gemspecs-reproducible.patch b/meta/recipes-devtools/ruby/ruby/0006-Make-gemspecs-reproducible.patch
index cdfa2144d7f..92439ffd7a8 100644
--- a/meta/recipes-devtools/ruby/ruby/0006-Make-gemspecs-reproducible.patch
+++ b/meta/recipes-devtools/ruby/ruby/0006-Make-gemspecs-reproducible.patch
@@ -1,4 +1,4 @@
-From 2a18efc076a20bc270215a802d72618ad0605f91 Mon Sep 17 00:00:00 2001
+From 40236d16b640b0c522a550b628cbfb6ee0cdc972 Mon Sep 17 00:00:00 2001
 From: Lucas Kanashiro <kanashiro@debian.org>
 Date: Fri, 1 Nov 2019 15:25:17 -0300
 Subject: [PATCH] Make gemspecs reproducible
@@ -13,7 +13,7 @@ Signed-off-by: Changqing Li <changqing.li@windriver.com>
 ---
  .bundle/gems/bigdecimal-4.0.1/bigdecimal.gemspec | 1 +
  .bundle/gems/fiddle-1.1.8/fiddle.gemspec         | 1 +
- .bundle/gems/rdoc-7.0.3/rdoc.gemspec             | 1 +
+ .bundle/gems/rdoc-7.0.4/rdoc.gemspec             | 1 +
  ext/io/console/io-console.gemspec                | 1 +
  lib/ipaddr.gemspec                               | 1 +
  5 files changed, 5 insertions(+)
@@ -42,10 +42,10 @@ index 0092f52..f77c224 100644
    spec.authors       = ["Aaron Patterson", "SHIBATA Hiroshi"]
    spec.email         = ["aaron@tenderlovemaking.com", "hsbt@ruby-lang.org"]
  
-diff --git a/.bundle/gems/rdoc-7.0.3/rdoc.gemspec b/.bundle/gems/rdoc-7.0.3/rdoc.gemspec
+diff --git a/.bundle/gems/rdoc-7.0.4/rdoc.gemspec b/.bundle/gems/rdoc-7.0.4/rdoc.gemspec
 index ada9341..5871ec2 100644
---- a/.bundle/gems/rdoc-7.0.3/rdoc.gemspec
-+++ b/.bundle/gems/rdoc-7.0.3/rdoc.gemspec
+--- a/.bundle/gems/rdoc-7.0.4/rdoc.gemspec
++++ b/.bundle/gems/rdoc-7.0.4/rdoc.gemspec
 @@ -7,6 +7,7 @@ end
  
  Gem::Specification.new do |s|
diff --git a/meta/recipes-devtools/ruby/ruby/0007-Skip-test_rm_r_no_permissions-test-under-root.patch b/meta/recipes-devtools/ruby/ruby/0007-Skip-test_rm_r_no_permissions-test-under-root.patch
index 93b74068588..cb77fffe562 100644
--- a/meta/recipes-devtools/ruby/ruby/0007-Skip-test_rm_r_no_permissions-test-under-root.patch
+++ b/meta/recipes-devtools/ruby/ruby/0007-Skip-test_rm_r_no_permissions-test-under-root.patch
@@ -1,4 +1,4 @@
-From 4a48511f45606eff4e03f004fb6aea6f8ccd1eaf Mon Sep 17 00:00:00 2001
+From ccb40b4715abfb6c53d431bf421ccfbcdbc4ff93 Mon Sep 17 00:00:00 2001
 From: Jiaying Song <jiaying.song.cn@windriver.com>
 Date: Mon, 7 Jul 2025 15:05:57 +0800
 Subject: [PATCH] Skip test_rm_r_no_permissions test under root
diff --git a/meta/recipes-devtools/ruby/ruby_4.0.3.bb b/meta/recipes-devtools/ruby/ruby_4.0.5.bb
similarity index 98%
rename from meta/recipes-devtools/ruby/ruby_4.0.3.bb
rename to meta/recipes-devtools/ruby/ruby_4.0.5.bb
index 56f167379cb..a0981bf622c 100644
--- a/meta/recipes-devtools/ruby/ruby_4.0.3.bb
+++ b/meta/recipes-devtools/ruby/ruby_4.0.5.bb
@@ -48,7 +48,7 @@ do_configure:prepend() {
 
 DEPENDS:append:libc-musl = " libucontext"
 
-SRC_URI[sha256sum] = "77964acc370d5c8375b9502e5ba6c13c03ef91ab9eb9f521c84fb42b9c9a6b0f"
+SRC_URI[sha256sum] = "7d6149079a63f8ae1d326c9fa65c6019ba2dc3155eae7b39159817911c88958e"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG += "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"

