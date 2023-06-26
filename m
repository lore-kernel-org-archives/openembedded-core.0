Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDA90EB64DA
	for <webhook@archiver.kernel.org>; Mon, 26 Jun 2023 13:33:23 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web10.7921.1687786400257415878
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Jun 2023 06:33:20 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=adM2F1T/;
 spf=pass (domain: gmail.com, ip: 209.85.218.48, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-991f956fb5aso14334466b.0
        for <openembedded-core@lists.openembedded.org>; Mon, 26 Jun 2023 06:33:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687786398; x=1690378398;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PcBYRk9gNALrtFubt5+LUiP/nhgZAr2h03ewcAkI8r8=;
        b=adM2F1T/zwDJOM4Fl/OHKE3bB7igq5TkmtyI2BazHK/4cNLpD3pcI1g7rUiapOiTo3
         kILL0PHy12K1n8Ze62kGteapUdSax2o3wycVNtJ4swWmAw7D5czK5CbNT5LEGsz8JWPS
         tItUHFk8y+WFZTre72vjRIsMPlX01WRIZkkRE6QxItH5bcDTsC5vJHWg5eHEYkXkGkhZ
         TAuB9jksGIFHuSBS9mtzyrF0PfSLSUGV7SZJJiqKq0QVxHqZZeG7Hzr/Z34qV774ZfNF
         1RrbAyKbtOVPbl5eFprZk+XT3yaS0aG+3SliOXwzP9+ZXBRBnVSUoUuqe3YKkqI7r3lO
         8gqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687786398; x=1690378398;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PcBYRk9gNALrtFubt5+LUiP/nhgZAr2h03ewcAkI8r8=;
        b=YGUH1DVPuIYLCbpXFcy1TPuvCmLRhaS6MxX3va7FETdY3HGHqcKxbOZAiVF4XkDSIe
         hH6jts6mvqtA8eXRUi8Vm0czuQxto2pFAEkdfY/laAkEFYmS53bRe12Dp5Aa1YlEm51f
         elKI2qiQlCytHghSZyrcAe8ZzmAnP8fMKAPERwIcjaBTy7nN3ITqTNLsZwV8N2evl5a/
         46/h9wLLqhkk4+MwAj53zY/NhxqlWa63+BlSSBD/x9jYDs/dOMymxRYyZHunTOssNeyo
         GsYHCYUnB1TjaLZm3yYeOPVVsesJ7e+nsdU3xvuygvRrU5h47ud7o8g+emvz3XeVDLzw
         PZMQ==
X-Gm-Message-State: AC+VfDzqxH8KNk9sPEtrtbr0WvOCyIcHAI9nxCF6FEREwcV3puppUi1o
	exLh1BxeK5bhbB+g5gG1Apy6o8RKzDmgcg==
X-Google-Smtp-Source: ACHHUZ4Um+MwzYGsIqp6+mSDKIrqSxTKApWJLdZ1okxOblreyW+MegLg4deQVLLYESzozKwkQzprww==
X-Received: by 2002:a17:907:7253:b0:98c:f214:cb66 with SMTP id ds19-20020a170907725300b0098cf214cb66mr9834817ejc.71.1687786398162;
        Mon, 26 Jun 2023 06:33:18 -0700 (PDT)
Received: from t14s-af.praguecc.cz ([193.85.242.128])
        by smtp.gmail.com with ESMTPSA id h13-20020a1709060f4d00b0097073f1ed84sm3301988ejj.4.2023.06.26.06.33.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jun 2023 06:33:17 -0700 (PDT)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 0/4] fix runqemu-ifup/down scritps
Date: Mon, 26 Jun 2023 15:29:23 +0200
Message-ID: <20230626133213.47920-1-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 26 Jun 2023 13:33:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183413

I hope this is the final series of patches to bring the runqemu scripts
to a clean and consistent state. It also includes the patches from
Alejandro to ensure we have everything in now.

But  yes, it was the right direction. The scripts are now so much easier
to use.

Adrian Freihofer (2):
  runqemu-ifdown: catch up with ifup
  runqemu: drop uid parameter for ifdown

Alejandro Hernandez Samaniego (2):
  runqemu: Stop using warn() since its been deprecated
  runqemu: Fix automated call to runqemu-ifup

 scripts/runqemu        |  8 ++++----
 scripts/runqemu-ifdown | 21 +++++++++++++++------
 scripts/runqemu-ifup   |  2 +-
 3 files changed, 20 insertions(+), 11 deletions(-)

-- 
2.41.0


