Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB2D0F88087
	for <webhook@archiver.kernel.org>; Thu, 16 Apr 2026 06:48:42 +0000 (UTC)
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com [209.85.221.67])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7586.1776322119711098916
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Apr 2026 23:48:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=DFit369m;
 spf=pass (domain: smile.fr, ip: 209.85.221.67, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f67.google.com with SMTP id ffacd0b85a97d-43d7e23defbso2002411f8f.0
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Apr 2026 23:48:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1776322118; x=1776926918; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x7gLM0M8of39R2sQvm++eXO9/oPJTZEMqnB7bpqOVIs=;
        b=DFit369mQwfSmemcKb1GcfRbHNFyCFuUamb6WKz+Rec8J1LSTweGdycDdUj4N6nssO
         n0scBSwVGVkLUkPnHWDIcHqDCZuF4Mr69zp4mRrXn9gIDflUytGpRIluvYeTu6UzC+3d
         lTVF1z4muuYx1DMcyU07nM5NjQi8vT7CU3Ve4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776322118; x=1776926918;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=x7gLM0M8of39R2sQvm++eXO9/oPJTZEMqnB7bpqOVIs=;
        b=lKg1CD97ZN8X6dPg7DByX4Tqh/g4VZIT5or8n4HktX77Deljy5/f3Pb3t/udz7NqQg
         2SqkZjx8yFRC7voDYfy4pngL10LOp1y7+xKnbDCFl74RIy9TR8Uh6WczXSPno0XbEXT9
         gHs04sSPQlph0dhpai/J0CpnTj2+qPyQkT2v0wfXF2hZR3s9/har+wO4pMvMZB47Hp1M
         xWsgg1RP5UrMdqzAqzGLLAewxWyaSa2BLPzfGsRhBQKG7Qq2Ye6R4JU9yWaF9NbXfd0v
         6jg7eXXOlPDuCEY3V07nxtWqzx1nUsvn/cUZxH4TqUv0IeQ87n3pxzBKmJDJsuJq0ICv
         7CEA==
X-Gm-Message-State: AOJu0YzdObN69xPjxpohoB/sgeuwMswFp+sFeVirHlLWuhM3wSYqeaJe
	1nNlNMnuR+7WpeCH+/gYeQJ5QlOfAVJ4yaIWCAjYFx4fRSDdUlxKm991Gc+4201GfhF+6dK4yTo
	fn6gQJUo8Yoh0
X-Gm-Gg: AeBDieu65lxDo3Al8+Fs6MVkdz+FPk7yMd1YzqaDLNWGAjIvirefSQYcE9Ai4PKWm9Q
	z4Y9XBEZh1A0JoQ2D9zsnrSX0/ce1bbwF0fDhbm3hGkNpAaL8FWIB5sKtyZUdDzFznY6HMk56z9
	Nbcs2xYKnI+waF4uxaMd3y2vc7IOmKFuF8Zj/2SY5IkNeagfdZW6TVRPawJQd7reKxNd3oAzHkl
	h9fTtZJXlRWIq3LoziIzMhsZDSthFvzUVQZTn4sSiKG+RyhsoJ3Yrnqn57+owwVinaHCB3dQWaR
	IjI6ejHEkhuiAV9rt5uGcv3R/6hwGArsWu9YOoYQWinGtwE/SWUu3EcWtMHk3bNm9KD52WyPnTe
	lc+YIuzmX32TpVLsKUVfzXBPPsZ5WX6lRP6cshhbE1d5dc9LgLEB3rCxlAogKfOsHgyzrvDkHk0
	QjAYD6/BOn6WGCKjSv73F65zaWKo4JArISdryhmuvZ7rStrsvNE4QccvBL/lx1XlVsnVA0JNWOJ
	UdmCQDBDsIABUfZTtGyAt9NoBNFuG9e4wzmEQ==
X-Received: by 2002:a05:6000:2305:b0:43d:7946:badd with SMTP id ffacd0b85a97d-43d7946bb95mr22521307f8f.35.1776322117633;
        Wed, 15 Apr 2026 23:48:37 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43ead3d5ea9sm11200017f8f.21.2026.04.15.23.48.37
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 23:48:37 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter 30/47] spirv-tools: backport a fix for building with gcc-16
Date: Thu, 16 Apr 2026 08:47:31 +0200
Message-ID: <ad83be2dad42de511a9b702c927643482ffd04b9.1776321810.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1776321810.git.yoann.congal@smile.fr>
References: <cover.1776321810.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Apr 2026 06:48:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235372

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

