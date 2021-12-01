Return-Path: <max.oss.09@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16C84C433F5
	for <webhook@archiver.kernel.org>; Wed,  1 Dec 2021 14:26:33 +0000 (UTC)
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com
 [209.85.222.54])
 by mx.groups.io with SMTP id smtpd.web11.92134.1638368791701270030
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Dec 2021 06:26:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=JpIJ+Wp8;
 spf=pass (domain: gmail.com, ip: 209.85.222.54,
 mailfrom: max.oss.09@gmail.com)
Received: by mail-ua1-f54.google.com with SMTP id i6so49280425uae.6
        for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Dec 2021 06:26:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=l0d/T9DaGZ9sN/Dy9XFwL4dqR/NjCD4AqeeFmQvL0AY=;
        b=JpIJ+Wp8e0VEiOpSY4mvAXl2h/DzSiNm8uZCurnAVYV+yKhK7FlDA+TB7n3cIvmOq+
         nO7jhIEifDdcn60BTe4upzf05U1EhqJADh2tI4Mq5xLoFjr6fkwkaOFxsJCamLBnAtnd
         b+1wGmTYxaWRNH6xOJnlT2wqfyadDzyFA7Y6fg24NUQlklee4ib980Fszqnr2S0PncZy
         tiaoCa1Rt63HK0kFNTaL68T347oEUxOEX7F2cSBcaJfRgdRsaiRrSb54EAQRAIrtcDOA
         +jxnYYZJhOcHa+TIPH2PRZYT6KUpZ5Veo+iEFGmyt4KqYe7tePO7tLBpIYiZd42jKrli
         YfMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=l0d/T9DaGZ9sN/Dy9XFwL4dqR/NjCD4AqeeFmQvL0AY=;
        b=JykuF0tB4Gshrwv/Dv4YrqPiNX4E/k6wrpuRykqesCyOcEOOzJ4+wHsFZ+M9Y9/zIF
         m+kmKyOI5QhuVNMzxBQkynCLnFZNd696JrbSStQx+RS4rpweMhmX4wCPccsSIxBPVaXU
         fvcLhNiR4Y7CHTBqqt6oBiSXbNkzQRW7ps1QZTKW3NL7GgTXIPN5J4AQRnJM85nJ6QQn
         Of1oZKQJDt9Sy9bNp0yYodtzIPKjwi7ejB9FLcpoWoWHmlVu/HPkeGxyb4w9c5mIKak/
         zPT362qgU/mpisLYFbHFALDUk4WPt3khgOT6KWenCLaVgsrRYySC4yyrWy3WvMZ4Ihlm
         c21w==
X-Gm-Message-State: AOAM531qzdsDwvgm3isgX1fqQ3eS9V4s5bkYSaIs4616eMFNhvOiACbJ
	mf8D/sH9rNM9ClBQV1ynZxY/KQD2G8XSCsIF1kX2Zk3rBiP0Xw==
X-Google-Smtp-Source: 
 ABdhPJwg5XjsgE3xjoFzbi2m/DDWMIkFiqlr25FeDsMN3OZSUUvr7WsUPRfWS6pnHSvY/bXL7C6dZJ1LcvI1dcaQ/20=
X-Received: by 2002:ab0:6354:: with SMTP id f20mr7865025uap.116.1638368790640;
 Wed, 01 Dec 2021 06:26:30 -0800 (PST)
MIME-Version: 1.0
From: Max Krummenacher <max.oss.09@gmail.com>
Date: Wed, 1 Dec 2021 15:26:20 +0100
Message-ID: 
 <CAEHkU3Va4+i+Y2mhxMWxS+rcTxaTFFrfTjchPedYE8yAFCsCuw@mail.gmail.com>
Subject: [OE-core] patch files in a directory aren't applied
To: OE-core <openembedded-core@lists.openembedded.org>
Cc: Max Krummenacher <max.krummenacher@toradex.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Dec 2021 14:26:33 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159033

Hello

I tried to add patches by specifing a directory in SRC_URI and have
bitbake appling all patch files in it without explicitely adding the
individual file names in SRC_URI.
According to the do_patch description [1] that should work, however
for my example recipe it does not. The files in the directory end up
in ${WORKDIR}/path_to_lots_of_patch_files/ but none of the *.patch
files are applied.

Looking at meta/lib/oe/patch.py src_patches() I believe that the
documented behaviour is not implemented.

Does anyone know why this is documented but not implemented?
Has it been removed for good reason and is now undesired in OE?
I'd be willing to work on the feature.

Max

[1] https://www.yoctoproject.org/docs/current/mega-manual/mega-manual.html#ref-tasks-patch

