Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AFC9CD3430
	for <webhook@archiver.kernel.org>; Tue,  3 Sep 2024 04:40:37 +0000 (UTC)
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
 by mx.groups.io with SMTP id smtpd.web10.15841.1725338426507566336
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Sep 2024 21:40:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BqMJD26B;
 spf=pass (domain: gmail.com, ip: 209.85.219.171, mailfrom: raj.khem@gmail.com)
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-e04196b7603so5258003276.0
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Sep 2024 21:40:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725338425; x=1725943225; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mpZIZm2ZjKOQ1JmH9hd4GOHLZ4yij+9h6X3VyS6ItwY=;
        b=BqMJD26BhlqqziZ9pqOfk5uBLwVR8xeaMlhFKLyg7+tMfzMwV/OBqJSgnCQfjxTlhY
         x3KLDh3ychwpn70RyTCvdK9E89+jmwk2kE59cvJjDWbD/Wkx/EIGWOWc7TCrPBWuM8m0
         1nl06lzl5aoEGXKZZQuHqaylHYtFZWQ/IUZwRkGZZEV2ZxvwOutILi0G+f3rhtoYJA5R
         0fgjlW/zZx44xGlFtl0kB446QPuCX3q96VHP7iBRn6JQ8jwqhzno13G6ItyXLPbSnded
         0+MthwiuyIKgzxjzp8M90SRWu+q/h1bnNHHmyJMIVXcL9+rc6iIk0AD6plUe7SLjVLXE
         9PKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725338425; x=1725943225;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mpZIZm2ZjKOQ1JmH9hd4GOHLZ4yij+9h6X3VyS6ItwY=;
        b=WD8QyQIrRioQUUOWFM1CNmitTOc3bcdtUdJUIW2zJPyaSVizlIdxWuLrEWW8q+m1Db
         JdloCElWm7ZD8GOOlUhLgaH/oztpkqeBa7+F0ioARB/wKMK8e2ABlAo+n8H7KQ6A0oK8
         hm71MMBq4t7UA31VHIhR/m4kPVRi67+n1pI0MSxFSx0/V8lg6ODNwjz7008I4aZCwkSU
         GCwRlHQCnO4uboY5f4c5UsQKYQB5uvS7iLrstl8Or5G2HxgNxW5tRQPvXbmxVs+1kVo6
         bvHbZaG1lKUoJ62UhWPIlYnBo4Of/ofiACTf0vwQ6XQBL505q7AtVgkUJzEZ1PoKKTtA
         0rIg==
X-Gm-Message-State: AOJu0Yy94h0n12niiXptGHehz4mbCISPlbHInRcitor9XWLwax3BFSoQ
	hWsyXISpzw0yfdNfg1dsBamQzCdC0L+oJN1yMv76eEcDAoyZdsWTIYPqsfcD
X-Google-Smtp-Source: AGHT+IHhQztlHE38LTWCiJkDjaE2LZvZfJ6dba9P7PgdsUFtq1POIdUq9zvX4YN0xb5x7Pk0qJOvSw==
X-Received: by 2002:a05:6902:e09:b0:e1c:eb3c:2c19 with SMTP id 3f1490d57ef6-e1ceb3c2cfamr2860276276.28.1725338425102;
        Mon, 02 Sep 2024 21:40:25 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:9d80:4380::496c])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7d22e743245sm6989103a12.10.2024.09.02.21.40.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Sep 2024 21:40:24 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 2/2] webkitgtk: Fix build issues with clang-19
Date: Mon,  2 Sep 2024 21:40:18 -0700
Message-ID: <20240903044018.3470887-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240903044018.3470887-1-raj.khem@gmail.com>
References: <20240903044018.3470887-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Sep 2024 04:40:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204118

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...1-Fix-build-issues-with-latest-Clang.patch | 251 ++++++++++++++++++
 meta/recipes-sato/webkit/webkitgtk_2.44.3.bb  |   1 +
 2 files changed, 252 insertions(+)
 create mode 100644 meta/recipes-sato/webkit/webkitgtk/0001-Fix-build-issues-with-latest-Clang.patch

diff --git a/meta/recipes-sato/webkit/webkitgtk/0001-Fix-build-issues-with-latest-Clang.patch b/meta/recipes-sato/webkit/webkitgtk/0001-Fix-build-issues-with-latest-Clang.patch
new file mode 100644
index 00000000000..2be899fea84
--- /dev/null
+++ b/meta/recipes-sato/webkit/webkitgtk/0001-Fix-build-issues-with-latest-Clang.patch
@@ -0,0 +1,251 @@
+From 257ed304fb3e71d412568dcbed7129c145812fdf Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 2 Sep 2024 21:38:12 -0700
+Subject: [PATCH] Fix build issues with latest Clang
+ https://bugs.webkit.org/show_bug.cgi?id=276198 rdar://130933637
+
+Reviewed by Yusuke Suzuki.
+
+The use of the template keyword to reference template members without a template argument list was deprecated in the C++ standard.
+e.g. `foo.template bar()` nows needs to be `foo.template bar<>()`. I ran into a different issue with `std::reference_wrapper` that
+blocked me from going any further, which AFAICT is a bug on the Clang side.
+
+This also fixes a few other warnings that popped up while building with the new Clang denoted inline
+
+* Source/JavaScriptCore/ftl/FTLLowerDFGToB3.cpp:
+(JSC::FTL::DFG::LowerDFGToB3::compileCompareStrictEq): Clang didn't like the implicit static_cast<int32_t>(UINT32_MAX) so make it explicit with a static_assert no data was lost.
+* Source/JavaScriptCore/jit/AssemblyHelpers.cpp:
+(JSC::AssemblyHelpers::emitNonNullDecodeZeroExtendedStructureID): Clang didn't like the implicit static_cast<int32_t>(UINT32_MAX) so make it explicit with a static_assert no data was lost.
+* Source/JavaScriptCore/llint/InPlaceInterpreter.cpp:
+* Source/JavaScriptCore/llint/LLIntData.h:
+(JSC::LLInt::getCodeFunctionPtr):
+(JSC::LLInt::getWide16CodeFunctionPtr):
+(JSC::LLInt::getWide32CodeFunctionPtr):
+* Source/JavaScriptCore/parser/Nodes.h: Missing definition of ModuleScopeData added include.
+* Source/JavaScriptCore/runtime/JSCast.h:
+(JSC::JSCastingHelpers::inherits):
+(JSC::jsDynamicCast):
+* Source/ThirdParty/libwebrtc/Source/third_party/boringssl/src/crypto/bio/connect.c:
+(conn_callback_ctrl): Had a warning about an incompatible function type. Seems like this is intentional suppressed the warning.
+* Source/WTF/wtf/cf/TypeCastsCF.h: Had a warning about extra namespace qualification. I just moved it out of the namespace. That said, it feels like this warning shouldn't apply to macro expansions...
+* Source/WebCore/PAL/ThirdParty/libavif/ThirdParty/dav1d/src/decode.c:
+(decode_b): Had a warning about different types on the middle/right of a ternary expression. I just pushed the comparison inside the ternary.
+
+Canonical link: https://commits.webkit.org/280700@main
+
+Upstream-Status: Backport [https://github.com/WebKit/WebKit/commit/62b6e2db547e#diff-136d848d7c1b400da9b486916b67592b54e5abf7c66ac247697a93ae2fb743a9]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ Source/JavaScriptCore/ftl/FTLLowerDFGToB3.cpp    |  6 ++++--
+ Source/JavaScriptCore/jit/AssemblyHelpers.cpp    |  6 ++++--
+ .../JavaScriptCore/llint/InPlaceInterpreter.cpp  | 16 ++++++++--------
+ Source/JavaScriptCore/llint/LLIntData.h          | 12 ++++++------
+ Source/JavaScriptCore/llint/LLIntThunks.cpp      |  2 +-
+ Source/JavaScriptCore/parser/Nodes.h             |  4 ++--
+ Source/JavaScriptCore/runtime/JSCast.h           |  4 ++--
+ 7 files changed, 27 insertions(+), 23 deletions(-)
+
+diff --git a/Source/JavaScriptCore/ftl/FTLLowerDFGToB3.cpp b/Source/JavaScriptCore/ftl/FTLLowerDFGToB3.cpp
+index 42a4eae7..dd987726 100644
+--- a/Source/JavaScriptCore/ftl/FTLLowerDFGToB3.cpp
++++ b/Source/JavaScriptCore/ftl/FTLLowerDFGToB3.cpp
+@@ -22930,8 +22930,10 @@ IGNORE_CLANG_WARNINGS_END
+         return m_out.shl(m_out.zeroExtPtr(structureID), m_out.constIntPtr(StructureID::encodeShiftAmount));
+ #else
+         LValue maskedStructureID = structureID;
+-        if constexpr (structureHeapAddressSize < 4 * GB)
+-            maskedStructureID = m_out.bitAnd(structureID, m_out.constInt32(StructureID::structureIDMask));
++        if constexpr (structureHeapAddressSize < 4 * GB) {
++            static_assert(static_cast<uint32_t>(StructureID::structureIDMask) == StructureID::structureIDMask);
++            maskedStructureID = m_out.bitAnd(structureID, m_out.constInt32(static_cast<uint32_t>(StructureID::structureIDMask)));
++        }
+         return m_out.bitOr(m_out.constIntPtr(startOfStructureHeap()), m_out.zeroExtPtr(maskedStructureID));
+ #endif
+     }
+diff --git a/Source/JavaScriptCore/jit/AssemblyHelpers.cpp b/Source/JavaScriptCore/jit/AssemblyHelpers.cpp
+index c939d27a..982dc46f 100644
+--- a/Source/JavaScriptCore/jit/AssemblyHelpers.cpp
++++ b/Source/JavaScriptCore/jit/AssemblyHelpers.cpp
+@@ -677,8 +677,10 @@ void AssemblyHelpers::emitNonNullDecodeZeroExtendedStructureID(RegisterID source
+     if constexpr (structureHeapAddressSize >= 4 * GB) {
+         ASSERT(structureHeapAddressSize == 4 * GB);
+         move(source, dest);
+-    } else
+-        and32(TrustedImm32(StructureID::structureIDMask), source, dest);
++    } else {
++        static_assert(static_cast<uint32_t>(StructureID::structureIDMask) == StructureID::structureIDMask);
++        and32(TrustedImm32(static_cast<uint32_t>(StructureID::structureIDMask)), source, dest);
++    }
+     or64(TrustedImm64(startOfStructureHeap()), dest);
+ #else // not CPU(ADDRESS64)
+     move(source, dest);
+diff --git a/Source/JavaScriptCore/llint/InPlaceInterpreter.cpp b/Source/JavaScriptCore/llint/InPlaceInterpreter.cpp
+index b9442b4f..a1d5a6c4 100644
+--- a/Source/JavaScriptCore/llint/InPlaceInterpreter.cpp
++++ b/Source/JavaScriptCore/llint/InPlaceInterpreter.cpp
+@@ -43,8 +43,8 @@ namespace JSC { namespace IPInt {
+ do { \
+     void* base = reinterpret_cast<void*>(ipint_unreachable_validate); \
+     void* ptr = reinterpret_cast<void*>(ipint_ ## name ## _validate); \
+-    void* untaggedBase = CodePtr<CFunctionPtrTag>::fromTaggedPtr(base).template untaggedPtr(); \
+-    void* untaggedPtr = CodePtr<CFunctionPtrTag>::fromTaggedPtr(ptr).template untaggedPtr(); \
++    void* untaggedBase = CodePtr<CFunctionPtrTag>::fromTaggedPtr(base).template untaggedPtr<>(); \
++    void* untaggedPtr = CodePtr<CFunctionPtrTag>::fromTaggedPtr(ptr).template untaggedPtr<>(); \
+     RELEASE_ASSERT_WITH_MESSAGE((char*)(untaggedPtr) - (char*)(untaggedBase) == opcode * 256, #name); \
+ } while (false);
+ 
+@@ -52,8 +52,8 @@ do { \
+ do { \
+     void* base = reinterpret_cast<void*>(ipint_i32_trunc_sat_f32_s_validate); \
+     void* ptr = reinterpret_cast<void*>(ipint_ ## name ## _validate); \
+-    void* untaggedBase = CodePtr<CFunctionPtrTag>::fromTaggedPtr(base).template untaggedPtr(); \
+-    void* untaggedPtr = CodePtr<CFunctionPtrTag>::fromTaggedPtr(ptr).template untaggedPtr(); \
++    void* untaggedBase = CodePtr<CFunctionPtrTag>::fromTaggedPtr(base).template untaggedPtr<>(); \
++    void* untaggedPtr = CodePtr<CFunctionPtrTag>::fromTaggedPtr(ptr).template untaggedPtr<>(); \
+     RELEASE_ASSERT_WITH_MESSAGE((char*)(untaggedPtr) - (char*)(untaggedBase) == opcode * 256, #name); \
+ } while (false);
+ 
+@@ -61,8 +61,8 @@ do { \
+ do { \
+     void* base = reinterpret_cast<void*>(ipint_simd_v128_load_mem_validate); \
+     void* ptr = reinterpret_cast<void*>(ipint_ ## name ## _validate); \
+-    void* untaggedBase = CodePtr<CFunctionPtrTag>::fromTaggedPtr(base).template untaggedPtr(); \
+-    void* untaggedPtr = CodePtr<CFunctionPtrTag>::fromTaggedPtr(ptr).template untaggedPtr(); \
++    void* untaggedBase = CodePtr<CFunctionPtrTag>::fromTaggedPtr(base).template untaggedPtr<>(); \
++    void* untaggedPtr = CodePtr<CFunctionPtrTag>::fromTaggedPtr(ptr).template untaggedPtr<>(); \
+     RELEASE_ASSERT_WITH_MESSAGE((char*)(untaggedPtr) - (char*)(untaggedBase) == opcode * 256, #name); \
+ } while (false);
+ 
+@@ -70,8 +70,8 @@ do { \
+ do { \
+     void* base = reinterpret_cast<void*>(ipint_memory_atomic_notify_validate); \
+     void* ptr = reinterpret_cast<void*>(ipint_ ## name ## _validate); \
+-    void* untaggedBase = CodePtr<CFunctionPtrTag>::fromTaggedPtr(base).template untaggedPtr(); \
+-    void* untaggedPtr = CodePtr<CFunctionPtrTag>::fromTaggedPtr(ptr).template untaggedPtr(); \
++    void* untaggedBase = CodePtr<CFunctionPtrTag>::fromTaggedPtr(base).template untaggedPtr<>(); \
++    void* untaggedPtr = CodePtr<CFunctionPtrTag>::fromTaggedPtr(ptr).template untaggedPtr<>(); \
+     RELEASE_ASSERT_WITH_MESSAGE((char*)(untaggedPtr) - (char*)(untaggedBase) == opcode * 256, #name); \
+ } while (false);
+ 
+diff --git a/Source/JavaScriptCore/llint/LLIntData.h b/Source/JavaScriptCore/llint/LLIntData.h
+index 97de867e..87a2971d 100644
+--- a/Source/JavaScriptCore/llint/LLIntData.h
++++ b/Source/JavaScriptCore/llint/LLIntData.h
+@@ -217,7 +217,7 @@ ALWAYS_INLINE LLIntCode getCodeFunctionPtr(OpcodeID opcodeID)
+ #if COMPILER(MSVC)
+     return reinterpret_cast<LLIntCode>(getCodePtr<tag>(opcodeID).taggedPtr());
+ #else
+-    return reinterpret_cast<LLIntCode>(getCodePtr<tag>(opcodeID).template taggedPtr());
++    return reinterpret_cast<LLIntCode>(getCodePtr<tag>(opcodeID).template taggedPtr<>());
+ #endif
+ }
+ 
+@@ -227,7 +227,7 @@ ALWAYS_INLINE LLIntCode getWide16CodeFunctionPtr(OpcodeID opcodeID)
+ #if COMPILER(MSVC)
+     return reinterpret_cast<LLIntCode>(getWide16CodePtr<tag>(opcodeID).taggedPtr());
+ #else
+-    return reinterpret_cast<LLIntCode>(getWide16CodePtr<tag>(opcodeID).template taggedPtr());
++    return reinterpret_cast<LLIntCode>(getWide16CodePtr<tag>(opcodeID).template taggedPtr<>());
+ #endif
+ }
+ 
+@@ -237,7 +237,7 @@ ALWAYS_INLINE LLIntCode getWide32CodeFunctionPtr(OpcodeID opcodeID)
+ #if COMPILER(MSVC)
+     return reinterpret_cast<LLIntCode>(getWide32CodePtr<tag>(opcodeID).taggedPtr());
+ #else
+-    return reinterpret_cast<LLIntCode>(getWide32CodePtr<tag>(opcodeID).template taggedPtr());
++    return reinterpret_cast<LLIntCode>(getWide32CodePtr<tag>(opcodeID).template taggedPtr<>());
+ #endif
+ }
+ #else // not ENABLE(JIT)
+@@ -361,7 +361,7 @@ ALWAYS_INLINE LLIntCode getCodeFunctionPtr(WasmOpcodeID opcodeID)
+ #if COMPILER(MSVC)
+     return reinterpret_cast<LLIntCode>(getCodePtr<tag>(opcodeID).taggedPtr());
+ #else
+-    return reinterpret_cast<LLIntCode>(getCodePtr<tag>(opcodeID).template taggedPtr());
++    return reinterpret_cast<LLIntCode>(getCodePtr<tag>(opcodeID).template taggedPtr<>());
+ #endif
+ }
+ 
+@@ -371,7 +371,7 @@ ALWAYS_INLINE LLIntCode getWide16CodeFunctionPtr(WasmOpcodeID opcodeID)
+ #if COMPILER(MSVC)
+     return reinterpret_cast<LLIntCode>(getWide16CodePtr<tag>(opcodeID).taggedPtr());
+ #else
+-    return reinterpret_cast<LLIntCode>(getWide16CodePtr<tag>(opcodeID).template taggedPtr());
++    return reinterpret_cast<LLIntCode>(getWide16CodePtr<tag>(opcodeID).template taggedPtr<>());
+ #endif
+ }
+ 
+@@ -381,7 +381,7 @@ ALWAYS_INLINE LLIntCode getWide32CodeFunctionPtr(WasmOpcodeID opcodeID)
+ #if COMPILER(MSVC)
+     return reinterpret_cast<LLIntCode>(getWide32CodePtr<tag>(opcodeID).taggedPtr());
+ #else
+-    return reinterpret_cast<LLIntCode>(getWide32CodePtr<tag>(opcodeID).template taggedPtr());
++    return reinterpret_cast<LLIntCode>(getWide32CodePtr<tag>(opcodeID).template taggedPtr<>());
+ #endif
+ }
+ #else // not ENABLE(JIT)
+diff --git a/Source/JavaScriptCore/llint/LLIntThunks.cpp b/Source/JavaScriptCore/llint/LLIntThunks.cpp
+index 13269469..e41fa5b8 100644
+--- a/Source/JavaScriptCore/llint/LLIntThunks.cpp
++++ b/Source/JavaScriptCore/llint/LLIntThunks.cpp
+@@ -227,7 +227,7 @@ ALWAYS_INLINE void* untaggedPtr(void* ptr)
+ #if COMPILER(MSVC)
+         return CodePtr<CFunctionPtrTag>::fromTaggedPtr(ptr).untaggedPtr();
+ #else
+-        return CodePtr<CFunctionPtrTag>::fromTaggedPtr(ptr).template untaggedPtr();
++        return CodePtr<CFunctionPtrTag>::fromTaggedPtr(ptr).template untaggedPtr<>();
+ #endif
+ }
+ 
+diff --git a/Source/JavaScriptCore/parser/Nodes.h b/Source/JavaScriptCore/parser/Nodes.h
+index 01af81b7..70b87088 100644
+--- a/Source/JavaScriptCore/parser/Nodes.h
++++ b/Source/JavaScriptCore/parser/Nodes.h
+@@ -1,7 +1,7 @@
+ /*
+  *  Copyright (C) 1999-2000 Harri Porten (porten@kde.org)
+  *  Copyright (C) 2001 Peter Kelly (pmk@post.com)
+- *  Copyright (C) 2003-2019 Apple Inc. All rights reserved.
++ *  Copyright (C) 2003-2024 Apple Inc. All rights reserved.
+  *  Copyright (C) 2007 Cameron Zwarich (cwzwarich@uwaterloo.ca)
+  *  Copyright (C) 2007 Maks Orlovich
+  *  Copyright (C) 2007 Eric Seidel <eric@webkit.org>
+@@ -29,6 +29,7 @@
+ #include "ImplementationVisibility.h"
+ #include "JITCode.h"
+ #include "Label.h"
++#include "ModuleScopeData.h"
+ #include "ParserArena.h"
+ #include "ParserModes.h"
+ #include "ParserTokens.h"
+@@ -49,7 +50,6 @@ namespace JSC {
+     class FunctionMetadataNode;
+     class FunctionParameters;
+     class ModuleAnalyzer;
+-    class ModuleScopeData;
+     class PropertyListNode;
+     class ReadModifyResolveNode;
+     class RegisterID;
+diff --git a/Source/JavaScriptCore/runtime/JSCast.h b/Source/JavaScriptCore/runtime/JSCast.h
+index a44b6e38..e5664a8b 100644
+--- a/Source/JavaScriptCore/runtime/JSCast.h
++++ b/Source/JavaScriptCore/runtime/JSCast.h
+@@ -236,7 +236,7 @@ template<typename Target, typename From>
+ bool inherits(From* from)
+ {
+     using Dispatcher = InheritsTraits<Target>;
+-    return Dispatcher::template inherits(from);
++    return Dispatcher::template inherits<>(from);
+ }
+ 
+ } // namespace JSCastingHelpers
+@@ -245,7 +245,7 @@ template<typename To, typename From>
+ To jsDynamicCast(From* from)
+ {
+     using Dispatcher = JSCastingHelpers::InheritsTraits<typename std::remove_cv<typename std::remove_pointer<To>::type>::type>;
+-    if (LIKELY(Dispatcher::template inherits(from)))
++    if (LIKELY(Dispatcher::template inherits<>(from)))
+         return static_cast<To>(from);
+     return nullptr;
+ }
diff --git a/meta/recipes-sato/webkit/webkitgtk_2.44.3.bb b/meta/recipes-sato/webkit/webkitgtk_2.44.3.bb
index 90fb7a1d42e..00431407fa3 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.44.3.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.44.3.bb
@@ -16,6 +16,7 @@ SRC_URI = "https://www.webkitgtk.org/releases/${BPN}-${PV}.tar.xz \
            file://no-musttail-arm.patch \
            file://t6-not-declared.patch \
            file://30e1d5e22213fdaca2a29ec3400c927d710a37a8.patch \
+           file://0001-Fix-build-issues-with-latest-Clang.patch \
            "
 SRC_URI[sha256sum] = "dc82d042ecaca981a4852357c06e5235743319cf10a94cd36ad41b97883a0b54"
 

