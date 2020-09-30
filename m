Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com [209.85.222.196])
 by mx.groups.io with SMTP id smtpd.web11.6069.1601502916903956201
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Sep 2020 14:55:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=eBMbAZVd;
 spf=pass (domain: gmail.com, ip: 209.85.222.196, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f196.google.com with SMTP id w12so3184838qki.6
        for <openembedded-core@lists.openembedded.org>; Wed, 30 Sep 2020 14:55:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=P6Ip7lJkee81PGpbvkSsCQYa+agRBoNHZyxO6xC3zew=;
        b=eBMbAZVdvUB7UQQea9vCJpK5zAbX8Mtyj/pWc7VhlRWfyhyH1a/X1ZttxbrfzOf2uN
         3ubfzLYOLAI3mwPF+4EQSeSK72+yF/ud+2zU5XflLCImMqaoyNdGS6WwPZ0b6L76utEU
         xLSmOgYwoR1hVVxEGW3Gh+ebpqeJxuitbE/97dEyJyUxpEBDMrEWQEjKCq8IEJLmjZI0
         D70gF4MndA4pAgoTHSIKe74K0DARErPmjFRRuoIGGpU2wzSVc55yFcvNR8Bzm+Plp/y8
         uH6bHYzfDrQih2y9vK7YsTv6GvDgTAFiqs1CraHTSltdAOn9/C86gqpmOeKYV3Kdh1fs
         kvuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=P6Ip7lJkee81PGpbvkSsCQYa+agRBoNHZyxO6xC3zew=;
        b=IKRE5Ohw0KsnerfIPMfJlDlgPPIWbYalIAw4TOxLhSd1MpE1caIcaCVMqXnctQ2ULf
         j+7LKu3KRClbzweXVo0lR1Loezg2nSmPDCkvOkHPmnkCfUSp17vwabwnCvrlxXGrqhgs
         snrftFNYSNShVuddvIA52vxVwG+00j0E05H1uMSaQc/KJoZkQ7EAYjA28baNdOMP3ewY
         j0HvBe5RLoyQsC8VlBKQTt2YrdKCwS5JSrcz+XfevW1WdVIniIwsboNb3LGAjsuPGW4d
         4+BxzteVCGnlfpqrQj50HZTdgzcilVwDHX3l9r6NrEyTfiM0ZgZA9IjPz1mVn/DfXWmI
         kKAA==
X-Gm-Message-State: AOAM531Z7CjC8xWLuA5tu7vDm52BiszIiL3fUQLTbyQMuolzoVuw/aj2
	sgsBE4q+EefQVQYx9ZrPyi+N4CJTZQVpvmgYInc=
X-Google-Smtp-Source: ABdhPJz5g8+ZqgIc3CR46ITcoqRMPTcXV8wwUKkF5VbR0+IURRAePrSrzzGUQu2Hang+hwozLMSrt9CxN8WB30s18Gw=
X-Received: by 2002:a05:620a:1670:: with SMTP id d16mr4828826qko.474.1601502916026;
 Wed, 30 Sep 2020 14:55:16 -0700 (PDT)
MIME-Version: 1.0
References: <20200930211644.119920-1-otavio@ossystems.com.br>
 <CAMKF1srtqeTcBsXoR=DLa73_b7Zswf+TbuAw2zZPiRpraoZi-Q@mail.gmail.com> <CAP9ODKqcGWVwmX_5Gf=GKTAuAPSAMsVx9v_2er8-gb0VQJkNRA@mail.gmail.com>
In-Reply-To: <CAP9ODKqcGWVwmX_5Gf=GKTAuAPSAMsVx9v_2er8-gb0VQJkNRA@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Wed, 30 Sep 2020 14:54:50 -0700
Message-ID: <CAMKF1soHfZrR5vCkbZ4wmYi+7-phdty_sBR74MYsth5Nw7Q88Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] weston-init: Add environment file support for systemd unit file
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>, 
	Fabio Berton <fabio.berton@ossystems.com.br>, Otavio Salvador <otavio@ossystems.com.br>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 30, 2020 at 2:41 PM Otavio Salvador
<otavio.salvador@ossystems.com.br> wrote:
>
> Em qua., 30 de set. de 2020 =C3=A0s 18:31, Khem Raj <raj.khem@gmail.com> =
escreveu:
> > On Wed, Sep 30, 2020 at 2:17 PM Otavio Salvador
> > <otavio.salvador@gmail.com> wrote:
> > > diff --git a/meta/recipes-graphics/wayland/weston-init/weston@.servic=
e b/meta/recipes-graphics/wayland/weston-init/weston@.service
> > > index 0a1df15bdf..ce8f4fb71a 100644
> > > --- a/meta/recipes-graphics/wayland/weston-init/weston@.service
> > > +++ b/meta/recipes-graphics/wayland/weston-init/weston@.service
> > > @@ -29,6 +29,7 @@ ConditionPathExists=3D/dev/tty0
> > >  [Service]
> > >  # Requires systemd-notify.so Weston plugin.
> > >  Type=3Dnotify
> > > +EnvironmentFile=3D/etc/default/weston
> >
> > Lets make it not fail when not there
> >
> > EnvironmentFile=3D-/etc/default/weston
>
> We made it required as it is always installed. So I think it should be
> required. How it could not be available?

These are optional environment settings, this will enforce someone to
push an empty file if they need to override it instead of just
deleting it.
