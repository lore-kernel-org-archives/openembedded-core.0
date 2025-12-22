Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E9DEE6B246
	for <webhook@archiver.kernel.org>; Mon, 22 Dec 2025 20:45:08 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.88510.1766436303782422098
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Dec 2025 12:45:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ekWc54uh;
 spf=pass (domain: gmail.com, ip: 209.85.218.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b804646c718so345068366b.2
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 12:45:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766436302; x=1767041102; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ci60SaQjpxI011dlczZLR6WCAY6r3ItoJe+/VwAHy2g=;
        b=ekWc54uhW4lFAFLzx7RYJDz19KLMqKw6m28FHl/K9iO/iZ8IV76fetq4OnrkK6x+Gh
         06UOJbzLcPRS9B8G69zJLD8di3vBBchkUtk2jNJVwC5/obaAoBss2vLgiw4NRb14arMR
         vpLcnjqS8cpeQMeej5VI/nzD1ZZjQnILcwl0/kcytTQORpPLgfYBQeMSzKMI1SJXLTqo
         tea2T0qGgiHoXO2ZPvVgXS4mNx0T4IiRSK0kgwoGTAWJ3/Krs6zLTc+bvEw07OvXyHrw
         uutSTInniW7ZQGPTAHm+54FKXMzwWWqw45TAVq6S48+hsDCACuXKFfiRja2YAFWOW3PV
         kERw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766436302; x=1767041102;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ci60SaQjpxI011dlczZLR6WCAY6r3ItoJe+/VwAHy2g=;
        b=v3xvcyAWRNdsDDk0IXHWu4oQ6rwdT6l4Sh5M4NzJxHfHXplTZtFXdiNmJfjqGhBBkW
         oojHbVmVW3341AlduyoyT9WKR8eYvoBZb0uKxduYeOAM9YcysKByuEF3uAw6cVPGTjZE
         GjS94W+Y+5+RmNGDwgahjIi7xEjlLqR4HaS/zGjRa4FLNMfxlXrzMbF4F2Z5V80jm88U
         PCzAA94LDtIsn6onl2E3MqJbvG4LHxtVlZn/IL6y/Yb8LiIGuxFg3/9AMYR5iZhYOQme
         X66owVFRlfApCHN2Y9wprOFJAMVx3UWjFXX5VH3WQ+U14vSpmql3QLkBD+wIzQuPTv+v
         K0YQ==
X-Gm-Message-State: AOJu0Yy6CRUA2gbxh9E5G02WXvXgsPpUinc663qdaY94sVOUhhz6PY55
	jhBiq1m7NdScP/8fHyvPIULDRINq+a8zvoorLrZVCszLYiSMA+Bumenq9dbU4g==
X-Gm-Gg: AY/fxX6hX8aQdEDPL+XhD6XAxdePmdQsvnZWNp0OK5vyH5Sql2qizaTmYFSDBwegHVY
	/2s5c0FGY1jjFrVtM9NVxV3DEK500ChpZmIIe8WZumSTELU8sMbnyGRqLgtTkLN1uuYTiL7pSAe
	EDXjG93WneRGh+FbXppbzCJ14rarT1dShA5TXk3NhuAo1n3OnFAJOdMXXpCufqnJZ6i/XzzUKms
	8MMXFH4jOmtXKNIfG5XtLdPc+dE4sSmZ15fHfOpFLnTnYllQtI3YpX93Sgae2eXM+mxVSVrUovD
	eyjNlBwbDpBe2crGUt+0oUZwqYAre1nsUf7UNOrB6ahXVGWTH6hhuFgiUVdjbIK3wAqKMt3xYPr
	vn1VhAp5aBykP8RXjMVy7FBDeEFJRVGRKBtxndopw7T+u9OK4W1D0ZuO2fZhPa7UdimpCWGZre8
	x4ASwWrVVFkv8pdaEWrBeo39NgWiJxHsrQz59MC0uK8cwli5k=
X-Google-Smtp-Source: AGHT+IFsI4bUeH5eUaaTDEQhsJO1F6h3LLK4V38yyIlvLTktkiScgSDoTdiK/nU9hsOlgyCjYUtuEA==
X-Received: by 2002:a17:907:6d0e:b0:b72:d8da:7aac with SMTP id a640c23a62f3a-b80371f10e6mr1411653066b.56.1766436302011;
        Mon, 22 Dec 2025 12:45:02 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037f3e271sm1189860066b.60.2025.12.22.12.45.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 12:45:01 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 06/15] vulkan-samples: upgrade to latest revision
Date: Mon, 22 Dec 2025 21:44:24 +0100
Message-ID: <20251222204455.2284529-6-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251222204455.2284529-1-alex.kanavin@gmail.com>
References: <20251222204455.2284529-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 20:45:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228431

From: Alexander Kanavin <alex@linutronix.de>

Drop patch as the componnent has been removed upstream.

Adjust the selftest using the recipe, as it was adding a recipe patch
in assumption that other patches already existed.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/lib/oeqa/selftest/cases/devtool.py       |  2 +-
 ...uilder.h-add-missing-cstdint-include.patch | 28 -------------------
 .../vulkan/vulkan-samples_git.bb              |  3 +-
 3 files changed, 2 insertions(+), 31 deletions(-)
 delete mode 100644 meta/recipes-graphics/vulkan/vulkan-samples/0001-SPIRV-SpvBuilder.h-add-missing-cstdint-include.patch

diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index 8d7e984753..2ad7a3a348 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -1724,7 +1724,7 @@ class DevtoolUpdateTests(DevtoolBase):
         self.assertNotIn(recipe, result.output, 'Recipe should have been reset by finish but wasn\'t')
         self.assertNotExists(os.path.join(self.workspacedir, 'recipes', recipe), 'Recipe directory should not exist after finish')
         expected_status = [(' M', '.*/%s$' % os.path.basename(oldrecipefile)),
-                           ('??', '.*/.*-Adding-a-new-file.patch$')]
+                           ('??', '.*/vulkan/vulkan-samples/$')]
         self._check_repo_status(recipedir, expected_status)
         # Make sure the patch is added to the recipe with the correct "patchdir" option
         result = runCmd('git diff .', cwd=recipedir)
diff --git a/meta/recipes-graphics/vulkan/vulkan-samples/0001-SPIRV-SpvBuilder.h-add-missing-cstdint-include.patch b/meta/recipes-graphics/vulkan/vulkan-samples/0001-SPIRV-SpvBuilder.h-add-missing-cstdint-include.patch
deleted file mode 100644
index f50aa806da..0000000000
--- a/meta/recipes-graphics/vulkan/vulkan-samples/0001-SPIRV-SpvBuilder.h-add-missing-cstdint-include.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From e40c14a3e007fac0e4f2e4164fdf14d1712355bd Mon Sep 17 00:00:00 2001
-From: Sergei Trofimovich <slyich@gmail.com>
-Date: Fri, 2 Aug 2024 22:44:21 +0100
-Subject: [PATCH] SPIRV/SpvBuilder.h: add missing <cstdint> include
-
-Without the change `glslang` build fails on upcoming `gcc-15` as:
-
-    In file included from /build/source/SPIRV/GlslangToSpv.cpp:45:
-    SPIRV/SpvBuilder.h:248:30: error: 'uint32_t' has not been declared
-      248 |     Id makeDebugLexicalBlock(uint32_t line);
-          |                              ^~~~~~~~
-
-Upstream-Status: Backport [https://github.com/KhronosGroup/glslang/commit/e40c14a3e007fac0e4f2e4164fdf14d1712355bd]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- SPIRV/SpvBuilder.h | 1 +
- 1 file changed, 1 insertion(+)
-
---- a/SPIRV/SpvBuilder.h
-+++ b/SPIRV/SpvBuilder.h
-@@ -56,6 +56,7 @@ namespace spv {
- }
- 
- #include <algorithm>
-+#include <cstdint>
- #include <map>
- #include <memory>
- #include <set>
diff --git a/meta/recipes-graphics/vulkan/vulkan-samples_git.bb b/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
index b7c9ddd2fe..64c7e0908c 100644
--- a/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
@@ -6,11 +6,10 @@ LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=48aa35cefb768436223a6e7f18dc2a2a"
 
 SRC_URI = "gitsm://github.com/KhronosGroup/Vulkan-Samples.git;branch=main;protocol=https;lfs=0 \
-           file://0001-SPIRV-SpvBuilder.h-add-missing-cstdint-include.patch;patchdir=third_party/glslang \
            "
 
 UPSTREAM_CHECK_COMMITS = "1"
-SRCREV = "d27205d14d01ea7d33efc8ba2862478612370182"
+SRCREV = "97fcdeecf2db26a78b432b285af3869a65bb00bd"
 
 UPSTREAM_CHECK_GITTAGREGEX = "These are not the releases you're looking for"
 
-- 
2.47.3


