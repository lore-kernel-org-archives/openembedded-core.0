Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03921C63798
	for <webhook@archiver.kernel.org>; Wed, 28 Aug 2024 19:41:45 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web11.5183.1724874099139449072
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Aug 2024 12:41:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=F2UGNgzz;
 spf=pass (domain: gmail.com, ip: 209.85.210.176, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-71433096e89so6063244b3a.3
        for <openembedded-core@lists.openembedded.org>; Wed, 28 Aug 2024 12:41:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724874098; x=1725478898; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=69C53ZFH9zily7FyJV6PC6aISsUG0b/fUcgc3lriLDw=;
        b=F2UGNgzzAWm4LDApAVrKEzGPaU+3H9oDpiaFpeIOOK1/6gNIURZ7MhMUpYbwydxPmg
         +YZBIwE5nPGE+Ez2QDWCeDviMauS9xGbVA/WbT5r+yCpGCw96Ted8XHCPGMoizFpTe26
         Eze4Q9dG3boB2PrF50PLNmSCnPLuQm7g/FbBRjxl6IKXFVKmkJP72OQVfphzoIlhzrDG
         x7Kih9xpshOZ8E/95H9IM1Y/MwiyA/yC/znOp6x5wYlggf+ZndAy6jwyrb8eJHU5aw7I
         bPOgC4YnWXV6HWIW9VrN5bTCdoM5vpQHKAD8OVtRl7zwlSLkbpou507fv8kh2YaQishc
         WAEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724874098; x=1725478898;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=69C53ZFH9zily7FyJV6PC6aISsUG0b/fUcgc3lriLDw=;
        b=LLH4mbCATLRyvEDEYnzeJnJRza15w0ml4zWcWq4Nv5OmXhpD0QNsNtAUL0tn/pDCWw
         sU/grMndhFvCPObyIskwLirlIkPVb0uA4I1hsHZ0muewbApY008PM5SOfV/cG4H2O8QW
         FJ6qB4NaNxukP9HWNY0s43OEfV3BA9YNyb0dnp8l0DHU1Bko6paKH6e5nmel+fCPCvXw
         2qfgJfU5hiFf3sAmeupum/nUJc6cFnqoasNFxrQUC8VbB718oxkZ0pRqveWhjSeGP/A4
         sV3eOppueaPtdOh833uDqU6YtvTzYa4nzDw5OJMEjq4CS1MWxCVftCcDUjLghy6vI15N
         SdqA==
X-Gm-Message-State: AOJu0Yz6TnVjoOz9dvdcb8npSjloIeBGPF+TCSChKZO959j3BcRkHi5e
	sv1INe9pjsttTcxlE+5HmppaSwCs+mnUnU8wx+FlblEvg8cTAdXMEwzjww==
X-Google-Smtp-Source: AGHT+IG496nAsvqyUyjYzSXk4mKRbh+jR0Wp8dVXZQ6niGlSnTCYiWgP3+6EOxN8blesq3o5TvZkAA==
X-Received: by 2002:a05:6a21:3a96:b0:1cc:d484:ac95 with SMTP id adf61e73a8af0-1cce0fed48cmr446373637.5.1724874097893;
        Wed, 28 Aug 2024 12:41:37 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:9d80:4380::2696])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71434fe94b0sm10414262b3a.103.2024.08.28.12.41.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Aug 2024 12:41:37 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] gdb: Fix build with latest clang
Date: Wed, 28 Aug 2024 12:41:32 -0700
Message-ID: <20240828194134.1658407-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Aug 2024 19:41:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203889

This patch is already proposed upstream and perhaps landing
soon in gdb master.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/gdb/gdb.inc             |   1 +
 ...constexpr-conversion-in-enum-flags.h.patch | 313 ++++++++++++++++++
 2 files changed, 314 insertions(+)
 create mode 100644 meta/recipes-devtools/gdb/gdb/0001-Fix-Wenum-constexpr-conversion-in-enum-flags.h.patch

diff --git a/meta/recipes-devtools/gdb/gdb.inc b/meta/recipes-devtools/gdb/gdb.inc
index 6fdf11d3944..6aa9dced869 100644
--- a/meta/recipes-devtools/gdb/gdb.inc
+++ b/meta/recipes-devtools/gdb/gdb.inc
@@ -12,5 +12,6 @@ SRC_URI = "${GNU_MIRROR}/gdb/gdb-${PV}.tar.xz \
            file://0005-Change-order-of-CFLAGS.patch \
            file://0006-Fix-invalid-sigprocmask-call.patch \
            file://0007-Define-alignof-using-_Alignof-when-using-C11-or-newe.patch \
+           file://0001-Fix-Wenum-constexpr-conversion-in-enum-flags.h.patch \
            "
 SRC_URI[sha256sum] = "38254eacd4572134bca9c5a5aa4d4ca564cbbd30c369d881f733fb6b903354f2"
diff --git a/meta/recipes-devtools/gdb/gdb/0001-Fix-Wenum-constexpr-conversion-in-enum-flags.h.patch b/meta/recipes-devtools/gdb/gdb/0001-Fix-Wenum-constexpr-conversion-in-enum-flags.h.patch
new file mode 100644
index 00000000000..8866db2e938
--- /dev/null
+++ b/meta/recipes-devtools/gdb/gdb/0001-Fix-Wenum-constexpr-conversion-in-enum-flags.h.patch
@@ -0,0 +1,313 @@
+From dd22f64329c46797b3a3de2605ad1fa14cf77dd4 Mon Sep 17 00:00:00 2001
+From: Carlos Galvez <carlosgalvezp@gmail.com>
+Date: Sun, 30 Jun 2024 21:36:24 +0200
+Subject: [PATCH] Fix -Wenum-constexpr-conversion in enum-flags.h
+
+This fixes PR 31331:
+https://sourceware.org/bugzilla/show_bug.cgi?id=31331
+
+Currently, enum-flags.h is suppressing the warning
+-Wenum-constexpr-conversion coming from recent versions of Clang.
+This warning is intended to be made a compiler error
+(non-downgradeable) in future versions of Clang:
+
+https://github.com/llvm/llvm-project/issues/59036
+
+The rationale is that casting a value of an integral type into an
+enumeration is Undefined Behavior if the value does not fit in the
+range of values of the enum:
+https://www.open-std.org/jtc1/sc22/wg21/docs/cwg_defects.html#1766
+
+Undefined Behavior is not allowed in constant expressions, leading to
+an ill-formed program.
+
+In this case, in enum-flags.h, we are casting the value -1 to an enum
+of a positive range only, which is UB as per the Standard and thus not
+allowed in a constexpr context.
+
+The purpose of doing this instead of using std::underlying_type is
+because, for C-style enums, std::underlying_type typically returns
+"unsigned int". However, when operating with it arithmetically, the
+enum is promoted to *signed* int, which is what we want to avoid.
+
+This patch solves this issue as follows:
+
+* Use std::underlying_type and remove the custom enum_underlying_type.
+
+* Ensure that operator~ is called always on an unsigned integer. We do
+  this by casting the input enum into std::size_t, which can fit any
+  unsigned integer. We have the guarantee that the cast is safe,
+  because we have checked that the underlying type is unsigned. If the
+  enum had negative values, the underlying type would be signed.
+
+  This solves the issue with C-style enums, but also solves a hidden
+  issue: enums with underlying type of std::uint8_t or std::uint16_t are
+  *also* promoted to signed int. Now they are all explicitly casted
+  to the largest unsigned int type and operator~ is safe to use.
+
+* There is one more thing that needs fix. Currently, operator~ is
+  implemented as follows:
+
+  return (enum_type) ~underlying(e);
+
+  After applying ~underlying(e), the result is a very large value,
+  which we then cast to "enum_type". This cast is Undefined Behavior
+  if the large value does not fit in the range of the enum. For
+  C++ enums (scoped and/or with explicit underlying type), the range
+  of the enum is the entire range of the underlying type, so the cast
+  is safe. However, for C-style enums, the range is the smallest
+  bit-field that can hold all the values of the enumeration. So the
+  range is a lot smaller and casting a large value to the enum would
+  invoke Undefined Behavior.
+
+  To solve this problem, we create a new trait
+  EnumHasFixedUnderlyingType, to ensure operator~ may only be called
+  on C++-style enums. This behavior is roughly the same as what we
+  had on trunk, but relying on different properties of the enums.
+
+* Once this is implemented, the following tests fail to compile:
+
+  CHECK_VALID (true,  int,  true ? EF () : EF2 ())
+
+  This is because it expects the enums to be promoted to signed int,
+  instead of unsigned int (which is the true underlying type).
+
+  I propose to remove these tests altogether, because:
+
+  - The comment nearby say they are not very important.
+  - Comparing 2 enums of different type like that is strange, relies
+    on integer promotions and thus hurts readability. As per comments
+    in the related PR, we likely don't want this type of code in gdb
+    code anyway, so there's no point in testing it.
+  - Most importantly, this type of comparison will be ill-formed in
+    C++26 for regular enums, so enum_flags does not need to emulate
+    that.
+
+Since this is the only place where the warning was suppressed, remove
+also the corresponding macro in include/diagnostics.h.
+
+The change has been tested by running the entire gdb test suite
+(make check) and comparing the results (testsuite/gdb.sum) against
+trunk. No noticeable differences have been observed.
+Tested-by: Keith Seitz <keiths@redhat.com>
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Upstream-Status: Submitted [https://patchwork.sourceware.org/project/gdb/patch/20240630193624.2906762-1-carlosgalvezp@gmail.com/]
+---
+ gdb/unittests/enum-flags-selftests.c |  27 -------
+ gdbsupport/enum-flags.h              | 104 ++++++++++++++++++---------
+ include/diagnostics.h                |   5 --
+ 3 files changed, 70 insertions(+), 66 deletions(-)
+
+diff --git a/gdb/unittests/enum-flags-selftests.c b/gdb/unittests/enum-flags-selftests.c
+index b55d8c3..02563e5 100644
+--- a/gdb/unittests/enum-flags-selftests.c
++++ b/gdb/unittests/enum-flags-selftests.c
+@@ -233,33 +233,6 @@ CHECK_VALID (true,   UEF,    ~UEF ())
+ CHECK_VALID (true,  EF,   true ? EF () : RE ())
+ CHECK_VALID (true,  EF,   true ? RE () : EF ())
+ 
+-/* These are valid, but it's not a big deal since you won't be able to
+-   assign the resulting integer to an enum or an enum_flags without a
+-   cast.
+-
+-   The latter two tests are disabled on older GCCs because they
+-   incorrectly fail with gcc 4.8 and 4.9 at least.  Running the test
+-   outside a SFINAE context shows:
+-
+-    invalid user-defined conversion from ‘EF’ to ‘RE2’
+-
+-   They've been confirmed to compile/pass with gcc 5.3, gcc 7.1 and
+-   clang 3.7.  */
+-
+-CHECK_VALID (true,  int,  true ? EF () : EF2 ())
+-CHECK_VALID (true,  int,  true ? EF2 () : EF ())
+-CHECK_VALID (true,  int,  true ? EF () : RE2 ())
+-CHECK_VALID (true,  int,  true ? RE2 () : EF ())
+-
+-/* Same, but with an unsigned enum.  */
+-
+-typedef unsigned int uns;
+-
+-CHECK_VALID (true,  uns,  true ? EF () : UEF ())
+-CHECK_VALID (true,  uns,  true ? UEF () : EF ())
+-CHECK_VALID (true,  uns,  true ? EF () : URE ())
+-CHECK_VALID (true,  uns,  true ? URE () : EF ())
+-
+ /* Unfortunately this can't work due to the way C++ computes the
+    return type of the ternary conditional operator.  int isn't
+    implicitly convertible to the raw enum type, so the type of the
+diff --git a/gdbsupport/enum-flags.h b/gdbsupport/enum-flags.h
+index 5078004..acec203 100644
+--- a/gdbsupport/enum-flags.h
++++ b/gdbsupport/enum-flags.h
+@@ -75,30 +75,6 @@
+    namespace.  The compiler finds the corresponding
+    is_enum_flags_enum_type function via ADL.  */
+ 
+-/* Note that std::underlying_type<enum_type> is not what we want here,
+-   since that returns unsigned int even when the enum decays to signed
+-   int.  */
+-template<int size, bool sign> class integer_for_size { typedef void type; };
+-template<> struct integer_for_size<1, 0> { typedef uint8_t type; };
+-template<> struct integer_for_size<2, 0> { typedef uint16_t type; };
+-template<> struct integer_for_size<4, 0> { typedef uint32_t type; };
+-template<> struct integer_for_size<8, 0> { typedef uint64_t type; };
+-template<> struct integer_for_size<1, 1> { typedef int8_t type; };
+-template<> struct integer_for_size<2, 1> { typedef int16_t type; };
+-template<> struct integer_for_size<4, 1> { typedef int32_t type; };
+-template<> struct integer_for_size<8, 1> { typedef int64_t type; };
+-
+-template<typename T>
+-struct enum_underlying_type
+-{
+-  DIAGNOSTIC_PUSH
+-  DIAGNOSTIC_IGNORE_ENUM_CONSTEXPR_CONVERSION
+-  typedef typename
+-    integer_for_size<sizeof (T), static_cast<bool>(T (-1) < T (0))>::type
+-    type;
+-  DIAGNOSTIC_POP
+-};
+-
+ namespace enum_flags_detail
+ {
+ 
+@@ -119,10 +95,62 @@ struct zero_type;
+ /* gdb::Requires trait helpers.  */
+ template <typename enum_type>
+ using EnumIsUnsigned
+-  = std::is_unsigned<typename enum_underlying_type<enum_type>::type>;
++  = std::is_unsigned<typename std::underlying_type<enum_type>::type>;
++
++/* Helper to detect whether an enum has a fixed underlying type. This can be
++   achieved by using a scoped enum (in which case the type is "int") or
++   an explicit underlying type. C-style enums that are unscoped or do not
++   have an explicit underlying type have an implementation-defined underlying
++   type.
++
++   https://timsong-cpp.github.io/cppwp/n4659/dcl.enum#5
++
++   We need this trait in order to ensure that operator~ below does NOT
++   operate on old-style enums. This is because we apply operator~ on
++   the value and then cast the result to the enum_type. This is however
++   Undefined Behavior if the result does not fit in the range of possible
++   values for the enum. For enums with fixed underlying type, the entire
++   range of the integer is available. However, for old-style enums, the range
++   is only the smallest bit-field that can hold all the values of the
++   enumeration, typically much smaller than the underlying integer:
++
++   https://timsong-cpp.github.io/cppwp/n4659/expr.static.cast#10
++   https://timsong-cpp.github.io/cppwp/n4659/dcl.enum#8
++
++   To implement this, we leverage the fact that, since C++17, enums with
++   fixed underlying type can be list-initialized from an integer:
++   https://timsong-cpp.github.io/cppwp/n4659/dcl.init.list#3.7
++
++   Old-style enums cannot be initialized like that, leading to ill-formed
++   code.
++
++   We then use this together with SFINAE to create the desired trait.
++
++*/
++// Primary template
++template <typename enum_type, typename = void>
++struct EnumHasFixedUnderlyingType : std::false_type
++{
++  static_assert(std::is_enum<enum_type>::value);
++};
++
++// Specialization that is active only if enum_type can be list-initialized
++// from an integer (0). Only enums with fixed underlying type satisfy this
++// property in C++17.
++template <typename enum_type>
++struct EnumHasFixedUnderlyingType<enum_type, std::void_t<decltype(enum_type{0})>> : std::true_type
++{
++  static_assert(std::is_enum<enum_type>::value);
++};
++
++template <typename enum_type>
++using EnumIsSafeForBitwiseComplement = std::conjunction<
++  EnumIsUnsigned<enum_type>,
++  EnumHasFixedUnderlyingType<enum_type>
++>;
++
+ template <typename enum_type>
+-using EnumIsSigned
+-  = std::is_signed<typename enum_underlying_type<enum_type>::type>;
++using EnumIsUnsafeForBitwiseComplement = std::negation<EnumIsSafeForBitwiseComplement<enum_type>>;
+ 
+ }
+ 
+@@ -131,7 +159,7 @@ class enum_flags
+ {
+ public:
+   typedef E enum_type;
+-  typedef typename enum_underlying_type<enum_type>::type underlying_type;
++  typedef typename std::underlying_type<enum_type>::type underlying_type;
+ 
+   /* For to_string.  Maps one enumerator of E to a string.  */
+   struct string_mapping
+@@ -394,33 +422,41 @@ ENUM_FLAGS_GEN_COMP (operator!=, !=)
+ template <typename enum_type,
+ 	  typename = is_enum_flags_enum_type_t<enum_type>,
+ 	  typename
+-	    = gdb::Requires<enum_flags_detail::EnumIsUnsigned<enum_type>>>
++	    = gdb::Requires<enum_flags_detail::EnumIsSafeForBitwiseComplement<enum_type>>>
+ constexpr enum_type
+ operator~ (enum_type e)
+ {
+   using underlying = typename enum_flags<enum_type>::underlying_type;
+-  return (enum_type) ~underlying (e);
++  // Cast to std::size_t first, to prevent integer promotions from
++  // enums with fixed underlying type std::uint8_t or std::uint16_t
++  // to signed int.
++  // This ensures we apply the bitwise complement on an unsigned type.
++  return (enum_type)(underlying) ~std::size_t (e);
+ }
+ 
+ template <typename enum_type,
+ 	  typename = is_enum_flags_enum_type_t<enum_type>,
+-	  typename = gdb::Requires<enum_flags_detail::EnumIsSigned<enum_type>>>
++	  typename = gdb::Requires<enum_flags_detail::EnumIsUnsafeForBitwiseComplement<enum_type>>>
+ constexpr void operator~ (enum_type e) = delete;
+ 
+ template <typename enum_type,
+ 	  typename = is_enum_flags_enum_type_t<enum_type>,
+ 	  typename
+-	    = gdb::Requires<enum_flags_detail::EnumIsUnsigned<enum_type>>>
++	    = gdb::Requires<enum_flags_detail::EnumIsSafeForBitwiseComplement<enum_type>>>
+ constexpr enum_flags<enum_type>
+ operator~ (enum_flags<enum_type> e)
+ {
+   using underlying = typename enum_flags<enum_type>::underlying_type;
+-  return (enum_type) ~underlying (e);
++  // Cast to std::size_t first, to prevent integer promotions from
++  // enums with fixed underlying type std::uint8_t or std::uint16_t
++  // to signed int.
++  // This ensures we apply the bitwise complement on an unsigned type.
++  return (enum_type)(underlying) ~std::size_t (e);
+ }
+ 
+ template <typename enum_type,
+ 	  typename = is_enum_flags_enum_type_t<enum_type>,
+-	  typename = gdb::Requires<enum_flags_detail::EnumIsSigned<enum_type>>>
++	  typename = gdb::Requires<enum_flags_detail::EnumIsUnsafeForBitwiseComplement<enum_type>>>
+ constexpr void operator~ (enum_flags<enum_type> e) = delete;
+ 
+ /* Delete operator<< and operator>>.  */
+diff --git a/include/diagnostics.h b/include/diagnostics.h
+index 97e30ab..14575e2 100644
+--- a/include/diagnostics.h
++++ b/include/diagnostics.h
+@@ -76,11 +76,6 @@
+ # define DIAGNOSTIC_ERROR_SWITCH \
+   DIAGNOSTIC_ERROR ("-Wswitch")
+ 
+-# if __has_warning ("-Wenum-constexpr-conversion")
+-#  define DIAGNOSTIC_IGNORE_ENUM_CONSTEXPR_CONVERSION \
+-   DIAGNOSTIC_IGNORE ("-Wenum-constexpr-conversion")
+-# endif
+-
+ #elif defined (__GNUC__) /* GCC */
+ 
+ # define DIAGNOSTIC_IGNORE_DEPRECATED_DECLARATIONS \

