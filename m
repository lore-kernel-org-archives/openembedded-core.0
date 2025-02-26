Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 177AFC021B8
	for <webhook@archiver.kernel.org>; Wed, 26 Feb 2025 17:40:13 +0000 (UTC)
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
 by mx.groups.io with SMTP id smtpd.web11.11917.1740591602962132683
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Feb 2025 09:40:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=LJW85X3q;
 spf=pass (domain: baylibre.com, ip: 209.85.222.170, mailfrom: tgamblin@baylibre.com)
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-7c0818add57so3324785a.3
        for <openembedded-core@lists.openembedded.org>; Wed, 26 Feb 2025 09:40:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1740591601; x=1741196401; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qTbLEVMPodDMPWzpbzNIU6znYTLW3eJ0HAIrBNdIQoo=;
        b=LJW85X3qTDkfNH8drGLLeV3tpirkzayAXJzpqmphhk3MqeLnW8/EWG7JkS10kcp4qo
         KDWbm2ExKv4bdxAc/BSM+Xhp2aRCuhgCnrDGFNheSVvNX4fV/mYSQsWbDkGk5dhjA992
         dwcOriwKVi2sRPelpLiFBaZZ71z2Dmc4nqskShliu73rGgqOpISAAtQ34koLVDNI7RlL
         BIVUCpVVE1RI5QdY+PpQKSJDHq4QEsuliq9d36gs5Gcjo4m89n4tcrXi+601MTuL+OZL
         3nEWVBv8haxoLLS4LlrGO1iMYJvYjChDtdu/0iKzLHFQ+ig6WIxembEwTMDkASQQH6ou
         hfHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740591601; x=1741196401;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qTbLEVMPodDMPWzpbzNIU6znYTLW3eJ0HAIrBNdIQoo=;
        b=WW8W2R9M1TDMElTOGVPiw+CQBRxaX2RicAVCLLhCzk0segcCaqhuDeA4hV6qlg0Jfj
         t/2cEpFxpwtMq0/2O5arXAiogU7+Pth1LCGJ7rr+w9NN40SV3WPNgXCikLr5fLuhUVIR
         UpLc/7uOAHpjRxD1s/Z5fWSpEkQXxIvv+K2FMBtuOJHRKKUwdJcswA9PKY6jPX4ME6yW
         WAe7zMf8MqRhh7wqslPDEUm3THBhe7OoZNxHkEQlVfdDXfBAuO1V1ln9SvZRwbaAiiIi
         zIR4/Qag5aP7ntDIS+zLCFBblY3knsfb80TyPVHAJW4Qx0zYrDL7SKn4g3DzJoLl1+9C
         F7dQ==
X-Gm-Message-State: AOJu0YzFMn5SuRp5XsmUi6RizS7rMGMvwLsyVBpwTw5nMTrfbPmhfK+e
	9antq2MlduOfHBE7GZsICBIumknN7M7gCoFRnZKS4gozYx3v0VbT/UhhckZS6hz/G8WvrPO5cN2
	+
X-Gm-Gg: ASbGncuwm21a9Cqr4D6H6XUbJveZVV0DRvtloZtQlO6BRcfc2c8tN594MLIRO05ZF3g
	GaH2mJH3stRrQmwbdX0GAZrZ1nCYnAlubNQTMVDLkigIwXnqN/6AZepfKBYvnbNTyZH7eSu4Hte
	jyk6naJiwSFVRcLphPDF5aqyh3iD+g1gKr0aNOUomRKBZ80SJy2m5fYqyUn93vJ1TNkUIPdaufO
	J7UR7bpqaJtZj5lrbdsF1Zi67fZor9OAx59wWwumfQ3Y+LxcfumCGcFHazimOkbG/OPrl0Fc9zP
	KRRPD6yqZ9dVOi7YnHYj12qNfJORmTMPRoxLfH+IXW55lOMrxhrm2zGrW1XcBg==
X-Google-Smtp-Source: AGHT+IH0j30YkTW9lcyIEQN+/Sm0DUeu6mW90RrTb0zCs8uv88upmYtiH+ER2gzs7wQaWfF1eVSaig==
X-Received: by 2002:a05:620a:244c:b0:7c2:284b:4c58 with SMTP id af79cd13be357-7c2284b4c82mr2427041585a.47.1740591601375;
        Wed, 26 Feb 2025 09:40:01 -0800 (PST)
Received: from localhost (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c23c2c0e3esm273223485a.52.2025.02.26.09.40.00
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2025 09:40:00 -0800 (PST)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 4/4] python3-setuptools-scm: upgrade 8.1.0 -> 8.2.0
Date: Wed, 26 Feb 2025 12:39:52 -0500
Message-Id: <20250226173952.2337140-4-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250226173952.2337140-1-tgamblin@baylibre.com>
References: <20250226173952.2337140-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Feb 2025 17:40:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211968

Patch '0001-respect-GIT_CEILING_DIRECTORIES.patch' is no longer required
as it's upstream in 979d79301da6.

Changelog (https://github.com/pypa/setuptools-scm/blob/main/CHANGELOG.md):

Added
    - fix #960: add a --force-write-version-files flag for the cli

Changed
    - fix #950: ensure to pass encodings to io usage
    - fix #957: add subprocess timeout control env var
    - add sp-repo-review pre-commit hook

Fixed
    - fix #1018: allow non-normalized versions for semver
    - fix #1103: respect GIT_CEILING_DIRECTORIES when trying to find git toplevels
    - fix #1081: add name normalized pipx entrypoint
    - fix #1080: clean pdm from PYTHONPATH to protect mercurial

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 ...0001-respect-GIT_CEILING_DIRECTORIES.patch | 36 -------------------
 ...1.0.bb => python3-setuptools-scm_8.2.0.bb} |  3 +-
 2 files changed, 1 insertion(+), 38 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3-setuptools-scm/0001-respect-GIT_CEILING_DIRECTORIES.patch
 rename meta/recipes-devtools/python/{python3-setuptools-scm_8.1.0.bb => python3-setuptools-scm_8.2.0.bb} (84%)

diff --git a/meta/recipes-devtools/python/python3-setuptools-scm/0001-respect-GIT_CEILING_DIRECTORIES.patch b/meta/recipes-devtools/python/python3-setuptools-scm/0001-respect-GIT_CEILING_DIRECTORIES.patch
deleted file mode 100644
index 7d2808cc0ce..00000000000
--- a/meta/recipes-devtools/python/python3-setuptools-scm/0001-respect-GIT_CEILING_DIRECTORIES.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From a1cc419a118560d63e1ab8838c256a3622185750 Mon Sep 17 00:00:00 2001
-From: Etienne Cordonnier <ecordonnier@snap.com>
-Date: Thu, 13 Feb 2025 15:44:40 +0100
-Subject: [PATCH] respect GIT_CEILING_DIRECTORIES
-
-Fix for https://github.com/pypa/setuptools-scm/issues/1103
-
-When searching for the root-directory of the git repository e.g. with git rev-parse --show-toplevel,
-git stops the search when reaching $GIT_CEILING_DIRECTORIES. By ignoring this variable, the function
-_git_toplevel can go above the real git repository (e.g. when packaging a tarball without .git repository),
-and then runs "git archive" on an unrelated git repository.
-
-Upstream-Status: Pending
-
-Signed-off-by: Ross Burton <ross.burton@arm.com>
-Signed-off-by: Etienne Cordonnier <ecordonnier@snap.com>
----
- src/setuptools_scm/_run_cmd.py | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/setuptools_scm/_run_cmd.py b/src/setuptools_scm/_run_cmd.py
-index f2a8285..7e13d9f 100644
---- a/src/setuptools_scm/_run_cmd.py
-+++ b/src/setuptools_scm/_run_cmd.py
-@@ -98,7 +98,7 @@ def no_git_env(env: Mapping[str, str]) -> dict[str, str]:
-         k: v
-         for k, v in env.items()
-         if not k.startswith("GIT_")
--        or k in ("GIT_EXEC_PATH", "GIT_SSH", "GIT_SSH_COMMAND")
-+        or k in ("GIT_CEILING_DIRECTORIES", "GIT_EXEC_PATH", "GIT_SSH", "GIT_SSH_COMMAND")
-     }
- 
- 
--- 
-2.43.0
-
diff --git a/meta/recipes-devtools/python/python3-setuptools-scm_8.1.0.bb b/meta/recipes-devtools/python/python3-setuptools-scm_8.2.0.bb
similarity index 84%
rename from meta/recipes-devtools/python/python3-setuptools-scm_8.1.0.bb
rename to meta/recipes-devtools/python/python3-setuptools-scm_8.2.0.bb
index 14913ff958e..ecb79afe47b 100644
--- a/meta/recipes-devtools/python/python3-setuptools-scm_8.1.0.bb
+++ b/meta/recipes-devtools/python/python3-setuptools-scm_8.2.0.bb
@@ -6,8 +6,7 @@ argument or in a SCM managed file."
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=838c366f69b72c5df05c96dff79b35f2"
 
-SRC_URI += "file://0001-respect-GIT_CEILING_DIRECTORIES.patch"
-SRC_URI[sha256sum] = "42dea1b65771cba93b7a515d65a65d8246e560768a66b9106a592c8e7f26c8a7"
+SRC_URI[sha256sum] = "a18396a1bc0219c974d1a74612b11f9dce0d5bd8b1dc55c65f6ac7fd609e8c28"
 
 PYPI_PACKAGE = "setuptools_scm"
 UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
-- 
2.39.5


