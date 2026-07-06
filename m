Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 611E9C44509
	for <webhook@archiver.kernel.org>; Mon,  6 Jul 2026 17:17:44 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.156330.1783358263188207394
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jul 2026 10:17:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=PbWQtXgY;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-493c59f740cso23013275e9.3
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Jul 2026 10:17:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783358261; x=1783963061; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lqGqyRz/wRrruNXL/J9D2czkqd7gcE0JLd4WlaxOqKU=;
        b=PbWQtXgYb0SO81g7a0Y4Go3n2gXskXjDHFPC1RtCnlu1zzHonhV8ovQotd7HiRrBSn
         Z6zIvLnCOlHdlxD4gwKYLw4TMXLzx4qJG5Hazh121NAP3zBflv0BzrRozDe30djt62V4
         Lw1+ikncjdBb/GAvKbFpT1IXEOU1TBcCGWRj4aa6XUmJJKw7t5SCb9lE3VNoltEfdIW8
         WKXmc0CMme2iYNYVEceRTZW0Snw++vcNEYaci+lyNX+t3d/V6f9iwaQ2yEICPzbi7JFc
         S7mNQf1o0KcnzNEgZRkiR39e6b3XS1YNm/prD7vOq9nUWLw+8JVLQXWZ43ii9lc4sRV3
         kiHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783358261; x=1783963061;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lqGqyRz/wRrruNXL/J9D2czkqd7gcE0JLd4WlaxOqKU=;
        b=n6hmFBPiBJOuOjwaQOk7fqLmamA+m1MI/uYEotWsPVPjR53kFA3YfY/5hKl+OH2dqu
         m+Zz7Z6hNj4w072ooMbeJIFWaJbdmWoc+xuISX9NyEmGHEHZOuGFU2eewKNjNY6olfIB
         i3hid/3Jbc6TE4mrx7SroNwXiSeqN4bw77FJ1KlgHHzbJMqWzeflJQ8e3ZVX7YwJDlsT
         /Lh8YIWz304XIEFIRT9spKg1S4Gl70xTZIwM0G6N5pfkD5Xd1Hnht7ig/HQ62pY1CQpX
         leuOMBNLPAIdevpmICHTzPUM3DN4wJzEZPolJ/4NjN+XtY5xlBptHSTx0lgXWV0DuJ3v
         wkSw==
X-Gm-Message-State: AOJu0Yz6gIzD9ABI/SzkzHlae1WXqyGmy9RA8VZ5z3URBh1ZaXmNqQAR
	JVVlmxgTU5QPQx6UfDPa4RmaadLXxTaF9vlTTeLQC6W2QbcgfMRuJbOkR5HtMQ==
X-Gm-Gg: AfdE7clxVL5aw5Cz3s8375j1QeG0CmonZPHa/v2Jp/ct8M+YiVgV2j4yOrCIwfWi/Lz
	sz6itYPM4FthHSUVTJcvy7olPTiFp8hF4TcULxVeywFeXVLmTs6ICuoVkrqoS7MuSyXyGGW77+E
	3SiY7kdbASxrd+C/SWCvjzNw5hPowrJxygTo8GCAf30kxZ+UmU/HRCtkkbxg0ND/UBdX/Wa6PAg
	tOO4CRC5WgwvBP0vKh9bldMm3ZUuZPqimEggK9Szpe3yCbgtAb5YGho6RACDNuZF+YxC1BJXRBI
	M5HhOD6IlzitQW3FOJMcoEUbMYOvNfYQ2RYfdNbOlJ17ZIZFYvw6qdeq7HhlXVZ8SJ0mRPR0KvY
	TNOd5wlpMPEmj7YZdj95rgyMEWH10L6IKeiAsGOpqNERLEKf+IqUfph3N3kHtVE4foMNGrLxA3D
	zfZ/0vwSCu6ZSg1gxs/5rXrm9njVNARr2+jKQTYe8tn3Lek2xN
X-Received: by 2002:a05:600c:4fca:b0:490:e60b:6860 with SMTP id 5b1f17b1804b1-493df083035mr16410345e9.7.1783358261254;
        Mon, 06 Jul 2026 10:17:41 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c63ba971sm640541005e9.13.2026.07.06.10.17.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 10:17:40 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 42/45] vulkan: upgrade 1.4.350.0 -> 1.4.350.1
Date: Mon,  6 Jul 2026 19:16:56 +0200
Message-ID: <20260706171701.70536-42-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260706171701.70536-1-alex.kanavin@gmail.com>
References: <20260706171701.70536-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Jul 2026 17:17:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240328

From: Alexander Kanavin <alex@linutronix.de>

The release notes claim a fix for .pc file in vulkan loader:
https://vulkan.lunarg.com/doc/sdk/1.4.350.1/linux/release_notes.html

but the .1 tag points to the same commit as .0 tag:
https://github.com/KhronosGroup/Vulkan-Loader/tags
(and the same commit is tagged as .1 in all other components).

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../glslang/glslang/0001-generate-glslang-pkg-config.patch      | 2 +-
 .../glslang/{glslang_1.4.350.0.bb => glslang_1.4.350.1.bb}      | 0
 .../{spirv-headers_1.4.350.0.bb => spirv-headers_1.4.350.1.bb}  | 0
 .../spir/{spirv-tools_1.4.350.0.bb => spirv-tools_1.4.350.1.bb} | 0
 ...{vulkan-headers_1.4.350.0.bb => vulkan-headers_1.4.350.1.bb} | 0
 .../{vulkan-loader_1.4.350.0.bb => vulkan-loader_1.4.350.1.bb}  | 0
 .../{vulkan-tools_1.4.350.0.bb => vulkan-tools_1.4.350.1.bb}    | 0
 ...aries_1.4.350.0.bb => vulkan-utility-libraries_1.4.350.1.bb} | 0
 ...ayers_1.4.350.0.bb => vulkan-validation-layers_1.4.350.1.bb} | 0
 .../{vulkan-volk_1.4.350.0.bb => vulkan-volk_1.4.350.1.bb}      | 0
 10 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/glslang/{glslang_1.4.350.0.bb => glslang_1.4.350.1.bb} (100%)
 rename meta/recipes-graphics/spir/{spirv-headers_1.4.350.0.bb => spirv-headers_1.4.350.1.bb} (100%)
 rename meta/recipes-graphics/spir/{spirv-tools_1.4.350.0.bb => spirv-tools_1.4.350.1.bb} (100%)
 rename meta/recipes-graphics/vulkan/{vulkan-headers_1.4.350.0.bb => vulkan-headers_1.4.350.1.bb} (100%)
 rename meta/recipes-graphics/vulkan/{vulkan-loader_1.4.350.0.bb => vulkan-loader_1.4.350.1.bb} (100%)
 rename meta/recipes-graphics/vulkan/{vulkan-tools_1.4.350.0.bb => vulkan-tools_1.4.350.1.bb} (100%)
 rename meta/recipes-graphics/vulkan/{vulkan-utility-libraries_1.4.350.0.bb => vulkan-utility-libraries_1.4.350.1.bb} (100%)
 rename meta/recipes-graphics/vulkan/{vulkan-validation-layers_1.4.350.0.bb => vulkan-validation-layers_1.4.350.1.bb} (100%)
 rename meta/recipes-graphics/vulkan/{vulkan-volk_1.4.350.0.bb => vulkan-volk_1.4.350.1.bb} (100%)

diff --git a/meta/recipes-graphics/glslang/glslang/0001-generate-glslang-pkg-config.patch b/meta/recipes-graphics/glslang/glslang/0001-generate-glslang-pkg-config.patch
index d74f37db91..f06f12b303 100644
--- a/meta/recipes-graphics/glslang/glslang/0001-generate-glslang-pkg-config.patch
+++ b/meta/recipes-graphics/glslang/glslang/0001-generate-glslang-pkg-config.patch
@@ -1,4 +1,4 @@
-From ee46f2f608ccbe9617ce41235d047f080d972ff7 Mon Sep 17 00:00:00 2001
+From 2c7e21605b0324b4afd51270592bc6cb0a0cca5f Mon Sep 17 00:00:00 2001
 From: Jose Quaresma <quaresma.jose@gmail.com>
 Date: Sun, 7 Feb 2021 01:30:39 +0000
 Subject: [PATCH] generate glslang pkg-config
diff --git a/meta/recipes-graphics/glslang/glslang_1.4.350.0.bb b/meta/recipes-graphics/glslang/glslang_1.4.350.1.bb
similarity index 100%
rename from meta/recipes-graphics/glslang/glslang_1.4.350.0.bb
rename to meta/recipes-graphics/glslang/glslang_1.4.350.1.bb
diff --git a/meta/recipes-graphics/spir/spirv-headers_1.4.350.0.bb b/meta/recipes-graphics/spir/spirv-headers_1.4.350.1.bb
similarity index 100%
rename from meta/recipes-graphics/spir/spirv-headers_1.4.350.0.bb
rename to meta/recipes-graphics/spir/spirv-headers_1.4.350.1.bb
diff --git a/meta/recipes-graphics/spir/spirv-tools_1.4.350.0.bb b/meta/recipes-graphics/spir/spirv-tools_1.4.350.1.bb
similarity index 100%
rename from meta/recipes-graphics/spir/spirv-tools_1.4.350.0.bb
rename to meta/recipes-graphics/spir/spirv-tools_1.4.350.1.bb
diff --git a/meta/recipes-graphics/vulkan/vulkan-headers_1.4.350.0.bb b/meta/recipes-graphics/vulkan/vulkan-headers_1.4.350.1.bb
similarity index 100%
rename from meta/recipes-graphics/vulkan/vulkan-headers_1.4.350.0.bb
rename to meta/recipes-graphics/vulkan/vulkan-headers_1.4.350.1.bb
diff --git a/meta/recipes-graphics/vulkan/vulkan-loader_1.4.350.0.bb b/meta/recipes-graphics/vulkan/vulkan-loader_1.4.350.1.bb
similarity index 100%
rename from meta/recipes-graphics/vulkan/vulkan-loader_1.4.350.0.bb
rename to meta/recipes-graphics/vulkan/vulkan-loader_1.4.350.1.bb
diff --git a/meta/recipes-graphics/vulkan/vulkan-tools_1.4.350.0.bb b/meta/recipes-graphics/vulkan/vulkan-tools_1.4.350.1.bb
similarity index 100%
rename from meta/recipes-graphics/vulkan/vulkan-tools_1.4.350.0.bb
rename to meta/recipes-graphics/vulkan/vulkan-tools_1.4.350.1.bb
diff --git a/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.4.350.0.bb b/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.4.350.1.bb
similarity index 100%
rename from meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.4.350.0.bb
rename to meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.4.350.1.bb
diff --git a/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.4.350.0.bb b/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.4.350.1.bb
similarity index 100%
rename from meta/recipes-graphics/vulkan/vulkan-validation-layers_1.4.350.0.bb
rename to meta/recipes-graphics/vulkan/vulkan-validation-layers_1.4.350.1.bb
diff --git a/meta/recipes-graphics/vulkan/vulkan-volk_1.4.350.0.bb b/meta/recipes-graphics/vulkan/vulkan-volk_1.4.350.1.bb
similarity index 100%
rename from meta/recipes-graphics/vulkan/vulkan-volk_1.4.350.0.bb
rename to meta/recipes-graphics/vulkan/vulkan-volk_1.4.350.1.bb
-- 
2.47.3


