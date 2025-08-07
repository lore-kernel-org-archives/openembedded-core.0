Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7DE1C87FCF
	for <webhook@archiver.kernel.org>; Thu,  7 Aug 2025 17:20:22 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web11.1646.1754587212922503044
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Aug 2025 10:20:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OwaW31Wk;
 spf=pass (domain: gmail.com, ip: 209.85.218.46, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-af95b919093so192283966b.2
        for <openembedded-core@lists.openembedded.org>; Thu, 07 Aug 2025 10:20:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754587211; x=1755192011; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Jf1qDgmnCEOw5f0Z9A3eURhc5gp7U28iImR8HPtPAHA=;
        b=OwaW31Wk0vaHz1ytMEAiH4srxsmahjhn8Y2YlAh1jQODOQzzQEEtFkt+3iOXXvf3WQ
         K1AyD/J3VTKOilmgVB2OJu8gLxfhmk/OybfD9XL69vIvpxh5toZ3MjRbdHcOA/SDkXza
         Xvj8wAerA4f5VSdEiH1LNeEOye/KShucecYIoHktxmT5mgzX949oHQwWyV6UiQTv649/
         9d8Od2zO36y93HTsPYG7faruaTyy1rML40su1HB+FVANdbYfcKG+4FY0NfUGc2ar7RF7
         LnHW7AhYiHTikyW+pBEB3fabnsEErMybp6SGVWGgLvdTQZl4xp4d6MjbFIjVFmD9Ssli
         7kCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754587211; x=1755192011;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Jf1qDgmnCEOw5f0Z9A3eURhc5gp7U28iImR8HPtPAHA=;
        b=DmwNR1aBmmzAfmHGU20RwiHip4qmKQ/oyjKwNaWN5zv47S9tOfgL27USC/ncDPRjpC
         dafcOwtXuaCVQLPzZg1QJc07xASvruC5onuQVv1MFwSKF23dfWKwqsjUyHWSE9bmu6Bm
         3ua630zGHETMGqP9Uq7rwMvyB8sbuBU5CqciUwWucYU5Cc1UerZZHu/38vy7OpCAVgV7
         3xTT1Zz4wPhFXPNaHYJgOyA0qtmtjydKqiZqKa08MN8gLtSEuYn+s+jzTO9rmqO7qjpj
         BQNfatRQtuA63sKhy0wb33j/Gi9hNh8ihtUq/YUm1mOxzzXTF9KOTOdvaCmbAcYQ3SpZ
         5Pfg==
X-Gm-Message-State: AOJu0YytHJsSc6He6/FVrtdCkiydENAF7js8okmLDjJn3QowCXVeuO0A
	Hk6VY2IWARL0G5wmIY+jEElfcpAMu5EICXV+ZK9iiJbwwqke1PePP/3eoouxzQ==
X-Gm-Gg: ASbGncvWWdcy2W8Yb54DH2dFzqr8CgDbShviIGPzYPRpzstYss8ivynLJTjo16iO5sZ
	Q9HHDAXTzYNpRIvcpWM0HtvQnV7hAStUp51KjTqD+tDCTmNfj1lKqCvMEe6f35Sc1q2cbIlyvcI
	/uD3h8FuSiVvDzBO6Bdf8GlbKP7cvHApvBbSewdoP/DFtoI5g/I1LdvQWSSnPpwEjyaxLZdgjOU
	MxjHaTvqRUxQCe/gP9OJsgodKuF+P6JXgo64t+LhrgNqV98crUUJUYEDcXGw2pOFC7uW0gf5uc9
	u2v8PpBLN2jCoh7BnxAK6Ue9pIJlcDU5eXeXuvJG07cxwtlxNA/uuDWQM2N08lcu7TwpXhNWRs0
	rOOo70lz3P9gacRUG+Pk=
X-Google-Smtp-Source: AGHT+IEag8NHIVRadilO9R522m5NiX56aTKGEZL5XMyonVKIOpjVyQUtLbyoIjhChjMDGL05VGbG4A==
X-Received: by 2002:a17:907:1ca0:b0:af9:566c:4cd1 with SMTP id a640c23a62f3a-af99031d310mr675759666b.24.1754587210860;
        Thu, 07 Aug 2025 10:20:10 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a076620sm1333521066b.10.2025.08.07.10.20.10
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Aug 2025 10:20:10 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] webkitgtk: fix compiling for 32-bit Arm
Date: Thu,  7 Aug 2025 19:20:09 +0200
Message-ID: <20250807172009.3692562-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Aug 2025 17:20:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221570

When compiling for 32-bit Arm taget, the compilation fails with the
following error:

| .../webkitgtk/2.48.5/sources/webkitgtk-2.48.5/Source/JavaScriptCore/offlineasm/ast.rb:1004:in 'Instruction#lowerDefault': Unhandled opcode addq at WebAssembly.asm:739 (due to WebAssembly.asm:739) (LoweringError)

The cause is a recent commit, which introduced an assembly opcode
without gating it, however this opcode is not available on all
platforms.

To avoid the problem, add a patch that reverts this commit on 32-bit Arm
architectures until this is fixed upstream (bugreport submitted).

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 ...ck-289651.534-safari-7621-branch-a8d.patch | 160 ++++++++++++++++++
 meta/recipes-sato/webkit/webkitgtk_2.48.5.bb  |   3 +
 2 files changed, 163 insertions(+)
 create mode 100644 meta/recipes-sato/webkit/webkitgtk/0001-Revert-Cherry-pick-289651.534-safari-7621-branch-a8d.patch

diff --git a/meta/recipes-sato/webkit/webkitgtk/0001-Revert-Cherry-pick-289651.534-safari-7621-branch-a8d.patch b/meta/recipes-sato/webkit/webkitgtk/0001-Revert-Cherry-pick-289651.534-safari-7621-branch-a8d.patch
new file mode 100644
index 0000000000..1dc4dc7b69
--- /dev/null
+++ b/meta/recipes-sato/webkit/webkitgtk/0001-Revert-Cherry-pick-289651.534-safari-7621-branch-a8d.patch
@@ -0,0 +1,160 @@
+From 35e52b719635a004e19726674fd03b4bb3d8f043 Mon Sep 17 00:00:00 2001
+From: Gyorgy Sarvari <skandigraun@gmail.com>
+Date: Thu, 7 Aug 2025 18:02:37 +0200
+Subject: [PATCH] Revert "Cherry-pick 289651.534@safari-7621-branch
+ (a8d546461042). https://bugs.webkit.org/show_bug.cgi?id=292621"
+
+This commit causes a build failure on 32-bit arm:
+webkitgtk-2.48.5/Source/JavaScriptCore/offlineasm/ast.rb:1004:in 'Instruction#lowerDefault': Unhandled opcode addq at WebAssembly.asm:739 (due to WebAssembly.asm:739) (LoweringError)
+
+The reverted commit[1] is fixing a potential undefined behavior due
+to uninitialized memory content, which, by looking at the code, has been present 
+since 08.2024. (The commit references a bugreport which requires elevated access 
+rights, so no details are available)
+
+[1]: https://github.com/WebKit/WebKit/commit/846b3f034f0021a0e45358b904682bc3de367605
+
+Upstream-Status: Inappropriate [cross-compiling workaround. bugreport: https://bugs.webkit.org/show_bug.cgi?id=297062]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ Source/JavaScriptCore/llint/WebAssembly.asm | 49 +++++----------------
+ Source/JavaScriptCore/wasm/js/JSToWasm.cpp  | 36 +++------------
+ 2 files changed, 18 insertions(+), 67 deletions(-)
+
+diff --git a/Source/JavaScriptCore/llint/WebAssembly.asm b/Source/JavaScriptCore/llint/WebAssembly.asm
+index 1ac3e2accf3c..754909f8c63e 100644
+--- a/Source/JavaScriptCore/llint/WebAssembly.asm
++++ b/Source/JavaScriptCore/llint/WebAssembly.asm
+@@ -692,6 +692,17 @@ end
+     loadp Callee[cfr], ws0 # WebAssemblyFunction*
+     loadp WebAssemblyFunction::m_instance[ws0], wasmInstance
+ 
++    # Memory
++    if ARM64 or ARM64E
++        loadpairq JSWebAssemblyInstance::m_cachedMemory[wasmInstance], memoryBase, boundsCheckingSize
++    elsif X86_64
++        loadp JSWebAssemblyInstance::m_cachedMemory[wasmInstance], memoryBase
++        loadp JSWebAssemblyInstance::m_cachedBoundsCheckingSize[wasmInstance], boundsCheckingSize
++    end
++    if not ARMv7
++        cagedPrimitiveMayBeNull(memoryBase, wa0)
++    end
++
+     # Allocate stack space
+     loadi WebAssemblyFunction::m_frameSize[ws0], wa0
+     subp sp, wa0, wa0
+@@ -709,51 +720,15 @@ if ASSERT_ENABLED
+     end)
+ end
+ 
+-    # a0 = current stack frame position
+-    move sp, a0
+-
+-    # Save wasmInstance and put the correct Callee into the stack for building the frame
+-    storep wasmInstance, CodeBlock[cfr]
+-
+-if JSVALUE64
+-    loadp Callee[cfr], memoryBase
+-    transferp WebAssemblyFunction::m_boxedJSToWasmCallee[ws0], Callee[cfr]
+-else
+-    # Store old Callee to the stack temporarily
+-    loadp Callee[cfr], ws1
+-    push ws1, ws1
+-    loadp WebAssemblyFunction::m_boxedJSToWasmCallee[ws0], ws1
+-    storep ws1, Callee[cfr]
+-end
+-
+     # Prepare frame
+     move ws0, a2
+     move cfr, a1
++    move sp, a0
+     cCall3(_operationJSToWasmEntryWrapperBuildFrame)
+ 
+-    # Restore Callee slot
+-if JSVALUE64
+-    storep memoryBase, Callee[cfr]
+-else
+-    loadp [sp], ws0
+-    addq 2 * SlotSize, sp
+-    storep ws0, Callee[cfr]
+-end
+-
+     btpnz r1, .buildEntryFrameThrew
+     move r0, ws0
+ 
+-    # Memory
+-    if ARM64 or ARM64E
+-        loadpairq JSWebAssemblyInstance::m_cachedMemory[wasmInstance], memoryBase, boundsCheckingSize
+-    elsif X86_64
+-        loadp JSWebAssemblyInstance::m_cachedMemory[wasmInstance], memoryBase
+-        loadp JSWebAssemblyInstance::m_cachedBoundsCheckingSize[wasmInstance], boundsCheckingSize
+-    end
+-    if not ARMv7
+-        cagedPrimitiveMayBeNull(memoryBase, wa0)
+-    end
+-
+     # Arguments
+ 
+ if ARM64 or ARM64E
+diff --git a/Source/JavaScriptCore/wasm/js/JSToWasm.cpp b/Source/JavaScriptCore/wasm/js/JSToWasm.cpp
+index 10f0771538e6..812b9ae70af3 100644
+--- a/Source/JavaScriptCore/wasm/js/JSToWasm.cpp
++++ b/Source/JavaScriptCore/wasm/js/JSToWasm.cpp
+@@ -241,6 +241,11 @@ MacroAssemblerCodeRef<JITThunkPtrTag> createJSToWasmJITShared()
+ 
+         jit.loadPtr(CCallHelpers::addressFor(CallFrameSlot::callee), GPRInfo::regWS0);
+         jit.loadPtr(CCallHelpers::Address(GPRInfo::regWS0, WebAssemblyFunction::offsetOfInstance()), GPRInfo::wasmContextInstancePointer);
++        // Memory
++#if USE(JSVALUE64)
++        jit.loadPair64(GPRInfo::wasmContextInstancePointer, CCallHelpers::TrustedImm32(JSWebAssemblyInstance::offsetOfCachedMemory()), GPRInfo::wasmBaseMemoryPointer, GPRInfo::wasmBoundsCheckingSizeRegister);
++        jit.cageConditionally(Gigacage::Primitive, GPRInfo::wasmBaseMemoryPointer, GPRInfo::wasmBoundsCheckingSizeRegister, GPRInfo::regWA0);
++#endif
+ 
+         // Now, the current frame is fully set up for exceptions.
+         // Allocate stack space
+@@ -254,44 +259,15 @@ MacroAssemblerCodeRef<JITThunkPtrTag> createJSToWasmJITShared()
+         stackOverflow.append(jit.branchPtr(CCallHelpers::LessThanOrEqual, GPRInfo::regWS1, CCallHelpers::Address(GPRInfo::wasmContextInstancePointer, JSWebAssemblyInstance::offsetOfSoftStackLimit())));
+ 
+         jit.move(GPRInfo::regWS1, CCallHelpers::stackPointerRegister);
+-        jit.move(CCallHelpers::stackPointerRegister, GPRInfo::argumentGPR0);
+-
+-        jit.storePtr(GPRInfo::wasmContextInstancePointer, CCallHelpers::addressFor(CallFrameSlot::codeBlock));
+-
+-        // Save the current Callee before putting in our boxed callee for the stack visitor
+-#if USE(JSVALUE64)
+-        jit.loadPtr(CCallHelpers::addressFor(CallFrameSlot::callee), GPRInfo::wasmBaseMemoryPointer);
+-        jit.transferPtr(CCallHelpers::Address(GPRInfo::regWS0, WebAssemblyFunction::offsetOfBoxedJSToWasmCallee()), CCallHelpers::addressFor(CallFrameSlot::callee));
+-#else
+-        jit.loadPtr(CCallHelpers::addressFor(CallFrameSlot::callee), GPRInfo::regWS1);
+-        jit.push(GPRInfo::regWS1);
+-        jit.push(GPRInfo::regWS1);
+-        jit.transferPtr(CCallHelpers::Address(GPRInfo::regWS0, WebAssemblyFunction::offsetOfBoxedJSToWasmCallee()), CCallHelpers::addressFor(CallFrameSlot::callee));
+-#endif
+ 
+         // Prepare frame
+-        jit.setupArguments<decltype(operationJSToWasmEntryWrapperBuildFrame)>(GPRInfo::argumentGPR0, GPRInfo::callFrameRegister, GPRInfo::regWS0);
++        jit.setupArguments<decltype(operationJSToWasmEntryWrapperBuildFrame)>(CCallHelpers::stackPointerRegister, GPRInfo::callFrameRegister, GPRInfo::regWS0);
+         jit.callOperation<OperationPtrTag>(operationJSToWasmEntryWrapperBuildFrame);
+-
+-        // Restore Callee slot regardless
+-#if USE(JSVALUE64)
+-        jit.storePtr(GPRInfo::wasmBaseMemoryPointer, CCallHelpers::addressFor(CallFrameSlot::callee));
+-#else
+-        jit.transferPtr(CCallHelpers::Address(CCallHelpers::stackPointerRegister, 0), CCallHelpers::addressFor(CallFrameSlot::callee));
+-        jit.addPtr(CCallHelpers::TrustedImm32(2 * 8), CCallHelpers::stackPointerRegister);
+-#endif
+-
+         static_assert(CCallHelpers::operationExceptionRegister<operationJSToWasmEntryWrapperBuildFrame>() != InvalidGPRReg, "We don't have a VM readily available so we rely on exception being returned");
+         JIT_COMMENT(jit, "Exception check: ", CCallHelpers::operationExceptionRegister<operationJSToWasmEntryWrapperBuildFrame>());
+         buildEntryFrameThrew.append(jit.branchTestPtr(CCallHelpers::NonZero, CCallHelpers::operationExceptionRegister<operationJSToWasmEntryWrapperBuildFrame>()));
+         jit.move(GPRInfo::returnValueGPR, GPRInfo::regWS0);
+ 
+-        // Memory
+-#if USE(JSVALUE64)
+-        jit.loadPair64(GPRInfo::wasmContextInstancePointer, CCallHelpers::TrustedImm32(JSWebAssemblyInstance::offsetOfCachedMemory()), GPRInfo::wasmBaseMemoryPointer, GPRInfo::wasmBoundsCheckingSizeRegister);
+-        jit.cageConditionally(Gigacage::Primitive, GPRInfo::wasmBaseMemoryPointer, GPRInfo::wasmBoundsCheckingSizeRegister, GPRInfo::regWA0);
+-#endif
+-
+ #if CPU(ARM64)
+         jit.loadPair64(CCallHelpers::Address(CCallHelpers::stackPointerRegister, 0 * 8), GPRInfo::regWA0, GPRInfo::regWA1);
+         jit.loadPair64(CCallHelpers::Address(CCallHelpers::stackPointerRegister, 2 * 8), GPRInfo::regWA2, GPRInfo::regWA3);
diff --git a/meta/recipes-sato/webkit/webkitgtk_2.48.5.bb b/meta/recipes-sato/webkit/webkitgtk_2.48.5.bb
index 947996450d..1fa735e06e 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.48.5.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.48.5.bb
@@ -19,6 +19,9 @@ SRC_URI = "https://www.webkitgtk.org/releases/${BPN}-${PV}.tar.xz \
            file://0001-Fix-build-errors-on-RISCV-https-bugs.webkit.org-show.patch \
            file://fix-ftbfs-riscv64.patch \
            "
+SRC_URI:append:arm = "file://0001-Revert-Cherry-pick-289651.534-safari-7621-branch-a8d.patch"
+SRC_URI:append:armeb = "file://0001-Revert-Cherry-pick-289651.534-safari-7621-branch-a8d.patch"
+
 SRC_URI[sha256sum] = "bb64ed9d1cfd58e8b5e89ccad71dd31adfed56336bad7695031ad0b668e1987c"
 
 inherit cmake pkgconfig gobject-introspection perlnative features_check upstream-version-is-even gi-docgen

