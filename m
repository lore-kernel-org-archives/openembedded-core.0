Return-Path: <dbaryshkov@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D300C46CD2
	for <webhook@archiver.kernel.org>; Wed, 27 Dec 2023 09:24:30 +0000 (UTC)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
 by mx.groups.io with SMTP id smtpd.web10.98728.1703669069364932064
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Dec 2023 01:24:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=fRcSisvu;
 spf=pass (domain: linaro.org, ip: 209.85.208.180, mailfrom: dmitry.baryshkov@linaro.org)
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2ccba761783so24173731fa.1
        for <openembedded-core@lists.openembedded.org>; Wed, 27 Dec 2023 01:24:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1703669067; x=1704273867; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GYQASVqxAQBMpaCZYJGTUmuHefZlk9jxgzK78H8dBTg=;
        b=fRcSisvu3UXlpy//GbBLD9/H7vKmOs9jGaq4VQYak1BYW6kwhv789CKj4cqn4D7d0G
         gBKyJJjb49G3zIKNcvRp/IU9BmFK4HUirfyIfgKdjxz9VeTUwetbvvPnIfn4vjxNyiB7
         J5mVhjNSDu3rhEcKvLLJD0CmzFqQhJx1NxwvwOhKVr1HgfNROsgTsACEbZv9f/Tkf7bS
         JNBDwpoLpbRf+P0K6VH1Vf/eVL4jGX3WsN/4O7uGFVUtNj1WnP0j4Tw/UGAu3lekzKMw
         Kr1m7Py1t9yaoSsHofdBtaCrxJR7af2ebndlUvz+K/BusK6470t175IxUvb2gk0dZpeM
         U4pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703669067; x=1704273867;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GYQASVqxAQBMpaCZYJGTUmuHefZlk9jxgzK78H8dBTg=;
        b=YvtK0TA8r02dLYPD524z75Qp26v1ytY1mEj2t061ZMbNyOGu6bsHquOnHeMbdME60g
         IDoMAs5ow84WUwbsPRlRAcyLHZh32w2Rt7eJhm/kNJQy9mySmUqZmGZauFpXJDM8B9LF
         Ty4yDegO3iS6e1HgXvpoTGqw3qVyLgqiviPszp1D+y+SQtLqW/yO1UPUqAP2bvnQzRI8
         ZAEkcviQH0Jqp2FXDxfKdi/vOXn6g3ddozx/mRMMW+IhGTpjlOYN5UByOYrgLeCtZDBA
         5L60US6bjL9XWE/+bQo8TGv4onfZCbIILC2BW6yEhdbmSNRWzcgnv2oUwW6lcppSI5LI
         ZaEg==
X-Gm-Message-State: AOJu0YwnfkDU920EHo7sF/NgkkxprDXyxiaxgYM0tOOXSJV9i1ggYvYN
	LOJMz2OnJ3+TLTTwcuhE+7IaqlrmGzmP/17b6m2RJN9/L9CUVPZe
X-Google-Smtp-Source: AGHT+IF/r4Ts+R1V6mXv6DTbbz1loGsF5wbOEJdBfBKx3S/E+Q5vBeoS6bJe9TY/rMDIOfsVTdbZzA==
X-Received: by 2002:a2e:a690:0:b0:2cc:53da:bb89 with SMTP id q16-20020a2ea690000000b002cc53dabb89mr2901626lje.3.1703669066921;
        Wed, 27 Dec 2023 01:24:26 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id e18-20020a2e9852000000b002cca6703b13sm2131333ljj.99.2023.12.27.01.24.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Dec 2023 01:24:26 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [PATCH v4 0/3] mesa: RustiCL support
Date: Wed, 27 Dec 2023 11:24:22 +0200
Message-Id: <20231227092425.4002461-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Dec 2023 09:24:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192928

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

 .../mesa/files/fix-nouveau-vl.patch           | 55 +++++++++++++++++++
 meta/recipes-graphics/mesa/mesa.inc           | 23 ++++++--
 2 files changed, 72 insertions(+), 6 deletions(-)
 create mode 100644 meta/recipes-graphics/mesa/files/fix-nouveau-vl.patch

-- 
2.39.2


