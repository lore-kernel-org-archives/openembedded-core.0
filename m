Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F9D3C3DA45
	for <webhook@archiver.kernel.org>; Thu, 11 Jul 2024 13:35:51 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web10.12092.1720704942341433389
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Jul 2024 06:35:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=PIizTqyC;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-42122ac2f38so5609645e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 11 Jul 2024 06:35:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1720704940; x=1721309740; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=lfx4hkMX7Oj+ZlGOGUStJDKK0lXU8/on/1ISnsN60G4=;
        b=PIizTqyCH97lELjhLWRlD6DiI68dUGjV7+dK+Pkea03I6Q+oGvCTLDVf2GYj43sKT7
         YbqsLYOalY40YJ9tow7U8dQE5bJkobfNa5QGCri4fARw3BEjX5KqGQ5Ag7L4SaaawRNa
         GHnXlpMGHCcsTrDk3jtL+/fZBJ67OfnKakLhM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720704940; x=1721309740;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lfx4hkMX7Oj+ZlGOGUStJDKK0lXU8/on/1ISnsN60G4=;
        b=igEeJl6tIxx6pPRvuRyeRp1K8mZGNAnayB4badYZ2Ls/GSh66LIv/7PZngxX332+bx
         kg7AT7YCPpK0uvI/YYvLvhcVWZ/i9j7UD4gYNlNr++PzZczsVzgHpLwIoJpu4DtKdx0z
         8CblAQBbZ8tgTYqkmFY1BEgXxvNjw49I4Ur31mf/s1822P/whOZlJs7YhevPcx0+VGa5
         2A5VE2+K3riR2vwD1Kf6eKnwMi2pozr856rhSgagQJnDTNQeo13yTLXuhrbiwKSOixBj
         xnHKFvO7VreHEkG2nQRIQPxVwHGt6gnuqSSjepD4YHQAiIqIx9gXsuhHOlt78JxWSo9R
         sOjw==
X-Gm-Message-State: AOJu0YxsOAocVfvHNtapsK6qnVqLQR86yBx8djB5htMQUffkZMbLbwnq
	gZvhZNdLuHY1IgWxi25+VrDi4BKDPB//apCREMYy5M8GpH5fp4NF+NVTdpllQlo=
X-Google-Smtp-Source: AGHT+IHeJ3XGqbExEWz0c5FFw0OwKNuDf8iXXUWXuAWAgi5C/OUnlnTqKXnOa3L3dV6kS1iHMSlMOg==
X-Received: by 2002:a7b:c4c7:0:b0:426:6fb1:6b64 with SMTP id 5b1f17b1804b1-427981b7727mr24539605e9.7.1720704940293;
        Thu, 11 Jul 2024 06:35:40 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:b76e:27af:5a94:dcb6? ([2001:8b0:aba:5f3c:b76e:27af:5a94:dcb6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4279ab2e382sm21476495e9.6.2024.07.11.06.35.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jul 2024 06:35:39 -0700 (PDT)
Message-ID: <f10ae72f4cd1e0f1b69e362773ec6c92fa4ffa27.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] distro/include: Add yocto-space-optimize,
 disabling debugging for large components
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: ross.burton@arm.com
Cc: ",openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Date: Thu, 11 Jul 2024 14:35:39 +0100
In-Reply-To: <60E368D9-15B3-430C-800B-14BEF1E4614B@arm.com>
References: <20240711093045.1166613-1-richard.purdie@linuxfoundation.org>
	 <60E368D9-15B3-430C-800B-14BEF1E4614B@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.0-1build2 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Jul 2024 13:35:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201781

On Thu, 2024-07-11 at 12:10 +0000, Ross Burton via lists.openembedded.org w=
rote:
> On 11 Jul 2024, at 10:30, Richard Purdie via lists.openembedded.org <rich=
ard.purdie=3Dlinuxfoundation.org@lists.openembedded.org> wrote:
> >=20
> > +DEBUG_FLAGS:remove:pn-llvm =3D "-g"
> > +DEBUG_FLAGS:remove:pn-qemu =3D "-g"
> > +DEBUG_FLAGS:remove:pn-openssl =3D "-g=E2=80=9D
>=20
> This would be difficult to undo if the user did actually want debug symbo=
ls, right?
>=20
> This :removes -g (so you can=E2=80=99t :append it back) from the target f=
lags:
>=20
> DEBUG_FLAGS ?=3D "-g -feliminate-unused-debug-types ${DEBUG_PREFIX_MAP}"
> FULL_OPTIMIZATION =3D "-O2 -pipe ${DEBUG_FLAGS}"
> DEBUG_OPTIMIZATION =3D "-Og ${DEBUG_FLAGS} -pipe"
> SELECTED_OPTIMIZATION =3D "${@d.getVar(oe.utils.vartrue('DEBUG_BUILD', 'D=
EBUG_OPTIMIZATION', 'FULL_OPTIMIZATION', d))}=E2=80=9D
> TARGET_CFLAGS =3D "${TARGET_CPPFLAGS} ${SELECTED_OPTIMIZATION}=E2=80=9D
>=20
> So with this there=E2=80=99s no obvious way to get symbols for target llv=
m/qemu/openssl, setting DEBUG_BUILD=3D1 still won=E2=80=99t actually pass -=
g. The user would have to know to do eg CFLAGS +=3D =E2=80=9C-g=E2=80=9D.
>=20
> I=E2=80=99ll note that webkitgtk3 has approached this problem already and=
 settled on this:
>=20
> DEBUG_FLAGS:append =3D "${@oe.utils.vartrue('DEBUG_BUILD', '', ' -g1', d)=
}"
>=20
> So -g1 (minimal but functional debugging info) unless DEBUG_BUILD enabled=
.
>=20
> I=E2=80=99m fairly against removing _all_ debug symbols for these recipes=
 in default builds, although I=E2=80=99d certainly be happy with -g1 as a c=
ompromise between space saving and utility.

I agree that the remove is too hard to undo so we can't use this
approach.=C2=A0We probably need to parameterise it in DEBUG_FLAGS since
we're likely to need to do this more frequently.

I do still think we should drop -g entirely for llvm though as the
debug info is just too large even at -g1. I'm particularly keen to keep
the package sizes down which keeps the sstate object size down too,
making builds from sstate better over the network.

Cheers,

Richard

