Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE924EE8002
	for <webhook@archiver.kernel.org>; Fri,  8 Sep 2023 13:47:17 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web10.39139.1694180837318906551
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Sep 2023 06:47:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=bhVVFzXH;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.180, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-68a41031768so1761841b3a.3
        for <openembedded-core@lists.openembedded.org>; Fri, 08 Sep 2023 06:47:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1694180836; x=1694785636; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LviH2Hhpbr7lCMFluPkg/Nv/SbyBYdasewETKWsxuT4=;
        b=bhVVFzXHdHx51Jbal/gN3iCW3XTBuI3M0IexgXeG6U3UWYbjb3uXytJAN58hAQZmhQ
         1PproBEZvymrv8cV1wpepFKTCMALe9yV3sCf2Atyyqn+XoiWNC+4RfFle1sJiwms1ImM
         NrtJ6UosHk9IOAOFIyBTvNazdC7tqkQVB9CUp7OOGYL664EMrgpbhfvVP1VSvA/rJxZI
         1Nm+anF3YbEngg5zjawFAPGzuZD4owYYucuH87kkfPDXS3jdfJGVXUOO/vWQy/RS5EQZ
         SQ54TS3jQeHjs5Xa+0Xt7quCWb9Gnpe4hiyqEsrczMCAtJIHKMzT/+wo5B2sEbGRNeW9
         3ZlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694180836; x=1694785636;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LviH2Hhpbr7lCMFluPkg/Nv/SbyBYdasewETKWsxuT4=;
        b=H+xcd0QXNWd/50Mv7RGW1o/n1mjY2srvBfGgHRvqJc5+9GcEoKLnXRcPbbJxJ0zHv6
         xaiwRNdjO2fB05obUmeOagKO/RMVPGtCPEJ0T/IDxZ0cPZDH2cm+JKEe0eXR10O2TDpq
         pX2UQxA0zUE4mbaJIUQdKEMTVhWDEL6EA/lciC29A2pPqNgdAuBYBIKUN+fC87tJpSFY
         yUYdjLclNaGVzwzJY8iZCvv47xLgXBSaREHmMKCU20W/kStmRJ1nWHeRgn2lLfaZfPbB
         8xIHzsXXpO5efs2kr0uMohY2yKmPUjCj5bGtnjm6V6yh5gLvBPPaex9ozV9vjDlnqRzh
         3hJg==
X-Gm-Message-State: AOJu0YwYtgX5ZlPId+XEuE047HqXZfCIl5mXt717RugqNcob3gtCJt57
	4f3Aj7/RUeRm3Xj0VjMee9jqYXepQ3A3Pq+owuw=
X-Google-Smtp-Source: AGHT+IEfhqYeqwSAvTtPp0YVs/JCZaMNIUigF1kMqpY5PSbddXOhpgpYkVHvdq3aKYEh4o1ozjqojw==
X-Received: by 2002:a05:6a20:e110:b0:153:6a8b:8f5d with SMTP id kr16-20020a056a20e11000b001536a8b8f5dmr3447120pzb.23.1694180836329;
        Fri, 08 Sep 2023 06:47:16 -0700 (PDT)
Received: from xps13.. ([65.154.164.134])
        by smtp.gmail.com with ESMTPSA id x18-20020a056a00271200b00653fe2d527esm1344828pfv.32.2023.09.08.06.47.15
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Sep 2023 06:47:15 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 4/9] webkitgtk: fix CVE-2023-32435
Date: Fri,  8 Sep 2023 03:46:55 -1000
Message-Id: <c54f98d35f2cb276dc49a5ccd4813ccc34c6f668.1694179812.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1694179812.git.steve@sakoman.com>
References: <cover.1694179812.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Sep 2023 13:47:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187426

From: Kai Kang <kai.kang@windriver.com>

Backport and rebase patch to fix CVE-2023-32435 for webkitgtk 2.38.6:

* drop the patches for the files WasmAirIRGenerator64.cpp and
  WasmAirIRGeneratorBase.h which are involved in 2.40.0
* drop test cases as well

CVE: CVE-2023-32435

Signed-off-by: Kai Kang <kai.kang@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../webkit/webkitgtk/CVE-2023-32435.patch     | 59 +++++++++++++++++++
 meta/recipes-sato/webkit/webkitgtk_2.38.6.bb  |  1 +
 2 files changed, 60 insertions(+)
 create mode 100644 meta/recipes-sato/webkit/webkitgtk/CVE-2023-32435.patch

diff --git a/meta/recipes-sato/webkit/webkitgtk/CVE-2023-32435.patch b/meta/recipes-sato/webkit/webkitgtk/CVE-2023-32435.patch
new file mode 100644
index 0000000000..c6ac6b4a1c
--- /dev/null
+++ b/meta/recipes-sato/webkit/webkitgtk/CVE-2023-32435.patch
@@ -0,0 +1,59 @@
+CVE: CVE-2023-32435
+
+Upstream-Status: Backport [https://github.com/WebKit/WebKit/commit/50c7aae]
+
+Backport and rebase patch to fix CVE-2023-32435 for webkitgtk 2.38.6:
+
+* drop the patches for the files WasmAirIRGenerator64.cpp and
+  WasmAirIRGeneratorBase.h which are involved in 2.40.0
+* drop test cases as well
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+
+From 50c7aaec2f53ab3b960f1b299aad5009df6f1967 Mon Sep 17 00:00:00 2001
+From: Justin Michaud <justin_michaud@apple.com>
+Date: Wed, 8 Feb 2023 14:41:34 -0800
+Subject: [PATCH] Fixup air pointer args if they are not valid in BBQ
+ https://bugs.webkit.org/show_bug.cgi?id=251890 rdar://105079565
+
+Reviewed by Mark Lam and Yusuke Suzuki.
+
+We are not fixing up air args if their offsets don't fit into the instruction
+in a few cases.
+
+Here are some examples:
+
+MoveDouble 28480(%sp), %q16 ; too big
+MoveVector 248(%sp), %q16 ; not 16-byte aligned
+
+Let's fix up these arguments. We also fix a missing validation check
+when parsing exception tags exposed by this test.
+
+* Source/JavaScriptCore/wasm/WasmAirIRGenerator64.cpp:
+(JSC::Wasm::AirIRGenerator64::addReturn):
+* Source/JavaScriptCore/wasm/WasmAirIRGeneratorBase.h:
+(JSC::Wasm::AirIRGeneratorBase::emitPatchpoint):
+
+oops
+
+Canonical link: https://commits.webkit.org/260038@main
+---
+ Source/JavaScriptCore/wasm/WasmSectionParser.cpp  |  2 +
+ 1 files changed, 2 insertions(+), 0 deletions(-)
+
+diff --git a/Source/JavaScriptCore/wasm/WasmSectionParser.cpp b/Source/JavaScriptCore/wasm/WasmSectionParser.cpp
+index 6b8f9016..a5f3a88b 100644
+--- a/Source/JavaScriptCore/wasm/WasmSectionParser.cpp
++++ b/Source/JavaScriptCore/wasm/WasmSectionParser.cpp
+@@ -917,6 +917,8 @@ auto SectionParser::parseException() -> PartialResult
+         WASM_PARSER_FAIL_IF(!parseVarUInt32(typeNumber), "can't get ", exceptionNumber, "th Exception's type number");
+         WASM_PARSER_FAIL_IF(typeNumber >= m_info->typeCount(), exceptionNumber, "th Exception type number is invalid ", typeNumber);
+         TypeIndex typeIndex = TypeInformation::get(m_info->typeSignatures[typeNumber]);
++        auto signature = TypeInformation::getFunctionSignature(typeIndex);
++        WASM_PARSER_FAIL_IF(!signature.returnsVoid(), exceptionNumber, "th Exception type cannot have a non-void return type ", typeNumber);
+         m_info->internalExceptionTypeIndices.uncheckedAppend(typeIndex);
+     }
+ 
+-- 
+2.34.1
+
diff --git a/meta/recipes-sato/webkit/webkitgtk_2.38.6.bb b/meta/recipes-sato/webkit/webkitgtk_2.38.6.bb
index 4cef133c19..813198df5f 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.38.6.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.38.6.bb
@@ -14,6 +14,7 @@ SRC_URI = "https://www.webkitgtk.org/releases/${BPN}-${PV}.tar.xz \
            file://reproducibility.patch \
            file://0d3344e17d258106617b0e6d783d073b188a2548.patch \
            file://d318bb461f040b90453bc4e100dcf967243ecd98.patch \
+           file://CVE-2023-32435.patch \
            file://CVE-2023-32439.patch \
            "
 SRC_URI[sha256sum] = "1c614c9589389db1a79ea9ba4293bbe8ac3ab0a2234cac700935fae0724ad48b"
-- 
2.34.1


