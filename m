Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D8A0C73C66
	for <webhook@archiver.kernel.org>; Tue, 17 Jun 2025 16:04:53 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web11.23247.1750176283857052070
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Jun 2025 09:04:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=atP6Wuk/;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.48, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-311e46d38ddso5326659a91.0
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Jun 2025 09:04:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1750176283; x=1750781083; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EyvHO4WVE8VzLY0sigxYQamP1PkQyknyRn3uEqsJUeM=;
        b=atP6Wuk/VzxS1kvrf+Q/8uDmQz2u4SFoquSPvS0qbNgZbbbKmHyTHfPW+MvmxdDzm7
         pepHfaRVhKBO4LoHCsMPYjBSufSVRsZE+zGqvK8ksgWtVh53dOKFPHVSACWn6VMe4hRM
         uCM//NoDowwuanGGMkMpzCiF1NNYjtWGoEgILlSbSM6Up/Cx4iEc0MQHbm3ZeQ6qXMeg
         RucTzcJPAH4s+ZlJ18WfCzGyFTgTLFG0ipsk7N9BPBjwg7xl68EGiBBA0cJvjz3jxavx
         yH2aRarPv/Akigp/ltl01jODGc06nz+WqFI7gkbT3PV4C0bjB7jaDQY4wz4XtsLQqPj7
         JNeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750176283; x=1750781083;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EyvHO4WVE8VzLY0sigxYQamP1PkQyknyRn3uEqsJUeM=;
        b=U+KcksRIrFYmYtyTbo+l7jqgIY2OJDcgg+Acw7jns4IoJuVOZHTixDmoaSL+RaD+pr
         6P+fTXNdHZ0zitj6I2am+OuPLQHPiTxUNRh6n5jgGhU/52UKPYfKOnr3RQvE67/BGooV
         4wOU1X4NVqlf8k5TQczVWTySsqPUf+bawqX05evQmODdckvmL+mBcEWR/ymYSdWYhsnM
         czqEbz89jR1Di9UXKUCYqHpO4Fz6MGCGp8pXEz7sWlSL1HcaO+aXQxFUebqxLqXGJeJ7
         LJnW6olMYe84lghaJc7mWevMcZOq8/NfjLSz2+EC70feVtpxvaD5BwpUouvVOnmFhJ8B
         3z3w==
X-Gm-Message-State: AOJu0YyljJ1aDLQc/oaS9QfIM0TOei3R8lgu2H3m7ONB3lQMkjKgyUcd
	EQEMWKwYLKGGRNfsaiVyeFwu5sXZ0TG3T3OH3o+LK3v2CkEaLeV5luv5HnrRQhF3RkAWyWT7Maw
	0fSKp
X-Gm-Gg: ASbGncvFQlJAgxIXrF1UcHE7cljdTj7nRp8GhZWoNZ4CAr7RyGD7qiWv3e2gM2zNKXi
	T+kWTKBm6rnkPBaxWqATjqgAMfuwZ3vW3eJGKXvBeM12PHck3nmEOUb9Ow81TuQx+STG0a7ss81
	+kBFHG+Cz64ZaZ7Mhgm4YmkdlBtEUB7OKtfkdh3iLctv/U78JMyvfQUtClQ4lsUedsK3Km9t+5t
	NVSjhqYlGxkD9aJLEzZrMAot/MthxfVTKTMmHMATvOv02AebFc54Zuvj7wd4HK6jqDqbYgHYi1R
	1TGVbZxI18FFHaxHRfiRPrP5qRW6kU3Dwu84rexeToCWvedluy0qWg==
X-Google-Smtp-Source: AGHT+IHlBhvz94f3YhtXwA67kHWjDieNfJNo53LXNgR9UEoJaE3aZ5UKFrwhUwDQ5h3ZIlHacV9CiQ==
X-Received: by 2002:a17:90b:4b4b:b0:2ff:58c7:a71f with SMTP id 98e67ed59e1d1-313f1e15230mr18165698a91.32.1750176282510;
        Tue, 17 Jun 2025 09:04:42 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:7ce4:2bd1:2434:c118])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365decaf71sm82043365ad.217.2025.06.17.09.04.41
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 09:04:42 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 5/8] gcc: Upgrade to GCC 13.4
Date: Tue, 17 Jun 2025 09:04:23 -0700
Message-ID: <7af83314fea5948937403b5d59ba5df6fecdd81a.1750176125.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1750176125.git.steve@sakoman.com>
References: <cover.1750176125.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Jun 2025 16:04:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218906

From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>

This is a bugfix release in GCC13 release series
100+ bugfixes

https://gcc.gnu.org/bugzilla/buglist.cgi?bug_status=RESOLVED&resolution=FIXED&target_milestone=13.4

Dropped the following patches:

0028-gcc-Fix-c-tweak-for-Wrange-loop-construct.patch
https://github.com/gcc-mirror/gcc/commit/179dc0f0fe01012675c1b430591b9891ce96c26e

gcc.git-ab884fffe3fc82a710bea66ad651720d71c938b8.patch
https://github.com/gcc-mirror/gcc/commit/5ceea2ac106d6dd1aa8175670b15a801316cf1c9

                                 #GCC 13.3      #GCC 13.4       #Diff

No. of expected passes            148863         149440          +577
No. of unexpected failures        14             14              0
No. of expected failures          1415           1414            -1
No. of unresolved testcases       25384          25660           +276
No. of unsupported tests          2692           2689            -3

Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/conf/distro/include/maintainers.inc      |   2 +-
 .../gcc/{gcc-13.3.inc => gcc-13.4.inc}        |   8 +-
 ...ian_13.3.bb => gcc-cross-canadian_13.4.bb} |   0
 .../{gcc-cross_13.3.bb => gcc-cross_13.4.bb}  |   0
 ...-crosssdk_13.3.bb => gcc-crosssdk_13.4.bb} |   0
 ...cc-runtime_13.3.bb => gcc-runtime_13.4.bb} |   0
 ...itizers_13.3.bb => gcc-sanitizers_13.4.bb} |   0
 ...{gcc-source_13.3.bb => gcc-source_13.4.bb} |   0
 ...ix-c-tweak-for-Wrange-loop-construct.patch | 113 ----
 ...4fffe3fc82a710bea66ad651720d71c938b8.patch | 549 ------------------
 .../gcc/{gcc_13.3.bb => gcc_13.4.bb}          |   0
 ...initial_13.3.bb => libgcc-initial_13.4.bb} |   0
 .../gcc/{libgcc_13.3.bb => libgcc_13.4.bb}    |   0
 ...ibgfortran_13.3.bb => libgfortran_13.4.bb} |   0
 14 files changed, 4 insertions(+), 668 deletions(-)
 rename meta/recipes-devtools/gcc/{gcc-13.3.inc => gcc-13.4.inc} (94%)
 rename meta/recipes-devtools/gcc/{gcc-cross-canadian_13.3.bb => gcc-cross-canadian_13.4.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-cross_13.3.bb => gcc-cross_13.4.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-crosssdk_13.3.bb => gcc-crosssdk_13.4.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-runtime_13.3.bb => gcc-runtime_13.4.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-sanitizers_13.3.bb => gcc-sanitizers_13.4.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-source_13.3.bb => gcc-source_13.4.bb} (100%)
 delete mode 100644 meta/recipes-devtools/gcc/gcc/0028-gcc-Fix-c-tweak-for-Wrange-loop-construct.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc/gcc.git-ab884fffe3fc82a710bea66ad651720d71c938b8.patch
 rename meta/recipes-devtools/gcc/{gcc_13.3.bb => gcc_13.4.bb} (100%)
 rename meta/recipes-devtools/gcc/{libgcc-initial_13.3.bb => libgcc-initial_13.4.bb} (100%)
 rename meta/recipes-devtools/gcc/{libgcc_13.3.bb => libgcc_13.4.bb} (100%)
 rename meta/recipes-devtools/gcc/{libgfortran_13.3.bb => libgfortran_13.4.bb} (100%)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 9548fcd258..3a51ad2139 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -190,7 +190,7 @@ RECIPE_MAINTAINER:pn-gcc-cross-canadian-${TRANSLATED_TARGET_ARCH} = "Khem Raj <r
 RECIPE_MAINTAINER:pn-gcc-crosssdk-${SDK_SYS} = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-gcc-runtime = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-gcc-sanitizers = "Khem Raj <raj.khem@gmail.com>"
-RECIPE_MAINTAINER:pn-gcc-source-13.3.0 = "Khem Raj <raj.khem@gmail.com>"
+RECIPE_MAINTAINER:pn-gcc-source-13.4.0 = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-gconf = "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER:pn-gcr = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER:pn-gdb = "Khem Raj <raj.khem@gmail.com>"
diff --git a/meta/recipes-devtools/gcc/gcc-13.3.inc b/meta/recipes-devtools/gcc/gcc-13.4.inc
similarity index 94%
rename from meta/recipes-devtools/gcc/gcc-13.3.inc
rename to meta/recipes-devtools/gcc/gcc-13.4.inc
index 8b6c2a5938..eefae13530 100644
--- a/meta/recipes-devtools/gcc/gcc-13.3.inc
+++ b/meta/recipes-devtools/gcc/gcc-13.4.inc
@@ -2,11 +2,11 @@ require gcc-common.inc
 
 # Third digit in PV should be incremented after a minor release
 
-PV = "13.3.0"
+PV = "13.4.0"
 
 # BINV should be incremented to a revision after a minor gcc release
 
-BINV = "13.3.0"
+BINV = "13.4.0"
 
 FILESEXTRAPATHS =. "${FILE_DIRNAME}/gcc:${FILE_DIRNAME}/gcc/backport:"
 
@@ -66,10 +66,8 @@ SRC_URI = "${BASEURI} \
            file://0024-Avoid-hardcoded-build-paths-into-ppc-libgcc.patch \
            file://0025-gcc-testsuite-tweaks-for-mips-OE.patch \
            file://0027-Fix-gcc-vect-module-testcases.patch \
-	   file://0028-gcc-Fix-c-tweak-for-Wrange-loop-construct.patch \
-           file://gcc.git-ab884fffe3fc82a710bea66ad651720d71c938b8.patch \
 "
-SRC_URI[sha256sum] = "0845e9621c9543a13f484e94584a49ffc0129970e9914624235fc1d061a0c083"
+SRC_URI[sha256sum] = "9c4ce6dbb040568fdc545588ac03c5cbc95a8dbf0c7aa490170843afb59ca8f5"
 
 S = "${TMPDIR}/work-shared/gcc-${PV}-${PR}/${SOURCEDIR}"
 B = "${WORKDIR}/gcc-${PV}/build.${HOST_SYS}.${TARGET_SYS}"
diff --git a/meta/recipes-devtools/gcc/gcc-cross-canadian_13.3.bb b/meta/recipes-devtools/gcc/gcc-cross-canadian_13.4.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-cross-canadian_13.3.bb
rename to meta/recipes-devtools/gcc/gcc-cross-canadian_13.4.bb
diff --git a/meta/recipes-devtools/gcc/gcc-cross_13.3.bb b/meta/recipes-devtools/gcc/gcc-cross_13.4.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-cross_13.3.bb
rename to meta/recipes-devtools/gcc/gcc-cross_13.4.bb
diff --git a/meta/recipes-devtools/gcc/gcc-crosssdk_13.3.bb b/meta/recipes-devtools/gcc/gcc-crosssdk_13.4.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-crosssdk_13.3.bb
rename to meta/recipes-devtools/gcc/gcc-crosssdk_13.4.bb
diff --git a/meta/recipes-devtools/gcc/gcc-runtime_13.3.bb b/meta/recipes-devtools/gcc/gcc-runtime_13.4.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-runtime_13.3.bb
rename to meta/recipes-devtools/gcc/gcc-runtime_13.4.bb
diff --git a/meta/recipes-devtools/gcc/gcc-sanitizers_13.3.bb b/meta/recipes-devtools/gcc/gcc-sanitizers_13.4.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-sanitizers_13.3.bb
rename to meta/recipes-devtools/gcc/gcc-sanitizers_13.4.bb
diff --git a/meta/recipes-devtools/gcc/gcc-source_13.3.bb b/meta/recipes-devtools/gcc/gcc-source_13.4.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-source_13.3.bb
rename to meta/recipes-devtools/gcc/gcc-source_13.4.bb
diff --git a/meta/recipes-devtools/gcc/gcc/0028-gcc-Fix-c-tweak-for-Wrange-loop-construct.patch b/meta/recipes-devtools/gcc/gcc/0028-gcc-Fix-c-tweak-for-Wrange-loop-construct.patch
deleted file mode 100644
index 745b38f7f1..0000000000
--- a/meta/recipes-devtools/gcc/gcc/0028-gcc-Fix-c-tweak-for-Wrange-loop-construct.patch
+++ /dev/null
@@ -1,113 +0,0 @@
-From 66aa69e2add2b8641a652768b0eac30f00427145 Mon Sep 17 00:00:00 2001
-From: Sunil Dora <sunilkumar.dora@windriver.com>
-Date: Wed, 11 Dec 2024 09:48:16 -0800
-Subject: [PATCH] gcc: Fix c++: tweak for Wrange-loop-construct
-
-This commit updates the warning to use a check for "trivially constructible" instead of
-"trivially copyable." The original check was incorrect, as "trivially copyable" only applies
-to types that can be copied trivially, whereas "trivially constructible" is the correct check
-for types that can be trivially default-constructed.
-
-This change ensures the warning is more accurate and aligns with the proper type traits.
-
-LLVM accepted a similar fix:
-https://github.com/llvm/llvm-project/issues/47355
-
-PR c++/116731 [https://gcc.gnu.org/bugzilla/show_bug.cgi?id=116731]
-
-Upstream-Status: Backport [https://gcc.gnu.org/g:179dc0f0fe01012675c1b430591b9891ce96c26e]
-
-Signed-off-by: Marek Polacek <polacek@redhat.com>
-Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
----
- gcc/cp/parser.cc                              |  7 ++-
- .../g++.dg/warn/Wrange-loop-construct3.C      | 57 +++++++++++++++++++
- 2 files changed, 61 insertions(+), 3 deletions(-)
- create mode 100644 gcc/testsuite/g++.dg/warn/Wrange-loop-construct3.C
-
-diff --git a/gcc/cp/parser.cc b/gcc/cp/parser.cc
-index 4e67da6ff..5dd94357d 100644
---- a/gcc/cp/parser.cc
-+++ b/gcc/cp/parser.cc
-@@ -13854,11 +13854,12 @@ warn_for_range_copy (tree decl, tree expr)
-   else if (!CP_TYPE_CONST_P (type))
-     return;
- 
--  /* Since small trivially copyable types are cheap to copy, we suppress the
--     warning for them.  64B is a common size of a cache line.  */
-+  /* Since small trivially constructible types are cheap to construct, we
-+     suppress the warning for them.  64B is a common size of a cache line.  */
-+  tree list = build_tree_list (NULL_TREE, TREE_TYPE (expr));
-   if (TREE_CODE (TYPE_SIZE_UNIT (type)) != INTEGER_CST
-       || (tree_to_uhwi (TYPE_SIZE_UNIT (type)) <= 64
--	  && trivially_copyable_p (type)))
-+	  && is_trivially_xible (INIT_EXPR, type, list)))
-     return;
- 
-   /* If we can initialize a reference directly, suggest that to avoid the
-diff --git a/gcc/testsuite/g++.dg/warn/Wrange-loop-construct3.C b/gcc/testsuite/g++.dg/warn/Wrange-loop-construct3.C
-new file mode 100644
-index 000000000..3d9d0c908
---- /dev/null
-+++ b/gcc/testsuite/g++.dg/warn/Wrange-loop-construct3.C
-@@ -0,0 +1,57 @@
-+// PR c++/116731
-+// { dg-do compile { target c++11 } }
-+// { dg-options "-Wrange-loop-construct" }
-+
-+void
-+f0 ()
-+{
-+  struct S {
-+    char a[64];
-+    S& operator=(const S&) { return *this; };
-+  };
-+
-+  S arr[8];
-+  for (const auto r : arr)
-+    (void) r;
-+}
-+
-+void
-+f1 ()
-+{
-+  struct S {
-+    char a[65];
-+    S& operator=(const S&) { return *this; };
-+  };
-+
-+  S arr[8];
-+  for (const auto r : arr) // { dg-warning "creates a copy" }
-+    (void) r;
-+}
-+
-+void
-+f2 ()
-+{
-+  struct S {
-+    char a[64];
-+    S& operator=(const S&) { return *this; };
-+    ~S() { }
-+  };
-+
-+  S arr[8];
-+  for (const auto r : arr) // { dg-warning "creates a copy" }
-+    (void) r;
-+}
-+
-+void
-+f3 ()
-+{
-+  struct S {
-+    char a[65];
-+    S& operator=(const S&) { return *this; };
-+    ~S() { }
-+  };
-+
-+  S arr[8];
-+  for (const auto r : arr) // { dg-warning "creates a copy" }
-+    (void) r;
-+}
--- 
-2.43.0
-
diff --git a/meta/recipes-devtools/gcc/gcc/gcc.git-ab884fffe3fc82a710bea66ad651720d71c938b8.patch b/meta/recipes-devtools/gcc/gcc/gcc.git-ab884fffe3fc82a710bea66ad651720d71c938b8.patch
deleted file mode 100644
index e5abdcc703..0000000000
--- a/meta/recipes-devtools/gcc/gcc/gcc.git-ab884fffe3fc82a710bea66ad651720d71c938b8.patch
+++ /dev/null
@@ -1,549 +0,0 @@
-From ab884fffe3fc82a710bea66ad651720d71c938b8 Mon Sep 17 00:00:00 2001
-From: Jonathan Wakely <jwakely@redhat.com>
-Date: Tue, 30 Apr 2024 09:52:13 +0100
-Subject: [PATCH] libstdc++: Fix std::chrono::tzdb to work with vanguard format
-
-I found some issues in the std::chrono::tzdb parser by testing the
-tzdata "vanguard" format, which uses new features that aren't enabled in
-the "main" and "rearguard" data formats.
-
-Since 2024a the keyword "minimum" is no longer valid for the FROM and TO
-fields in a Rule line, which means that "m" is now a valid abbreviation
-for "maximum". Previously we expected either "mi" or "ma". For backwards
-compatibility, a FROM field beginning with "mi" is still supported and
-is treated as 1900. The "maximum" keyword is only allowed in TO now,
-because it makes no sense in FROM. To support these changes the
-minmax_year and minmax_year2 classes for parsing FROM and TO are
-replaced with a single years_from_to class that reads both fields.
-
-The vanguard format makes use of %z in Zone FORMAT fields, which caused
-an exception to be thrown from ZoneInfo::set_abbrev because no % or /
-characters were expected when a Zone doesn't use a named Rule. The
-ZoneInfo::to(sys_info&) function now uses format_abbrev_str to replace
-any %z with the current offset. Although format_abbrev_str also checks
-for %s and STD/DST formats, those only make sense when a named Rule is
-in effect, so won't occur when ZoneInfo::to(sys_info&) is used.
-
-Since making this change on trunk, the tzdata-2024b release started
-using %z in the main format, not just vanguard. This makes a backport to
-release branches necessary (see PR 116657).
-
-This change also implements a feature that has always been missing from
-time_zone::_M_get_sys_info: finding the Rule that is active before the
-specified time point, so that we can correctly handle %s in the FORMAT
-for the first new sys_info that gets created. This requires implementing
-a poorly documented feature of zic, to get the LETTERS field from a
-later transition, as described at
-https://mm.icann.org/pipermail/tz/2024-April/058891.html
-In order for this to work we need to be able to distinguish an empty
-letters field (as used by CE%sT where the variable part is either empty
-or "S") from "the letters field is not known for this transition". The
-tzdata file uses "-" for an empty letters field, which libstdc++ was
-previously replacing with "" when the Rule was parsed. Instead, we now
-preserve the "-" in the Rule object, so that "" can be used for the case
-where we don't know the letters (and so need to decide it).
-
-(cherry picked from commit 0ca8d56f2085715f27ee536c6c344bc47af49cdd)
-
-Upstream-Status: Backport [https://gcc.gnu.org/git/gitweb.cgi?p=gcc.git;h=5ceea2ac106d6dd1aa8175670b15a801316cf1c9]
-
-Signed-off-by: Markus Volk <f_l_k@t-online.de>
----
- libstdc++-v3/src/c++20/tzdb.cc                | 265 +++++++++++-------
- .../std/time/time_zone/sys_info_abbrev.cc     | 106 +++++++
- libstdc++-v3/testsuite/std/time/tzdb/1.cc     |   6 +-
- 3 files changed, 274 insertions(+), 103 deletions(-)
- create mode 100644 libstdc++-v3/testsuite/std/time/time_zone/sys_info_abbrev.cc
-
-diff --git a/libstdc++-v3/src/c++20/tzdb.cc b/libstdc++-v3/src/c++20/tzdb.cc
-index c7c7cc9deee6..7e8cce7ce8cf 100644
---- a/libstdc++-v3/src/c++20/tzdb.cc
-+++ b/libstdc++-v3/src/c++20/tzdb.cc
-@@ -342,51 +342,103 @@ namespace std::chrono
-       friend istream& operator>>(istream&, on_day&);
-     };
- 
--    // Wrapper for chrono::year that reads a year, or one of the keywords
--    // "minimum" or "maximum", or an unambiguous prefix of a keyword.
--    struct minmax_year
-+    // Wrapper for two chrono::year values, which reads the FROM and TO
-+    // fields of a Rule line. The FROM field is a year and TO is a year or
-+    // one of the keywords "maximum" or "only" (or an abbreviation of those).
-+    // For backwards compatibility, the keyword "minimum" is recognized
-+    // for FROM and interpreted as 1900.
-+    struct years_from_to
-     {
--      year& y;
-+      year& from;
-+      year& to;
- 
--      friend istream& operator>>(istream& in, minmax_year&& y)
-+      friend istream& operator>>(istream& in, years_from_to&& yy)
-       {
--	if (ws(in).peek() == 'm') // keywords "minimum" or "maximum"
-+	string s;
-+	auto c = ws(in).peek();
-+	if (c == 'm') [[unlikely]] // keyword "minimum"
- 	  {
--	    string s;
--	    in >> s; // extract the rest of the word, but only look at s[1]
--	    if (s[1] == 'a')
--	      y.y = year::max();
--	    else if (s[1] == 'i')
--	      y.y = year::min();
--	    else
--	      in.setstate(ios::failbit);
-+	    in >> s; // extract the rest of the word
-+	    yy.from = year(1900);
-+	  }
-+	else if (int num = 0; in >> num) [[likely]]
-+	  yy.from = year{num};
-+
-+	c = ws(in).peek();
-+	if (c == 'm') // keyword "maximum"
-+	  {
-+	    in >> s; // extract the rest of the word
-+	    yy.to = year::max();
-+	  }
-+	else if (c == 'o') // keyword "only"
-+	  {
-+	    in >> s; // extract the rest of the word
-+	    yy.to = yy.from;
- 	  }
- 	else if (int num = 0; in >> num)
--	  y.y = year{num};
-+	  yy.to = year{num};
-+
- 	return in;
-       }
-     };
- 
--    // As above for minmax_year, but also supports the keyword "only",
--    // meaning that the TO year is the same as the FROM year.
--    struct minmax_year2
-+    bool
-+    select_std_or_dst_abbrev(string& abbrev, minutes save)
-     {
--      minmax_year to;
--      year from;
-+      if (size_t pos = abbrev.find('/'); pos != string::npos)
-+	{
-+	  // Select one of "STD/DST" for standard or daylight.
-+	  if (save == 0min)
-+	    abbrev.erase(pos);
-+	  else
-+	    abbrev.erase(0, pos + 1);
-+	  return true;
-+	}
-+      return false;
-+    }
- 
--      friend istream& operator>>(istream& in, minmax_year2&& y)
--      {
--	if (ws(in).peek() == 'o') // keyword "only"
--	  {
--	    string s;
--	    in >> s; // extract the whole keyword
--	    y.to.y = y.from;
--	  }
--	else
--	  in >> std::move(y.to);
--	return in;
--      }
--    };
-+    // Set the sys_info::abbrev string by expanding any placeholders.
-+    void
-+    format_abbrev_str(sys_info& info, string_view letters = {})
-+    {
-+      if (size_t pos = info.abbrev.find('%'); pos != string::npos)
-+	{
-+	  if (info.abbrev[pos + 1] == 's')
-+	    {
-+	      // Expand "%s" to the variable part, given by Rule::letters.
-+	      if (letters == "-")
-+		info.abbrev.erase(pos, 2);
-+	      else
-+		info.abbrev.replace(pos, 2, letters);
-+	    }
-+	  else if (info.abbrev[pos + 1] == 'z')
-+	    {
-+	      // Expand "%z" to the UT offset as +/-hh, +/-hhmm, or +/-hhmmss.
-+	      hh_mm_ss<seconds> t(info.offset);
-+	      string z(1, "+-"[t.is_negative()]);
-+	      long val = t.hours().count();
-+	      int digits = 2;
-+	      if (int m = t.minutes().count())
-+		{
-+		  digits = 4;
-+		  val *= 100;
-+		  val += m;
-+		  if (int s = t.seconds().count())
-+		    {
-+		      digits = 6;
-+		      val *= 100;
-+		      val += s;
-+		    }
-+		}
-+	      auto sval = std::to_string(val);
-+	      z += string(digits - sval.size(), '0');
-+	      z += sval;
-+	      info.abbrev.replace(pos, 2, z);
-+	    }
-+	}
-+      else
-+	select_std_or_dst_abbrev(info.abbrev, info.save);
-+    }
- 
-     // A time zone information record.
-     // Zone  NAME        STDOFF  RULES   FORMAT  [UNTIL]
-@@ -462,6 +514,7 @@ namespace std::chrono
- 	info.offset = offset();
- 	info.save = minutes(m_save);
- 	info.abbrev = format();
-+	format_abbrev_str(info); // expand %z
- 	return true;
-       }
- 
-@@ -469,12 +522,9 @@ namespace std::chrono
-       friend class time_zone;
- 
-       void
--      set_abbrev(const string& abbrev)
-+      set_abbrev(string abbrev)
-       {
--	// In practice, the FORMAT field never needs expanding here.
--	if (abbrev.find_first_of("/%") != abbrev.npos)
--	  __throw_runtime_error("std::chrono::time_zone: invalid data");
--	m_buf = abbrev;
-+	m_buf = std::move(abbrev);
- 	m_pos = 0;
- 	m_expanded = true;
-       }
-@@ -544,9 +594,7 @@ namespace std::chrono
- 
- 	// Rule  NAME  FROM  TO  TYPE  IN  ON  AT  SAVE  LETTER/S
- 
--	in >> quoted(rule.name)
--	   >> minmax_year{rule.from}
--	   >> minmax_year2{rule.to, rule.from};
-+	in >> quoted(rule.name) >> years_from_to{rule.from, rule.to};
- 
- 	if (char type; in >> type && type != '-')
- 	  in.setstate(ios::failbit);
-@@ -557,7 +605,7 @@ namespace std::chrono
- 	if (save_time.indicator != at_time::Wall)
- 	  {
- 	    // We don't actually store the save_time.indicator, because we
--	    // assume that it's always deducable from the actual offset value.
-+	    // assume that it's always deducible from the offset value.
- 	    auto expected = save_time.time == 0s
- 			      ? at_time::Standard
- 			      : at_time::Daylight;
-@@ -567,8 +615,6 @@ namespace std::chrono
- 	rule.save = save_time.time;
- 
- 	in >> rule.letters;
--	if (rule.letters == "-")
--	  rule.letters.clear();
- 	return in;
-       }
- 
-@@ -719,58 +765,6 @@ namespace std::chrono
- #endif // TZDB_DISABLED
-   };
- 
--#ifndef TZDB_DISABLED
--  namespace
--  {
--    bool
--    select_std_or_dst_abbrev(string& abbrev, minutes save)
--    {
--      if (size_t pos = abbrev.find('/'); pos != string::npos)
--	{
--	  // Select one of "STD/DST" for standard or daylight.
--	  if (save == 0min)
--	    abbrev.erase(pos);
--	  else
--	    abbrev.erase(0, pos + 1);
--	  return true;
--	}
--      return false;
--    }
--
--    // Set the sys_info::abbrev string by expanding any placeholders.
--    void
--    format_abbrev_str(sys_info& info, string_view letters = {})
--    {
--      if (size_t pos = info.abbrev.find("%s"); pos != string::npos)
--	{
--	  // Expand "%s" to the variable part, given by Rule::letters.
--	  info.abbrev.replace(pos, 2, letters);
--	}
--      else if (size_t pos = info.abbrev.find("%z"); pos != string::npos)
--	{
--	  // Expand "%z" to the UT offset as +/-hh, +/-hhmm, or +/-hhmmss.
--	  hh_mm_ss<seconds> t(info.offset);
--	  string z(1, "+-"[t.is_negative()]);
--	  long val = t.hours().count();
--	  if (minutes m = t.minutes(); m != m.zero())
--	    {
--	      val *= 100;
--	      val += m.count();
--	      if (seconds s = t.seconds(); s != s.zero())
--		{
--		  val *= 100;
--		  val += s.count();
--		}
--	    }
--	  z += std::to_string(val);
--	  info.abbrev.replace(pos, 2, z);
--	}
--      else
--	select_std_or_dst_abbrev(info.abbrev, info.save);
--    }
--  }
--#endif // TZDB_DISABLED
--
-   // Implementation of std::chrono::time_zone::get_info(const sys_time<D>&)
-   sys_info
-   time_zone::_M_get_sys_info(sys_seconds tp) const
-@@ -839,12 +833,72 @@ namespace std::chrono
-     info.abbrev = ri.format();
- 
-     string_view letters;
--    if (i != infos.begin())
-+    if (i != infos.begin() && i[-1].expanded())
-+      letters = i[-1].next_letters();
-+
-+    if (letters.empty())
-       {
--	if (i[-1].expanded())
--	  letters = i[-1].next_letters();
--	// XXX else need to find Rule active before this time and use it
--	// to know the initial offset, save, and letters.
-+	sys_seconds t = info.begin - seconds(1);
-+	const year_month_day date(chrono::floor<days>(t));
-+
-+	// Try to find a Rule active before this time, to get initial
-+	// SAVE and LETTERS values. There may not be a Rule for the period
-+	// before the first DST transition, so find the earliest DST->STD
-+	// transition and use the LETTERS from that.
-+	const Rule* active_rule = nullptr;
-+	sys_seconds active_rule_start = sys_seconds::min();
-+	const Rule* first_std = nullptr;
-+	for (const auto& rule : rules)
-+	  {
-+	    if (rule.save == minutes(0))
-+	      {
-+		if (!first_std)
-+		  first_std = &rule;
-+		else if (rule.from < first_std->from)
-+		  first_std = &rule;
-+		else if (rule.from == first_std->from)
-+		  {
-+		    if (rule.start_time(rule.from, {})
-+			  < first_std->start_time(first_std->from, {}))
-+		      first_std = &rule;
-+		  }
-+	      }
-+
-+	    year y = date.year();
-+
-+	    if (y > rule.to) // rule no longer applies at time t
-+	      continue;
-+	    if (y < rule.from) // rule doesn't apply yet at time t
-+	      continue;
-+
-+	    sys_seconds rule_start;
-+
-+	    seconds offset{}; // appropriate for at_time::Universal
-+	    if (rule.when.indicator == at_time::Wall)
-+	      offset = info.offset;
-+	    else if (rule.when.indicator == at_time::Standard)
-+	      offset = ri.offset();
-+
-+	    // Time the rule takes effect this year:
-+	    rule_start = rule.start_time(y, offset);
-+
-+	    if (rule_start >= t && rule.from < y)
-+	      {
-+		// Try this rule in the previous year.
-+		rule_start = rule.start_time(--y, offset);
-+	      }
-+
-+	    if (active_rule_start < rule_start && rule_start < t)
-+	      {
-+		active_rule_start = rule_start;
-+		active_rule = &rule;
-+	      }
-+	  }
-+
-+	if (active_rule)
-+	  letters = active_rule->letters;
-+	else if (first_std)
-+	  letters = first_std->letters;
-       }
- 
-     const Rule* curr_rule = nullptr;
-@@ -2069,9 +2123,11 @@ namespace std::chrono
- 	      istringstream in2(std::move(rules));
- 	      in2 >> rules_time;
- 	      inf.m_save = duration_cast<minutes>(rules_time.time);
-+	      // If the FORMAT is "STD/DST" then we can choose the right one
-+	      // now, so that we store a shorter string.
- 	      select_std_or_dst_abbrev(fmt, inf.m_save);
- 	    }
--	  inf.set_abbrev(fmt);
-+	  inf.set_abbrev(std::move(fmt));
- 	}
- 
-       // YEAR [MONTH [DAY [TIME]]]
-@@ -2082,7 +2138,12 @@ namespace std::chrono
- 	  abbrev_month m{January};
- 	  int d = 1;
- 	  at_time t{};
-+	  // XXX DAY should support ON format, e.g. lastSun or Sun>=8
- 	  in >> m >> d >> t;
-+	  // XXX UNTIL field should be interpreted
-+	  // "using the rules in effect just before the transition"
-+	  // so might need to store as year_month_day and hh_mm_ss and only
-+	  // convert to a sys_time once we know the offset in effect.
- 	  inf.m_until = sys_days(year(y)/m.m/day(d)) + seconds(t.time);
- 	}
-       else
-diff --git a/libstdc++-v3/testsuite/std/time/time_zone/sys_info_abbrev.cc b/libstdc++-v3/testsuite/std/time/time_zone/sys_info_abbrev.cc
-new file mode 100644
-index 000000000000..f1a8fff02f58
---- /dev/null
-+++ b/libstdc++-v3/testsuite/std/time/time_zone/sys_info_abbrev.cc
-@@ -0,0 +1,106 @@
-+// { dg-do run { target c++20 } }
-+// { dg-require-effective-target tzdb }
-+// { dg-require-effective-target cxx11_abi }
-+// { dg-xfail-run-if "no weak override on AIX" { powerpc-ibm-aix* } }
-+
-+#include <chrono>
-+#include <fstream>
-+#include <testsuite_hooks.h>
-+
-+static bool override_used = false;
-+
-+namespace __gnu_cxx
-+{
-+  const char* zoneinfo_dir_override() {
-+    override_used = true;
-+    return "./";
-+  }
-+}
-+
-+using namespace std::chrono;
-+
-+void
-+test_format()
-+{
-+  std::ofstream("tzdata.zi") << R"(# version test_1
-+Zone Africa/Bissau -1:2:20 - LMT 1912 Ja 1 1u
-+                   -1      - %z  1975
-+                   0       - GMT
-+Zon Some/Zone 1:2:3   - %z 1900
-+              1:23:45 - %z 1950
-+Zo Another/Zone 1:2:3 -     AZ0     1901
-+                1     Roolz A%sZ    2000
-+                1     Roolz SAZ/DAZ 2005
-+                1     Roolz %z
-+Rule Roolz 1950 max - April 1 2 1 D
-+Rul  Roolz 1950 max - Oct   1 1 0 S
-+Z Strange/Zone 1       - X%sX    1980
-+               1       - FOO/BAR 1990
-+               2:00    - %zzz    1995
-+               0:9     - %zzz    1996
-+               0:8:7   - %zzz    1997
-+               0:6:5.5 - %zzz    1998
-+)";
-+
-+  const auto& db = reload_tzdb();
-+  VERIFY( override_used ); // If this fails then XFAIL for the target.
-+  VERIFY( db.version == "test_1" );
-+
-+  // Test formatting %z as
-+  auto tz = locate_zone("Africa/Bissau");
-+  auto inf = tz->get_info(sys_days(1974y/1/1));
-+  VERIFY( inf.abbrev == "-01" );
-+
-+  tz = locate_zone("Some/Zone");
-+  inf = tz->get_info(sys_days(1899y/1/1));
-+  VERIFY( inf.abbrev == "+010203" );
-+  inf = tz->get_info(sys_days(1955y/1/1));
-+  VERIFY( inf.abbrev == "+012345" );
-+
-+  tz = locate_zone("Another/Zone");
-+  // Test formatting %s as the LETTER/S field from the active Rule.
-+  inf = tz->get_info(sys_days(1910y/January/1));
-+  VERIFY( inf.abbrev == "ASZ" );
-+  inf = tz->get_info(sys_days(1950y/January/1));
-+  VERIFY( inf.abbrev == "ASZ" );
-+  inf = tz->get_info(sys_days(1950y/June/1));
-+  VERIFY( inf.abbrev == "ADZ" );
-+  inf = tz->get_info(sys_days(1999y/January/1));
-+  VERIFY( inf.abbrev == "ASZ" );
-+  inf = tz->get_info(sys_days(1999y/July/1));
-+  VERIFY( inf.abbrev == "ADZ" );
-+  // Test formatting STD/DST according to the active Rule.
-+  inf = tz->get_info(sys_days(2000y/January/2));
-+  VERIFY( inf.abbrev == "SAZ" );
-+  inf = tz->get_info(sys_days(2001y/January/1));
-+  VERIFY( inf.abbrev == "SAZ" );
-+  inf = tz->get_info(sys_days(2001y/July/1));
-+  VERIFY( inf.abbrev == "DAZ" );
-+  // Test formatting %z as the offset determined by the active Rule.
-+  inf = tz->get_info(sys_days(2005y/January/2));
-+  VERIFY( inf.abbrev == "+01" );
-+  inf = tz->get_info(sys_days(2006y/January/1));
-+  VERIFY( inf.abbrev == "+01" );
-+  inf = tz->get_info(sys_days(2006y/July/1));
-+  VERIFY( inf.abbrev == "+02" );
-+
-+  // Test formatting %z, %s and S/D for a Zone with no associated Rules.
-+  tz = locate_zone("Strange/Zone");
-+  inf = tz->get_info(sys_days(1979y/January/1));
-+  VERIFY( inf.abbrev == "XX" ); // No Rule means nothing to use for %s.
-+  inf = tz->get_info(sys_days(1981y/July/1));
-+  VERIFY( inf.abbrev == "FOO" ); // Always standard time means first string.
-+  inf = tz->get_info(sys_days(1994y/July/1));
-+  VERIFY( inf.abbrev == "+02zz" );
-+  inf = tz->get_info(sys_days(1995y/July/1));
-+  VERIFY( inf.abbrev == "+0009zz" );
-+  inf = tz->get_info(sys_days(1996y/July/1));
-+  VERIFY( inf.abbrev == "+000807zz" );
-+  inf = tz->get_info(sys_days(1997y/July/1));
-+  VERIFY( inf.abbrev == "+000606zz" );
-+}
-+
-+int main()
-+{
-+  test_format();
-+}
-diff --git a/libstdc++-v3/testsuite/std/time/tzdb/1.cc b/libstdc++-v3/testsuite/std/time/tzdb/1.cc
-index 796f3a8b4256..7a31c1c20ba7 100644
---- a/libstdc++-v3/testsuite/std/time/tzdb/1.cc
-+++ b/libstdc++-v3/testsuite/std/time/tzdb/1.cc
-@@ -39,11 +39,15 @@ test_locate()
-   const tzdb& db = get_tzdb();
-   const time_zone* tz = db.locate_zone("GMT");
-   VERIFY( tz != nullptr );
--  VERIFY( tz->name() == "Etc/GMT" );
-   VERIFY( tz == std::chrono::locate_zone("GMT") );
-   VERIFY( tz == db.locate_zone("Etc/GMT") );
-   VERIFY( tz == db.locate_zone("Etc/GMT+0") );
- 
-+  // Since 2022f GMT is now a Zone and Etc/GMT a link instead of vice versa,
-+  // but only when using the vanguard format. As of 2024a, the main and
-+  // rearguard formats still have Etc/GMT as a Zone and GMT as a link.
-+  VERIFY( tz->name() == "GMT" || tz->name() == "Etc/GMT" );
-+
-   VERIFY( db.locate_zone(db.current_zone()->name()) == db.current_zone() );
- }
- 
--- 
-2.43.5
-
diff --git a/meta/recipes-devtools/gcc/gcc_13.3.bb b/meta/recipes-devtools/gcc/gcc_13.4.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc_13.3.bb
rename to meta/recipes-devtools/gcc/gcc_13.4.bb
diff --git a/meta/recipes-devtools/gcc/libgcc-initial_13.3.bb b/meta/recipes-devtools/gcc/libgcc-initial_13.4.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/libgcc-initial_13.3.bb
rename to meta/recipes-devtools/gcc/libgcc-initial_13.4.bb
diff --git a/meta/recipes-devtools/gcc/libgcc_13.3.bb b/meta/recipes-devtools/gcc/libgcc_13.4.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/libgcc_13.3.bb
rename to meta/recipes-devtools/gcc/libgcc_13.4.bb
diff --git a/meta/recipes-devtools/gcc/libgfortran_13.3.bb b/meta/recipes-devtools/gcc/libgfortran_13.4.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/libgfortran_13.3.bb
rename to meta/recipes-devtools/gcc/libgfortran_13.4.bb
-- 
2.43.0


