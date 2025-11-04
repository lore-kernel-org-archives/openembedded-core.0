Return-Path: <elmehdi.younes@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CBF3CCFA07
	for <webhook@archiver.kernel.org>; Tue,  4 Nov 2025 17:16:03 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1230.1762276560969860103
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Nov 2025 09:16:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=uIn/Yw5m;
 spf=pass (domain: smile.fr, ip: 209.85.167.50, mailfrom: elmehdi.younes@smile.fr)
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-594259bc5f1so2413543e87.2
        for <openembedded-core@lists.openembedded.org>; Tue, 04 Nov 2025 09:16:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1762276559; x=1762881359; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gS9cD8GBDsYyZvtRv7+aVvW+0U8dFSuywLsNQEP5FZ4=;
        b=uIn/Yw5mBEoAuCF+o7F5oeBxjdkSaAGg31RoNjftsKEklkjIsWZrXO0EyvbanKjv0j
         /uqVsmS7ltUk+FiFqG5DB7BHb5yt8G2mhmlZbPx28iXWEWpgJbeCloOmzb+tDRjJNhVZ
         TaFJuATAGGiWB+Kad1B7mLlZs79+RrYb8bUsM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762276559; x=1762881359;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gS9cD8GBDsYyZvtRv7+aVvW+0U8dFSuywLsNQEP5FZ4=;
        b=AW/0rWHi6ndDm4k28ZiuhWoM7NwvVyibvno7o8N3QqFaZ5QuAsK+dGMVH96tkPzdCP
         ZYp+d21OoDBDr6m1tvp/3K6NDSXrH7ShE5nIp/1FhINhdEeiM1iDmim3KlXQ2UjktgXf
         jXLGt6x7b1NfjSMypWIPesDRFY2YgbfUv9GUk0LvSeC6uUL+MXl9yHHbUSdny9tqqtpb
         pzKptp8HIJkPyltgC7n8jE0AgduzxJGBICeyVrR7Egd7ZjMGPHbr9rwGumQdFmwxqd4m
         dZXK+lGjDqcJUhkZ+99IkTDjGw28s1PI1yonK13/uImdsFop/d6fHaiJAo+cvl5mgMG2
         oq2g==
X-Gm-Message-State: AOJu0YxEoOr8ZtV50DZz5YvEeQeX7rqWylDj2uOO5RTOBnt4N+L8Hetn
	j9K1P3k+4FNr9B+1QldRMyULhz+tgHR7ZkQa7W0gwQk8q+QPPPDpOhc09NhqFsfgnQRw+wQfWmy
	PoL7lsJc=
X-Gm-Gg: ASbGnctW7jBPVe8/MFR5fymOMVexepCsk5ai7xjYzD/EkMbMvMgXxWuCDMWbXSbHa1Z
	EI9Hn0fZ9dpvbTtTdQyYfnM4wblCG7Ps1DrLpKlaWteJtZA9fTNCmKWnnKnIB5ZmKZb4CHms57V
	Xd2/egCH7RUjqnR8rmDWI3Db0oYMIxkVb4mepV8JJLWgxAMFplS7o1HD08w7gzBLiS9sdTVM2zS
	oL+fISAJDd4VeNSe4NfbPnIP0rC1CnFVcwH28oIMnCV0KOCfGnbPnpwAmIMNrxI9pnFS/zM7VFq
	qzLBFDExu2+KW/p2WueQX7nrCP8gLHiRCLBkveK6VkIKNgVrJYdhZVOaCtT//HzPqpq8zEwGsDb
	SOwgnLOrlUQCv64m/2RIJqCQ42OZRQsbOTKCKfLzcG6Dy7LoTJXnzSp9AbQq371bUX1f1i7z1aG
	xKAUQAA3y4DkzrYwhbnnJV1KGYYuzyeaWf++7IMGRT7w1s+sb2cWIvAA6NuGtawr7usx5EFg==
X-Google-Smtp-Source: AGHT+IFdvyF7jwICkXjVztTDdMonkZzEGTlNOqyJnX2XigoEimklL16SghpVxFdzlxrFKquUrPHFsQ==
X-Received: by 2002:a05:6512:110e:b0:594:2837:90f0 with SMTP id 2adb3069b0e04-59428379127mr2387495e87.27.1762276558702;
        Tue, 04 Nov 2025 09:15:58 -0800 (PST)
Received: from FRSMI25-BOLET.. (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5943437efd1sm914407e87.4.2025.11.04.09.15.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 09:15:58 -0800 (PST)
From: El Mehdi YOUNES <elmehdi.younes@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: yoann.congal@smile.fr,
	El Mehdi YOUNES <elmehdi.younes@smile.fr>
Subject: [RFC PATCH 4/4] linux-yocto-dev: Add temporary Rust kernel feature
Date: Tue,  4 Nov 2025 18:16:11 +0100
Message-ID: <20251104171611.2227798-5-elmehdi.younes@smile.fr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251104171611.2227798-1-elmehdi.younes@smile.fr>
References: <20251104171611.2227798-1-elmehdi.younes@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Nov 2025 17:16:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225740

This commit introduces the 'rust.scc' and 'rust.cfg' files, adding
them to the 'SRC_URI' of the 'linux-yocto-dev'.

Ideally, these kernel feature files belong in the separate
'yocto-kernel-cache' repository.

However, for the purpose of this RFC series,they are being added directly
to 'meta/recipes-kernel/linux/files/' to allow the entire feature set to
be tested and reviewed in a single repository.

Once this approach is discussed and approved, these files will be
removed and submitted as a separate patch to the 'yocto-kernel-cache'
project.

Signed-off-by: El Mehdi YOUNES <elmehdi.younes@smile.fr>
---
 meta/recipes-kernel/linux/files/rust.cfg     | 6 ++++++
 meta/recipes-kernel/linux/files/rust.scc     | 2 ++
 meta/recipes-kernel/linux/linux-yocto-dev.bb | 2 ++
 3 files changed, 10 insertions(+)
 create mode 100644 meta/recipes-kernel/linux/files/rust.cfg
 create mode 100644 meta/recipes-kernel/linux/files/rust.scc

diff --git a/meta/recipes-kernel/linux/files/rust.cfg b/meta/recipes-kernel/linux/files/rust.cfg
new file mode 100644
index 0000000000..dc31c9efbc
--- /dev/null
+++ b/meta/recipes-kernel/linux/files/rust.cfg
@@ -0,0 +1,6 @@
+CONFIG_RUST=y
+# --- RFC TEST ONLY - REMOVE FOR FINAL PATCH ---
+# Enabled samples to validate the Rust build.
+# Users should enable these via their own config fragments.
+CONFIG_SAMPLES_RUST=y
+CONFIG_SAMPLE_RUST_MINIMAL=m
diff --git a/meta/recipes-kernel/linux/files/rust.scc b/meta/recipes-kernel/linux/files/rust.scc
new file mode 100644
index 0000000000..8b81971be2
--- /dev/null
+++ b/meta/recipes-kernel/linux/files/rust.scc
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: MIT
+kconf non-hardware rust.cfg
diff --git a/meta/recipes-kernel/linux/linux-yocto-dev.bb b/meta/recipes-kernel/linux/linux-yocto-dev.bb
index fb4e0864d2..a1c9940219 100644
--- a/meta/recipes-kernel/linux/linux-yocto-dev.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-dev.bb
@@ -59,3 +59,5 @@ KERNEL_FEATURES:append = " ${@bb.utils.contains("DISTRO_FEATURES", "ptest", " fe
 KERNEL_FEATURES:append = " ${@bb.utils.contains("DISTRO_FEATURES", "ptest", " features/gpio/mockup.scc features/gpio/sim.scc", "", d)}"
 
 KERNEL_VERSION_SANITY_SKIP = "1"
+
+SRC_URI += "file://rust.scc"

