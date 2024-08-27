Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2F55C5473D
	for <webhook@archiver.kernel.org>; Tue, 27 Aug 2024 05:24:19 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web11.70883.1724736254970443406
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Aug 2024 22:24:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=C47k11ha;
 spf=pass (domain: gmail.com, ip: 209.85.218.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a86e9db75b9so30224166b.1
        for <openembedded-core@lists.openembedded.org>; Mon, 26 Aug 2024 22:24:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724736253; x=1725341053; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LV82W5cwlPBb+D2hUVW2Ul9IseM6WnSOtq92w5iTiBA=;
        b=C47k11halU9Xhe1b9QDYEZXaocwdO1nc0J+oc4dWsH9wYnhHgO/umdJQ+Ik4GEGftT
         aVmCDakgWDNNr+aYLueWMaCT995E/Pii/jJZgelC6LPX+lArzM8Z01DLfUy2lh6LL3AE
         uwedYETGAaJEVs3JGdalniuokQ4sQEgY/pSu7Ah+Bw/lIEo1r8kreasCcUfh8H0ei2kI
         adLBzy6B/Qg4slu0p7WsuJG6fLzXjo6ienn8DZPNi1Fn9yWdv0oRrzIodE/lVQGU2T3D
         d8WBi5lnGApkUQvByinmY2AbOVmfnyagw6aAnPrqT4jfKU+i917SHEfE7AIH3mm1YOZ9
         5uPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724736253; x=1725341053;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LV82W5cwlPBb+D2hUVW2Ul9IseM6WnSOtq92w5iTiBA=;
        b=W+C42y5bcFxnrYtQr/DmGkLJe6tZ81LDuu1jXt4J8iqRtxuG+LRSEt0uzx+CBHCo2O
         DQAHOACF0/ywqvLwYULbCkcsc8w7VPJKUiYh4xmzYHVj+5ovSt0WL9Mfx4kW7S5M3q3u
         +kx2Phex1BKRtpmVyKy6pbDv6fx+5SIw8UCkCtsWM3iSJTlGrlHeL00iJaYww6Rfe2EL
         YNMoS1tckm2sn6QrkEkzIiAQnHFXJEW1tCYaDcvG+bdyT03TIDmyeMuatNDrF8FWjweO
         dZs0tY2h9bFAStTAF3ZKaOQrGrg5eFIdgNhQRGYlg3AY1vvJsM2RKFErdVPt4QQUU5ZQ
         FJ1A==
X-Gm-Message-State: AOJu0YyDOVSQ8X/ARBW5iDEUTiLDADER6a+Cnp4Zlh7GrlNnvsBhNeZR
	HzMorRJctsueRewuVaHmiX8EFeo3g6JvIggXu2g+SB/S62xATeqHmvAAdg==
X-Google-Smtp-Source: AGHT+IG2Q7HXkEm8g2lbYGjcF4BoGS7WvOy0cv3u0+RNh0RxC/NWSn+0LZfTme2VDmPZogDHhZ21IQ==
X-Received: by 2002:a17:907:2d89:b0:a77:c199:9d01 with SMTP id a640c23a62f3a-a86a5193483mr754942066b.22.1724736252985;
        Mon, 26 Aug 2024 22:24:12 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a86e675aa07sm57704166b.17.2024.08.26.22.24.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Aug 2024 22:24:12 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 26/34] mmc-utils: upgrade to latest revision
Date: Tue, 27 Aug 2024 07:23:46 +0200
Message-Id: <20240827052354.1319810-26-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240827052354.1319810-1-alex.kanavin@gmail.com>
References: <20240827052354.1319810-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Aug 2024 05:24:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203802

From: Alexander Kanavin <alex@linutronix.de>

Add sphinx as a build dependency and set C= to avoid needing the 'sparse' utility.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-devtools/mmc/mmc-utils_git.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/mmc/mmc-utils_git.bb b/meta/recipes-devtools/mmc/mmc-utils_git.bb
index 0bfd5c1cc8c..94015d6f839 100644
--- a/meta/recipes-devtools/mmc/mmc-utils_git.bb
+++ b/meta/recipes-devtools/mmc/mmc-utils_git.bb
@@ -5,13 +5,16 @@ LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://mmc.c;beginline=1;endline=20;md5=fae32792e20f4d27ade1c5a762d16b7d"
 
 SRCBRANCH ?= "master"
-SRCREV = "f757f413dea4a143ad7c3b48b8264176f0499a82"
+SRCREV = "123fd8b2ac3933be1319486fb1f32236a4a86a7c"
 
 PV = "0.1+git"
 
 SRC_URI = "git://git.kernel.org/pub/scm/utils/mmc/mmc-utils.git;branch=${SRCBRANCH};protocol=https"
 UPSTREAM_CHECK_COMMITS = "1"
 
+DEPENDS = "python3-sphinx-native"
+EXTRA_OEMAKE = "C="
+
 S = "${WORKDIR}/git"
 
 CFLAGS:append:powerpc64 = " -D__SANE_USERSPACE_TYPES__"
-- 
2.39.2


