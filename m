Return-Path: <dse@thaumatec.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA4C5C2BBCA
	for <webhook@archiver.kernel.org>; Fri, 28 Jun 2024 07:46:24 +0000 (UTC)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
 by mx.groups.io with SMTP id smtpd.web11.12137.1719560781862733037
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Jun 2024 00:46:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@thaumatec-com.20230601.gappssmtp.com header.s=20230601 header.b=ladp5hlD;
 spf=pass (domain: thaumatec.com, ip: 209.85.208.45, mailfrom: dse@thaumatec.com)
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-584ee8da49aso2611031a12.0
        for <openembedded-core@lists.openembedded.org>; Fri, 28 Jun 2024 00:46:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thaumatec-com.20230601.gappssmtp.com; s=20230601; t=1719560780; x=1720165580; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RlVfT4QtjFAN0BnsYUCFa64AGJn2CYOpOW7IbZcXJCY=;
        b=ladp5hlDkJV8hkXUnPa4ljwQofPubKl04czP+pvqYC16zvhzEdD7IVPLeVI5Bb7MPz
         ou7DjYiYcOO/YDLXu5uMduyBol6/L/efYSXiW3mrp0a8KhWW7W5zOUZVdOVTKscNuX5T
         ZAR2Zqq2JGfSnefJFEg0mwSRnvGQDevJX4wmi0Er9Z0RlLKdYC7wL5D7eSqHMTrdD2dG
         k0hajk/Yrhk4d+WxHaX7YZ26sVFob4hz/Vy7zLGc1rVqTXIpOhNzlLXUEpnFxU7GHBNH
         G4n5LacgBufbhlNe01QyeDBDktPxZKYvQbP00j8OMH3AJtS4vIjv4uKMvKZfmoeEAcmn
         YyCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719560780; x=1720165580;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RlVfT4QtjFAN0BnsYUCFa64AGJn2CYOpOW7IbZcXJCY=;
        b=fN1CYPjo2uEt5iSxipo5ozCxAZ7x3bAiShWs/O7SyqfJ/igJuxht4c5Azrw/6w6sim
         CO5XSKzqWJbojnNfDbASuPtFySTdpGbjXTLo/Jsx72ODbhDy8QTDLIeJ4juH05Wh2I+a
         OX9MdKL49w+aAf+AZCovfuPTOoDCbxpKN9z6ETZgZGyUMtevE70JZarUQbRZSB0EEXm+
         QWg19j1dhpK5svUOGHT2qr3Ag30ByXwthbd2B4kgu87QjsskijWW/KpKkBwCGN8N2rDL
         eNt6lNdCmKW3sl/+jzr300oG4Jc4ZwLC5L2cXWQAu/MfgFqgKOrx4mqHicyWHJeRbUP/
         lnCQ==
X-Gm-Message-State: AOJu0YwvWfbuOboorTWDjAAjK216FxeCYy/RMr/HhVH45IpL7bWN8rHJ
	5r778aDv/SFkvD7lkkKSrPpXfYqMiptiAUGa3fF7zs6OEX8fQ6JjWfz+jEhF+sCbgL9ieZ9rbZW
	Iwz4xBHibfNxZ/erEnu0aSYc7pkLBHhmhgHR2rS1NHdUmRFpgiIU=
X-Google-Smtp-Source: AGHT+IECKgmV3eJGsMwB43PkenK68ajYnnv/ncC5XIy0Uica/8glRB2M6TZMhLoCrZXGezJdSHS9o9v9B6UM1TKIe5A=
X-Received: by 2002:a17:907:987:b0:a72:83ad:f087 with SMTP id
 a640c23a62f3a-a72aee6574amr88643566b.10.1719560780030; Fri, 28 Jun 2024
 00:46:20 -0700 (PDT)
MIME-Version: 1.0
References: <20240620130343.220397-1-dse@thaumatec.com> <CA+chaQfDn=N8vh0r6m+bCSZkpdoOOPvxku6q=ygWUnFt0HUK+w@mail.gmail.com>
 <CAHgnY3mxKa3Ca1_aUYn=hE5E+Q=NdqmNdx-iZ5vrh=uXG6OoeQ@mail.gmail.com>
In-Reply-To: <CAHgnY3mxKa3Ca1_aUYn=hE5E+Q=NdqmNdx-iZ5vrh=uXG6OoeQ@mail.gmail.com>
From: Daniel Semkowicz <dse@thaumatec.com>
Date: Fri, 28 Jun 2024 09:46:09 +0200
Message-ID: <CAHgnY3=E1MMt+VtQTAfERbnPHmoDS+SGu+MaoAySDj4tZDURQw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] os-release: Fix VERSION_CODENAME in case it is empty
To: steve@sakoman.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Jun 2024 07:46:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201219

Hello Steve,

Would it be possible to backport this fix to scarthgap branch? The same
problem occurs also there.

Commit on master branch: 70a0b8bc1d846c857be90ce2e97e60c5ee32558e

Best regards
Daniel Semkowicz

On Thu, Jun 20, 2024 at 3:40=E2=80=AFPM Daniel Semkowicz <dse@thaumatec.com=
> wrote:
>
> Unfortunately, settings DISTRO_CODENAME to empty string triggers
> VERSION variable to be suffixed with "()", because:
>
>   VERSION =3D "${DISTRO_VERSION}${@' (%s)' % DISTRO_CODENAME if
> 'DISTRO_CODENAME' in d else ''}"
>
> Which is not a desirable effect.
>
> On Thu, Jun 20, 2024 at 3:16=E2=80=AFPM Martin Jansa <martin.jansa@gmail.=
com> wrote:
> >
> > If you want to set VERSION_CODENAME to empty you can just add:
> > DISTRO_CODENAME ??=3D ""
> > to make sure it's always expanded to at least empty string.
> >
> > On Thu, Jun 20, 2024 at 3:04=E2=80=AFPM Daniel Semkowicz via
> > lists.openembedded.org <dse=3Dthaumatec.com@lists.openembedded.org>
> > wrote:
> > >
> > > If DISTRO_CODENAME was not set, VERSION_CODENAME field was populated
> > > with unparsed string. This resulted in the following line in os-relea=
se
> > > file:
> > >
> > >   VERSION_CODENAME=3D"${DISTRO_CODENAME}"
> > >
> > > According to systemd documentation, this field is optional.
> > > Fix the problem by setting VERSION_CODENAME conditionally, only if
> > > DISTRO_CODENAME was set.
> > >
> > > Signed-off-by: Daniel Semkowicz <dse@thaumatec.com>
> > > ---
> > >  meta/recipes-core/os-release/os-release.bb | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/meta/recipes-core/os-release/os-release.bb b/meta/recipe=
s-core/os-release/os-release.bb
> > > index 8906906bc3..93af08c182 100644
> > > --- a/meta/recipes-core/os-release/os-release.bb
> > > +++ b/meta/recipes-core/os-release/os-release.bb
> > > @@ -24,7 +24,7 @@ ID =3D "${DISTRO}"
> > >  NAME =3D "${DISTRO_NAME}"
> > >  VERSION =3D "${DISTRO_VERSION}${@' (%s)' % DISTRO_CODENAME if 'DISTR=
O_CODENAME' in d else ''}"
> > >  VERSION_ID =3D "${DISTRO_VERSION}"
> > > -VERSION_CODENAME =3D "${DISTRO_CODENAME}"
> > > +VERSION_CODENAME =3D "${@d.getVar('DISTRO_CODENAME') or ''}"
> > >  PRETTY_NAME =3D "${DISTRO_NAME} ${VERSION}"
> > >
> > >  # The vendor field is hardcoded to "openembedded" deliberately. We'd
> > > --
> > > 2.45.2
> > >
> > >
> > >
> > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > > Links: You receive all messages sent to this group.
> > > View/Reply Online (#200952): https://lists.openembedded.org/g/openemb=
edded-core/message/200952
> > > Mute This Topic: https://lists.openembedded.org/mt/106779331/3617156
> > > Group Owner: openembedded-core+owner@lists.openembedded.org
> > > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub=
 [martin.jansa@gmail.com]
> > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > >

