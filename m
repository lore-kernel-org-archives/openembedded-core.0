Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3F7EC54E71
	for <webhook@archiver.kernel.org>; Wed, 13 Mar 2024 17:33:57 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web11.2047.1710351231292886121
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Mar 2024 10:33:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CbrDKLWQ;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-413ee4acab3so622165e9.3
        for <openembedded-core@lists.openembedded.org>; Wed, 13 Mar 2024 10:33:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710351230; x=1710956030; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MZhiDMSSeXsK9aQqSEqvqPyoWZvVqGzYiKRUzJ/yEjw=;
        b=CbrDKLWQzOUtXepmoR4mjvh0A3z42V5ErGwvnXy6E/5v1OaOTEGi74Bw8dz4MX8JlR
         FnYzW1UU7aetqcUfBE63wib09CWPgelenJW4sAcYDm3MVrCdGmmqLYudD/VsywWl99L+
         RwC5abvmuYEyM8KPngd/2UqtsR+pH0bYgDdeHvsEyujIdLnHpmvk3ZCfcBB90svlRMTO
         r7QRm0eTK1NLmtfzJLsTp8r4Ho3XeKIqi5nF29uUlx/mHkNPVZLhYVNZdKh9GKts1uPA
         3chtH9EexzvYxqiEob+kSVWiejXKMizQIYT6XC6CH0X4BzwM5F06g+q9vLhcsuTZXbSI
         3vRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710351230; x=1710956030;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MZhiDMSSeXsK9aQqSEqvqPyoWZvVqGzYiKRUzJ/yEjw=;
        b=S9LhSWVx4diK3jlrgKBIcjYvGu7bEk+kaaZVKu0L+Dm/jd+jx8PwPrl29nPTOqk1lB
         +kOwgadZHxeADlfzOhj6acAy5689YL78/THLPc9B6ReU7h6l3ED1n263qp4wxY1nRsGA
         pCzKz2PaVC+bkXn1iyTuRCaFIz3+jcgpVlYmcGdttUVkyW5+BrFX/ORwWBIrZHReQHtZ
         z8A71OtUYAGxjScEvtRGD1OdaC6luBxweLHjCeJOo468ir+6NtIm9UQtZ0b9dZ1zRzod
         oIj7I4x514jL2Tj+0k4JDDOTJzD136nV9dfoXKYhzNk2U1L9or0nZxF0duaqNNdZztDf
         Wkqw==
X-Gm-Message-State: AOJu0YxKojZvQvP5qBDBA3qt24jA/a0txmLpjD3mmzZfE3nX6934u5E2
	5A+SbIMI0KL40pNhpiCfpuuFDr32F7P8O3GMSNrqldX8vBEIfTv9Daow8jty
X-Google-Smtp-Source: AGHT+IGUmkWP9tq3iT3TuONfMhQ5fGhRGrQqht17zXjytOh2I4AQ8Cu47M3aVnHgux8rimkl5c3pdg==
X-Received: by 2002:a05:600c:3493:b0:413:1b2e:50a2 with SMTP id a19-20020a05600c349300b004131b2e50a2mr521474wmq.4.1710351229569;
        Wed, 13 Mar 2024 10:33:49 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id l5-20020a05600c1d0500b00412ea52b102sm2989710wms.34.2024.03.13.10.33.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Mar 2024 10:33:49 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 16/21] ruby: update 3.2.2 -> 3.3.0
Date: Wed, 13 Mar 2024 18:33:31 +0100
Message-Id: <20240313173336.3900178-16-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240313173336.3900178-1-alex@linutronix.de>
References: <20240313173336.3900178-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Mar 2024 17:33:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197068

Rebase:
ruby/0005-Mark-Gemspec-reproducible-change-fixing-784225-too.patch

Drop:

ruby/0001-fiddle-Use-C11-_Alignof-to-define-ALIGN_OF-when-poss.patch
(merged upstream)

ruby/0001-template-Makefile.in-do-not-write-host-cross-cc-item.patch
ruby/0002-template-Makefile.in-filter-out-f-prefix-map.patch
ruby/remove_has_include_macros.patch
(code rewritten upstream)

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...x-cross-compilation-of-external-gems.patch | 11 ++--
 ...Alignof-to-define-ALIGN_OF-when-poss.patch | 52 -------------------
 ...e.in-do-not-write-host-cross-cc-item.patch | 32 ------------
 ...ine-REG_S1-and-REG_S2-for-musl-riscv.patch |  7 +--
 ...Obey-LDFLAGS-for-the-link-of-libruby.patch |  9 ++--
 ...-Makefile.in-filter-out-f-prefix-map.patch | 42 ---------------
 ...doc-build-reproducible-documentation.patch | 16 +++---
 ...-list-of-object-files-in-generated-M.patch |  7 ++-
 ...eproducible-change-fixing-784225-too.patch | 28 +++++-----
 .../0006-Make-gemspecs-reproducible.patch     | 17 +++---
 .../ruby/ruby/remove_has_include_macros.patch | 35 -------------
 .../ruby/{ruby_3.2.2.bb => ruby_3.3.0.bb}     |  8 +--
 12 files changed, 48 insertions(+), 216 deletions(-)
 delete mode 100644 meta/recipes-devtools/ruby/ruby/0001-fiddle-Use-C11-_Alignof-to-define-ALIGN_OF-when-poss.patch
 delete mode 100644 meta/recipes-devtools/ruby/ruby/0001-template-Makefile.in-do-not-write-host-cross-cc-item.patch
 delete mode 100644 meta/recipes-devtools/ruby/ruby/0002-template-Makefile.in-filter-out-f-prefix-map.patch
 delete mode 100644 meta/recipes-devtools/ruby/ruby/remove_has_include_macros.patch
 rename meta/recipes-devtools/ruby/{ruby_3.2.2.bb => ruby_3.3.0.bb} (92%)

diff --git a/meta/recipes-devtools/ruby/ruby/0001-extmk-fix-cross-compilation-of-external-gems.patch b/meta/recipes-devtools/ruby/ruby/0001-extmk-fix-cross-compilation-of-external-gems.patch
index 2e3156880ef..7402e763331 100644
--- a/meta/recipes-devtools/ruby/ruby/0001-extmk-fix-cross-compilation-of-external-gems.patch
+++ b/meta/recipes-devtools/ruby/ruby/0001-extmk-fix-cross-compilation-of-external-gems.patch
@@ -1,7 +1,7 @@
-From a6e12b25a54d112c899b70c89c0bec9c5e5ebf3c Mon Sep 17 00:00:00 2001
+From caa03f46a3204a7e0f0e5d9d9cc9113304dc0382 Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@jci.com>
 Date: Mon, 30 Sep 2019 16:57:01 +0100
-Subject: [PATCH 1/3] extmk: fix cross-compilation of external gems
+Subject: [PATCH] extmk: fix cross-compilation of external gems
 MIME-Version: 1.0
 Content-Type: text/plain; charset=UTF-8
 Content-Transfer-Encoding: 8bit
@@ -16,10 +16,10 @@ Signed-off-by: André Draszik <andre.draszik@jci.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/ext/extmk.rb b/ext/extmk.rb
-index 1389dc4117..e4d923d7a7 100755
+index 428ffc9..87eff71 100755
 --- a/ext/extmk.rb
 +++ b/ext/extmk.rb
-@@ -413,8 +413,8 @@ def $mflags.defined?(var)
+@@ -420,8 +420,8 @@ else
  end
  $ruby = [$ruby]
  $ruby << "-I'$(topdir)'"
@@ -29,6 +29,3 @@ index 1389dc4117..e4d923d7a7 100755
    $ruby << "-I'$(extout)/$(arch)'" << "-I'$(extout)/common'" if $extout
    ENV["RUBYLIB"] = "-"
  end
--- 
-2.23.0.rc1
-
diff --git a/meta/recipes-devtools/ruby/ruby/0001-fiddle-Use-C11-_Alignof-to-define-ALIGN_OF-when-poss.patch b/meta/recipes-devtools/ruby/ruby/0001-fiddle-Use-C11-_Alignof-to-define-ALIGN_OF-when-poss.patch
deleted file mode 100644
index 1dff9c0f8c4..00000000000
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
index 226ef3af750..00000000000
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
diff --git a/meta/recipes-devtools/ruby/ruby/0001-vm_dump.c-Define-REG_S1-and-REG_S2-for-musl-riscv.patch b/meta/recipes-devtools/ruby/ruby/0001-vm_dump.c-Define-REG_S1-and-REG_S2-for-musl-riscv.patch
index f7b7adb3fdb..67054d65533 100644
--- a/meta/recipes-devtools/ruby/ruby/0001-vm_dump.c-Define-REG_S1-and-REG_S2-for-musl-riscv.patch
+++ b/meta/recipes-devtools/ruby/ruby/0001-vm_dump.c-Define-REG_S1-and-REG_S2-for-musl-riscv.patch
@@ -1,4 +1,4 @@
-From dfb22e4d6662bf72879eda806eaa78c7b52b519e Mon Sep 17 00:00:00 2001
+From 980dcc5380db6f03451357140ae1487117300156 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Tue, 25 Jan 2022 20:29:14 -0800
 Subject: [PATCH] vm_dump.c: Define REG_S1 and REG_S2 for musl/riscv
@@ -14,7 +14,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 5 insertions(+)
 
 diff --git a/vm_dump.c b/vm_dump.c
-index a98f5aa..957b785 100644
+index 444be4a..8a081a7 100644
 --- a/vm_dump.c
 +++ b/vm_dump.c
 @@ -39,6 +39,11 @@
@@ -29,6 +29,3 @@ index a98f5aa..957b785 100644
  #define VM_CFP_CNT(ec, cfp) \
    ((rb_control_frame_t *)((ec)->vm_stack + (ec)->vm_stack_size) - \
     (rb_control_frame_t *)(cfp))
--- 
-2.35.0
-
diff --git a/meta/recipes-devtools/ruby/ruby/0002-Obey-LDFLAGS-for-the-link-of-libruby.patch b/meta/recipes-devtools/ruby/ruby/0002-Obey-LDFLAGS-for-the-link-of-libruby.patch
index 96ae86263b4..f3a65e785d6 100644
--- a/meta/recipes-devtools/ruby/ruby/0002-Obey-LDFLAGS-for-the-link-of-libruby.patch
+++ b/meta/recipes-devtools/ruby/ruby/0002-Obey-LDFLAGS-for-the-link-of-libruby.patch
@@ -1,20 +1,19 @@
-From 21d8e7700fa0a9c4bf569dd366134060ae858832 Mon Sep 17 00:00:00 2001
+From 7f7facb85bd65adec24230fe8ca7f6a9863a1fd0 Mon Sep 17 00:00:00 2001
 From: Christopher Larson <chris_larson@mentor.com>
 Date: Thu, 5 May 2016 10:59:07 -0700
 Subject: [PATCH] Obey LDFLAGS for the link of libruby
 
 Signed-off-by: Christopher Larson <chris_larson@mentor.com>
 Upstream-Status: Pending
-
 ---
  template/Makefile.in | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/template/Makefile.in b/template/Makefile.in
-index 1456313..15b98a4 100644
+index 8c462f2..2200c8c 100644
 --- a/template/Makefile.in
 +++ b/template/Makefile.in
-@@ -127,7 +127,7 @@ ENABLE_SHARED = @ENABLE_SHARED@
+@@ -115,7 +115,7 @@ ENABLE_SHARED = @ENABLE_SHARED@
  LDSHARED = @LIBRUBY_LDSHARED@
  DLDSHARED = @DLDSHARED@
  XDLDFLAGS = @DLDFLAGS@
@@ -22,4 +21,4 @@ index 1456313..15b98a4 100644
 +DLDFLAGS = @LIBRUBY_DLDFLAGS@ @LDFLAGS@ $(XLDFLAGS) $(ARCH_FLAG)
  SOLIBS = @SOLIBS@
  ENABLE_DEBUG_ENV = @ENABLE_DEBUG_ENV@
- MAINLIBS = $(YJIT_LIBS) @MAINLIBS@
+ MAINLIBS = @MAINLIBS@
diff --git a/meta/recipes-devtools/ruby/ruby/0002-template-Makefile.in-filter-out-f-prefix-map.patch b/meta/recipes-devtools/ruby/ruby/0002-template-Makefile.in-filter-out-f-prefix-map.patch
deleted file mode 100644
index 2efbad75133..00000000000
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
diff --git a/meta/recipes-devtools/ruby/ruby/0003-rdoc-build-reproducible-documentation.patch b/meta/recipes-devtools/ruby/ruby/0003-rdoc-build-reproducible-documentation.patch
index f92f0e1ba68..e2d5b57c25c 100644
--- a/meta/recipes-devtools/ruby/ruby/0003-rdoc-build-reproducible-documentation.patch
+++ b/meta/recipes-devtools/ruby/ruby/0003-rdoc-build-reproducible-documentation.patch
@@ -1,6 +1,7 @@
+From 5079e678ce2a81416088c04f9123cd8207d5def2 Mon Sep 17 00:00:00 2001
 From: Christian Hofstaedtler <zeha@debian.org>
 Date: Tue, 10 Oct 2017 15:04:34 -0300
-Subject: rdoc: build reproducible documentation
+Subject: [PATCH] rdoc: build reproducible documentation
 
 - provide a fixed timestamp to the gzip compression
 
@@ -10,23 +11,24 @@ Signed-off-by: Antonio Terceiro <terceiro@debian.org>
 Signed-off-by: Christian Hofstaedtler <zeha@debian.org>
 ---
  lib/rdoc/generator/json_index.rb | 4 ++--
- lib/rdoc/rdoc.rb                 | 2 +-
- 2 files changed, 3 insertions(+), 3 deletions(-)
+ 1 file changed, 2 insertions(+), 2 deletions(-)
 
+diff --git a/lib/rdoc/generator/json_index.rb b/lib/rdoc/generator/json_index.rb
+index c454910..24feab0 100644
 --- a/lib/rdoc/generator/json_index.rb
 +++ b/lib/rdoc/generator/json_index.rb
-@@ -178,7 +178,7 @@
+@@ -178,7 +178,7 @@ class RDoc::Generator::JsonIndex
      debug_msg "Writing gzipped search index to %s" % outfile
-
+ 
      Zlib::GzipWriter.open(outfile) do |gz|
 -      gz.mtime = File.mtime(search_index_file)
 +      gz.mtime = -1
        gz.orig_name = search_index_file.basename.to_s
        gz.write search_index
        gz.close
-@@ -196,7 +196,7 @@
+@@ -196,7 +196,7 @@ class RDoc::Generator::JsonIndex
          debug_msg "Writing gzipped file to %s" % outfile
-
+ 
          Zlib::GzipWriter.open(outfile) do |gz|
 -          gz.mtime = File.mtime(dest)
 +          gz.mtime = -1
diff --git a/meta/recipes-devtools/ruby/ruby/0004-lib-mkmf.rb-sort-list-of-object-files-in-generated-M.patch b/meta/recipes-devtools/ruby/ruby/0004-lib-mkmf.rb-sort-list-of-object-files-in-generated-M.patch
index e0aca0dcfc1..b14a731cfb6 100644
--- a/meta/recipes-devtools/ruby/ruby/0004-lib-mkmf.rb-sort-list-of-object-files-in-generated-M.patch
+++ b/meta/recipes-devtools/ruby/ruby/0004-lib-mkmf.rb-sort-list-of-object-files-in-generated-M.patch
@@ -1,6 +1,7 @@
+From 99734381652602f76075017576a819c427ebb5f2 Mon Sep 17 00:00:00 2001
 From: Reiner Herrmann <reiner@reiner-h.de>
 Date: Tue, 10 Oct 2017 15:06:13 -0300
-Subject: lib/mkmf.rb: sort list of object files in generated Makefile
+Subject: [PATCH] lib/mkmf.rb: sort list of object files in generated Makefile
 
 Without sorting the list explicitly, its order is indeterministic,
 because readdir() is also not deterministic.
@@ -15,9 +16,11 @@ Signed-off-by: Reiner Herrmann <reiner@reiner-h.de>
  lib/mkmf.rb | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
+diff --git a/lib/mkmf.rb b/lib/mkmf.rb
+index 6da7dde..3af30a9 100644
 --- a/lib/mkmf.rb
 +++ b/lib/mkmf.rb
-@@ -2315,7 +2315,7 @@
+@@ -2368,7 +2368,7 @@ LOCAL_LIBS = #{$LOCAL_LIBS}
  LIBS = #{$LIBRUBYARG} #{$libs} #{$LIBS}
  ORIG_SRCS = #{orig_srcs.collect(&File.method(:basename)).join(' ')}
  SRCS = $(ORIG_SRCS) #{(srcs - orig_srcs).collect(&File.method(:basename)).join(' ')}
diff --git a/meta/recipes-devtools/ruby/ruby/0005-Mark-Gemspec-reproducible-change-fixing-784225-too.patch b/meta/recipes-devtools/ruby/ruby/0005-Mark-Gemspec-reproducible-change-fixing-784225-too.patch
index 41f206523e6..24268625a28 100644
--- a/meta/recipes-devtools/ruby/ruby/0005-Mark-Gemspec-reproducible-change-fixing-784225-too.patch
+++ b/meta/recipes-devtools/ruby/ruby/0005-Mark-Gemspec-reproducible-change-fixing-784225-too.patch
@@ -1,4 +1,4 @@
-From 6e1dc610724a7aa8368cbcddf4bbe21cccc0f731 Mon Sep 17 00:00:00 2001
+From 3bc324379aa3e322bad9353da8c0064cd671cc74 Mon Sep 17 00:00:00 2001
 From: Lucas Kanashiro <kanashiro@debian.org>
 Date: Fri, 1 Nov 2019 15:25:17 -0300
 Subject: [PATCH] Make gemspecs reproducible
@@ -12,20 +12,20 @@ Upstream-Status: Backport [debian]
  1 file changed, 3 insertions(+), 1 deletion(-)
 
 diff --git a/lib/rubygems/specification.rb b/lib/rubygems/specification.rb
-index 0d72cee..eb7bc25 100644
+index a0c7faa..f0722d9 100644
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
+@@ -1774,7 +1774,9 @@ class Gem::Specification < Gem::BasicSpecification
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
+2.39.2
 
diff --git a/meta/recipes-devtools/ruby/ruby/0006-Make-gemspecs-reproducible.patch b/meta/recipes-devtools/ruby/ruby/0006-Make-gemspecs-reproducible.patch
index 0a87cae17f9..21604dfc349 100644
--- a/meta/recipes-devtools/ruby/ruby/0006-Make-gemspecs-reproducible.patch
+++ b/meta/recipes-devtools/ruby/ruby/0006-Make-gemspecs-reproducible.patch
@@ -1,4 +1,4 @@
-From 3f60710bc29c1b08e128314d40101e87b7d2c9a1 Mon Sep 17 00:00:00 2001
+From 1dc7ef09c3c567c4adb09ccfd97e0e59c58edb9f Mon Sep 17 00:00:00 2001
 From: Lucas Kanashiro <kanashiro@debian.org>
 Date: Fri, 1 Nov 2019 15:25:17 -0300
 Subject: [PATCH] Make gemspecs reproducible
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
diff --git a/meta/recipes-devtools/ruby/ruby/remove_has_include_macros.patch b/meta/recipes-devtools/ruby/ruby/remove_has_include_macros.patch
deleted file mode 100644
index b78e3db892e..00000000000
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
diff --git a/meta/recipes-devtools/ruby/ruby_3.2.2.bb b/meta/recipes-devtools/ruby/ruby_3.3.0.bb
similarity index 92%
rename from meta/recipes-devtools/ruby/ruby_3.2.2.bb
rename to meta/recipes-devtools/ruby/ruby_3.3.0.bb
index 481fe7c23d8..17eb6d73c2b 100644
--- a/meta/recipes-devtools/ruby/ruby_3.2.2.bb
+++ b/meta/recipes-devtools/ruby/ruby_3.3.0.bb
@@ -10,7 +10,7 @@ LICENSE = "Ruby | BSD-2-Clause | BSD-3-Clause | GPL-2.0-only | ISC | MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=5b8c87559868796979806100db3f3805 \
                     file://BSDL;md5=8b50bc6de8f586dc66790ba11d064d75 \
                     file://GPL;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
-                    file://LEGAL;md5=bcd74b47bbaf2051c5e49811a5faa97a \
+                    file://LEGAL;md5=81e6a4d81533b9263da4c3485a0ad883 \
                     "
 
 DEPENDS = "zlib openssl libyaml gdbm readline libffi"
@@ -21,16 +21,12 @@ SHRT_VER = "${@oe.utils.trim_version("${PV}", 2)}"
 SRC_URI = "http://cache.ruby-lang.org/pub/ruby/${SHRT_VER}/ruby-${PV}.tar.gz \
            file://0001-extmk-fix-cross-compilation-of-external-gems.patch \
            file://0002-Obey-LDFLAGS-for-the-link-of-libruby.patch \
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
            "
 UPSTREAM_CHECK_URI = "https://www.ruby-lang.org/en/downloads/"
 
@@ -51,7 +47,7 @@ do_configure:prepend() {
 
 DEPENDS:append:libc-musl = " libucontext"
 
-SRC_URI[sha256sum] = "96c57558871a6748de5bc9f274e93f4b5aad06cd8f37befa0e8d94e7b8a423bc"
+SRC_URI[sha256sum] = "96518814d9832bece92a85415a819d4893b307db5921ae1f0f751a9a89a56b7d"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG += "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"
-- 
2.39.2


