Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17758C43458
	for <webhook@archiver.kernel.org>; Wed,  8 Jul 2026 11:40:35 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6512.1783510825635697672
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jul 2026 04:40:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=J3xVp1va;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-493c2b3dc8bso3617165e9.2
        for <openembedded-core@lists.openembedded.org>; Wed, 08 Jul 2026 04:40:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1783510824; x=1784115624; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=r8oChC2IDhri9cQ/QB7zabV+E4fbO2u0ZIVGAI9YVnA=;
        b=J3xVp1vaF3kADk+1lSIc31F1NQT/DofTvnguF0x7Nmgux+XGm0pOXmaUWMeMcbhyfY
         rseePCPQVnhhjbgNScPa3sTYvtXZ8hMsAspMxiVrkszbAO3NTE5VgaGcsSbelUAqMEUd
         s2VYJ9uSsiTTX4bPKHpINvHKRHdpAnhyV0jJ8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783510824; x=1784115624;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r8oChC2IDhri9cQ/QB7zabV+E4fbO2u0ZIVGAI9YVnA=;
        b=CwzOzn1/BP2Q88rMfKjZ33fWnmWq0ECzbSCMcJZHv0vaJDlH/0/dGSn9WIycBL7mz/
         ZpVtECQt7gKMzIoGYhvAax8jr/gqTKJKksYNuxMokW4+KU1hdgs5qnkGFzdpOZTqc1Oy
         8vnLmQlPPgAihH8uM+Wl1ha9BuH+O+ItGEYBx9gbWXIfJEYpTIaPD3JXG8AFKXcLV8O/
         Z0+McsvZ78T+6HpFByZhfGRfv1al/jnovFHK7EhcrdVTKNJ7VQEuiZ/oB3/vb5PmpVR9
         wrzPNFdE4ritlY7F8+CfaTmL6XFRefz6PypjPP+L2LqJSRSR+ZAE4ft09jn3bbuDdJK+
         sJzg==
X-Gm-Message-State: AOJu0YwMaMl6Uoh2pimc4mYCzoTfagMPcbX64KP/bUKMh3gwJn2o9ilR
	c+dHg2Od3ZqoQ2hVVZJvSCWzJY7DBjU+HMzLxlT9q3a6ez3nE5NjzCJpBE6vl7VNhvl0ZM8wNS+
	AVUv677c=
X-Gm-Gg: AfdE7cmoOTPW9ZIaj6pVacf3wYjOd1gktuG+KuHAXPlGPiMDU2nKqtqElwYFrKEahrM
	KhbD1ggd4sWqXBzGcT1GtBjPkLrq2VSrCrTSQZalywLFDlMbHuVmKdJY6k2WIGbYa5DoixhCdre
	l/f6Hvl25rXAxZEkx+hlcKUbAEHpIonoSeYRFe7pSxeW3hZ3FN2wKcNgOtvs3StCwPcRvuW7Bi9
	Po0VSr88bDKpW++82CrLuNbsognvlErWIVxKuR/kdjvizSutfCNcdHv1kcYDTzsuU/CPi9OcOdT
	CYRdXbD77Poq3bIAfPeQYOYNnV9ahGiu1Zlaq4BTNDGZnFqaTjxvr8ULRe9ssCsnOP1a3o1bSLc
	dWBXSPJu8KwhAKF0deubj33NqKK61sEDoPZDekG4jyFOeqb8DjDy8wPhLTzTziNE67IcI4roPKM
	QqcvVM9vQrS7PzCSvk3rpcYGRq/iPV5kSBh0EQY8N2LNtDv5OCRerV
X-Received: by 2002:a05:600c:4514:b0:493:c8c6:4989 with SMTP id 5b1f17b1804b1-493e6898afemr19915995e9.6.1783510823703;
        Wed, 08 Jul 2026 04:40:23 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:b60a:b356:19ef:1131])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e0f51193sm131183165e9.12.2026.07.08.04.40.22
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 04:40:22 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 01/11] enchant2: upgrade 2.8.18 -> 2.8.19
Date: Wed,  8 Jul 2026 12:40:11 +0100
Message-ID: <20260708114021.3484868-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Jul 2026 11:40:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240464

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../enchant/{enchant2_2.8.18.bb => enchant2_2.8.19.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/enchant/{enchant2_2.8.18.bb => enchant2_2.8.19.bb} (91%)

diff --git a/meta/recipes-support/enchant/enchant2_2.8.18.bb b/meta/recipes-support/enchant/enchant2_2.8.19.bb
similarity index 91%
rename from meta/recipes-support/enchant/enchant2_2.8.18.bb
rename to meta/recipes-support/enchant/enchant2_2.8.19.bb
index ff9422a49b7..51616ba8782 100644
--- a/meta/recipes-support/enchant/enchant2_2.8.18.bb
+++ b/meta/recipes-support/enchant/enchant2_2.8.19.bb
@@ -12,7 +12,7 @@ DEPENDS = "glib-2.0 groff-native"
 inherit autotools pkgconfig github-releases
 
 SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/enchant-${PV}.tar.gz"
-SRC_URI[sha256sum] = "883a16f0898c7b1af38046d8bce5c658156698498541e9344c60e317e8d48f2a"
+SRC_URI[sha256sum] = "8e7f6cb0c3b79be3146eb3ab93650484adbc59dae5f2c1958fde557080ba678c"
 
 GITHUB_BASE_URI = "https://github.com/rrthomas/enchant/releases"
 

