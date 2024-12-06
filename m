Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3594EE77173
	for <webhook@archiver.kernel.org>; Fri,  6 Dec 2024 10:11:10 +0000 (UTC)
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
 by mx.groups.io with SMTP id smtpd.web10.33753.1733479860468589064
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Dec 2024 02:11:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LLJZd1E5;
 spf=pass (domain: gmail.com, ip: 209.85.160.173, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-4668978858aso15370011cf.0
        for <openembedded-core@lists.openembedded.org>; Fri, 06 Dec 2024 02:11:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733479859; x=1734084659; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZlsCpuM9AuM8ZRaSDSGMcfyF/FEvtAu0Jy5ARxzJ5kg=;
        b=LLJZd1E5+CL2/pI6yZyIFxvFrBA78lfRFpkTaUt4GAZIMeqcnSjtQKa9WpmD1Pe/xA
         rLmcqtxDys+w2RpmvnDSH2jCHoF1GSC1pCCouKPax9YjLqri262QbQrfT7Kg07YhP/vz
         G1KLfJhb6ydeSJFc29OpUaXGiDphC7xr6tOeX16G0f9ok1KXGUu9pImmQNiVEqWa4nlc
         RPdygX34MJHjnFTTjPqtZtQo/+HCFvCBplgtoPFhxEvCEodAjFU+eH73lSdFF3/xH99P
         AuoT9OcgCp98aWq5P9thind6tLKXzqN6jyrGXYLfSknTv9TDFMqSbErtbBLym60rDweA
         ohgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733479859; x=1734084659;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZlsCpuM9AuM8ZRaSDSGMcfyF/FEvtAu0Jy5ARxzJ5kg=;
        b=sU2xbcTS/qwIXCs2ugfA8llcd09EXCAj6AeSh1NtEllalPAG0xew7rAevx7vbuCWZi
         fEr1ULvVNsFCyR33jvGQok8n1NlCmqodjbeKP+RkP6JKqYpy4UbmZ0vKkdlaVDiUL3az
         wO+8nKAu0ArcMd7jrermW8uYASPzunnFIPLsprRxTzW1Qlors49fKOu0rnSnRljkMv5C
         Us50bu50QqrBlnHn/3fMzHUgZywtB4Eef9H1tUJjSQgn33zmC8Mwt6y5cpu5XL0gVb+C
         rn/9NnOu1YU4owrUSprSl2JZPcV/h0EF9r9MJeYpDxFfTJQNZ7q2KyFdRnrAq6aiaPbk
         iamQ==
X-Forwarded-Encrypted: i=1; AJvYcCULenmXfJVhJ3pcp3vTHL0JTEeALpvjTZhQckjDwXpvtYKrsWTzfpvSDiTO8nXGTJp1F4isadcOg49HkELWZUYP/w==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yy/0NysnZ25hOaIgtx0k5dKipJGXxYttj0do5ucG5VIQGwa79iZ
	YnnZgmrroB6ErxeW1a8b6iPUCoJnmhiuFXq44eNDGmCfu4YX0tsaetyoROBz/VG0iHi5yNsAP/2
	Fc762BpSJ+oddu6AZ576RHVDdMkM=
X-Gm-Gg: ASbGncswsISsiGzqYYlwA6a8hze3CBo46pdiDKbOKd5V8NdcqS5BsyehQ8gwW1t1Doh
	s/0LknlrP6bUyoB6OUVieq8yfrkvT0FHgt3OF7YsIitmRUPNqVt2r33bPzC8QuXQ9Mg==
X-Google-Smtp-Source: AGHT+IEEUVOgBbVvo8GjUY1DK069C8cbhVjdyv0uasmZQmrOVppzKEuHrqZ6yap3/Ompp3hyvP0P9vFADSA+fHh7W1E=
X-Received: by 2002:a05:6214:e6f:b0:6d8:9065:2033 with SMTP id
 6a1803df08f44-6d8e71dc74dmr28017436d6.31.1733479859486; Fri, 06 Dec 2024
 02:10:59 -0800 (PST)
MIME-Version: 1.0
References: <20241206092740.1896316-1-pratheeksha.s.n@ni.com> <CA+chaQf5NMirgDDxMH_diFAcB1bjeFRasOjL4jR3n57AdrQrQw@mail.gmail.com>
In-Reply-To: <CA+chaQf5NMirgDDxMH_diFAcB1bjeFRasOjL4jR3n57AdrQrQw@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 6 Dec 2024 11:10:48 +0100
Message-ID: <CANNYZj9fkNO7wFPciroYHcJe_QOG5sNjXYbdKUpYV9Jvxt_YBQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] opkg-keyrings: mark IPK as allarch
To: martin.jansa@gmail.com
Cc: pratheeksha.s.n@ni.com, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Dec 2024 10:11:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208414

Additionally, when making changes like this, it is useful to run
test_sstate_allarch_samesigs from oe-selftest. If that fails, then the
package can't be made allarch.

Alex

On Fri, 6 Dec 2024 at 11:01, Martin Jansa via lists.openembedded.org
<martin.jansa=3Dgmail.com@lists.openembedded.org> wrote:
>
> RDEPENDS:${PN} =3D "opkg"
>
> makes it effectively TUNE_PKGARCH unless explicitly removed in
> SIGGEN_EXCLUDERECIPES_ABISAFE or SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS
>
> On Fri, Dec 6, 2024 at 10:27=E2=80=AFAM pratheekshasn via
> lists.openembedded.org <pratheeksha.s.n=3Dni.com@lists.openembedded.org>
> wrote:
> >
> > inherit allarch as package contains entirely cross-platform content.
> >
> > Signed-off by: Pratheeksha S N <pratheeksha.s.n@ni.com>
> > ---
> >  meta/recipes-devtools/opkg/opkg-keyrings_1.0.bb | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/meta/recipes-devtools/opkg/opkg-keyrings_1.0.bb b/meta/rec=
ipes-devtools/opkg/opkg-keyrings_1.0.bb
> > index 84aeb98068..75d5b5216c 100644
> > --- a/meta/recipes-devtools/opkg/opkg-keyrings_1.0.bb
> > +++ b/meta/recipes-devtools/opkg/opkg-keyrings_1.0.bb
> > @@ -2,6 +2,8 @@ SUMMARY =3D "Keyrings for verifying opkg packages and f=
eeds"
> >  LICENSE =3D "MIT"
> >  LIC_FILES_CHKSUM =3D "file://${COREBASE}/meta/COPYING.MIT;md5=3D3da9cf=
bcb788c80a0384361b4de20420"
> >
> > +inherit allarch
> > +
> >  # Distro-specific keys can be added to this package in two ways:
> >  #
> >  #   1) In a .bbappend, add .gpg and/or .asc files to SRC_URI and insta=
ll them to
> > --
> > 2.43.0
> >
> >
> >
> >
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#208413): https://lists.openembedded.org/g/openembedde=
d-core/message/208413
> Mute This Topic: https://lists.openembedded.org/mt/109955189/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
ex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

