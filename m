Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC9F1CF58DF
	for <webhook@archiver.kernel.org>; Wed, 19 Nov 2025 19:56:20 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16291.1763582174457447264
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Nov 2025 11:56:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=ehzJGdmc;
 spf=pass (domain: smile.fr, ip: 209.85.128.42, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4779a637712so988035e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Nov 2025 11:56:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1763582170; x=1764186970; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2SggtuzizRJqiBmfnNmzPm/NWZK3z5oaZfrEGGUEz4A=;
        b=ehzJGdmcB7RPxM5iGDvFIOizA6AngPkSnavbF3qEahPrOAbfTyqAKntwRsJfV6szAM
         38rzS1bf4q5QiQexreroH0DdsnCVUk1SPpDV+Da1CpzcI+pkMYpz/ul5n0RBN4WUI5Vn
         5QE/oOPOm8+etXuvGQdbjOxNsEZ6mQx22fBMw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763582170; x=1764186970;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2SggtuzizRJqiBmfnNmzPm/NWZK3z5oaZfrEGGUEz4A=;
        b=quyBVha1DRUjIYM0k90rlPHv6RMCHFwKisdx+epdSolAM2H/uaUsVijMgIwY05bX7F
         w1A8Odb3MtFJxLWysAIoDnyveGmHDmpRnIe5B+NOFWdJGFVI1uc5YlP5//1XPq0EO7l7
         Lcp13wX0evA56pfyG4NbJPMf5fzWwz8HY7uMlbRQyrPSQtSGU5YPt5MqC06s7Y/eWHiD
         UjeNUx2b3d7U53uTQYLkaKHQ6foT2UAOzyZ6CcUaeg84HrawnRt8sNO2RuP1aUVRs5P5
         kI2fuBZzlb2JoxJgRwxhg8euXGCzVFX4ohIzAYvAQhzkM/jB6es2bJEIf7MUWmW7ggK0
         1q1g==
X-Gm-Message-State: AOJu0YzEfgNDhXkw+Z67esie0SHi/5ZYrH6CeIPjAtgh4wzPyJVzaNAp
	QuVl1tmGJmxhDm3hms5b79ix9g28igWNZD842bU072XWUdPH03JMY/0g5ldB8FIcw4RL9q+I/XG
	bEc27oww=
X-Gm-Gg: ASbGncvd59XZW57VayLj8qXiK1b+WM2qG/qCykzgNLMT+zWw+CS2v4k4iJx7Wa2r9Ye
	LEUC0nbUxEcJlaF8uHYVciUy9kQ5u3AZmzs1qfcILcqoSD1bzCZKLvBUAPBZgvY3IhjOyNzzbrz
	ws2kQCLkaWUsRyLyCU/WRoQigP8YuxR0IK1p27VHDepMiP6k4/htmBxev94I/6yagBI6hBiKFZg
	iX8S7oG7REQseXbXZwvxg5DnFF2jAsxVDYcOQKYobsfRa/tZF48xVYKmmAvXehbQDLp5NVjIeWD
	W1CO5Vo63NcCeaB/x0OOrT5pZ08bxpXYGPKIa0TAN/cEVbfFbXM0m0/FYgS6TvkU03XYcqpvrhd
	QfcS+xVNLXwb9FVPhO1NRWboHVnM8qqDtrqxBu8PYKirrXoU2Vnu0fZoqHj6QSJhoZxDnw0zz93
	z1nRv1EscGn4fACyHvADtix2STScoDoNgXD9lWWjRUmi7Xg8iuG7ckijHoG0iK5RjkQJIIZK47U
	j9Gl59EZC7rpOtEtUt+/gzKDSHgU4oJ
X-Google-Smtp-Source: AGHT+IHuOm7pq7uQndJXkCcJVm+Hm8M8LRyQ3btuRNrTvICWJUo9lGMdNrkIJirz7OVdF/xgViLR5g==
X-Received: by 2002:a05:600c:1c15:b0:471:672:3486 with SMTP id 5b1f17b1804b1-477b8a63477mr5638535e9.15.1763582170432;
        Wed, 19 Nov 2025 11:56:10 -0800 (PST)
Received: from P-ASN-ECS-830T8C3.home (2a01cb001331aa0017b58d8bf04048c3.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:17b5:8d8b:f040:48c3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477a96a58c5sm50519895e9.0.2025.11.19.11.56.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 11:56:09 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>
Subject: [RFC PATCH 1/5] kernel.bbclass: Export artifacts needed for out-of-tree Rust compilation
Date: Wed, 19 Nov 2025 20:55:36 +0100
Message-Id: <20251119195540.2671856-2-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20251119195540.2671856-1-yoann.congal@smile.fr>
References: <20251119195540.2671856-1-yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Nov 2025 19:56:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226582

From: Yoann Congal <yoann.congal@smile.fr>

Publish artifacts from kernel compilation to allow out-of-tree Rust
compilation:
* scripts/target.json: target definition: architecture, ABI, compiler
  options, ...
* rust/: the crates compiled by the kernel available to
  out-of-tree-modules

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/classes-recipe/kernel.bbclass | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/kernel.bbclass
index 003a155e794..a9a25b9819a 100644
--- a/meta/classes-recipe/kernel.bbclass
+++ b/meta/classes-recipe/kernel.bbclass
@@ -631,6 +631,24 @@ do_shared_workdir () {
 		cp -r scripts/gcc-plugins ${kerneldir}/scripts
 	fi
 
+    if ${@bb.utils.contains("DISTRO_FEATURES", "rust-kernel", "true", "false", d)}; then
+        # Copy target.json file needed for out-of-tree rust modules
+        if [ -e scripts/target.json ]; then
+            bbnote "Copying scripts/target.json"
+            mkdir -p ${kerneldir}/scripts
+            cp scripts/target.json ${kerneldir}/scripts
+        else
+            bbwarn "scripts/target.json not found in compiled kernel. Out-of-tree rust modules will fail to build."
+        fi
+
+        # Copy rust/ needed by out-of-tree module (firstly for the core rust crate)
+        if [ -e rust/ ]; then
+            bbnote "Copying rust/"
+            cp -r rust ${kerneldir}/
+        else
+            bbwarn "rust/ not found in compiled kernel. Out-of-tree rust modules will fail to build."
+        fi
+    fi
 }
 
 # We don't need to stage anything, not the modules/firmware since those would clash with linux-firmware

