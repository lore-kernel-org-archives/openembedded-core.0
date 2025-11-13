Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2037CD98ED
	for <webhook@archiver.kernel.org>; Thu, 13 Nov 2025 21:47:43 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4343.1763070455811794397
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Nov 2025 13:47:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=srGP/uq8;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.175, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-298250d7769so8253125ad.0
        for <openembedded-core@lists.openembedded.org>; Thu, 13 Nov 2025 13:47:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1763070455; x=1763675255; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=hX2JHQWbl3jQ4LB/O/Ikyk2+WAxwzEt7Xg7XdJ37aqk=;
        b=srGP/uq8QPL4PRubSuIggn63FMfRNDFAHOGDLD56HPSNK0ZvymhSv3M5YNE2J4XT9/
         iXcTZbK162Ry0nYrLID8XyPBfMTMbe/MEekDjB3roWRvTHEpkInbm519qHdol35ySkmR
         9ADm2MJIMvZrrI4t+UaA1R9HZN34LehExXq1ezue53oGEqPe39PqNRzrMYiiEQ+oXIaR
         25bwKM5bZvufzBs6nSpbg/YntikwnmeI/n7USzjAngpae+QNLnS2VcmS29+38v4aKx/1
         lOr4nqzzhYOSOf3wVIqIKKOy6RK0jaMqR8XVYyn1SxpVbXBZdyFXKK9hvHkZiFvbL0kl
         fFVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763070455; x=1763675255;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hX2JHQWbl3jQ4LB/O/Ikyk2+WAxwzEt7Xg7XdJ37aqk=;
        b=ljisBLxKpqnRd9YAEERVkjYOGwDT/UL/Ri38xjk2xyZFQ/S1gCAzL3sV9gMkaJ25Ya
         UDWBBD6j8Vlmm+ESx/pt3LdEXPqHVS915xpta2SZHXbTNFXrpX0zDxyCR8+jnm9fH6dm
         U4vXlLlFcagPPRvbSwr6Xe95MRZWW03nHu+TRTN0Ybr2bxQ4YQVZb76MWBvJ5dNX9EHe
         6b/JG31tiTX0K/wdF8Gnktcp1vz37U4voK/jsuEl+rtwPUGJqBdeBfnkp3H9ZgJHK2Yw
         kF1wzs/KaGE5H9VkKFMNFy9LyhtovFOAhwJfSIeixwkFe0RKteSQ54BjWTqmsy43V6IC
         O4cg==
X-Gm-Message-State: AOJu0YzGOESQQHtk/tAvCcC2eh9JLUIwfXTAzA05pX7OWiw1Ut8Bht9h
	0sPvoNA2ogInz/LpDLuRp5uHjut3Ybt7CEt1DKnZ4uNhqWt8oxhAbj+u+iWnYFCq8IphIO8GUcA
	yuVaf
X-Gm-Gg: ASbGncvgS9zReUQuCoAxV7wBzQgRt5iOyDASBQhSjgnkz1KqkRuYw9trf2cFr78AkAU
	hMzLKi+73mi19mPSeAdv/qgDIumpf2Em/+XsoqzDyQul2Zg7fDFg2xfCk4GePVJzpzdVQz+HL7Q
	5DkEqthoh5mxAfZQkPgZCfV5DWkYZJPlbEpF5qUAzpBasq2lboTpaf+gOaGhZ3gGbWxXZJOgjst
	x4U6AqJLSVPKOXKE0Q3gdXCP8YBwB5hBBfUMMlW63BXV5GFoXTKvw/rfl7tLCBSVpKkmos/s8x3
	xjzb56oPhOrJy8evwmKfb94A/VleC/YelS/kGCORUxbVTfwUYg8t2Kbsvr9v1463puR8QC+yyvx
	8Tqk6M+ugVjjov8XCAp0j+p4KvT/pEgiM2xh2S84PfU+fvnWb69NXeAu5cMjd0nntOg==
X-Google-Smtp-Source: AGHT+IFibODLVl3F3K8EOH2nQZuIzg6fCD/jAvqrvw267eQm0xF5MWU6kN9UQspioiTCcFoD0q1tOw==
X-Received: by 2002:a17:902:c405:b0:297:ddb6:ef81 with SMTP id d9443c01a7336-2986a6be2a1mr6783555ad.16.1763070454977;
        Thu, 13 Nov 2025 13:47:34 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:70b:f91f:acd9:f6d9])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c2b0d68sm34639815ad.61.2025.11.13.13.47.33
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 13:47:34 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 00/10] Patch review
Date: Thu, 13 Nov 2025 13:47:19 -0800
Message-ID: <cover.1763070333.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Nov 2025 21:47:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226272

Please review this set of changes for kirkstone and have comments back by
end of day Monday, November 17

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/2720

The following changes since commit 1e1993b72f2b6109ce3d0ef950553b74b2b37b27:

  Don't use ftp.gnome.org (2025-11-03 09:18:14 -0800)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/kirkstone-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/kirkstone-nut

Alexander Kanavin (2):
  xf86-video-intel: correct SRC_URI as freedesktop anongit is down
  goarch.bbclass: do not leak TUNE_FEATURES into crosssdk task
    signatures

Gyorgy Sarvari (2):
  efibootmgr: update SRC_URI branch
  babeltrace2: fetch with https protocol

Peter Marko (1):
  curl: ignore CVE-2025-10966

Saquib Iltaf (1):
  rust-cross-canadian: Ignore CVE-2024-43402

Soumya Sambu (1):
  python3-urllib3: Upgrade 1.26.18 -> 1.26.20

Vijay Anusuri (3):
  xserver-xorg: Fix for CVE-2025-62229
  xserver-xorg: Fix for CVE-2025-62230
  xserver-xorg: Fix for CVE-2025-62231

 meta/classes/goarch.bbclass                   |  3 +
 meta/recipes-bsp/efibootmgr/efibootmgr_17.bb  |  2 +-
 ..._1.26.18.bb => python3-urllib3_1.26.20.bb} |  2 +-
 .../rust/rust-cross-canadian.inc              |  2 +
 .../xorg-driver/xf86-video-intel_git.bb       |  3 +-
 .../xserver-xorg/CVE-2025-62229.patch         | 89 ++++++++++++++++++
 .../xserver-xorg/CVE-2025-62230-1.patch       | 63 +++++++++++++
 .../xserver-xorg/CVE-2025-62230-2.patch       | 92 +++++++++++++++++++
 .../xserver-xorg/CVE-2025-62231.patch         | 53 +++++++++++
 .../xorg-xserver/xserver-xorg_21.1.8.bb       |  4 +
 .../recipes-kernel/lttng/babeltrace2_2.0.5.bb |  2 +-
 meta/recipes-support/curl/curl_7.82.0.bb      |  2 +
 12 files changed, 312 insertions(+), 5 deletions(-)
 rename meta/recipes-devtools/python/{python3-urllib3_1.26.18.bb => python3-urllib3_1.26.20.bb} (87%)
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2025-62229.patch
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2025-62230-1.patch
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2025-62230-2.patch
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2025-62231.patch

-- 
2.43.0


