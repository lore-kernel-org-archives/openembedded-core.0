Return-Path: <pidge@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E29FAEEAA4E
	for <webhook@archiver.kernel.org>; Thu, 14 Sep 2023 14:39:30 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web11.14121.1694702369153606530
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Sep 2023 07:39:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=g3GD3G6T;
 spf=pass (domain: baylibre.com, ip: 209.85.221.44, mailfrom: pidge@baylibre.com)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-31427ddd3fbso884251f8f.0
        for <openembedded-core@lists.openembedded.org>; Thu, 14 Sep 2023 07:39:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1694702367; x=1695307167; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=nDBNAd5ESZ4WYY/LfyO4pluiNUN2OcfbRSWdY/U7Td8=;
        b=g3GD3G6TisUQ1nTXLciaLK0YTOe4/dUgfiUQ481oCMjYnfRZhpUnEOxQoiEVG2GkyQ
         OI7r9XebShdW0QxHQ7VYlv3vSQPE8m4h5g0HOtvzwo0tMSRMMuOhc5qCiClvLtL1zwDO
         ajO+9uo16J6gmPLbr1C7kD+moeLBbSJRohlkKhz8p6q0vtB+bB5EkkODk+2t8LvozWLr
         +QodPTM4lx2C3cGqXMcj3s/Q/ZrlOvwsrNnDy9tsm8thwmLX4aalkOBPVU+lpoEBmmMb
         UGXq83xrIoEq5Zpzb513+uL/YJwd2OaAxhgUzh0yZsAQIp2veBQSSeQj+PvY31M+y2UC
         GjDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694702367; x=1695307167;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nDBNAd5ESZ4WYY/LfyO4pluiNUN2OcfbRSWdY/U7Td8=;
        b=M37douu66cXRCa8OEa7swb36ukbVdavnE9DpDFcfsz1r2NjmZ0eT6I2OMLSYghKxaA
         ELqK6jLKPhKIlmYxEHkbNIMDZkJFGcVRLHQMHdy+j7aQa+ib9RzoQ9MO2yT2nxgqG3V4
         bK38fYxOQ3/fTXenRv5GsPWzOO330ULYLxo3HflH9p6F2Xqdp2XFx0QZlE9mBiCyMBmE
         LNGNpL9YDQPBOQEwwMKsOShM23U5JWCqpHw8r4TedBnLbiC5scWy0mCUGwbNEMyxGvW7
         XYufJZWfzWr+S/gz3P2+j2k/aibCp3/bGCtT6/4jCpUFlAsp+tcBoibthsZETaEFgZwH
         PzbA==
X-Gm-Message-State: AOJu0YwoZ3qDZgJJwd2XQwRzyILjsLCcz4nrGMVuk69NZfqywtrm86l9
	VmS9uKl6AYdO06UaiHvhRMyMx5zW6tYfRN6q9M4=
X-Google-Smtp-Source: AGHT+IF0gODlR3uuZt6oJLdYEb7iXYojdu1OjhuSsAsFIRFB54MgODkrKYD/Gmqnq3+L3DjiBt1YgA==
X-Received: by 2002:a05:6000:70a:b0:31f:e74d:c82a with SMTP id bs10-20020a056000070a00b0031fe74dc82amr1095084wrb.31.1694702367091;
        Thu, 14 Sep 2023 07:39:27 -0700 (PDT)
Received: from localhost.localdomain (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id d15-20020adfe84f000000b003197b85bad2sm1951818wrn.79.2023.09.14.07.39.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Sep 2023 07:39:26 -0700 (PDT)
From: =?UTF-8?q?Eil=C3=ADs=20=27pidge=27=20N=C3=AD=20Fhlannag=C3=A1in?= <pidge@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/2] Ensure sdk.py knows about nativesdk-intercepts
Date: Thu, 14 Sep 2023 14:39:17 +0000
Message-Id: <20230914143919.985474-1-pidge@baylibre.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Sep 2023 14:39:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187642

This patch series ensures that do_populate_sdk knows about
nativesdk-intercepts. It also ensures that debian builds work with
update_mandb.

Eilís 'pidge' Ní Fhlannagáin (2):
  lib/oe/package_managegment: Add nativesdk-intercept PATH
  update_mandb: deb fails due to missing man cache

 meta/lib/oe/package_manager/deb/sdk.py   | 5 +++++
 meta/lib/oe/package_manager/ipk/sdk.py   | 5 +++++
 meta/lib/oe/package_manager/rpm/sdk.py   | 5 +++++
 scripts/postinst-intercepts/update_mandb | 2 ++
 4 files changed, 17 insertions(+)

-- 
2.34.1


