Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 620A0C79F9F
	for <webhook@archiver.kernel.org>; Sat,  5 Sep 2026 20:45:36 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2601.1788641132889087385
 for <openembedded-core@lists.openembedded.org>;
 Sat, 05 Sep 2026 13:45:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=qNQEKKwX;
 spf=pass (domain: smile.fr, ip: 209.85.221.41, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-47ddf7b09e5so2354021f8f.1
        for <openembedded-core@lists.openembedded.org>; Sat, 05 Sep 2026 13:45:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1788641131; x=1789245931; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0lbuPJlbwk0W+pIPWoMp2eIz4AMkovX9g4eeqwyPWBo=;
        b=qNQEKKwXGCIB2Jb/E86Ap5dtiZW/ng7eexb2O9dqZLxnmXaQP7jntzUGB8KdhLoScK
         i8uL+EgLYXhrT9szb+UiPcrIJI2I6UGtuP4FUiPRC9GtQYdQlude5t5Rb0YOFeTYUhg8
         wcnDrTfEIetet6w+6MOaF6cHVWOzjW82SZIec=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788641131; x=1789245931;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0lbuPJlbwk0W+pIPWoMp2eIz4AMkovX9g4eeqwyPWBo=;
        b=dCTCT+FIYrPaFpToklv+2blf6fHt0I5xckwHplrVNadkcGlUg59AQLywWf1v83hQ70
         1r7gs5+OPQDvpQb8kFWNna7hM8FEJXPdXiMTu8qjT94KEauseZ5NNf8Mjx9jI1Qje+TQ
         2OC+w8o3JTsdGyNb69ynw9u7vZqpDXqI5mLpd0gOPKRs5/yOk8nAAEnHUhhK1H818h9X
         20HNDn2soF9HyJC7hr/S3NpAfLa7loLLWT/3dQKxgzzRiX5U319SdfZaNV9lK8GFt0rN
         8+YUSOSfZN3Nmcxt5WBlvIyr8NOXYohAzxXDCAlLtQVKyytGW7Y9OWDe3dPtdbWZ++tK
         p9Xg==
X-Gm-Message-State: AFuF++mSSL63aD83J+8+kOa8TSRFGx22aBlPHWvaHPzTXtsFwfKbHmUp
	VYGH1RLx1CBSw+t1X+AjNgOHrlnE2ydp/vI1IDfOowkR9gPXTwGOymuGUUWfXAP3A6cJZP5czA+
	QkonoQro=
X-Gm-Gg: AYBFou27z+3XYltkt8EcbpWDjr+dSLJ64eBdV5XG4fyYGR1IApPhtuhhdroPpSt+JsB
	bmSFG84Tgb3ZB3yQECSx7go3Z1bsak//l+bHTzW6g6//jKhhX7W7Y3zosKG5zcU53e6qi9UCVnp
	vN3NhtYIe8ZK08RHugzwVkk67aUt6d1MpJKJB29VBnU20wFcckfXU5BPO0L/PhFVlDdqF4B+Qj+
	yzR49IBAAZYxHgMynCF5pTD8mQk4EnEFjqS2x6451MG/bUIOtDYJKCdJFO1lj75EB3790d/A6QC
	NeAavGbFnfBJ4iXpUfpFcpdLQ+5QeZGHYcp3DQcB2js4E3qTQ1c8uKrB9f99FV5EYtAzdDbhgw8
	XrXdGcsJYXiGmhi/XrOX0DZx385dVnFAD3m+H7zvs3S6u5qklolyQIxmNcFf5cWdx23R0bcYUmn
	C65Ta4VUuO8QBHQqriNzAFtJ6xo3qiZbMoAe8nFiae6/UPJ50+oDYE+xyzAp13HdnclanfDnoac
	MCvnSthkf5KApEy52yuir//lCLiO5MnCADCOqBIjRK58TpUzPrDXvMMiZAMvbxQow==
X-Received: by 2002:a05:6000:2c11:b0:485:8c16:a340 with SMTP id ffacd0b85a97d-4858c16a82bmr11739028f8f.53.1788641131083;
        Sat, 05 Sep 2026 13:45:31 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa0048511f7ccf23d3ce.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:4851:1f7c:cf23:d3ce])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485885bfdf6sm17069098f8f.34.2026.09.05.13.45.30
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 13:45:30 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 36/40] python3-cryptography: backport stray file install fix
Date: Sat,  5 Sep 2026 22:44:37 +0200
Message-ID: <c79b8bbed2eb62860d9c22b8dd16d8df9b88630e.1788629392.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1788629392.git.yoann.congal@smile.fr>
References: <cover.1788629392.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 05 Sep 2026 20:45:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245188

From: Deepak Rathore <deeratho@cisco.com>

Maturin 1.12 changed the handling of include entries from
pyproject.toml. With the current cryptography metadata, files like
CHANGELOG.rst, CONTRIBUTING.rst, docs and tests can be installed under
site-packages instead of being kept only in the source archive.

That can cause image install conflicts when packages such as
python3-pyrad and python3-pyexpect are installed with
python3-cryptography, because those packages also install top-level docs
or tests directories under site-packages.

Backport the upstream cryptography fix which marks these entries as
sdist-only. The files remain available from the source tree, so the
existing ptest install path which copies tests from ${S} is not changed.

Signed-off-by: Deepak Rathore <deeratho@cisco.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../python/python3-cryptography.bb            |  1 +
 ...lling-stray-files-into-site-packages.patch | 55 +++++++++++++++++++
 2 files changed, 56 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-cryptography/0002-Fix-installing-stray-files-into-site-packages.patch

diff --git a/meta/recipes-devtools/python/python3-cryptography.bb b/meta/recipes-devtools/python/python3-cryptography.bb
index 7f9bde15d03..c6561deb3c4 100644
--- a/meta/recipes-devtools/python/python3-cryptography.bb
+++ b/meta/recipes-devtools/python/python3-cryptography.bb
@@ -14,6 +14,7 @@ require python3-cryptography-common.inc
 SRC_URI[sha256sum] = "e4cfd68c5f3e0bfdad0d38e023239b96a2fe84146481852dffbcca442c245aa5"
 
 SRC_URI += "file://0001-pyproject.toml-remove-benchmark-disable-option.patch \
+            file://0002-Fix-installing-stray-files-into-site-packages.patch \
             file://check-memfree.py \
             file://run-ptest \
            "
diff --git a/meta/recipes-devtools/python/python3-cryptography/0002-Fix-installing-stray-files-into-site-packages.patch b/meta/recipes-devtools/python/python3-cryptography/0002-Fix-installing-stray-files-into-site-packages.patch
new file mode 100644
index 00000000000..a04861f1868
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-cryptography/0002-Fix-installing-stray-files-into-site-packages.patch
@@ -0,0 +1,55 @@
+From af53f00da0538e7d64625eea9f4ec850a2b7dd2e Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Micha=C5=82=20G=C3=B3rny?= <mgorny@gentoo.org>
+Date: Sun, 15 Feb 2026 18:01:37 +0100
+Subject: [PATCH] Fix installing stray files into site-packages (#14319)
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Fix the `include` pattern in `pyproject.toml` not to install stray files
+such as `CHANGELOG.rst`, `CONTRIBUTING.rst`, `docs` and `tests` straight
+into site-packages.  Apparently Maturin did not install them before due
+to a bug, but it was fixed in maturin 1.12.0, leading to the files being
+suddenly installed.
+
+Originally reported as https://bugs.gentoo.org/970090.
+
+Upstream-Status: Backport [https://github.com/pyca/cryptography/commit/43eb178ee3aae8d0060221118437b03c23570a41]
+
+Signed-off-by: Michał Górny <mgorny@gentoo.org>
+(cherry picked from commit 43eb178ee3aae8d0060221118437b03c23570a41)
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
+---
+ pyproject.toml | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/pyproject.toml b/pyproject.toml
+index 75bfcbb94..8ee43d17a 100644
+--- a/pyproject.toml
++++ b/pyproject.toml
+@@ -106,10 +106,10 @@ module-name = "cryptography.hazmat.bindings._rust"
+ locked = true
+ sdist-generator = "git"
+ include = [
+-    "CHANGELOG.rst",
+-    "CONTRIBUTING.rst",
++    { path = "CHANGELOG.rst", format = "sdist" },
++    { path = "CONTRIBUTING.rst", format = "sdist" },
+ 
+-    "docs/**/*",
++    { path = "docs/**/*", format = "sdist" },
+ 
+     { path = "src/_cffi_src/**/*.py", format = "sdist" },
+     { path = "src/_cffi_src/**/*.c", format = "sdist" },
+@@ -121,7 +121,7 @@ include = [
+     { path = "src/rust/**/Cargo.lock", format = "sdist" },
+     { path = "src/rust/**/*.rs", format = "sdist" },
+ 
+-    "tests/**/*.py",
++    { path = "tests/**/*.py", format = "sdist" },
+ ]
+ exclude = [
+     "vectors/**/*",
+-- 
+2.35.6
+

