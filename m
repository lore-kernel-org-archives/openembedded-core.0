Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 523ACC5AD49
	for <webhook@archiver.kernel.org>; Tue,  3 Jun 2025 02:19:54 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web11.2043.1748917191940353981
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Jun 2025 19:19:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ALVk/ZBP;
 spf=pass (domain: gmail.com, ip: 209.85.214.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-23211e62204so39295095ad.3
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Jun 2025 19:19:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748917191; x=1749521991; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ttExBNI97OA79KVl25zuBw9x951ileCVgP8uuH8bbtE=;
        b=ALVk/ZBPdgT4tVkZLH0vvZUJBS98tufNY2qWkGDWpBM2+xBQnLHnM152BoIQzW2FoC
         /lgKcLBVH7fKdXSRfnbmpKmojNFJDtUPtvIn0LOmmXdMGQjXPPzmgadMQEBtSAQZy1Gw
         VRznnG1JYiZ90RacSuk3h/ULlqz/xxxdE4xou/qAOAZX6ZPY8HoqIgBt6flw67OTW0uX
         yy5fNKLUo6YsKuEaE75SYxqg1OXyJPN3tRFB0OxJbxBzcYr/ZFGj71lIblk5eCBwbfih
         TaXDdeQfiHJpoHgDDqdbYt+CfuCgFTCd2xGf9jq7d3YmfkBizOZerJf/MVGqL3vkCfzn
         MFIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748917191; x=1749521991;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ttExBNI97OA79KVl25zuBw9x951ileCVgP8uuH8bbtE=;
        b=gz+0HCH0cMBfZyyunJTxceOUNq/AYuJEnyZEKIsfA7DaRvTfxbvWx/WtygM6Mvvsmu
         E3G15JJtfTI106jLtxBxeJy5O3gx2maPKU51/WB8ql0lH+db6L0tUXep9vt5LHIkWFFB
         AO/68Xns+tjJbQ/SivTbgkqB9zTCOTCE8kokYfjhfylSUOHMu/0xOeHr3SU7N2V07fSV
         JQMobpa1QD9R+0G6Wfkx+F9sDDea+DJA99ktpHvaI0Bm9Ttgn3F11wIn38d5aE/uvmwe
         t/ysCFUbBCuhpaVpyfd+cKKpVPvN66SXVUop5P3LK29djl0u0DQNGihWqM9uTFPAJfoE
         ionA==
X-Gm-Message-State: AOJu0YxNXFU+6WJgtkC3VaZqJObGwxD3+8jUCwRoRCHkT84V4KI/b5n9
	Q0LiI9qr6wgdH9pNgVwiB5dLVTV5MICRyhGtWtrXvua9D5qTbBydvtjUcyJuMQ==
X-Gm-Gg: ASbGncscsQ12NeWJOE++qetTYKSW/EkM1Y6FwzqS1yqGe420ychiOC81PAGlVGTlVJ1
	rD8OZDTIodawc6F0//skU7YpgBKnzcjzWH6H7nDeVGv/dcgytG0fWvVN0oIi3phjqBcCSlhzo4e
	v9t/juYbaT2H+cq8FDx7yfetChnoADy4SJTtA7dFmhnDo8FoF3FiGwRzhlcGROp2KHqyz5MG0uB
	M76yb6d/3LrFMa2AYIfReQ6ZuZrvC5x4v2lrFN89cYYODEsM4mppQrzO7gyV7IuNTbFSEviaOqM
	GuNqfU0UBfoTlz5YqUiHRsQF6GwxNa1BTKWKiLQSKg==
X-Google-Smtp-Source: AGHT+IEHNjzPFZrl7rfNzfhLAL0LLcNIc+J71CLg+erdP7SW1aXleAGuPw7fwXHuwTUW/qX41Fz63Q==
X-Received: by 2002:a17:902:74c6:b0:234:a44c:18d with SMTP id d9443c01a7336-235290e435emr208205865ad.22.1748917190888;
        Mon, 02 Jun 2025 19:19:50 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::d6e])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23506cf471asm77387345ad.164.2025.06.02.19.19.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Jun 2025 19:19:50 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] vulkan-samples: Upgrade to tip of main
Date: Mon,  2 Jun 2025 19:19:48 -0700
Message-ID: <20250603021948.4193578-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Jun 2025 02:19:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217744

Fixes build with clang-20 as it updates fmt to latest

complete changes are here [1]

[1] https://github.com/KhronosGroup/Vulkan-Samples/compare/eca122602a5d7a9f63686411dcef1b62feb36a9a...d27205d14d01ea7d33efc8ba2862478612370182

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-graphics/vulkan/vulkan-samples_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/vulkan/vulkan-samples_git.bb b/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
index 1caff12a5b9..844e0e6b688 100644
--- a/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
@@ -10,7 +10,7 @@ SRC_URI = "gitsm://github.com/KhronosGroup/Vulkan-Samples.git;branch=main;protoc
            "
 
 UPSTREAM_CHECK_COMMITS = "1"
-SRCREV = "eca122602a5d7a9f63686411dcef1b62feb36a9a"
+SRCREV = "d27205d14d01ea7d33efc8ba2862478612370182"
 
 UPSTREAM_CHECK_GITTAGREGEX = "These are not the releases you're looking for"
 S = "${WORKDIR}/git"

