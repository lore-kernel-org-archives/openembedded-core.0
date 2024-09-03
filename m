Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31387CD3446
	for <webhook@archiver.kernel.org>; Tue,  3 Sep 2024 15:42:11 +0000 (UTC)
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
 by mx.groups.io with SMTP id smtpd.web11.26664.1725378125802477369
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Sep 2024 08:42:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Ra6vUe85;
 spf=pass (domain: gmail.com, ip: 209.85.167.182, mailfrom: jpewhacker@gmail.com)
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-3df096e70f1so3256543b6e.3
        for <openembedded-core@lists.openembedded.org>; Tue, 03 Sep 2024 08:42:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725378124; x=1725982924; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=N1WxiUco0Y4ZUqUOgBxmIgAp27rYKIcdz6J7dzKjTkg=;
        b=Ra6vUe858cItFfU4Hap7XXc+TVn1i7hyl4PO2A9ISMXY2lAehJVW5GH+teXMVRlkyF
         LuI3QrrEk7nFAiC7ymFtZ4ntK98F/JGUGxqVjHzXBaGUiwVkHq+sAikkAl1n0PRT3Dnf
         o+9PuaZDZIICeNPVqVPNXlc41G4UeInA6kQqEFJELdD4LL4uy34F7Jz0GFZalOlAYEGx
         gURQLvvGYD6fxENBGMdEkR50Nkr8OTO5k/YmSzPqnxhaoQO5ZMaK5CpNnECDs9Q3zPYu
         guRY4ioo6EZrDoWRDH90hcYSAwCDsaBXnb4vuSpK8LYFX6x3Fimr7aXPDPmRQR0pVZyx
         Bb3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725378124; x=1725982924;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N1WxiUco0Y4ZUqUOgBxmIgAp27rYKIcdz6J7dzKjTkg=;
        b=rrk2ehJE4Xj13Dk0EQIacUSSUAYDmAXlP5qofR8vtUKyKt4ZE5gH+qMkx5jgLiwc22
         +8RdPLKJgaR+TWchd33z6kaJWMLRHH/OdRr/MH7MTOnTOgyLsCb41jBfDefJ9kWFbTWF
         snvNJZVfbbl2+2n2FAcwDoAwr/irxEYKGeyNxmxr7AVSmqcSO4JqkCkeiBci8EWh3saw
         kBsG1LIc44CCdUUhR9RX4NJ4oK+lIqoDdyx0xfmpaT7pNbNxybxfByBuRZOjOSnfu10M
         ZhSC4BULm2RDhjDqM7gsGiqxq1WGSy7hShqDeaoWdr/gnyaVrrfjbFSisKVTtr2tNjDS
         qmZg==
X-Gm-Message-State: AOJu0Yxc0FOGostL4hX8hGjsxLqpt2lCvrLCIfe0ijd0raeQBuNWuQUe
	AKYvEdHWi7AHG8F80F4iPeYudeMyZkObjYTJJjBlDWCushYx8nD92ljKRw==
X-Google-Smtp-Source: AGHT+IHcsrtvlm3P24ak4EctrRjl6jIuaGz6ezNazLNF/WMrUbRrWXPPAwU2CEN/OYlwKJ5jM/rYhQ==
X-Received: by 2002:a05:6808:170e:b0:3db:3b15:7e76 with SMTP id 5614622812f47-3df1ca5c605mr10452096b6e.47.1725378124422;
        Tue, 03 Sep 2024 08:42:04 -0700 (PDT)
Received: from localhost.localdomain ([2601:282:4300:19e0::9ea])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3df11866831sm2382582b6e.37.2024.09.03.08.42.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Sep 2024 08:42:03 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH] lib/spdx30_tasks: Report all missing providers
Date: Tue,  3 Sep 2024 09:42:01 -0600
Message-ID: <20240903154201.1695413-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Sep 2024 15:42:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204171

Instead of failing on the first missing provider, collect all of them
and report them all as it is more convenient for end users trying to fix
problems

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/lib/oe/spdx30_tasks.py | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py
index 4864d6252a6..4da52da654d 100644
--- a/meta/lib/oe/spdx30_tasks.py
+++ b/meta/lib/oe/spdx30_tasks.py
@@ -953,10 +953,12 @@ def collect_build_package_inputs(d, objset, build, packages):
     providers = oe.spdx_common.collect_package_providers(d)
 
     build_deps = set()
+    missing_providers = set()
 
     for name in sorted(packages.keys()):
         if name not in providers:
-            bb.fatal("Unable to find SPDX provider for '%s'" % name)
+            missing_providers.add(name)
+            continue
 
         pkg_name, pkg_hashfn = providers[name]
 
@@ -970,6 +972,11 @@ def collect_build_package_inputs(d, objset, build, packages):
         )
         build_deps.add(pkg_spdx._id)
 
+    if missing_providers:
+        bb.fatal(
+            f"Unable to find SPDX provider(s) for: {', '.join(sorted(missing_providers))}"
+        )
+
     if build_deps:
         objset.new_scoped_relationship(
             [build],
-- 
2.46.0


