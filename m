Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA027D0E6E6
	for <webhook@archiver.kernel.org>; Tue, 25 Nov 2025 13:47:19 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17346.1764078431840600003
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Nov 2025 05:47:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Qhp+x/zR;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-42b3c965ca9so3107086f8f.1
        for <openembedded-core@lists.openembedded.org>; Tue, 25 Nov 2025 05:47:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1764078430; x=1764683230; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=QuGMdW69HRdK7pvGzfmFQ9HPREVlUTmGuNBun7/skXU=;
        b=Qhp+x/zRd1XJ8VnZSBnNbKgy7hJuF8uZscjBMPAmYZy/siheD87SPYaIPul29ErHSG
         4oRDppxSL6QLdaKOW4k+FpX7onzNMRzNHyV7BmOEy9XwOpH8cQw4JcvrPPMJNEJa4or4
         Q06dZv6WOXPy22OTbHDMNzspSE8y4iNXq1qrM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764078430; x=1764683230;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QuGMdW69HRdK7pvGzfmFQ9HPREVlUTmGuNBun7/skXU=;
        b=SNT/UbABA/5MtAPHJl++S4LavWc+oVwZAawkPnNB2qSv7Mbn6P82guaPt2Q1mRvacQ
         FebCnRI9M0V91YVmnfSSYNAkCsNwsTEvNXTLbZ0rUeNNNQgw7LP7PzRmDPa4spR2xNts
         +qKc7gcFnnCq0QmSQB5knqJgqq6IQwfjaudkmS3hpUR1PBEeHMXO4f16BcZezS/HT2jm
         7IUgo2QRlOXAlgdy8Gy3v6kz/kK3pQFmndx1lbOZ3CgPLpDo65UBgg7HizpyIQJW2opG
         qzueXmNgOTJmXwBhFB+kp6OBtqRpxmhNfbjSCxEJaSK1ntfDhyfwE1dRo5RqAKgvvKdy
         RUsA==
X-Gm-Message-State: AOJu0YxXo0HT1ZOQU6a6kcmat7nQSs0fSpdMWqvdKsX3YeFx9HzGQPY9
	3sqtLJ5TS4C4l0r3AIm8ee9sKyX9+JYZbXGms2k3dOz1aZDTxrfSeSdC9PSPqPeiFaqu74iQh0i
	J60Ye
X-Gm-Gg: ASbGncvD/CxiRCLxNOFABJGLSvrtB2lKq85ycrWQVAlqHy6QOtYKovfvIdEfHddXYIx
	sDqTZgyR+j0IfqqsteuZJmkL0Y0ddl7jV36sff5t881PYaLEvcLCNM26zPUN1ImzbQ89JMUHr4U
	wam8fo+Wick8oqcNODBOyo4lL8yGD1GUu67Ax9BwnF10+Z/6x1xEtepuhuqQRQwqoPK5YRLzsW5
	SgJeOdzAiGyrykT3mnW9a0nNXwcgsLhgHqRy07VBWvylSN5dSPUATD4g9/jI553agVMYROiBAVy
	M6njetaDkWyH/9eQ7WEsoogpcjJtwu+7oXC3b4tSDHRWLohr8+Mh4n0iRsfy2+A1vxFiK0ZOJhy
	uqO0riAw2fQXBBgPCXsHIF/kwRAVOOVbD68ERVUcUtNmeAh9iMYedDPY4UL1VlkGO86WiB8lXTV
	b5dPCkhd3QwcoFmSy+TWIQQ1Vp8zvr/GzTJ2ejTc7cjZNQ7P4Y8Q==
X-Google-Smtp-Source: AGHT+IENGrrstLGdjGLzWAhr1o06RTvp/4wSgCP0w8zgW3EWeI6N2Evv9fom9GY6RqTeAVTI/bRfjw==
X-Received: by 2002:a05:6000:240b:b0:42b:4139:5788 with SMTP id ffacd0b85a97d-42cc1cd92a5mr15910877f8f.6.1764078429838;
        Tue, 25 Nov 2025 05:47:09 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:c8cd:1015:2ce5:f243])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7fa35b7sm35111932f8f.20.2025.11.25.05.47.09
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 05:47:09 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] grub/glibc: Bump versions to resolve hashequiv/reproducibility issues
Date: Tue, 25 Nov 2025 13:47:08 +0000
Message-ID: <20251125134708.403758-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Nov 2025 13:47:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226768

After the gawk dependency change, we need to change PR/hashequiv version
to replace the corrupted sstate/hashequiv data.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-bsp/grub/grub2.inc   | 4 ++++
 meta/recipes-core/glibc/glibc.inc | 4 ++++
 2 files changed, 8 insertions(+)

diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
index f67f0a167a5..5759fa06c25 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -39,6 +39,10 @@ SRC_URI = "${GNU_MIRROR}/grub/grub-${PV}.tar.gz \
            file://CVE-2024-56738.patch \
 "
 
+# remove at next version upgrade or when output changes
+PR = "r1"
+HASHEQUIV_HASH_VERSION .= ".1"
+
 SRC_URI[sha256sum] = "b30919fa5be280417c17ac561bb1650f60cfb80cc6237fa1e2b6f56154cb9c91"
 
 CVE_STATUS[CVE-2019-14865] = "not-applicable-platform: applies only to RHEL"
diff --git a/meta/recipes-core/glibc/glibc.inc b/meta/recipes-core/glibc/glibc.inc
index 68fac4cca51..30d93bca77a 100644
--- a/meta/recipes-core/glibc/glibc.inc
+++ b/meta/recipes-core/glibc/glibc.inc
@@ -3,6 +3,10 @@ require glibc-ld.inc
 
 DEPENDS = "virtual/cross-cc virtual/cross-binutils libgcc-initial linux-libc-headers gawk-replacement-native"
 
+# remove at next version upgrade or when output changes
+PR = "r1"
+HASHEQUIV_HASH_VERSION .= ".1"
+
 PROVIDES = "virtual/libc"
 PROVIDES += "virtual/libintl virtual/libiconv"
 inherit autotools texinfo systemd

