Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FAC4ECAAA2
	for <webhook@archiver.kernel.org>; Sun, 28 Aug 2022 19:47:01 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 by mx.groups.io with SMTP id smtpd.web12.62668.1661716017613412868
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Aug 2022 12:46:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=WZhvPCwR;
 spf=pass (domain: gmail.com, ip: 209.85.167.41,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f41.google.com with SMTP id br21so2835182lfb.0
        for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Aug 2022 12:46:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=veQHdPZEyyU3Ow6fftX9SbR/a5L5Ffd7bAVVVC2mO4I=;
        b=WZhvPCwR4r5PSFkLB7WdbGR1p3yResMgQzM/ZeqKROMs7klTp0FtpDTuUbdYcIdlfr
         1RgXsbyQ7/fcnMlUiEHrU2ZHCdCvdIP/Q9+jRGJPDSfWRMplLLXJnckKCW359VpVrS8l
         2p+v8t8kwM7NFY76vqUnDB/Uf4XtgD6xvE3J7cwpXmZd4PQrw6ccnt3wV8S+YlX93QVq
         5/BcfksRzo5tTOoYKWtRlDf3D6g3C52UBsChodq9wicB/WXJIrLuMxqpd4c3Zi8OIj+d
         wqmFFA1VN3WalM6e2hkbe3cWMRxU3Ns+fmnSxhHt5Ol+8suM4NQUSj4yjPnCG6CeCjxr
         GWwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=veQHdPZEyyU3Ow6fftX9SbR/a5L5Ffd7bAVVVC2mO4I=;
        b=jtZsthVE3jQ3IbBCMoX26uM2bwkn2BkqwztGch74smoFWmnUqSl/aVlKNcYYkMxugF
         5596XqVVnKznE+8AoQnjL7xDzZ6q3CHGdHuXAbx9QjdX7BwRZTf/xV097Mm+8ES3TpRj
         M51p8bCc1XX5ExAazMPV4a5pX3TfhAY1llJhcRlhdwyZs4kLU6hicP8DTdZ2ETx5AzXh
         o29NT0oFxSEMMKdBtsC8l7b8IkY8lCAr3mKRBg/QZFeRmMynMjlzJ+BSRze7v+QhPD/a
         bDnyEYZ+DoMLyVr2sgM5FeqYSjSOCzVG4OGxXh+M3jDVhRprD1CrX2eF5ZJx/RBhZve5
         BYEQ==
X-Gm-Message-State: ACgBeo3fQb3kq2GlpM5fpMUfSskHreub7F5+Q0t3RsuyJkJgvhj0Mw/K
	i4rP/L0KTyg81b/qk9vqomX8jBFdlnprV4eqjvw=
X-Google-Smtp-Source: 
 AA6agR4GcXoO/FnkokVw79Su6vnTXDai+fM5xXcnabUy71MSPHiqh6/tsiO6i/C9oRoGI44NCfki5zDdBsgftQ6WMYA=
X-Received: by 2002:a05:6512:3697:b0:492:e5a5:648b with SMTP id
 d23-20020a056512369700b00492e5a5648bmr5297475lfs.521.1661716015617; Sun, 28
 Aug 2022 12:46:55 -0700 (PDT)
MIME-Version: 1.0
References: <20220828193845.7141-1-pavel@zhukoff.net>
In-Reply-To: <20220828193845.7141-1-pavel@zhukoff.net>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sun, 28 Aug 2022 21:46:44 +0200
Message-ID: 
 <CANNYZj_3EUHMu6LZWRQmuFq0MRxrL_s9cybBR8+D4TVN+xy1fw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] image.bbclass: Exclude openssh complementary
 packages
To: Pavel Zhukov <pavel@zhukoff.net>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 28 Aug 2022 19:47:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169999

On Sun, 28 Aug 2022 at 21:39, Pavel Zhukov <pavel@zhukoff.net> wrote:

> +++ b/meta/classes-recipe/image.bbclass
...
> +PACKAGE_EXCLUDE_COMPLEMENTARY:append = "{@ openssh if 'ssh-server-dropbear' in d.getVar('IMAGE_FEATURES')}"

I think core-image.bbclass is a far better location for this?

Alex

