Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBC25C7618E
	for <webhook@archiver.kernel.org>; Wed, 26 Apr 2023 09:50:57 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web11.3969.1682502648892879688
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Apr 2023 02:50:49 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=PDooR+tH;
 spf=pass (domain: gmail.com, ip: 209.85.221.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-2f46348728eso4175849f8f.3
        for <openembedded-core@lists.openembedded.org>; Wed, 26 Apr 2023 02:50:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682502647; x=1685094647;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lwtd56FmyDMg0/VoBrXJRtJbmxAJNoHagbPHATeicyY=;
        b=PDooR+tHR2b8y9gvlklO/CGOEjYFixQwacoIW3nU1qAPuavFNbwMTn5qXpH1Zj2JuY
         QKX8rKuL3dDiX0GFyy/oZ7FaWHByVnc8l1abWoRiIIcDPXvzQ4bFXfxHKL6IQ5kh5/c+
         zHJLelW7ysKBu2786NatyYuNNq6TRoHDnDNkNEtc3+P/1Tw/DQjPLYUqTffRCNYPdvsz
         cPyulJbSbjvqZ5xRAKGSazW7zldUa4GOWKxHiE0VErWowRf9vNYd/UBC79sqHYzoz+BX
         +nL8YOEhssFl/vqEeIGpoAMRpAziYU4fbMY6Cod5sVWBZre+C6EAye9jQ3T/mFNH0LkS
         1MMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682502647; x=1685094647;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Lwtd56FmyDMg0/VoBrXJRtJbmxAJNoHagbPHATeicyY=;
        b=TMbein/Hk9pjv+ExVeF2DHkvpFFzJMJ/q1WZvHv5L/rJ9BD0MqvgkEpDr0/RhgfmyX
         l4g4Ut7cQPg30NpwRiKyUJN74rAmBG47a9jVuGbO4SE1R5P+uO5PvzXUeZ9C2lsKHn5n
         6ijXNKfJbflz8/+QzYqM/u+uBJt8PrCuWXeFwxFsURKxukOjpEY0DNPPUROzHCsPW0JT
         Rp512DqszBA0ZIWdqOsc9MiHaGV8oYx96qPfvtyDyKYQZ4AayZTfIp76tTxZ5BtQz2RY
         4FvlN/e5enZnSHmQbTZiXPGM2tRHB0tdut/Bgd7+rMJ5bJZmE1f2eCzHspAObEsKI6WY
         VdyQ==
X-Gm-Message-State: AAQBX9fgbvAkW+tfAc4rtgrDhaygCl+IIO7o8DrmaMKWFNirpbQG5eoY
	kUILRG3o9k285rWtGpRzZdNLjRLQIMI=
X-Google-Smtp-Source: AKy350bvQSTbaKaUbrdaNvrVddCY9jEcIxkj13t7nOrxInItN8wYMBVFTQgvOwzZrajfTxlSJo4H8A==
X-Received: by 2002:a5d:4f8e:0:b0:2fe:d6a1:f377 with SMTP id d14-20020a5d4f8e000000b002fed6a1f377mr13124180wru.33.1682502647421;
        Wed, 26 Apr 2023 02:50:47 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id o22-20020a1c7516000000b003f18372d540sm17242867wmc.14.2023.04.26.02.50.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Apr 2023 02:50:47 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 09/11] defaultsetup: Enable largefile and 64bit time_t support systemwide
Date: Wed, 26 Apr 2023 11:50:34 +0200
Message-Id: <20230426095036.2632847-9-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230426095036.2632847-1-alex@linutronix.de>
References: <20230426095036.2632847-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Apr 2023 09:50:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180427

From: Khem Raj <raj.khem@gmail.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/distro/defaultsetup.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/distro/defaultsetup.conf b/meta/conf/distro/defaultsetup.conf
index f6894f3ab56..1abb5096293 100644
--- a/meta/conf/distro/defaultsetup.conf
+++ b/meta/conf/distro/defaultsetup.conf
@@ -2,7 +2,7 @@ include conf/distro/include/default-providers.inc
 include conf/distro/include/default-versions.inc
 include conf/distro/include/default-distrovars.inc
 include conf/distro/include/maintainers.inc
-
+include conf/distro/include/time64.inc
 require conf/distro/include/tcmode-${TCMODE}.inc
 require conf/distro/include/tclibc-${TCLIBC}.inc
 
-- 
2.30.2


