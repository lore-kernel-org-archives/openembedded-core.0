Return-Path: <hiagofranco@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B59DC36008
	for <webhook@archiver.kernel.org>; Wed, 26 Mar 2025 20:30:22 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web10.33438.1743021014761133862
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Mar 2025 13:30:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MXdoDM+k;
 spf=pass (domain: gmail.com, ip: 209.85.216.51, mailfrom: hiagofranco@gmail.com)
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-301c4850194so263130a91.2
        for <openembedded-core@lists.openembedded.org>; Wed, 26 Mar 2025 13:30:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743021014; x=1743625814; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XcblzPkIQmO1a5dxR8uhp/bBxygr6l3Ox/zbi+gcr3c=;
        b=MXdoDM+k17X7W3SapcWboEvjiEoo3A3b0vLePyoGmeziYkyeHBdwZh+H7bIH3i+w4K
         aDWGKocwQs+uVtOjMdjuqLfm0qvCMtcQvf9jm/SC+VF4+gX5ZhZWzB40gwtvBdddltET
         CvsHjwm2UYSQQxFIaLNTVBFPSxq5OM4PHuMpZhXT3nq8iBwhBp4DQy+cXxfbzFZJfXB2
         vy+Dtc1piuksYMqcP+AMvqa+fDN7nxsRTx4X+tzQSp4juTlt1R0i8rxq0EyPNW7ghMtw
         VuSJY5LukDfvFNp43NFqmOAVAeGQu8jO2yNFjpvIOZx7cH/YK3LeE4aa266tOTaArF4Y
         02kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743021014; x=1743625814;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XcblzPkIQmO1a5dxR8uhp/bBxygr6l3Ox/zbi+gcr3c=;
        b=TsDxICW4jHRh0u8/gh/OxsX231UjcJCvqR/rT/BfDC/GnR83q53Ybs/2X3xRdDrBX5
         wjqECJxiJ2n6bbn9iBxrO8yYmk6oePsBEk1pO7H/kfmg0tH/h90i0DfAjVikI/FdRspQ
         rstKt1gLPNAZ/BGKCo7TZoc2DitZ+tHbKrsmOUSw/0pSoATkpdQTDTwhdvsqQyUe6BWL
         sk/yVCnoel+j2mCLiszcmdy+mFv20v7DXiaoslXt/rarhVh9FWwnZzF2RwenE4IXPlGE
         qSWp8syS/d5mMWwX7SWgoiqYiA0bnCWcf/FrIfd2eclquMh71Qfs1U0zpvnIf4onsEbw
         v5TQ==
X-Gm-Message-State: AOJu0YwYZOkZbY11Dp4u7M72JgntDJi1YLAJeP+ZvPkFp694sEazENW1
	3VbA2lp5XyxM7UjsJ66fNJEPjurRbMoAizFGev1FdT7TP5PC/d2+uXcS7RWE
X-Gm-Gg: ASbGnctj6WYA+4gcf+xYLN43GNuSsPUVqKmcbM90dgfQXm+YBFs+xi0EIDL2sSuUYnR
	eD5Xj9FAJovRBKOaomUS/pdEDNI1bbwwuSXPefi/kVZWZvUrZDcajidMk5L3qZW9K8jXjqDr463
	WegMWVm6JmYxOXgJjG3vmEjmkVywN4tJ4arjyj3VKv5R31C1Os4sgPnrP+WuSWdTKwT1IO9t14S
	u/omLlAbz0G3zCNgEhRXSTsbxotiah5LDj/LRXnWwF3dLLW7usyr5I8RzrSDLnR+nEh5C4poR47
	axkZNGP7Tu5P37x4B/p3Jio2M9xumxrVNNxqGlrqkTiymxTFPJ5bQAESC9Zek0cJiW0=
X-Google-Smtp-Source: AGHT+IH+nWHWtKy4/e6s8NZicmiqagtxRzLev0x/GFriII740ZVhamOk2xZ3JtT0l5fpRMKmxmfS7A==
X-Received: by 2002:a17:90b:4d88:b0:301:a0e9:66f with SMTP id 98e67ed59e1d1-303a7e6dc51mr1700622a91.14.1743021013827;
        Wed, 26 Mar 2025 13:30:13 -0700 (PDT)
Received: from hiagof-nb.corp.toradex.com ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3039f1d4b6asm661625a91.38.2025.03.26.13.30.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Mar 2025 13:30:13 -0700 (PDT)
From: Hiago De Franco <hiagofranco@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: quentin.schulz@cherry.de,
	steve@sakoman.com,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Dmitry Baryshkov <dbaryshkov@gmail.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [styhead][PATCH v2 27/31] linux-firmware: fix qca-qca61x4-usb package contents
Date: Wed, 26 Mar 2025 17:28:13 -0300
Message-Id: <20250326202817.64437-28-hiagofranco@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250326202817.64437-1-hiagofranco@gmail.com>
References: <20250326202817.64437-1-hiagofranco@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Mar 2025 20:30:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213687

From: Dmitry Baryshkov <dbaryshkov@gmail.com>

The NVM files for QCA61x4 USB chips went to linux-firmware-qca-misc
instead of -qca-qca61x4 because of the c&p error. Fix package contents.

Fixes: 93b3d61b657c ("linux-firmware: further split qca61x4 package")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 19146220a57d4829c18e8860e85b2843aafd901d)
---
 meta/recipes-kernel/linux-firmware/linux-firmware_20250211.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20250211.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20250211.bb
index 695788e31d05..ec5329760acd 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20250211.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20250211.bb
@@ -666,7 +666,7 @@ FILES:${PN}-qca-qca61x4-serial = " \
   ${nonarch_base_libdir}/firmware/qca/rampatch_0*.bin \
 "
 FILES:${PN}-qca-qca61x4-usb = " \
-  ${nonarch_base_libdir}/firmware/qca/rampatch_usb_*.bin \
+  ${nonarch_base_libdir}/firmware/qca/nvm_usb_*.bin \
   ${nonarch_base_libdir}/firmware/qca/rampatch_usb_*.bin \
 "
 FILES:${PN}-qca-qca6390 = " \
-- 
2.39.5


