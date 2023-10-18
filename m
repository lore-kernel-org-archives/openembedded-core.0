Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03C2DCDB47E
	for <webhook@archiver.kernel.org>; Wed, 18 Oct 2023 16:20:10 +0000 (UTC)
Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
 by mx.groups.io with SMTP id smtpd.web10.285984.1697645999399559221
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Oct 2023 09:19:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lfCUNIa9;
 spf=pass (domain: gmail.com, ip: 209.85.160.45, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-1ea4a3d0a44so2123228fac.1
        for <openembedded-core@lists.openembedded.org>; Wed, 18 Oct 2023 09:19:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697645998; x=1698250798; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tS6KcHlPnR9SRG3/7Zh4Wc0qQwYk5C3aIZGCsp8Dk/Y=;
        b=lfCUNIa92DkWtQc7ngQgheh69pw7xtWGVhQA/g5Gval3vt9pl/pO9uHhJEYCmtuIAY
         b/SWLHTOGDs1hiBid45qyDF9UWOkDprCHtvYW0FGzg0HBCudBjn6R7ThmqHG54XtFAwB
         vJ7L4ZueWYQeBlobp+53ht73dxXBPkZW72pM6QqJ1MEuXyWoNxWPJhT8m/xEe/XaqERP
         3BbHOHG8vr5VgoD76XJhFRstJtsOmcCbuXCrUZP/E+QHKwTOxR3sBL1x9qgpeim8SmzC
         kA7I/A54JJ+pNEDsPyC1Ah0+Jv+7M3OW7cAyVTG88b6pHo39PPXvdeatFVGA92uXTUtv
         ka9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697645998; x=1698250798;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tS6KcHlPnR9SRG3/7Zh4Wc0qQwYk5C3aIZGCsp8Dk/Y=;
        b=J2xIMC/raRYo22roTbPA6v8fw7C3wjWk1HtghsYrK1/SvOkegg+faPlSTsjbA1Ws8D
         eUTjMe2agAdSpYxpNWp4VaPUJ/0WBAKWGpglcQEFFmnXk7j28NYXzmTWln02FvAuqbhn
         0Rs4kMGEApp3JXeA15velOz59fPrGCsU4W8wK/25vma+7N0cF2banx1tw09fIw26VK0u
         pDRYHkb5OUdC7S6wAvW3cdQjlBLeKenSxjE+Q4Y7KRaSMGzfzP8GqaCP/wTuhVoH3+LT
         Onl/ZU75on5LJUDLRQwW8voTk24TP0vWSrlqapdPYaH4E0rOaQsPl06U38qBZFBsVyZg
         E1Ew==
X-Gm-Message-State: AOJu0YydrnQgmSQONZUlqAQlU3dAvLEnzMd9Le2/z8ljQFTmH56VNPBx
	0OxPQfuLaWQNJLr3LKygh4XFEg3OTdttbk3zVxFpWskuvRY=
X-Google-Smtp-Source: AGHT+IGuo58UzkXBLVgd6iXSpZ5gYEf6H9e8VRQftldD3Ux+oocaDXDquF+sYsudj3vibu9nPh1a3ILwn27QEcNn6lc=
X-Received: by 2002:a05:6871:6a0:b0:1e9:dfcd:6752 with SMTP id
 l32-20020a05687106a000b001e9dfcd6752mr6759077oao.20.1697645998404; Wed, 18
 Oct 2023 09:19:58 -0700 (PDT)
MIME-Version: 1.0
References: <ZS_r0pnGHqlEg5Ru@mcrowe.com>
In-Reply-To: <ZS_r0pnGHqlEg5Ru@mcrowe.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 18 Oct 2023 09:19:32 -0700
Message-ID: <CAMKF1soLwhB_2oTi3APASkLiHdCkbWFKwASxuSGh2echBcCWJA@mail.gmail.com>
Subject: Re: [OE-core] Using devtool without an absolute path to the workspace
 in bblayers.conf
To: mac@mcrowe.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Oct 2023 16:20:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189411

On Wed, Oct 18, 2023 at 7:29=E2=80=AFAM Mike Crowe via lists.openembedded.o=
rg
<mac=3Dmcrowe.com@lists.openembedded.org> wrote:
>
> I'm trying to work out how we can make use of devtool to make our lives
> easier during development. In general it seems to work very well, but the
> way that it modifies bblayers.conf to add an absolute path to the workspa=
ce
> directory to BBLAYERS is incompatible with that file being held in a Git
> repository and shared by multiple users in multiple trees. There's a high
> risk that the file will accidentally be committed containing a path that'=
s
> only meaningful for a single user in a single source tree. All of our oth=
er
> paths in bblayers.conf are relative to a variable that contains the path =
to
> the top of the source tree.
>
> I can manually add ${TOPDIR}/workspace to BBLAYERS in bblayers.conf and
> commit that, but unfortunately devtool insists on continuing to add the
> absolute path since it doesn't know that's the same as ${TOPDIR}/workspac=
e.
>
> I can set "workspace_path =3D workspace" in devtool.conf to use a relativ=
e
> path, and that superficially works until externalsrc.bbclass gets upset
> that the EXTERNALSRC is not an absolute path.
>
> I've tried teaching devtool to prepend ${TOPDIR} if the workspace directo=
ry
> is not absolute when writing bblayers.conf, but it looks like I'd also ne=
ed
> to do so in many other places.
>
> My current workaround is just to add ${TOPDIR}/workspace to the committed
> bblayers.conf myself and nobble devtool's _enable_workspace_layer with an
> early return. This is ugly and we'd have to carry that change around
> forever.
>
> Since I'm clearly swimming against the tide I'm left wondering whether I'=
ve
> missed something. Is there a way to use devtool without having an absolut=
e
> path to the workspace in bblayers.conf?
>
> (At the moment I'm still using dunfell, but I looked at current master an=
d
> didn't spot anything that looked like it changed this behaviour.)

Perhaps an enhancement to not add the path if its already part of BBLAYERS
might do it. You might also print a diagnostics about its pre-existence to =
make
sure it's not accidental.

>
> Thanks.
>
> Mike.
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#189396): https://lists.openembedded.org/g/openembedde=
d-core/message/189396
> Mute This Topic: https://lists.openembedded.org/mt/102039990/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

