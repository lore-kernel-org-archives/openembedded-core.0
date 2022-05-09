Return-Path: <jupiter.hce@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7C59C433EF
	for <webhook@archiver.kernel.org>; Mon,  9 May 2022 04:59:31 +0000 (UTC)
Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com
 [209.85.160.43])
 by mx.groups.io with SMTP id smtpd.web11.28397.1652072367371140989
 for <openembedded-core@lists.openembedded.org>;
 Sun, 08 May 2022 21:59:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=EFS4g6i3;
 spf=pass (domain: gmail.com, ip: 209.85.160.43,
 mailfrom: jupiter.hce@gmail.com)
Received: by mail-oa1-f43.google.com with SMTP id
 586e51a60fabf-ed9ac77cbbso13492854fac.1
        for <openembedded-core@lists.openembedded.org>;
 Sun, 08 May 2022 21:59:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=bqiraUU8Q84EqWePziYorWNkwcqu7B2vKJbRxrV9yZw=;
        b=EFS4g6i3+vSuitR5rmoRZgrjRwKnRocqgbBfjVPXYajau4rh+LvjQJ24FUz6DDHI/E
         hEsTD5ZfNRq1aQR6joJ2Qv2NDVPsRfG4x2ITFt8N1QsX5bUihu3891zFUPebaGEFh7nm
         wySu4Ufpz2MJghYQPb0oS/dRPIM6OyIHEPxQQH4qIE9EwPY/D5gC4BmvZJTOYPr7PDhk
         7c0BU9nWRy8JxCD4SImDpoR6WitxCxIoDh12ip99p9SqpGuS/1Jhc3v0SrbQj625yTT2
         LmBu9MYcKG7Rl3hPNd99C75RTsbcqvvjb2wwF5exhbQEqRXF1LoC20afUGG8ssmpmqkX
         X4Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=bqiraUU8Q84EqWePziYorWNkwcqu7B2vKJbRxrV9yZw=;
        b=5pVBx76eo92vqMRUTo9c2TX80uJ5cab5frEEPRqBoogTIC5LTbuPo/E8ORqlHrMQcG
         g+ZvuQkY6EVGEhYPpLbJKrS2YWYkvacxvRGre0ir8lEFewPZIwVU6lw5CkaQRfPb/F5m
         sinnnovZb1CN/qSa6B997xIBIRvJqjbjTUYXaBvDqSLQBaJzmm43fTL1QoYmdZ8qYQBm
         7cwvzs5zSXNLDYi5+jzlBOgRYWoU9M1yvDH2G6AEl/sVkMMcx/PC9znNazuquo+ZLkZ/
         4Ju+AD6dwxQFNT2YJd5vWszosVR16c1KOJ0qi93kalwIVSdJAkCw7V+K7Od5yn57XMLj
         xi8A==
X-Gm-Message-State: AOAM531qQP/ifmy86vh/0hLI/MpF05wGXERVnyXbnvEttg3xHv0taRSh
	rYcGSG9+XaUD1aRu3Aufrcoo+dltYSfqOTrV7UlYc2Ho
X-Google-Smtp-Source: 
 ABdhPJzLI9ZEyVJrRV6TFpMq4bFf33DtmIUfRX0wbjXH3foreKHKSEldTZrkZlZMaG2kQuZYv20WhDnIybA8oB+VBZc=
X-Received: by 2002:a05:6870:e747:b0:ed:e343:4906 with SMTP id
 t7-20020a056870e74700b000ede3434906mr9660080oak.78.1652072366719; Sun, 08 May
 2022 21:59:26 -0700 (PDT)
MIME-Version: 1.0
From: Jupiter <jupiter.hce@gmail.com>
Date: Mon, 9 May 2022 14:58:50 +1000
Message-ID: 
 <CAA=hcWQLqjqmkNkAZR_uBCRTnkX9nGwoLP+vorji_GdcBVjGBw@mail.gmail.com>
Subject: do_package error in kirkstone branch
To: yocto <yocto@lists.yoctoproject.org>
Cc: oe-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 May 2022 04:59:31 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165383

Hello,

I am puzzled by the following final do_package errors for dbus,
glib-2.0-dev etc in the kirkstone branch, that error messages were
never seen in honister and other branches. dbus glib etc are from
oe-core, could oe-core insiders advise what those error messages are
about and how to fix it?

ERROR:  packagegroup-solar-1.0-r0 do_package_write_ipk: An allarch
packagegroup shouldn't depend on packages which are dynamically
renamed (dbus to dbus-1)

Thank you very much.

Kind regards,

jupiter

