Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F69DCDB482
	for <webhook@archiver.kernel.org>; Wed, 18 Oct 2023 17:22:08 +0000 (UTC)
Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
 by mx.groups.io with SMTP id smtpd.web10.287750.1697649726995802056
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Oct 2023 10:22:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=J5yrMO77;
 spf=pass (domain: gmail.com, ip: 209.85.160.51, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-1e12f41e496so4357582fac.3
        for <openembedded-core@lists.openembedded.org>; Wed, 18 Oct 2023 10:22:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697649726; x=1698254526; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GdTpQsOQqk7XjvgR5gogFCI/uk9sdzZq0w5KwSJKmP0=;
        b=J5yrMO7728H+HwiKIhn1cGBNNpcdGu8xiY/xUVlJxxLQQGGmQV/1a0gj77FChwNyTN
         F6XmGscdTttfMWSUo+81ZdGMoK71CAyhBdGnwdqKcgs7NI4FGiH/Lv5jBPo3F2sifBCx
         RteYJyiT61KBf0sW9JawFWvC3U7UofMt75ID5mSnBc75Tf9nwinTy0qoFPIo+6/kFL2J
         +JeS6meYpAyd+LidjqZ7guUmgNjJMntb0Zr4w5pPjGaIEBH7ahUOHI87a5hyAQOXkY1a
         2/lc7Ru8aNm7BxlNHOt4vlSUG6AhmuO3lnaXzCopw1bVKfL9Nw37Xsu7TUGJy7TG3fgm
         c1nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697649726; x=1698254526;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GdTpQsOQqk7XjvgR5gogFCI/uk9sdzZq0w5KwSJKmP0=;
        b=QNe9JrvlxBU5KRcQrL3XTOHes7tFjdx7pjlOMwOTp+kCQBfqS+qb10bOmSZBaJWjdy
         OzqkezdbJJrmrDRtOYvuko3Fs15IOrTu4WTvjpZcH1P5NMTi5gdzF5tVfVQOj0Quybkk
         DRkn8/qc9a37az+xg14mjZExJD7d3aywbT0vipbWqOPBi0HYvWdlIcCLWOpVfmACj9Zb
         0s+mi/bAM8RWoohRN3/9tloEtwznzRV64uJV/7C2hDYaaj4hP3wlIaQOdTZzwSNS4Ktq
         P8ADaNpCF4HjJ1TRnF3lpdgeP13x1ggMCRSZuhjuh0jfa9eIs/R/0fAtdai84aqgg5Q9
         useQ==
X-Gm-Message-State: AOJu0Yw30QqAaFcWQ+soKdCFYkhmpS3fb/CsERCJityKvfMQgt/edGB4
	+Sr/b7Q7XgBihFdWlqQ9LuZgidiEmYtiOw1s47U=
X-Google-Smtp-Source: AGHT+IEsdnpU1OGwyEBIJyz56i/SiykU5O2W7SukmtePo/MtltpFSjHGKmrJfXw+vz8xZ6N6iyByOWMVNOvtKzGq20I=
X-Received: by 2002:a05:6871:4e98:b0:1e9:b305:6831 with SMTP id
 uk24-20020a0568714e9800b001e9b3056831mr5725033oab.42.1697649726016; Wed, 18
 Oct 2023 10:22:06 -0700 (PDT)
MIME-Version: 1.0
References: <ZS_r0pnGHqlEg5Ru@mcrowe.com> <CAMKF1soLwhB_2oTi3APASkLiHdCkbWFKwASxuSGh2echBcCWJA@mail.gmail.com>
 <ZTAHpJHbH0y9djT8@mcrowe.com>
In-Reply-To: <ZTAHpJHbH0y9djT8@mcrowe.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 18 Oct 2023 10:21:40 -0700
Message-ID: <CAMKF1somemu6YVN1VnpWFWG1PthcWBVq4x1MB6-zkGtOq9G38Q@mail.gmail.com>
Subject: Re: [OE-core] Using devtool without an absolute path to the workspace
 in bblayers.conf
To: Mike Crowe <mac@mcrowe.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Oct 2023 17:22:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189413

On Wed, Oct 18, 2023 at 9:28=E2=80=AFAM Mike Crowe <mac@mcrowe.com> wrote:
>
> On Wednesday 18 October 2023 at 09:19:32 -0700, Khem Raj wrote:
> > On Wed, Oct 18, 2023 at 7:29=E2=80=AFAM Mike Crowe via lists.openembedd=
ed.org
> > <mac=3Dmcrowe.com@lists.openembedded.org> wrote:
> > >
> > > I'm trying to work out how we can make use of devtool to make our liv=
es
> > > easier during development. In general it seems to work very well, but=
 the
> > > way that it modifies bblayers.conf to add an absolute path to the wor=
kspace
> > > directory to BBLAYERS is incompatible with that file being held in a =
Git
> > > repository and shared by multiple users in multiple trees. There's a =
high
> > > risk that the file will accidentally be committed containing a path t=
hat's
> > > only meaningful for a single user in a single source tree. All of our=
 other
> > > paths in bblayers.conf are relative to a variable that contains the p=
ath to
> > > the top of the source tree.
> > >
> > > I can manually add ${TOPDIR}/workspace to BBLAYERS in bblayers.conf a=
nd
> > > commit that, but unfortunately devtool insists on continuing to add t=
he
> > > absolute path since it doesn't know that's the same as ${TOPDIR}/work=
space.
> > >
> > > I can set "workspace_path =3D workspace" in devtool.conf to use a rel=
ative
> > > path, and that superficially works until externalsrc.bbclass gets ups=
et
> > > that the EXTERNALSRC is not an absolute path.
> > >
> > > I've tried teaching devtool to prepend ${TOPDIR} if the workspace dir=
ectory
> > > is not absolute when writing bblayers.conf, but it looks like I'd als=
o need
> > > to do so in many other places.
> > >
> > > My current workaround is just to add ${TOPDIR}/workspace to the commi=
tted
> > > bblayers.conf myself and nobble devtool's _enable_workspace_layer wit=
h an
> > > early return. This is ugly and we'd have to carry that change around
> > > forever.
> > >
> > > Since I'm clearly swimming against the tide I'm left wondering whethe=
r I've
> > > missed something. Is there a way to use devtool without having an abs=
olute
> > > path to the workspace in bblayers.conf?
> > >
> > > (At the moment I'm still using dunfell, but I looked at current maste=
r and
> > > didn't spot anything that looked like it changed this behaviour.)
> >
> > Perhaps an enhancement to not add the path if its already part of BBLAY=
ERS
> > might do it. You might also print a diagnostics about its pre-existence=
 to make
> > sure it's not accidental.
>
> devtool already tries to do that. It doesn't work in this case since the
> code compares the absolute path against the paths in bblayers.conf and
> isn't in a position to expand variables at that point.

yeah it perhaps has to compare the evaluated paths

>
> Thanks.
>
> Mike.

