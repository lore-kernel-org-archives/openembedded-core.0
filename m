Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99D49C433F5
	for <webhook@archiver.kernel.org>; Wed, 25 May 2022 13:55:36 +0000 (UTC)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com
 [209.85.128.177])
 by mx.groups.io with SMTP id smtpd.web11.7063.1653486927225420451
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 May 2022 06:55:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=K6iBH3J0;
 spf=pass (domain: gmail.com, ip: 209.85.128.177,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-yw1-f177.google.com with SMTP id
 00721157ae682-2f83983782fso215474327b3.6
        for <openembedded-core@lists.openembedded.org>;
 Wed, 25 May 2022 06:55:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=qkYksmlBEV+Mqf1gphy8LSX/0NjTDKb3wU8NoGCdv/c=;
        b=K6iBH3J0wezuaEebrm57pSrozCWwgRKYSUyoF3h4TkQ9zJRHxaAPwXDrq6v9osoVHA
         qwXefw6wole4dZZVJZRpq7Kb+zOsPChbbuj/O4W8rNUDXTYL2BBeXlFPS+z0AwbqOxuB
         eZV2H5fHm6uJitGRiNwu8xFNdEJFugLbLNkxNBl/4w0z2qNiRRbWOAC6tIrMXmKUfVin
         r/JHorfqobsT/6rwUx0AVVFURr4tVKi2P0KzptCLTw6ZO/883lfSq80KvLHQCYuaxbuY
         QIQ4uF96gpB6PyR/Og1SPQvAmt4NSUMZNav7VhsUO7BKqgkjcCBZp5Pvr90HRaWnU0oA
         ZG7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=qkYksmlBEV+Mqf1gphy8LSX/0NjTDKb3wU8NoGCdv/c=;
        b=HOazDdH/9ExPAvV9NsDZWB9jSXolMYUgSag2XaB7QLOpNJBv60yDU15ZysnkEAut7Y
         sYMfgmqUcRp19gqPsTuvmx/PsRlUtUyvSLh26EcVIdL9XJEL37YcN3vR17E+rv5N14wM
         NZ1BKLDxpyxIqNc+8YtVrrNdY8+HbGhNW1DK2t5AqTHBtDAKwSqQiQR9Gp4xmr6vn657
         5e574VU0u5MqE9mwCkF1TyRrIraMhnmGdHfRVBnk1XVn3jQrtJqQqgvKiXQjK+y0GeIF
         Lj/5OCjFPueanRSB13d7KZtAMK8pOf4b63obEC+BX+OqdWToSiHjIsdNGPwxKkI5quFg
         o7rQ==
X-Gm-Message-State: AOAM531JB5AVxLC+CQ7d5XjzqIhPNfc/BALt9aQr+SpdwEW+Z3nFBeIZ
	MrPF8qcKR8q1X1/Tbh7e8t5114JASaLelP+qqoY=
X-Google-Smtp-Source: 
 ABdhPJyeo3uegSDFNbMRNHPSSYiC40FSRFt9UVbKmWXQhK3M8zAM9Pa0LEFYRSjClbQL1MkJhsShwRlmGlYx9okjLow=
X-Received: by 2002:a0d:f406:0:b0:2f4:e5c2:90f0 with SMTP id
 d6-20020a0df406000000b002f4e5c290f0mr33812012ywf.407.1653486926365; Wed, 25
 May 2022 06:55:26 -0700 (PDT)
MIME-Version: 1.0
References: <20220524152401.1663317-1-ross.burton@arm.com>
 <20220524152401.1663317-9-ross.burton@arm.com>
 <20220525100322.1a50d726@melee>
 <9BB79F38-1612-4383-BAE2-DD4FD065476B@arm.com>
 <CADkTA4M_j9rPa+FscV93XZgDvs_HpQaXg_SFZAD2yW9Ldf=ihg@mail.gmail.com>
 <PA4PR08MB7411343691EFAFDEA1EEE9C7E8D69@PA4PR08MB7411.eurprd08.prod.outlook.com>
In-Reply-To: 
 <PA4PR08MB7411343691EFAFDEA1EEE9C7E8D69@PA4PR08MB7411.eurprd08.prod.outlook.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 25 May 2022 09:55:15 -0400
Message-ID: 
 <CADkTA4OAQkOiV44gR+rdurZQb7U+qPaUGO5ZYZwYU72agSPqsQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 9/9] lzo: remove recipe from oe-core
To: Ross Burton <Ross.Burton@arm.com>
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>,
	"openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>, nd <nd@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 May 2022 13:55:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166124

On Wed, May 25, 2022 at 9:46 AM Ross Burton <Ross.Burton@arm.com> wrote:
>
> Yes, it mainly blew up because the tested oe-core branch had the removal =
of lzo but meta-oe didn=E2=80=99t have the addition.
>
>
>
> Would you like a resend of the xen patch to add an option, but leave it a=
s enabled?  Or will you merge this patch which disables lzo?
>
>


The patch is fine as-is. If someone needs it on by default, they can
scream and send a patch to change that status :) It will still be
available, so they can easily carry bbappend with a packageconfig.

Bruce



>
> Ross
>
>
>
> From: Bruce Ashfield <bruce.ashfield@gmail.com>
> Date: Wednesday, 25 May 2022 at 13:59
> To: Ross Burton <Ross.Burton@arm.com>
> Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>, openembedded-core@lists.op=
enembedded.org <openembedded-core@lists.openembedded.org>, nd <nd@arm.com>
> Subject: Re: [OE-core] [PATCH 9/9] lzo: remove recipe from oe-core
>
>
>
>
>
> On Wed, May 25, 2022 at 7:26 AM Ross Burton <Ross.Burton@arm.com> wrote:
>
> On 25 May 2022, at 09:03, Luca Ceresoli <luca.ceresoli@bootlin.com> wrote=
:
> >
> > Hi Ross, Bruce,
> >
> > Il giorno Tue, 24 May 2022 16:24:01 +0100
> > "Ross Burton" <ross.burton@arm.com> ha scritto:
> >
> >> LZO is a fairly archaic compression format that hasn't been updated
> >> since 2017.  It's now unused by anything else in oe-core, so remove
> >> the recipes.
> >>
> >> Signed-off-by: Ross Burton <ross.burton@arm.com>
> >
> > I love removals of archaic features...
> >
> > ...and how they make things explode :-)
> >
> > stdio: ERROR: Nothing PROVIDES 'lzo' (but
> > /home/pokybuild/yocto-worker/meta-virt/build/meta-virtualization/recipe=
s-extended/xen/xen_4.16.bb,
> > /home/pokybuild/yocto-worker/meta-virt/build/meta-virtualization/recipe=
s-extended/xen/xen-tools_4.16.bb
> > DEPENDS on or otherwise requires it)
>
> I=E2=80=99ve also just sent a RFC patch for xen to disable LZO entirely, =
but I=E2=80=99ll leave that up to Bruce to decide.  If lzo is removed from =
core it will be added to meta-oe, so xen will continue to build either way.
>
>
>
> right.
>
>
>
> We'll keep it as optional.
>
>
>
> But isn't this just a timing issue for the failure ? Or are we missing a =
dependency in meta-virt on where this landed in meta-oe ? We definitely hav=
e meta-oe dependencies in meta-virt, so the AB should already have those in=
 place .. so this must have only blown up because it hasn't landed in meta-=
oe yet (nor should it probably have, as this is a test of the removal in OE=
core) .
>
>
>
> Either way, I'll merge the meta-virt, make-it-optional patch shortly and =
this should be good to go.
>
>
>
> Bruce
>
>
>
>
>
> Ross
>
>
>
>
> --
>
> - Thou shalt not follow the NULL pointer, for chaos and madness await the=
e at its end
> - "Use the force Harry" - Gandalf, Star Trek II



--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

