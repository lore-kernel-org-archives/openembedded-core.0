Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F107DF459E9
	for <webhook@archiver.kernel.org>; Fri, 10 Apr 2026 14:55:16 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.158476.1775832907190277629
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Apr 2026 07:55:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=LHGgCco8;
 spf=pass (domain: gmail.com, ip: 209.85.221.46, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-43cf3ee0fc1so1321334f8f.1
        for <openembedded-core@lists.openembedded.org>; Fri, 10 Apr 2026 07:55:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775832905; x=1776437705; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SL2CGuZcI5HGCglmc3f6IHXI20TJHxani0rVfB4TTM0=;
        b=LHGgCco8sSFt3mSmht1zNopDB2emdXMfWwJHqSC9lNkcmzW48J4xMZNuHqWYyzV7wl
         rxAnuxsWvCBG6j6tm1ZS0W+FTu0adsIe/Ia2J8QE7/UGaYEyGgaEYaudh+/IbxTNNL8x
         NkK6/+hsqrWTzYaHqQcDX40IWs8gGIn8fZJhE8fQXrcMuC9lY+w1SxEOVtm/ohO3V+NE
         jXGHOD0sUR2KB4WjZ7q/Sbu2ZQJ+dF+nvQG0eM/QHLVysTOTF3r5qWK9oTv6ci96nqff
         +07ZW/CHDMN+FYKRGHjEMv8thzPqwoIK7WRHOJPoYbMZutJqMxc5NvGfXok8uBglqSQZ
         INyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775832905; x=1776437705;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SL2CGuZcI5HGCglmc3f6IHXI20TJHxani0rVfB4TTM0=;
        b=QF5cyKaVAdRfF5kXoQLZIbtwJTZjuN0L/7j4EflO6OI3IVfzn8Fo1qVQwqU9Ik24jP
         JqD1xdiHxTGeo2bxs7ICjH/+jK7hucmsFGn1+NpH8xd38AZysSmYy9Zt636EEGrtdSPd
         4ThIeYA5JdkdqA3H53oZLJrhuiQOxXyT06OZkqNpgERU+An4pO0i3NwUcXAevXX4d/bP
         wdOpysbm0150d/UUTwP6VLJYidM+9zYHuqdaGqjl7wwagG3gubw6SYmJ8AYeV9Y8k/uq
         CKWWnhxLSXHlGIf+6e9YuErN/CjI7e2VW5VX5pW1sEbbyL/V7kGtHrEeIIyHcE7OoPeC
         IFVg==
X-Gm-Message-State: AOJu0YxCe2h6EoPNngBnmdSbLpe9K8OqmMfdZCHCSa9cfr51SfaLMjo5
	Ez/wxdjba9LSdb6hbKcFFH3urHd1qDlFK6utUW7ye505XHRtybgUsdfRd+cmFg==
X-Gm-Gg: AeBDietF+7Zyk54PlXHZBfLZmQ15j8Jm97IhlzCqXGgvWc2jMnXmcfcDCAh+04/a+XF
	urWquUq5iPWOc9EBswaAwNgFXXcV4JHw0FV/LfPueUzZbdiWHAef75V0JZH2H/JFA+4UUjsrZ/5
	jf5HBRt0pIIDPV043/180lgAsdyPM6CkU2mdZAUiSw/PCltmw8v2S9ZRdloIy1sXm6O5IxFY6Sn
	Ui8b2Mjd7r3KyMLEt81Z1280qtjbgzL37Y60XtxWRB4wUEP5Eb1UxAXfjzvTkOgv+wrj72xxRO4
	SiqDphBk/u8mk2AmkjZSFW9RIan7O3M3xXPiy36os3BwduCBM0VclLIBJ+bEN88F5en0BDom6sX
	jSLPfwJQme1GVWmTLtO3YEuPY0j4lVANpJS5m4wd+cmRv+TzP0DSqtxFGzslPl0GWP+g7H2Zr1g
	WbTimLV6HPjfmgnkh/IY09LkYw86ZPdFQtlF/7A6oZ67pkpArvlqhlRD/tZKKmpDf/9dVUxxlYz
	0B71GDK+Q==
X-Received: by 2002:a05:6000:2a08:b0:43d:210:2b2d with SMTP id ffacd0b85a97d-43d595f76b8mr7637901f8f.31.1775832905169;
        Fri, 10 Apr 2026 07:55:05 -0700 (PDT)
Received: from localhost ([109.238.218.228])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d63de3499sm7531578f8f.1.2026.04.10.07.55.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 07:55:04 -0700 (PDT)
From: martin.jansa@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [whinlatter][PATCH] spirv-tools: backport a fix for building with gcc-16
Date: Fri, 10 Apr 2026 16:54:59 +0200
Message-ID: <20260410145500.137175-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Apr 2026 14:55:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235036

From: Martin Jansa <martin.jansa@gmail.com>

Fixes:
https://errors.yoctoproject.org/Errors/Details/905195/
when building on host with gcc-16

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...sue-with-gcc-16-replaeces-PR-6542-65.patch | 50 +++++++++++++++++++
 .../spir/spirv-tools_1.4.328.1.bb             |  3 +-
 2 files changed, 52 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-graphics/spir/spirv-tools/0001-opt-Fix-build-issue-with-gcc-16-replaeces-PR-6542-65.patch

diff --git a/meta/recipes-graphics/spir/spirv-tools/0001-opt-Fix-build-issue-with-gcc-16-replaeces-PR-6542-65.patch b/meta/recipes-graphics/spir/spirv-tools/0001-opt-Fix-build-issue-with-gcc-16-replaeces-PR-6542-65.patch
new file mode 100644
index 0000000000..ce58b6b8c0
--- /dev/null
+++ b/meta/recipes-graphics/spir/spirv-tools/0001-opt-Fix-build-issue-with-gcc-16-replaeces-PR-6542-65.patch
@@ -0,0 +1,50 @@
+From aab5c96b7eb237b8bcd15e28f8aff068842db4b7 Mon Sep 17 00:00:00 2001
+From: David Neto <dneto@google.com>
+Date: Tue, 3 Mar 2026 12:11:47 -0500
+Subject: [PATCH] opt: Fix build issue with gcc 16  (replaeces PR #6542)
+ (#6567)
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Compiling with gcc 16 throws this error:
+
+FAILED: [code=1]
+source/opt/CMakeFiles/SPIRV-Tools-opt.dir/decoration_manager.cpp.o
+    source/opt/decoration_manager.cpp: In member function
+‘spvtools::opt::analysis::DecorationManager::CloneDecorations(unsigned
+int, unsigned int)’:
+    source/opt/decoration_manager.cpp:546:27: error:
+‘MEM[(unsigned int &)&op + 24]’ may be used uninitialized
+[-Werror=maybe-uninitialized]
+
+546 | if (op.words[0] == from) { // add new pair of operands: (to,
+literal)
+    source/opt/decoration_manager.cpp:545:19: note: ‘op’ declared here
+      545 |           Operand op = inst->GetOperand(i);
+          |                   ^~
+    cc1plus: all warnings being treated as errors
+
+Make sure that the vector is not empty before using it.
+
+Co-authored-by: José Expósito <jose.exposito89@gmail.com>
+Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
+Upstream-Status: Backport [c28f5937bce369dde1d645299a8c9873da43dc72]
+---
+ source/opt/decoration_manager.cpp | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/source/opt/decoration_manager.cpp b/source/opt/decoration_manager.cpp
+index 3e95dbc35..bee7d9482 100644
+--- a/source/opt/decoration_manager.cpp
++++ b/source/opt/decoration_manager.cpp
+@@ -543,7 +543,8 @@ void DecorationManager::CloneDecorations(uint32_t from, uint32_t to) {
+         const uint32_t num_operands = inst->NumOperands();
+         for (uint32_t i = 1; i < num_operands; i += 2) {
+           Operand op = inst->GetOperand(i);
+-          if (op.words[0] == from) {  // add new pair of operands: (to, literal)
++          if (!op.words.empty() &&
++              op.words[0] == from) {  // add new pair of operands: (to, literal)
+             inst->AddOperand(
+                 Operand(spv_operand_type_t::SPV_OPERAND_TYPE_ID, {to}));
+             op = inst->GetOperand(i + 1);
diff --git a/meta/recipes-graphics/spir/spirv-tools_1.4.328.1.bb b/meta/recipes-graphics/spir/spirv-tools_1.4.328.1.bb
index e5aedb1620..99d4e34ec5 100644
--- a/meta/recipes-graphics/spir/spirv-tools_1.4.328.1.bb
+++ b/meta/recipes-graphics/spir/spirv-tools_1.4.328.1.bb
@@ -9,7 +9,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 SRCREV = "7f2d9ee926f98fc77a3ed1e1e0f113b8c9c49458"
 SRC_URI = "git://github.com/KhronosGroup/SPIRV-Tools.git;branch=vulkan-sdk-1.4.328;protocol=https \
-           "
+    file://0001-opt-Fix-build-issue-with-gcc-16-replaeces-PR-6542-65.patch \
+"
 PE = "1"
 # These recipes need to be updated in lockstep with each other:
 # glslang, vulkan-headers, vulkan-loader, vulkan-tools, spirv-headers, spirv-tools

