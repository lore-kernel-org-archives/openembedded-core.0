Return-Path: <tim.orling@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3030C87FCF
	for <webhook@archiver.kernel.org>; Thu,  7 Aug 2025 18:45:02 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web10.3720.1754592295027219986
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Aug 2025 11:44:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=tlgWn51w;
 spf=pass (domain: konsulko.com, ip: 209.85.210.180, mailfrom: tim.orling@konsulko.com)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-76bde897110so1213598b3a.3
        for <openembedded-core@lists.openembedded.org>; Thu, 07 Aug 2025 11:44:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1754592294; x=1755197094; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GoMuI5zAEmP/ZPpMOFIb4jzg5PtENWvCCNbnn5dzrE0=;
        b=tlgWn51wMD6031YyFM86X6KLODlVLAJKgW2h6L86nlAqOtlbLSH77qqtXDYpItgVrz
         /GwAiRNVUfXxfjeMf6m/e+1lka2QVlKZWe37+ifuDOO419/5WKxnwU0yl7GqXvSHO+UQ
         qdUFrL6YYuFILHYir9H/xfGg0Y7MR4dmumFJQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754592294; x=1755197094;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GoMuI5zAEmP/ZPpMOFIb4jzg5PtENWvCCNbnn5dzrE0=;
        b=p4h0wwxfmLsFT6Zkv1M/nnNZRHp7/I9RTEv6hHRaPMRuMGlP2zwNZQfXXzEXSStP1T
         MrtHg1LSc5WQKcv/DNPNsyz68Tpo65PvdxHZeUn1PvJ799pbgmZCEQvsUQrvJjgWj4fR
         Bs1EqvcmdRAG8oEw9BtYhS7dBltwlI0NE8Q4cjwEZxvvmy6FfllK72k91uLx0YcL6/dU
         dGld9bPTiZFAoj3CS5CA/fUbLy7i/CPdSlICpJexNhg4Ftj9Ia0QRXUfWkGGYCS3n3Ww
         c+wmdOle1yJgBIzUpwFcyBj3RFe7WlrrJPEk0MjdqlnY65SQXzr49L096A5cji++kwAf
         jXgA==
X-Gm-Message-State: AOJu0YwVh2svL2ScjmGWrH5uDk4NYghjHy9xUjAapqxWhpUNIkdUJjqD
	WRjo33ykXls7b+ZZiLqtKp3JiFcIOFNC4rhDuRqQ6eP6aeh7A/swKf1eByLJFhr7huK2zpWgdl2
	N9HJc46w=
X-Gm-Gg: ASbGnctqBUYFQ9yCKvrVzk74/0FWGshiJ9RT2HgTHlxXc0Bk9/vvPOo4SnrEeI47zC/
	XZcKa3+JBfdSaCTrHyIMj+Ujz2CXV14IoiZHD+OlL5vfP9oD+44Eymz7JFCsCjhGC265xja/gQA
	o9T7+WiC+arzWlRTlW7rk0XvLM0Yt0jxHfC7CvdNX8EUGjwa3f9N6+YO3wqxDt9/fanwV5N+Lc2
	d+QTaQD0nEimeMcPZ5jlqZIhzV2rrxPT9EOTYkc+/K7lSTj7uK8ylFRdKY45Nt854pq9ZQVnPas
	v2jeoYauGqVpdKuSUzKH8GvDvuayoEb+iYYSNUqeRr6rlTzIqbuAYWITY2IUc3wgh2Ou2ARu8TS
	R8/MbcHvkB6ksOWopVdR1i46/Txd9i4FKrFp66Zf8Y6K6egoplCd25pu3MxsSEvn0ixSs1RfI
X-Google-Smtp-Source: AGHT+IFDPCV9hiQyLlZag/pMo1PQpvcz8RzkRI792zr20VQz4cuymjjffdZK4aVhUxnQy1Zuq/9Fbg==
X-Received: by 2002:a05:6a00:181c:b0:736:5f75:4a3b with SMTP id d2e1a72fcca58-76c460fe787mr247534b3a.7.1754592293751;
        Thu, 07 Aug 2025 11:44:53 -0700 (PDT)
Received: from localhost (c-98-232-159-17.hsd1.or.comcast.net. [98.232.159.17])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76bccfbcef6sm18746087b3a.85.2025.08.07.11.44.53
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Aug 2025 11:44:53 -0700 (PDT)
From: tim.orling@konsulko.com
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/4] python3-cryptography{-vectors}: upgrade to  45.0.6
Date: Thu,  7 Aug 2025 11:44:39 -0700
Message-ID: <e658a1dfd002a5273bc9d1491c2674e607df0689.1754591996.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1754591996.git.tim.orling@konsulko.com>
References: <cover.1754591996.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Aug 2025 18:45:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221580

From: Tim Orling <tim.orling@konsulko.com>

* Refresh 0001-pyproject.toml-remove-benchmark-disable-option.patch

45.0.6 - 2025-08-05
* Updated Windows, macOS, and Linux wheels to be compiled with OpenSSL 3.5.2.

45.0.5 - 2025-07-02
* Updated Windows, macOS, and Linux wheels to be compiled with OpenSSL 3.5.1.

https://cryptography.io/en/latest/changelog/#v45-0-6
https://cryptography.io/en/latest/changelog/#v45-0-5

Comparing changes:
https://github.com/pyca/cryptography/compare/45.0.4...45.0.6

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
All ptests pass on qemux86-64 for core-image-ptest-python3-cryptography

 meta/recipes-devtools/python/python3-cryptography-common.inc  | 2 +-
 meta/recipes-devtools/python/python3-cryptography-vectors.bb  | 2 +-
 meta/recipes-devtools/python/python3-cryptography.bb          | 2 +-
 .../0001-pyproject.toml-remove-benchmark-disable-option.patch | 4 ++--
 4 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-devtools/python/python3-cryptography-common.inc b/meta/recipes-devtools/python/python3-cryptography-common.inc
index 5ce2485ed56..874f60bf834 100644
--- a/meta/recipes-devtools/python/python3-cryptography-common.inc
+++ b/meta/recipes-devtools/python/python3-cryptography-common.inc
@@ -3,4 +3,4 @@
 #
 # Additionally AUH will detect that they share this .inc file and
 # perform a lockstep upgrade for both.
-PV = "45.0.4"
+PV = "45.0.6"
diff --git a/meta/recipes-devtools/python/python3-cryptography-vectors.bb b/meta/recipes-devtools/python/python3-cryptography-vectors.bb
index 3df61315ea9..b6b0e38f2e9 100644
--- a/meta/recipes-devtools/python/python3-cryptography-vectors.bb
+++ b/meta/recipes-devtools/python/python3-cryptography-vectors.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=8c3617db4fb6fae01f1d253ab91511e4 \
 # NOTE: Make sure to keep this recipe at the same version as python3-cryptography
 #       Upgrade both recipes at the same time
 require python3-cryptography-common.inc
-SRC_URI[sha256sum] = "fbb0408df8ff2d2b3dbd2928bc5b7feebfdd36fb092fa8790d5778a9b9a1f9ef"
+SRC_URI[sha256sum] = "068cee15423f3f1633ca04f12284385ac404c19366e7ccb3b680156c1aa9c573"
 
 PYPI_PACKAGE = "cryptography_vectors"
 UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
diff --git a/meta/recipes-devtools/python/python3-cryptography.bb b/meta/recipes-devtools/python/python3-cryptography.bb
index 5963064b724..c4204712f23 100644
--- a/meta/recipes-devtools/python/python3-cryptography.bb
+++ b/meta/recipes-devtools/python/python3-cryptography.bb
@@ -11,7 +11,7 @@ LDSHARED += "-pthread"
 # NOTE: Make sure to keep this recipe at the same version as python3-cryptography-vectors
 #       Upgrade both recipes at the same time
 require python3-cryptography-common.inc
-SRC_URI[sha256sum] = "7405ade85c83c37682c8fe65554759800a4a8c54b2d96e0f8ad114d31b808d57"
+SRC_URI[sha256sum] = "5c966c732cf6e4a276ce83b6e4c729edda2df6929083a952cc7da973c539c719"
 
 SRC_URI += "file://0001-pyproject.toml-remove-benchmark-disable-option.patch \
             file://check-memfree.py \
diff --git a/meta/recipes-devtools/python/python3-cryptography/0001-pyproject.toml-remove-benchmark-disable-option.patch b/meta/recipes-devtools/python/python3-cryptography/0001-pyproject.toml-remove-benchmark-disable-option.patch
index e2387172084..16681e80a87 100644
--- a/meta/recipes-devtools/python/python3-cryptography/0001-pyproject.toml-remove-benchmark-disable-option.patch
+++ b/meta/recipes-devtools/python/python3-cryptography/0001-pyproject.toml-remove-benchmark-disable-option.patch
@@ -1,4 +1,4 @@
-From baa3c56b87ceaea331811a0a4642991cbb12e6ea Mon Sep 17 00:00:00 2001
+From b033cd32813a104fb216135cdca7da7180912e56 Mon Sep 17 00:00:00 2001
 From: Mingli Yu <mingli.yu@windriver.com>
 Date: Tue, 17 May 2022 17:22:48 +0800
 Subject: [PATCH] pyproject.toml: remove --benchmark-disable option
@@ -26,7 +26,7 @@ Signed-off-by: Tim Orling <tim.orling@konsulko.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/pyproject.toml b/pyproject.toml
-index d9ef704..878b720 100644
+index 4746201..df98351 100644
 --- a/pyproject.toml
 +++ b/pyproject.toml
 @@ -129,7 +129,7 @@ exclude = [
-- 
2.43.0


