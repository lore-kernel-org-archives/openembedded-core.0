Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73AB8C36002
	for <webhook@archiver.kernel.org>; Mon, 24 Mar 2025 19:37:05 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web10.48747.1742845019483848324
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Mar 2025 12:36:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=mDmpRMj5;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.48, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3032aa1b764so2862270a91.1
        for <openembedded-core@lists.openembedded.org>; Mon, 24 Mar 2025 12:36:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1742845019; x=1743449819; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=R6+CNJ0Z024g8/NGfqw42Wid1GX2X/xdc/fhEhbK8Uw=;
        b=mDmpRMj5PPb0hjWcPeMeHqUBYD6v5wv5jGulTlEVAs2gNtetlIZrfyr7khd2dHY6Lf
         0F9/UNXa6f18r0PTbLEN5vitJaim3sx9JMMKIB5lJlsRoOf0NTBBpg8lzU5encBWlhdv
         rncM19KWNXdaWk1eQyYbH5ZFgI214N2g32Mqjw7897ti5CvmK0jH+N6ZnAUJ45GPdjvM
         ySD3R0j0Jv17cPE7q9gveq48d6eGJ/tDsTsep3TicM6FXGfa2eIU7IDjEkS/ES/GC0a1
         1BZWkAcMMkVmxiSg+yVgW48Wj+qdKiT1/xSRc4mlVhoo11jS0BOUa7S40WSzZafS115J
         ucTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742845019; x=1743449819;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=R6+CNJ0Z024g8/NGfqw42Wid1GX2X/xdc/fhEhbK8Uw=;
        b=miiKfUoHcC5RtPkZXLQWwLWALvBOwaWeTMrNlrBppm7orqEXg/WwFbhdlqOey+yjuf
         l6phywnhFedPqx6lhUZ2GvT29gIQ5Oyp82pSlDbX3N9JyRwudxNr65LLdFa3hET0ly56
         ieqgBhiyK4MqCUZEuuWpAeG0pCoOfVFu2QH7Cm1zERngyA0qLyiMsrjAz0MxQULcixcv
         izKQH7eedoUEi1LPUDoXyKcT9JDZoSb+KgllQWqN4cAsScyC9yd1WjpTWlrE7MW+NK+Y
         KRRMonzUhhPICubEBmHTnFXBDmsw9K8Oi7vWr23f7Be2Gnr9iotMI1M5387MKgLGvMV2
         vWzA==
X-Gm-Message-State: AOJu0Yy8V9/gD2SWQv+P3zmbVI6w91Eu+1PwoUyyVLaU+Mq7T4YaXqGi
	55JzQQhQKBYOIWg7fIbiohdUlbKVmf5fepia/vAxxCIEuElcZk/15qYRzLVtMUeDl2hEMs/c18o
	M
X-Gm-Gg: ASbGncvWq+zswkHWSbE4yESjagXidDR8vPSsyxvtMQgpATvP89VlZEAn5Gx6YNzo+rl
	ztxtw64eHIS/aPqJPi9dnbkmFNNoS/jRTXtGBLsm8rrYbnb0R8lPC4C8bN/IyCDrahAxR78PI8t
	YPaLKWqflVB7N/x/n/6lF+M4Usry3U9RYPK7Pv7JhCu9jLAw3+b0M89mSPWzmxRhWqhLoBIY2f0
	BONHULYCGpvp4k1y9wRclA5Juejd8NIkRTIivuRNGQOHKtKLr/dDJRQJq2hLxqC1qi94uAsZ1Gh
	IIofQnODyVGWNv04N/WIy6QwAQVz1uGSg67X
X-Google-Smtp-Source: AGHT+IGAwY+MAEFDIp38wnPwdkoGg3mR5wquRTgyEKJ9vktYhnLtoGSjAM5U4dstWT0iP1xE28SAGQ==
X-Received: by 2002:a17:90b:4a4a:b0:2ef:31a9:95c6 with SMTP id 98e67ed59e1d1-3030fe95a80mr22150363a91.14.1742845018430;
        Mon, 24 Mar 2025 12:36:58 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:ee18:96b4:93d3:b88c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3030f806b48sm8640876a91.44.2025.03.24.12.36.57
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Mar 2025 12:36:58 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 0/6] Patch review
Date: Mon, 24 Mar 2025 12:36:47 -0700
Message-ID: <cover.1742844907.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Mar 2025 19:37:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213572

Please review this set of changes for kirkstone and have comments back by
end of day Wednesday, March 26

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/1242

The following changes since commit acb88b244e89bc1300a24f60d0a44c21e0ab1af6:

  vim: Upgrade 9.1.1043 -> 9.1.1115 (2025-03-13 09:19:58 -0700)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/kirkstone-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/kirkstone-nut

Peter Marko (1):
  tiff: mark CVE-2023-30774 as patched

Robert Yang (1):
  libxcrypt-compat: Remove libcrypt.so to fix conflict with libcrypt

Vijay Anusuri (2):
  libxslt: Fix for CVE-2024-55549
  libxslt: Fix for CVE-2025-24855

Yogita Urade (2):
  xserver-xorg: fix CVE-2022-49737
  xwayland: fix CVE-2022-49737

 .../libxcrypt/libxcrypt-compat_4.4.33.bb      |   2 +-
 .../xserver-xorg/CVE-2022-49737.patch         |  90 ++++++++++++
 .../xorg-xserver/xserver-xorg_21.1.8.bb       |   1 +
 .../xwayland/xwayland/CVE-2022-49737.patch    |  90 ++++++++++++
 .../xwayland/xwayland_22.1.8.bb               |   1 +
 ...-of-TIFFTAG_INKNAMES-and-related-TIF.patch |   4 +-
 .../libxslt/libxslt/CVE-2024-55549.patch      |  49 +++++++
 .../libxslt/libxslt/CVE-2025-24855.patch      | 134 ++++++++++++++++++
 .../recipes-support/libxslt/libxslt_1.1.35.bb |   5 +-
 9 files changed, 373 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2022-49737.patch
 create mode 100644 meta/recipes-graphics/xwayland/xwayland/CVE-2022-49737.patch
 create mode 100644 meta/recipes-support/libxslt/libxslt/CVE-2024-55549.patch
 create mode 100644 meta/recipes-support/libxslt/libxslt/CVE-2025-24855.patch

-- 
2.43.0


