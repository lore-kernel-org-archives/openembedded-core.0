Return-Path: <tim.orling@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69E81C531F7
	for <webhook@archiver.kernel.org>; Thu, 23 Jul 2026 15:53:30 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3.1784822007406633076
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Jul 2026 08:53:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=GjRW9RkN;
 spf=pass (domain: konsulko.com, ip: 209.85.214.177, mailfrom: tim.orling@konsulko.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2ced3386430so8970025ad.1
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Jul 2026 08:53:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1784822007; x=1785426807; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KBTOQwh4VHf9MduwfnuGiuE/jH6BEtXoJVqfagjBxcI=;
        b=GjRW9RkNWMU0kKMidAmbJZuRVCBdGKcd2VlNGxL//UsZJvj2pKze3QEur64o2O4948
         aGuTfHhF54wpnn6A9TUFUYkZ3c86sfoNsoI0rFmFnGSXjDxs4QlrEeWths6QtPPKjNFi
         AOomlg4DyFaz//Bo9FzOfLnhDBoRixoCny89c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784822007; x=1785426807;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KBTOQwh4VHf9MduwfnuGiuE/jH6BEtXoJVqfagjBxcI=;
        b=fRcv/Q91tFxRpvkEkGKgTqCBo8mvgIlGbt6tVIDInuBzVoA/pVNaP04Y8XKlNqZiCt
         9+wOl5o7N16YeeoQ9+vMolKMq2nEInWpBPqynkVfOyZmC475cvxaIxWbg+V8ZY0iG6Aa
         ruGHmNs6T4K0rrZHX3jQazxkzBxq4/ku8x+Xz4yDu9vqs1VQsfcR9xBF+mcxFKYCPc4H
         1vvUAZT7n6A/PXlorhBgwvVmKf09sa+PRnQwnm6g+UQZaW4J2aEOtRjz9qkn74EOWUfQ
         K6/2/vk1IO9iHESIncI0gM2W8Z6hrxhAWXmyh+ZPHhVJyhXVrtWQanVZ9Ddn56ehwLSH
         0NEQ==
X-Gm-Message-State: AOJu0YxO77MyaqkX6oEjbOu7OQN6KuvZAVfF7i9PscxAnWB8vIfAD/Kp
	WUqpKvogxr0DRhqrm+Vukp23iNH1lJDW6ROX5yx9TpaGHS5KwEwhj0WoU2wKMyoafkj09J86QcS
	Bz5g+
X-Gm-Gg: AR+sD115oeTB5upH8XS5Cmmmh/z5W1lahcP2HjCyl3MnRcxhJivpuCJwbKFY/1jmrYl
	f1cplGWaii7dD6Owrd1gOm9oi/909BAfwjpOM399iWvy0lMuVzQr/2A9oV+mhEewt4gxaU3R5Vi
	8irjKLJFHVpefEmpL43xaLjZkyIt12TxIgJeoWsCLP6vGPISv2cnM5S2iO6Wa/hpepqYO6hmrG7
	tmJI5A2adP+MKkOpiJAy3gcyanmaIrjQrHGxxc8s+NiR6YOwSXSevgKl3P0tdJCHB7JwwfOWOQA
	0fugeQg98ZeNAYXKfr2s394iBSY/+wVmHoER27LpQEJNRUIpzbTzBS+QU3v/L6UsfT2RBOiGReI
	zfglXfvsp3wBSGl8uRGwn7mKfjI5UNAt+opWsgkhhvmCV/sc1D3BWUPRQnlIRDhENuOOvV+l2ra
	pwN7PbeFKsI51MVjWlNBU=
X-Received: by 2002:a17:903:46c3:b0:2ca:b8fd:1a8f with SMTP id d9443c01a7336-2cfa74aca7fmr42807195ad.39.1784822006748;
        Thu, 23 Jul 2026 08:53:26 -0700 (PDT)
Received: from thetis.home.local ([2606:c800:6024:2000:7e9e:a997:1cdc:b4bf])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf8efa46a2sm36085055ad.5.2026.07.23.08.53.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 08:53:26 -0700 (PDT)
From: tim.orling@konsulko.com
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH 1/2] python3-certifi: upgrade 2026.6.17 -> 2026.7.22
Date: Thu, 23 Jul 2026 08:53:16 -0700
Message-ID: <20260723155317.3693198-1-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Jul 2026 15:53:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241860

From: Tim Orling <tim.orling@konsulko.com>

f4bc676 2026.07.22 (#428)
4c91f9c Bump actions/setup-python from 6.3.0 to 7.0.0 (#427)
01a66c5 Bump actions/checkout from 7.0.0 to 7.0.1 (#426)
eb355f4 Bump pypa/gh-action-pypi-publish from 1.14.0 to 1.14.1 (#425)
474e6fc Include tests in the source distribution (#424)
a31ef39 Bump actions/setup-python from 6.2.0 to 6.3.0 (#420)
98eb2c7 Bump actions/checkout from 6.0.3 to 7.0.0 (#419)

For full comparison of changes, see:
https://github.com/certifi/python-certifi/compare/2026.06.17...2026.07.22

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 ...ython3-certifi_2026.6.17.bb => python3-certifi_2026.7.22.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-certifi_2026.6.17.bb => python3-certifi_2026.7.22.bb} (87%)

diff --git a/meta/recipes-devtools/python/python3-certifi_2026.6.17.bb b/meta/recipes-devtools/python/python3-certifi_2026.7.22.bb
similarity index 87%
rename from meta/recipes-devtools/python/python3-certifi_2026.6.17.bb
rename to meta/recipes-devtools/python/python3-certifi_2026.7.22.bb
index 69c505b510..71bef4d6c4 100644
--- a/meta/recipes-devtools/python/python3-certifi_2026.6.17.bb
+++ b/meta/recipes-devtools/python/python3-certifi_2026.7.22.bb
@@ -7,7 +7,7 @@ HOMEPAGE = " http://certifi.io/"
 LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=11618cb6a975948679286b1211bd573c"
 
-SRC_URI[sha256sum] = "024c88eeec92ca068db80f02b8b07c9cef7b9fe261d1d535abfd5abd6f6af432"
+SRC_URI[sha256sum] = "741e2c3b351ddf169a738da9f2c048608ff7f2c5cc02f1ebc6b118bb090d5d55"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.47.3


