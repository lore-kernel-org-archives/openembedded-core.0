Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07664D13570
	for <webhook@archiver.kernel.org>; Mon, 28 Oct 2024 09:45:00 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web11.47864.1730108692644236685
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Oct 2024 02:44:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=TSjroBjc;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4314b316495so38230465e9.2
        for <openembedded-core@lists.openembedded.org>; Mon, 28 Oct 2024 02:44:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1730108691; x=1730713491; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=EcfnWCTwqAtQGMRhknMuXjJwihdtMELqlKOZKfWrFv4=;
        b=TSjroBjcy8jcwhfvOIETqldLJRXL1O74ZU43oHk3fw7c5ZNELNN1i1mCzujh4So7M8
         iM6lkpdsDNJ1JvOdS+NnrQLjJwnm9wHmtODGtahvwP7kqARIEMDNqGM1KqvoLO9LCojw
         RI/bC/Lzngvnmpoulaf4ipv7sSLh5vQImUYzg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730108691; x=1730713491;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EcfnWCTwqAtQGMRhknMuXjJwihdtMELqlKOZKfWrFv4=;
        b=xHd7nygOgvcQ9claOsKKAjAWyp9TI/KOCMl/n5gGUffYMM46dvBrEAOFdg2jzJZsiF
         PhNLpnLknTSQSlGh2h5sDv6SVJN8aCC1SWrZ/eLqcpri4gBHpnxyJ/icCINc6RXbavqT
         /hN+FGIGpVfB6zG2P3ABPTXxlqU7+a3goNv1t1ZZ9uuOqfzZqCH7Y9ZMV8+/f7cwMPY8
         BTHtpehKXV1c/MERa5vlMq6+jCxY7Wi9qOM4u/MSHKYL15Kewsi1OlrRtT1At20N2e9q
         2ArxPXaAT0W+2OxNMZyobs5CA3x8uUjy9W9nfTGQRBGQBHQTpncUOJRnymixIOnASF7d
         t3cg==
X-Forwarded-Encrypted: i=1; AJvYcCVn7vVdYa6bzgLRCoaLKAAydS6weUydLG4StCVI/EABeNkadWydDfb1YNhQR7LoNB0lhr58rjWeXeYaNQQXXRc/0w==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxW0Un8IDS/bIMF0oIiuie2driCugfCF47qUHV4v5lWmvWJBVQZ
	KffKnJsyooVza5AVrccb5LogWolvsd2mbYuygAMPgYdQ4lEKV0TUq+bB3uuLmOk=
X-Google-Smtp-Source: AGHT+IHP8lEn2ZncxMQMvpyr0Pq0WB0ZnmPkaOckFj81h2vCrgpxndPgmoDy10D7d9YGmoTPzgkq4A==
X-Received: by 2002:a05:600c:3ca3:b0:42c:bb96:340e with SMTP id 5b1f17b1804b1-4319ad317e5mr58412985e9.31.1730108691071;
        Mon, 28 Oct 2024 02:44:51 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:73ef:5707:ed3d:2605? ([2001:8b0:aba:5f3c:73ef:5707:ed3d:2605])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38058b92958sm8950519f8f.106.2024.10.28.02.44.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 02:44:50 -0700 (PDT)
Message-ID: <c0d35e13f7e30151176f4230706a5ceda2f7dfcb.camel@linuxfoundation.org>
Subject: Re: [OE-core] [kirkstone] [PATCH] nativesdk-intercept: Fix bad
 intercept chgrp/chown logic
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Ming Liu <liu.ming50@gmail.com>,
 openembedded-core@lists.openembedded.org,  Steve Sakoman <steve@sakoman.com>
Cc: =?ISO-8859-1?Q?Eil=EDs?= 'pidge' =?ISO-8859-1?Q?N=ED_Fhlannag=E1in?=
	 <pidge@baylibre.com>
Date: Mon, 28 Oct 2024 09:44:50 +0000
In-Reply-To: <CALatG=5hxMtchf5wXdJZ3aBmkGouaHk3WstD=NgnCtbLaPN8JQ@mail.gmail.com>
References: <20241023111541.3437331-1-liu.ming50@gmail.com>
	 <CALatG=5hxMtchf5wXdJZ3aBmkGouaHk3WstD=NgnCtbLaPN8JQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Oct 2024 09:45:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206439

On Mon, 2024-10-28 at 09:09 +0100, Ming Liu wrote:
> Hi, maintainers:
>=20
> Would you please cherry pick this to kirkstone, otherwise the SDK
> build on kirkstone is broken.

Firstly, you need to copy the maintainer for kirkstone. I've added him
to the address list.

Secondly, the patch is also already in his test queue:

https://git.yoctoproject.org/poky-contrib/commit/?h=3Dstable/kirkstone-nut&=
id=3D145886736d92a55df1e822aa75044028627587ec

Thirdly, you gave us two business days to handle this before following
up :/.

Cheers,

Richard


> Ming Liu <liu.ming50@gmail.com> =E6=96=BC 2024=E5=B9=B410=E6=9C=8823=E6=
=97=A5 =E9=80=B1=E4=B8=89 =E4=B8=8B=E5=8D=881:15=E5=AF=AB=E9=81=93=EF=BC=9A
> > From: Eil=C3=ADs 'pidge' N=C3=AD Fhlannag=C3=A1in <pidge@baylibre.com>
> >=20
> > Running either of these ends up corrupting the os.execv args.
> >=20
> > If we run:
> > ./scripts/nativesdk-intercept/chown -R foo:foo bar
> >=20
> > The loop here ends up missing the conversion of foo:foo to
> > root:root because
> > it sees sys.argv[0] and assumes that it's the user:group argument
> > and that we
> > should convert that. We end up a os.execv(path, args) that have the
> > following
> > args:
> >=20
> > ['root:root', '-R', 'foo:foo', 'bar']
> >=20
> > As os.execv ignores args[0], we can just populate it with
> > sys.argv[0] and then
> > loop through sys.argv[1:]. As both chgrp and chown would have
> > either flags and
> > USER[:GROUP] next, this fixes the issue.
> >=20
> > (Backported from OE-Core rev:
> > 2a75f647ec7696d353f4b09099d777ba53f34d36)
> >=20
> > Signed-off-by: Eil=C3=ADs 'pidge' N=C3=AD Fhlannag=C3=A1in <pidge@bayli=
bre.com>
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > ---
> > =C2=A0scripts/nativesdk-intercept/chgrp | 5 ++++-
> > =C2=A0scripts/nativesdk-intercept/chown | 5 ++++-
> > =C2=A02 files changed, 8 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/scripts/nativesdk-intercept/chgrp b/scripts/nativesdk-
> > intercept/chgrp
> > index 30cc417d3a..f8ae84b8b3 100755
> > --- a/scripts/nativesdk-intercept/chgrp
> > +++ b/scripts/nativesdk-intercept/chgrp
> > @@ -14,7 +14,10 @@ real_chgrp =3D shutil.which('chgrp', path=3Dpath)
> > =C2=A0args =3D list()
> >=20
> > =C2=A0found =3D False
> > -for i in sys.argv:
> > +
> > +args.append(real_chgrp)
> > +
> > +for i in sys.argv[1:]:
> > =C2=A0 =C2=A0 =C2=A0if i.startswith("-"):
> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0args.append(i)
> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0continue
> > diff --git a/scripts/nativesdk-intercept/chown b/scripts/nativesdk-
> > intercept/chown
> > index 3914b3e384..0805ceb70a 100755
> > --- a/scripts/nativesdk-intercept/chown
> > +++ b/scripts/nativesdk-intercept/chown
> > @@ -14,7 +14,10 @@ real_chown =3D shutil.which('chown', path=3Dpath)
> > =C2=A0args =3D list()
> >=20
> > =C2=A0found =3D False
> > -for i in sys.argv:
> > +
> > +args.append(real_chown)
> > +
> > +for i in sys.argv[1:]:
> > =C2=A0 =C2=A0 =C2=A0if i.startswith("-"):
> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0args.append(i)
> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0continue


