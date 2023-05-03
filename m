Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C77FC7EE22
	for <webhook@archiver.kernel.org>; Wed,  3 May 2023 11:19:49 +0000 (UTC)
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
 by mx.groups.io with SMTP id smtpd.web10.16581.1683112780493845774
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 May 2023 04:19:40 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=ZearSQCu;
 spf=pass (domain: gmail.com, ip: 209.85.219.177, mailfrom: akuster808@gmail.com)
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-b9a6eec8611so2787463276.0
        for <openembedded-core@lists.openembedded.org>; Wed, 03 May 2023 04:19:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683112779; x=1685704779;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=4nXsGvcHFLtv1cOWF8J37SjSMXfCftTgytARSUzuzoo=;
        b=ZearSQCulMoH9A09+Xfh09aBAntOk7Y6Wv/l3rRcoOxu/3mybcCT+C3DSKZZTN6NoL
         FP2ULTurlxB0VHVgvFj6+fdcU/8RSjKgnuvdU/RB7n9QIbyucfN7tGXptPPMaERweK2G
         U3YiFpO++AAKuOtEK6kFfUY+g7rP7Ig+Xdz6/MnTDBKO2OeqepWypNfLvy4ao9QNZjsx
         lCiueLNqgfz647Uk9x13ZB+XBUui+VeOpJ3nJkOg9XVFSnQdzhyd9UW6ka/DQQnErNjA
         Cy4Rz09FlWOrbLpGZg0gZpRiEtxTl3kEDsb9ne9HC1If0Kb2BthYYqz/bRkTv0Yl+yMw
         +13Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683112779; x=1685704779;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4nXsGvcHFLtv1cOWF8J37SjSMXfCftTgytARSUzuzoo=;
        b=eoEqKJ5sMqv4QyDSEHs/nhQX1+POhyXuRy2f4Gv3LZC4S+YsD62iLlB5Od1T0uMlHD
         9mk8KA/yoPmSLNRfiDt5QGNa7mTX3l1xxTdu7zsdXvfFcJbCy69gHhpMRiSDJg9HL2sd
         zvRjfGAU4XbhG3BQeMYLM15pr9hyf+a4g0OUSKEdWEfqusyxxGsrwDrlaoC/wEGubWvT
         2lnKpRxRO+HZ3xTW7OQFDPHg4OSPRabDCxpYxb15bOSsmBfUe1IfYX7I9abiyVCqmcb1
         XK8IBAJd/ATrQX81WCIK5tI4Ldwp5lDVuZCDTSTzP8tgLoM3GDCDyZZkLE2U3tYiZ2qA
         +IMg==
X-Gm-Message-State: AC+VfDyftGOthz2eByIrXRuDpQCBS6K5NIsHVxB6hHgmpRaRn5klxBos
	+zqADHzKL4Tr+7/+XSPZmBiYhey4XQH3Xw==
X-Google-Smtp-Source: ACHHUZ6Z3Su+8CIM6jM0fCF6+G6SkxFQuyzUv3dbp1Mhr+h4WlJugDyxZsyD9uKXev1/Q9lknJia7Q==
X-Received: by 2002:a81:809:0:b0:55a:776e:95f3 with SMTP id 9-20020a810809000000b0055a776e95f3mr1473394ywi.25.1683112779282;
        Wed, 03 May 2023 04:19:39 -0700 (PDT)
Received: from keaua.attlocal.net ([2600:1700:9190:ba10:6f7a:c057:293d:a9b7])
        by smtp.gmail.com with ESMTPSA id d3-20020a814f03000000b0054f8a3f6281sm1155016ywb.3.2023.05.03.04.19.38
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 May 2023 04:19:38 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/1] Add CPE_NAME to os-release
Date: Wed,  3 May 2023 07:19:37 -0400
Message-Id: <20230503111938.942018-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 May 2023 11:19:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180808

I am sending this change as several recipes in meta-security
interogate the system to determine which OS is running so that
they can behave accordingly. I would prefer core carry this
rather than meta-security. This may also help with the overall
OE/Yocto Security story.

Armin Kuster (1):
  os-release: Add CPE_NAME

 meta/recipes-core/os-release/os-release.bb | 8 ++++++++
 1 file changed, 8 insertions(+)

-- 
2.25.1


