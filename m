Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C30E6C3065A
	for <webhook@archiver.kernel.org>; Mon, 24 Jun 2024 15:23:02 +0000 (UTC)
Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
 by mx.groups.io with SMTP id smtpd.web11.143619.1719242576934067725
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Jun 2024 08:22:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gRMzpepg;
 spf=pass (domain: gmail.com, ip: 209.85.161.47, mailfrom: jpewhacker@gmail.com)
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-5bb041514c1so2362296eaf.0
        for <openembedded-core@lists.openembedded.org>; Mon, 24 Jun 2024 08:22:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719242575; x=1719847375; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4NxoTT0chhRSku9uLazS6ysJC6IFgB1WIJmpWaVygvQ=;
        b=gRMzpepgo9+7EmNsMyPjrm1k/vz3OIgBlmtwUv/9fpD2g/qjIJOjkC4KatkciPxNSd
         Si3qs7xnwijC0ZGWzkD/J1Wz9ZMfIJiwPzrM1jbNwOM96TVlsSoYDNZIRMZcm3n42DMx
         FgAtCuzFpEfm2vmPayWf0Cy8aQy1nq+K8N193GRGdMiDY3WZtDsZCSvttLit4nTnjfmp
         5K1/NyQyA5T/GiB6a9mC5qnnY9QjFnd0wM8uTQ5Yrxpt0G/I6Xwpm7pq4LkScnB+06wC
         fGQBuulriMwYXm1SaHs9h/VfPWmLtnGD6CoNjCa+l7NSWp1jVnmIOuer+FWcaMfieWAI
         Tlfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719242575; x=1719847375;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4NxoTT0chhRSku9uLazS6ysJC6IFgB1WIJmpWaVygvQ=;
        b=bq0P+y4hXnFp9OqFhknYJqf+BflGGKrKm4/x+QADg79QNSL3Xb/J1DL1cxigzmsS6V
         gThwg4EvV5uOToCT/YEhxlVh+us3yAnoub9Rc/opMXMVoXdlqZ0s5D3zUI/7qjIhXZiD
         zayCi2GqAqlixudGYNOuQKzHHZcH0t+FTNxg4WJ/m0PMk4VUVF6xn4/6xtvnQpfS4SVg
         ivkvEpJtIVuZ7ESeMiQ1n77rzMTfzLAVrTeiuMz0Cb0qzrif5EF9J9OXbcPUdFOZSUcL
         oSXSVk8Ym5j9cNMohl2wzOWoX5BiB5Ex6+BVeS6x7A0sH6KmbZCOamXd5WCGRapkaR3o
         AyOA==
X-Gm-Message-State: AOJu0Yz7K3jnoskOCsQfNBFPwma7xYrBbE9h3F4G1AlMtbAyeNncvqTX
	bR30T0+j5D3cwBwP3k9uxeB5SSFEH+1Fu6lKUMdFs+X47N2MhLI2yvGK9g==
X-Google-Smtp-Source: AGHT+IEGf0DCzw+/gUSaA4VY+cPv28CGV/2nuohH1uvucW3s5RtHsFnhDfjf1jUXlvGqYILIuQffyw==
X-Received: by 2002:a05:6870:224f:b0:254:a810:cdc with SMTP id 586e51a60fabf-25d06b765afmr5163201fac.1.1719242575105;
        Mon, 24 Jun 2024 08:22:55 -0700 (PDT)
Received: from localhost.localdomain ([2601:282:4300:19e0::80e1])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-25cd4b80c47sm1890279fac.39.2024.06.24.08.22.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jun 2024 08:22:54 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH v3 04/10] classes-global/staging: Exclude do_create_spdx from automatic sysroot extension
Date: Mon, 24 Jun 2024 09:20:33 -0600
Message-ID: <20240624152236.1019980-5-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240624152236.1019980-1-JPEWhacker@gmail.com>
References: <20240619221805.3038528-1-JPEWhacker@gmail.com>
 <20240624152236.1019980-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Jun 2024 15:23:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201094

do_create_spdx is a outlier in that it doesn't need the RSS to be
extended just because it depends on do_populate_sysroot. In fact, it
only depends on do_populate_sysroot so it can see the actual recipes
sysroot, and attempting to extend the sysroot can cause problems for
some recipes (e.g. if a recipe does do_populate_sysroot[noexec] = "1")

As such, explicitly exclude do_create_spdx from extending the sysroot
just because it depends on do_populate_sysroot.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/classes-global/staging.bbclass | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/classes-global/staging.bbclass b/meta/classes-global/staging.bbclass
index 3678a1b4415..ecce68d532e 100644
--- a/meta/classes-global/staging.bbclass
+++ b/meta/classes-global/staging.bbclass
@@ -652,10 +652,14 @@ python do_prepare_recipe_sysroot () {
 addtask do_prepare_recipe_sysroot before do_configure after do_fetch
 
 python staging_taskhandler() {
+    EXCLUDED_TASK = (
+        "do_prepare_recipe_sysroot",
+        "do_create_spdx",
+    )
     bbtasks = e.tasklist
     for task in bbtasks:
         deps = d.getVarFlag(task, "depends")
-        if task != 'do_prepare_recipe_sysroot' and (task == "do_configure" or (deps and "populate_sysroot" in deps)):
+        if task not in EXCLUDED_TASKS and (task == "do_configure" or (deps and "populate_sysroot" in deps)):
             d.prependVarFlag(task, "prefuncs", "extend_recipe_sysroot ")
 }
 staging_taskhandler[eventmask] = "bb.event.RecipeTaskPreProcess"
-- 
2.43.2


