Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F661CAC5A5
	for <webhook@archiver.kernel.org>; Wed, 24 Sep 2025 06:24:54 +0000 (UTC)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.web10.6365.1758695093786358483
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Sep 2025 23:24:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=g7SmaK6b;
 spf=pass (domain: gmail.com, ip: 209.85.215.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-b555b0fb839so1793854a12.3
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Sep 2025 23:24:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758695093; x=1759299893; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qfpyBkbxEw6wjSO2HI8CqXt71UpHd3xwR/S3l68qLRM=;
        b=g7SmaK6bA4fvNbVY8XY1dtyVCT7z3fckVDnQdQ9eZOPXvMnrhC0jaDYAOgflRA67dt
         hH0fcMmTzStFSA/aivsVma/id9qFaMlgpQfX0qSUgPqiNC0fJDf+doIVxmp0Ss3hq39n
         IgUD04/6aFzTlzIoPXs6smtjOPqSN2QPQB7GlHRbt7dy3WXdFHFhpb5632YrnMBnIkNJ
         nzFloZDzz6+OMSycPCtn7zZkZNhU+W+bmSgo0YPus59O3bYl3FZ+mGjRbEQkRl6QczmZ
         Y5cX9qmQ7vm2TkhpPn8qxoumpZWLXkHDRLxRKH0xxOWYBy7TGFzuObHeYI4LVDVMh8PJ
         O8cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758695093; x=1759299893;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qfpyBkbxEw6wjSO2HI8CqXt71UpHd3xwR/S3l68qLRM=;
        b=AS4hv5W9k/vrPkXqO0O5kycwx0CPopnJ7thLwAnyzuK2l/AHMsmh2ieg3OHw12A2+D
         AwA/qm0X9l7gKdTq9CQ4fGpHnnH/3i/TF9i6+pZCq9pu1+JqCGbcVYKr/Fv9K4kPdYhW
         JFt5UKCfAUipRorWjXndgTscXct20PJ9X7OYBNCIL6+4sPIQ4UKmpmznUAntDHsHng/p
         RhhZ6m7xsNb91GDxMcNevmr6DS1Sd2HLA7nF3Y3vyxdUJCC+GssLyh/rYFeV9nqauMHB
         w+eCZTKxwj40oWcJYqYvkhb2DBjZQb8kqFInXbjXcxPn4WM6d3ZV34f3kVbqkghAvHjt
         FzQA==
X-Gm-Message-State: AOJu0YxKdr3siZpcb0GfmFEy1XvovJ60vQr7mwhkUaR29ePDw3mNNxfu
	zHKqqC7mL0NQekt87tImj3LGhK52dpWLAXm2UwvFvv1pt8IK2VJ8MeFFn0Vt/GeI
X-Gm-Gg: ASbGncuoR7WLimFEJQqOfVE+3DeoPnheXKQ81zwpBvzDfzS61A53rjOOrMH6oso8FRY
	hduRegbvVx/Sz8XK65C6GG8FoAjhvP5E2c73FXdg5bpS7CCt+jzqaS7gPdIbfFRCm6/e0HkE68o
	m8j18tdvBUkXuQWLNvtL9pYo1/eKOlOy2LYyqlqKH8lk4iX6L3dn6EY27rxI5oel6O4BBNH1mNx
	10T3FPl38b2gLJyOXpacBdkwm5R5CdbtsUTkCkVhffjnVo6Qx74mrJY+1ZPtF1pt0BYhktMTwat
	/yBg95tQXPYW3TY8d0yKumT2Bbw/4oUP0F04D++lzoNLEWfUZvj3PtLLv3yIK4LE8Q3N/llRuar
	hEDKwrULmhjUqeuQYQgivqqpsRn/T6lXB0Hk0wX4pZvYB/EXYqOgjSdTLYjTM98zPRPYQPxOcml
	X7zd79oRD1JE0NLp4TDdfo3RqgbUlBz9PtLNHtyqXr
X-Google-Smtp-Source: AGHT+IHOVUOUpq5l3bp4qtr4UmIdfVaG9FKTj6pgtZQjLN7yp1sEnTXZTL5yx/KjkeapuT8G0OlbEQ==
X-Received: by 2002:a17:903:190:b0:277:9193:f2da with SMTP id d9443c01a7336-27cc0dbb137mr67847325ad.5.1758695092747;
        Tue, 23 Sep 2025 23:24:52 -0700 (PDT)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::7309])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-26980053594sm181264065ad.21.2025.09.23.23.24.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Sep 2025 23:24:52 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] qemuriscv: Use RVA23S64 profile for cpu
Date: Tue, 23 Sep 2025 23:24:50 -0700
Message-ID: <20250924062450.3626668-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Sep 2025 06:24:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223947

Enables RVV extensions uniformly across gcc and clang
as it is mandatory in RVA23 spec.

https://github.com/riscv/riscv-profiles/blob/main/src/rva23-profile.adoc

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/machine/include/riscv/qemuriscv.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/machine/include/riscv/qemuriscv.inc b/meta/conf/machine/include/riscv/qemuriscv.inc
index 35961272022..b755d32c9d1 100644
--- a/meta/conf/machine/include/riscv/qemuriscv.inc
+++ b/meta/conf/machine/include/riscv/qemuriscv.inc
@@ -27,7 +27,7 @@ UBOOT_ENTRYPOINT:riscv64 = "0x80200000"
 # qemuboot options
 QB_SMP ?= "-smp 4"
 QB_KERNEL_CMDLINE_APPEND = "earlycon=sbi"
-QB_CPU:riscv64 ?= "-cpu rva22s64"
+QB_CPU:riscv64 ?= "-cpu rva23s64"
 QB_MACHINE = "-machine virt"
 QB_DEFAULT_BIOS = "fw_jump.elf"
 QB_TAP_OPT = "-netdev tap,id=net0,ifname=@TAP@,script=no,downscript=no"

