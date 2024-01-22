Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A33BC47DD9
	for <webhook@archiver.kernel.org>; Mon, 22 Jan 2024 20:39:23 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
 by mx.groups.io with SMTP id smtpd.web10.3698.1705955953964888274
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Jan 2024 12:39:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=giKkBzs/;
 spf=pass (domain: gmail.com, ip: 209.85.167.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-50e9e5c97e1so4403026e87.0
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Jan 2024 12:39:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705955952; x=1706560752; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hu2BEQFv4SKaaRYW229xQlUPT0365RScPfsBBNdsUqk=;
        b=giKkBzs/gu5AS+/2f+LirV0rcLKbaAWqDs8Hgld1nWsSkYiGhDHtzwlhFGbHdFhDT3
         Nn8puktoAPAclL+HBqI3C9N6J/BT4xSZh2Ei16yvpemjY6ZQPM2P2r10dQCrchew0bko
         vdaBm5vviB40NP/oKb+qqcRPxn9aRh3qqvdM7u6XXsiaUS67e/mGg9HJC9LtnVBbSMk2
         PyB9DtDmdC17akk5olfm0B5A/ry4oaFJxK+qvAMRUVZYK4BxrDT1TYaK4CqNebymLiBJ
         OPCdOibpXeBWC/VZXjyHrbJIft6jklJxGLMTQIYZjI5KeTa7umQXU50a9QzthvFRSaS8
         qUUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705955952; x=1706560752;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hu2BEQFv4SKaaRYW229xQlUPT0365RScPfsBBNdsUqk=;
        b=IoDtvoKDcCkhrH5CC15sAH6aBULbe8N0rxAOBm5FrvwiMxok7SNcAxzZG7dnWLUEff
         uAqn9qXmuXluw/NNioK5oOYxiW+GsU1DHpIGuhK4PZWNVHO3McUVYd6Gt2j0pvArpEUv
         VmjbqMf3q7MZygBMDFS9hnzbbdUHIEfQVyOp4MLIFqkGJPvLpnA3DneYN+AgQaU0oZa+
         273AtXw3m1mNbQ0YnXRVkwJlqGGKHsucA3ZA6SRNGJXjLt5gd591vLeGSIR5jEoA4Aj5
         7ZZM7acKhrFavny0WPsfF/zMsaCdbTrfAKmVIkEatWZMIzPQHz4Ou402wyRVln7+qKDh
         Mu9w==
X-Gm-Message-State: AOJu0YyCREfXmbKyOAVpGsUVCsUZfdDUR4FdZ0YdAHYBaneZfwchmF5P
	jG4hxubiK1YRdyCP9a2tbOxNvmQPz+Cc0MS4QvN4sTcNfQY9OUWhQWdGuobSUW23SHe3IL+S2/3
	sX9RzmpwNvmqrisAceZJ/CxyFohQ=
X-Google-Smtp-Source: AGHT+IFmDwI4Dx7Tmg8zO7InYiXvZhKJRxzvsaIPmgIdxWKQxK+Om1FzgfDJOymAhKx+egRuhaQvYG3fz3e6Bb6ESfk=
X-Received: by 2002:a05:6512:b90:b0:50f:c24:39f2 with SMTP id
 b16-20020a0565120b9000b0050f0c2439f2mr2466900lfv.92.1705955951676; Mon, 22
 Jan 2024 12:39:11 -0800 (PST)
MIME-Version: 1.0
References: <5387538c4d9cdb021ad26dec9d8553ed0ead8e6b.camel@infinera.com>
 <CANNYZj8hkwep=rLn2_tiBmFJhYPpgB9gbkGssdpq6uZbn_qZig@mail.gmail.com>
 <15c60ef81ccec80f50643b4ebbe40a6dbacd4f5c.camel@infinera.com>
 <CANNYZj9HM_U=rvhVSrnEb-Ydgd593ytgcBJMYWtPiC-5XM4C8w@mail.gmail.com> <d92a64cfcbffc58821e70eba2c61e403f5002ec3.camel@infinera.com>
In-Reply-To: <d92a64cfcbffc58821e70eba2c61e403f5002ec3.camel@infinera.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 22 Jan 2024 21:39:00 +0100
Message-ID: <CANNYZj9HK0rmThC_uzN5vaNCYyWx2dfOuA2CH340ATavho1MHQ@mail.gmail.com>
Subject: Re: [OE-core] oe-selftest -v -K -r reproducible.ReproducibleTests.test_reproducible_builds
 always succeeds, even when pkg is non-reproducible
To: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Jan 2024 20:39:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194193

On Mon, 22 Jan 2024 at 17:49, Joakim Tjernlund
<Joakim.Tjernlund@infinera.com> wrote:
>
> On Mon, 2024-01-22 at 17:19 +0100, Alexander Kanavin wrote:
> > On Mon, 22 Jan 2024 at 16:59, Joakim Tjernlund
> > <Joakim.Tjernlund@infinera.com> wrote:
> > > Maybe but what about the missing reproducibleA/tmp and reproducibleB/tmp ?
> > > Would these be missing if sstate is used for both?
> > > In the log there is this:
> > >   INFO - Building reproducibleB (sstate NOT allowed)...
> >
> > It's possible your local/distro config somehow overrides all of the
> > test settings, including the separate TMPDIR directories, and simply
> > builds things twice in the same directory. The log does seem to
> > indicate that:
>
> That was my though too but I cannot find what is doing that, grepping
> has not found TMPDIR changes. Is there something else that might influence
> TMPDIR ?

You can find out with 'bitbake -e' perhaps.

Alex

