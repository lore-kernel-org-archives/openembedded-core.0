Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 176ECE77197
	for <webhook@archiver.kernel.org>; Sat,  4 Jan 2025 13:46:37 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web10.18210.1735998390163430216
 for <openembedded-core@lists.openembedded.org>;
 Sat, 04 Jan 2025 05:46:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=AW1PEsZk;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.178, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-21a1e6fd923so147587025ad.1
        for <openembedded-core@lists.openembedded.org>; Sat, 04 Jan 2025 05:46:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1735998389; x=1736603189; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UTHQjDNVSPUlm0n3kj65lqnu7Q/ilUArhsm10LvW+RU=;
        b=AW1PEsZka9YbN6TRXYAnszQ1iHS752XLO94JRS5cNCgQD3t7hl1rkjuZcbDK/1eaLv
         zI3eJI3ZKw9rYFqJvfxl7lsfmo4ovtacfn5bkPCxqyw6YeyI0ppEj5FodKz1F7cRxZKs
         TV0E6EnVd2UKgX8fAv63zkk9aAuwMfwmvZCvGeghYLod8Kx1EWUHd9JpxFfZWEtiSe4M
         r311XwIQQDamN3cU/AZO9RcbI2bzCQzs3GBipC9l+Bg8Y8TzQUAPcH+dfYHByKOtyboU
         uy90pUwU8aA6u4BeAc78R02jeSu/2+EXPSFldUyxViNQ6GQW3x2ucCQ7JKA2VhWXT3Sw
         7Iwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735998389; x=1736603189;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UTHQjDNVSPUlm0n3kj65lqnu7Q/ilUArhsm10LvW+RU=;
        b=kYvVgs6lRh0yosMidSGkIhJ55cYbyS1KDUKMTp9XRHDRUC8pNT9ZXLyTuxneZ5gVBK
         sqG0+b4sTeIfMN7kDIOlFQDcbfEHZGeziyC9DYxvHjnbkfzs/7KtsDk99GEdAWvzCix+
         DH5rrc1213THYX+4pgHEQBcT+g7Myiw5bHP45pUzapV2B6LcI96qQWW26R1KSNqni++b
         /lcuX3hNlqZA9oyPMVMFh3XdFE6e73y4Og0CA7DHZ+D2WLglRZrCSBPbUCnxpwlD2Zln
         5H7UOV5b47oOtPpv4KbsUbe3QHJTqdgshUVtAZgUlTsBnD5+2DfHxNL1MT0LkiZmyW2o
         +fLQ==
X-Gm-Message-State: AOJu0YxYkjdIivx8jYlVd/YeDarSlVl1YiuJbMpzqShtXGYgeY4BFi3r
	afnruTprBxe96fWM+/KyreGdIHQiHML+58wuTsZrcoqDhD5osxV1/kFIKPRrB5kWHN4tgQX8J1s
	4
X-Gm-Gg: ASbGncvtN1Yo43yYe9kexJArxeecg4aVyFsAgJP+ZjrOfWaiPaNwThzTezwAvP0BTyL
	kKTDA+Xm86MVal7M5sOlNtDiMOLYLgyoqbDcWV/oW+BRIQwPv+TbdWavqdt2LNCFqg2qbqlCBxe
	SdaW0rDeprsPFO437YhnfTpixh1NBIsogaUULDa5lYLd+H5ax7nw+OP8mUI1PV5aJ/vZKg4s2DU
	JVd5ARC6Ll3Zv2uCbZKVVXaHJE9Zv89nzcBQtMxrC6fWA==
X-Google-Smtp-Source: AGHT+IGU57W16qnsQpRoJoilmr9UX5XH81kYnuKhJJO8J4fbMQProIXEw6zuOwayeyLez1ZgCeB3iA==
X-Received: by 2002:a17:903:2444:b0:215:4a4e:9260 with SMTP id d9443c01a7336-219e6ea1c34mr715186945ad.14.1735998389409;
        Sat, 04 Jan 2025 05:46:29 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f447882b09sm33498230a91.41.2025.01.04.05.46.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jan 2025 05:46:29 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][styhead 10/10] gcc: Fix c++: tweak for Wrange-loop-construct
Date: Sat,  4 Jan 2025 05:46:02 -0800
Message-ID: <8c4ed59f681118a72356de51b0dd33cd6edcf78f.1735998221.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1735998221.git.steve@sakoman.com>
References: <cover.1735998221.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 04 Jan 2025 13:46:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209405

From: Sunil Dora <sunilkumar.dora@windriver.com>

This commit updates the warning to use a check for "trivially constructible" instead of
"trivially copyable." The original check was incorrect, as "trivially copyable" only applies
to types that can be copied trivially, whereas "trivially constructible" is the correct check
for types that can be trivially default-constructed.

This change ensures the warning is more accurate and aligns with the proper type traits.

LLVM accepted a similar fix:
https://github.com/llvm/llvm-project/issues/47355

PR c++/116731 [https://gcc.gnu.org/bugzilla/show_bug.cgi?id=116731]

Signed-off-by: Marek Polacek <polacek@redhat.com>
Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/gcc/gcc-14.2.inc        |   1 +
 ...ix-c-tweak-for-Wrange-loop-construct.patch | 114 ++++++++++++++++++
 2 files changed, 115 insertions(+)
 create mode 100644 meta/recipes-devtools/gcc/gcc/0026-gcc-Fix-c-tweak-for-Wrange-loop-construct.patch

diff --git a/meta/recipes-devtools/gcc/gcc-14.2.inc b/meta/recipes-devtools/gcc/gcc-14.2.inc
index 9cfb246294..4f505bef68 100644
--- a/meta/recipes-devtools/gcc/gcc-14.2.inc
+++ b/meta/recipes-devtools/gcc/gcc-14.2.inc
@@ -68,6 +68,7 @@ SRC_URI = "${BASEURI} \
            file://0023-Fix-install-path-of-linux64.h.patch \
            file://0024-Avoid-hardcoded-build-paths-into-ppc-libgcc.patch \
            file://0025-gcc-testsuite-tweaks-for-mips-OE.patch \
+	   file://0026-gcc-Fix-c-tweak-for-Wrange-loop-construct.patch \
            file://gcc.git-ab884fffe3fc82a710bea66ad651720d71c938b8.patch \
 "
 
diff --git a/meta/recipes-devtools/gcc/gcc/0026-gcc-Fix-c-tweak-for-Wrange-loop-construct.patch b/meta/recipes-devtools/gcc/gcc/0026-gcc-Fix-c-tweak-for-Wrange-loop-construct.patch
new file mode 100644
index 0000000000..c9bc863eea
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc/0026-gcc-Fix-c-tweak-for-Wrange-loop-construct.patch
@@ -0,0 +1,114 @@
+From 05106fea707f010779369c5d6e89787953d2976f Mon Sep 17 00:00:00 2001
+From: Sunil Dora <sunilkumar.dora@windriver.com>
+Date: Wed, 11 Dec 2024 10:04:56 -0800
+Subject: [PATCH] gcc: Fix c++: tweak for Wrange-loop-construct
+
+This commit updates the warning to use a check for "trivially constructible" instead of
+"trivially copyable." The original check was incorrect, as "trivially copyable" only applies
+to types that can be copied trivially, whereas "trivially constructible" is the correct check
+for types that can be trivially default-constructed.
+
+This change ensures the warning is more accurate and aligns with the proper type traits.
+
+LLVM accepted a similar fix:
+https://github.com/llvm/llvm-project/issues/47355
+
+PR c++/116731 [https://gcc.gnu.org/bugzilla/show_bug.cgi?id=116731]
+
+Upstream-Status: Backport [https://gcc.gnu.org/g:6ac4e2f4b2ca9980670e7d3815a9140730df1005]
+
+Signed-off-by: Marek Polacek <polacek@redhat.com>
+Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
+---
+ gcc/cp/parser.cc                              |  8 ++-
+ .../g++.dg/warn/Wrange-loop-construct3.C      | 57 +++++++++++++++++++
+ 2 files changed, 62 insertions(+), 3 deletions(-)
+ create mode 100644 gcc/testsuite/g++.dg/warn/Wrange-loop-construct3.C
+
+diff --git a/gcc/cp/parser.cc b/gcc/cp/parser.cc
+index 7e81c1010..8206489a2 100644
+--- a/gcc/cp/parser.cc
++++ b/gcc/cp/parser.cc
+@@ -14301,11 +14301,13 @@ warn_for_range_copy (tree decl, tree expr)
+   else if (!CP_TYPE_CONST_P (type))
+     return;
+ 
+-  /* Since small trivially copyable types are cheap to copy, we suppress the
+-     warning for them.  64B is a common size of a cache line.  */
++  /* Since small trivially constructible types are cheap to construct, we 
++     suppress the warning for them.  64B is a common size of a cache line.  */
++  tree vec = make_tree_vec (1);
++  TREE_VEC_ELT (vec, 0) = TREE_TYPE (expr);
+   if (TREE_CODE (TYPE_SIZE_UNIT (type)) != INTEGER_CST
+       || (tree_to_uhwi (TYPE_SIZE_UNIT (type)) <= 64
+-	  && trivially_copyable_p (type)))
++	  && is_trivially_xible (INIT_EXPR, type, vec)))
+     return;
+ 
+   /* If we can initialize a reference directly, suggest that to avoid the
+diff --git a/gcc/testsuite/g++.dg/warn/Wrange-loop-construct3.C b/gcc/testsuite/g++.dg/warn/Wrange-loop-construct3.C
+new file mode 100644
+index 000000000..3d9d0c908
+--- /dev/null
++++ b/gcc/testsuite/g++.dg/warn/Wrange-loop-construct3.C
+@@ -0,0 +1,57 @@
++// PR c++/116731
++// { dg-do compile { target c++11 } }
++// { dg-options "-Wrange-loop-construct" }
++
++void
++f0 ()
++{
++  struct S {
++    char a[64];
++    S& operator=(const S&) { return *this; };
++  };
++
++  S arr[8];
++  for (const auto r : arr)
++    (void) r;
++}
++
++void
++f1 ()
++{
++  struct S {
++    char a[65];
++    S& operator=(const S&) { return *this; };
++  };
++
++  S arr[8];
++  for (const auto r : arr) // { dg-warning "creates a copy" }
++    (void) r;
++}
++
++void
++f2 ()
++{
++  struct S {
++    char a[64];
++    S& operator=(const S&) { return *this; };
++    ~S() { }
++  };
++
++  S arr[8];
++  for (const auto r : arr) // { dg-warning "creates a copy" }
++    (void) r;
++}
++
++void
++f3 ()
++{
++  struct S {
++    char a[65];
++    S& operator=(const S&) { return *this; };
++    ~S() { }
++  };
++
++  S arr[8];
++  for (const auto r : arr) // { dg-warning "creates a copy" }
++    (void) r;
++}
+-- 
+2.43.0
+
-- 
2.43.0


