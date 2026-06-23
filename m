Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A147CDE001
	for <webhook@archiver.kernel.org>; Tue, 23 Jun 2026 22:27:04 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.33397.1782253620036556523
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jun 2026 15:27:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=tqsMhPbI;
 spf=pass (domain: smile.fr, ip: 209.85.128.54, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-490b7866869so3291265e9.2
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Jun 2026 15:26:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1782253618; x=1782858418; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PWT6QzVXv/ZRn4fXwCA9Gf6z5vdbWetVKd/vio4rYXQ=;
        b=tqsMhPbIzj7xD8rdpE1RqMCRcpfulLb0U7cxlNoIKLEMRMpJfCKUHDk/Wo/faGoZg2
         a/xjCv1X2rhow2OizUZEgpiI/V8TWP1zt8r1d1rJyKwm8cIv6Z8X9e2egKtGVFd72IIm
         7GUpH8vFEceOsoJwqPLedVLM67/zlixkhhAwY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782253618; x=1782858418;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PWT6QzVXv/ZRn4fXwCA9Gf6z5vdbWetVKd/vio4rYXQ=;
        b=KERi7bMUMu3S5f433LsdNFQ77SeBKEiwz0oCfuEQpeSOr3D3evbllCfMwsb1u4A356
         xw+WovrbVOfQaneIO26mJfaQOsb1HjhoioNLrMoTyMeSVthq33YD6JwEjhZ1Co4Z6S/O
         Mctw/ONZ9YPwlMxtTjwCHx4Plpr0UaV4QCSRZmOjGFRK8IlCVw8CLQ3Rf0fGNHHguKww
         amWln3CGCDeExbC54p2EUldbBdL39u5lVct7RVHy3r+E1SANSTJwC/QNjWq8WY6t6lhS
         MMjFAkWSr6NYQQCUOAsdOXyOIG2UwCVaTxYw5LbHgAeIu9LdehTv2nOPn3MVCzrIyV8x
         pxzQ==
X-Gm-Message-State: AOJu0YwrKqHv1EflaKHSTu6vccLOer3BlG3IhLhmpFHjSV6yQTiX8Q2E
	ZzzJ63yxaWlHNi/l7KFypbMDEzhc2YU5ZdtTXH75422UJzo91XSGFhfPvViYEeQ2/gTUxC7ViRv
	1+KGy
X-Gm-Gg: AfdE7clWcizqdI6dE+w+N2/ocouI5dRiGbfpB1sngpDcAEvkPpjVcmMkoPigqG7SiAu
	sc3X/2itANa/G1hZ/fmJklvTRzYuLMtb0eiJQzn8BpptDJXQtWPW+NW9NEjZM08g4CaePBc/0wi
	oi8WO1bjM5sih72IrW7gS7f1FhQoQi+p+O5JFs55C0VtWMpwmim3enwSBVUIHvbXEbhYZFLT6s8
	jMBZS3f5L1p/YKpxlEjeWvmVNvGEA8ExGl1XwSl0yMzB6EYySEFVgd6wetl4WAlCQQxhYFdmXKu
	pd6cnkum1NSg8U5Kx4pE9C9Pg+t4fcwP+ClkmEOgdWKDfZkvDXQHBgMLSCKvV1R12j/wq2+P9/L
	xdv0+py0AzrbCil6IYNtkFarSteUfuf/zfF+iJIQ4x00/K6Yx4zK0v3MZr0y+pbGm8YnYBE2CcP
	XmmjfbUaOYbl7OS4aZ51/ovZmeX+ZrMvwaCB728DMXT6Co82foTpiX37OhKrQETn3QcBvttIVNd
	GEAVME5W3SwCGge
X-Received: by 2002:a05:600c:3acb:b0:490:44eb:c1dd with SMTP id 5b1f17b1804b1-4925b38682emr61289885e9.29.1782253618010;
        Tue, 23 Jun 2026 15:26:58 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa0055dd0cae868d89dd.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:55dd:cae:868d:89dd])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4923fd21dbdsm370786745e9.6.2026.06.23.15.26.57
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 15:26:57 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap v2 02/41] openssh: fix CVE-2026-35386
Date: Wed, 24 Jun 2026 00:26:01 +0200
Message-ID: <36ee08f01311253bca4c4f8387446d35a55cc840.1782252148.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1782252148.git.yoann.congal@smile.fr>
References: <cover.1782252148.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Jun 2026 22:27:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239424

From: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>

CVE-2026-35386 is already fixed by the existing CVE-2025-61984 backport.

Rename CVE-2025-61984.patch to CVE-2025-61984_CVE-2026-35386.patch and
add the second CVE tag to document that one patch covers both CVEs.

https://nvd.nist.gov/vuln/detail/CVE-2026-35386

Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 ...CVE-2025-61984.patch => CVE-2025-61984_CVE-2026-35386.patch} | 2 +-
 meta/recipes-connectivity/openssh/openssh_9.6p1.bb              | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-connectivity/openssh/openssh/{CVE-2025-61984.patch => CVE-2025-61984_CVE-2026-35386.patch} (99%)

diff --git a/meta/recipes-connectivity/openssh/openssh/CVE-2025-61984.patch b/meta/recipes-connectivity/openssh/openssh/CVE-2025-61984_CVE-2026-35386.patch
similarity index 99%
rename from meta/recipes-connectivity/openssh/openssh/CVE-2025-61984.patch
rename to meta/recipes-connectivity/openssh/openssh/CVE-2025-61984_CVE-2026-35386.patch
index f705410b240..7fcb02d613e 100644
--- a/meta/recipes-connectivity/openssh/openssh/CVE-2025-61984.patch
+++ b/meta/recipes-connectivity/openssh/openssh/CVE-2025-61984_CVE-2026-35386.patch
@@ -32,7 +32,7 @@ Slightly modified since variable expansion of user names was
 first released in 10.0, commit bd30cf784d6e8"
 
 Upstream-Status: Backport [Upstream commit https://github.com/openssh/openssh-portable/commit/35d5917652106aede47621bb3f64044604164043]
-CVE: CVE-2025-61984
+CVE: CVE-2025-61984 CVE-2026-35386
 Signed-off-by: David Nyström <david.nystrom@est.tech>
 ---
  ssh.c | 26 +++++++++++++++++++++++---
diff --git a/meta/recipes-connectivity/openssh/openssh_9.6p1.bb b/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
index a1b5d4a5535..ea158b56b41 100644
--- a/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
@@ -33,7 +33,7 @@ SRC_URI = "http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar
            file://CVE-2025-26465.patch \
            file://CVE-2025-32728.patch \
            file://CVE-2025-61985.patch \
-           file://CVE-2025-61984.patch \
+           file://CVE-2025-61984_CVE-2026-35386.patch \
            file://CVE-2026-35385.patch \
            file://CVE-2026-35387.patch \
            file://CVE-2026-35388.patch \

