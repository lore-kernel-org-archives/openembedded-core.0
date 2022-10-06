Return-Path: <liu.ming50@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2ABBAC433F5
	for <webhook@archiver.kernel.org>; Thu,  6 Oct 2022 11:27:18 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 by mx.groups.io with SMTP id smtpd.web12.4650.1665055637230464569
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Oct 2022 04:27:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=mW66qOGs;
 spf=pass (domain: gmail.com, ip: 209.85.167.44,
 mailfrom: liu.ming50@gmail.com)
Received: by mail-lf1-f44.google.com with SMTP id y5so2245576lfl.4
        for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Oct 2022 04:27:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1EobYdfZLhvM90B6zBfjDpJ8kUkAwlhXvXLSlzXPkg0=;
        b=mW66qOGsIyeVo/ofnNx+5jK6TzgIfc7CC5I4E6zs+J8AJ7gRT621NiYhfghQ3HEbwQ
         sQeDnUEaqCn0sfFyP1QZj6r9cfoM0kbapT21dMZ6r5kseR8pDlWqZ+Y2l0lzQOVqeq4s
         AHidqGkLOp7NZm7wrEVAAw7Rtkb5TRsXVxVO0n1FxXY9K+kftdZGGcoYEjf1Q9AYSWZX
         KHIxUWy/T6n61KabyZVKZheZSyQuH5nlIlRcSHD2KeQwsssOb+4fTnxgm2HWA0j9Uv1l
         aUt8igQR/ohd4zQdk9Iy5Ox8iEplgh2VidxyV+rXDW0mGd2y8oP5Pt2I66XMMJBXXJPo
         9Kbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1EobYdfZLhvM90B6zBfjDpJ8kUkAwlhXvXLSlzXPkg0=;
        b=k4qZ6ThCy0wAw2rj9d/UFV0aRViBOXbY6NUg5rujDM1f8qPAJHVOr92TSlwZqTCNv7
         Q3VNdjtEeLqhR8RKCCUM4zxaunRRUOYSb4ZD37f6ZwfB2O/T/ojOApoQPgNF4fIH9swh
         CbsSB6jo7D9Ru6z+KC6jNE5/PejtcowXSgEH0+6A4WZcgsZaiqxM/n8TgA5eDXF9DLyS
         h2pLbJMbjY8polIz4ohGm89sS3HCTEHV+1UaZa3zIJ3bxJfb8XXO6Srt1QrSpDky7PyU
         naNAALpEL4B8kgyWGTcuAtH5Mi2PUH39PssDIKFCeWeuKLmqfwwtU0O8Ld5T5wnz9BTW
         u2NA==
X-Gm-Message-State: ACrzQf13q1vWt6paH+KEwZXQ9QZqegGLTT4xEPbI1tSu3qjF+s/Ufpfr
	7OrUbS1ICH77XKPreD9sv4/9YoU1Sc8=
X-Google-Smtp-Source: 
 AMsMyM7mxcZ99j2mOnAUebLcbKhuJXpDJtrg5RGkXsbvLa5wAncPu0Ue9m1RqVcn0mQD67TqnJOSwA==
X-Received: by 2002:ac2:5616:0:b0:4a2:61f6:85e9 with SMTP id
 v22-20020ac25616000000b004a261f685e9mr1574939lfd.419.1665055634813;
        Thu, 06 Oct 2022 04:27:14 -0700 (PDT)
Received: from peterliu-Precision-7530.emea.group.atlascopco.com
 ([2a00:801:74a:8a14:c53c:8bda:a430:fba8])
        by smtp.gmail.com with ESMTPSA id
 i8-20020a056512318800b0049ebc44994fsm2668056lfe.128.2022.10.06.04.27.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Oct 2022 04:27:13 -0700 (PDT)
From: liu.ming50@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Ming Liu <liu.ming50@gmail.com>
Subject: [OE-core] [PATCH V4 0/2] bluez5: change configuration directory mode
Date: Thu,  6 Oct 2022 13:27:10 +0200
Message-Id: <20221006112712.23062-1-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Oct 2022 11:27:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171493

From: Ming Liu <liu.ming50@gmail.com>

The changes in V4:
1 In commit message, add reference to
  https://git.kernel.org/pub/scm/bluetooth/bluez.git/commit/?id=00cfb36e20e3c35db2150e7d0351ad7b8442e2d8

2 Make testsdk directory writable before removing it.

Both as suggested by @Luca Ceresoli.

Ming Liu (2):
  bluez5: change configuration directory mode
  testsdk.py: ensure the testsdk directory is writable before removing
    it

 meta/lib/oeqa/sdk/testsdk.py                | 4 ++++
 meta/recipes-connectivity/bluez5/bluez5.inc | 2 +-
 2 files changed, 5 insertions(+), 1 deletion(-)

-- 
2.25.1


