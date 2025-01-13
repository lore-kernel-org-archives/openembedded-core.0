Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBED9C02180
	for <webhook@archiver.kernel.org>; Mon, 13 Jan 2025 23:39:19 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web10.32802.1736811556290021920
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Jan 2025 15:39:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XcMkPUFC;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-436249df846so33846595e9.3
        for <openembedded-core@lists.openembedded.org>; Mon, 13 Jan 2025 15:39:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736811554; x=1737416354; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZcfvNt2gSgftEQfq+3xAxbZwOWoZ7uzLNBNzIZ2CNx4=;
        b=XcMkPUFC94M33/dzQUxr5HTTUgxPrSpRLf0x8anYU5IB5i/+IBSc6hpgJp0ualqrq8
         UyNze6IQ5eU+RcSArt9Nd1OkYKgaRtqXDTK3x1E4VnPU0M8JXElnCdthv907EKXc/kke
         F42wDAUGrjOM5IMlF53bdmWSaiaMRLq+II0DwWVPqdv9r94yBS6cUNai5wChiM17gyo+
         gyXr/8znCfB5y5iuNI9bDMd5Y4hpZB60m4m5AQh6RbGqV5dn/ZE2+57QAE8V1aHGkjuA
         ZaCt3irM8gSKu7ZKFvLOMN1G2pWeYYfxcWWPzcmrqLJncvXvBIx5G/yBEhbJf2ml7dqY
         VR3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736811554; x=1737416354;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZcfvNt2gSgftEQfq+3xAxbZwOWoZ7uzLNBNzIZ2CNx4=;
        b=vYEseDbPaTeYnUH42jBg9JFWn0Bd90fzzBa2ZsoWXfryAvWgNBNLIDprrGNmngJMlK
         pNrBUN9t9gAhqPObS7P1mq6euYTrviunjy9jfK6r9P/MHOY1nNKHc9eegRm128JCL1jq
         FSANTLE5w61NTfSPMRY/WLolwAR8QVq9ydbtyrtUkC5QqmR6LqyS/84k3s3upiKkzp/c
         WBl9vTvy9d2ye2uP0xnJ07FlZ2i/GquDPAIZxd+ZxqmtM5PmtPRK5DTozh+hpuEYnmu5
         DfaHJEuzHo4U5HBM62HRZqcR+Urb5ukHtr9bslMlrRQ0f0q/f7InWWZsv6TYeSSJLIGB
         G/2A==
X-Gm-Message-State: AOJu0YxPaBSJBR3Zl0F1pEiZqvaYincjguZfibBmz1HKEa+Havnc5ffg
	OGjFnOHpYc6W6uKfwSCVc3ZnsiA7UjW7o6OVHNO/zipP7tPaxE8DeBcy1VYY
X-Gm-Gg: ASbGncutU6HpD0jHfMTZql+lkjGhHSkYWHMbI1th6ny1DxeRfN97uy4u4K2XCRtRUyb
	334Fxrr2F2UNVUUYXjSalDqpzA7yc763c8xw/nfGzsBSskto2TdVnqQduZb3BsWx2p8fUmogE8c
	ytDIz8vRKvB6HomIo57SanLyI0qXOplF9xGfHVyWQP4N1IUHm7AptFAE3t0fuQgi7Sg8WrDcwlH
	6xPArtDPxk2hf8ec8YffU98s+FW73NSM+JINqd33cmIeIi+gmwHOnlNbIjywzDxCfY/QBBWypLF
	thE=
X-Google-Smtp-Source: AGHT+IECP2O7oPclw0sOHl+a9sMQcZlDSBtjmjD4h/DPv0dbejv6jmlliag8dFnc/NP2PLivy7aVDA==
X-Received: by 2002:a05:600c:3b0c:b0:434:fa24:b84a with SMTP id 5b1f17b1804b1-436e26d96d8mr179990795e9.25.1736811554387;
        Mon, 13 Jan 2025 15:39:14 -0800 (PST)
Received: from wsadrian16.fritz.box ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436e2da7768sm194596605e9.5.2025.01.13.15.39.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2025 15:39:13 -0800 (PST)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 1/2] devtool: build-sdk remove unused imports
Date: Tue, 14 Jan 2025 00:39:08 +0100
Message-ID: <20250113233909.4182045-1-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Jan 2025 23:39:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209769

These imports are not needed.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 scripts/lib/devtool/build_sdk.py | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/scripts/lib/devtool/build_sdk.py b/scripts/lib/devtool/build_sdk.py
index 1cd4831d2b8..990303982c1 100644
--- a/scripts/lib/devtool/build_sdk.py
+++ b/scripts/lib/devtool/build_sdk.py
@@ -5,14 +5,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 #
 
-import os
-import subprocess
 import logging
-import glob
-import shutil
-import errno
-import sys
-import tempfile
 from devtool import DevtoolError
 from devtool import build_image
 
-- 
2.47.1


