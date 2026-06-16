Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54090CD98F4
	for <webhook@archiver.kernel.org>; Tue, 16 Jun 2026 19:16:49 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5779.1781637398937720619
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Jun 2026 12:16:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=OcHXu5Mm;
 spf=pass (domain: gmail.com, ip: 209.85.221.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-45ef4223be7so2874501f8f.2
        for <openembedded-core@lists.openembedded.org>; Tue, 16 Jun 2026 12:16:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781637397; x=1782242197; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4Uujvj+0bW4gCumXUGgVm2553sWQGpP9YVGhFU7vRyU=;
        b=OcHXu5Mm+8LOKFA5pS8kSycG6yoE9vgABlgUXwnNZJqV7wJjCY4rW0fJ3dQAuCUtgd
         3rLZDnlFnawFsXKCWXcZA5JyIG0fGn2lO1w/vbi+59dTOQZOINfDD9+ZAafALzsysj8k
         WfKO2XpZ5PB6g/7SmEPCAcV/rRlpoM2EDYYKbg5QAWPznRmgSIQJV/9qEkoOAq3P720w
         tlABitoosCxSeaVM3WmX+vVVkxW86TRR6NTmOf6gr7vunejemBFBQZvcRBJj8r/Dhfh/
         th1l9GrJHMiszmlRoTuY5OjRBLNUV2t1lKXBbaqZJkYCPqggo/uJwFsZ2k5+4VVnpf7Z
         wU+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781637397; x=1782242197;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4Uujvj+0bW4gCumXUGgVm2553sWQGpP9YVGhFU7vRyU=;
        b=BeGfGK4SImJAWED5R+lKetejiSp3gKG0iqWfe0X9CmnY/XUJnrs5VHhPTdZ2KKNSvY
         tmNJnk4twBKEcOX4ypumgg7ZrzKJAWirVYLapawOAQIeTHz7r4KuYzMdqi0BO5oXWq0U
         ZQKjiuaxgy3TJZZe0996X/KQF9yzQDqUqySGdMV5dpm8dR/ciHe+ZS+e/vxY/tKcg6g0
         8ODynm+dCC0q5mWu4Qce4jPwiNGwDeYQJxe+ZaDaj+ndgNklhFpXY/2youA/hDGb+xSt
         0xgnoE6M6kQqsGlzLMQiY0D1vTn9VMTGxtgoX+ml3uDIUAKbHPNc7YRINHi85AcM5UEm
         TRqQ==
X-Gm-Message-State: AOJu0Yx4WgdysDcToyeg8+yMYS7yJ1FQ/qsNEor3omH595sRgI9GrRLF
	gRqIffK/pboKVnfRCz3KYpPnCrDi7VI1K2PbVtf0/hC8fKAnuO4vq7JFnDFsQE0j
X-Gm-Gg: Acq92OHAn3XRHHUlkfcNU8A2CKJVByPFL4MSjg4M4LvOEj7qW280Pa1xlGRGFQYOYth
	opzW6W3m1rF0zBRC7wstIdm/mbHquf7m6Nyx0fgJj6myq8EIVrY9KOJJawS2HWz3GCNcfSvLUgS
	qwBDw9AJ3L/CUPiyIipfMbR8hXP26unZAhIy1exnpEO59xkchR94mnB5g+fuSDGqM0uARmR8H8H
	rk+JeY/ecz641gA8W+7M6kDVkEmZzwL+juN8nNxkpFyCy8QiYyctxxPnp9HHiiKGabPgCzqw84T
	Oma3RFxo3W4bpFPpYjT4Bij3aDUedRV9fCdOuwrWRgYNwpP2wHX+zF7z7OcKvAbGV2vMJUVX3uV
	EPd200WODpZwZlSgocW1UrX5MQMWGY0L/1uVhOk6K+X7e8C/DVXQHWjT+Gws6sltL/pCgvKqcub
	SPaweMLamVZlGl8qL6IQwys6XrRRSbDf82nKn3a9IiWX4YJYOgKrwSAEA9pRY=
X-Received: by 2002:a05:600c:6096:b0:490:e5c1:b8b9 with SMTP id 5b1f17b1804b1-492333571f3mr15546205e9.0.1781637397119;
        Tue, 16 Jun 2026 12:16:37 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49230a4f8d7sm86982035e9.5.2026.06.16.12.16.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 12:16:36 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 05/30] spirv-tools: upgrade 1.4.341.0 -> 1.4.350.0
Date: Tue, 16 Jun 2026 21:16:01 +0200
Message-ID: <20260616191628.2014553-5-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260616191628.2014553-1-alex.kanavin@gmail.com>
References: <20260616191628.2014553-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Jun 2026 19:16:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238930

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...sue-with-gcc-16-replaeces-PR-6542-65.patch | 50 -------------------
 ..._1.4.341.0.bb => spirv-tools_1.4.350.0.bb} |  3 +-
 2 files changed, 1 insertion(+), 52 deletions(-)
 delete mode 100644 meta/recipes-graphics/spir/spirv-tools/0001-opt-Fix-build-issue-with-gcc-16-replaeces-PR-6542-65.patch
 rename meta/recipes-graphics/spir/{spirv-tools_1.4.341.0.bb => spirv-tools_1.4.350.0.bb} (93%)

diff --git a/meta/recipes-graphics/spir/spirv-tools/0001-opt-Fix-build-issue-with-gcc-16-replaeces-PR-6542-65.patch b/meta/recipes-graphics/spir/spirv-tools/0001-opt-Fix-build-issue-with-gcc-16-replaeces-PR-6542-65.patch
deleted file mode 100644
index ce58b6b8c0..0000000000
--- a/meta/recipes-graphics/spir/spirv-tools/0001-opt-Fix-build-issue-with-gcc-16-replaeces-PR-6542-65.patch
+++ /dev/null
@@ -1,50 +0,0 @@
-From aab5c96b7eb237b8bcd15e28f8aff068842db4b7 Mon Sep 17 00:00:00 2001
-From: David Neto <dneto@google.com>
-Date: Tue, 3 Mar 2026 12:11:47 -0500
-Subject: [PATCH] opt: Fix build issue with gcc 16  (replaeces PR #6542)
- (#6567)
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Compiling with gcc 16 throws this error:
-
-FAILED: [code=1]
-source/opt/CMakeFiles/SPIRV-Tools-opt.dir/decoration_manager.cpp.o
-    source/opt/decoration_manager.cpp: In member function
-‘spvtools::opt::analysis::DecorationManager::CloneDecorations(unsigned
-int, unsigned int)’:
-    source/opt/decoration_manager.cpp:546:27: error:
-‘MEM[(unsigned int &)&op + 24]’ may be used uninitialized
-[-Werror=maybe-uninitialized]
-
-546 | if (op.words[0] == from) { // add new pair of operands: (to,
-literal)
-    source/opt/decoration_manager.cpp:545:19: note: ‘op’ declared here
-      545 |           Operand op = inst->GetOperand(i);
-          |                   ^~
-    cc1plus: all warnings being treated as errors
-
-Make sure that the vector is not empty before using it.
-
-Co-authored-by: José Expósito <jose.exposito89@gmail.com>
-Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
-Upstream-Status: Backport [c28f5937bce369dde1d645299a8c9873da43dc72]
----
- source/opt/decoration_manager.cpp | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/source/opt/decoration_manager.cpp b/source/opt/decoration_manager.cpp
-index 3e95dbc35..bee7d9482 100644
---- a/source/opt/decoration_manager.cpp
-+++ b/source/opt/decoration_manager.cpp
-@@ -543,7 +543,8 @@ void DecorationManager::CloneDecorations(uint32_t from, uint32_t to) {
-         const uint32_t num_operands = inst->NumOperands();
-         for (uint32_t i = 1; i < num_operands; i += 2) {
-           Operand op = inst->GetOperand(i);
--          if (op.words[0] == from) {  // add new pair of operands: (to, literal)
-+          if (!op.words.empty() &&
-+              op.words[0] == from) {  // add new pair of operands: (to, literal)
-             inst->AddOperand(
-                 Operand(spv_operand_type_t::SPV_OPERAND_TYPE_ID, {to}));
-             op = inst->GetOperand(i + 1);
diff --git a/meta/recipes-graphics/spir/spirv-tools_1.4.341.0.bb b/meta/recipes-graphics/spir/spirv-tools_1.4.350.0.bb
similarity index 93%
rename from meta/recipes-graphics/spir/spirv-tools_1.4.341.0.bb
rename to meta/recipes-graphics/spir/spirv-tools_1.4.350.0.bb
index 5e7167ebe8..b7ae50764b 100644
--- a/meta/recipes-graphics/spir/spirv-tools_1.4.341.0.bb
+++ b/meta/recipes-graphics/spir/spirv-tools_1.4.350.0.bb
@@ -7,9 +7,8 @@ SECTION = "graphics"
 LICENSE  = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRCREV = "fbe4f3ad913c44fe8700545f8ffe35d1382b7093"
+SRCREV = "0539c81f69a3daeb706fd3477dca61435b475156"
 SRC_URI = "git://github.com/KhronosGroup/SPIRV-Tools.git;branch=main;protocol=https;tag=vulkan-sdk-${PV} \
-    file://0001-opt-Fix-build-issue-with-gcc-16-replaeces-PR-6542-65.patch \
 "
 PE = "1"
 # These recipes need to be updated in lockstep with each other:
-- 
2.47.3


