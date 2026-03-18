Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E98F103E18D
	for <webhook@archiver.kernel.org>; Wed, 18 Mar 2026 13:47:10 +0000 (UTC)
Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14441.1773841627118326339
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Mar 2026 06:47:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=H+1Y8T4r;
 spf=pass (domain: gmail.com, ip: 209.85.161.52, mailfrom: jpewhacker@gmail.com)
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-67bbea1e090so397359eaf.3
        for <openembedded-core@lists.openembedded.org>; Wed, 18 Mar 2026 06:47:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773841626; x=1774446426; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FCaaEZW0U/AEs0relez15VB/j0mdCHwpFh7bL0M3bMQ=;
        b=H+1Y8T4r/D6uLM6MG7moPZkdJY4VZ8k6tU77mqiT0aKzdO/9WY2guBOppiXGBJjWs8
         yER38T9ZX+S7yvd1JgFD39xcfG+p3OYTERuEi70gq2sv8EkcUAhhwADc6Dp/qC6dnHyK
         iN65MEQF3A8QXufTf1Juj3rUKUXB75er30mpuFZstJKA5HwmpJCgIn7S8iQTSsUwzehS
         4HMvHKXGHdZnnsENUPJynN42XNYwwQuvETnkLbBLj89n9LlQxJ7XM/KtL614Xvq8Xc+g
         jyLTCOysPMARZ9v3AhjCJ7uHC4fevrp+9TFSzahfhpgYM26pJsYVi626gJdHJ9VkXtJr
         zPgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773841626; x=1774446426;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FCaaEZW0U/AEs0relez15VB/j0mdCHwpFh7bL0M3bMQ=;
        b=SZ9uNAEtjviEkINDYV1CYjTqBXp569oearTSFwgAK/xmLPfJt4ntgWs7+rsVVvYBUp
         rC3xhRFunciMNuVrEAgpxqIsPd+GI9a114g1MnQdGehKwMpaiLj/S/ai0W+x3WeDAQ91
         NhUpQxqDtBIB2HIvjBLmtScL17p7szRcGmmcccvAE6TWNWYLEA4ZSO11KszbahiSStbT
         gy7NfvMH7OCNqIVSkray1S1FYz6LoRkWfu1weno8mjWIgb1Q3DPHkywZx4CrEBQM6Pdq
         KgHdWLZ/dknJ28KPR6byjUU1VwAh8wp2MwFOcSE1CJsxXQ/uclEiFUFtI61bkpmH3aXC
         7u9A==
X-Gm-Message-State: AOJu0YygaKNDe7bwci9jide9ShnTp9SXtHk/Zr6haHX4jL9j+v2ojiTO
	hVwTL1beVPkI0OgYSrk4LkS2Ijs4SAmNPrbJvYeFEK4+yhMbYUfdpt3hYWoTgA==
X-Gm-Gg: ATEYQzzOfXL6PWo6XGDnjS8K/Jc8pvegxura+1+gtkXcp2PDYN40qVIR/nsJpe1wtZ9
	h+XDAuhFph3ipdKKBERyGpGBlG6GvkkKJBaBC5HkW2cEOZPxWFlTGE9EFEtfteFLvehpQ5TSBpN
	MVtGg3R2v9i59SlEmPZnShrdCpww83d2U7sn+rTxFOsDN0GUeFP1e3BV/MABMaGqTpZC056Ac7O
	NfVxnFrFIzKsOufF4wAimJ7+r+s/UZFTr4fFQ2EWCFazXpY0DqNOgaJ77ZZ19bydZOT7JIbCmk5
	U3IlfZNtUEGd9tz89UqgV0m59nF+8cQXrxnFV5FRDK6uneTTBqaablguPTgS9xqWktMsNzGYu8Y
	r86hYFaaEudbLy86u5EgmxIZW9zdIuYIXvqOGJoE+WESGqaNorOCc8OntBIj9fzHi0BftzP1W6U
	1OVxvIfEi5t/zsmyFYP0xy
X-Received: by 2002:a4a:e84b:0:b0:67b:d213:e64e with SMTP id 006d021491bc7-67c0daf32bamr2145569eaf.34.1773841625934;
        Wed, 18 Mar 2026 06:47:05 -0700 (PDT)
Received: from localhost.localdomain ([2601:282:4200:11c0::8279])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-67c0d89c739sm1763625eaf.13.2026.03.18.06.47.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 06:47:05 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH v7 08/12] spdx: Remove fatal errors for missing providers
Date: Wed, 18 Mar 2026 07:44:36 -0600
Message-ID: <20260318134655.953233-9-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260318134655.953233-1-JPEWhacker@gmail.com>
References: <20260310184058.533343-1-JPEWhacker@gmail.com>
 <20260318134655.953233-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Mar 2026 13:47:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233398

When creating images and SDKs, do not error on missing providers. This
allows recipes to use the `nospdx` inherit to prevent SPDX from being
generated, but not result in an error when assembling the final image.

Note that runtime packages generation already ignored missing
providers, so this is changing image and SDK generation to match

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/classes/create-spdx-2.2.bbclass | 3 ++-
 meta/lib/oe/spdx30_tasks.py          | 8 +-------
 2 files changed, 3 insertions(+), 8 deletions(-)

diff --git a/meta/classes/create-spdx-2.2.bbclass b/meta/classes/create-spdx-2.2.bbclass
index 3288cdf75a..aa39208eae 100644
--- a/meta/classes/create-spdx-2.2.bbclass
+++ b/meta/classes/create-spdx-2.2.bbclass
@@ -858,7 +858,8 @@ def combine_spdx(d, rootfs_name, rootfs_deploydir, rootfs_spdxid, packages, spdx
     if packages:
         for name in sorted(packages.keys()):
             if name not in providers:
-                bb.fatal("Unable to find SPDX provider for '%s'" % name)
+                bb.note("Unable to find SPDX provider for '%s'" % name)
+                continue
 
             pkg_name, pkg_hashfn = providers[name]
 
diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py
index 5b651900c4..c4af191974 100644
--- a/meta/lib/oe/spdx30_tasks.py
+++ b/meta/lib/oe/spdx30_tasks.py
@@ -1178,11 +1178,10 @@ def collect_build_package_inputs(d, objset, build, packages, files_by_hash=None)
     providers = oe.spdx_common.collect_package_providers(d)
 
     build_deps = set()
-    missing_providers = set()
 
     for name in sorted(packages.keys()):
         if name not in providers:
-            missing_providers.add(name)
+            bb.note(f"Unable to find SPDX provider for '{name}'")
             continue
 
         pkg_name, pkg_hashfn = providers[name]
@@ -1201,11 +1200,6 @@ def collect_build_package_inputs(d, objset, build, packages, files_by_hash=None)
             for h, f in pkg_objset.by_sha256_hash.items():
                 files_by_hash.setdefault(h, set()).update(f)
 
-    if missing_providers:
-        bb.fatal(
-            f"Unable to find SPDX provider(s) for: {', '.join(sorted(missing_providers))}"
-        )
-
     if build_deps:
         objset.new_scoped_relationship(
             [build],
-- 
2.53.0


