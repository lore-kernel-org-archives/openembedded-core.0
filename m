Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C40EC0218F
	for <webhook@archiver.kernel.org>; Sun,  2 Feb 2025 21:54:35 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web10.74273.1738533273630115730
 for <openembedded-core@lists.openembedded.org>;
 Sun, 02 Feb 2025 13:54:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hzbjftfj;
 spf=pass (domain: gmail.com, ip: 209.85.214.170, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-21680814d42so59221865ad.2
        for <openembedded-core@lists.openembedded.org>; Sun, 02 Feb 2025 13:54:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738533273; x=1739138073; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bp/jYvRJsJmcB0AyEKb7bbpzJ23gypnEGon4aKesuBA=;
        b=hzbjftfjc3G35RasCu2TrnZyCQWlu9+QijXfWx05TKSGkSXMvkFYhu2zWbD5dGe7Jx
         t6Jen0rf+9Fja5i0yQS2E0FrHAUM+/IfPdrs9qEkcyfanWja9+rFkIPEimfoQJcrteF6
         4kJE98cWnE3M/1eUdK4xQOcK97SUSDEUFsnZooMa7wGE+o9BsGbX34GoS5SlncekjAXD
         oq7/ziBZUryD1utUCIneo/t3SWlvd0bbkwB5hu6lUaqiz2aoAFLKmQOH2W0+f74ysxXy
         nRZHEu3LZ0rRIe4Bl56K2rjyuin34oxt0+7Ouc9nbbiMHbILgUEdXf3YLx7U4dPgJM6J
         3RwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738533273; x=1739138073;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bp/jYvRJsJmcB0AyEKb7bbpzJ23gypnEGon4aKesuBA=;
        b=IAANIAXNXFRdkSlCVx+9nvHgf35BtMZrl4xbZE2SZ6hkbB57nnL5ZD5xLsB1cV2Yp3
         aLoXP+07afaXMdLpopaws6Z0uwwnE9XdICDC4PXemEa+RWt6evoWf2I4XW1l0MagUnzY
         DJTlHqEs2QKYRn1Ty8SVcz1IOEdmr04Y8p6pQC9qV4F0zJ049KRiLmGwt5CZmvNYL+KX
         k95lutwHf5ForcMmKqDPC7e7EhuQ+GfZ1QwtGNV9TlTvAcspxmW2IDPEXSuiWp4iAttp
         Ss6zkmHUTYas6LoVBhF+HiNW4lb356oVL+53VemY2OAeRM6B171KBrdcKwF2rShMMHbj
         99Yw==
X-Gm-Message-State: AOJu0YwWHIM2C/DdBRHwFYXD1cO19n8KJNqA1v5Gn/EzfJsGE7aVM8ZE
	p8NTzflNPx64LypmIxfdNLFm5c9qt1zeDdE+QHOqhn5susYYXWKLYAV0kO6a
X-Gm-Gg: ASbGncsVjnZtlH+JAFK4lpCmnn4vJOoSpk41VW5oHXM2s8cf7XTTso4LWwbAWXx2keK
	ZCKXA2lxbhBoaYUW+yCEJVhoJrWrZjQ7wwmyhpELrZV6KhJ6qvsYkHKCnqvTzwim1wa7w2cz34M
	O0n1BkTnQv/8xEHp7JjLp+l3wi9ljzA63EMw1px6uWHVB6BaS6EFvukH4WbQq2iC0ZDxbt/oWfS
	aY5cTz1h8iOgxjDz5Zpka1R7D8RX/dtbJKWlYA4rk0ziPmI0ng0F109hiTJ02upp0jNdwYnHWIA
	ap6+Ll8=
X-Google-Smtp-Source: AGHT+IG0QgXiumFPUd2T4oV2pIDZzhWbSWQdLEH4ku9w43LvUg3FHK47un2jwrunA3+ji3tGPrS4lw==
X-Received: by 2002:a17:902:f690:b0:216:501e:e314 with SMTP id d9443c01a7336-21dd7d74aedmr288804635ad.20.1738533272693;
        Sun, 02 Feb 2025 13:54:32 -0800 (PST)
Received: from apollo.localdomain ([2601:646:8201:fd20::c09e])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21de330758csm62514665ad.194.2025.02.02.13.54.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Feb 2025 13:54:32 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] gdb: Upgrade to 16.2 relese
Date: Sun,  2 Feb 2025 13:54:29 -0800
Message-ID: <20250202215429.2437062-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 02 Feb 2025 21:54:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210628

GDB 16.2 brings the following fixes and enhancements over GDB 16.1:

 * PR build/32578 (cannot build GDB 16.1 out of tree when calling the configure
script with a relative path)

 * PR tui/32592 ([gdb/tui] internal error in tui-winsource.c:340:refresh_window)

 * PR remote/32593 (Incompatibilities between GDB's and LLDB's 'x' packet
implementation)

 * PR build/32610 (Missing #include file in darwin_nat.c)

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../{gdb-cross-canadian_16.1.bb => gdb-cross-canadian_16.2.bb}  | 0
 .../gdb/{gdb-cross_16.1.bb => gdb-cross_16.2.bb}                | 0
 meta/recipes-devtools/gdb/gdb.inc                               | 2 +-
 meta/recipes-devtools/gdb/{gdb_16.1.bb => gdb_16.2.bb}          | 0
 4 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/gdb/{gdb-cross-canadian_16.1.bb => gdb-cross-canadian_16.2.bb} (100%)
 rename meta/recipes-devtools/gdb/{gdb-cross_16.1.bb => gdb-cross_16.2.bb} (100%)
 rename meta/recipes-devtools/gdb/{gdb_16.1.bb => gdb_16.2.bb} (100%)

diff --git a/meta/recipes-devtools/gdb/gdb-cross-canadian_16.1.bb b/meta/recipes-devtools/gdb/gdb-cross-canadian_16.2.bb
similarity index 100%
rename from meta/recipes-devtools/gdb/gdb-cross-canadian_16.1.bb
rename to meta/recipes-devtools/gdb/gdb-cross-canadian_16.2.bb
diff --git a/meta/recipes-devtools/gdb/gdb-cross_16.1.bb b/meta/recipes-devtools/gdb/gdb-cross_16.2.bb
similarity index 100%
rename from meta/recipes-devtools/gdb/gdb-cross_16.1.bb
rename to meta/recipes-devtools/gdb/gdb-cross_16.2.bb
diff --git a/meta/recipes-devtools/gdb/gdb.inc b/meta/recipes-devtools/gdb/gdb.inc
index 41f92be3cb6..1ac29b45f68 100644
--- a/meta/recipes-devtools/gdb/gdb.inc
+++ b/meta/recipes-devtools/gdb/gdb.inc
@@ -13,4 +13,4 @@ SRC_URI = "${GNU_MIRROR}/gdb/gdb-${PV}.tar.xz \
            file://0006-Fix-invalid-sigprocmask-call.patch \
            file://0007-Define-alignof-using-_Alignof-when-using-C11-or-newe.patch \
            "
-SRC_URI[sha256sum] = "c2cc5ccca029b7a7c3879ce8a96528fdfd056b4d884f2b0511e8f7bc723355c6"
+SRC_URI[sha256sum] = "4002cb7f23f45c37c790536a13a720942ce4be0402d929c9085e92f10d480119"
diff --git a/meta/recipes-devtools/gdb/gdb_16.1.bb b/meta/recipes-devtools/gdb/gdb_16.2.bb
similarity index 100%
rename from meta/recipes-devtools/gdb/gdb_16.1.bb
rename to meta/recipes-devtools/gdb/gdb_16.2.bb

