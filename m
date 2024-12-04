Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC393E77174
	for <webhook@archiver.kernel.org>; Wed,  4 Dec 2024 06:50:01 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web11.8165.1733294996316284270
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Dec 2024 22:49:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OI3xC0Zx;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4349fb56260so56387765e9.3
        for <openembedded-core@lists.openembedded.org>; Tue, 03 Dec 2024 22:49:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733294995; x=1733899795; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7ZfYhzcuNnTk3o2nwPEgqyy7bkSnnu2GE9wzV9TfH5c=;
        b=OI3xC0ZxL/LjEBJLDC5XrVJaQAOXKksMhZ4BhhL/lUJBPW+yJjUc5csFKIZ/yGMnq8
         HbdcXLX44K66dXAdAHCEStFtspvkzO/eLr02/XYiVeXGvRogF+TNNh4Y1Y1RWfPtZrmt
         xRCh5edx464htHYe0s9ZS6n09mWvKFSh0MyeA2B74m1uZKwy0/LpLV1c1EXyQF4+a1uf
         85GCiUrc26cKaPZbpSHdCCi0NoNzpTqPsG7nHQNmI5cE+mppzmbX+FD2rDBoeFFgOYbo
         fIJx3+L5DIyCuVI42g72MOQ2XcV2a19NbxpeYo0EpwBUUJqSAJkDnVlDQ74SEFbvPkl7
         H0Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733294995; x=1733899795;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7ZfYhzcuNnTk3o2nwPEgqyy7bkSnnu2GE9wzV9TfH5c=;
        b=S/XEv3vWHgVBHF7MVt8GVcyQ9Z/SVdDK8pPj6aVPFCiGoKNGC9TbgSrG0z7vYbKsYT
         29RJEhQW1v3fvae/EG3Tp1jZn3BStXOgdY+iAl14bzbm5u6EqttIbZfimVtQRJ/mVjdJ
         EEzY3SzDlS/sVqi15AmCiP7NcEEo9iKUN6gywTtZ75n2T9iH5SpfrrtUK0A1rjnFoCwj
         vTwWSnF5QJiw1wjZ7y18rpmzu8kyMW00bWVut39R7X6/jhefcvGkZ/Wa1jrXREPLZpvM
         zDT0uUamMiHvxudTPssttPtQnyXVirQAVCFeuSUPnDrZDicqSkTb2bJCRVCAzTNlHVz+
         jsjg==
X-Gm-Message-State: AOJu0Yzpb0+/PWQWwEojea2c3v3ykndS+3vzHbTuHXN52IiPQ/LmmAlC
	Zgyn8/qx9V/fgIbO1jwKPlZABunZpLGoCDvAhfnei7yb3k3LJw/dEBGrlg==
X-Gm-Gg: ASbGncsqPkd4pXHjsljoVpd6HlwTs6F2CS7ZAZYQT+1puVFsOxy0Pz8Vi7Dli3VwiL2
	ZjPDhPdzgEapxqIew77h59y5CJ/GM+cDZ7cnp2gXVSREei+Rqm+7PoUxqzK5kNicPXsUpHV8wlx
	0mGbgrNMUJyM4l1Tk7YY6QUTw/9ZdOzsF6CuUOCQSTNUOITnp+vLss/fqnWhzi4cEDg1hUeSrgR
	hm6FxN6j4bbdFWA78x9+BPnq6sWR5ijqtgD9wI68hx6omR+A+3l2XAzIrziH5PnyfCxzzgJCQJI
	WmcWnCO79oI=
X-Google-Smtp-Source: AGHT+IHEh3DlQPQz9xSGFA54vMDIc2jfRaVJY6Q2EkmLivHB5Yto+8P+4ie3gtuv9eVfGXoPh4otLA==
X-Received: by 2002:a5d:584f:0:b0:385:fc00:f5f9 with SMTP id ffacd0b85a97d-385fd3ec00cmr3602819f8f.18.1733294994480;
        Tue, 03 Dec 2024 22:49:54 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385f343f293sm7435757f8f.36.2024.12.03.22.49.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2024 22:49:53 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 25/37] webkitgtk: update 2.44.3 -> 2.46.4
Date: Wed,  4 Dec 2024 07:49:08 +0100
Message-Id: <20241204064920.817016-25-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241204064920.817016-1-alex.kanavin@gmail.com>
References: <20241204064920.817016-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Dec 2024 06:50:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208254

From: Alexander Kanavin <alex@linutronix.de>

Drop 0001-Fix-build-issues-with-latest-Clang.patch
(backport)
30e1d5e22213fdaca2a29ec3400c927d710a37a8.patch
(issue fixed upstream)

Add an option that when absent causes a build failure.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...able-to-control-macro-__PAS_ALWAYS_I.patch |   6 +-
 ...spection.cmake-prefix-variables-obta.patch |   4 +-
 ...1-Fix-build-issues-with-latest-Clang.patch | 251 ------------------
 .../0001-Support-ICU-76.1-build.patch         |   4 +-
 ...d5e22213fdaca2a29ec3400c927d710a37a8.patch |  67 -----
 .../webkit/webkitgtk/bmalloc-fix.patch        |  36 +++
 .../webkit/webkitgtk/no-musttail-arm.patch    |  14 +-
 .../webkit/webkitgtk/reproducibility.patch    |   2 +-
 .../webkit/webkitgtk/t6-not-declared.patch    |   6 +-
 ...ebkitgtk_2.44.3.bb => webkitgtk_2.46.4.bb} |   7 +-
 10 files changed, 58 insertions(+), 339 deletions(-)
 delete mode 100644 meta/recipes-sato/webkit/webkitgtk/0001-Fix-build-issues-with-latest-Clang.patch
 delete mode 100644 meta/recipes-sato/webkit/webkitgtk/30e1d5e22213fdaca2a29ec3400c927d710a37a8.patch
 create mode 100644 meta/recipes-sato/webkit/webkitgtk/bmalloc-fix.patch
 rename meta/recipes-sato/webkit/{webkitgtk_2.44.3.bb => webkitgtk_2.46.4.bb} (96%)

diff --git a/meta/recipes-sato/webkit/webkitgtk/0001-CMake-Add-a-variable-to-control-macro-__PAS_ALWAYS_I.patch b/meta/recipes-sato/webkit/webkitgtk/0001-CMake-Add-a-variable-to-control-macro-__PAS_ALWAYS_I.patch
index a19008a41fc..8376ee8472d 100644
--- a/meta/recipes-sato/webkit/webkitgtk/0001-CMake-Add-a-variable-to-control-macro-__PAS_ALWAYS_I.patch
+++ b/meta/recipes-sato/webkit/webkitgtk/0001-CMake-Add-a-variable-to-control-macro-__PAS_ALWAYS_I.patch
@@ -1,4 +1,4 @@
-From 99a21305ae683a216e9299e5dbdd763190a8cfe3 Mon Sep 17 00:00:00 2001
+From bbf661310448d430350eb2ad8c5869ace648dcf8 Mon Sep 17 00:00:00 2001
 From: Kai Kang <kai.kang@windriver.com>
 Date: Fri, 11 Aug 2023 14:20:48 +0800
 Subject: [PATCH] Add a variable to control macro
@@ -57,10 +57,10 @@ index 5d5fb38c..a554f700 100644
  #else
  #define __PAS_ALWAYS_INLINE_BUT_NOT_INLINE
 diff --git a/Source/cmake/WebKitCompilerFlags.cmake b/Source/cmake/WebKitCompilerFlags.cmake
-index 0732785e..4879ec40 100644
+index f5ec0a55..dfd741e7 100644
 --- a/Source/cmake/WebKitCompilerFlags.cmake
 +++ b/Source/cmake/WebKitCompilerFlags.cmake
-@@ -452,3 +452,10 @@ endif ()
+@@ -492,3 +492,10 @@ endif ()
  
  # FIXME: Enable pre-compiled headers for all ports <https://webkit.org/b/139438>
  set(CMAKE_DISABLE_PRECOMPILE_HEADERS ON)
diff --git a/meta/recipes-sato/webkit/webkitgtk/0001-FindGObjectIntrospection.cmake-prefix-variables-obta.patch b/meta/recipes-sato/webkit/webkitgtk/0001-FindGObjectIntrospection.cmake-prefix-variables-obta.patch
index dda20a7b25b..b11a18ba22a 100644
--- a/meta/recipes-sato/webkit/webkitgtk/0001-FindGObjectIntrospection.cmake-prefix-variables-obta.patch
+++ b/meta/recipes-sato/webkit/webkitgtk/0001-FindGObjectIntrospection.cmake-prefix-variables-obta.patch
@@ -1,4 +1,4 @@
-From d1f6a1b6a1298f6ef2f1677e9996aa60a002134a Mon Sep 17 00:00:00 2001
+From e0dfc113b016227da8a654d625e8f568b56761d0 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Tue, 27 Oct 2015 16:02:19 +0200
 Subject: [PATCH] FindGObjectIntrospection.cmake: prefix variables obtained
@@ -14,7 +14,7 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 3 insertions(+)
 
 diff --git a/Source/cmake/FindGI.cmake b/Source/cmake/FindGI.cmake
-index fdc56b21..d42eca52 100644
+index 8cf372f3..40471487 100644
 --- a/Source/cmake/FindGI.cmake
 +++ b/Source/cmake/FindGI.cmake
 @@ -72,6 +72,9 @@ if (PKG_CONFIG_FOUND)
diff --git a/meta/recipes-sato/webkit/webkitgtk/0001-Fix-build-issues-with-latest-Clang.patch b/meta/recipes-sato/webkit/webkitgtk/0001-Fix-build-issues-with-latest-Clang.patch
deleted file mode 100644
index 2be899fea84..00000000000
--- a/meta/recipes-sato/webkit/webkitgtk/0001-Fix-build-issues-with-latest-Clang.patch
+++ /dev/null
@@ -1,251 +0,0 @@
-From 257ed304fb3e71d412568dcbed7129c145812fdf Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 2 Sep 2024 21:38:12 -0700
-Subject: [PATCH] Fix build issues with latest Clang
- https://bugs.webkit.org/show_bug.cgi?id=276198 rdar://130933637
-
-Reviewed by Yusuke Suzuki.
-
-The use of the template keyword to reference template members without a template argument list was deprecated in the C++ standard.
-e.g. `foo.template bar()` nows needs to be `foo.template bar<>()`. I ran into a different issue with `std::reference_wrapper` that
-blocked me from going any further, which AFAICT is a bug on the Clang side.
-
-This also fixes a few other warnings that popped up while building with the new Clang denoted inline
-
-* Source/JavaScriptCore/ftl/FTLLowerDFGToB3.cpp:
-(JSC::FTL::DFG::LowerDFGToB3::compileCompareStrictEq): Clang didn't like the implicit static_cast<int32_t>(UINT32_MAX) so make it explicit with a static_assert no data was lost.
-* Source/JavaScriptCore/jit/AssemblyHelpers.cpp:
-(JSC::AssemblyHelpers::emitNonNullDecodeZeroExtendedStructureID): Clang didn't like the implicit static_cast<int32_t>(UINT32_MAX) so make it explicit with a static_assert no data was lost.
-* Source/JavaScriptCore/llint/InPlaceInterpreter.cpp:
-* Source/JavaScriptCore/llint/LLIntData.h:
-(JSC::LLInt::getCodeFunctionPtr):
-(JSC::LLInt::getWide16CodeFunctionPtr):
-(JSC::LLInt::getWide32CodeFunctionPtr):
-* Source/JavaScriptCore/parser/Nodes.h: Missing definition of ModuleScopeData added include.
-* Source/JavaScriptCore/runtime/JSCast.h:
-(JSC::JSCastingHelpers::inherits):
-(JSC::jsDynamicCast):
-* Source/ThirdParty/libwebrtc/Source/third_party/boringssl/src/crypto/bio/connect.c:
-(conn_callback_ctrl): Had a warning about an incompatible function type. Seems like this is intentional suppressed the warning.
-* Source/WTF/wtf/cf/TypeCastsCF.h: Had a warning about extra namespace qualification. I just moved it out of the namespace. That said, it feels like this warning shouldn't apply to macro expansions...
-* Source/WebCore/PAL/ThirdParty/libavif/ThirdParty/dav1d/src/decode.c:
-(decode_b): Had a warning about different types on the middle/right of a ternary expression. I just pushed the comparison inside the ternary.
-
-Canonical link: https://commits.webkit.org/280700@main
-
-Upstream-Status: Backport [https://github.com/WebKit/WebKit/commit/62b6e2db547e#diff-136d848d7c1b400da9b486916b67592b54e5abf7c66ac247697a93ae2fb743a9]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- Source/JavaScriptCore/ftl/FTLLowerDFGToB3.cpp    |  6 ++++--
- Source/JavaScriptCore/jit/AssemblyHelpers.cpp    |  6 ++++--
- .../JavaScriptCore/llint/InPlaceInterpreter.cpp  | 16 ++++++++--------
- Source/JavaScriptCore/llint/LLIntData.h          | 12 ++++++------
- Source/JavaScriptCore/llint/LLIntThunks.cpp      |  2 +-
- Source/JavaScriptCore/parser/Nodes.h             |  4 ++--
- Source/JavaScriptCore/runtime/JSCast.h           |  4 ++--
- 7 files changed, 27 insertions(+), 23 deletions(-)
-
-diff --git a/Source/JavaScriptCore/ftl/FTLLowerDFGToB3.cpp b/Source/JavaScriptCore/ftl/FTLLowerDFGToB3.cpp
-index 42a4eae7..dd987726 100644
---- a/Source/JavaScriptCore/ftl/FTLLowerDFGToB3.cpp
-+++ b/Source/JavaScriptCore/ftl/FTLLowerDFGToB3.cpp
-@@ -22930,8 +22930,10 @@ IGNORE_CLANG_WARNINGS_END
-         return m_out.shl(m_out.zeroExtPtr(structureID), m_out.constIntPtr(StructureID::encodeShiftAmount));
- #else
-         LValue maskedStructureID = structureID;
--        if constexpr (structureHeapAddressSize < 4 * GB)
--            maskedStructureID = m_out.bitAnd(structureID, m_out.constInt32(StructureID::structureIDMask));
-+        if constexpr (structureHeapAddressSize < 4 * GB) {
-+            static_assert(static_cast<uint32_t>(StructureID::structureIDMask) == StructureID::structureIDMask);
-+            maskedStructureID = m_out.bitAnd(structureID, m_out.constInt32(static_cast<uint32_t>(StructureID::structureIDMask)));
-+        }
-         return m_out.bitOr(m_out.constIntPtr(startOfStructureHeap()), m_out.zeroExtPtr(maskedStructureID));
- #endif
-     }
-diff --git a/Source/JavaScriptCore/jit/AssemblyHelpers.cpp b/Source/JavaScriptCore/jit/AssemblyHelpers.cpp
-index c939d27a..982dc46f 100644
---- a/Source/JavaScriptCore/jit/AssemblyHelpers.cpp
-+++ b/Source/JavaScriptCore/jit/AssemblyHelpers.cpp
-@@ -677,8 +677,10 @@ void AssemblyHelpers::emitNonNullDecodeZeroExtendedStructureID(RegisterID source
-     if constexpr (structureHeapAddressSize >= 4 * GB) {
-         ASSERT(structureHeapAddressSize == 4 * GB);
-         move(source, dest);
--    } else
--        and32(TrustedImm32(StructureID::structureIDMask), source, dest);
-+    } else {
-+        static_assert(static_cast<uint32_t>(StructureID::structureIDMask) == StructureID::structureIDMask);
-+        and32(TrustedImm32(static_cast<uint32_t>(StructureID::structureIDMask)), source, dest);
-+    }
-     or64(TrustedImm64(startOfStructureHeap()), dest);
- #else // not CPU(ADDRESS64)
-     move(source, dest);
-diff --git a/Source/JavaScriptCore/llint/InPlaceInterpreter.cpp b/Source/JavaScriptCore/llint/InPlaceInterpreter.cpp
-index b9442b4f..a1d5a6c4 100644
---- a/Source/JavaScriptCore/llint/InPlaceInterpreter.cpp
-+++ b/Source/JavaScriptCore/llint/InPlaceInterpreter.cpp
-@@ -43,8 +43,8 @@ namespace JSC { namespace IPInt {
- do { \
-     void* base = reinterpret_cast<void*>(ipint_unreachable_validate); \
-     void* ptr = reinterpret_cast<void*>(ipint_ ## name ## _validate); \
--    void* untaggedBase = CodePtr<CFunctionPtrTag>::fromTaggedPtr(base).template untaggedPtr(); \
--    void* untaggedPtr = CodePtr<CFunctionPtrTag>::fromTaggedPtr(ptr).template untaggedPtr(); \
-+    void* untaggedBase = CodePtr<CFunctionPtrTag>::fromTaggedPtr(base).template untaggedPtr<>(); \
-+    void* untaggedPtr = CodePtr<CFunctionPtrTag>::fromTaggedPtr(ptr).template untaggedPtr<>(); \
-     RELEASE_ASSERT_WITH_MESSAGE((char*)(untaggedPtr) - (char*)(untaggedBase) == opcode * 256, #name); \
- } while (false);
- 
-@@ -52,8 +52,8 @@ do { \
- do { \
-     void* base = reinterpret_cast<void*>(ipint_i32_trunc_sat_f32_s_validate); \
-     void* ptr = reinterpret_cast<void*>(ipint_ ## name ## _validate); \
--    void* untaggedBase = CodePtr<CFunctionPtrTag>::fromTaggedPtr(base).template untaggedPtr(); \
--    void* untaggedPtr = CodePtr<CFunctionPtrTag>::fromTaggedPtr(ptr).template untaggedPtr(); \
-+    void* untaggedBase = CodePtr<CFunctionPtrTag>::fromTaggedPtr(base).template untaggedPtr<>(); \
-+    void* untaggedPtr = CodePtr<CFunctionPtrTag>::fromTaggedPtr(ptr).template untaggedPtr<>(); \
-     RELEASE_ASSERT_WITH_MESSAGE((char*)(untaggedPtr) - (char*)(untaggedBase) == opcode * 256, #name); \
- } while (false);
- 
-@@ -61,8 +61,8 @@ do { \
- do { \
-     void* base = reinterpret_cast<void*>(ipint_simd_v128_load_mem_validate); \
-     void* ptr = reinterpret_cast<void*>(ipint_ ## name ## _validate); \
--    void* untaggedBase = CodePtr<CFunctionPtrTag>::fromTaggedPtr(base).template untaggedPtr(); \
--    void* untaggedPtr = CodePtr<CFunctionPtrTag>::fromTaggedPtr(ptr).template untaggedPtr(); \
-+    void* untaggedBase = CodePtr<CFunctionPtrTag>::fromTaggedPtr(base).template untaggedPtr<>(); \
-+    void* untaggedPtr = CodePtr<CFunctionPtrTag>::fromTaggedPtr(ptr).template untaggedPtr<>(); \
-     RELEASE_ASSERT_WITH_MESSAGE((char*)(untaggedPtr) - (char*)(untaggedBase) == opcode * 256, #name); \
- } while (false);
- 
-@@ -70,8 +70,8 @@ do { \
- do { \
-     void* base = reinterpret_cast<void*>(ipint_memory_atomic_notify_validate); \
-     void* ptr = reinterpret_cast<void*>(ipint_ ## name ## _validate); \
--    void* untaggedBase = CodePtr<CFunctionPtrTag>::fromTaggedPtr(base).template untaggedPtr(); \
--    void* untaggedPtr = CodePtr<CFunctionPtrTag>::fromTaggedPtr(ptr).template untaggedPtr(); \
-+    void* untaggedBase = CodePtr<CFunctionPtrTag>::fromTaggedPtr(base).template untaggedPtr<>(); \
-+    void* untaggedPtr = CodePtr<CFunctionPtrTag>::fromTaggedPtr(ptr).template untaggedPtr<>(); \
-     RELEASE_ASSERT_WITH_MESSAGE((char*)(untaggedPtr) - (char*)(untaggedBase) == opcode * 256, #name); \
- } while (false);
- 
-diff --git a/Source/JavaScriptCore/llint/LLIntData.h b/Source/JavaScriptCore/llint/LLIntData.h
-index 97de867e..87a2971d 100644
---- a/Source/JavaScriptCore/llint/LLIntData.h
-+++ b/Source/JavaScriptCore/llint/LLIntData.h
-@@ -217,7 +217,7 @@ ALWAYS_INLINE LLIntCode getCodeFunctionPtr(OpcodeID opcodeID)
- #if COMPILER(MSVC)
-     return reinterpret_cast<LLIntCode>(getCodePtr<tag>(opcodeID).taggedPtr());
- #else
--    return reinterpret_cast<LLIntCode>(getCodePtr<tag>(opcodeID).template taggedPtr());
-+    return reinterpret_cast<LLIntCode>(getCodePtr<tag>(opcodeID).template taggedPtr<>());
- #endif
- }
- 
-@@ -227,7 +227,7 @@ ALWAYS_INLINE LLIntCode getWide16CodeFunctionPtr(OpcodeID opcodeID)
- #if COMPILER(MSVC)
-     return reinterpret_cast<LLIntCode>(getWide16CodePtr<tag>(opcodeID).taggedPtr());
- #else
--    return reinterpret_cast<LLIntCode>(getWide16CodePtr<tag>(opcodeID).template taggedPtr());
-+    return reinterpret_cast<LLIntCode>(getWide16CodePtr<tag>(opcodeID).template taggedPtr<>());
- #endif
- }
- 
-@@ -237,7 +237,7 @@ ALWAYS_INLINE LLIntCode getWide32CodeFunctionPtr(OpcodeID opcodeID)
- #if COMPILER(MSVC)
-     return reinterpret_cast<LLIntCode>(getWide32CodePtr<tag>(opcodeID).taggedPtr());
- #else
--    return reinterpret_cast<LLIntCode>(getWide32CodePtr<tag>(opcodeID).template taggedPtr());
-+    return reinterpret_cast<LLIntCode>(getWide32CodePtr<tag>(opcodeID).template taggedPtr<>());
- #endif
- }
- #else // not ENABLE(JIT)
-@@ -361,7 +361,7 @@ ALWAYS_INLINE LLIntCode getCodeFunctionPtr(WasmOpcodeID opcodeID)
- #if COMPILER(MSVC)
-     return reinterpret_cast<LLIntCode>(getCodePtr<tag>(opcodeID).taggedPtr());
- #else
--    return reinterpret_cast<LLIntCode>(getCodePtr<tag>(opcodeID).template taggedPtr());
-+    return reinterpret_cast<LLIntCode>(getCodePtr<tag>(opcodeID).template taggedPtr<>());
- #endif
- }
- 
-@@ -371,7 +371,7 @@ ALWAYS_INLINE LLIntCode getWide16CodeFunctionPtr(WasmOpcodeID opcodeID)
- #if COMPILER(MSVC)
-     return reinterpret_cast<LLIntCode>(getWide16CodePtr<tag>(opcodeID).taggedPtr());
- #else
--    return reinterpret_cast<LLIntCode>(getWide16CodePtr<tag>(opcodeID).template taggedPtr());
-+    return reinterpret_cast<LLIntCode>(getWide16CodePtr<tag>(opcodeID).template taggedPtr<>());
- #endif
- }
- 
-@@ -381,7 +381,7 @@ ALWAYS_INLINE LLIntCode getWide32CodeFunctionPtr(WasmOpcodeID opcodeID)
- #if COMPILER(MSVC)
-     return reinterpret_cast<LLIntCode>(getWide32CodePtr<tag>(opcodeID).taggedPtr());
- #else
--    return reinterpret_cast<LLIntCode>(getWide32CodePtr<tag>(opcodeID).template taggedPtr());
-+    return reinterpret_cast<LLIntCode>(getWide32CodePtr<tag>(opcodeID).template taggedPtr<>());
- #endif
- }
- #else // not ENABLE(JIT)
-diff --git a/Source/JavaScriptCore/llint/LLIntThunks.cpp b/Source/JavaScriptCore/llint/LLIntThunks.cpp
-index 13269469..e41fa5b8 100644
---- a/Source/JavaScriptCore/llint/LLIntThunks.cpp
-+++ b/Source/JavaScriptCore/llint/LLIntThunks.cpp
-@@ -227,7 +227,7 @@ ALWAYS_INLINE void* untaggedPtr(void* ptr)
- #if COMPILER(MSVC)
-         return CodePtr<CFunctionPtrTag>::fromTaggedPtr(ptr).untaggedPtr();
- #else
--        return CodePtr<CFunctionPtrTag>::fromTaggedPtr(ptr).template untaggedPtr();
-+        return CodePtr<CFunctionPtrTag>::fromTaggedPtr(ptr).template untaggedPtr<>();
- #endif
- }
- 
-diff --git a/Source/JavaScriptCore/parser/Nodes.h b/Source/JavaScriptCore/parser/Nodes.h
-index 01af81b7..70b87088 100644
---- a/Source/JavaScriptCore/parser/Nodes.h
-+++ b/Source/JavaScriptCore/parser/Nodes.h
-@@ -1,7 +1,7 @@
- /*
-  *  Copyright (C) 1999-2000 Harri Porten (porten@kde.org)
-  *  Copyright (C) 2001 Peter Kelly (pmk@post.com)
-- *  Copyright (C) 2003-2019 Apple Inc. All rights reserved.
-+ *  Copyright (C) 2003-2024 Apple Inc. All rights reserved.
-  *  Copyright (C) 2007 Cameron Zwarich (cwzwarich@uwaterloo.ca)
-  *  Copyright (C) 2007 Maks Orlovich
-  *  Copyright (C) 2007 Eric Seidel <eric@webkit.org>
-@@ -29,6 +29,7 @@
- #include "ImplementationVisibility.h"
- #include "JITCode.h"
- #include "Label.h"
-+#include "ModuleScopeData.h"
- #include "ParserArena.h"
- #include "ParserModes.h"
- #include "ParserTokens.h"
-@@ -49,7 +50,6 @@ namespace JSC {
-     class FunctionMetadataNode;
-     class FunctionParameters;
-     class ModuleAnalyzer;
--    class ModuleScopeData;
-     class PropertyListNode;
-     class ReadModifyResolveNode;
-     class RegisterID;
-diff --git a/Source/JavaScriptCore/runtime/JSCast.h b/Source/JavaScriptCore/runtime/JSCast.h
-index a44b6e38..e5664a8b 100644
---- a/Source/JavaScriptCore/runtime/JSCast.h
-+++ b/Source/JavaScriptCore/runtime/JSCast.h
-@@ -236,7 +236,7 @@ template<typename Target, typename From>
- bool inherits(From* from)
- {
-     using Dispatcher = InheritsTraits<Target>;
--    return Dispatcher::template inherits(from);
-+    return Dispatcher::template inherits<>(from);
- }
- 
- } // namespace JSCastingHelpers
-@@ -245,7 +245,7 @@ template<typename To, typename From>
- To jsDynamicCast(From* from)
- {
-     using Dispatcher = JSCastingHelpers::InheritsTraits<typename std::remove_cv<typename std::remove_pointer<To>::type>::type>;
--    if (LIKELY(Dispatcher::template inherits(from)))
-+    if (LIKELY(Dispatcher::template inherits<>(from)))
-         return static_cast<To>(from);
-     return nullptr;
- }
diff --git a/meta/recipes-sato/webkit/webkitgtk/0001-Support-ICU-76.1-build.patch b/meta/recipes-sato/webkit/webkitgtk/0001-Support-ICU-76.1-build.patch
index 31535e7ae24..24f484e5e3b 100644
--- a/meta/recipes-sato/webkit/webkitgtk/0001-Support-ICU-76.1-build.patch
+++ b/meta/recipes-sato/webkit/webkitgtk/0001-Support-ICU-76.1-build.patch
@@ -1,7 +1,7 @@
-From 57b80aa00be614218552fda67b2bf8d535b4f4cf Mon Sep 17 00:00:00 2001
+From 8b0ff0f2e2882f200f1c21ec76fa679444cb1c43 Mon Sep 17 00:00:00 2001
 From: Jason Schonberg <schonm@gmail.com>
 Date: Wed, 20 Nov 2024 11:05:52 -0500
-Subject: [PATCH]  Support ICU 76.1 build
+Subject: [PATCH] Support ICU 76.1 build
 
 https://bugs.webkit.org/show_bug.cgi?id=282120
 
diff --git a/meta/recipes-sato/webkit/webkitgtk/30e1d5e22213fdaca2a29ec3400c927d710a37a8.patch b/meta/recipes-sato/webkit/webkitgtk/30e1d5e22213fdaca2a29ec3400c927d710a37a8.patch
deleted file mode 100644
index 0d8976c5020..00000000000
--- a/meta/recipes-sato/webkit/webkitgtk/30e1d5e22213fdaca2a29ec3400c927d710a37a8.patch
+++ /dev/null
@@ -1,67 +0,0 @@
-From 2ee948191de1c561b72ebf462605376cfb3ce7af Mon Sep 17 00:00:00 2001
-From: Thomas Devoogdt <thomas.devoogdt@barco.com>
-Date: Mon, 16 Jan 2023 17:03:30 +0100
-Subject: [PATCH] REGRESSION(257865@main): B3Validate.cpp: fix
-
- !ENABLE(WEBASSEMBLY_B3JIT)
-
-https://bugs.webkit.org/show_bug.cgi?id=250681
-
-Reviewed by NOBODY (OOPS!).
-
-WasmTypeDefinition.h isn't included if not ENABLE(WEBASSEMBLY_B3JIT).
-Also, toB3Type and simdScalarType are not defined if it is included.
-
-Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
-
-Upstream-Status: Inappropriate [https://bugs.launchpad.net/ubuntu/+source/webkit2gtk/+bug/2008798]
-
-Signed-off-by: Markus Volk <f_l_k@t-online.de>
----
- Source/JavaScriptCore/b3/B3Validate.cpp | 12 +++++++++---
- 1 file changed, 9 insertions(+), 3 deletions(-)
-
-diff --git a/Source/JavaScriptCore/b3/B3Validate.cpp b/Source/JavaScriptCore/b3/B3Validate.cpp
-index eaaa3749..1d089783 100644
---- a/Source/JavaScriptCore/b3/B3Validate.cpp
-+++ b/Source/JavaScriptCore/b3/B3Validate.cpp
-@@ -47,6 +47,12 @@
- #include <wtf/StringPrintStream.h>
- #include <wtf/text/CString.h>
- 
-+#if ENABLE(WEBASSEMBLY) && ENABLE(WEBASSEMBLY_B3JIT)
-+#define simdScalarTypeToB3Type(type) toB3Type(Wasm::simdScalarType(type))
-+#else
-+#define simdScalarTypeToB3Type(type) B3::Type()
-+#endif
-+
- namespace JSC { namespace B3 {
- 
- namespace {
-@@ -454,7 +460,7 @@ public:
-             case VectorExtractLane:
-                 VALIDATE(!value->kind().hasExtraBits(), ("At ", *value));
-                 VALIDATE(value->numChildren() == 1, ("At ", *value));
--                VALIDATE(value->type() == toB3Type(Wasm::simdScalarType(value->asSIMDValue()->simdLane())), ("At ", *value));
-+                VALIDATE(value->type() == simdScalarTypeToB3Type(value->asSIMDValue()->simdLane()), ("At ", *value));
-                 VALIDATE(value->child(0)->type() == V128, ("At ", *value));
-                 break;
-             case VectorReplaceLane:
-@@ -462,7 +468,7 @@ public:
-                 VALIDATE(value->numChildren() == 2, ("At ", *value));
-                 VALIDATE(value->type() == V128, ("At ", *value));
-                 VALIDATE(value->child(0)->type() == V128, ("At ", *value));
--                VALIDATE(value->child(1)->type() == toB3Type(Wasm::simdScalarType(value->asSIMDValue()->simdLane())), ("At ", *value));
-+                VALIDATE(value->child(1)->type() == simdScalarTypeToB3Type(value->asSIMDValue()->simdLane()), ("At ", *value));
-                 break;
-             case VectorDupElement:
-                 VALIDATE(!value->kind().hasExtraBits(), ("At ", *value));
-@@ -484,7 +490,7 @@ public:
-                 VALIDATE(!value->kind().hasExtraBits(), ("At ", *value));
-                 VALIDATE(value->numChildren() == 1, ("At ", *value));
-                 VALIDATE(value->type() == V128, ("At ", *value));
--                VALIDATE(value->child(0)->type() == toB3Type(Wasm::simdScalarType(value->asSIMDValue()->simdLane())), ("At ", *value));
-+                VALIDATE(value->child(0)->type() == simdScalarTypeToB3Type(value->asSIMDValue()->simdLane()), ("At ", *value));
-                 break;
- 
-             case VectorPopcnt:
diff --git a/meta/recipes-sato/webkit/webkitgtk/bmalloc-fix.patch b/meta/recipes-sato/webkit/webkitgtk/bmalloc-fix.patch
new file mode 100644
index 00000000000..37e0fdcbbdc
--- /dev/null
+++ b/meta/recipes-sato/webkit/webkitgtk/bmalloc-fix.patch
@@ -0,0 +1,36 @@
+From 6ab7d3f7d8d0d8e1ab401d0fb13f60bbc64279a2 Mon Sep 17 00:00:00 2001
+From: Thomas Klausner <wiz@gatalith.at>
+Date: Thu, 7 Nov 2024 11:54:30 -0800
+Subject: [PATCH] bmalloc: Build problem in bmalloc when X11/X.h is in the same
+ namespace https://bugs.webkit.org/show_bug.cgi?id=282693
+
+This avoids a build problem when the X11/X.h is included,
+which defines Success to '0'.
+
+Reviewed by Fujii Hironori.
+
+* Source/bmalloc/bmalloc/EligibilityResult.h:
+
+Canonical link: https://commits.webkit.org/286295@main
+Upstream-Status: Backport [https://github.com/WebKit/WebKit/commit/6ab7d3f7d8d0d8e1ab401d0fb13f60bbc64279a2]
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+---
+ Source/bmalloc/bmalloc/EligibilityResult.h | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/Source/bmalloc/bmalloc/EligibilityResult.h b/Source/bmalloc/bmalloc/EligibilityResult.h
+index ead7dbb52c07a..48f9e5bfe8a80 100644
+--- a/Source/bmalloc/bmalloc/EligibilityResult.h
++++ b/Source/bmalloc/bmalloc/EligibilityResult.h
+@@ -29,6 +29,11 @@
+ 
+ #if !BUSE(LIBPAS)
+ 
++/* avoid conflict with symbol from X11 headers */
++#ifdef Success
++#undef Success
++#endif
++
+ namespace bmalloc {
+ 
+ enum class EligibilityKind {
diff --git a/meta/recipes-sato/webkit/webkitgtk/no-musttail-arm.patch b/meta/recipes-sato/webkit/webkitgtk/no-musttail-arm.patch
index 793be48df2e..c98d8b7727b 100644
--- a/meta/recipes-sato/webkit/webkitgtk/no-musttail-arm.patch
+++ b/meta/recipes-sato/webkit/webkitgtk/no-musttail-arm.patch
@@ -1,4 +1,4 @@
-From 31dca9601888f2a539dfb22693ffd62c22ee8912 Mon Sep 17 00:00:00 2001
+From 4602261fa44d6bbb4c3698c79e08a6a40a6edc5a Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 12 Jan 2024 09:21:39 -0800
 Subject: [PATCH] clang/arm: Do not use MUST_TAIL_CALL
@@ -16,15 +16,15 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/Source/WTF/wtf/Compiler.h b/Source/WTF/wtf/Compiler.h
-index 449ca502..daac29d7 100644
+index c01ed849..b69b1527 100644
 --- a/Source/WTF/wtf/Compiler.h
 +++ b/Source/WTF/wtf/Compiler.h
-@@ -321,7 +321,7 @@
- /* MUST_TAIL_CALL */
- 
+@@ -290,7 +290,7 @@
+ #if COMPILER(CLANG)
+ #if __SIZEOF_POINTER__ == 8
  #if !defined(MUST_TAIL_CALL) && defined(__cplusplus) && defined(__has_cpp_attribute)
--#if __has_cpp_attribute(clang::musttail)
-+#if __has_cpp_attribute(clang::musttail) && !defined(__arm__)
+-#if __has_cpp_attribute(clang::musttail) && !defined(__powerpc__)
++#if __has_cpp_attribute(clang::musttail) && !defined(__powerpc__) && !defined(__arm__)
  #define MUST_TAIL_CALL [[clang::musttail]]
  #endif
  #endif
diff --git a/meta/recipes-sato/webkit/webkitgtk/reproducibility.patch b/meta/recipes-sato/webkit/webkitgtk/reproducibility.patch
index d614a1ee4f6..436ad2f02c7 100644
--- a/meta/recipes-sato/webkit/webkitgtk/reproducibility.patch
+++ b/meta/recipes-sato/webkit/webkitgtk/reproducibility.patch
@@ -1,4 +1,4 @@
-From cb5458b5d15aafa3543a47a33975609026d45d32 Mon Sep 17 00:00:00 2001
+From 65e9a68c9d05f4902c2fc34303b7f8233ffa98d5 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Mon, 3 Jan 2022 14:18:34 +0000
 Subject: [PATCH] webkitgtk: Add reproducibility fix
diff --git a/meta/recipes-sato/webkit/webkitgtk/t6-not-declared.patch b/meta/recipes-sato/webkit/webkitgtk/t6-not-declared.patch
index 064925dace9..82d20758c24 100644
--- a/meta/recipes-sato/webkit/webkitgtk/t6-not-declared.patch
+++ b/meta/recipes-sato/webkit/webkitgtk/t6-not-declared.patch
@@ -1,4 +1,4 @@
-From 36c092723ec6d4908039341c9d157db8ab1c0a59 Mon Sep 17 00:00:00 2001
+From 29431aec88764072a032aa4411e26e566a3a6c0b Mon Sep 17 00:00:00 2001
 From: Michael Catanzaro <mcatanzaro@redhat.com>
 Date: Mon, 5 Feb 2024 11:00:49 -0600
 Subject: [PATCH] =?UTF-8?q?LowLevelInterpreter.cpp:339:21:=20error:=20?=
@@ -21,10 +21,10 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 2 deletions(-)
 
 diff --git a/Source/JavaScriptCore/llint/LowLevelInterpreter.cpp b/Source/JavaScriptCore/llint/LowLevelInterpreter.cpp
-index 75cecbbd..b1020ea4 100644
+index 76c46889..500be433 100644
 --- a/Source/JavaScriptCore/llint/LowLevelInterpreter.cpp
 +++ b/Source/JavaScriptCore/llint/LowLevelInterpreter.cpp
-@@ -336,8 +336,6 @@ JSValue CLoop::execute(OpcodeID entryOpcodeID, void* executableAddress, VM* vm,
+@@ -334,8 +334,6 @@ JSValue CLoop::execute(OpcodeID entryOpcodeID, void* executableAddress, VM* vm,
      UNUSED_VARIABLE(t2);
      UNUSED_VARIABLE(t3);
      UNUSED_VARIABLE(t5);
diff --git a/meta/recipes-sato/webkit/webkitgtk_2.44.3.bb b/meta/recipes-sato/webkit/webkitgtk_2.46.4.bb
similarity index 96%
rename from meta/recipes-sato/webkit/webkitgtk_2.44.3.bb
rename to meta/recipes-sato/webkit/webkitgtk_2.46.4.bb
index 2bb6316d892..f7d0b5e0505 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.44.3.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.46.4.bb
@@ -15,11 +15,10 @@ SRC_URI = "https://www.webkitgtk.org/releases/${BPN}-${PV}.tar.xz \
            file://0001-CMake-Add-a-variable-to-control-macro-__PAS_ALWAYS_I.patch \
            file://no-musttail-arm.patch \
            file://t6-not-declared.patch \
-           file://30e1d5e22213fdaca2a29ec3400c927d710a37a8.patch \
-           file://0001-Fix-build-issues-with-latest-Clang.patch \
            file://0001-Support-ICU-76.1-build.patch \
+           file://bmalloc-fix.patch \
            "
-SRC_URI[sha256sum] = "dc82d042ecaca981a4852357c06e5235743319cf10a94cd36ad41b97883a0b54"
+SRC_URI[sha256sum] = "0eff5f0ab0a2872ec87df62bc32e3289c8af625716ac71e94b298d74e0374176"
 
 inherit cmake pkgconfig gobject-introspection perlnative features_check upstream-version-is-even gi-docgen
 
@@ -81,6 +80,7 @@ PACKAGECONFIG[media-recorder] = "-DENABLE_MEDIA_RECORDER=ON,-DENABLE_MEDIA_RECOR
 PACKAGECONFIG[jpegxl] = "-DUSE_JPEGXL=ON,-DUSE_JPEGXL=OFF,libjxl"
 PACKAGECONFIG[backtrace] = "-DUSE_LIBBACKTRACE=ON,-DUSE_LIBBACKTRACE=OFF,libbacktrace"
 PACKAGECONFIG[gamepad] = "-DENABLE_GAMEPAD=ON,-DENABLE_GAMEPAD=OFF,libmanette"
+PACKAGECONFIG[sysprof-capture] = "-DUSE_SYSTEM_SYSPROF_CAPTURE=YES,-DUSE_SYSTEM_SYSPROF_CAPTURE=NO,sysprof"
 
 EXTRA_OECMAKE = " \
                  -DPORT=GTK \
@@ -91,6 +91,7 @@ EXTRA_OECMAKE = " \
                  -DENABLE_BUBBLEWRAP_SANDBOX=OFF \
                  -DUSE_GTK4=ON \
                  -DCMAKE_EXPORT_COMPILE_COMMANDS=OFF \
+                 -DENABLE_RELEASE_LOG=ON \
                  "
 
 # Unless DEBUG_BUILD is enabled, pass -g1 to massively reduce the size of the
-- 
2.39.5


