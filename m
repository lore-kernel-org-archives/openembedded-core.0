Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08E7EF513F0
	for <webhook@archiver.kernel.org>; Sun,  8 Mar 2026 12:49:45 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.37100.1772974178555990524
 for <openembedded-core@lists.openembedded.org>;
 Sun, 08 Mar 2026 05:49:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OvU9wDCe;
 spf=pass (domain: gmail.com, ip: 209.85.221.44, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-439b97a8a8cso6838159f8f.1
        for <openembedded-core@lists.openembedded.org>; Sun, 08 Mar 2026 05:49:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772974177; x=1773578977; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DDYHNLfiElcy52OkPiDxPbz43FfCYd49p5V6iJxiIJY=;
        b=OvU9wDCesAVuTkDs91BMnrA0sDq+a5hWVNHHgR2oFC6+/m3igbZrabQYUoeEHbBt+J
         xBE5Y/ZV57yqDXMROnZFCNMc0fIp3gZR6O9In/Nu0D3JfH6wQ9g2TjVLr1gkYFxsxkIR
         afv0MiErxsppCVhEtf3S4N1tAixFgfsxY7pgqRNd2SD4VnWJHi+t5X97dpYjSzG5bnsj
         AAwcOU2bl8/+Hujwicop/UswK/01q2mX82verf0xyfv4p/ne3YoIUhdNlcpexJ9OH/kJ
         x7NdN4XfjRCIvPIS4OPyPHOVi4aJ+7Jr2Rwe6HPw3zbr14xWjh0Wk1ieNbDiPGXQ+oSc
         6P9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772974177; x=1773578977;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DDYHNLfiElcy52OkPiDxPbz43FfCYd49p5V6iJxiIJY=;
        b=nuwYt9CV33NeHwmy7KM5JxXUkCszFwyRQceExbnlQTAkeAAX6pW6d+LmQ7V2JXviEG
         DV4HU1QCTqqnQKz1jRmNd2y4xw5+LTPcqWKace42lf4PH6VLD7m55SXu+AZRBt88rZj2
         6FqliZfh6PApiZ3OiLR8gV7fRa7AOFbRYHK3akp4pX7rI/5Bo3uznt81jPjEzNZBP9Jw
         0y7m+VDkQzMZfyHiAQE+O337+OTnWzzvTJpKh+w7Fhb/p4W7ufkPW+Mb0F6Y4ZgWYhHo
         fgsoWgEQqIwSRQJM4hsLGUBmh8r9Ryq4aKhyzgkqLHDKqCF8BgEYulX2HvoxpWaHpoUT
         0Ysg==
X-Gm-Message-State: AOJu0Yy9IEyHhDl1CecRt38JjroyUzR4Chfd+8WwqRTAqEZYSLbDDReW
	D2IkpGTE76W0kKsI5hsed3nFBIB7CBaprl3qNQ1FWCglOKOWcFlVOblvSWHUVQfv
X-Gm-Gg: ATEYQzw9zPOLGWhc5F7RP0pv2fZ958Qd2BsE5wP9OnXQmu5WWmoPv6aBUvKPg4vB+Rz
	CE/98JTq/MhmNspwG/8dv3KcazIZVtngLcHz4SYnvNwNKvgF8Zf9lthRkTUzc3wvpey9Rok+Rlh
	8lbRfWYouDthz7oWYigddSKU83PSo8J0S8ssCLfNDhEe3/PHizgjfrkV/ZSWwhgAyQn/KT2Mci6
	bOE3rLJD0Bj8HThqm8NHRPSoJUFc/cStyfCdf949GzKgkQKKyMGy1Udl/XsGch1wuiL5ko5MuCx
	X9xuLCqqoi8SugaW6dEJwC87O8cqffNkahdN/VLDEJ/omY9YU/VBgDaGjYpn+WF71AK/fYQSBNq
	sGSGHusqbyP2UKCcJWaxrWXAiQh+U8AO0A9j/FJqkffTxEcQpkCIHc5ADb2J1i8Trzwp6+H/ECY
	IVayFftlMKEPjkONZGIU5xC2C/Dw==
X-Received: by 2002:a05:600c:3acf:b0:485:17a7:ba18 with SMTP id 5b1f17b1804b1-4852697918emr140621615e9.30.1772974176583;
        Sun, 08 Mar 2026 05:49:36 -0700 (PDT)
Received: from localhost ([109.238.218.228])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4852e38c013sm224780735e9.8.2026.03.08.05.49.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Mar 2026 05:49:35 -0700 (PDT)
From: martin.jansa@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [PATCH] spirv-tools: backport a fix for building with gcc-16
Date: Sun,  8 Mar 2026 13:49:31 +0100
Message-ID: <20260308124932.3802467-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 08 Mar 2026 12:49:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232643

From: Martin Jansa <martin.jansa@gmail.com>

Fixes:
https://errors.yoctoproject.org/Errors/Details/905195/
when building on host with gcc-16

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 ...sue-with-gcc-16-replaeces-PR-6542-65.patch | 50 +++++++++++++++++++
 .../spir/spirv-tools_1.4.341.0.bb             |  4 +-
 2 files changed, 53 insertions(+), 1 deletion(-)
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
diff --git a/meta/recipes-graphics/spir/spirv-tools_1.4.341.0.bb b/meta/recipes-graphics/spir/spirv-tools_1.4.341.0.bb
index 51c54b9d4f..5e7167ebe8 100644
--- a/meta/recipes-graphics/spir/spirv-tools_1.4.341.0.bb
+++ b/meta/recipes-graphics/spir/spirv-tools_1.4.341.0.bb
@@ -8,7 +8,9 @@ LICENSE  = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 SRCREV = "fbe4f3ad913c44fe8700545f8ffe35d1382b7093"
-SRC_URI = "git://github.com/KhronosGroup/SPIRV-Tools.git;branch=main;protocol=https;tag=vulkan-sdk-${PV}"
+SRC_URI = "git://github.com/KhronosGroup/SPIRV-Tools.git;branch=main;protocol=https;tag=vulkan-sdk-${PV} \
+    file://0001-opt-Fix-build-issue-with-gcc-16-replaeces-PR-6542-65.patch \
+"
 PE = "1"
 # These recipes need to be updated in lockstep with each other:
 # glslang, vulkan-headers, vulkan-loader, vulkan-tools, spirv-headers, spirv-tools

