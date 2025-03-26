Return-Path: <hiagofranco@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29D95C3600E
	for <webhook@archiver.kernel.org>; Wed, 26 Mar 2025 20:30:32 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web11.33390.1743021024645337438
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Mar 2025 13:30:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NsPDv7KT;
 spf=pass (domain: gmail.com, ip: 209.85.216.53, mailfrom: hiagofranco@gmail.com)
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-30384072398so302624a91.0
        for <openembedded-core@lists.openembedded.org>; Wed, 26 Mar 2025 13:30:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743021024; x=1743625824; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NwJSWl8R+//NHAm8hK0Arx3cJYX4NHrm6Q7kjOuOrsI=;
        b=NsPDv7KTFlVEiQ2/3YvTJFj1TLLk9lf8vHBfEYCCZXlDgv94JM8xQzgw3AJQTWXrSH
         q0mJlKj073cDBAr9UV4uykFTEayP9kw/mawNwEpdNQWrskcW8a/3s6X5Ps6+gw9F+caf
         2t/DVrvDFbZKXHgN6+X3U5Y1GruaC/jN4ib2mIQGnmouJ8jyU1Dd50dd11vc2/FxtWlB
         gxrKzCbrH5W2FKHvcWDKvyCTmPwNKonTNwFiwq1+A3cFQMqKus1VURNC0FuOpATEiJfj
         C1/qA3w+2xwHk14CnO99bvDypUz6d17NEaM0shHeaJM+sJ8dtkd6zg8tdfTufOO1EOG+
         qXNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743021024; x=1743625824;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NwJSWl8R+//NHAm8hK0Arx3cJYX4NHrm6Q7kjOuOrsI=;
        b=aWILtYq2irVoP2xEEYgF0Jfxqc52pmNV3DrX0Jx0S3kWqd5X6nA3efCTOmCScTL28O
         B7dEoCmDymtWzVJqaaPS25tZeQ5LWDB693yEqRvHqyL8PfBeJO0MIpGs+SumFT6NY/KV
         WsxDmA7zEo7RWYujJyhyjAOXelljfLg1iq42l5dBePMkpRJ++ij2mfg93mTuZF4NytMV
         PrMEV/z+vE5JnENLlnKScUXOnN5WOdqwC3hWWANxoO6ty2totkLFUhBDq+/YFU7W5HlJ
         1kAK3HjViaBNbKgvdajLZFLAHJ785eh+dPgMHmWLYUEcecjaelPzweo3/glOlctccdGZ
         cdSA==
X-Gm-Message-State: AOJu0Yzi82tw0Kq8iHDN7W+N0leqyDeq4+okaXaWByBtA95ztW20GPbA
	VXv0kVuxcf0ke49VB+Cm1g3FLkIyT/sj+qhKEUy4eD7s9OFH68CPt8G6x+t2
X-Gm-Gg: ASbGncv2807ifWntVopjUuV9stXZmD0OIVU4XPsM38G86mEVKL+6rd741NnmzUsiDvq
	HrgDtoVnzTGID+EUKPVg6pOlCYDhSKGGvXp0kPFfQBM7poom7dbPGSRRf4m7cLeYv5gDVK9DXot
	AP+I2HZUvbSuyb0qmz1f0TH6w/yhTrzMTW/4vyzWhZqGTpRWVX8JlmIhaVnAqyuXAJeZL7cYxv7
	cVNK4M/Uh1uUsUwKkf5QHT/3AOMJrXROT+db9XtL9djnHVauj5eutNQl2VLJ0PtNsIp/aCRnCAB
	08at4jyF4LIin9bIP++0pBbK6ujSa172LwKkiuNripq9z78SmRWcyfb53h7k4rNi/JA=
X-Google-Smtp-Source: AGHT+IFDZ2YZYjugwRg7fvU4EAz7NbUSuOIdoi7cyRRMXIl7U3ZzykiidQSn5w93sKvC/AMjxfj39Q==
X-Received: by 2002:a17:90b:2d43:b0:2ff:7ad4:77af with SMTP id 98e67ed59e1d1-303a806511bmr1322383a91.20.1743021023761;
        Wed, 26 Mar 2025 13:30:23 -0700 (PDT)
Received: from hiagof-nb.corp.toradex.com ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3039f1d4b6asm661625a91.38.2025.03.26.13.30.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Mar 2025 13:30:23 -0700 (PDT)
From: Hiago De Franco <hiagofranco@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: quentin.schulz@cherry.de,
	steve@sakoman.com,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Vivek Puar <quic_vpuar@quicinc.com>
Subject: [styhead][PATCH v2 31/31] linux-firmware: update qca-qca61x4-usb package contents
Date: Wed, 26 Mar 2025 17:28:17 -0300
Message-Id: <20250326202817.64437-32-hiagofranco@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250326202817.64437-1-hiagofranco@gmail.com>
References: <20250326202817.64437-1-hiagofranco@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Mar 2025 20:30:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213691

From: Vivek Puar <quic_vpuar@quicinc.com>

The NVM and rampatch files for QCA61x4 USB chips went
to qca-qca2066 instead of -qca-qca61x4. Fix package contents.

Signed-off-by: Vivek Puar <quic_vpuar@quicinc.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 15f256962f2b0f64c887137259a7f96cdac63150)
---
 .../linux-firmware/linux-firmware_20250311.bb               | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20250311.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20250311.bb
index 1a2a6b095e1b..675d37837662 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20250311.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20250311.bb
@@ -668,6 +668,9 @@ FILES:${PN}-qca-qca61x4-serial = " \
 FILES:${PN}-qca-qca61x4-usb = " \
   ${nonarch_base_libdir}/firmware/qca/nvm_usb_*.bin* \
   ${nonarch_base_libdir}/firmware/qca/rampatch_usb_*.bin* \
+  ${nonarch_base_libdir}/firmware/qca/QCA2066/nvm_usb_00130201_030a.bin* \
+  ${nonarch_base_libdir}/firmware/qca/QCA2066/nvm_usb_00130201_gf_030a.bin* \
+  ${nonarch_base_libdir}/firmware/qca/QCA2066/rampatch_usb_00130201.bin* \
 "
 FILES:${PN}-qca-qca6390 = " \
   ${nonarch_base_libdir}/firmware/qca/htbtfw20.tlv* \
@@ -741,9 +744,6 @@ FILES:${PN}-qca-qca2066 = " \
   ${nonarch_base_libdir}/firmware/qca/hpnv21g.bb8* \
   ${nonarch_base_libdir}/firmware/qca/hpnv21g.b10c* \
   ${nonarch_base_libdir}/firmware/qca/hpnv21g.b111* \
-  ${nonarch_base_libdir}/firmware/qca/QCA2066/nvm_usb_00130201_030a.bin* \
-  ${nonarch_base_libdir}/firmware/qca/QCA2066/nvm_usb_00130201_gf_030a.bin* \
-  ${nonarch_base_libdir}/firmware/qca/QCA2066/rampatch_usb_00130201.bin* \
 "
 FILES:${PN}-qca-wcn7850 = " \
   ${nonarch_base_libdir}/firmware/qca/hmtbtfw20.tlv* \
-- 
2.39.5


