Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED243CD98D6
	for <webhook@archiver.kernel.org>; Sun, 14 Jun 2026 08:04:00 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.105046.1781424232079854354
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Jun 2026 01:03:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=C34RCPQm;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-490cf3000f0so23527015e9.1
        for <openembedded-core@lists.openembedded.org>; Sun, 14 Jun 2026 01:03:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1781424230; x=1782029030; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=27h7g8a15DQDDEQqKO8KlGm3j6kftR2350WL63xSN7U=;
        b=C34RCPQmLpwQPajvecT4sfLU+69yexp3wieFO0FzSks3n/5YP3yX3gSbaNblkB337a
         /n9Pull5kajnGl+rlMM9FGJljXdSAAheBm4hUrYq7Nh6qX8ZCvWducfWic+PyMSvIgvG
         m4b51zKf1s1MXM6YxYb8woZ9lqKAvcnAKUgec=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781424230; x=1782029030;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=27h7g8a15DQDDEQqKO8KlGm3j6kftR2350WL63xSN7U=;
        b=VcoXO6YZxYpJhiPuoEw8OlVPLs2CEJNc35T+Ijdi+AACJSYJp/BT9t+WrIKh3BS/1Z
         w289xNBcP6lPJjob9iyWuIxy0F/nlYhNS4XSJmhy/6sajKzg9V3JS8m5VJIygcVDVDZw
         acMQTwzG1Gi8fcPeH13eejdc7pXOp3Oh9VNtnTrvaWv+mrK540/QsEypDi6vSMhsvUKj
         gsQbvsz48aaTTcUg1Ns7exTX/+7CcytXWKSI9ZHcTDMQXLLh2vuOQWNeWRXONcJ9aqHg
         nz91oMARLlPSQMQg2F36S8N6AQRmXLmQGo9llZ1kXwW8AR++7wH2LQQo3bMdgJQSif1m
         UqCQ==
X-Gm-Message-State: AOJu0Yxq1JuvDAIjleLngJjTbXA0fiwWXOKn4ngIyr/AmAe0GK7+oxIM
	rL+lB0d7iEC77DYeR0/LIAm3IT9neAdTrnmtEdDpWCJM3ZRw5Fa7gqJnTxfCFWnonPIwAdcd9/Y
	iaLjo
X-Gm-Gg: Acq92OGsChQMRZwq96C5EAWxEOJOwR+JMmtK+cHLwfiahBVxK9zo23QGnBPHanKTrqf
	v9y08H7QmVFfMCksVzK1DYhoiPHj5NAQ2n0dz9erROkP8S26opOmNTujPZHAbBfs+0YXc7X0riM
	MoUHTG30W3x3gprG8ivWpcRxj602/zs5bn2J7i2EfIgFAnWTBuqz3tHcuTcaRRN5cyqLF+D22EP
	ii8Arnw6lexNm3alPirUp41TFxQJUCIfOTMFQHSh9Vx/ZhKGvxOGrM69Z9/mRh/WuJvxCDOJIwf
	gGONug/S7KRivEkADErmQgjxCgFbsASKRbDPzrKzXnnhCIaf8AOvdyk+EHqmtMLrDzMZKUmqTjg
	WWj/YWvnGAHLVEvGmVstteQ2x5920gwxBaNDcE3heAaGDMaFkUO3hwsXrXwIItHhHhu8w5iHp+/
	xz6XsSxvA4Nmz5xP//pr9PfdTLcU0Cr9NNPjENuM/UNU9p6Dwk9Lit1QdQX3AK1k8=
X-Received: by 2002:a05:600c:4514:b0:490:e1e6:8988 with SMTP id 5b1f17b1804b1-490ec4c0327mr118941235e9.7.1781424230325;
        Sun, 14 Jun 2026 01:03:50 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:b23b:4f5a:d2e8:6789])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-492202edf89sm149999065e9.1.2026.06.14.01.03.49
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2026 01:03:49 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 26/56] python3-cryptography{,vectors}: upgrade 48.0.0 -> 48.0.1
Date: Sun, 14 Jun 2026 09:02:37 +0100
Message-ID: <20260614080307.4017177-26-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260614080307.4017177-1-richard.purdie@linuxfoundation.org>
References: <20260614080307.4017177-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 14 Jun 2026 08:04:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238710

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../recipes-devtools/python/python3-cryptography-common.inc | 2 +-
 .../recipes-devtools/python/python3-cryptography-vectors.bb | 2 +-
 meta/recipes-devtools/python/python3-cryptography.bb        | 2 +-
 ...001-pyproject.toml-remove-benchmark-disable-option.patch | 6 +++---
 4 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-devtools/python/python3-cryptography-common.inc b/meta/recipes-devtools/python/python3-cryptography-common.inc
index 77d97816884..4077fdebbfd 100644
--- a/meta/recipes-devtools/python/python3-cryptography-common.inc
+++ b/meta/recipes-devtools/python/python3-cryptography-common.inc
@@ -3,4 +3,4 @@
 #
 # Additionally AUH will detect that they share this .inc file and
 # perform a lockstep upgrade for both.
-PV = "48.0.0"
+PV = "48.0.1"
diff --git a/meta/recipes-devtools/python/python3-cryptography-vectors.bb b/meta/recipes-devtools/python/python3-cryptography-vectors.bb
index 6abb727915e..0119b70b7ee 100644
--- a/meta/recipes-devtools/python/python3-cryptography-vectors.bb
+++ b/meta/recipes-devtools/python/python3-cryptography-vectors.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=8c3617db4fb6fae01f1d253ab91511e4 \
 # NOTE: Make sure to keep this recipe at the same version as python3-cryptography
 #       Upgrade both recipes at the same time
 require python3-cryptography-common.inc
-SRC_URI[sha256sum] = "69836f597ddfbe3920b3c90d1f18e5560973f0791b90e1921ad345e8111ac23e"
+SRC_URI[sha256sum] = "52bfaaf93b50e013d59a5ba070b510e4c1272f8cfabcb2e4fb58bc327c69b8f1"
 
 PYPI_PACKAGE = "cryptography_vectors"
 
diff --git a/meta/recipes-devtools/python/python3-cryptography.bb b/meta/recipes-devtools/python/python3-cryptography.bb
index 5e24dbaf5ab..915b35f3a57 100644
--- a/meta/recipes-devtools/python/python3-cryptography.bb
+++ b/meta/recipes-devtools/python/python3-cryptography.bb
@@ -11,7 +11,7 @@ LDSHARED += "-pthread"
 # NOTE: Make sure to keep this recipe at the same version as python3-cryptography-vectors
 #       Upgrade both recipes at the same time
 require python3-cryptography-common.inc
-SRC_URI[sha256sum] = "5c3932f4436d1cccb036cb0eaef46e6e2db91035166f1ad6505c3c9d5a635920"
+SRC_URI[sha256sum] = "266f4ee051abb2f725b74ef8072b521ce1feacf685a3364fa6a6b45548db791a"
 
 SRC_URI += "file://0001-pyproject.toml-remove-benchmark-disable-option.patch \
             file://check-memfree.py \
diff --git a/meta/recipes-devtools/python/python3-cryptography/0001-pyproject.toml-remove-benchmark-disable-option.patch b/meta/recipes-devtools/python/python3-cryptography/0001-pyproject.toml-remove-benchmark-disable-option.patch
index 5c2e3c53ba1..de0718ec038 100644
--- a/meta/recipes-devtools/python/python3-cryptography/0001-pyproject.toml-remove-benchmark-disable-option.patch
+++ b/meta/recipes-devtools/python/python3-cryptography/0001-pyproject.toml-remove-benchmark-disable-option.patch
@@ -1,4 +1,4 @@
-From 6d6fbe77732ce3c4d2dcf3a5f75bb20ea352bf4a Mon Sep 17 00:00:00 2001
+From f870c1b00a302999fc3a7dd9cc6bb1d340511803 Mon Sep 17 00:00:00 2001
 From: Mingli Yu <mingli.yu@windriver.com>
 Date: Tue, 17 May 2022 17:22:48 +0800
 Subject: [PATCH] pyproject.toml: remove --benchmark-disable option
@@ -26,10 +26,10 @@ Signed-off-by: Tim Orling <tim.orling@konsulko.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/pyproject.toml b/pyproject.toml
-index 95ced11..75bfcbb 100644
+index f9d05bb..3aaf9fe 100644
 --- a/pyproject.toml
 +++ b/pyproject.toml
-@@ -134,7 +134,7 @@ exclude = [
+@@ -139,7 +139,7 @@ exclude = [
  ]
  
  [tool.pytest.ini_options]

