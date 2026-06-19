Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74349CD98F8
	for <webhook@archiver.kernel.org>; Fri, 19 Jun 2026 08:33:22 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.38264.1781858001041525456
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Jun 2026 01:33:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=gEXsAj33;
 spf=pass (domain: gmail.com, ip: 209.85.221.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-45ee5cdbd28so1709752f8f.1
        for <openembedded-core@lists.openembedded.org>; Fri, 19 Jun 2026 01:33:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781857999; x=1782462799; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Up8uPWXI7/y3AiT9scMJVMyoPTfiNBD9I8POiDjQxdY=;
        b=gEXsAj337tksGDD3QTJDfG5k4YwCsXanIuBUoCXoeswZm0FDJYjty7skG+KS5ENWTC
         KodcFLHB2Ld0EomtWHLfrgJaCVdOT5pJSTMKvMHb+5+O/cQkrYTWOMbdJrc3ncGywWpn
         4wdzlU2zJe63FpyUPl/pn3GiQzTYUhA5kZZuImboqCe8fZsYTqTHfgr9IsoJS7rB7b6Z
         GKiuJFV8aBXPUPdIXMvaxC4t0Z+kTI3YgWvqRbYsXb0Elir34gSV44LpN1R2xogG/ZYu
         gMrh1T75/osEV0HELkIIkfz6+jeGQTYiLQXJ1SVhXOnbDLE9fMyiVfHChu4wQryn/cpG
         gHAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781857999; x=1782462799;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Up8uPWXI7/y3AiT9scMJVMyoPTfiNBD9I8POiDjQxdY=;
        b=GCa19G3BR7Ml/JYHmfDlTQkyC59exv7R791n96MGqUXk6yaXb6+9+lII/RN9+BYvDg
         uAYo/fTV2oka8whM7R6Hf8Uk0bowKCLxuVLMoyXhLpqnCBNfIHkC/obdw+3FuzU8lilX
         dmemW45MBwGnUZkwHHyx8GH6n7BdS3PNlN3HJ3zW3/51qh5Sg4iPYwSXQnJx+1aHcQAD
         374bTgA93r3PvAlE+X2xmYDMWC59zA7SLxovv2Z0I6k8M0U89C/UY8AgXyWKmBugOhwo
         6a6w4nfKZJvm4yBOghsGd3iSedwqypIwtXIduvgJpoQfSQv4nFOe8+YigV1K5SwKfaQd
         75xQ==
X-Gm-Message-State: AOJu0YwLIAfS1KpUTgIsp2CuUGEby/CCwSKZ+20n4EbVjiZftbJnYGc8
	BMeZlQZzTUYg1ScC6liiXSKlvkOLUnXo5WiCqwMrIxcEseEC5iwc9rBynqytlQcH
X-Gm-Gg: AfdE7ckifajyLUGxJVBSqdkIGGEwB438uKSnBypJ9IbteIu05EjRs5kv8Tf7VRMYQsP
	b6ij3K8yhDmZOssBRYZ05puccS8PQhDqTe+AEpC5J/n5G1C/UUTKVaE0+wR/pNlTgVtqryeB9Cd
	/4A4e1uamIoCQJ2iFdl6JFKw81bvbhIlx6uFA7bGNKk0/bbariB/1DjIGIYjl5APvi5570ipZZA
	O5/7qAvM0/pUKRNHhgnZmRxkumvrT/we8J1qQ/EO2/921lf6p34MTGS1dWPWj7RFkn/Dfw7xhuV
	mjw6IFOn7Z3Sb8Ex4JV1mkmFlwNcroV0R2lDCAkHPAlYFvpwEFOTRSvX/3foLamgqscKv5MJWMQ
	2AKMSpggrWs9x3emBP9mHqrhHFN6uBuXsj5ABj7I7GBxF7/pa6I7zrhwUIZzd3PEUj+gKmA2UYC
	BPPsTIoKDszJr3LB4PDG3Qz4e9OszMBEY/RvhJzNZ1+lW2vVA0fVgnjh7axnQ=
X-Received: by 2002:a05:6000:5c9:b0:45d:4c30:81a6 with SMTP id ffacd0b85a97d-4651c14606emr3627159f8f.5.1781857999108;
        Fri, 19 Jun 2026 01:33:19 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4650bc429a1sm5878368f8f.30.2026.06.19.01.33.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jun 2026 01:33:18 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 14/15] vte: upgrade 0.82.2 -> 0.84.0
Date: Fri, 19 Jun 2026 10:32:56 +0200
Message-ID: <20260619083305.3505156-14-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260619083305.3505156-1-alex.kanavin@gmail.com>
References: <20260619083305.3505156-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Jun 2026 08:33:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239149

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...rt-reproducibility-for-debug-sources.patch | 48 -------------------
 .../vte/{vte_0.82.2.bb => vte_0.84.0.bb}      |  6 ++-
 2 files changed, 4 insertions(+), 50 deletions(-)
 delete mode 100644 meta/recipes-support/vte/vte/0001-support-reproducibility-for-debug-sources.patch
 rename meta/recipes-support/vte/{vte_0.82.2.bb => vte_0.84.0.bb} (90%)

diff --git a/meta/recipes-support/vte/vte/0001-support-reproducibility-for-debug-sources.patch b/meta/recipes-support/vte/vte/0001-support-reproducibility-for-debug-sources.patch
deleted file mode 100644
index 20e8f71c0e..0000000000
--- a/meta/recipes-support/vte/vte/0001-support-reproducibility-for-debug-sources.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-From 0959004adbe46f88d558d2ce61b496c662c196f5 Mon Sep 17 00:00:00 2001
-From: Hongxu Jia <hongxu.jia@windriver.com>
-Date: Mon, 3 Nov 2025 06:13:11 +0000
-Subject: [PATCH] support reproducibility for debug sources
-
-While option --debug-sources is used, the generated source file contains
-build path comments which caused the build is not reproducible [1]
-...subprojects/simdutf/simdutf.h...
- 1 /* auto-generated on 2025-03-17 16:13:41 -0400. Do not edit! */
- 2 /* begin file include/simdutf.h */
- 3 // /build-dir/vte-0.82.1/subprojects/simdutf/include/simdutf.h:1
- 4 #ifndef SIMDUTF_H
-...subprojects/simdutf/simdutf.h...
-
-After apply this commit, use relative path to instead
-...subprojects/simdutf/simdutf.h...
- 1 /* auto-generated on 2025-03-17 16:13:41 -0400. Do not edit! */
- 2 /* begin file include/simdutf.h */
- 3 // include/simdutf.h:1
- 4 #ifndef SIMDUTF_H
-...subprojects/simdutf/simdutf.h...
-
-[1] https://reproducible-builds.org/
-
-Upstream-Status: Submitted [https://github.com/simdutf/simdutf/pull/848]
-
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
----
- singleheader/amalgamate.py | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/singleheader/amalgamate.py b/singleheader/amalgamate.py
-index 190b2f6..75e0d78 100755
---- a/singleheader/amalgamate.py
-+++ b/singleheader/amalgamate.py
-@@ -385,7 +385,8 @@ def filter_features(file):
-                 current_features = None
-             elif enabled:
-                 if context.args.debug_sources and not prev_line.endswith('\\'):
--                    yield f"// {file}:{lineno}"
-+                    RELFILE = os.path.relpath(file, PROJECTPATH)
-+                    yield f"// {RELFILE}:{lineno}"
- 
-                 if line or (not line and prev_line):
-                     yield line
--- 
-2.48.1
-
diff --git a/meta/recipes-support/vte/vte_0.82.2.bb b/meta/recipes-support/vte/vte_0.84.0.bb
similarity index 90%
rename from meta/recipes-support/vte/vte_0.82.2.bb
rename to meta/recipes-support/vte/vte_0.84.0.bb
index d5dced4ce6..70cc6b3c99 100644
--- a/meta/recipes-support/vte/vte_0.82.2.bb
+++ b/meta/recipes-support/vte/vte_0.84.0.bb
@@ -18,10 +18,12 @@ GIDOCGEN_MESON_OPTION = "docs"
 inherit gnomebase gi-docgen features_check upstream-version-is-even gobject-introspection systemd vala
 
 SRC_URI += "file://0001-Add-W_EXITCODE-macro-for-non-glibc-systems.patch \
-            file://0001-support-reproducibility-for-debug-sources.patch;patchdir=./subprojects/simdutf \
 "
 
-SRC_URI[archive.sha256sum] = "e1295aafc4682b3b550f1235dc2679baa0f71570d8ed543c001c1283d530be91"
+SRC_URI[archive.sha256sum] = "0414e31583836aeb7878da25f67c515f7e8879917ecc37c92e26b83e8d8fc3e3"
+# remove the below line when updating to vte 0.84.1 (or higher) as it includes
+# https://gitlab.gnome.org/GNOME/vte/-/commit/77fe661760d2afac1e4d5a4b7eba477cbed6b430
+EXTRA_OEMESON += "-Dsimdutf:base64=true"
 
 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 
-- 
2.47.3


