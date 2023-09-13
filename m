Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1590EDEC6A
	for <webhook@archiver.kernel.org>; Wed, 13 Sep 2023 14:31:06 +0000 (UTC)
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
 by mx.groups.io with SMTP id smtpd.web11.13610.1694615462931091758
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Sep 2023 07:31:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=PxWsYNgw;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.170, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-517ab9a4a13so5379221a12.1
        for <openembedded-core@lists.openembedded.org>; Wed, 13 Sep 2023 07:31:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1694615462; x=1695220262; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BfZrC1bh45PRITjcINwyEBSAoM6jAOXgjcOK/3ozmt4=;
        b=PxWsYNgwl1wLOcGbJu5Gxo0eH2gwbQCqNFbOIruPNbCLOyU1jxoohQrbHj1fcLjIRu
         jN6YmW6pbEsHH6+Ghps60GjelfVrgWwxDOhnHGqQi9ixI1K3uZOOKAZ5iHlchP7L3Pn0
         couopWIUTFtUpZQVRtKa8oTNs3dtlARDv8OP5byIPk1nGo7/NtdvbhAwLbX977T3Lm/a
         /HA6FfQCQnIEmGE15ttqvMMpSMsG7KILnh8/Ooj45g9itqSoG2QbuUBYPdYqVThvH2OK
         tvgJsDwxtgf2b22/BxmjIBNRmxF95P6Jf2xCjomnno6oQLTdQ12qVXIkREiQmc2nv82f
         N5Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694615462; x=1695220262;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BfZrC1bh45PRITjcINwyEBSAoM6jAOXgjcOK/3ozmt4=;
        b=I10N1bMEGZuZ5VrMWAWI0f2LsCkQDuo4TIXmFKVTnRRFD6vV3NIlFGGIGHAflYACK/
         D3DyvDusjassx0l5qLslBWjtcWzAbQ17tXbYB743QJZ8xYRUqfpUkZyh+49n7+FE37xc
         3QHRUqlKZXnQot/hR9D67hmMjdJVvrfWIFI80qihgi5Jmp+WhPaEVla99Gc31wz2A07n
         TCpIRfiGCl1aMZrheheUi9JHM9y8h1q8bal+fSgUvusm5wAfBLO7CUaPPmbXFAuIQiSa
         k2rCSBjWmLo5S1K0Bup1UoJn3x4IVP2YLEvZjQsiN3ZuxIsh9VH53AraPDq4Pf9O1OXb
         M6fg==
X-Gm-Message-State: AOJu0YwMJiwYHxeajfs4ILyqtBrMLYjla0kl9zqVFgOQghP/3W2w2B/R
	dSfaA4CI2c4888IK0HHvdBBTDiLXCANLaoiPEuI=
X-Google-Smtp-Source: AGHT+IFWwYLFU5up6tW2gPvBlBYIM+eUt60pAd7m4lszkKUItr/6IwLg27xNZIuPmMkwW9MsVRcKBg==
X-Received: by 2002:a05:6a20:7489:b0:153:7515:9919 with SMTP id p9-20020a056a20748900b0015375159919mr2806966pzd.21.1694615461553;
        Wed, 13 Sep 2023 07:31:01 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id u2-20020aa78382000000b00686ec858fb0sm9185796pfm.190.2023.09.13.07.31.00
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Sep 2023 07:31:00 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 6/8] webkitgtk: fix CVE-2022-48503
Date: Wed, 13 Sep 2023 04:30:38 -1000
Message-Id: <8f956bc19963a02ee7b908bb49301a2ea5052066.1694613269.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1694613269.git.steve@sakoman.com>
References: <cover.1694613269.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Sep 2023 14:31:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187601

From: Yogita Urade <yogita.urade@windriver.com>

The issue was addressed with improved bounds checks. This issue
is fixed in tvOS 15.6, watchOS 8.7, iOS 15.6 and iPadOS 15.6,
macOS Monterey 12.5, Safari 15.6. Processing web content may
lead to arbitrary code execution.

References:
https://nvd.nist.gov/vuln/detail/CVE-2022-48503
https://support.apple.com/en-us/HT213340
https://bugs.webkit.org/show_bug.cgi?id=241931

Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../webkit/webkitgtk/CVE-2022-48503.patch     | 225 ++++++++++++++++++
 meta/recipes-sato/webkit/webkitgtk_2.36.8.bb  |   1 +
 2 files changed, 226 insertions(+)
 create mode 100644 meta/recipes-sato/webkit/webkitgtk/CVE-2022-48503.patch

diff --git a/meta/recipes-sato/webkit/webkitgtk/CVE-2022-48503.patch b/meta/recipes-sato/webkit/webkitgtk/CVE-2022-48503.patch
new file mode 100644
index 0000000000..b67751736d
--- /dev/null
+++ b/meta/recipes-sato/webkit/webkitgtk/CVE-2022-48503.patch
@@ -0,0 +1,225 @@
+From 612c245823a515c8c70c2ad486957bd8a850f0f9 Mon Sep 17 00:00:00 2001
+From: Yusuke Suzuki <ysuzuki@apple.com>
+Date: Tue, 5 Sep 2023 08:40:19 +0000
+Subject: [PATCH] [JSC] Refactor wasm section ordering code
+ https://bugs.webkit.org/show_bug.cgi?id=241931 rdar://83326477
+
+Reviewed by Keith Miller.
+
+This patch refactors existing validateOrder code since it is too adhoc right now.
+
+* Source/JavaScriptCore/wasm/WasmModuleInformation.h:
+(JSC::Wasm::ModuleInformation::dataSegmentsCount const):
+* Source/JavaScriptCore/wasm/WasmSectionParser.cpp:
+(JSC::Wasm::SectionParser::parseData):
+(JSC::Wasm::SectionParser::parseDataCount):
+* Source/JavaScriptCore/wasm/WasmSectionParser.h:
+* Source/JavaScriptCore/wasm/WasmSections.h:
+(JSC::Wasm::orderingNumber):
+(JSC::Wasm::isKnownSection):
+(JSC::Wasm::validateOrder):
+(JSC::Wasm::makeString):
+* Source/JavaScriptCore/wasm/WasmStreamingParser.cpp:
+(JSC::Wasm::StreamingParser::parseSectionPayload):
+(JSC::Wasm::StreamingParser::finalize):
+
+Canonical link: https://commits.webkit.org/251800@main
+
+CVE: CVE-2022-48503
+
+Upstream-Status: Backport [https://github.com/WebKit/WebKit/commit/612c245823a515c8c70c2ad486957bd8a850f0f9]
+
+Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
+---
+ .../wasm/WasmModuleInformation.h              |  4 +-
+ .../JavaScriptCore/wasm/WasmSectionParser.cpp |  3 ++
+ .../JavaScriptCore/wasm/WasmSectionParser.h   |  2 +-
+ Source/JavaScriptCore/wasm/WasmSections.h     | 52 +++++++++++--------
+ .../wasm/WasmStreamingParser.cpp              | 11 +++-
+ 5 files changed, 45 insertions(+), 27 deletions(-)
+
+diff --git a/Source/JavaScriptCore/wasm/WasmModuleInformation.h b/Source/JavaScriptCore/wasm/WasmModuleInformation.h
+index ae6bbeed..f9f1baf7 100644
+--- a/Source/JavaScriptCore/wasm/WasmModuleInformation.h
++++ b/Source/JavaScriptCore/wasm/WasmModuleInformation.h
+@@ -86,7 +86,7 @@ struct ModuleInformation : public ThreadSafeRefCounted<ModuleInformation> {
+     uint32_t memoryCount() const { return memory ? 1 : 0; }
+     uint32_t tableCount() const { return tables.size(); }
+     uint32_t elementCount() const { return elements.size(); }
+-    uint32_t dataSegmentsCount() const { return numberOfDataSegments; }
++    uint32_t dataSegmentsCount() const { return numberOfDataSegments.value_or(0); }
+
+     const TableInformation& table(unsigned index) const { return tables[index]; }
+
+@@ -131,7 +131,7 @@ struct ModuleInformation : public ThreadSafeRefCounted<ModuleInformation> {
+     Vector<CustomSection> customSections;
+     Ref<NameSection> nameSection;
+     BranchHints branchHints;
+-    uint32_t numberOfDataSegments { 0 };
++    std::optional<uint32_t> numberOfDataSegments;
+
+     BitVector m_declaredFunctions;
+     BitVector m_declaredExceptions;
+diff --git a/Source/JavaScriptCore/wasm/WasmSectionParser.cpp b/Source/JavaScriptCore/wasm/WasmSectionParser.cpp
+index 5b511811..c55ee3c0 100644
+--- a/Source/JavaScriptCore/wasm/WasmSectionParser.cpp
++++ b/Source/JavaScriptCore/wasm/WasmSectionParser.cpp
+@@ -768,6 +768,8 @@ auto SectionParser::parseData() -> PartialResult
+     uint32_t segmentCount;
+     WASM_PARSER_FAIL_IF(!parseVarUInt32(segmentCount), "can't get Data section's count");
+     WASM_PARSER_FAIL_IF(segmentCount > maxDataSegments, "Data section's count is too big ", segmentCount, " maximum ", maxDataSegments);
++    if (m_info->numberOfDataSegments)
++        WASM_PARSER_FAIL_IF(segmentCount != m_info->numberOfDataSegments.value(), "Data section's count ", segmentCount, " is different from Data Count section's count ", m_info->numberOfDataSegments.value());
+     WASM_PARSER_FAIL_IF(!m_info->data.tryReserveCapacity(segmentCount), "can't allocate enough memory for Data section's ", segmentCount, " segments");
+
+     for (uint32_t segmentNumber = 0; segmentNumber < segmentCount; ++segmentNumber) {
+@@ -847,6 +849,7 @@ auto SectionParser::parseDataCount() -> PartialResult
+ {
+     uint32_t numberOfDataSegments;
+     WASM_PARSER_FAIL_IF(!parseVarUInt32(numberOfDataSegments), "can't get Data Count section's count");
++    WASM_PARSER_FAIL_IF(numberOfDataSegments > maxDataSegments, "Data Count section's count is too big ", numberOfDataSegments , " maximum ", maxDataSegments);
+
+     m_info->numberOfDataSegments = numberOfDataSegments;
+     return { };
+diff --git a/Source/JavaScriptCore/wasm/WasmSectionParser.h b/Source/JavaScriptCore/wasm/WasmSectionParser.h
+index 91fd3ed8..4d7dcbac 100644
+--- a/Source/JavaScriptCore/wasm/WasmSectionParser.h
++++ b/Source/JavaScriptCore/wasm/WasmSectionParser.h
+@@ -44,7 +44,7 @@ public:
+     {
+     }
+
+-#define WASM_SECTION_DECLARE_PARSER(NAME, ID, DESCRIPTION) PartialResult WARN_UNUSED_RETURN parse ## NAME();
++#define WASM_SECTION_DECLARE_PARSER(NAME, ID, ORDERING, DESCRIPTION) PartialResult WARN_UNUSED_RETURN parse ## NAME();
+     FOR_EACH_KNOWN_WASM_SECTION(WASM_SECTION_DECLARE_PARSER)
+ #undef WASM_SECTION_DECLARE_PARSER
+
+diff --git a/Source/JavaScriptCore/wasm/WasmSections.h b/Source/JavaScriptCore/wasm/WasmSections.h
+index bef20701..b422a587 100644
+--- a/Source/JavaScriptCore/wasm/WasmSections.h
++++ b/Source/JavaScriptCore/wasm/WasmSections.h
+@@ -33,20 +33,21 @@ IGNORE_RETURN_TYPE_WARNINGS_BEGIN
+
+ namespace JSC { namespace Wasm {
+
++// macro(Name, ID, OrderingNumber, Description).
+ #define FOR_EACH_KNOWN_WASM_SECTION(macro) \
+-    macro(Type,       1, "Function signature declarations") \
+-    macro(Import,     2, "Import declarations") \
+-    macro(Function,   3, "Function declarations") \
+-    macro(Table,      4, "Indirect function table and other tables") \
+-    macro(Memory,     5, "Memory attributes") \
+-    macro(Global,     6, "Global declarations") \
+-    macro(Export,     7, "Exports") \
+-    macro(Start,      8, "Start function declaration") \
+-    macro(Element,    9, "Elements section") \
+-    macro(Code,      10, "Function bodies (code)") \
+-    macro(Data,      11, "Data segments") \
+-    macro(DataCount, 12, "Data count") \
+-    macro(Exception, 13, "Exception declarations") \
++    macro(Type,       1,  1, "Function signature declarations") \
++    macro(Import,     2,  2, "Import declarations") \
++    macro(Function,   3,  3, "Function declarations") \
++    macro(Table,      4,  4, "Indirect function table and other tables") \
++    macro(Memory,     5,  5, "Memory attributes") \
++    macro(Global,     6,  7, "Global declarations") \
++    macro(Export,     7,  8, "Exports") \
++    macro(Start,      8,  9, "Start function declaration") \
++    macro(Element,    9, 10, "Elements section") \
++    macro(Code,      10, 12, "Function bodies (code)") \
++    macro(Data,      11, 13, "Data segments") \
++    macro(DataCount, 12, 11, "Data count") \
++    macro(Exception, 13,  6, "Exception declarations") \
+
+ enum class Section : uint8_t {
+     // It's important that Begin is less than every other section number and that Custom is greater.
+@@ -54,18 +55,29 @@ enum class Section : uint8_t {
+     // Also, Begin is not a real section but is used as a marker for validating the ordering
+     // of sections.
+     Begin = 0,
+-#define DEFINE_WASM_SECTION_ENUM(NAME, ID, DESCRIPTION) NAME = ID,
++#define DEFINE_WASM_SECTION_ENUM(NAME, ID, ORDERING, DESCRIPTION) NAME = ID,
+     FOR_EACH_KNOWN_WASM_SECTION(DEFINE_WASM_SECTION_ENUM)
+ #undef DEFINE_WASM_SECTION_ENUM
+     Custom
+ };
+ static_assert(static_cast<uint8_t>(Section::Begin) < static_cast<uint8_t>(Section::Type), "Begin should come before the first known section.");
+
++inline unsigned orderingNumber(Section section)
++{
++    switch (section) {
++#define ORDERING_OF_SECTION(NAME, ID, ORDERING, DESCRIPTION) case Section::NAME: return ORDERING;
++        FOR_EACH_KNOWN_WASM_SECTION(ORDERING_OF_SECTION)
++#undef VALIDATE_SECTION
++    default:
++        return static_cast<unsigned>(section);
++    }
++}
++
+ template<typename Int>
+ inline bool isKnownSection(Int section)
+ {
+     switch (section) {
+-#define VALIDATE_SECTION(NAME, ID, DESCRIPTION) case static_cast<Int>(Section::NAME): return true;
++#define VALIDATE_SECTION(NAME, ID, ORDERING, DESCRIPTION) case static_cast<Int>(Section::NAME): return true;
+         FOR_EACH_KNOWN_WASM_SECTION(VALIDATE_SECTION)
+ #undef VALIDATE_SECTION
+     default:
+@@ -89,13 +101,7 @@ inline bool decodeSection(uint8_t sectionByte, Section& section)
+ inline bool validateOrder(Section previousKnown, Section next)
+ {
+     ASSERT(isKnownSection(previousKnown) || previousKnown == Section::Begin);
+-    if (previousKnown == Section::DataCount && next == Section::Code)
+-        return true;
+-    if (previousKnown == Section::Exception)
+-        return next >= Section::Global;
+-    if (next == Section::Exception)
+-        return previousKnown <= Section::Memory;
+-    return static_cast<uint8_t>(previousKnown) < static_cast<uint8_t>(next);
++    return orderingNumber(previousKnown) < orderingNumber(next);
+ }
+
+ inline const char* makeString(Section section)
+@@ -105,7 +111,7 @@ inline const char* makeString(Section section)
+         return "Begin";
+     case Section::Custom:
+         return "Custom";
+-#define STRINGIFY_SECTION_NAME(NAME, ID, DESCRIPTION) case Section::NAME: return #NAME;
++#define STRINGIFY_SECTION_NAME(NAME, ID, ORDERING, DESCRIPTION) case Section::NAME: return #NAME;
+         FOR_EACH_KNOWN_WASM_SECTION(STRINGIFY_SECTION_NAME)
+ #undef STRINGIFY_SECTION_NAME
+     }
+diff --git a/Source/JavaScriptCore/wasm/WasmStreamingParser.cpp b/Source/JavaScriptCore/wasm/WasmStreamingParser.cpp
+index fa552eff..25e7e32d 100644
+--- a/Source/JavaScriptCore/wasm/WasmStreamingParser.cpp
++++ b/Source/JavaScriptCore/wasm/WasmStreamingParser.cpp
+@@ -161,7 +161,7 @@ auto StreamingParser::parseSectionPayload(Vector<uint8_t>&& data) -> State
+ {
+     SectionParser parser(data.data(), data.size(), m_offset, m_info.get());
+     switch (m_section) {
+-#define WASM_SECTION_PARSE(NAME, ID, DESCRIPTION) \
++#define WASM_SECTION_PARSE(NAME, ID, ORDERING, DESCRIPTION) \
+     case Section::NAME: { \
+         WASM_STREAMING_PARSER_FAIL_IF_HELPER_FAILS(parser.parse ## NAME()); \
+         break; \
+@@ -393,9 +393,18 @@ auto StreamingParser::finalize() -> State
+             m_state = fail("Number of functions parsed (", m_functionCount, ") does not match the number of declared functions (", m_info->functions.size(), ")");
+             break;
+         }
++
++        if (m_info->numberOfDataSegments) {
++            if (UNLIKELY(m_info->data.size() != m_info->numberOfDataSegments.value())) {
++                m_state = fail("Data section's count ", m_info->data.size(), " is different from Data Count section's count ", m_info->numberOfDataSegments.value());
++                break;
++            }
++        }
++
+         if (m_remaining.isEmpty()) {
+             if (UNLIKELY(Options::useEagerWebAssemblyModuleHashing()))
+                 m_info->nameSection->setHash(m_hasher.computeHexDigest());
++
+             m_state = State::Finished;
+             m_client.didFinishParsing();
+         } else
+--
+2.40.0
diff --git a/meta/recipes-sato/webkit/webkitgtk_2.36.8.bb b/meta/recipes-sato/webkit/webkitgtk_2.36.8.bb
index 20f475bebd..10fcd0813a 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.36.8.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.36.8.bb
@@ -22,6 +22,7 @@ SRC_URI = "https://www.webkitgtk.org/releases/${BP}.tar.xz \
            file://CVE-2022-42867.patch \
            file://CVE-2022-46700.patch \
            file://CVE-2023-23529.patch \
+           file://CVE-2022-48503.patch \
            "
 SRC_URI[sha256sum] = "0ad9fb6bf28308fe3889faf184bd179d13ac1b46835d2136edbab2c133d00437"
 
-- 
2.34.1


