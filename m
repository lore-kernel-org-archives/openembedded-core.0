Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78DA3C282DE
	for <webhook@archiver.kernel.org>; Thu, 13 Mar 2025 14:13:41 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web10.15930.1741875217844042176
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Mar 2025 07:13:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XQUUzVHS;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4394a823036so9421195e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 13 Mar 2025 07:13:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741875216; x=1742480016; darn=lists.openembedded.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OfPq8ADtLczjXP81fqQzVSfXjG9XXgOKnR8xhbEJKJs=;
        b=XQUUzVHSGHpTgv/ZjYwcZTe3Pgwx1Opl/DXJSF+CqLVsmASeRY24jCUfdupTlNSpJM
         KMdG5ds0TkHiFU8mC/Bwp+fDWuXzzIGnZohGBCNd2eIa7rFZdX/eFV1b+Hklg0c03ztM
         LphdPTiE1J5ViStaF0sn/F8siVjMGikDa/Ad2gfRtXH611ArLJ4WzYnI1HRtpCJcyGkc
         bgnz4VrOO1zvvm0FaBv5+Q/4rU3HW8zuVsOgd6rGe2dKxBELdWsR5D6yS3bi/xEoXL2Q
         SbWoSUMP3CxP1xwqTfny5buYXjVxwpCUWTHqLJZI3nlK9om/ZvlKVEWTtwVBBpXViDaA
         CbJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741875216; x=1742480016;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OfPq8ADtLczjXP81fqQzVSfXjG9XXgOKnR8xhbEJKJs=;
        b=tsScyRiAJk2B2bVOcEDG41iHbk5kaD+bAcyI2nM+8KyQpm4BnLNHeHzcGADgThkl31
         p9yM3e+7eyOUFRz1uvBCL2DXrbivUFLNAc5ZHzcJ/1Dmazgd79X1EmswcfL7nc7X4NoD
         mr4W+E1Ge5YXHSytsB1hdEUQVHTiOTl86h5G03/r1V38Vj59FIM9ngDI7CLlyVcQXyPt
         5uZZ7zWQjFgjrfkVPPwHzY7pMpU94/g+hpTiwxojMDNEUe7WyxS+LB5T/yCwo+NnFi22
         99vTNjaZfB0KTNSh2Rau47YJZGArdp7Fa+xWZg8tsWQyz+Dgx+lztZZFzHgLorY0FELg
         sxjQ==
X-Gm-Message-State: AOJu0YxL/16KbMi44zBbSZj2EyBluS4ce46nyAXS5GzzDw5huskI79Rz
	sEQIJ4vb05WyhTQZonGBEgDNsCZYJk2H4QF9oJFvTFUyBH60xKB/aOqfGcng
X-Gm-Gg: ASbGncs8ovN+vkQzVOn+LTvzNTb1oj4Cenz+xHAMUIBs58jRzKAvDIIOc6xnfZP7shD
	MnyR5QPstO4fmo9qEoMpfX+65HIaX5WgzJfRFX199VcVR8wITBubgWvzZBY7YHY8JWLsdGd0A7V
	FbW2oXGk8n1BWoZ1p1U8JLpFU7847SLvYwGIPuIsO1WyKenjABD61RCBc0GFSLpdrM/A9OsxHyj
	sgmoBtB3sNQC0uaOmtwrhEY7g0D2ytak5/uRrA75ZAPkYk7depIheTShMqcLzzg+gWBdDxDFrw6
	taF6Y/toHp9ssoJJWWEpnVXhnG7SEX0D75YZmJvoZ2ekHnutNguq8uVB1qTooXyLjZ2VZRG+HAe
	BtPVQ+NMP1IgzjRrWjt4EGg==
X-Google-Smtp-Source: AGHT+IEcaA6n/2P3TQWVVv4CS5xOF1990DjwBv4QSXpms8xgaS1DXxis3am5bxg8V7E+HC4LnhHpwA==
X-Received: by 2002:a05:600c:4f02:b0:43c:f87c:24d3 with SMTP id 5b1f17b1804b1-43d01c121bbmr102017065e9.20.1741875215477;
        Thu, 13 Mar 2025 07:13:35 -0700 (PDT)
Received: from ip-10-0-0-134.eu-west-1.compute.internal ([2a05:d018:db1:fb00:c4f8:7a97:b7aa:1bfd])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d18a4c613sm21845565e9.40.2025.03.13.07.13.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Mar 2025 07:13:35 -0700 (PDT)
From: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [PATCH OE-Core v3 0/4] Upgrade kmod 33 -> 34.1
Date: Thu, 13 Mar 2025 14:13:20 +0000
Message-Id: <20250313-kmod-v3-0-a8b5d73c83a5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAHo0mcC/0XMywrCMBCF4VcpszaSTmxBV75H6WLIpR00TUk0K
 CXvbqwLl//h8G2QbGSb4NJsEG3mxGGpoQ4N6JmWyQo2tQEldlK1Stx8MIK0Us6Q608dQr2u0Tp
 +7cww1p45PUJ872rG7/oHnusUydgflFFIga1Ums6EPZnr5InvRx08jKWUD81IJQ2gAAAA
X-Change-ID: 20250313-kmod-ac33fdaf6452
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
X-Mailer: b4 0.14.2
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Mar 2025 14:13:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212771

Bring scdoc in from meta-wayland to support generation of the manpages. Convert
to meson from autotools. Clean up usage of kmod in eudev.

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---
Changes in v3:
- Fix maintainer for scdoc
- Stop using autotools in scdoc (it just has a Makefile)
- Set upstream commit correctly for scdoc 1.11.3
- Fix scdcoc metadata
- Link to v2: https://lore.kernel.org/r/20250313-upgrade-kmod-v2-0-2103ca9a26ad@gmail.com

---
Alex Kiernan (4):
      scdoc: Import from meta-wayland
      scdoc: Upgrade 1.11.2 -> 1.11.3
      kmod: Upgrade 33 -> 34.1
      eudev: Drop --output=... from kmod call in init script

 meta/conf/distro/include/maintainers.inc           |  1 +
 meta/recipes-core/udev/eudev/init                  |  3 +-
 .../scdoc/scdoc/0001-Makefile-drop-static.patch    | 23 +++++++++
 meta/recipes-extended/scdoc/scdoc_1.11.3.bb        | 22 ++++++++
 .../kmod/kmod/avoid_parallel_tests.patch           | 30 -----------
 meta/recipes-kernel/kmod/kmod/gtkdocdir.patch      | 30 -----------
 meta/recipes-kernel/kmod/kmod/run-ptest            |  5 --
 .../kmod/{kmod_33.bb => kmod_34.1.bb}              | 58 +++++++++-------------
 8 files changed, 70 insertions(+), 102 deletions(-)
---
base-commit: cb9bff9eac3670253076d5d09c6893e372be40a8
change-id: 20250313-kmod-ac33fdaf6452

Best regards,
-- 
Alex Kiernan <alex.kiernan@gmail.com>


