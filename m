Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FAA7CD13CF
	for <webhook@archiver.kernel.org>; Mon,  2 Sep 2024 10:18:08 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
 by mx.groups.io with SMTP id smtpd.web11.35503.1725272286915107714
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Sep 2024 03:18:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=C4wxRi3c;
 spf=pass (domain: gmail.com, ip: 209.85.167.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-53349ee42a9so5408203e87.3
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Sep 2024 03:18:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725272285; x=1725877085; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Z48hDs4LBP1gm9JdQ4icwfbm+/ORAm/K/+yiul2Tf20=;
        b=C4wxRi3cOBvipE9FDhzPfx76H+0jGnM5h4lHoK1jQD1r1OmrBMEWx8VRl5+/l04nSP
         sshFvHTr5WiLWuFDXrs2lFMmdTfddpqB13lvFG7gOylctLOyjAkF5J3PBpWg5u1cwxhR
         /0AWyxrmjBvYTiw44roSesJdv0bfYc6Iwj/dxbG0FSIrpsVPkU8mp6Ur4rXE3hQjxB22
         ReZn+RAZCHKjRuhC34jcO62ntQIrGPZhjmecJ8AmWFg5ZIf+FqdjGiar49vntSsKurmE
         7rQJ/7glaRtoH9yS6NcTd2vu3DY1Pk7fRm2PXhV/9uBQa5iJ4hvYGzsfXILx+wipJl6R
         AcIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725272285; x=1725877085;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z48hDs4LBP1gm9JdQ4icwfbm+/ORAm/K/+yiul2Tf20=;
        b=fGdc6Jbcs1oUAl9QtmwM1m5sV0nJcalNMX56kdiI9tsZYoIh4y/KeawUukNuubg5BO
         QLZ987e0mf96q9VumK8NhEybrtz7M82BaZDgZxdFPbdXh8wqPBI5c5ohovvtavGWIuRe
         R8jQB+3/qZAyBF7wpaUH46YZ56Lt9mOQT0SP7RpMuekjX6BU+WMd0ZTevFPo/hMA+/+u
         l7LMu4TU/UeWLA+DQ/EmX8MVfpqJKuHE7+vjMPXPjxRkBgRfs3dOtIrC66rMIQShAO54
         THfWBVPPZupMck+ogwSW0kNakeEHb4cGPb6R5Prnk98Dd1uA/N8Z7Bfspe7BYjGmV2Vr
         ZzNg==
X-Forwarded-Encrypted: i=1; AJvYcCV36niTjI/1VhagYZe2zz1+cMchh9SP/dE33buXGLhxUDj1sKRhmk7l4Los1U3OGS5e9zzcj1Fg6MISsFdCnQ4vSA==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yy+dXrTiNj25Bt6xLdEmBabSVoO2i1aGrZT3dyUhh/cqh8xlek2
	Qq3DHdtWGuXyZkvliIYZ6W+Uy2J6izJQAldpskXTz4hE7LJNl8O9rAa0y6/07tKaDTWIJ+vJ+j/
	T89ozEJ4JEOLDjczsZKAhAZxHjbA=
X-Google-Smtp-Source: AGHT+IELNZQuIGv2ppRiErHGHQJPIv2UCJBaDT7Vq9+zcQtPguchO5XFH34/888Q3EIcZoA7cURhsGxxcbDZiQAW/mk=
X-Received: by 2002:a05:6512:12d6:b0:52c:deba:7e6e with SMTP id
 2adb3069b0e04-53546b4a1damr7648343e87.29.1725272284215; Mon, 02 Sep 2024
 03:18:04 -0700 (PDT)
MIME-Version: 1.0
References: <20240902094117.31156-1-mikko.rapeli@linaro.org>
 <20240902094117.31156-2-mikko.rapeli@linaro.org> <99e13a8ab6cea2424298d97466ad48540cee1209.camel@linuxfoundation.org>
 <ZtWOBWtSoCnyZ2DF@nuoska>
In-Reply-To: <ZtWOBWtSoCnyZ2DF@nuoska>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 2 Sep 2024 12:17:53 +0200
Message-ID: <CANNYZj-57xLA-UnJ+nJvdpcu=+AgygMPoz2Pjzxs-QE+vxJ=nQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/3] systemd-tools: add recipe
To: mikko.rapeli@linaro.org
Cc: Qi.Chen@windriver.com, openembedded-core@lists.openembedded.org, 
	Erik Schilling <erik.schilling@linaro.org>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 Sep 2024 10:18:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204073

Wait. Isn't this ukify.py thingy already provided from
systemd-boot-native recipe?

Alex

On Mon, 2 Sept 2024 at 12:06, Mikko Rapeli via lists.openembedded.org
<mikko.rapeli=linaro.org@lists.openembedded.org> wrote:
>
> Hi,
>
> On Mon, Sep 02, 2024 at 10:59:22AM +0100, Richard Purdie wrote:
> > This will fail in CI as there is now maintainers file entry...
>
> Chen, since you are systemd maintainer, would you mind if I add
> systemd-tools for you too? It's only the ukify python script
> currently for native use cases at build time.
>
> --- a/meta/conf/distro/include/maintainers.inc
> +++ b/meta/conf/distro/include/maintainers.inc
> @@ -795,6 +795,7 @@ RECIPE_MAINTAINER:pn-systemd-compat-units = "Chen Qi <Qi.Chen@windriver.com>"
>  RECIPE_MAINTAINER:pn-systemd-machine-units = "Chen Qi <Qi.Chen@windriver.com>"
>  RECIPE_MAINTAINER:pn-systemd-serialgetty = "Chen Qi <Qi.Chen@windriver.com>"
>  RECIPE_MAINTAINER:pn-systemd-systemctl-native = "Chen Qi <Qi.Chen@windriver.com>"
> +RECIPE_MAINTAINER:pn-systemd-tools-native = "Chen Qi <Qi.Chen@windriver.com>"
>  RECIPE_MAINTAINER:pn-systemtap = "Victor Kamensky <victor.kamensky7@gmail.com>"
>  RECIPE_MAINTAINER:pn-systemtap-native = "Victor Kamensky <victor.kamensky7@gmail.com>"
>  RECIPE_MAINTAINER:pn-sysvinit = "Ross Burton <ross.burton@arm.com>"
>
> Cheers,
>
> -Mikko
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#204069): https://lists.openembedded.org/g/openembedded-core/message/204069
> Mute This Topic: https://lists.openembedded.org/mt/108223984/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

