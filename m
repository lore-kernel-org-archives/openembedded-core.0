Return-Path: <michalwsieron@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34260C88E72
	for <webhook@archiver.kernel.org>; Tue, 15 Sep 2026 00:11:02 +0000 (UTC)
Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12265.1789431057008268826
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Sep 2026 17:10:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=NYLg4oKz;
 spf=pass (domain: gmail.com, ip: 74.125.225.76, mailfrom: michalwsieron@gmail.com)
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4843c3ea1f6so1173583f8f.0
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Sep 2026 17:10:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789431055; x=1790035855; darn=lists.openembedded.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=jQ8y9+Llfhxjpz1f42CSdUkgHHAMrHfxHqCoXSV8jYI=;
        b=NYLg4oKz9UzH3MmXT4eAKeJCa4Xla1yndNX2AdeYP4l0Q6mMAN/pV0VfYs2dxhrmHo
         TZzxiuhTMu8uXJaEL0SrmpIXWwAUvIblHkGbA+Hem7aXJVrSUg+gP/34ftAXHZ56p5OI
         d7zp8iEbevkRVn07moersL3tXmgT29mDagBTMTE+lMFgcP1V7l9y1lbrxlMFziBTBWH4
         AyuOiKuCbc/XLvSn82Qcu3TTuHxJUAxFbUbWeIAvuy3a/ZzAYp9q++8LSicRIVkgsF/q
         zFf4BBv1IheEVz/kAr+9va9NBOtyEW2oVEQfLPkOqGAxzcRBds/7wW0Oy9KfNP8Y4GD2
         n+1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789431055; x=1790035855;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=jQ8y9+Llfhxjpz1f42CSdUkgHHAMrHfxHqCoXSV8jYI=;
        b=0wPdKP8B0hbUGJzulLlq8jbQnocY5q+dBSKcrunu32GjAIzNuX4yT+5m5f2gdM6HeE
         FCwJ7+yTIIwT7nm6QDPzWaQAaFbZ1R0vsNc7psjQy/+uOEphqP/onlwTEJqP43lg9Bu6
         5/XVf2mFsBn01OXiuHAR1Huup/zp5b60vJYRZkbii7LPJTxEoJxekEUU2ypw6WDMKSjd
         ZzSUqNa8aXaQH7V9CaC67ZQTY1S/buEphkJaCbPbiNp2p7Bt0tq6iAPwbf5nOFYRX5oN
         y+wpdLX86nPDqnOOP4deE6bdsiDMJYrseVD/ZgR3x6VoZoZ4JD/KBOVW5bTOTgov4frf
         II/A==
X-Gm-Message-State: AFuF++l4NUWki8vdhsnnmkZI35HF15qCn+q3nYa66MS30/gQo/9GhrD/
	+x0GnLfZ2WCd3EHUuB2m0s8Jw4th8Wo+WsNK7NXZDdpDQ5kXZrzcLqNU
X-Gm-Gg: AYBFou1A3LezIWIbgL0k6QapPSSeYOxIMv1XtehTNmowF82ZBrgAUPSP3JP+Wi0fj/J
	v25oruvlmu8PWXCMSWEEheKielthmtou/qlpw27pcV7y2KdS8qEhn9CT5ofUE7/eqr7HhAV6Nbl
	U0y/oWLrHGAyj+lWfZapVFNfrUXnw3/aMzy8/M3ZDLJ/Y00ZW7Biudcy4+VIUkAdPdH26S8DuPt
	EyiUTg0dWBp+Uyz7/3ZGxWeJ+z0vZf13QqrElgQk8urISRLXQTcCvgIgmmi9klmH7eowR+eDZn6
	Em8m7/6N6ztG1oxvWftXmynTIePQVpySgKgaGq7NZQDLcW0m1Wp7tG2DLWYPyscOdjhcTlwQuH8
	BYy9DkXU6P3+Mi/uF14+mnYiEcqPzERMU7cVRIOuoahgwmXd5trVBnSuCONC0cATuNngIOwUjRl
	kW1fNnGGbZR533wi9cf86LCk9J2AgLdwk9vhcrzQEuC5dvvNcMsjN49lkobtTMUC7rAJuHsMI2U
	A==
X-Received: by 2002:a5d:5f8e:0:b0:485:8a46:b3ce with SMTP id ffacd0b85a97d-48702b8316dmr5350549f8f.54.1789431055049;
        Mon, 14 Sep 2026 17:10:55 -0700 (PDT)
Received: from [127.0.1.1] ([193.28.84.166])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb2ed106sm29287221f8f.1.2026.09.14.17.10.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 17:10:54 -0700 (PDT)
From: Michal Sieron <michalwsieron@gmail.com>
X-Google-Original-From: Michal Sieron <michal.sieron@nokia.com>
Subject: [PATCH 0/6] Some PACKAGECONFIG related changes
Date: Tue, 15 Sep 2026 02:10:35 +0200
Message-Id: <20260915-msieron-some-packageconfigs-v1-0-44dcf1145d3d@nokia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPyMqGoC/yXMQQrDIBAAwK+EPXdBRRLMV0IPxq52W6LBTUoh5
 O+17XEuc4BQZRIYuwMqvVi45AZ96SDcfU6EfGsGo0yvnLa4CFMtGaUshKsPT58olBw5Cbo5DoO
 xylndQxvWSpHfv326/i37/KCwfUs4zw+5J+XRfwAAAA==
X-Change-ID: 20260914-msieron-some-packageconfigs-9bf772409416
To: openembedded-core@lists.openembedded.org
Cc: Michal Sieron <michal.sieron@nokia.com>
X-Mailer: b4 0.15.2
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Sep 2026 00:11:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245799

A bunch of PACKAGECONFIG modifications we had laying around, that I
believe could land in the recipes themselves.

Signed-off-by: Michal Sieron <michal.sieron@nokia.com>
---
Michal Sieron (6):
      iproute2: Add subpackage for dpll command
      libmicrohttpd: Drop libgcrypt from https dependencies
      pciutils: Move DNS and SHARED to PACKAGECONFIG
      qemu: Move pixman dependency to PACKAGECONFIG
      strace: Add PACKAGECONFIG for libdw unwinder
      ethtool: Add PACKAGECONFIG option for pretty-dump

 meta/recipes-bsp/pciutils/pciutils_3.15.0.bb               | 6 ++++--
 meta/recipes-connectivity/iproute2/iproute2_7.2.0.bb       | 5 ++++-
 meta/recipes-devtools/qemu/qemu_11.1.1.bb                  | 6 +++---
 meta/recipes-devtools/strace/strace_7.2.bb                 | 4 +++-
 meta/recipes-extended/ethtool/ethtool_7.1.bb               | 3 ++-
 meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.10.bb | 2 +-
 6 files changed, 17 insertions(+), 9 deletions(-)
---
base-commit: 225db9c0df20fdf07479c6d0b992dd52fe2a8464
change-id: 20260914-msieron-some-packageconfigs-9bf772409416

Best regards,
--  
Michal Sieron <michal.sieron@nokia.com>


