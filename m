Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DED0C61DDF
	for <webhook@archiver.kernel.org>; Fri, 28 Aug 2026 19:38:33 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3058.1787945907813391974
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Aug 2026 12:38:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=WiNkoN2g;
 spf=pass (domain: smile.fr, ip: 209.85.128.54, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-49b965570d7so10687115e9.0
        for <openembedded-core@lists.openembedded.org>; Fri, 28 Aug 2026 12:38:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1787945906; x=1788550706; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gislpi3Qu3/GP/5JgHU27pO67315IHL1xtpEWAumXgg=;
        b=WiNkoN2gprdsVcqjUIvxbRQwzPuv7y5rKF5oheVOs/Y9Sm+A+yJZLrFdOV3Y995+eD
         fGVjF6f0teB018co2uxwkrBDgHJJuSjiQ3K9rMkiHC0R4yO+QWB+RFV0a6C16ekJrpCW
         FhmQzMC5xmwENze/bU4L7gTLozFyeSjckGsfs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787945906; x=1788550706;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gislpi3Qu3/GP/5JgHU27pO67315IHL1xtpEWAumXgg=;
        b=Q1bdz2n6sy29bFvG4V6JiHn2sqIlBL99UBRy+k58moy/N+9TsEFf4TduJWERFlyhqa
         vYoVMRgKmvfLVEoAm1qXZOw/vSefmdO+5kXJmEGSISMliF8iDoqRWY4xy43OpuxU0TPU
         LAEaUG0ioLBAZIpZVxQBmbzUlD6KL6iw2kXwUCxxgL98tRtVvJKSQJoXHeRfcCsk/Ydj
         WZwOf4hW8dXBM1s8Hk7+0WZ+MvmxQpwNh7ZyrhWNLDO0FF2Sv4Ds/+G8u5qMO6DOFzFr
         ReTv4UTyybi9LtB3nVrvoy+IQgmhUBlBJNep4YVRjLoXF6XpdQUft1ygbphJA1//zmKd
         tVWw==
X-Gm-Message-State: AFuF++mlv7NJ8XMo9Lmjh9gXxB3NH69u5BXgjFdFYlx/7F/u1KJYzLFm
	2A0edIy33l0Nkpp5HecTaYvMIeR7r0VqIZC7GcR/A0XMntfGcZeCcTYq1eCQnXWePqe39U7WkgP
	fQJRwaZo=
X-Gm-Gg: AR+sD10s1ojDNGJGmfkUFT4Epjwq5MizYFdAU7foT6w3f79UMRBDHNpYV5+HweweuZQ
	mxl+62yZyeXZIyL7DlsV4M7O2dVgE2MQXaaT5uBQizh0I0Kv8GPU9LJo5mASKYKSOQQVravH6OL
	rVJxuqGQltWxcQ/6SPCGjvCfIcdLQBPW8zhPCIHa3dRo22dJLlIdmJk837W0MoSobwiu/ny9via
	gUpemDPVvZ4WV0klqgobXDIF7exalAzhf8IdoUcwTFWqtHBJl37vcQzSz36nG11rAYqAgtI9nMJ
	wNNmCguYUW8Z3SkILNzPw9v+cYPOZhckuqnnrNPHF199/NcvueW4Y0VY6uWaBn81pgCeq354+MW
	UmmzcWJn+1GVOx6Hx6VrhnRujcJLnrdjEW8NQ11w6aZui194H+yAJfTYGEHO5LckB7KTO0MQhfR
	qEk/lwbYvBg6iElhwZRvzKqs9GxqT9//6htA3BMpTZlDsMSE7z/Pw0AdvKDMa7zLhzMFtrKYRjL
	XEBbiz9wleIDN7MbVuLk9/UpHU/3F04OTQLk4Lg3mXJFP4Xo+zCUSHJxjnTlaLl
X-Received: by 2002:a05:600c:1393:b0:49b:12c2:104f with SMTP id 5b1f17b1804b1-49b91c2660amr125700135e9.1.1787945905950;
        Fri, 28 Aug 2026 12:38:25 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b497fa9c5sm147703115e9.4.2026.08.28.12.38.25
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 12:38:25 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 38/56] ruby: upgrade 4.0.2 -> 4.0.3
Date: Fri, 28 Aug 2026 21:35:48 +0200
Message-ID: <3521fb4bf709906f4322f48a939f7b32eba42873.1787945536.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1787945536.git.yoann.congal@smile.fr>
References: <cover.1787945536.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Aug 2026 19:38:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244599

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(From OE-Core rev: 783704523898316721b8fe0a74b47c69fd0b46d9)

Release notes:
* https://www.ruby-lang.org/en/news/2026/04/21/ruby-4-0-3-released/
* This release only contains ERB 6.0.1.1, which fixes CVE-2026-41316.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
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

