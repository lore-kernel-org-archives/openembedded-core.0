Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36EDAF88078
	for <webhook@archiver.kernel.org>; Thu, 16 Apr 2026 06:48:32 +0000 (UTC)
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com [209.85.221.67])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7573.1776322104190877382
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Apr 2026 23:48:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=1CwWKCV0;
 spf=pass (domain: smile.fr, ip: 209.85.221.67, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f67.google.com with SMTP id ffacd0b85a97d-43d7650202fso3335642f8f.2
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Apr 2026 23:48:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1776322102; x=1776926902; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G4DGxj33M83tdzDTFm/C37grkZ67fTY0gJo5pUhvEHw=;
        b=1CwWKCV0zl9OT5bbweJRGMURB04hL76yuWJcKIPBg/ewLAoY1OG6jctD/M5i+ueOum
         Q9LnbNsXIZ7UvTWEiJjSN7z3HydTQFQ4REkJP72UHNSZLaKzDrHXVYcPXU1iDWK/FZ+c
         EzntnZkq8pbjgde9L0VenZxBOmbH9UkZ+mtts=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776322102; x=1776926902;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=G4DGxj33M83tdzDTFm/C37grkZ67fTY0gJo5pUhvEHw=;
        b=LN/hmnK+LevIM4zl2+25C+U50q8erwuy2vKoYvU6PS0k5q7WCoDH+bb+Ni7MCtVAUB
         djgryV9vkRRWBbR5q68YIC7YLuXRycARR/yHa6E+McTa72JrRJ421lbVocWokYukWkAS
         CImDibgWyDoECLjw0LeP9yHli5LfqUuC0TMS8+bt+N+Rvb7jVi/v6/c83ThKV7OKNl+x
         ynWvhXnCRN4JYBGY3hoZ1nh6Rvf6i5Tw4BFPmexhfeNn6qSGfBqFYTHB/NvPvBw3M5xk
         3UdS7Cp8Ba/IjiJtbsQllWHHmmk3lInD5eG9iLh1pPnuPmkmbyEApSloJCYiCyTEzSZm
         0LKg==
X-Gm-Message-State: AOJu0YzdBBoa0KY8RZJg1lENKC/Hf2SpdfZbbiYePF7NTXraqfn+dXfB
	X9Hv9JAgftYFXkasr0HSsuTC1TPbpXOr+FxsvUN2CX8DOxdCCpEeIRBAgiehuLv8ozRxeeTorPh
	3zgW9V2XYhDUe
X-Gm-Gg: AeBDiesy4PotfnpALIihgd+us4bLLlYCrLTHoOryMkH3suLSAdfuNNsPPqFuiDCKq8/
	rv5RF9El1Cz9pfs7VOK4xFpeLOd4YP/Xq/ZLDQINhRUsHOBe1uCpvEKig0G3ERC/BRIilzshDjW
	2TinARwfVZaXT6qFG1MmruO3zfgFfIp8fRQx40RDxuAxZsNwG/WPrGUleYm1QmRGIfip4HQtPFz
	ckOH1dk65EbuzGfURaI8U6gBLIYf8ZWk8/+B3wjvCZ2QEJ4j0vkXWBNcmwF5/dZMlescSMB0oC2
	kTOb8tGdo0djRpi3GtI6QK75Mfjpzsa3KN2CJgk73BnQXJiOnOFjJ/scB1GJLl2ntSDCsK/GMSl
	cMaaMMBwQdiT8X+2yxA8+4H3P0hyb1v90aEm4acryndGUUuo7wwTW+KfWq9VU87CP0HyUuOcwfC
	YtwK/F+hkVPmOJU73/8c/ZVnG8Fi8lYEMHfaCKd2HYdMoV9PpiBrFdpjMYqEXCZoRgiQ24KJs6e
	qMZoBkwDFJ3oKtSGixRHd9VEEUzVllFIaTf0OxZmA1DATbM
X-Received: by 2002:a05:6000:24c2:b0:43d:dd:8ca4 with SMTP id ffacd0b85a97d-43d6429b7b6mr35293749f8f.14.1776322102266;
        Wed, 15 Apr 2026 23:48:22 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43ead3d5ea9sm11200017f8f.21.2026.04.15.23.48.21
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 23:48:21 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter 08/47] python3: upgrade 3.13.11 -> 3.13.12
Date: Thu, 16 Apr 2026 08:47:09 +0200
Message-ID: <976d4764a2d676c2d477563123a9b96fa19a95be.1776321810.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1776321810.git.yoann.congal@smile.fr>
References: <cover.1776321810.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Apr 2026 06:48:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235350

From: Vijay Anusuri <vanusuri@mvista.com>

Handles CVE-2025-15282

Release information:
* https://www.python.org/downloads/release/python-31312/
* Python 3.13.12 is the twelfth maintenance release of 3.13, containing around 240 bugfixes, build improvements and documentation changes since 3.13.11.

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
[YC: Full changelog: https://docs.python.org/release/3.13.12/whatsnew/changelog.html ]
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../python/{python3_3.13.11.bb => python3_3.13.12.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3_3.13.11.bb => python3_3.13.12.bb} (99%)

diff --git a/meta/recipes-devtools/python/python3_3.13.11.bb b/meta/recipes-devtools/python/python3_3.13.12.bb
similarity index 99%
rename from meta/recipes-devtools/python/python3_3.13.11.bb
rename to meta/recipes-devtools/python/python3_3.13.12.bb
index 2bc2389b7e4..e30acebe20d 100644
--- a/meta/recipes-devtools/python/python3_3.13.11.bb
+++ b/meta/recipes-devtools/python/python3_3.13.12.bb
@@ -36,7 +36,7 @@ SRC_URI:append:class-native = " \
            file://0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch \
            "
 
-SRC_URI[sha256sum] = "16ede7bb7cdbfa895d11b0642fa0e523f291e6487194d53cf6d3b338c3a17ea2"
+SRC_URI[sha256sum] = "2a84cd31dd8d8ea8aaff75de66fc1b4b0127dd5799aa50a64ae9a313885b4593"
 
 # exclude pre-releases for both python 2.x and 3.x
 UPSTREAM_CHECK_REGEX = "[Pp]ython-(?P<pver>\d+(\.\d+)+).tar"

