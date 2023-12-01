Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9F1CC4167B
	for <webhook@archiver.kernel.org>; Fri,  1 Dec 2023 22:36:02 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web10.6295.1701470152450291973
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Dec 2023 14:35:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=jF8hxykY;
 spf=softfail (domain: sakoman.com, ip: 209.85.218.42, mailfrom: steve@sakoman.com)
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a02ba1f500fso405832666b.0
        for <openembedded-core@lists.openembedded.org>; Fri, 01 Dec 2023 14:35:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1701470151; x=1702074951; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kSED579lVg/C/2nj6IGX+3aKu7FeF4ytK1R8ZKWCMfA=;
        b=jF8hxykYiSABqrYJJkQrYKIp1/SGx0Ae+LsZ7aEqK4i5ER3a8aIxg5q59X6mVE/31j
         Oa+Ht9SzorMxTblIZr3L4Koy/PI/yYkXc0vN5udIL5P0KiaensEd9kr5XDr+hOcG9/bJ
         vvZm97L1Z37kf66gJkYgMORIW+aJmBByMLnPt45fHXEIhUlU3/nATVKyTnB5fYad+96S
         o3qRNfNbwiis2HB2pGLgx7c5WxAhvAXdgKLFQC4viOky1M4j+viPTMFTSV99zzLDa5Pi
         RKMcfen3v5CMI5FGkL+fUqb3WIQCuA9S2/LjHXq3c1p/OpNtSybnfrAdamRMmvRERJDJ
         9MAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701470151; x=1702074951;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kSED579lVg/C/2nj6IGX+3aKu7FeF4ytK1R8ZKWCMfA=;
        b=CqfFtGPxpqcKH3KhNU15pxu773OioWtQELuqM7tDLKlC3qZiASdnpXQXSkbup2Ch94
         zW7kRdoFZCOws0H8VqecJEx3GoF+38xUrBSeCNk3q43FleWX/C2EPH2QhlAheZ9VDfhj
         1uDevSeQPuXhXiY97ohkTUmeaORnhYmpKPwkDME3ilKrmcXF+TrAvc9bMbIOkfdPv1Ru
         LuO/73F6cBgRuXGyVN6EiO0K7c3Hhs6sH0gVUwoo+WhBXMzLQovbLjKWmracWIMfAIyh
         lOa8bZrnLw93cST8EWv+N65+aoSMR27NwDAn2LBT7Z5v9e9brtTSdbwXTkLyBzrrub6a
         LomQ==
X-Gm-Message-State: AOJu0YyHo/62lVSTNmh6aet08LfHfJ13udRPbxDj+YvwYTErX769Ek3a
	U0QRYzt5HLHFmkUjHbziEwKICCysfHXLJeJJ+Dm9tA==
X-Google-Smtp-Source: AGHT+IGRrp4419bD39+XFhJyCN/ZHijR+G0C2gZpyBhxu9toRniDlLmrl4Q0jtz3BMeq9WQjAkd224K/HtzzM7e0tSw=
X-Received: by 2002:a17:906:209e:b0:a18:e9fe:2d9 with SMTP id
 30-20020a170906209e00b00a18e9fe02d9mr1378268ejq.25.1701470150158; Fri, 01 Dec
 2023 14:35:50 -0800 (PST)
MIME-Version: 1.0
References: <20231130101010.1696-1-jermain.horsman@nedap.com>
In-Reply-To: <20231130101010.1696-1-jermain.horsman@nedap.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Fri, 1 Dec 2023 12:35:39 -1000
Message-ID: <CAOSpxdYp+fUcZ+YCWA3F=MgdivxfP3TkE5GKBv6YpyqpzzKoww@mail.gmail.com>
Subject: Re: [OE-core] [kirkstone][PATCH 0/2] Failure for rust-cross for arm(v5)
To: jermain.horsman@nedap.com
Cc: openembedded-core@lists.openembedded.org, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Dec 2023 22:36:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191691

Unfortunately this series breaks oe-selftest for all distros on the autobui=
lder.

Here is a sample failure log:

https://errors.yoctoproject.org/Errors/Details/745002/

Steve

On Thu, Nov 30, 2023 at 12:10=E2=80=AFAM Jermain Horsman
<jermain.horsman@nedap.com> wrote:
>
> From: Jermain Horsman <jermain.horsman@nedap.com>
>
> I ran into the following when trying to compile rust for arm (on kirkston=
e):
>
> Exception: TypeError: int() argument must be a string, a bytes-like objec=
t or a number, not 'NoneType'
>
> After some investigation I notices some patches on master which were not
> available on kirkstone.
> Using the patches included here I am able to compile successfully.
>
> However, some additional patches are not on kirkstone,
> I am unsure whether or not these should be backported too,
> maybe someone, who has a better understanding of these, can comment on th=
at.
>
> It's about the following patches:
> https://git.openembedded.org/openembedded-core/commit/?id=3D0f83d959465e0=
d99f98ade6803281585931d1b02
> https://git.openembedded.org/openembedded-core/commit/?id=3D2d4b35a0db122=
0e7a7f1b6776223aa4d40a3f246
>
> The following patch is also not on kirkstone,
> based on the commit message I think it might be desired to have this one =
as well:
> https://git.openembedded.org/openembedded-core/commit/?id=3Dd554161a045d1=
2411f288394e253c54aa4c1257c
>
>
>
> Richard Purdie (2):
>   rust-cross/rust-common: Merge arm target handling code to fix
>     cross-canadian
>   rust-cross: Simplfy the rust_gen_target calls
>
>  meta/recipes-devtools/rust/rust-common.inc | 18 ++++++++++++------
>  meta/recipes-devtools/rust/rust-cross.inc  | 21 ++++-----------------
>  2 files changed, 16 insertions(+), 23 deletions(-)
>
> --
> 2.42.0.windows.2
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#191490): https://lists.openembedded.org/g/openembedde=
d-core/message/191490
> Mute This Topic: https://lists.openembedded.org/mt/102891103/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

