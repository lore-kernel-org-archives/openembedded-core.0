Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47A9AC3DA64
	for <webhook@archiver.kernel.org>; Sun,  4 Aug 2024 17:10:02 +0000 (UTC)
Received: from mail-il1-f172.google.com (mail-il1-f172.google.com [209.85.166.172])
 by mx.groups.io with SMTP id smtpd.web11.30107.1722791392186569072
 for <openembedded-core@lists.openembedded.org>;
 Sun, 04 Aug 2024 10:09:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=Y0l1SajM;
 spf=softfail (domain: sakoman.com, ip: 209.85.166.172, mailfrom: steve@sakoman.com)
Received: by mail-il1-f172.google.com with SMTP id e9e14a558f8ab-39b3a4d2577so2616525ab.3
        for <openembedded-core@lists.openembedded.org>; Sun, 04 Aug 2024 10:09:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1722791391; x=1723396191; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+ahvXqy0HNoH15xtbQANgs4iLdUYMcGyqYTHI4AvRVQ=;
        b=Y0l1SajMM4KukBeTeDAWfJqKDxf+bTBLsOZwDjbqFGuVMhUlZgwJYkWJP+uCO3hbRT
         OpgCFu6R7S2GzQi7tpQgWQuUYoK1gei7mXO3db9Ic8BXQQCDebKckxgW4HARjWLaHoSm
         suQsGCjv837Tzhz92K+eYeLYyarRUIL6YCCUVKA8LAUbmgPfVY+YJvM1lHotv5ZVLHRq
         kwvwQh+CZL/WCtFvLdW4GrBYY96ZKw3Yfyq2Ns5xqioc10kSFmskDkg8PJSnzCy87KOQ
         nAG6xlifTCw+Ukfyts3kU1gbIETL5FJZV21gW8gCYp4GLTs3aVNXnEaCOgvFCFPFCuWG
         QkNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722791391; x=1723396191;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+ahvXqy0HNoH15xtbQANgs4iLdUYMcGyqYTHI4AvRVQ=;
        b=YMIRbk5a0soUEmS1q28YLodZDObviyBCQmTzMb89bF9MCeZ5k1r8zzYhK7AkZYde8b
         VJSJz31lFKu6L8EqJyXCZCjxlcRHylihQv7QbTPUAwAF42Ksiqac6ltNmuBQLZgY3qiM
         Xp03WysGmX1+gnyQBNnV8LaZrJhgVE0DyAyvjg43YrQ7C+x6pmfbfSyAT8POh0ocd3P6
         zGGcJFSQR1Y0L/hNVoXdTPYBX2FmNLtW/pgbDteyvhO/O8Ed7FEWtV8tSD0sSTGLFLxt
         3V55g7GyoAG1KPtm8qd5o80mx0kju5vCpNCAsMFMfu7ev96drKdzwPchSExyaA8TTS5U
         nW7A==
X-Gm-Message-State: AOJu0Yy7CP3w07ndZrAl2VgKly4Hyb6HL7gbwnRLZR2Q7iV+yxdzUc3u
	vEdlVH8mO4aH4IDUeqF57MT3auy6fXJpAmLot6cLSKnHm44daDBxaBs8Y01ULQHuPCJ+UFsWykT
	wb058fQ==
X-Google-Smtp-Source: AGHT+IEStN4cbpS+kt71rp5ZcMvegx80gh9759kW0ZTwn1WmWiKRPcuyrjkLAO7DVItOwkyuwbUvzQ==
X-Received: by 2002:a92:d5cb:0:b0:39a:ea86:d615 with SMTP id e9e14a558f8ab-39b1fb6ab14mr111870365ab.6.1722791391191;
        Sun, 04 Aug 2024 10:09:51 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7106ec269d2sm4293225b3a.17.2024.08.04.10.09.50
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Aug 2024 10:09:50 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 18/18] rust: Add new varaible RUST_ENABLE_EXTRA_TOOLS
Date: Sun,  4 Aug 2024 10:09:21 -0700
Message-Id: <136a25567499191b23a4d000a06bf83a473224ca.1722790925.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1722790925.git.steve@sakoman.com>
References: <cover.1722790925.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 04 Aug 2024 17:10:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202977

From: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>

There is a need to enable some extra tools from the rust for the build
and so this new variable will help for that

This varaible then we can use during do_configure task to add overall
values as per json format in build -> tools

Signed-off-by: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/rust/rust_1.75.0.bb | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/rust/rust_1.75.0.bb b/meta/recipes-devtools/rust/rust_1.75.0.bb
index 76e1fe2d84..c33f31d261 100644
--- a/meta/recipes-devtools/rust/rust_1.75.0.bb
+++ b/meta/recipes-devtools/rust/rust_1.75.0.bb
@@ -70,6 +70,10 @@ addtask do_test_compile after do_configure do_rust_gen_targets
 do_rust_setup_snapshot[dirs] += "${WORKDIR}/rust-snapshot"
 do_rust_setup_snapshot[vardepsexclude] += "UNINATIVE_LOADER"
 
+# there is a need to enable some more rust tools for the project
+# We can extend a list of more tools via this variable
+RUST_ENABLE_EXTRA_TOOLS ?= "rust-demangler"
+
 python do_configure() {
     import json
     import configparser
@@ -141,7 +145,7 @@ python do_configure() {
     config.add_section("build")
     config.set("build", "submodules", e(False))
     config.set("build", "docs", e(False))
-    config.set("build", "tools", ["rust-demangler",])
+    config.set("build", "tools", e(d.getVar("RUST_ENABLE_EXTRA_TOOLS").split()))
 
     rustc = d.expand("${WORKDIR}/rust-snapshot/bin/rustc")
     config.set("build", "rustc", e(rustc))
-- 
2.34.1


