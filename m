Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45F24C41513
	for <webhook@archiver.kernel.org>; Tue, 16 Jul 2024 09:30:49 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web10.6903.1721122242671724756
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Jul 2024 02:30:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GRx8LxPG;
 spf=pass (domain: gmail.com, ip: 209.85.221.46, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-367993463b8so2977694f8f.2
        for <openembedded-core@lists.openembedded.org>; Tue, 16 Jul 2024 02:30:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721122241; x=1721727041; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4EeM3m3suzVDuEZhyt3TFOLSxadM0btG5SDdJCn/iUw=;
        b=GRx8LxPGC6ae2rIprA6XFqRo4FmIsx91XaC2evxEcTdZQS81y7YKtYBsiMEFayGLtw
         Wm09VRWaKcr6tvMAjNszgbBvA78IanHoRCL92SMMaQzdUx4ii8C1gtaC9Irv6EIZb+Rc
         8Kx2yDMtAj8qPRA7c9x55Y4DB8eX2pOryXs+UcEdCdYTx9bM/HxLy7pUdGpOmSyR10yh
         qKVHm2OQ7bfPT9+l8cBB4tI7ipLE3NkY625qWpAEESDfy700/Sebdk85/bxDqMPrtvO5
         TozkEdiskHj2Zvbd2fBHo2Zz1xqT34wztDDHVhApfrLIAO/55pbuTFh7ZmQB5wMABeC/
         cRRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721122241; x=1721727041;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4EeM3m3suzVDuEZhyt3TFOLSxadM0btG5SDdJCn/iUw=;
        b=mueRBvqhQM6EDnzr9ftpcJKMrQsENspkpOJUHNw3IlIscstb69uk05YXX/8Z6LerV5
         bC1lFYSt5FRriJdqJhXLPFiXC8Z/5gMxjcWDw6TO+9opXg4wSfm1F78Qm1xtyiklUmFL
         pd7g28CoFdWlxh+voARn41mVyx47LeRwdTVACkeYbZkkB+Qkk+q4Kzy4o6fNx+J3PXMx
         o29mtZlJBg5seomZEFD00Nxr4mvlQRnTsPlGnP75RRCzonrMIq54UPHU5V8BIYskOo5/
         kfRykf5jj6kLgEKergMfGmLJza2NPh5ktdq+dmfcsF1upmXUmat06N2Id32QNdE4Rv81
         kx3w==
X-Gm-Message-State: AOJu0YxvITLgQww9LSmZLnX/3uXbfQBL7KWMJge1IobPv3Sx17pEk+x+
	HTUuxgs2r4Afl/Ni+LMnP8hYjDkfy5NUTqGtRM5oTJUfaK/3fqk0PnHr+A==
X-Google-Smtp-Source: AGHT+IFCrrpUKIx4peuiVaFUxT6ZLN1Gko/X9RVMDZBQgrqQclPBETRhh4uTffXqrBDeVPLx3JDN7g==
X-Received: by 2002:a5d:6a4c:0:b0:367:95a4:fa90 with SMTP id ffacd0b85a97d-368261029ebmr823948f8f.16.1721122240698;
        Tue, 16 Jul 2024 02:30:40 -0700 (PDT)
Received: from toster.lan (bl15-243-112.dsl.telepac.pt. [188.80.243.112])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3680dabef75sm8561308f8f.36.2024.07.16.02.30.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jul 2024 02:30:40 -0700 (PDT)
From: Jose Quaresma <quaresma.jose@gmail.com>
X-Google-Original-From: Jose Quaresma <jose.quaresma@foundries.io>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <jose.quaresma@foundries.io>
Subject: [OE-core][PATCH v4 2/3] openssh: systemd sd-notify patch was rejected upstream
Date: Tue, 16 Jul 2024 10:29:54 +0100
Message-ID: <20240716092955.2463-2-jose.quaresma@foundries.io>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240716092955.2463-1-jose.quaresma@foundries.io>
References: <20240716092955.2463-1-jose.quaresma@foundries.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Jul 2024 09:30:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202090

Still side effects of the XZ backdoor.

Racional [1]:

License incompatibility and library bloatedness were the reasons.
Given recent events we're never going to take a dependency on libsystemd,
though we might implement the notification protocol ourselves if it isn't too much work.

[1] https://github.com/openssh/openssh-portable/pull/375#issuecomment-2027749729

Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
---
 ...001-systemd-Add-optional-support-for-systemd-sd_notify.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/openssh/openssh/0001-systemd-Add-optional-support-for-systemd-sd_notify.patch b/meta/recipes-connectivity/openssh/openssh/0001-systemd-Add-optional-support-for-systemd-sd_notify.patch
index f079d936a4..a0fe5a2773 100644
--- a/meta/recipes-connectivity/openssh/openssh/0001-systemd-Add-optional-support-for-systemd-sd_notify.patch
+++ b/meta/recipes-connectivity/openssh/openssh/0001-systemd-Add-optional-support-for-systemd-sd_notify.patch
@@ -6,7 +6,7 @@ Subject: [PATCH] systemd: Add optional support for systemd `sd_notify`
 This is a rebase of Dennis Lamm's <expeditioneer@gentoo.org>
 patch based on Jakub Jelen's <jjelen@redhat.com> original patch
 
-Upstream-Status: Submitted [https://github.com/openssh/openssh-portable/pull/375/commits/be187435911cde6cc3cef6982a508261074f1e56]
+Upstream-Status: Denied [https://github.com/openssh/openssh-portable/pull/375/commits/be187435911cde6cc3cef6982a508261074f1e56]
 
 Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
 ---
-- 
2.45.2


