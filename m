Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A2EEC8303C
	for <webhook@archiver.kernel.org>; Sat,  5 Jul 2025 16:37:45 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
 by mx.groups.io with SMTP id smtpd.web11.20885.1751733463913315105
 for <openembedded-core@lists.openembedded.org>;
 Sat, 05 Jul 2025 09:37:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=LR/FEEu1;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.208.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6097b404f58so2630188a12.3
        for <openembedded-core@lists.openembedded.org>; Sat, 05 Jul 2025 09:37:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1751733462; x=1752338262; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=2M9tvvii2zG9uPCoUtRhF3tm9xA1kvujR4D25GmpJCA=;
        b=LR/FEEu1a0REPfvm/2ON8Vw9D2lh+wrj2MgT+NyO/DljWPI8Ut5tgo7GGXzVuSWcFt
         nxgxpRSi4/sRG2d53xQTggftH4MYVZYTuix4kM1CvLonLhrL1pEWLWN71sNnIe3nkjhO
         D4gM/7wuglLfOm59Gfe1jGNpvdYVCVWjuK7ak=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751733462; x=1752338262;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2M9tvvii2zG9uPCoUtRhF3tm9xA1kvujR4D25GmpJCA=;
        b=qDvsLxNsaXRg6cYMkY90ieF5g03DGF3zdh741byxONF8wKu5P5RY4EVPMQcTMXy5eN
         B4rbAy9rNw/RjQ86Gx2PwWmpJoQw5VfMRNSJVsGlXk4/5qCp6Iz2xCBFMH0AFfy1QDxV
         u51mRQy8MMalRr6Xrg3Zc3AbmD7oTArvEzsLo/IZomM7HpE8+hfv10uz65Zx8TWnDc20
         Pt0dyc9FfMHvqDDvx/Go7PMdN4ZFfw9fAXXTN40w5mNH0as70SCgcMAwff9vSNoLt0GL
         EPhRwqXPbXv018xNiNQk9GZVFdXlcdSng1PLXfo6jAsx+egUezvz2MmpB7IKytK6abdu
         oUPg==
X-Gm-Message-State: AOJu0YzQ3uj5PvZ7ztxTQeH/+2wbHiM2LruWdFihwtfbyJIJBX9mYbWy
	+eLBobKSAI9TrIcdqn2NAfDVIdS3UZCZTcQIf2N0R5APfeWpkHL/WLJa3kwu9YJNuGs=
X-Gm-Gg: ASbGncu0ohQhIw9dTrTvYFtZAdpJbeJ3qfskbPIAhGvN/Ib7Yf0cW+LBmE1KRB9PE7K
	BAgmqJI/I4eucB4BJvYhl1+4mms6Bfo/5I6spPHGQ0orIO+sU+xG37JlStuTbSmfM60tt+aK9uO
	vOiW56j1WoTGcazbD3BSTRvtBZQxLx3Ln6H6iD37hQQd0Pbez9rI20KmvsSAOzFPWSFp81eTT2G
	4bbZKBRA+eNi4QNYJ6YjFzpztNzgEC9HD1XzBgjfLeQk7XyBz8SbFiMq3Q0yW3oxvT9U8D8BrGB
	5wP/IJrqae7LwPDQAv9nyJH1iY0c6kgN63IAdHDOrDQ+mFo5ChqIpFf5+y+FtMYAXZKo1dNIgSU
	uB7ZWKWeX1v1VkxVwOx0wPzptBk2Bsg/WQdyKlnIjvE1LO1SUmiI=
X-Google-Smtp-Source: AGHT+IHaWT6dUFrMISVLZitfxHLSviiM+Gc0uwgkXJSzxEMtD2t0XAswZ0IzK2xJgRbTXoCVYM2y5Q==
X-Received: by 2002:a50:d783:0:b0:60c:6a48:8047 with SMTP id 4fb4d7f45d1cf-60ff388875dmr1884828a12.11.1751733462075;
        Sat, 05 Jul 2025 09:37:42 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:44e5:6183:e700:8e38? ([2001:8b0:aba:5f3c:44e5:6183:e700:8e38])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60fca695d66sm2796400a12.17.2025.07.05.09.37.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Jul 2025 09:37:41 -0700 (PDT)
Message-ID: <e70ecfb105bdd7f1f7a8dbf6737e4363088a749f.camel@linuxfoundation.org>
Subject: Re: [PATCH] bitbake.conf: Add relative path from B to S to
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Michal Sieron <michalwsieron@gmail.com>
Cc: openembedded-core@lists.openembedded.org, raj.khem@gmail.com
Date: Sat, 05 Jul 2025 17:37:39 +0100
In-Reply-To: <20250705144126.36056-1-michalwsieron@gmail.com>
References: 
	<ad0656d62bfd203a2f0c984d15e683ea3ca01f46.camel@linuxfoundation.org>
	 <20250705144126.36056-1-michalwsieron@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 05 Jul 2025 16:37:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219956

On Sat, 2025-07-05 at 16:41 +0200, Michal Sieron wrote:
> > in that we removed -fcanon-prefix-map thinking it worked and it
> > clearly
> > doesn't.
> >=20
> > We *need* that option and it will need to be put back, probably gcc
> > specific. Copying Khem.
>=20
> But then what do we do about clang, which behaves the same way and
> doesn't support -fcanon-prefix-map? There is also Kirkstone, which is
> still on gcc 11 (that option was introduced in gcc 13).

We ran into this issue and convinced gcc it needed a patch. I suspect
kirkstone has that patch. The patch was merged by gcc 13 so we no
longer had to carry it.

I suspect someone needs to add this support to clang as I suspect there
isn't another way to handl relative paths.

> I also went and adjusted the 'reproduction' example a little bit to
> be more similar to Yocto setup. I put the meson.build and hello.c
> files in a 'git' directory. Then from parent of 'git' directory I am
> calling meson with absolute paths to source and build dirs (again to
> mirror how Yocto works).
>=20
> Now regardless of the order of prefix-map flags I get the same
> output:
> =C2=A0=C2=A0=C2=A0 $ dwarfsrcfiles build/hello
> =C2=A0=C2=A0=C2=A0 /usr/src/debug/hello/1.0/../git/hello.c
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /usr/src/debug/hello/1.0/../gi=
t/hello.c
> which reminded me that this is the actual reason I first saw this as
> a bug couple weeks ago. After all, Yocto won't create a 'git'
> directory in the -src package.
>=20
> With -fcanon-prefix-map it's a little better:
> =C2=A0=C2=A0=C2=A0 $ dwarfsrcfiles build/hello
> =C2=A0=C2=A0=C2=A0 /usr/src/debug/hello/1.0//usr/src/debug/hello/1.0/hell=
o.c
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /usr/src/debug/hello/1.0/hello=
.c

That does look a bit more like what I'd have expected.

Cheers,

Richard

