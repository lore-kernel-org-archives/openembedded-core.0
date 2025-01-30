Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14954C02190
	for <webhook@archiver.kernel.org>; Thu, 30 Jan 2025 16:11:31 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web10.18980.1738253484373578659
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Jan 2025 08:11:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jFL2+lMC;
 spf=pass (domain: gmail.com, ip: 209.85.218.45, mailfrom: alex.kiernan@gmail.com)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-ab2bb0822a4so219747166b.3
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Jan 2025 08:11:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738253482; x=1738858282; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PCDXEOQtY1XVSW3b+pZQWEyAEVUUaZEfrumHr0rVgnA=;
        b=jFL2+lMCwWIhgJJ7ni8h7kCJoO1emvd/X0XjjDbBy7NVGgqONgrDpY0BZH/Jj3AmwS
         AiqhIjYtb4lOi5g2BJH8SPebsXK9ZFQQnkppVEob6Ga/o9nvy6l86AIYmWnwjglu3Cy8
         iclNtHFZabwBMCxR9FhgrLk1A1SccGdRgdzmS1rKKr50C1/uuuAialgreUxIGcz8UfKh
         7LQvy3+KlcLRRusd3Z3jDAVVO1oNKd35rEuAmSVgoXhehRaR4/D+COH5Z7VO5S2BWNdx
         YqPgCcfcb8hXiBCG3rRlLf5yJj2qek8AocLx6//hrEo/cRz5swo/JSrU1zaXyDJExiCc
         OqOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738253482; x=1738858282;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PCDXEOQtY1XVSW3b+pZQWEyAEVUUaZEfrumHr0rVgnA=;
        b=a5pZuZvkHDysl5xN8KL4KydMoPmQULeMc84+ES+quMmmOqSYRAa/W5ETwDoP7RMJ8C
         cj6O0VuhCneNz4tFoQuLUrb6d4m5ORfwMuRNCagzOnPUsE29VPlSkbliMLg47FPgKulU
         69LtpxGlMTqCP/SG7Cmx7nR1NbPrmcgK74Ouc2o5pHz3mj5vsGvcf2Tv/AnYW7d3c+nJ
         DHv1pfMKib8x+OnF488LiNhPyfPoTpUPBah48m7DBI2Lc2S5AaRndUNG6tDZAsFqd538
         ecsRrBhoi/9k/J/ugFjkp4gciaq3vTdfTPz6a7uw+BzdDGht/mSC7R/sSeNX7byxp1xG
         qadA==
X-Gm-Message-State: AOJu0Ywz+7nLQNz2uHb3maSBsDQvtouxDP+NT1D2btgGdruLMBWFdAgY
	X5R4aSNXFVxq8fpKhcmSjtC0jGjYk0IFUi8UmkKsl/NkNDpPoXND7cHSyoP6
X-Gm-Gg: ASbGncuETt3DaiUE8Ihq1WCUD9l5HlBdwxOMl4P+TSpC7YvYgyvNW0k2C8Ja1PO3X9m
	fw3FwxU3st7k0zxROcPkV4OpTI3Ir8t8sUmVoBU77NR6RWimLx2we9CUipy7qvhYn5tX+kDVca6
	T+wpHn7gLLbgw3Ujp5DY0Q6nk60KxhaG9xWH+CLOEbDzuAAzGUq+20TCT9uxg79v1GksEGU8wR1
	mGNCNKNxl/99iyDHATCeMdJ+UTCZXtVP9cnG6K3fnR6l44WsR/mubKkms7qSV6CGWNAyEpVo0Si
	qoA1zOeP5UXXS3a01cxXf+6gfS9YgGpwqP2vctRjS0k1yfG3EO8s/+Y/OKA=
X-Google-Smtp-Source: AGHT+IFn/f0R01i/WOyIE4sFrHLEofrqs4eg8wSRzedf/orHuktIvWpyQmXZxYZ70fX4yBPEpDj0xA==
X-Received: by 2002:a17:907:1c13:b0:ab6:36fd:942a with SMTP id a640c23a62f3a-ab6cfe27037mr867299666b.50.1738253482254;
        Thu, 30 Jan 2025 08:11:22 -0800 (PST)
Received: from ip-10-0-0-134.eu-west-1.compute.internal ([2a05:d018:db1:fb00:c4f8:7a97:b7aa:1bfd])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab6e4a34be6sm141556366b.158.2025.01.30.08.11.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jan 2025 08:11:21 -0800 (PST)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [PATCH v2] linux-firmware: Add RTL8723DS blobs into ${PN}-rtl8723
Date: Thu, 30 Jan 2025 16:10:25 +0000
Message-Id: <20250130161024.483297-1-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Jan 2025 16:11:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210462

The Realtek 8723DS WiFi blobs are under rtw88 and the BT blobs are under
rtl_bt, add both those into the rtl8723 package.

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---
 meta/recipes-kernel/linux-firmware/linux-firmware_20250109.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20250109.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20250109.bb
index f0b710a6cc6a..36fbe5dd3c36 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20250109.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20250109.bb
@@ -1238,6 +1238,8 @@ FILES:${PN}-rtl8192su = " \
 "
 FILES:${PN}-rtl8723 = " \
   ${nonarch_base_libdir}/firmware/rtlwifi/rtl8723*.bin* \
+  ${nonarch_base_libdir}/firmware/rtw88/rtw8723*.bin* \
+  ${nonarch_base_libdir}/firmware/rtl_bt/rtl8723*.bin* \
 "
 FILES:${PN}-rtl8821 = " \
   ${nonarch_base_libdir}/firmware/rtlwifi/rtl8821*.bin* \
-- 
2.25.1


