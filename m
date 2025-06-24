Return-Path: <tim.orling@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDEE2C7EE33
	for <webhook@archiver.kernel.org>; Tue, 24 Jun 2025 23:14:15 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web10.2783.1750806852346999278
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Jun 2025 16:14:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=nOGzWs51;
 spf=pass (domain: konsulko.com, ip: 209.85.216.54, mailfrom: tim.orling@konsulko.com)
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-31393526d0dso863864a91.0
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Jun 2025 16:14:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1750806851; x=1751411651; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2avNAjgpZjcbReZUwdq7QbEEbuP37OoZf7pBOX3m5Mk=;
        b=nOGzWs51Cp0F5eWgaCAOQRX51GezMgr3Z4CF7Od5b+QltTqMc0wKBSp54Nf4ayJaMp
         qMLZfY5bCo+kWU7TfD0HWKd0sBxi01J9O5GaFfclZvDJG6HSqhIRIw7gLSCXrMoSy88q
         59VuoOKvu4pfHyLrdeAFzPLq06gJQhHUaPg/Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750806851; x=1751411651;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2avNAjgpZjcbReZUwdq7QbEEbuP37OoZf7pBOX3m5Mk=;
        b=qMeqMZy7/C4eaoKKIdeiES7LPP+0gCJnwX4oxxFzcXnJU+nWaSQVaofSqDmTgUJCaT
         plXc9iwC1bSFidhbByJyCopg8+c9IACqnZuT5PxZreL/e9eigV41I/lHvdTIaT9AF//J
         0fYUXc9/LfhVPVz54X8rqZSfpr1KSutoDPcIk0JEjn0YAPFhEe5CsLkBmvDh37FmobfF
         rD4TypxI8pI7d19c34Skgd+HGvLUDGGG4g8sJAz4Pxpz01X2h25VkjzpBG9x03yBT0Yn
         rXJfk0edT8tLAZf5lyz9DLlq2aGepcrZScqrDm1ELj3pp98dyQhie/6oCYMlW9ZCkWpz
         AjDA==
X-Gm-Message-State: AOJu0Yx+LnDka3ZhDxN6I+l1FfbqLU4IrfKn5scTz7HzP147cd45R/Gs
	TeeXPNriAXsSLlMm0WHatgTmA3lq3FuFEzb2izNt5mmsU/YbJgNY51WwDlySqhSAy07bofeaHtA
	I+DeQqfQ=
X-Gm-Gg: ASbGncsROwqQkIL5SWkXWgh4sAZRmhA1KAvwsD3zfcWpFhaUFwuOWR79NCl3YX137kV
	fnT/igASt1qsgjLNnd5rlTin8taD0jouFZ164dHVSEw6k05PLsHzD8ud84/iSZo7oQLRWhJBvGw
	F4wemRqdFxuwk0Sjlfx72QqGS0Zd+49UuvCS6Aq+ktyjiSdRuSrAb31AGigg59yLxZVPBA4aj3c
	J2w4izs+J9pLuJ0tKz+L4gycgOf5OUMUfK+YV8dIQzUDIZUtmAMrtXqMrzLzLFwj9T2K4FJ7fMR
	EPiFl6uijy7guUIcnclvd80nErmS81RzRIWUfB5SMGH3AQEgAsWLmnihJ3ScnPXFvxKeKToctey
	YfXEDBtCjkkK0irLXfjJ2L/IOVw==
X-Google-Smtp-Source: AGHT+IG4y3640SMETz90D97hMoLVv/EwkkhN+t4cusl/61B41XZJniHM1R5dq3cvcSbrPptz8btVlg==
X-Received: by 2002:a17:90b:5610:b0:311:df4b:4b93 with SMTP id 98e67ed59e1d1-315f2613399mr1001054a91.7.1750806851231;
        Tue, 24 Jun 2025 16:14:11 -0700 (PDT)
Received: from localhost (c-98-232-159-17.hsd1.or.comcast.net. [98.232.159.17])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-315f53a8c8fsm167857a91.20.2025.06.24.16.14.10
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 16:14:10 -0700 (PDT)
From: tim.orling@konsulko.com
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/6] python3-cryptography{-vectors}: upgrade 45.0.3 -> 45.0.4
Date: Tue, 24 Jun 2025 16:13:54 -0700
Message-ID: <825e732eff4128a5c43b77eff1a292380e80186d.1750806216.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1750806216.git.tim.orling@konsulko.com>
References: <cover.1750806216.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Jun 2025 23:14:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219293

From: Tim Orling <tim.orling@konsulko.com>

https://cryptography.io/en/latest/changelog/#v45-0-4

45.0.4 - 2025-06-09
Fixed decrypting PKCS#8 files encrypted with SHA1-RC4. (This is not
considered secure, and is supported only for backwards compatibility.)

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
Tested with core-image-ptest-python3-cryptography on qemux86-64

 meta/recipes-devtools/python/python3-cryptography-common.inc  | 2 +-
 meta/recipes-devtools/python/python3-cryptography-vectors.bb  | 2 +-
 meta/recipes-devtools/python/python3-cryptography.bb          | 2 +-
 .../0001-pyproject.toml-remove-benchmark-disable-option.patch | 4 ++--
 4 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-devtools/python/python3-cryptography-common.inc b/meta/recipes-devtools/python/python3-cryptography-common.inc
index 3018d967b2d..5ce2485ed56 100644
--- a/meta/recipes-devtools/python/python3-cryptography-common.inc
+++ b/meta/recipes-devtools/python/python3-cryptography-common.inc
@@ -3,4 +3,4 @@
 #
 # Additionally AUH will detect that they share this .inc file and
 # perform a lockstep upgrade for both.
-PV = "45.0.3"
+PV = "45.0.4"
diff --git a/meta/recipes-devtools/python/python3-cryptography-vectors.bb b/meta/recipes-devtools/python/python3-cryptography-vectors.bb
index 46597134b6d..a8f8d0cd17e 100644
--- a/meta/recipes-devtools/python/python3-cryptography-vectors.bb
+++ b/meta/recipes-devtools/python/python3-cryptography-vectors.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=8c3617db4fb6fae01f1d253ab91511e4 \
 # NOTE: Make sure to keep this recipe at the same version as python3-cryptography
 #       Upgrade both recipes at the same time
 require python3-cryptography-common.inc
-SRC_URI[sha256sum] = "b65cebdc334c6b9db8c79081a08253fddf262d009d2c914398edd24a4321db21"
+SRC_URI[sha256sum] = "fbb0408df8ff2d2b3dbd2928bc5b7feebfdd36fb092fa8790d5778a9b9a1f9ef"
 
 PYPI_PACKAGE = "cryptography_vectors"
 UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
diff --git a/meta/recipes-devtools/python/python3-cryptography.bb b/meta/recipes-devtools/python/python3-cryptography.bb
index e40e62f6265..f41e13f4a1c 100644
--- a/meta/recipes-devtools/python/python3-cryptography.bb
+++ b/meta/recipes-devtools/python/python3-cryptography.bb
@@ -11,7 +11,7 @@ LDSHARED += "-pthread"
 # NOTE: Make sure to keep this recipe at the same version as python3-cryptography-vectors
 #       Upgrade both recipes at the same time
 require python3-cryptography-common.inc
-SRC_URI[sha256sum] = "ec21313dd335c51d7877baf2972569f40a4291b76a0ce51391523ae358d05899"
+SRC_URI[sha256sum] = "7405ade85c83c37682c8fe65554759800a4a8c54b2d96e0f8ad114d31b808d57"
 
 SRC_URI += "file://0001-pyproject.toml-remove-benchmark-disable-option.patch \
             file://check-memfree.py \
diff --git a/meta/recipes-devtools/python/python3-cryptography/0001-pyproject.toml-remove-benchmark-disable-option.patch b/meta/recipes-devtools/python/python3-cryptography/0001-pyproject.toml-remove-benchmark-disable-option.patch
index 42876e34899..e2387172084 100644
--- a/meta/recipes-devtools/python/python3-cryptography/0001-pyproject.toml-remove-benchmark-disable-option.patch
+++ b/meta/recipes-devtools/python/python3-cryptography/0001-pyproject.toml-remove-benchmark-disable-option.patch
@@ -1,4 +1,4 @@
-From 7da554d52bfed4370766d5afd94bc7865791231d Mon Sep 17 00:00:00 2001
+From baa3c56b87ceaea331811a0a4642991cbb12e6ea Mon Sep 17 00:00:00 2001
 From: Mingli Yu <mingli.yu@windriver.com>
 Date: Tue, 17 May 2022 17:22:48 +0800
 Subject: [PATCH] pyproject.toml: remove --benchmark-disable option
@@ -26,7 +26,7 @@ Signed-off-by: Tim Orling <tim.orling@konsulko.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/pyproject.toml b/pyproject.toml
-index d94a1f5..c0f87a7 100644
+index d9ef704..878b720 100644
 --- a/pyproject.toml
 +++ b/pyproject.toml
 @@ -129,7 +129,7 @@ exclude = [
-- 
2.43.0


