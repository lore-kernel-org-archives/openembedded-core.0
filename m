Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com [209.85.210.193])
 by mx.groups.io with SMTP id smtpd.web12.1827.1598295245219564405
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Aug 2020 11:54:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=RAHSiqTy;
 spf=pass (domain: gmail.com, ip: 209.85.210.193, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f193.google.com with SMTP id d188so5339072pfd.2
        for <openembedded-core@lists.openembedded.org>; Mon, 24 Aug 2020 11:54:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Ca9E6KDzk3+Jw6B5XyF0OZU2vlofvoNd12A7XbypX/k=;
        b=RAHSiqTy1hXOzKCnKG2FzYCqv5IJplV4Ief4EUYB7y+QuwD4eM3SZ5sndV79QhhrGf
         NOZcmZxH215qVM3ZKjU2tqL0UR0EekojRribEAhq5PXWuCz9mAlWi1uRoidnv+GsCwLJ
         z5okQltop1AK2wgUtzomye63A+oGbkWodQlddW8o898+AticoQFY07YGc6Phh7RlpNqC
         tuePD9qyKB/NS+qw4ZiNOA3DFeiDxoWhOe+K/uCQmx0lmOv/HQX/HBcBhByKdaP8//xZ
         YSoui6w3ccm4zHI2SvLLi/q4E49Yq6WqzQm1bZ5V6z6XaK9zJtpWH6LxHUhoey3s86vX
         dB3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Ca9E6KDzk3+Jw6B5XyF0OZU2vlofvoNd12A7XbypX/k=;
        b=OcI6b6lVQ863IplDp8ls3hqexFIpuMcVLn3dM7gZxKMylcLS6dVZtglqVWpV9W8QGM
         G5sQsGvOvlr3w8JZb7nfBCEAKlWHBMcDQM69rOVwUlY6Arthxg4Ua9UHrHZFmUkVZZBy
         ww5qHq5ItnuAcV7+8ein/i4fzwFJpW14uvpizpSTYfVrMcr9+9Jl+vrtHCFhCpW1zgFW
         AZguG1Qzqe2kQ/wFCgKVDk+XWTamux2SlF15xynbKuYvOOOunm4U0OvXRNntnKxe1YU1
         v1ilo2x2k767I92AuvsJQB1NOxxpS3jamRzcN/NmR9+D/mud1yjdN3AI4IwMOZMgqyqs
         fZtQ==
X-Gm-Message-State: AOAM530jYhhR862LkUOminjbEI/96dC57VJeMSvsGlEwYs/iyPQmn9c0
	aPf9A65rh8TcEapRB4SQP7oFRf+NiAk8oA==
X-Google-Smtp-Source: ABdhPJy9iNVUog35gBT6efdBIQ8dWKPUZ2Fb+18fXiL5CeHKfr1m4zzeljq3eANAMxAMXlmhk/lXzA==
X-Received: by 2002:a63:e747:: with SMTP id j7mr4188245pgk.107.1598295244248;
        Mon, 24 Aug 2020 11:54:04 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::55db])
        by smtp.gmail.com with ESMTPSA id k5sm10802110pgk.78.2020.08.24.11.54.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2020 11:54:03 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] packagegroup-core-tools-profile: Disable lttng-modules for riscv64
Date: Mon, 24 Aug 2020 11:54:00 -0700
Message-Id: <20200824185400.2297003-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

with 5.8+ kernel it seems lttng-modules needs kprobes which are not
there yet for riscv64

Fixes
lttng-modules-2.12.2/wrapper/kallsyms.c:20:3: error: #error "LTTng-modules requires CONFIG_KPROBES on kernels >= 5.7.0"
   20 | # error "LTTng-modules requires CONFIG_KPROBES on kernels >= 5.7.0"
      |   ^~~~~

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../packagegroups/packagegroup-core-tools-profile.bb             | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb b/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb
index 8aed1e8458..ca35af1ec3 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb
@@ -44,6 +44,7 @@ LTTNGTOOLS_arc = ""
 
 LTTNGMODULES = "lttng-modules"
 LTTNGMODULES_arc = ""
+LTTNGMODULES_riscv64 = ""
 
 BABELTRACE = "babeltrace"
 BABELTRACE2 = "babeltrace2"
-- 
2.28.0

