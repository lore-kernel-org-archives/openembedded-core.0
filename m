Return-Path: <dse@thaumatec.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11523C2BA18
	for <webhook@archiver.kernel.org>; Thu, 20 Jun 2024 13:40:31 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.web11.47744.1718890824490948567
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Jun 2024 06:40:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@thaumatec-com.20230601.gappssmtp.com header.s=20230601 header.b=F6jXJH6v;
 spf=pass (domain: thaumatec.com, ip: 209.85.208.51, mailfrom: dse@thaumatec.com)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-57d1679ee83so890870a12.2
        for <openembedded-core@lists.openembedded.org>; Thu, 20 Jun 2024 06:40:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thaumatec-com.20230601.gappssmtp.com; s=20230601; t=1718890823; x=1719495623; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9vMZJYnIH1UnZYHoReFAh6LSf5qfXXocQ1aVFBZEL28=;
        b=F6jXJH6vDGAUUuxgUvki7bR5vOoI+LvRxZNGwJ8zAlbmUG9qwYg6cuE4faIjlu/Lq+
         /kTcBnP8vDJeSrdCLxFPvDDV/dcGGPrZ3mRmI3c94tjDOB+83fzD2yQHYdgkZbdmSIW9
         6FyE4DTTHcHG5ZdDrBQUdEMuv4bMdhHXslksI0RW6NmLTjnfhwMj+c+3vtfZT4ZEarAu
         X2MuLKDGgqkH68DP4bG4iaFfQgS4zP4NnwDhJ162nVjTrBhDI3PIWbFKnlWA6YwoQqyg
         02t4pY1/3xcoe734t1+1L2O3/POmK44NBjsDoBp6WM33SsxHv0IGtq9Tn083rlfsZHE1
         74Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718890823; x=1719495623;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9vMZJYnIH1UnZYHoReFAh6LSf5qfXXocQ1aVFBZEL28=;
        b=hP88zvM0n9T9m7VMY6EowKxvVIRFklj7T+X8jq6SjDLmHbGd0udLuR7Hh8oWGZmcSr
         FkHm0quOpE9uiM5t4AVvah9/2IMJPl7DcwJGTJx0wH/jk8vg8DHcqZqhZm8svypd0OFU
         fzzFRL0G19EUaSOFc28Rwwio8LBd5rBfOc47Idi7EaI7mtRWkg6mMA/EkRrN8ftntUWl
         KscENST/ef+mLp6AJjMXiLBjQRRRx82ky07kYScyoFXdcN2bK6ADPp+HkX+81SFP3CpC
         AY54/SnNl0JMkPENmBPsMLvtLbs4ZMfuy3HDrrHLNReyGlGcKRMv8E8GIVxpsI0UbQz4
         xOrg==
X-Gm-Message-State: AOJu0YyIQzMi16b2w+Rxb2qovyCdkgtTt9lW5yyUVdH6KDmt0qo8kezT
	xZHiw4mtpn9yVujS8oZthdoORgBx5JU/2ZOYoSkvdaaSsDbs1b/wggnO85wWPpr8va3AZBnWyeM
	Q3DmzUEJa1MOp8S7zZ42LnFRaz9JnF0IrViUkkA==
X-Google-Smtp-Source: AGHT+IFFAqUjyPOuIeeKADfdj5vK3e0l68oahwDwSOrif54pNvs3fyVIMezobKp1uXFBGm/TqHMrLZnOYSngYnV5T5w=
X-Received: by 2002:a50:9f67:0:b0:57c:6d58:e1f1 with SMTP id
 4fb4d7f45d1cf-57d07e6bab3mr3229486a12.9.1718890822639; Thu, 20 Jun 2024
 06:40:22 -0700 (PDT)
MIME-Version: 1.0
References: <20240620130343.220397-1-dse@thaumatec.com> <CA+chaQfDn=N8vh0r6m+bCSZkpdoOOPvxku6q=ygWUnFt0HUK+w@mail.gmail.com>
In-Reply-To: <CA+chaQfDn=N8vh0r6m+bCSZkpdoOOPvxku6q=ygWUnFt0HUK+w@mail.gmail.com>
From: Daniel Semkowicz <dse@thaumatec.com>
Date: Thu, 20 Jun 2024 15:40:11 +0200
Message-ID: <CAHgnY3mxKa3Ca1_aUYn=hE5E+Q=NdqmNdx-iZ5vrh=uXG6OoeQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] os-release: Fix VERSION_CODENAME in case it is empty
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Jun 2024 13:40:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200955

Unfortunately, settings DISTRO_CODENAME to empty string triggers
VERSION variable to be suffixed with "()", because:

  VERSION =3D "${DISTRO_VERSION}${@' (%s)' % DISTRO_CODENAME if
'DISTRO_CODENAME' in d else ''}"

Which is not a desirable effect.

On Thu, Jun 20, 2024 at 3:16=E2=80=AFPM Martin Jansa <martin.jansa@gmail.co=
m> wrote:
>
> If you want to set VERSION_CODENAME to empty you can just add:
> DISTRO_CODENAME ??=3D ""
> to make sure it's always expanded to at least empty string.
>
> On Thu, Jun 20, 2024 at 3:04=E2=80=AFPM Daniel Semkowicz via
> lists.openembedded.org <dse=3Dthaumatec.com@lists.openembedded.org>
> wrote:
> >
> > If DISTRO_CODENAME was not set, VERSION_CODENAME field was populated
> > with unparsed string. This resulted in the following line in os-release
> > file:
> >
> >   VERSION_CODENAME=3D"${DISTRO_CODENAME}"
> >
> > According to systemd documentation, this field is optional.
> > Fix the problem by setting VERSION_CODENAME conditionally, only if
> > DISTRO_CODENAME was set.
> >
> > Signed-off-by: Daniel Semkowicz <dse@thaumatec.com>
> > ---
> >  meta/recipes-core/os-release/os-release.bb | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta/recipes-core/os-release/os-release.bb b/meta/recipes-=
core/os-release/os-release.bb
> > index 8906906bc3..93af08c182 100644
> > --- a/meta/recipes-core/os-release/os-release.bb
> > +++ b/meta/recipes-core/os-release/os-release.bb
> > @@ -24,7 +24,7 @@ ID =3D "${DISTRO}"
> >  NAME =3D "${DISTRO_NAME}"
> >  VERSION =3D "${DISTRO_VERSION}${@' (%s)' % DISTRO_CODENAME if 'DISTRO_=
CODENAME' in d else ''}"
> >  VERSION_ID =3D "${DISTRO_VERSION}"
> > -VERSION_CODENAME =3D "${DISTRO_CODENAME}"
> > +VERSION_CODENAME =3D "${@d.getVar('DISTRO_CODENAME') or ''}"
> >  PRETTY_NAME =3D "${DISTRO_NAME} ${VERSION}"
> >
> >  # The vendor field is hardcoded to "openembedded" deliberately. We'd
> > --
> > 2.45.2
> >
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#200952): https://lists.openembedded.org/g/openembed=
ded-core/message/200952
> > Mute This Topic: https://lists.openembedded.org/mt/106779331/3617156
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
martin.jansa@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >

