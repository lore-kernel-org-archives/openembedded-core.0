Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E7ABC433EF
	for <webhook@archiver.kernel.org>; Thu,  7 Jul 2022 08:17:43 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com
 [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web09.3165.1657181857919914019
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Jul 2022 01:17:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=c2/ZVTIR;
 spf=pass (domain: gmail.com, ip: 209.85.218.46,
 mailfrom: adrian.freihofer@gmail.com)
Received: by mail-ej1-f46.google.com with SMTP id j22so4819224ejs.2
        for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Jul 2022 01:17:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=87O1DYMw9y/w6Qm7rrcce4wzePIZQjRdCZY2lNa+o/w=;
        b=c2/ZVTIRRnQBngJk14Frvir4maSRh6alHwjU3gf/i7oBj3+B4ied4xa2z3jbByned3
         yoroJX5icKlB7eEEEGJ01FOL3WF47PZW7Rc3YY1YmsfdDGcKu25oJT3JhIamP35JMbQn
         POhoCxyqhooLrYVb6IDMOhnYUHpR/mAeZ5gkz88fyx2MCOwPpRRaWT1ff+scLPce2nDG
         mXp4joSZPh9St5NQ6p6Fm4wQpiYJVNl/oeTkz+Y+W6mtpbdv0qIRob5Si9dsPyiY3pFT
         s1XBwlceHygQvsN2qqz67+elR3U+sEifPGR/CObJYhQi4/QiQx8vXqoejqYOHCloiG39
         8V2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=87O1DYMw9y/w6Qm7rrcce4wzePIZQjRdCZY2lNa+o/w=;
        b=poMYh6MKLYu2BECpLH/b0DiVnAA0lwvYlenmPa2PXt4VZkQG2YJ1Lk21MpycDo7ZXH
         bvsAG9Anbvoy00+D0oUGHwomqSW78VvLBXAzr8Doq6zLj6HiGcixxm876cO/mo1xuHNR
         WsrxPJI/tRhxxDSIRnEqtih7ViaZK4bCvPaic6h4/wBipqVqusE9X5YLIgkkiRkBisnU
         uaIUK1+Lrq65+1eh/O0aFEsUOH5f2ePt8ms0Wlw/O6OUVnZxd+5uYU2O9ry7ibUTF1pN
         P2A9dyugSQ/4aLCqPaAl+T050WIKfi/ku9Cirhv1MdVG3wNse+bJ4Ab7x2ZlaBzF8vPG
         C6Rw==
X-Gm-Message-State: AJIora9JY9h7URKxjglwFM+9SeAb0y3Z0VseQF+wLHUXTZzo8m6KI2uP
	kKMOIN9sthzCqxJUVGrcEp7OPov33nJHC48F
X-Google-Smtp-Source: 
 AGRyM1sekJwvBusWYZi0dxjOe/qKz80f8zvEZCr/bDLOwSeANqvbNIjmbT5ZUEHW8V3LlMzzaN5oZQ==
X-Received: by 2002:a17:907:7b84:b0:726:c8a0:c9e7 with SMTP id
 ne4-20020a1709077b8400b00726c8a0c9e7mr42148611ejc.375.1657181855919;
        Thu, 07 Jul 2022 01:17:35 -0700 (PDT)
Received: from md2ramxc.ad001.siemens.net ([62.32.0.69])
        by smtp.gmail.com with ESMTPSA id
 r6-20020aa7cb86000000b0043a734c7393sm6771961edt.31.2022.07.07.01.17.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Jul 2022 01:17:35 -0700 (PDT)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [meta-oe][master][PATCH 0/2] modemmanager update
Date: Thu,  7 Jul 2022 10:17:02 +0200
Message-Id: <20220707081704.2494733-1-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Jul 2022 08:17:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167758

Update modemmanager and libqmi to latest stable.

Adrian Freihofer (2):
  libqmi: upgrade 1.30.4 -> 1.30.8
  modemmanager: upgrade 1.18.8 -> 1.18.10

 .../libqmi/{libqmi_1.30.4.bb => libqmi_1.30.8.bb}               | 2 +-
 .../{modemmanager_1.18.8.bb => modemmanager_1.18.10.bb}         | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-connectivity/libqmi/{libqmi_1.30.4.bb => libqmi_1.30.8.bb} (95%)
 rename meta-oe/recipes-connectivity/modemmanager/{modemmanager_1.18.8.bb => modemmanager_1.18.10.bb} (97%)

-- 
2.35.3


