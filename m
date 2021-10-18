Return-Path: <pgowda.cve@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87127C433F5
	for <webhook@archiver.kernel.org>; Mon, 18 Oct 2021 13:48:09 +0000 (UTC)
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com
 [209.85.222.52])
 by mx.groups.io with SMTP id smtpd.web08.37027.1634564888123232408
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Oct 2021 06:48:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Lm4UsrRd;
 spf=pass (domain: gmail.com, ip: 209.85.222.52,
 mailfrom: pgowda.cve@gmail.com)
Received: by mail-ua1-f52.google.com with SMTP id r22so3449389uat.11
        for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Oct 2021 06:48:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zHOPHLkBQy9zYBA1fFrj1qxrwfyBG/LOSaEKoJ7T480=;
        b=Lm4UsrRdTh+FWBNOMhHI5Yk2YgqaT5/bzXpqm8JoutHYplFFQZDw/xbcbUzllxbWoH
         nzG89yae3zxvAv1BipsnDs92SSMCtMl5at99PeJGoMPd/Z7M6tvC7PCtQ65UaPTu946Z
         6D1FX1o5gvImJnXiUguFpRWZMxKfpH/3peKOFgBe6AlqGM6mlOkRV82E0Q1/t+Le1iRb
         OD4AC0GmWD5xKEGE4PwnOJRlzVDte9j74f47eqbq67KY91BUXxN8aRxGn5j/flMIvdFT
         BUbscDVj6ZLeJWHAsEDyON95ocQmEWMoT/ywsu913VWcYz6Xv6lyNE28Pz+gKUnqjazG
         pwpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zHOPHLkBQy9zYBA1fFrj1qxrwfyBG/LOSaEKoJ7T480=;
        b=Mde199PwCniAcZZOkYFVmv2k2AH9SmO1fmiaNpxef1uMahvBDyHkwL5GFCYb2ecatn
         LInfl8BnF1GHh6l/vBwNVuXjVhgxke73xAze/Xvft2M9wi3U/OGQaheJfUBKDddUkWrH
         rdFT/Hqlonzjy1Dzi5lZZ6Svi3kKFip8FohYstRccYZKeyWT1qhruFfVF31YV3rIxznV
         rgBOHZiv2PH3v6OOj30YbzKf4LB9/0DTsUIo9yypm37ARSqigb3N3ZU6Ayd8J8398CW/
         a6zNw2Zi9fsLa5xYZrQFVUn6jdY/yTTaqkyp0f4fcWzL8zPXvV7eopTQD/8rwr91gS4a
         7bUQ==
X-Gm-Message-State: AOAM5307BUbqgTgIk+Q4zpzSLc6JU621f3SoMXbrmv2cTHdm1v5bXzi0
	1IVQ7MSm1Yvk+8pfXpVXy6LCW2xiYjVVcoEQt/c=
X-Google-Smtp-Source: 
 ABdhPJyOf78V499oMB3tDcBhiTgDAQ9JB3zxlS48ujhS/o6x0WqKkhh7uyDuGlA1bD8vJlSNJwVuAevZPIvcydizzyM=
X-Received: by 2002:a67:c390:: with SMTP id s16mr27558950vsj.49.1634564887260;
 Mon, 18 Oct 2021 06:48:07 -0700 (PDT)
MIME-Version: 1.0
References: 
 <6473ab6832d9e7647a8921bd8a7735394379f12a.camel@linuxfoundation.org>
 <20211001072440.18158-1-pgowda.cve@gmail.com>
 <76aaa9e236f1d4519d84f770da9a6e101bf13f4f.camel@linuxfoundation.org>
In-Reply-To: 
 <76aaa9e236f1d4519d84f770da9a6e101bf13f4f.camel@linuxfoundation.org>
From: pgowda cve <pgowda.cve@gmail.com>
Date: Mon, 18 Oct 2021 19:17:55 +0530
Message-ID: 
 <CALY4985dAovpwtKHUTOAcAVW7TJr+cjTzJcssk8xr7MYTcm9pA@mail.gmail.com>
Subject: Re: [PATCH v2] state/staging: Fix directory not deleted for race
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org,
	Randy MacLeod <rwmacleod@gmail.com>, umesh.kalappa0@gmail.com
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Oct 2021 13:48:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157059

Hi Richard,

Thanks for the review and suggestion.

>> I'm wondering if we should just add TCLIBC to PN unconditionally?

I didn't want to add TCLIBC to the code when using default GLIBC.
Hence, I tried to keep the folder default for GLIBC.

However, if you suggest adding TCLIBC to PN unconditionally;
I will modify the patch and submit.

Thanks,
pgowda

