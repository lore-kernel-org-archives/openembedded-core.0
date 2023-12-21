Return-Path: <cordonnier.etienne@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C855CC35274
	for <webhook@archiver.kernel.org>; Thu, 21 Dec 2023 20:13:00 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web10.3837.1703189579086340766
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Dec 2023 12:12:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=AnoNvfqA;
 spf=pass (domain: gmail.com, ip: 209.85.221.45, mailfrom: cordonnier.etienne@gmail.com)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3333b46f26aso1025228f8f.1
        for <openembedded-core@lists.openembedded.org>; Thu, 21 Dec 2023 12:12:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703189577; x=1703794377; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NtPrpi9eVJQ4s18h0LiC/4iWqX1mEBY9bAdkIKNM60o=;
        b=AnoNvfqAWrkeoc6K9DMhBeBUz5Di150WdSIrPY5InhT1fRuPxNKhynK2JrUo2VktSj
         TBzWjwPLq3Or7Du22ULZAqm6z4YLxaJYYPXYnQwDq7TURcChks24SUpCihmC9UgRrR6j
         gi2Md6I1F8ctT5+94JxpPyKRbqBidIkaHHoLDTKTLBy2kATuc7hkoL1KC0i5vB9k+kan
         9vSb6JuctKz+Ezz+WnwNTCk8lO1HqngpD34oWKed2EBn/d/dgCaA9+tcqg+YxXp8jyKn
         evq/XNewWo+vvmzBoppWvWSM64EFrLqgccNqYPGoO/of3xyY3GnMTUtOwZwCBI1Aea+G
         RUtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703189577; x=1703794377;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NtPrpi9eVJQ4s18h0LiC/4iWqX1mEBY9bAdkIKNM60o=;
        b=nVCNTyNezCYZ7wexHSMT4X9fk9TvhJ6JGNBSaNGpGYnTqFlZuf4AcNVvKQgroK5lRV
         SKbGDF89cy304JonuWIGGAGYr92TVmnB823tcxNCUBIybIlFaZ9ewDGoVweb3Hoyf91a
         0ZTvVEDAFUjEHlJZzK7TVTVFruhubjtvmPnK5K9BJe4Ff+gxQTnatDkJA6pcDYDQemDR
         WJaE4nKbqGaZXo7vzkfCMiRVkozf4su6rIyo0DzsNx5/feCb7FkcUATIH7+quhF5eDDE
         4TK+BATyu5yCy8HSM9CTK5306WqW056fjXcslBdTwJBRLP5HLyVu6IKhou67p0z73uqd
         Xo/A==
X-Gm-Message-State: AOJu0YxOlTJjRVc3woguyar283Vh8FeRST8FEzWd0KBoUuBA1IUPkVbn
	//Xm6Psd/mOQ0I++K6wgi1I0JSOQAEe4dWRKRyQRcRaUdhc=
X-Google-Smtp-Source: AGHT+IHBT84d9LnBiY6A0Tqx2ZWqfIMBWgJG7Mx/8vSZLNWw5QbhM2gAbWzFO12i3ZJZ/nVQ24Oc2R3VU29bsHqtUeY=
X-Received: by 2002:a05:600c:3153:b0:40c:2787:570e with SMTP id
 h19-20020a05600c315300b0040c2787570emr135330wmo.168.1703189577313; Thu, 21
 Dec 2023 12:12:57 -0800 (PST)
MIME-Version: 1.0
References: <17A23F37CD7211A7.10836@lists.openembedded.org>
 <CAHUKmYZ_czf-Zg=Mr5fN9nREnq3iE8VAiLSRS7hOAN7qRcTX5w@mail.gmail.com>
 <CAMKF1sqpj_PCmQ5KRevqiBMxi6up4rdp3xZ-9TwD3fLOAzhouw@mail.gmail.com> <CAJFWPWaSCUcjL1kQ3EWfWqd=95rbY8P9iOddxCTtoR0AE0cKQg@mail.gmail.com>
In-Reply-To: <CAJFWPWaSCUcjL1kQ3EWfWqd=95rbY8P9iOddxCTtoR0AE0cKQg@mail.gmail.com>
From: Etienne Cordonnier <cordonnier.etienne@gmail.com>
Date: Thu, 21 Dec 2023 21:12:46 +0100
Message-ID: <CAJFWPWaocc9xbTSBohwPXf=mkKwSY8tW_eLKW3p_43JehQrisQ@mail.gmail.com>
Subject: Re: [OE-core][PATCH v4] kernel.bbclass: make do_symlink_kernelsrc reentrant
To: Khem Raj <raj.khem@gmail.com>
Cc: ecordonnier@snap.com, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Dec 2023 20:13:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192847

Also which release of yocto are you referring to? Both those
repositories don't have a nanbield branch.

On Thu, Dec 21, 2023 at 9:09=E2=80=AFPM Etienne Cordonnier
<cordonnier.etienne@gmail.com> wrote:
>
> Is it from https://github.com/varigit/meta-variscite-bsp-ti or
> https://github.com/varigit/meta-variscite-bsp-imx ? I did not find a
> repository called "meta-variscite-bsp".
>
> On Thu, Dec 21, 2023 at 5:14=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wro=
te:
> >
> > this fails in linux-variscrite recipe from meta-variscite-bsp
> >
> > https://snips.sh/f/9klGZxlCRE
> >
> > On Tue, Dec 19, 2023 at 5:40=E2=80=AFAM Etienne Cordonnier via
> > lists.openembedded.org <ecordonnier=3Dsnap.com@lists.openembedded.org>
> > wrote:
> > >
> > > Patch v4: use idempotent copy of the files instead of simply skipping=
 the code (see discussion under v2 of the patch).
> > >
> > > On Tue, Dec 19, 2023 at 2:38=E2=80=AFPM Etienne Cordonnier via lists.=
openembedded.org <ecordonnier=3Dsnap.com@lists.openembedded.org> wrote:
> > >>
> > >> From: Etienne Cordonnier <ecordonnier@snap.com>
> > >>
> > >> The function do_symlink_kernsrc is not reentrant in the case where S=
 is defined
> > >> to a non-default value. This causes build-failures e.g. when buildin=
g linux-yocto, then updating
> > >> poky to a commit which modifies kernel.bbclass, and then building li=
nux-yocto again.
> > >>
> > >> Bugzilla: https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__bug=
zilla.yoctoproject.org_show-5Fbug.cgi-3Fid-3D15325&d=3DDwIDAg&c=3DncDTmphkJ=
TvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSG=
a66m67E&m=3DVB1zXAiE9q_CqM9DgoA0BbtloUxpQE_rQ7eqk7HGzBW9KzFu44K9hS1iahsqSuI=
k&s=3D9Cr8vwWgUwwGM5oCO07DB4sO9sQpMCdweS1u8CmZ0Qw&e=3D
> > >>
> > >> Tested with a recipe "my-custom-linux" which unpacks sources to a cu=
stom ${S} directory
> > >> and ran symlink_kernsrc several times:
> > >> $ bitbake -f -c symlink_kernsrc my-custom-linux
> > >>
> > >> Signed-off-by: Etienne Cordonnier <ecordonnier@snap.com>
> > >> ---
> > >>  meta/classes-recipe/kernel.bbclass | 8 +++++++-
> > >>  1 file changed, 7 insertions(+), 1 deletion(-)
> > >>
> > >> diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recip=
e/kernel.bbclass
> > >> index 9ff37f5c38..42c5519f81 100644
> > >> --- a/meta/classes-recipe/kernel.bbclass
> > >> +++ b/meta/classes-recipe/kernel.bbclass
> > >> @@ -189,11 +189,17 @@ python do_symlink_kernsrc () {
> > >>              # drop trailing slash, so that os.symlink(kernsrc, s) d=
oesn't use s as
> > >>              # directory name and fail
> > >>              s =3D s[:-1]
> > >> -        if d.getVar("EXTERNALSRC"):
> > >> +        if d.getVar("EXTERNALSRC") and not os.path.islink(s):
> > >>              # With EXTERNALSRC S will not be wiped so we can symlin=
k to it
> > >>              os.symlink(s, kernsrc)
> > >>          else:
> > >>              import shutil
> > >> +            # perform idempotent/reentrant copy
> > >> +            s_copy =3D s + ".orig"
> > >> +            if not os.path.isdir(s_copy):
> > >> +                shutil.copytree(s, s_copy)
> > >> +            bb.utils.remove(s, recurse=3DTrue)
> > >> +            shutil.copytree(s_copy, s)
> > >>              shutil.move(s, kernsrc)
> > >>              os.symlink(kernsrc, s)
> > >>  }
> > >> --
> > >> 2.36.1.vfs.0.0
> > >>
> > >>
> > >>
> > >>
> > >
> > >
> > >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#192838): https://lists.openembedded.org/g/openembed=
ded-core/message/192838
> > Mute This Topic: https://lists.openembedded.org/mt/103262114/7259375
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
cordonnier.etienne@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >

