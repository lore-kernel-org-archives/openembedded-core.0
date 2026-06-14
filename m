Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A83DCD98DC
	for <webhook@archiver.kernel.org>; Sun, 14 Jun 2026 08:04:22 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.105057.1781424259548140270
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Jun 2026 01:04:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=A5/sJbGX;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-490ac10e337so15118405e9.3
        for <openembedded-core@lists.openembedded.org>; Sun, 14 Jun 2026 01:04:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1781424258; x=1782029058; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kLz0Xa4s8grF1EZUxiYOQ/+ZvUbjmdYOtKZcgbQjj/c=;
        b=A5/sJbGXw4A22fV3OYT5vd+FAVJyOcX7cHTHfEl3kkJHDXk0yPC8JKAfpvln2i2hEQ
         v/+qwxY+eWrZ4GBQlz/fN0Jnmb/kaTrYl51eXpH/rbRxp1BipldmqychIycZh3A2T696
         JknJmoHQfUCdow/+pMiV69IBn1e5j07PD2Qi8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781424258; x=1782029058;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kLz0Xa4s8grF1EZUxiYOQ/+ZvUbjmdYOtKZcgbQjj/c=;
        b=Gp4fGg7eoXyczLOvY7UEw6iTiKMa2JHchcwzKGUefaO/Yz02BNqI2f6p3976vW5JeK
         yJIp054HmqUCKS+/13v20kC7rYhBARFiNRzLDMTqAs6V7ACnYvbwUHdpgH85AC9ETPfV
         wQozwPA651ShZfP/Yo5p4TiVe3avg75yRcDVjtRDL1vUFJpJPM/xXczsg5zj7+re7zxH
         sDBR41hCdxouaDKfJEH1xzCS8I+UReLqEJ1NwKbQb6RBEvTl24qiA5gOfpguEZtTNs9w
         5IDpmRxB+ZRr6lMko7ZUO5uEJ6E5k6tmzCJjouRavVMISMlATdsX+SpUTlygicE1CutH
         Wnjg==
X-Gm-Message-State: AOJu0YxOvhwjhWbqU3f02DQGkKg/0D57jI/oo2FeGjRnV3P5EGvVoBhD
	kYrUmuloD2Ts1NZbntIqpeQJ2HH7tWK/IB6JtCHaDHgWBAX6hvbs977KXt+lPawxOUC3k3PXHzz
	Scxxt
X-Gm-Gg: Acq92OE3JqG1TRA7m9T8QhOnlOLROrr60KcfztyyNewQDmBiHOy5Eq7DjGyWYgMYSty
	4uuAMRdnwTvg4FI8BzsmcHJw4xc8kvodIo3W1p/4Dn1D5HCnt7vzwJ1/4DoLI7UdQ6OOX4Avqly
	li96OF5jjyhV9Of37wCGQxKEykTEMKeL3wRbcH5T8coZ6ekVrSK0RY6eYq6nYFrCUlhA0oCStPJ
	QlJ/rpRi1W0AJrmSbBfhMaTFMz2LfiIYeeF+7Xn1tWiB5qZ+uctyd/ZXOkoK39fQUB92EKnDu8L
	e+VUh7nXQjnGBWKE0Yb8m22zJkifIT3eGN6NlBrfcwI1btMVYt/H3hbVYf0mC02h6U6R3zGmwjS
	KV23Nbbed+YCeI0S+RgNc6pCCAsZOCepyESmnJau7tzr2ooj4YAksyAd4FPrBCQ0ETMnzpNtcI+
	n13UctWhiKZeeNJnb/6NZ7D5wJPo3H6gGDtrn7ZzNsFtW3YabEEwZV
X-Received: by 2002:a05:600c:4714:b0:490:bb37:9d49 with SMTP id 5b1f17b1804b1-49220061e9bmr68471825e9.11.1781424257683;
        Sun, 14 Jun 2026 01:04:17 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:b23b:4f5a:d2e8:6789])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-492202edf89sm149999065e9.1.2026.06.14.01.04.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2026 01:04:16 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 45/56] ruby: upgrade 4.0.3 -> 4.0.5
Date: Sun, 14 Jun 2026 09:02:56 +0100
Message-ID: <20260614080307.4017177-45-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260614080307.4017177-1-richard.purdie@linuxfoundation.org>
References: <20260614080307.4017177-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 14 Jun 2026 08:04:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238729

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
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

