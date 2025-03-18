Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EB19C35FF3
	for <webhook@archiver.kernel.org>; Tue, 18 Mar 2025 16:46:06 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web11.1679.1742316364814666608
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Mar 2025 09:46:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MFxrxUFg;
 spf=pass (domain: gmail.com, ip: 209.85.221.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3913b539aabso3714305f8f.2
        for <openembedded-core@lists.openembedded.org>; Tue, 18 Mar 2025 09:46:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742316363; x=1742921163; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wyuRtJ4fHIsE6DFqbYks1Ld3Udw+zFV2N8BvAQqCZR4=;
        b=MFxrxUFgM9JvZkVf6El1bEamYoTzfLdBn8smBQVZU+uFGtcqz4gsbj/sYxIdCE5/cw
         jtVX7RyMkseA4lzwFoDSQ+lot6FQsAE0REqbQn0C7VaXxUmNAP19KCXu0Ta9yx9OPaK3
         SEFmZngWulaGq83kqI5WpmlG8ygNsdi65U03DQ1cJwsa4JhvF7ReQ6e2HebpxaloCLBS
         yWgIro7wMXl00wXLCJ/xHHc4icbXbHZod8iyuks5q6ArUzBB2altF9lZ+zPnPbrWWrR8
         iUnAujAO3d7BQimfkhc8lA0DUW+K1g5/7l5l0t3tTB8L2MrEs9+J4noXnBfYf6WQHg7F
         RUbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742316363; x=1742921163;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wyuRtJ4fHIsE6DFqbYks1Ld3Udw+zFV2N8BvAQqCZR4=;
        b=tdZooUwAIsM0L/CfOBbF5oeoYB1glQ0SdSwGPR92DEAwm6V29zSpXzt0EY1Vu1E9x5
         crMLHwc1m1VNj0YwzuDx2y/QiwRDUFB9qNhDGO0Z8kInVVS74gP8U+iedEZfZXp1GzeV
         B8e8szqw0ddgTUFmSJDvoGO3UYiPQf9R9GNS3XxC/e5NkcYqO8ntuB3/HPGHw0ZfqN1z
         7Fysxy5FRY9IBScG7wyxGrOdFTbvN72DwMPUDJo9NwaguW4oMvkGMBhlEkZED5ijUC7R
         qmBMcM90uVWdKb/WLS0V+/r+otabpJiW5oU0gEk/0iN53UFqaRwJdBFLoo+RrmihK9N/
         ciyw==
X-Gm-Message-State: AOJu0Yy5YPfoLrWFqTodCZOZdJfwvo61Vs5L1hS9LB1Lwcdb+bxFh2U/
	W665Ci6l8NXDAqWTIs9O2lOMKcFITSR/M2cna/t9QNyAO0dHZRUba6z3Bw==
X-Gm-Gg: ASbGncuKnzdod1QjZ43CQyziqn1w/9HI2k3majMqhzGlguo/kcGSAgl7p5P+VJiol2o
	hMMLobn17iVPokQGlX7/y/DKsUOKVfPtH1G8WnqgakOtYTm462jm08TPl8c4gJhCc2iK1AiQe5L
	87yoD8v/T3w97ov4wGVMpWXQMqEyeoptxLXa6qybbNvpqWMGs+A45ohHBu+0tOUQAVDSJERna4D
	YL2VWAxRA3DE88PHoOoSlAPvmRbBE1iRKIqp6l6EKG5LfOPO1vHw/CFKMwxWIAcW9259pN7IavG
	tnz8KoBkG9VgA1j87qj3SujM45X+vFaB2lFFHK0iI8LEJwwr9m/skxFH0AdcJWMuVWywCc+BXi0
	+cn+6VQ==
X-Google-Smtp-Source: AGHT+IH1yxhikUb86nW6X/kLqL1r9cME8FFxF8u6NRkwF7GzVEStN+ltLobtl505YvngeBIu4bDPHA==
X-Received: by 2002:a05:6000:188e:b0:391:22a9:4427 with SMTP id ffacd0b85a97d-3971e2ae20dmr14126778f8f.12.1742316363159;
        Tue, 18 Mar 2025 09:46:03 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-395c7df35ecsm18804416f8f.16.2025.03.18.09.46.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Mar 2025 09:46:02 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 2/3] qemu: fix upstream version check
Date: Tue, 18 Mar 2025 17:45:54 +0100
Message-Id: <20250318164555.1527383-2-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250318164555.1527383-1-alex.kanavin@gmail.com>
References: <20250318164555.1527383-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Mar 2025 16:46:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213225

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-devtools/qemu/qemu.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index d253529b3d8..53f48375e4a 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -35,6 +35,8 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://qemu-guest-agent.init \
            file://qemu-guest-agent.udev \
            "
+# file index at download.qemu.org isn't reliable: https://gitlab.com/qemu-project/qemu-web/-/issues/9
+UPSTREAM_CHECK_URI = "https://www.qemu.org"
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
 SRC_URI[sha256sum] = "f859f0bc65e1f533d040bbe8c92bcfecee5af2c921a6687c652fb44d089bd894"
-- 
2.39.5


