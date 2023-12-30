Return-Path: <dbaryshkov@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B0DDC4706F
	for <webhook@archiver.kernel.org>; Sat, 30 Dec 2023 19:14:57 +0000 (UTC)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
 by mx.groups.io with SMTP id smtpd.web11.190718.1703963688293768012
 for <openembedded-core@lists.openembedded.org>;
 Sat, 30 Dec 2023 11:14:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=L7tBZ0M7;
 spf=pass (domain: linaro.org, ip: 209.85.208.174, mailfrom: dmitry.baryshkov@linaro.org)
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2ccabf5a4beso65284671fa.2
        for <openembedded-core@lists.openembedded.org>; Sat, 30 Dec 2023 11:14:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1703963686; x=1704568486; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vFCBOMgmLdH7ytQETx/m1gf7nJ+UkbJL5TEClU3uapk=;
        b=L7tBZ0M7MwItT7fxZmD4liyeL6/pX46WVenNe3sIUKKSW/N7B124wNCBaIfR/8V2Wj
         xIDZjYRe2XUtkSJCxfdhiyx261FsHPums6HiDKRUMRfmHXLjBA0GNq/do6a/NSMjCbY5
         GpTEAwWJJxP3nHdc4PnuFNMnr2GCCICSwKpGRloHtcBzLNUbcgcJm6yYUMlKuly1WiRt
         AclE/SfV0mdRn7qFicQg11n6FiE0JOyDVsdPO/jYpn4t9F+WM8ky+7a7SACa8CUEC1ZV
         ws2vkufebcBKunNsmXmwBzKHr3hWz5tMqjpXyVEACsTHYHo0+u/tpdSaqjU65PNa5+Xg
         gphg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703963686; x=1704568486;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vFCBOMgmLdH7ytQETx/m1gf7nJ+UkbJL5TEClU3uapk=;
        b=UNZQtwRO/mMim9D2KnaEC2yCp84nBtJlDPGH0pPbrJe0njaYsXGxc7dxqitEXTq7pW
         3dNubjXfrfrA2vnRhn0uODV52L1JXH8uKjUq4q8B6Uyg+neSoKC21im6jG2gqzAp/BE8
         WyrkDUSfgNxYHTI907+SiZwnVd2rwtln+rHxgqPXP07dH2YfEk/i598Tss2biq+gO5Cp
         g0J4BrBwr31IRJG35SXmwpM7daCiDHGC7lLuOzP9NdBPTTcR7PbQnIdJ8dP0o1uRk5fU
         KLFpBxR2OhvUxntFEQI7pyaZ5ED1E+tBL1hlewoztFJo9JQ6CeJGUCIkDIhHITL9WLw+
         gcRg==
X-Gm-Message-State: AOJu0YwrF71e9aLeFvvSSNclwq8/yGKeGZYtLwEl4QbWjne3m/7rseMz
	qW0p1og0PhXnUUV1pu6TW2xA9b/tCZBGbYqLA6cuNR+2PbXF3A==
X-Google-Smtp-Source: AGHT+IFKf/BtEpjGaQyaIpECBewV7hurUVRa97xJc0vFCc4xuV0JZ78dxYiQfZryVjrz7MDAg70S2g==
X-Received: by 2002:a2e:7a0a:0:b0:2cc:df53:5323 with SMTP id v10-20020a2e7a0a000000b002ccdf535323mr1169242ljc.62.1703963685605;
        Sat, 30 Dec 2023 11:14:45 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id z4-20020a2ebcc4000000b002ccd60a6fd4sm1948165ljp.32.2023.12.30.11.14.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Dec 2023 11:14:45 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [PATCH v5 0/3] mesa: RustiCL support
Date: Sat, 30 Dec 2023 21:14:41 +0200
Message-Id: <20231230191444.1204808-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 30 Dec 2023 19:14:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193080

RustiCL is a new OpenCL implementation developed within the mesa
library. It supports more drivers and more features compared to the
existing Clover implementation. The Clover is supposed to fade away and
to be removed in the foreseeble feature ([1]), thus it doesn't make
sense to add separate clover / rusticl options, they are going to be
removed anyway.

This series is based on previous work by Zoltán ([2]), so it starts its
versions from v4.

[1] https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/19385
[2] https://lore.kernel.org/openembedded-core/20230306091108.3347363-1-zboszor@gmail.com/

Changes since v4:
- Switched to patchset from the merge request rather than using the
  interim patch from Karol Herbst.

Changes since v3:
- Dropped clover / rusticl separation in PACKAGECONFIG
- Reworked rust inheritance to allow changing of PACKAGECONFIG from
  bbappend files
- Added an upstream fix
- Dropped removed config option

Dmitry Baryshkov (2):
  mesa: drop -Dopencl-native=true
  mesa: fix building of RustiCL + nouveau

Zoltán Böszörményi (1):
  mesa: add support for RustiCL under PACKAGECONFIG "opencl"

 meta/recipes-graphics/mesa/files/26680.patch | 236 +++++++++++++++++++
 meta/recipes-graphics/mesa/mesa.inc          |  23 +-
 2 files changed, 253 insertions(+), 6 deletions(-)
 create mode 100644 meta/recipes-graphics/mesa/files/26680.patch

-- 
2.39.2


