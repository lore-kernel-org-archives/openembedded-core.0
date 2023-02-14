Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3F1CC61DA4
	for <webhook@archiver.kernel.org>; Tue, 14 Feb 2023 06:40:12 +0000 (UTC)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
 by mx.groups.io with SMTP id smtpd.web10.1076.1676356808275243094
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Feb 2023 22:40:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=hHwp5ba8;
 spf=pass (domain: gmail.com, ip: 209.85.208.175, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f175.google.com with SMTP id l3so17317655ljo.5
        for <openembedded-core@lists.openembedded.org>; Mon, 13 Feb 2023 22:40:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=f7BjJpCfirr0bHWuYhEGRQVZ1jRcdR5WCWPGhjYfnT0=;
        b=hHwp5ba8lqA/4QzXkv0OQFuxTsa+ObBwriywPBidbZ4LxgVi9XooD+DW/OPnUYoG4h
         fqLzfFm9cpXI69m/tu9p6vy50Y3H9XJJ77KI/csiOIu8PCLaiuZFRvLJfQ2etjA/2Nid
         vAG3MEVTBxYZsvpKrpPnkjCXgTH4PhPXVNrvFMPBR+fVBDJ8qeC0IdFctY9rAodLoArZ
         qBt4uccnptNM2dj5H4D1p8HAIeBXMVAehU9qr06TZMAsSGovpIG4jJrKMDDnVSubLkpd
         6Rm/RwnKZzrST+lnikVW88QBotksaSarHVXmQXMfH/FJjthA2GHTnGasAsqX2nixre7E
         BHFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f7BjJpCfirr0bHWuYhEGRQVZ1jRcdR5WCWPGhjYfnT0=;
        b=hz/FSpXZPnzOqBnLr9SS27j3HYbDCiMFAtpgX8/iOID/zbOCk97iyrF45nZQCF+BgL
         pQDOa29pC/FoFUi3GxvARGG61gCvjfqVViQFdAaW9S0mqd9UZoZ+9myJmLkQmDQwrsIJ
         mHjRX+C7+pe5kKqTdqB5COa7nt7iKk4F8mFbyCYlwMGz9LewSkOlZYp43inN/7OQorI7
         fQiEyLKs8nk9qLhZYZtewDQ9VlXO9UoAWpv8llbbeGzCij0HFwS4OzEhDfkHeiGd7F+P
         61cXBngTIWKFfpQI5XKby1f9a2VlJb8Pv66WiJXSneqQhfySUa8CeYVyAjiui8K3JOwa
         wk2w==
X-Gm-Message-State: AO0yUKVQ3nmu6LSL6frbn5l116l6dexwEvtaKGFGPyNSKW2ug3902iAv
	Uc6sNsdOMq77XwCHrpC1368Qapr2EsEFJijKCys=
X-Google-Smtp-Source: AK7set/Qpw46k++zzaiWDYobeUPavD22GR78M90gyF3V6s8D/mKsP7pYiJr1f6tTZiz4bIe+0tMe7tR4kbgYi1gMxt8=
X-Received: by 2002:a2e:bc09:0:b0:293:4ab4:3bb1 with SMTP id
 b9-20020a2ebc09000000b002934ab43bb1mr105864ljf.4.1676356806471; Mon, 13 Feb
 2023 22:40:06 -0800 (PST)
MIME-Version: 1.0
References: <20230211153828.2113018-1-dmitry.baryshkov@linaro.org>
 <CANNYZj-O2ozNM6NUJuKEzKHiOPf7y1kcE=b2eDwwkAY4RBCKkA@mail.gmail.com> <CALT56yOs97bVa0hc9NZs80qg_MJX6yOJtcF4MPr4XP5hZj_FzA@mail.gmail.com>
In-Reply-To: <CALT56yOs97bVa0hc9NZs80qg_MJX6yOJtcF4MPr4XP5hZj_FzA@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 14 Feb 2023 07:39:55 +0100
Message-ID: <CANNYZj9T4EJ=ph+oKhLQJd0ino7PYdSWvLpMduWNgm4ny3nruA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] rust-android-sparse: add lightweight
 simg2img/img2simg implementation
To: Dmitry Baryshkov <dbaryshkov@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Feb 2023 06:40:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177123

On Tue, 14 Feb 2023 at 04:42, Dmitry Baryshkov <dbaryshkov@gmail.com> wrote:
> My goal was to move sparse image handling in a way to be able to
> generate them from the BSP layers, removing dependency on the meta-oe
> layer. This way it is possible to generate sparse images
> unconditionally and then let the user feed them to fastboot.
>
> But yeah, if it's recommended to keep it in meta-oe, I can move my recipe there.

Just to clarify, to get something into core, you need to explain what
are those 'android sparse images', what is consuming them, and whether
supporting them fulfils a broadly useful scenario (this is the hardest
part, as there has not been interest from others). There should also
be testing, and commitment to maintain the pieces.

Alex

