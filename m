Return-Path: <liu.ming50@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D3C7C433EF
	for <webhook@archiver.kernel.org>; Sat,  9 Jul 2022 08:12:35 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 by mx.groups.io with SMTP id smtpd.web08.4310.1657354350789937017
 for <openembedded-core@lists.openembedded.org>;
 Sat, 09 Jul 2022 01:12:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=o3eCkKJk;
 spf=pass (domain: gmail.com, ip: 209.85.167.52,
 mailfrom: liu.ming50@gmail.com)
Received: by mail-lf1-f52.google.com with SMTP id i18so1191448lfu.8
        for <openembedded-core@lists.openembedded.org>;
 Sat, 09 Jul 2022 01:12:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gOlXRuobdG96pk4sWLZaLDudvEzrUYizJ9IUgHGBlug=;
        b=o3eCkKJkrTzbPmiRVM5zeuaHKUzjCO6+OpcaIquCHnlWNjmCMIEQSe9XgmI4yxae9L
         qA9/6LIawvAejZfCGlbzWxF1B3rIBAwSOBXIZ1cPKVG05bajBJNfzfV+Tbux2Iystl7W
         U/qcPXC/F+3PeFcDh6w7jZm732KZ6ImY1VxUzxaZtUrq/2PRq7RVRX4Pc392v6FGon9u
         pPe8LA4peJiSZ+7HtXiOJp2/6cipADSc9ONpv8Bi964uOwLhRr9j+GIRhNoRP+V1mQ6P
         a/pQFpyqucT+qjgsWDCHCBlJNJqDKnK6mWo18KLtSnxL9x/VUGr/rs1JuA3PO+iWSsnP
         srXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gOlXRuobdG96pk4sWLZaLDudvEzrUYizJ9IUgHGBlug=;
        b=cUedCrmtzA9TUkmm1XErNvitvEGc19zvY/rwzBpfImqcS9KBi3hvJBkJleOcJQyX5y
         3PzWeBHxN8o3o8rc+ZDNkF36rjWx72oNV/9tYKFkJngPGpkI75uB3/bOle4l46ReP8ls
         en7uKkyNtC+hWnoZ6REMvTx/d8oHr2ojqlKcAfeZ5vVkIevwGQBikuypPuYvbI9wUxzp
         dsWJP/Vq3H/tGtJ2Ut5kLwYOQ/tALO5OXvFwRyeudyRQs3Db6wbKy3JbQSTi1IPKKA3x
         GAvgwztSRrmBUIcWeiQeLx8GDu+HcMeEMhYIDUmpbJwWlKF/B3YzAF0oUv4G11+MFZKg
         jMyw==
X-Gm-Message-State: AJIora81TieAaCUEcWjdr/BFeXhuDFOghEsMAE4ddRpxPNEUeTgtnWEk
	RoZJksOzRUdTBmiRE9StN2NMlqkimFE=
X-Google-Smtp-Source: 
 AGRyM1vv1OQqosIB2atmfnEul1yNj5tY/2U1cfgwbWAhFqGiSbmt636eGnLqmfBcsge2W6T2r4N6aw==
X-Received: by 2002:ac2:5dc6:0:b0:488:e498:1d71 with SMTP id
 x6-20020ac25dc6000000b00488e4981d71mr4843993lfq.140.1657354348267;
        Sat, 09 Jul 2022 01:12:28 -0700 (PDT)
Received: from peterliu-Precision-7530.emea.group.atlascopco.com
 (customer-212-100-112-191.stosn.net. [212.100.112.191])
        by smtp.gmail.com with ESMTPSA id
 a14-20020a056512200e00b00489c2f5f2fasm251739lfb.289.2022.07.09.01.12.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Jul 2022 01:12:27 -0700 (PDT)
From: liu.ming50@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: alexandre.belloni@bootlin.com,
	max.krummenacher@toradex.com,
	Ming Liu <liu.ming50@gmail.com>
Subject: [OE-core] [PATCH V2 0/1] meta: introduce UBOOT_MKIMAGE_KERNEL_TYPE
Date: Sat,  9 Jul 2022 10:12:20 +0200
Message-Id: <20220709081221.5601-1-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 09 Jul 2022 08:12:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167836

From: Ming Liu <liu.ming50@gmail.com>

Changes in patch set V2:

1 Fix a wrong parameter mess pointed out by Alexandre Belloni.

Ming Liu (1):
  meta: introduce UBOOT_MKIMAGE_KERNEL_TYPE

 meta/classes/kernel-fitimage.bbclass     | 2 +-
 meta/classes/kernel-uboot.bbclass        | 3 +++
 meta/classes/kernel-uimage.bbclass       | 2 +-
 meta/lib/oeqa/selftest/cases/fitimage.py | 3 ++-
 4 files changed, 7 insertions(+), 3 deletions(-)

-- 
2.25.1


