Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86DA6CD98EF
	for <webhook@archiver.kernel.org>; Tue, 16 Jun 2026 19:16:59 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5789.1781637410336858472
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Jun 2026 12:16:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=RRRIvhfx;
 spf=pass (domain: gmail.com, ip: 209.85.128.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-490bb83a3f6so38969535e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 16 Jun 2026 12:16:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781637408; x=1782242208; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HzUd6Gig4GAaA/PeLi6dBGZUxxQ/iAPdAEe6i2SHR78=;
        b=RRRIvhfxc2xL0gzM07Y+Rtx180iuC42THcX3FEU/+izkRRbiH+aMbNnZNyZ4auBM/N
         wuOz5mtCnagcef5tNM+dwiHmzdLWja0mEk9d+hi+CsEsGtE5yyUHBitk5D4xK4JzzukI
         SeQn7fGYD67kZiBAvjRgm2G4DP1dBzdPSJwT25M9sYgvt54fC8wj0qTFo6s3DrKHQ8+T
         pw7qV0yIJcj9lsPnLVvU/c1KzZcw0kJuNUxig65tVYDbRdWlkVy48EvywK917KUv3ijb
         5RHKiKIYuHenEJZlOZ1HYBy3PgZh5fN79cxEZBCJj2pzEOtLZOfBTvE8bG+nqH3dW6Ya
         EQIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781637408; x=1782242208;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HzUd6Gig4GAaA/PeLi6dBGZUxxQ/iAPdAEe6i2SHR78=;
        b=FthVdAkPe6PqZb+zXdG67dxHyebjTiKsdU7i56rcQaIZEM2JP8nRcX9A9AvvukeNZq
         vtgYoAVyCxCkM09uJJSbSV7WpLRcd2M0Yiretx54dqnAfOVAwc42DOyhR24EijvTuSBa
         DsdOQ2B75Aju0M+9yLfvQC1NlzIMZAlC0a8lxdtD42+b5jB625yLZMZHbir5Ss4fEiJW
         9QJAYSkFuNKCVtXDlFmKxNSaOeQEOm+ZVEaLfivvjg89sOoiwKOmKvPDaUvRejCzNNoJ
         c/BKlIxO7zGrLVg0WCwZ+cM5Ylw3TLDTuBF+T5ndK0fzzuPTrLiHwZIj7cmEM9YOBKWr
         FXpw==
X-Gm-Message-State: AOJu0YzG6TSlUPTvWx+zHA2g3U9tnl61jLBlQvXPfuYvswNVIZcO2KTF
	TusH+cHO4W6J1xf1E1qtwQV6KrOdHXXXOehy7OTKNyzpfcEzX94WGh3GI1Ey3Ktm
X-Gm-Gg: Acq92OGmtdFDBhSt/U0JklPtT61dFcpKkPBeEvq72jO17F6ocd6k6EmaJOJzrtz/4j1
	UQXkquWwGXevQP3NSxuQG/D5UXJePCwZgqXQEX93JBZEqcgTDZw7Ge17MZxtv/FIa1mptzy+ebd
	SZ7J4VNvi4rKmFVHAvob5Y4jXY9RsRKTynzkbedx417lR10eUUhbUFYWmqGb2atjhSzLDAXJBuZ
	aqQsQYAv8PsBXCJfD1K3R4nP15o2K6Gc/sLusrX/ZdAovmVSmphHljp/Sl6UNMERZOqgUn9vMCv
	13VB4Z7iN6K3OiAHASuTPjAa2IkILXor4AGK65jzJ81Xhd5YKP24G9tQQgrsp5CMVwvAUhfUJKz
	/T60jzw35VbV3l03EuRxV4msgKX8byxG4EtniPXSD5HCzY2ucWJiJOZ1d0PJa9tek35gwWvsGoa
	NEwLh4W8YDip8j779ztdhTV1tkbvX4/7oDwNgP6izGdNQYWNArLVC+/u3OfOQ=
X-Received: by 2002:a05:600c:19cf:b0:490:e913:6562 with SMTP id 5b1f17b1804b1-492333a5372mr13393965e9.2.1781637408496;
        Tue, 16 Jun 2026 12:16:48 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49230a4f8d7sm86982035e9.5.2026.06.16.12.16.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 12:16:48 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 16/30] python3-shacl2code: upgrade 1.0.1 -> 1.1.0
Date: Tue, 16 Jun 2026 21:16:12 +0200
Message-ID: <20260616191628.2014553-16-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260616191628.2014553-1-alex.kanavin@gmail.com>
References: <20260616191628.2014553-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Jun 2026 19:16:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238941

From: Alexander Kanavin <alex@linutronix.de>

Add a patch to python3-spdx-python-model to support this release.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...e_1.0.1.bb => python3-shacl2code_1.1.0.bb} |  2 +-
 ...pdate-shacl2code-to-1.1.0-and-add-ke.patch | 41 +++++++++++++++++++
 .../python/python3-spdx-python-model_0.0.5.bb | 10 ++---
 3 files changed, 47 insertions(+), 6 deletions(-)
 rename meta/recipes-devtools/python/{python3-shacl2code_1.0.1.bb => python3-shacl2code_1.1.0.bb} (81%)
 create mode 100644 meta/recipes-devtools/python/python3-spdx-python-model/0001-pyproject.toml-Update-shacl2code-to-1.1.0-and-add-ke.patch

diff --git a/meta/recipes-devtools/python/python3-shacl2code_1.0.1.bb b/meta/recipes-devtools/python/python3-shacl2code_1.1.0.bb
similarity index 81%
rename from meta/recipes-devtools/python/python3-shacl2code_1.0.1.bb
rename to meta/recipes-devtools/python/python3-shacl2code_1.1.0.bb
index 904940926f..a9c8bec84f 100644
--- a/meta/recipes-devtools/python/python3-shacl2code_1.0.1.bb
+++ b/meta/recipes-devtools/python/python3-shacl2code_1.1.0.bb
@@ -5,7 +5,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=0582f358628f299f29c23bf5fb2f73c9"
 
 PYPI_PACKAGE = "shacl2code"
-SRC_URI[sha256sum] = "c856822b40c330452b8b31e94a658ad4595a5ef03cdb75ea432ea9c73d0cf7d9"
+SRC_URI[sha256sum] = "0f3a243c6482a0f95c5a793288d304908506b51b82dc6133de22be477cd75c24"
 
 inherit pypi python_hatchling
 
diff --git a/meta/recipes-devtools/python/python3-spdx-python-model/0001-pyproject.toml-Update-shacl2code-to-1.1.0-and-add-ke.patch b/meta/recipes-devtools/python/python3-spdx-python-model/0001-pyproject.toml-Update-shacl2code-to-1.1.0-and-add-ke.patch
new file mode 100644
index 0000000000..d9dc0a03c8
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-spdx-python-model/0001-pyproject.toml-Update-shacl2code-to-1.1.0-and-add-ke.patch
@@ -0,0 +1,41 @@
+From b623473f634aebeb30028cc746fb7a3da4fb2ce3 Mon Sep 17 00:00:00 2001
+From: Arthit Suriyawongkul <arthit@gmail.com>
+Date: Sat, 6 Jun 2026 02:44:48 +0100
+Subject: [PATCH] pyproject.toml: Update shacl2code to 1.1.0 and add keywords
+ (#35)
+
+Signed-off-by: Arthit Suriyawongkul <arthit@gmail.com>
+Upstream-Status: Backport [https://github.com/spdx/spdx-python-model/commit/2d7b71a7c8e6270a1c8795cdeb4f3dcd9393b3a9]
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+---
+ pyproject.toml | 10 +++++++++-
+ 1 file changed, 9 insertions(+), 1 deletion(-)
+
+diff --git a/pyproject.toml b/pyproject.toml
+index c8b3e56..df011e8 100644
+--- a/pyproject.toml
++++ b/pyproject.toml
+@@ -8,6 +8,14 @@ authors = [
+     {name = "Joshua Watt", email = "JPEWhacker@gmail.com"},
+ ]
+ readme = "README.md"
++keywords = [
++    "spdx",
++    "sbom",
++    "spdx3",
++    "software-bill-of-materials",
++    "shacl2code",
++    "bindings",
++]
+ classifiers = [
+     "Development Status :: 4 - Beta",
+     "Intended Audience :: Developers",
+@@ -36,7 +44,7 @@ Issues = "https://github.com/spdx/spdx-python-model/issues"
+ requires = [
+     "hatchling >= 1.27.0",
+     "hatch-build-scripts >= 0.0.4",
+-    "shacl2code == 1.0.1",
++    "shacl2code == 1.1.0",
+ ]
+ build-backend = "hatchling.build"
+ 
diff --git a/meta/recipes-devtools/python/python3-spdx-python-model_0.0.5.bb b/meta/recipes-devtools/python/python3-spdx-python-model_0.0.5.bb
index c77bdffada..19d9bb815b 100644
--- a/meta/recipes-devtools/python/python3-spdx-python-model_0.0.5.bb
+++ b/meta/recipes-devtools/python/python3-spdx-python-model_0.0.5.bb
@@ -7,11 +7,11 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 PYPI_PACKAGE = "spdx_python_model"
 SRC_URI[sha256sum] = "4bcf7c6e5e2e8f0b787ed4eb8fb519e2ed776e820cb6d9eb93e44e98eb92ca2d"
 
-SRC_URI += " \
-    https://spdx.org/rdf/3.0.1/spdx-context.jsonld;name=spdx1 \
-    https://spdx.org/rdf/3.0.1/spdx-json-serialize-annotations.ttl;name=spdx2 \
-    https://spdx.org/rdf/3.0.1/spdx-model.ttl;name=spdx3 \
-"
+SRC_URI += "https://spdx.org/rdf/3.0.1/spdx-context.jsonld;name=spdx1 \
+           https://spdx.org/rdf/3.0.1/spdx-json-serialize-annotations.ttl;name=spdx2 \
+           https://spdx.org/rdf/3.0.1/spdx-model.ttl;name=spdx3 \
+           file://0001-pyproject.toml-Update-shacl2code-to-1.1.0-and-add-ke.patch \
+           "
 
 SRC_URI[spdx1.sha256sum] = "c72b0928f094c83e5c127784edb1ebca2af74a104fcacc007c332b23cbc788bd"
 SRC_URI[spdx2.sha256sum] = "c6a54b51230eb2bf3b31302546af201f303e0b7931c1db404d7f5b72b6f863e6"
-- 
2.47.3


