Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65A26CA0EF5
	for <webhook@archiver.kernel.org>; Tue, 19 Aug 2025 01:01:39 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web10.3282.1755565294755089212
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Aug 2025 18:01:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Oh0hDLXc;
 spf=pass (domain: gmail.com, ip: 209.85.210.179, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-76e39ec6f30so3718766b3a.2
        for <openembedded-core@lists.openembedded.org>; Mon, 18 Aug 2025 18:01:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755565294; x=1756170094; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zNLxgsLcHEFJtifQX8KRWbiSzuyKF9nJE+lcnaLCTPE=;
        b=Oh0hDLXcBQX+cljnbfk97ALW9R3nuVZPKWwTskInUCdTECcCYm0QzknkmsmJkX799s
         n6aJXZWq3vKBItLLtbZctmyiZ9A8d1TPc5aPKAzFSsHG/M3Yx9CGZWr6C0Z3zKTvnXId
         OyC0Bx385YSssRaUvCN5sC3xqjSt5XQCFOw+stB72XxT3z+Zkq7DpEgqoykBWJUi+8IQ
         0aQNNI3x4h/jaxRVVcD7KYXnO3wQCFNkn43kRQnPVqTLh3bZUjxhUeSZyEjIuf64DCgY
         SOy4+0suSxMlFT/SZnivdrvPHQHOP8yJGDcGn7C8KXP2dLPIr3hzBWO/dKYRU/yTJpxS
         pfsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755565294; x=1756170094;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zNLxgsLcHEFJtifQX8KRWbiSzuyKF9nJE+lcnaLCTPE=;
        b=Z/XZGs6GKVtC9cLfCusrJELac+0VRqdyfQ/p+GPeYOi5ZtH4Zfry+jBUw2B1U4uDM9
         I9U9sanYTn9F7X/SGxFqI4l/Tl6Q/Hy3lMJjJtTwrcKNZfJ4g88vagBPOF5X08cKKLRl
         Nku4MmKJeNmksovVPikZRDWZp92xXEsv437pXF3+Yw2+n3mTm0pwu2DptVh9IInalRel
         z3OuHjmlWVE9bpxEdvrm1gY4fMikDZuGwivdYS5tiZnUgndXRs+h8WhYE3bxBDdVbJq1
         wgVP+E2gte1DpsaAaHWWtekmw8ckkcLx6ruVRIC5ZvG7SkZk4FmvLUVcdU8VmydVAJo0
         r5xw==
X-Gm-Message-State: AOJu0YxPtTKuxmf1D7vRAQHn4qP8FVjeuFydqjMRMVUawycF/KoJj9KD
	+65rZoadYQtD2KZu0fY5sLbkgFhpcKaeTh98714t810h2hXTQx2tNxkM+tab4ihX
X-Gm-Gg: ASbGnctIwpkdX87JAjkA45pUUrNcPiEPn3T9dcdAfAQQqKRc+SAG39C8OwQJxG87uNu
	WuPwutAYEgp2T54+wn2ruzHLoY0ThYgGACOIA8zOzZVS4NA3uzLeGz9BImQLeLuuEZw9uxujVwM
	T3FQ21CqQgcwGOXI6pXzewCNFHglciY7456VLlwpMJUPwgURk6hqE+bnKaKrheqEmrJ6yrsSMf/
	nd6tPN2zjtMrH0P9Azw+4RIh5UU2K5aO37a+0yAtqBtE29g9ALO/wAvfZLzwZB4Jz1SMomemkZV
	ZyDAaAfuFfsl/ZJiMOwmAdb/MkP+tCH61lnejYIDbErOQndzNedIZH1GIYz4KWN42Rt4BgbN1sy
	x1JRhsnWyCNi/oJtcY8vTgA==
X-Google-Smtp-Source: AGHT+IFVkX/AY4x6SvWmZ4QsmIUcns6hgM8G8LNuN7cL7jKMPc+8h9nCRQSe+hAIZ0649ZLpTk/DNQ==
X-Received: by 2002:a05:6a20:72ab:b0:240:1b99:1595 with SMTP id adf61e73a8af0-2430d3766acmr882136637.17.1755565293437;
        Mon, 18 Aug 2025 18:01:33 -0700 (PDT)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::adc2])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76e7d544de1sm777859b3a.94.2025.08.18.18.01.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Aug 2025 18:01:32 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 2/3] spirv-tools: Add SPV_INTEL_function_variants
Date: Mon, 18 Aug 2025 18:01:27 -0700
Message-ID: <20250819010128.3519760-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250819010128.3519760-1-raj.khem@gmail.com>
References: <20250819010128.3519760-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Aug 2025 01:01:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222058

Needed for compiling clang-21

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...on_variants-basic-asm-dis-support-61.patch | 289 ++++++++++++++++++
 .../spir/spirv-tools_1.4.321.0.bb             |   1 +
 2 files changed, 290 insertions(+)
 create mode 100644 meta/recipes-graphics/spir/spirv-tools/0001-SPV_INTEL_function_variants-basic-asm-dis-support-61.patch

diff --git a/meta/recipes-graphics/spir/spirv-tools/0001-SPV_INTEL_function_variants-basic-asm-dis-support-61.patch b/meta/recipes-graphics/spir/spirv-tools/0001-SPV_INTEL_function_variants-basic-asm-dis-support-61.patch
new file mode 100644
index 00000000000..d4ca23c7295
--- /dev/null
+++ b/meta/recipes-graphics/spir/spirv-tools/0001-SPV_INTEL_function_variants-basic-asm-dis-support-61.patch
@@ -0,0 +1,289 @@
+From 28a883ba4c67f58a9540fb0651c647bb02883622 Mon Sep 17 00:00:00 2001
+From: David Neto <dneto@google.com>
+Date: Wed, 25 Jun 2025 11:27:23 -0400
+Subject: [PATCH] SPV_INTEL_function_variants: basic asm, dis support (#6195)
+
+The challenging part is that there are instructions that
+take zero or more Capability operands.  So we have to introduce
+SPV_TYPE_OPERAND_VARIABLE_CAPABILITY and SPV_TYPE_OPERAND_OPTIONAL_CAPABILITY.
+
+Remove deprecated enums for the first and last variable or optional
+enums.
+Upstream-Status: Backport [https://github.com/KhronosGroup/SPIRV-Tools/commit/28a883ba4c67f58a9540fb0651c647bb02883622]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ DEPS                                   |  2 +-
+ include/spirv-tools/libspirv.h         | 48 +++++++----------
+ source/binary.cpp                      |  3 ++
+ source/disassemble.cpp                 |  1 +
+ source/operand.cpp                     |  7 +++
+ test/text_to_binary.extension_test.cpp | 73 ++++++++++++++++++++++++++
+ utils/ggt.py                           |  3 +-
+ 7 files changed, 107 insertions(+), 30 deletions(-)
+
+diff --git a/DEPS b/DEPS
+index e25ca513..511fd718 100644
+--- a/DEPS
++++ b/DEPS
+@@ -14,7 +14,7 @@ vars = {
+ 
+   're2_revision': 'c84a140c93352cdabbfb547c531be34515b12228',
+ 
+-  'spirv_headers_revision': '2a611a970fdbc41ac2e3e328802aed9985352dca',
++  'spirv_headers_revision': '9e3836d7d6023843a72ecd3fbf3f09b1b6747a9e',
+ 
+   'mimalloc_revision': '09a27098aa6e9286518bd9c74e6ffa7199c3f04e',
+ }
+diff --git a/include/spirv-tools/libspirv.h b/include/spirv-tools/libspirv.h
+index a2a032a0..2a604e94 100644
+--- a/include/spirv-tools/libspirv.h
++++ b/include/spirv-tools/libspirv.h
+@@ -189,36 +189,24 @@ typedef enum spv_operand_type_t {
+   SPV_OPERAND_TYPE_MEMORY_ACCESS,          // SPIR-V Sec 3.26
+   SPV_OPERAND_TYPE_FRAGMENT_SHADING_RATE,  // SPIR-V Sec 3.FSR
+ 
+-// NOTE: New concrete enum values should be added at the end.
+-
+-// The "optional" and "variable"  operand types are only used internally by
+-// the assembler and the binary parser.
+-// There are two categories:
+-//    Optional : expands to 0 or 1 operand, like ? in regular expressions.
+-//    Variable : expands to 0, 1 or many operands or pairs of operands.
+-//               This is similar to * in regular expressions.
+-
+-// NOTE: These FIRST_* and LAST_* enum values are DEPRECATED.
+-// The concept of "optional" and "variable" operand types are only intended
+-// for use as an implementation detail of parsing SPIR-V, either in text or
+-// binary form.  Instead of using enum ranges, use characteristic function
+-// spvOperandIsConcrete.
+-// The use of enum value ranges in a public API makes it difficult to insert
+-// new values into a range without also breaking binary compatibility.
+-//
+-// Macros for defining bounds on optional and variable operand types.
+-// Any variable operand type is also optional.
+-// TODO(dneto): Remove SPV_OPERAND_TYPE_FIRST_* and SPV_OPERAND_TYPE_LAST_*
+-#define FIRST_OPTIONAL(ENUM) ENUM, SPV_OPERAND_TYPE_FIRST_OPTIONAL_TYPE = ENUM
+-#define FIRST_VARIABLE(ENUM) ENUM, SPV_OPERAND_TYPE_FIRST_VARIABLE_TYPE = ENUM
+-#define LAST_VARIABLE(ENUM)                         \
+-  ENUM, SPV_OPERAND_TYPE_LAST_VARIABLE_TYPE = ENUM, \
+-        SPV_OPERAND_TYPE_LAST_OPTIONAL_TYPE = ENUM
++  // NOTE: New concrete enum values should be added at the end.
++
++  // The "optional" and "variable"  operand types are only used internally by
++  // the assembler and the binary parser.
++  // There are two categories:
++  //    Optional : expands to 0 or 1 operand, like ? in regular expressions.
++  //    Variable : expands to 0, 1 or many operands or pairs of operands.
++  //               This is similar to * in regular expressions.
++
++  // Use characteristic function spvOperandIsConcrete to classify the
++  // operand types; when it returns false, the operand is optional or variable.
++  //
++  // Any variable operand type is also optional.
+ 
+   // An optional operand represents zero or one logical operands.
+   // In an instruction definition, this may only appear at the end of the
+   // operand types.
+-  FIRST_OPTIONAL(SPV_OPERAND_TYPE_OPTIONAL_ID),
++  SPV_OPERAND_TYPE_OPTIONAL_ID,
+   // An optional image operand type.
+   SPV_OPERAND_TYPE_OPTIONAL_IMAGE,
+   // An optional memory access type.
+@@ -243,7 +231,7 @@ typedef enum spv_operand_type_t {
+   // A variable operand represents zero or more logical operands.
+   // In an instruction definition, this may only appear at the end of the
+   // operand types.
+-  FIRST_VARIABLE(SPV_OPERAND_TYPE_VARIABLE_ID),
++  SPV_OPERAND_TYPE_VARIABLE_ID,
+   SPV_OPERAND_TYPE_VARIABLE_LITERAL_INTEGER,
+   // A sequence of zero or more pairs of (typed literal integer, Id).
+   // Expands to zero or more:
+@@ -251,7 +239,7 @@ typedef enum spv_operand_type_t {
+   // where the literal number must always be an integer of some sort.
+   SPV_OPERAND_TYPE_VARIABLE_LITERAL_INTEGER_ID,
+   // A sequence of zero or more pairs of (Id, Literal integer)
+-  LAST_VARIABLE(SPV_OPERAND_TYPE_VARIABLE_ID_LITERAL_INTEGER),
++  SPV_OPERAND_TYPE_VARIABLE_ID_LITERAL_INTEGER,
+ 
+   // The following are concrete enum types from the DebugInfo extended
+   // instruction set.
+@@ -343,6 +331,10 @@ typedef enum spv_operand_type_t {
+   SPV_OPERAND_TYPE_TENSOR_OPERANDS,
+   SPV_OPERAND_TYPE_OPTIONAL_TENSOR_OPERANDS,
+ 
++  // SPV_INTEL_function_variants
++  SPV_OPERAND_TYPE_OPTIONAL_CAPABILITY,
++  SPV_OPERAND_TYPE_VARIABLE_CAPABILITY,
++
+   // This is a sentinel value, and does not represent an operand type.
+   // It should come last.
+   SPV_OPERAND_TYPE_NUM_OPERAND_TYPES,
+diff --git a/source/binary.cpp b/source/binary.cpp
+index 180d0a99..8e4d899f 100644
+--- a/source/binary.cpp
++++ b/source/binary.cpp
+@@ -636,6 +636,7 @@ spv_result_t Parser::parseOperand(size_t inst_offset,
+     } break;
+ 
+     case SPV_OPERAND_TYPE_CAPABILITY:
++    case SPV_OPERAND_TYPE_OPTIONAL_CAPABILITY:
+     case SPV_OPERAND_TYPE_EXECUTION_MODEL:
+     case SPV_OPERAND_TYPE_ADDRESSING_MODEL:
+     case SPV_OPERAND_TYPE_MEMORY_MODEL:
+@@ -689,6 +690,8 @@ spv_result_t Parser::parseOperand(size_t inst_offset,
+         parsed_operand.type = SPV_OPERAND_TYPE_PACKED_VECTOR_FORMAT;
+       if (type == SPV_OPERAND_TYPE_OPTIONAL_FPENCODING)
+         parsed_operand.type = SPV_OPERAND_TYPE_FPENCODING;
++      if (type == SPV_OPERAND_TYPE_OPTIONAL_CAPABILITY)
++        parsed_operand.type = SPV_OPERAND_TYPE_CAPABILITY;
+ 
+       const spvtools::OperandDesc* entry = nullptr;
+       if (spvtools::LookupOperand(type, word, &entry)) {
+diff --git a/source/disassemble.cpp b/source/disassemble.cpp
+index 2d9bb0ff..4267333a 100644
+--- a/source/disassemble.cpp
++++ b/source/disassemble.cpp
+@@ -907,6 +907,7 @@ void InstructionDisassembler::EmitOperand(std::ostream& stream,
+       stream << '"';
+     } break;
+     case SPV_OPERAND_TYPE_CAPABILITY:
++    case SPV_OPERAND_TYPE_OPTIONAL_CAPABILITY:
+     case SPV_OPERAND_TYPE_SOURCE_LANGUAGE:
+     case SPV_OPERAND_TYPE_EXECUTION_MODEL:
+     case SPV_OPERAND_TYPE_ADDRESSING_MODEL:
+diff --git a/source/operand.cpp b/source/operand.cpp
+index c635c72d..d7fc535c 100644
+--- a/source/operand.cpp
++++ b/source/operand.cpp
+@@ -111,6 +111,7 @@ const char* spvOperandTypeStr(spv_operand_type_t type) {
+     case SPV_OPERAND_TYPE_KERNEL_PROFILING_INFO:
+       return "kernel profiling info";
+     case SPV_OPERAND_TYPE_CAPABILITY:
++    case SPV_OPERAND_TYPE_OPTIONAL_CAPABILITY:
+       return "capability";
+     case SPV_OPERAND_TYPE_RAY_FLAGS:
+       return "ray flags";
+@@ -394,6 +395,7 @@ bool spvOperandIsOptional(spv_operand_type_t type) {
+     case SPV_OPERAND_TYPE_OPTIONAL_RAW_ACCESS_CHAIN_OPERANDS:
+     case SPV_OPERAND_TYPE_OPTIONAL_FPENCODING:
+     case SPV_OPERAND_TYPE_OPTIONAL_TENSOR_OPERANDS:
++    case SPV_OPERAND_TYPE_OPTIONAL_CAPABILITY:
+       return true;
+     default:
+       break;
+@@ -408,6 +410,7 @@ bool spvOperandIsVariable(spv_operand_type_t type) {
+     case SPV_OPERAND_TYPE_VARIABLE_LITERAL_INTEGER:
+     case SPV_OPERAND_TYPE_VARIABLE_LITERAL_INTEGER_ID:
+     case SPV_OPERAND_TYPE_VARIABLE_ID_LITERAL_INTEGER:
++    case SPV_OPERAND_TYPE_VARIABLE_CAPABILITY:
+       return true;
+     default:
+       break;
+@@ -439,6 +442,10 @@ bool spvExpandOperandSequenceOnce(spv_operand_type_t type,
+       pattern->push_back(SPV_OPERAND_TYPE_LITERAL_INTEGER);
+       pattern->push_back(SPV_OPERAND_TYPE_OPTIONAL_ID);
+       return true;
++    case SPV_OPERAND_TYPE_VARIABLE_CAPABILITY:
++      pattern->push_back(type);
++      pattern->push_back(SPV_OPERAND_TYPE_OPTIONAL_CAPABILITY);
++      return true;
+     default:
+       break;
+   }
+diff --git a/test/text_to_binary.extension_test.cpp b/test/text_to_binary.extension_test.cpp
+index 65079d1b..39accfc1 100644
+--- a/test/text_to_binary.extension_test.cpp
++++ b/test/text_to_binary.extension_test.cpp
+@@ -1495,5 +1495,78 @@ INSTANTIATE_TEST_SUITE_P(
+                                SaturatedToLargestFloat8NormalConversionEXT)})},
+         })));
+ 
++// SPV_INTEL_function_variants
++// https://github.com/intel/llvm/blob/sycl/sycl/doc/design/spirv-extensions/SPV_INTEL_function_variants.asciidoc
++INSTANTIATE_TEST_SUITE_P(
++    SPV_INTEL_function_variants, ExtensionRoundTripTest,
++    Combine(
++        Values(SPV_ENV_UNIVERSAL_1_0, SPV_ENV_UNIVERSAL_1_6),
++        ValuesIn(std::vector<AssemblyCase>{
++            {"OpExtension \"SPV_INTEL_function_variants\"\n",
++             MakeInstruction(spv::Op::OpExtension,
++                             MakeVector("SPV_INTEL_function_variants"))},
++            {"OpCapability SpecConditionalINTEL\n",
++             MakeInstruction(
++                 spv::Op::OpCapability,
++                 {(uint32_t)spv::Capability::SpecConditionalINTEL})},
++            {"OpCapability FunctionVariantsINTEL\n",
++             MakeInstruction(
++                 spv::Op::OpCapability,
++                 {(uint32_t)spv::Capability::FunctionVariantsINTEL})},
++            {"OpDecorate %1 ConditionalINTEL %2\n",
++             MakeInstruction(spv::Op::OpDecorate,
++                             {1, (uint32_t)spv::Decoration::ConditionalINTEL,
++                              2})},
++
++            {"OpConditionalExtensionINTEL %1 \"foo\"\n",
++             MakeInstruction(spv::Op::OpConditionalExtensionINTEL, {1},
++                             MakeVector("foo"))},
++
++            {"OpConditionalEntryPointINTEL %1 Kernel %2 \"foo\"\n",
++             MakeInstruction(spv::Op::OpConditionalEntryPointINTEL,
++                             {1, (uint32_t)spv::ExecutionModel::Kernel, 2},
++                             MakeVector("foo"))},
++
++            {"OpConditionalCapabilityINTEL %1 Kernel\n",
++             MakeInstruction(spv::Op::OpConditionalCapabilityINTEL,
++                             {1, (uint32_t)spv::ExecutionModel::Kernel})},
++
++            {"%2 = OpSpecConstantTargetINTEL %1 42\n",
++             MakeInstruction(spv::Op::OpSpecConstantTargetINTEL, {1, 2, 42})},
++
++            {"%2 = OpSpecConstantTargetINTEL %1 42 99\n",
++             MakeInstruction(spv::Op::OpSpecConstantTargetINTEL,
++                             {1, 2, 42, 99})},
++
++            {"%2 = OpSpecConstantTargetINTEL %1 42 99 108\n",
++             MakeInstruction(spv::Op::OpSpecConstantTargetINTEL,
++                             {1, 2, 42, 99, 108})},
++
++            {"%2 = OpSpecConstantArchitectureINTEL %1 42 99 108 72\n",
++             MakeInstruction(spv::Op::OpSpecConstantArchitectureINTEL,
++                             {1, 2, 42, 99, 108, 72})},
++
++            {"%2 = OpSpecConstantCapabilitiesINTEL %1\n",
++             MakeInstruction(spv::Op::OpSpecConstantCapabilitiesINTEL, {1, 2})},
++
++            {"%2 = OpSpecConstantCapabilitiesINTEL %1 Kernel\n",
++             MakeInstruction(spv::Op::OpSpecConstantCapabilitiesINTEL,
++                             {1, 2, (uint32_t)spv::Capability::Kernel})},
++
++            {"%2 = OpSpecConstantCapabilitiesINTEL %1 Kernel Shader\n",
++             MakeInstruction(spv::Op::OpSpecConstantCapabilitiesINTEL,
++                             {1, 2, (uint32_t)spv::Capability::Kernel,
++                              (uint32_t)spv::Capability::Shader})},
++
++            {"%2 = OpConditionalCopyObjectINTEL %1 %3 %4\n",
++             MakeInstruction(spv::Op::OpConditionalCopyObjectINTEL,
++                             {1, 2, 3, 4})},
++
++            {"%2 = OpConditionalCopyObjectINTEL %1 %3 %4 %5 %6\n",
++             MakeInstruction(spv::Op::OpConditionalCopyObjectINTEL,
++                             {1, 2, 3, 4, 5, 6})},
++
++        })));
++
+ }  // namespace
+ }  // namespace spvtools
+diff --git a/utils/ggt.py b/utils/ggt.py
+index 258c1b00..45262ba8 100755
+--- a/utils/ggt.py
++++ b/utils/ggt.py
+@@ -242,7 +242,8 @@ class Grammar():
+                 'MatrixMultiplyAccumulateOperands',
+                 'RawAccessChainOperands',
+                 'FPEncoding',
+-                'TensorOperands']
++                'TensorOperands',
++                'Capability']
+ 
+     def dump(self) -> None:
+         self.context.dump()
diff --git a/meta/recipes-graphics/spir/spirv-tools_1.4.321.0.bb b/meta/recipes-graphics/spir/spirv-tools_1.4.321.0.bb
index 319b25b7f43..30c42e915f9 100644
--- a/meta/recipes-graphics/spir/spirv-tools_1.4.321.0.bb
+++ b/meta/recipes-graphics/spir/spirv-tools_1.4.321.0.bb
@@ -9,6 +9,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 SRCREV = "33e02568181e3312f49a3cf33df470bf96ef293a"
 SRC_URI = "git://github.com/KhronosGroup/SPIRV-Tools.git;branch=main;protocol=https \
+           file://0001-SPV_INTEL_function_variants-basic-asm-dis-support-61.patch \
            "
 PE = "1"
 # These recipes need to be updated in lockstep with each other:

