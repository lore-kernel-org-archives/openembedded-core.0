Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DE92F8DFFF
	for <webhook@archiver.kernel.org>; Thu, 16 Apr 2026 22:33:27 +0000 (UTC)
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.28580.1776378799936453208
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Apr 2026 15:33:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=NSDLMBbB;
 spf=pass (domain: smile.fr, ip: 209.85.128.68, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f68.google.com with SMTP id 5b1f17b1804b1-488afb0427eso614705e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 16 Apr 2026 15:33:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1776378798; x=1776983598; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x7gLM0M8of39R2sQvm++eXO9/oPJTZEMqnB7bpqOVIs=;
        b=NSDLMBbB9ZlsRTLKv0SvmTJPHHJC38WSs+L4Hpx5bzBvojF2bIFmb0jYgx9EO9Ujvc
         e6+BtwGXuu/f3O89cWQMfgbHkv4Ngz/K3NXURI/BQIGyHAU3RSo89vjC0nRZimfFL9/y
         YrpxidtyE1nGgGitV6siZzW1ZDjQuemcAoobs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776378798; x=1776983598;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=x7gLM0M8of39R2sQvm++eXO9/oPJTZEMqnB7bpqOVIs=;
        b=Ff6lAauLzq/webQeUX/XhLM/hJ1OFbeF0oLZqiuOpJG0/IWnfEjvgd+52fTagf/Z/q
         YSo70jrwsupyt7XnhkysiLTvQExsRUBDscvDQOZlWOLQJlJ9FbJ8pljUgjIS9jWvqfAq
         CqA3CTjbon00fK0egVfKKdq2Ct7fuV6lubpQMad7367FC98HI4cCFSUrA1G1rzZl1It4
         3jTbLY0VG6N4nLCytOxIMGBa8PVesx3ukIEE+QqNAhFkb5bvNWLbJR4sC/UIq7bY5YyG
         Q0x7fqtxEorowk9AuAvymzwDNkYHJL8CXHReyGshFDm+n+772m/ljcxRhyrl4laYhXkX
         RNOg==
X-Gm-Message-State: AOJu0Yzhie61vnmqVafwx7DmD6RXb+XEid5o+H8r1E9ant+tlFCj2GZl
	LA26IYI730S/6BWRtwrPrsUIC901blE0uQJtfH+luEKTSs9T8pOGkiUU/+iZfmz5efND8k1IM2C
	bVpvTdBmdSFuy
X-Gm-Gg: AeBDies4RwI+Ikz5/PdpwZjDUyKvga32P8Q0jdL9AnqYfWbyQqxHJM4oXQFnDXEWzno
	GGmfPny88n8nlfRRsCd/6mCn10yZJ5MD6nHImrgJglV/lnhrR7viTfg2XeDCrMPcXakbYfsH+6R
	/dArKRAqfusz88zU0CiViZ4fePV/s+9I0w3nZG4rx1xM0aFc3OglIidPmmtIYiR5WbzmywKimMz
	ZdUrsAfoc+5ojhkYiXe7+JafjZN/PmC1VSADJmv54h/BKL/IN0EAB17kTwlBlrITCwbKOBYbY1d
	NrpcYGCTxxC5Su5mHkqKXWnRI8kF6+yMuoGF4g8stz5QTS5Ta4w6REkKAWY4jWwGV2mMFfAzfus
	3HvZ2c1EDiqxG+F/mCg3oBG33tUN8o3kLyea53slOQtlwRf79+Q7xU1UGnh+WsD41xsR9lzNkyM
	CWYOQa3eXj/LTvlMpI+AYvUm/FYm5kq/w7ofGlny8leVKP6LSkm9n8mLtrYSwfuOPaY/cjqvlw/
	arm1r90f3RQWRSU56Qsah8I3ee9CQ4ox1h8JA==
X-Received: by 2002:a05:600c:8901:b0:488:f9cb:f6c4 with SMTP id 5b1f17b1804b1-488fb7786cemr4127415e9.18.1776378798029;
        Thu, 16 Apr 2026 15:33:18 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488f57da2aesm141885005e9.0.2026.04.16.15.33.17
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 15:33:17 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter v2 30/51] spirv-tools: backport a fix for building with gcc-16
Date: Fri, 17 Apr 2026 00:30:13 +0200
Message-ID: <ad83be2dad42de511a9b702c927643482ffd04b9.1776377993.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1776377993.git.yoann.congal@smile.fr>
References: <cover.1776377993.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Apr 2026 22:33:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235459

From: Martin Jansa <martin.jansa@gmail.com>

Fixes:
https://errors.yoctoproject.org/Errors/Details/905195/
when building on host with gcc-16

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit b4801e63d1284f3fa5006f0e24f560130c2a0a4c)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 ...sue-with-gcc-16-replaeces-PR-6542-65.patch | 50 +++++++++++++++++++
 .../spir/spirv-tools_1.4.328.1.bb             |  3 +-
 2 files changed, 52 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-graphics/spir/spirv-tools/0001-opt-Fix-build-issue-with-gcc-16-replaeces-PR-6542-65.patch

diff --git a/meta/recipes-graphics/spir/spirv-tools/0001-opt-Fix-build-issue-with-gcc-16-replaeces-PR-6542-65.patch b/meta/recipes-graphics/spir/spirv-tools/0001-opt-Fix-build-issue-with-gcc-16-replaeces-PR-6542-65.patch
new file mode 100644
index 00000000000..ce58b6b8c0f
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
index e5aedb16208..99d4e34ec5b 100644
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

