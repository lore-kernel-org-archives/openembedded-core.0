Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27A5FEB64DD
	for <webhook@archiver.kernel.org>; Sun, 16 Jul 2023 17:20:15 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
 by mx.groups.io with SMTP id smtpd.web11.1900.1689528008917758790
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Jul 2023 10:20:09 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=bS21bzxG;
 spf=pass (domain: gmail.com, ip: 209.85.167.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-4f122ff663eso5732566e87.2
        for <openembedded-core@lists.openembedded.org>; Sun, 16 Jul 2023 10:20:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689528007; x=1692120007;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=lOqPhSpR/1DvZ/lNnbjz1VKKea9dMWH3jQ0jQEUVOEU=;
        b=bS21bzxGxzY5RGIbQNnasUXyegoR32rYLKN7USO8Vwk62VE2gOswnAII7KUDeoqOBW
         aIqIDWNp9T/I6s3HxsCsjEqcrbU3/wHwLR04Epi3EEnXViKDqwagYnS7xTFbsILgDd2V
         WOPyKHDIOwHumT5Uvci1SZMsqRbVcYP4dKZ9OHbeGJrGIoiV43phLb111L8pblPP22no
         wku19YmWG7/hEOfg2gxpPbOlpa0NPFRIb1lk1Lbtg9ADsFvee3pDUm/iVVi2Rf9AjfU/
         3R/NdMII81TP4GmoCHXdTMDcHMSmPjQ/6jVfc8AcHX21mthF0s/Kh53n1CPdc/RUgl4u
         woIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689528007; x=1692120007;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lOqPhSpR/1DvZ/lNnbjz1VKKea9dMWH3jQ0jQEUVOEU=;
        b=CChGR5TD0VZ9HGVIYMf/E3RjFIBD/TQC0P+bYGEMU+xR2JUwb2zbD5Hr77fnSvIXKq
         knWLDP2LFmBUAxrz94+YmPOfTYVWnTlXyyGAQJI9TPrhg7EKeA8er0Y5kvnqCMR7PZJl
         cK0yZ/R4Se8cUK5w/ims2OO3QFux0wF01DIK06K1dKu9NCGXKi5KFFogoQiVRPJAU4KE
         137tXby6U0CCn4CopqyJ+d1aly+t4hlBmczixQQxRtnpCuQyZCgQ8YAtXHqdKBMoLsR8
         6ARtlO2eW1Ob9uHZnvgm36LNUB+fH7cadVQqEHlmyLKQXX43dIbNVxht5EhHIYyvBhaG
         Sa3Q==
X-Gm-Message-State: ABy/qLZDFCL3ZevNtxZFh6vJ0OtWZ5EfzSxcA5BpEMePQV/SgwFX2TZf
	uAB7pEoS7vkWmY/RQme3uIGgAGo1RGhy5BdzyoY=
X-Google-Smtp-Source: APBJJlFl+4ujPhzHwIN57NG5psY2aM2+RbIEdCZI6rfb8CsLyUgYbFRFqk95fV1JMn+SysrIlQ0rrktNvwK7/GU3fLE=
X-Received: by 2002:a05:6512:3ca5:b0:4f9:6c44:1bf3 with SMTP id
 h37-20020a0565123ca500b004f96c441bf3mr7841452lfv.62.1689528006798; Sun, 16
 Jul 2023 10:20:06 -0700 (PDT)
MIME-Version: 1.0
References: <20230714161823.20685-1-festevam@gmail.com> <CANNYZj-8RV6tz_7kEH6uz=yZeyd=bPts6AoBqTd5DL3rGGu+yg@mail.gmail.com>
 <20230714213719.GX2066889@bill-the-cat> <CANNYZj8-vQbGEO3yMgRbk2j2L-XOc2EeG6=2w2GhFwUuZqD=mw@mail.gmail.com>
 <c851b7c8-892a-f592-56f1-a69bfa06c193@denx.de> <CANNYZj9o5B7y2yFYtHfwhv=KYk74+ZWqC-kuysP2qRY6ifhMeQ@mail.gmail.com>
 <a8148cd0-46f0-2f52-10cd-d90747179a33@denx.de> <CANNYZj-QcKyeLhxo_U0Wi88SFm4DjcfzxoqGjj3rzanrPo0tgA@mail.gmail.com>
 <20230716150337.GQ2066889@bill-the-cat>
In-Reply-To: <20230716150337.GQ2066889@bill-the-cat>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sun, 16 Jul 2023 19:19:56 +0200
Message-ID: <CANNYZj_KchfdPdgPMKqEzOfVhWhLRGbSonaewfOYeX8XJb-HHg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] u-boot: Switch to nobranch=1
To: Tom Rini <trini@konsulko.com>
Cc: Marek Vasut <marex@denx.de>, Fabio Estevam <festevam@gmail.com>, Fabio Estevam <festevam@denx.de>, 
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 16 Jul 2023 17:20:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184418

On Sun, 16 Jul 2023 at 17:03, Tom Rini <trini@konsulko.com> wrote:
> Does bitbake have any infrastructure atm for dealing with signed tags?
> I'm fine with (for now, as LTS is a hope not a feature) keeping the
> branch portion.  But if it was possible to say it must be a tag signed
> by X key, that would help a little with the concern about moving to some
> more arbitrary commit.

As far as I know, git fetcher doesn't verify tags. They don't even
have to be signed, checking that a tag specified in a recipe matches a
commit id specified in a recipe would also guard against unwanted
commits, but the fetcher doesn't do that check either.

Alex

