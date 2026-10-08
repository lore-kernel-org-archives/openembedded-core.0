Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24428CA6007
	for <webhook@archiver.kernel.org>; Thu,  8 Oct 2026 06:10:07 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9712.1791439799776979328
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Oct 2026 23:10:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=VYeeOHkC;
 spf=pass (domain: gmail.com, ip: 209.85.221.49, mailfrom: rybczynska@gmail.com)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48c14a06c95so2033269f8f.1
        for <openembedded-core@lists.openembedded.org>; Wed, 07 Oct 2026 23:09:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791439798; x=1792044598; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WxcHRJfugXMLiqdeXIvqIsmL/ixZl6F8nmN4Ef0u2Gs=;
        b=VYeeOHkCcn8/Rizzva3x0t0O3KBPQEezeUR8bLCNhRFuH8dy5h3qvvhjA2IIrzndxZ
         yqnl8/USt0cZWzU+0NHBxjH3hvTepIeHseNwGRkAuGzxn6Qh64ezS34/EPVPnkb+xKGb
         aO9gI9jHVBdlN9vcvB4MjJRuoWryckbLP+q/BndeoiWYWOyJEJtRiSVZJtCgSmA0lQVY
         26dCSJ6QleLIaJ3mNcpMROItCJo+xYFpnDTGUhjLtER2bxxGrFRvsQvCm10Jc2fdbqWN
         MLaKaX2cXeKCrNRBYYFW/eic6Pn2ng9AapIU61eASID3aIeeO8r6mpbBlOrDRJvsB4OI
         EHNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791439798; x=1792044598;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WxcHRJfugXMLiqdeXIvqIsmL/ixZl6F8nmN4Ef0u2Gs=;
        b=fWZ1kSfycnVTW5zPSA8DiwAcJOsUGJSXctJmqLY9IHtkvx05yS41sWLwKum4fteY01
         kV68QuTUKy/AIJmDmr0kijFTNoEVbK5Vw4M2XHL6C7XKkkGV0NgwTpeyDX7O1cgCssbV
         //raXu8bl0M3QQcOLnQn7u8WA0jA8uClq542weJu9hDwBFNqIoh4FcZTnOlqDooJKIpE
         H3L5PhQqh9A38/kxwOQaTkQTCkhFxbleUtsyhygBPPvMn211I/SQP1Ud9mbSTIeUIsCk
         jDUy7Yo5EdsOu4xrKnRjHgJfRSS9z9yctGqUxjO0zjXZn5afxaaeRfFvt3qUPEtL6fBY
         QlUQ==
X-Gm-Message-State: AFq9FYIV9CxiO2d8Iz8IqCLRLb5IFp1wxqsxzDsbnl7C+ZzVwo1zF6uu
	qFN44KhujIvfKavJW1F+AQo4nC5tl7gafMjtDqviWyrco/7iRl56QQ5ClAk/oyYD
X-Gm-Gg: AYBFou3j4do90PxNFKOuRF08qNTyYjeqCXs57aZQoHRFGEd2v8xi4waV6bBOMdySIhS
	kwZUKTA1RjjJXw6wgAMVCXYajAKsg2Dh93m25VU3tNekO7Cmy5X2mLLzwKaYmL1DfZqhhgrXH/b
	kc70c/Oe4Mmsxe7SzhDcQ1O6TuHonzxxb0fKREp3JYdVSNu7eYJM2cJ1QJToEYTrGobOCIMWAGZ
	/iN5QWTETT9pTvGH/LK2dverEJsoIen8NR0+N0PZ4T98dj5WCk4rDjrfYlA/Y7yqHgM0EE1HrCt
	kQgCncIm7hiSIJOfKSge82hw29N71CxSu1Pe+chmeOCnQ9Ijq7hcaEvJf+GkW+72pFvs8Tn27Q/
	7N1VjsGiYziDENcTPEVFUJo75tpbkiuqjprH+Zs295yq9JHuPkZ05DdT3GgmvsLq5/RTmtvuQnC
	n5BXCwtrNPhXAc/PujQLTvgc7G4XOvU+xMCeWLmDoIvoeGYrPSYRWM3Pms4QO4K1/3BQok0Jk8z
	HHb3Ab/ZV4LRY0lJGPHuJ0I24I=
X-Received: by 2002:a05:6000:2489:b0:48b:60d:2b28 with SMTP id ffacd0b85a97d-48c7288f27emr8792392f8f.39.1791439797927;
        Wed, 07 Oct 2026 23:09:57 -0700 (PDT)
Received: from penguin.lxd ([81.0.251.149])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c71d3d3eesm10630219f8f.53.2026.10.07.23.09.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 23:09:56 -0700 (PDT)
From: Marta Rybczynska <rybczynska@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: a.fatoum@pengutronix.de,
	adrian.freihofer@siemens.com,
	Marta Rybczynska <rybczynska@gmail.com>
Subject: [PATCH v4 3/3] uboot-sign: enable signing SPL FIT configuration
Date: Thu,  8 Oct 2026 08:09:35 +0200
Message-Id: <20261008060935.4225-3-rybczynska@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261008060935.4225-1-rybczynska@gmail.com>
References: <20261008060935.4225-1-rybczynska@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Oct 2026 06:10:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247415

This commit enables signing SPL FIT configuration instead of specific
elements. This introduces an incompatibility with the previous behavior,
but is the correct way to do.

Signed-off-by: Marta Rybczynska <rybczynska@gmail.com>
---
 meta/classes-recipe/uboot-sign.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes-recipe/uboot-sign.bbclass b/meta/classes-recipe/uboot-sign.bbclass
index 42319d15ff..85138bc948 100644
--- a/meta/classes-recipe/uboot-sign.bbclass
+++ b/meta/classes-recipe/uboot-sign.bbclass
@@ -35,13 +35,13 @@ SPL_SIGN_ENABLE ?= "0"
 
 # Sign the FIT configuration in the SPL signing flow. Configuration
 # signatures bind the selected images and boot metadata together.
-SPL_SIGN_CONF ?= "0"
+SPL_SIGN_CONF ?= "1"
 
 # Legacy compatibility knob for per-image signatures in the SPL FIT path.
 # Individual image signatures do not protect the configuration metadata
 # which selects and parameterizes the boot images.
 # INSECURE, use at your own risk
-SPL_SIGN_INDIVIDUAL ?= "1"
+SPL_SIGN_INDIVIDUAL ?= "0"
 
 # Default value for deployment filenames.
 UBOOT_DTB_IMAGE ?= "u-boot-${MACHINE}-${PV}-${PR}.dtb"
-- 
2.43.0


