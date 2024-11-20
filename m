Return-Path: <hiagofranco@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17B50D743D8
	for <webhook@archiver.kernel.org>; Wed, 20 Nov 2024 20:31:17 +0000 (UTC)
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
 by mx.groups.io with SMTP id smtpd.web10.25328.1732134669466594923
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Nov 2024 12:31:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bCft5J8y;
 spf=pass (domain: gmail.com, ip: 209.85.210.46, mailfrom: hiagofranco@gmail.com)
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-718119fc061so54483a34.2
        for <openembedded-core@lists.openembedded.org>; Wed, 20 Nov 2024 12:31:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732134668; x=1732739468; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YfYnivgHdp2mYKHYtVrD+qJQsGUDTxZ47BViZX3b5Oc=;
        b=bCft5J8yjgEa2WnpvBp8EWCacli5CU/PIelBo8yd++gI72KCEyKNKH7qKBOM/YEbvf
         sKsj3gG9r0/WwmarEzh+TOCeXZMOwXGd1snBUF4UNGrze97xllfTFr/aV7OmSN5Sp7os
         inuCHyJsjVGTL2TTRlcUe95kx9p+2z4rAlqz80cpKo9W4qICDkDwM1R+r/pFwfryilsn
         PF2gFRvtW4Q6bsL4GgV+ClxLTx39361otiGloUYAfxj2Kb6vWNUvdPs4fT9THFjnXeGa
         h6eTin0DLsvcfuXVyAtg9MTwZLe1QtKsRSiEVVu6kO6WPw2eCX97nmXlL69q2C4nb7VR
         qBkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732134668; x=1732739468;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YfYnivgHdp2mYKHYtVrD+qJQsGUDTxZ47BViZX3b5Oc=;
        b=SoLe19JlC/jYOyb+bTcfkdbje4wd4mqtfowCmoanbMaaIOj3PlVmM5oRncGp7Pi7So
         s1yamaoRUelYEuFelITAz4wbxwG9PXcFYS/3CjlvAM97w2XVn6qELKssXAqPJOi4YqqL
         DTUerH368PTUME5+jYXoSHkLZh0FjTWzMCQjKPYdIcaqY2afEKPMTkcm296mHOghdhPh
         DKiQfYSOIBtV6C7Q5eaoRpkquOaPlhrDlWsbZnFgMORVOKYwuA2h06/Z0g7GQgxZi2Ka
         XDQYrkgGcobKjm4pt5Xr9g4bj9phZQ6DdxUI6hHyIqtVsPi1KHzxVQIop6I2pfY4m+Hq
         f+DA==
X-Gm-Message-State: AOJu0YzmgDnxhvIFBaaJ7AiIQaIFzCszsR2Ss2j3nk6iehYT3vg/GBYi
	Rmpk/hmoG+XiiYyd+8nNF3Dx6CsShTC+dVMK3owhWj9GDPQl955N7y8fGw==
X-Google-Smtp-Source: AGHT+IHFH/XAmE3Erzd0s9kzycItIkKP2ziE09BNHMFact2d99a6n26zSWWPIjaVtxgy4FYjjREwFQ==
X-Received: by 2002:a05:6359:5b0c:b0:1b8:f18:3e53 with SMTP id e5c5f4694b2df-1ca66495f92mr300633555d.9.1732134668307;
        Wed, 20 Nov 2024 12:31:08 -0800 (PST)
Received: from hiagof-nb.. ([146.70.98.136])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-856dfe039f8sm1746145241.33.2024.11.20.12.31.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Nov 2024 12:31:07 -0800 (PST)
From: Hiago De Franco <hiagofranco@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Denys Dmytriyenko <denis@denix.org>,
	Hiago De Franco <hiago.franco@toradex.com>
Subject: [PATCH 0/2] weston: upgrade and add libdisplay-info recipe
Date: Wed, 20 Nov 2024 17:30:03 -0300
Message-Id: <20241120203005.1802141-1-hiagofranco@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Nov 2024 20:31:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207481

From: Hiago De Franco <hiago.franco@toradex.com>

This series aims to upgrade weston from version 13.0.3 to 14.0.1.

Since commit a16598b038b2 ("backend-drm: make libdisplay-info
mandatory") from Weston, libdisplay-info is now a build dependency,
therefore I am also adding libdisplay-info recipe into this series.

In order to build libdisplay-info, it needs hwdata-native, which
native support have been submitted to meta-openembedded layer [1].

[1] https://lore.kernel.org/all/20241120160005.8473-1-hiagofranco@gmail.com/

Hiago De Franco (2):
  libdisplay-info: add recipe
  weston: upgrade 13.0.3 -> 14.0.1

 meta/conf/distro/include/maintainers.inc      |  1 +
 ...Include-libgen.h-for-basename-signat.patch | 45 -------------------
 ...1-vnc-Allow-neatvnc-in-version-0.8.0.patch | 27 -----------
 .../{weston_13.0.3.bb => weston_14.0.1.bb}    |  8 +---
 .../libdisplay-info/libdisplay-info_0.2.0.bb  | 12 +++++
 5 files changed, 15 insertions(+), 78 deletions(-)
 delete mode 100644 meta/recipes-graphics/wayland/weston/0001-libweston-tools-Include-libgen.h-for-basename-signat.patch
 delete mode 100644 meta/recipes-graphics/wayland/weston/0001-vnc-Allow-neatvnc-in-version-0.8.0.patch
 rename meta/recipes-graphics/wayland/{weston_13.0.3.bb => weston_14.0.1.bb} (94%)
 create mode 100644 meta/recipes-support/libdisplay-info/libdisplay-info_0.2.0.bb

-- 
2.39.5


