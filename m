Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 668F2C982E6
	for <webhook@archiver.kernel.org>; Mon, 21 Sep 2026 07:07:32 +0000 (UTC)
Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.43885.1789974447453559422
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Sep 2026 00:07:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=X+Ax6ULf;
 spf=pass (domain: linuxfoundation.org, ip: 74.125.225.141, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e7bcb94d3so17761505e9.2
        for <openembedded-core@lists.openembedded.org>; Mon, 21 Sep 2026 00:07:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1789974446; x=1790579246; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pRV5VDdZWM+qJBDqfSstqDHFwECdOmJ7ySbnVPmQORE=;
        b=X+Ax6ULfJjucAq6yhzp7AXurMsbP/WdgaSrOf9+KJtWf0WunsiUbirJSd/XweA5mKW
         DHWotajW7VdNQqNjQXyCaa5YkZ5QL7mo24KMAQ9uYX8jAw5DKXCD8spTfizLddr4RIYW
         cRwTroFUV/6XINkKCFMWNXOtjOtG5KmHnR/M4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789974446; x=1790579246;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pRV5VDdZWM+qJBDqfSstqDHFwECdOmJ7ySbnVPmQORE=;
        b=b/s14yLGvaSNca5kkz88R2MmTRv2ebsxzJSp6L/VNuJS7I2ZH2KxIDnJEuctBHh3LG
         7dYSvcELwcRL6OTgYXWN/8Yo++y4qnrE1diM/q29frpH95RyrYtgdGqZc44nOWFuvGkO
         ri4ErusLMPj0AXxwsR92IcbsAj2GqTahxdRgrOfZMxR+hFFKs13w/iIySG4DTGROWDwE
         fOcLNGqaGuOeL7os1cXJyvRXIVo8y49skH988ZU3/OQDQwmtfcdT1qoUpakkBRaLhizX
         DxE/SSacglSjuN1lkDY/MDacsYjd36+rwRxLX+EnCdn03Fs+P7ZRIMn/EVZniFWjLYVs
         hEog==
X-Gm-Message-State: AFuF++mUB7kN43Gdrr1Obs+qmu7Av/NYLmdjEom5pieUiNV9oUhb5MoX
	mynZKq0Q+UGP+nqOUW99P3NIZQtUVwOosBsmqIJQ9ArS57lmjvJZmRqfj/rV3zn9bHHrQJDKXd+
	AqGWzCVc=
X-Gm-Gg: AYBFou1bXDiRnUIQu+FvKW9ik+4NghhFe3QFkTaKAXOq0P146kIXk0+ilThJ+SwNeL8
	wAVcm0lCdUR3rnt5WMw8geLWRK2swh27E1NUKhthiPTP2mSnMLMc7y9wdVA6TP3eyun3aoneyW4
	zVMDoG7KVQfR6xjAIVmJ53Io5uGWC222+PAyURTc8KU2Ut69BYXfDRLAtqw/bmZuZ2oIDxwS9yJ
	GeMsCC7J8yQx8w6Mvb3lqD9tkt6g3iVmEyVCdaLwHty2889Rfp9FG3eeUQaryRvoOSfmKViJfdF
	jxE3PzM5U/qodC7DPQ8vdgel17nqcX1uBxMrolun/ktKMNglykGb1y7wm+HylWXwS5oeuNb+yI2
	SuOB6wBLU1pjafK7cxwaz/8G/j0bgigIieYM8u5zvG5Q14diJuOIKhrMBOFGG0MtPHVysWo2Av+
	RYnv0RnfkglslUvWyWDB6ap5PPKFXqBfpe3nrtKqyzetPWvu6Se1Z3MtNAigBkvdBSyCJ+m31wF
	yV5u1iFI4uE3B8furMWIOKl74E=
X-Received: by 2002:a05:600d:4453:10b0:49f:cbf1:e77b with SMTP id 5b1f17b1804b1-49fcbf1e9eamr74089535e9.10.1789974445451;
        Mon, 21 Sep 2026 00:07:25 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:481d:998f:15fb:95da])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc5755c40sm276492915e9.3.2026.09.21.00.07.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 00:07:23 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 18/20] ruby: upgrade 4.0.6 -> 4.0.7
Date: Mon, 21 Sep 2026 08:06:54 +0100
Message-ID: <20260921070656.521680-18-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260921070656.521680-1-richard.purdie@linuxfoundation.org>
References: <20260921070656.521680-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Sep 2026 07:07:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246305

What's Changed

    Bug #22188: addr2line doesn't find symbols when compiled with GCC LTO - Ruby - Ruby Issue Tracking System
    Bug #22210: Check if issue #19969 is still reproducible / re-opened in 4.0.x - Ruby - Ruby Issue Tracking System
    Bug #22217: Segmentation fault when resuming execution with Coverage.start and ruby/debug - Ruby - Ruby Issue Tracking System
    Fix formatting in ObjectSpace._id2ref error path by eregon · Pull Request #18206
    Bug #22200: ObjectSpace._id2ref can return a different object than the id's owner on Ruby 4.0 (stale id2ref_tbl entry for objects with generic fields) - Ruby - Ruby Issue Tracking System
    Bug #22123: Ruby::Box + BUNDLER_SETUP can evaluate gemspecs before main-box RubyGems initialization - Ruby - Ruby Issue Tracking System
    Bump ERB to 6.0.7 by k0kubun · Pull Request #18282
    Bug #22237: GC.auto_compact corrupts a String or segfaults from String#tr with dup or gsub - Ruby - Ruby Issue Tracking System
    Bug #22243: Change fork behavior when Process._fork raises an exception during fork with a block argument - Ruby - Ruby Issue Tracking System
    Bug #22223: Socket.tcp with connect_timeout returns a phantom "connected" socket for a refused connection on macOS 27 (kernel answers EISCONN on connect retry; SO_ERROR never consulted) - Ruby - Ruby Issue Tracking System
    Bug #22220: Performance regression when requiring aws-sdk-ec2 in Ruby 4.0.6 - Ruby - Ruby Issue Tracking System
    Bug #22218: Line TracePoint misses executed loop condition after a guard - Ruby - Ruby Issue Tracking System
    Bug #22198: win32: heap overflow in Kernel#system - Ruby - Ruby Issue Tracking System
    Bug #22196: Heap-use-after-free in fiber_switch with transfer-terminated async tasks on 3.4.10 - Ruby - Ruby Issue Tracking System
    Bug #22190: Class#subclasses does not include clones of classes that include modules - Ruby - Ruby Issue Tracking System
    Bug #11438: native_thread_init_stack() get machine.stack_start unequal to thread's stack start address, x86 win32 - Ruby - Ruby Issue Tracking System
    Bug #22257: Prepending a module to an already-included module leaves stale super caches - Ruby - Ruby Issue Tracking System
    Bug #22242: SEGV in method dispatch (vm_call_iseq_setup_kwparm_nokwarg / def_iseq_ptr) on Ruby 4.0.6 — Rails CI - Ruby - Ruby Issue Tracking System
    Bug #22269: Coverage.line_stub clobbers already-collected coverage data - Ruby - Ruby Issue Tracking System
    Bug #22290: Adding instance variables to anonymous object may bloat all future classes - Ruby - Ruby Issue Tracking System
    Bug #22292: YJIT/ZJIT: Struct accessor crashes after an instance variable is set on a Struct that exactly fills the largest GC slot - Ruby - Ruby Issue Tracking System
    Bug #20958: fix ENV.keys encoding on windows - Ruby - Ruby Issue Tracking System
    Bug #22259: Arrays sharding a buffer segfault when concatenating with each other - Ruby - Ruby Issue Tracking System
    Bug #22264: Warning missing from parse.y hash literals - Ruby - Ruby Issue Tracking System
    Bug #22303: EncodingError from interpolating symbol crashes whole process - Ruby - Ruby Issue Tracking System
    Bug #22224: YJIT: rb_yjit_invalidate_ep_is_bp takes the VM lock stopping Ractors on every Proc materialization; multi-Ractor throughput collapses (up to ~150x) - Ruby - Ruby Issue Tracking System

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...id-build-time-race-condition-when-cross-compiling.patch | 7 ++-----
 .../0001-Don-t-save-the-original-name-and-timestamp.patch  | 2 +-
 ...0001-extmk-fix-cross-compilation-of-external-gems.patch | 2 +-
 ...vm_dump.c-Define-REG_S1-and-REG_S2-for-musl-riscv.patch | 4 ++--
 .../ruby/0002-Obey-LDFLAGS-for-the-link-of-libruby.patch   | 2 +-
 .../ruby/0003-rdoc-build-reproducible-documentation.patch  | 2 +-
 ...-mkmf.rb-sort-list-of-object-files-in-generated-M.patch | 2 +-
 ...ark-Gemspec-reproducible-change-fixing-784225-too.patch | 6 +++---
 .../ruby/ruby/0006-Make-gemspecs-reproducible.patch        | 2 +-
 ...007-Skip-test_rm_r_no_permissions-test-under-root.patch | 2 +-
 .../recipes-devtools/ruby/{ruby_4.0.6.bb => ruby_4.0.7.bb} | 2 +-
 11 files changed, 15 insertions(+), 18 deletions(-)
 rename meta/recipes-devtools/ruby/{ruby_4.0.6.bb => ruby_4.0.7.bb} (98%)

diff --git a/meta/recipes-devtools/ruby/ruby/0001-Avoid-build-time-race-condition-when-cross-compiling.patch b/meta/recipes-devtools/ruby/ruby/0001-Avoid-build-time-race-condition-when-cross-compiling.patch
index 3435dae7d02..d62e3affff0 100644
--- a/meta/recipes-devtools/ruby/ruby/0001-Avoid-build-time-race-condition-when-cross-compiling.patch
+++ b/meta/recipes-devtools/ruby/ruby/0001-Avoid-build-time-race-condition-when-cross-compiling.patch
@@ -1,4 +1,4 @@
-From b79c9ccbf17852f3ffd6acb8cc56124829e03edf Mon Sep 17 00:00:00 2001
+From 94b3a85def80680c6efb35e75b6e0dcd4bbf4645 Mon Sep 17 00:00:00 2001
 From: Paul Barker <paul@pbarker.dev>
 Date: Fri, 31 Jul 2026 13:15:37 +0100
 Subject: [PATCH] Avoid build-time race condition when cross-compiling from a
@@ -39,7 +39,7 @@ Signed-off-by: Paul Barker <paul@pbarker.dev>
  1 file changed, 3 insertions(+), 3 deletions(-)
 
 diff --git a/defs/gmake.mk b/defs/gmake.mk
-index e6f553fa8c1b..413057ca6896 100644
+index e6f553f..413057c 100644
 --- a/defs/gmake.mk
 +++ b/defs/gmake.mk
 @@ -435,9 +435,7 @@ endif
@@ -62,6 +62,3 @@ index e6f553fa8c1b..413057ca6896 100644
  
  include $(top_srcdir)/yjit/yjit.mk
  include $(top_srcdir)/zjit/zjit.mk
--- 
-2.43.0
-
diff --git a/meta/recipes-devtools/ruby/ruby/0001-Don-t-save-the-original-name-and-timestamp.patch b/meta/recipes-devtools/ruby/ruby/0001-Don-t-save-the-original-name-and-timestamp.patch
index b5bcfab9247..1fd2066e1ef 100644
--- a/meta/recipes-devtools/ruby/ruby/0001-Don-t-save-the-original-name-and-timestamp.patch
+++ b/meta/recipes-devtools/ruby/ruby/0001-Don-t-save-the-original-name-and-timestamp.patch
@@ -1,4 +1,4 @@
-From efd3a6d0f0cef4b2313a106f1a00e7d4a597d510 Mon Sep 17 00:00:00 2001
+From ac16ff9a35127c718422caf27fbe1dfa2309b136 Mon Sep 17 00:00:00 2001
 From: Changqing Li <changqing.li@windriver.com>
 Date: Fri, 27 Feb 2026 16:59:24 +0800
 Subject: [PATCH] Don't save the original name and timestamp
diff --git a/meta/recipes-devtools/ruby/ruby/0001-extmk-fix-cross-compilation-of-external-gems.patch b/meta/recipes-devtools/ruby/ruby/0001-extmk-fix-cross-compilation-of-external-gems.patch
index e00ce7bb73f..36037aede30 100644
--- a/meta/recipes-devtools/ruby/ruby/0001-extmk-fix-cross-compilation-of-external-gems.patch
+++ b/meta/recipes-devtools/ruby/ruby/0001-extmk-fix-cross-compilation-of-external-gems.patch
@@ -1,4 +1,4 @@
-From 7c1f11416499ce7cd1e6874840df2498e922ab78 Mon Sep 17 00:00:00 2001
+From 846b17f3dbdbbd6b7dd7dcc81fda1826b87ee541 Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@jci.com>
 Date: Mon, 30 Sep 2019 16:57:01 +0100
 Subject: [PATCH] extmk: fix cross-compilation of external gems
diff --git a/meta/recipes-devtools/ruby/ruby/0001-vm_dump.c-Define-REG_S1-and-REG_S2-for-musl-riscv.patch b/meta/recipes-devtools/ruby/ruby/0001-vm_dump.c-Define-REG_S1-and-REG_S2-for-musl-riscv.patch
index 8ae4202e601..ea63dfe227b 100644
--- a/meta/recipes-devtools/ruby/ruby/0001-vm_dump.c-Define-REG_S1-and-REG_S2-for-musl-riscv.patch
+++ b/meta/recipes-devtools/ruby/ruby/0001-vm_dump.c-Define-REG_S1-and-REG_S2-for-musl-riscv.patch
@@ -1,4 +1,4 @@
-From 4b66682db87a92d20c5ef0a00ea6eef41526d0cc Mon Sep 17 00:00:00 2001
+From f94129cac9e412a64bfb3dbd796912df058c6e1b Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Tue, 25 Jan 2022 20:29:14 -0800
 Subject: [PATCH] vm_dump.c: Define REG_S1 and REG_S2 for musl/riscv
@@ -14,7 +14,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 5 insertions(+)
 
 diff --git a/vm_dump.c b/vm_dump.c
-index e2b4804..0b7d868 100644
+index 8558ed8..230702d 100644
 --- a/vm_dump.c
 +++ b/vm_dump.c
 @@ -40,6 +40,11 @@
diff --git a/meta/recipes-devtools/ruby/ruby/0002-Obey-LDFLAGS-for-the-link-of-libruby.patch b/meta/recipes-devtools/ruby/ruby/0002-Obey-LDFLAGS-for-the-link-of-libruby.patch
index af4f7684427..0e7c23007ba 100644
--- a/meta/recipes-devtools/ruby/ruby/0002-Obey-LDFLAGS-for-the-link-of-libruby.patch
+++ b/meta/recipes-devtools/ruby/ruby/0002-Obey-LDFLAGS-for-the-link-of-libruby.patch
@@ -1,4 +1,4 @@
-From e1cb706a8653c632419803f8d36f3dd2d787face Mon Sep 17 00:00:00 2001
+From 385ea30ee2219bf9d1c702f18e38a2402a77a443 Mon Sep 17 00:00:00 2001
 From: Christopher Larson <chris_larson@mentor.com>
 Date: Thu, 5 May 2016 10:59:07 -0700
 Subject: [PATCH] Obey LDFLAGS for the link of libruby
diff --git a/meta/recipes-devtools/ruby/ruby/0003-rdoc-build-reproducible-documentation.patch b/meta/recipes-devtools/ruby/ruby/0003-rdoc-build-reproducible-documentation.patch
index 5c038a50cc2..8bf6f38afe9 100644
--- a/meta/recipes-devtools/ruby/ruby/0003-rdoc-build-reproducible-documentation.patch
+++ b/meta/recipes-devtools/ruby/ruby/0003-rdoc-build-reproducible-documentation.patch
@@ -1,4 +1,4 @@
-From 8476953b735fabad857ddfe78dd3ffcbef4028c5 Mon Sep 17 00:00:00 2001
+From 3f6ac07fd0359eb3d41db86a4276b5c7818f2e6b Mon Sep 17 00:00:00 2001
 From: Christian Hofstaedtler <zeha@debian.org>
 Date: Tue, 10 Oct 2017 15:04:34 -0300
 Subject: [PATCH] rdoc: build reproducible documentation
diff --git a/meta/recipes-devtools/ruby/ruby/0004-lib-mkmf.rb-sort-list-of-object-files-in-generated-M.patch b/meta/recipes-devtools/ruby/ruby/0004-lib-mkmf.rb-sort-list-of-object-files-in-generated-M.patch
index 0ba10724cb0..c50cd7d2b2b 100644
--- a/meta/recipes-devtools/ruby/ruby/0004-lib-mkmf.rb-sort-list-of-object-files-in-generated-M.patch
+++ b/meta/recipes-devtools/ruby/ruby/0004-lib-mkmf.rb-sort-list-of-object-files-in-generated-M.patch
@@ -1,4 +1,4 @@
-From 9fa6d40d1f7eed5be981c034c3f36bd4a3b5efab Mon Sep 17 00:00:00 2001
+From 0347f66bb6e834c5a5d469f5903527699a8a9f8e Mon Sep 17 00:00:00 2001
 From: Reiner Herrmann <reiner@reiner-h.de>
 Date: Tue, 10 Oct 2017 15:06:13 -0300
 Subject: [PATCH] lib/mkmf.rb: sort list of object files in generated Makefile
diff --git a/meta/recipes-devtools/ruby/ruby/0005-Mark-Gemspec-reproducible-change-fixing-784225-too.patch b/meta/recipes-devtools/ruby/ruby/0005-Mark-Gemspec-reproducible-change-fixing-784225-too.patch
index 4a10f861dc7..e4974ff72ee 100644
--- a/meta/recipes-devtools/ruby/ruby/0005-Mark-Gemspec-reproducible-change-fixing-784225-too.patch
+++ b/meta/recipes-devtools/ruby/ruby/0005-Mark-Gemspec-reproducible-change-fixing-784225-too.patch
@@ -1,4 +1,4 @@
-From 265381bc616fa281a58b3761c33620c465884ca8 Mon Sep 17 00:00:00 2001
+From 0e53d59cddda29e0c1d7d4196cc1255e04a3b39f Mon Sep 17 00:00:00 2001
 From: Lucas Kanashiro <kanashiro@debian.org>
 Date: Fri, 1 Nov 2019 15:25:17 -0300
 Subject: [PATCH] Make gemspecs reproducible
@@ -12,10 +12,10 @@ Upstream-Status: Backport [debian]
  1 file changed, 3 insertions(+), 1 deletion(-)
 
 diff --git a/lib/rubygems/specification.rb b/lib/rubygems/specification.rb
-index 2db9352..925b7a0 100644
+index 9ae135c..427ab48 100644
 --- a/lib/rubygems/specification.rb
 +++ b/lib/rubygems/specification.rb
-@@ -1714,7 +1714,9 @@ class Gem::Specification < Gem::BasicSpecification
+@@ -1726,7 +1726,9 @@ class Gem::Specification < Gem::BasicSpecification
                  raise(Gem::InvalidSpecificationException,
                        "invalid date format in specification: #{date.inspect}")
                end
diff --git a/meta/recipes-devtools/ruby/ruby/0006-Make-gemspecs-reproducible.patch b/meta/recipes-devtools/ruby/ruby/0006-Make-gemspecs-reproducible.patch
index 92439ffd7a8..3dfe4897f67 100644
--- a/meta/recipes-devtools/ruby/ruby/0006-Make-gemspecs-reproducible.patch
+++ b/meta/recipes-devtools/ruby/ruby/0006-Make-gemspecs-reproducible.patch
@@ -1,4 +1,4 @@
-From 40236d16b640b0c522a550b628cbfb6ee0cdc972 Mon Sep 17 00:00:00 2001
+From d4723a7dda5d2b57863ee1bba6a7456c732ea8e6 Mon Sep 17 00:00:00 2001
 From: Lucas Kanashiro <kanashiro@debian.org>
 Date: Fri, 1 Nov 2019 15:25:17 -0300
 Subject: [PATCH] Make gemspecs reproducible
diff --git a/meta/recipes-devtools/ruby/ruby/0007-Skip-test_rm_r_no_permissions-test-under-root.patch b/meta/recipes-devtools/ruby/ruby/0007-Skip-test_rm_r_no_permissions-test-under-root.patch
index cb77fffe562..70b3efb4d52 100644
--- a/meta/recipes-devtools/ruby/ruby/0007-Skip-test_rm_r_no_permissions-test-under-root.patch
+++ b/meta/recipes-devtools/ruby/ruby/0007-Skip-test_rm_r_no_permissions-test-under-root.patch
@@ -1,4 +1,4 @@
-From ccb40b4715abfb6c53d431bf421ccfbcdbc4ff93 Mon Sep 17 00:00:00 2001
+From a811d47c307d33a1ee78c752dc2fff57ce6b0ba8 Mon Sep 17 00:00:00 2001
 From: Jiaying Song <jiaying.song.cn@windriver.com>
 Date: Mon, 7 Jul 2025 15:05:57 +0800
 Subject: [PATCH] Skip test_rm_r_no_permissions test under root
diff --git a/meta/recipes-devtools/ruby/ruby_4.0.6.bb b/meta/recipes-devtools/ruby/ruby_4.0.7.bb
similarity index 98%
rename from meta/recipes-devtools/ruby/ruby_4.0.6.bb
rename to meta/recipes-devtools/ruby/ruby_4.0.7.bb
index d2a81a0ba5d..324de86f8c7 100644
--- a/meta/recipes-devtools/ruby/ruby_4.0.6.bb
+++ b/meta/recipes-devtools/ruby/ruby_4.0.7.bb
@@ -49,7 +49,7 @@ do_configure:prepend() {
 
 DEPENDS:append:libc-musl = " libucontext"
 
-SRC_URI[sha256sum] = "837d299e8f7ddf2be31a229a7a7e019d354979825117989acb3b32b1a9be262a"
+SRC_URI[sha256sum] = "911ace20f90d068ca0e4dda6d0e4f0f81e52e52f2dd4f4004c721e253412e82d"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG += "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"

