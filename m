Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E42EC3ABDA
	for <webhook@archiver.kernel.org>; Wed, 14 May 2025 09:47:09 +0000 (UTC)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
 by mx.groups.io with SMTP id smtpd.web10.98217.1747216019908423276
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 May 2025 02:47:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=m40sUnUi;
 spf=pass (domain: gmail.com, ip: 209.85.208.169, mailfrom: martin.jansa@gmail.com)
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-326d67aacc4so43021991fa.3
        for <openembedded-core@lists.openembedded.org>; Wed, 14 May 2025 02:46:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747216018; x=1747820818; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J2K/AymwurjpllpOi0ccWDVugKujg99b5NLu4TSblM8=;
        b=m40sUnUisVPguZGWME4x/AQq/iSjZw0VQLTF69yM45HIK+IwfoVvRkhkYWpWAUDDNq
         JubJT40MSTM8uYk9I3R0v+BwuAxAIa4bWy7PXny2Z5JmyYCDR7n2R/OrDidEYglDTXjF
         vcAltYXrcSOZW+3BqEpTPo8PZJly8TxX96Tf+TdTwmPb0v89jAL6zaXp9tBKU5RVW9aa
         BC4aC/+4eDZVveeZLy5NsGpalbdOuu280Wzlh4kHNX83ZlvQVQBrzKNhkRcDKcP3sEbh
         jUuswqrLQJ/EMzFa43cUhLWNxMAaKAtjBKGbyGvKuWRnvomWiKQBktf2USO+nsl/DqsH
         Ycow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747216018; x=1747820818;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J2K/AymwurjpllpOi0ccWDVugKujg99b5NLu4TSblM8=;
        b=qt4vyFm+D+22mgw0Jf90xbKe3gxzS0S00fehnEX1KZgnhShDrdAI4k/24Pfg/4AQZ0
         HWWPClml7oMBrNMII5hC4Xl+Ka5YjO7CcGYkyH7brQRoGZKQHPupfW2b8iuUOcFrIz4k
         aERExuIy0f2jA4J0hJ2GiXigHbFOdL5mbeiiMgja55XzsDa1FGB4Fab1DvCaW2UDveh4
         9EEllfkxNrUAofvGhuhNPEfNTH2iPLECD+pd+UYJ+wDyj8omWomkBJ8S1ikQo6/uGqRs
         ABCLd6BPFphSIK/mVPUAGJlkD76zFDYAR+KC416LOp5tEUorrDY4ijkaBZjsZDwZ6YNN
         Je8g==
X-Gm-Message-State: AOJu0Yz3ES+nIejxJn0DgvVYwpk3O2D1MccyIOQZGhyz6gbN5Bn3dV3Z
	pUSgSOP8kKj+RxQDkq/qlQWO+5143cyiHUmX8Elc+w6Uxde9iTLwcqXxMb3eOTSpowz46agXVY9
	hJCIj+wvDJ5/amy7HNpB0tiC20tc=
X-Gm-Gg: ASbGnctJ2GcSdOcMks44v49Rvpo8Cr6CKQi+cnflLO8KJqE+RcLLpboBOv1nPhNYmMG
	dNZBnlb331Nxe8ht6lVIXDFm0GVym9XBSnCFQYQZZ5AQ++yqldHQIYz4Qn9COxJMfq9LetJgbKM
	h2ORiRAOrfJeCgNWhYHp7jXnEYJmXf1B60daY=
X-Google-Smtp-Source: AGHT+IG5ayuy6YXiuBEi+e4o629A8hRtz3dHAdy9y2hmdIpdo9AGrVZf/fh8aFaqNWSaZ/KbUvMrdKcUN5W94hZERus=
X-Received: by 2002:a05:651c:50a:b0:2ff:d0c4:5ffe with SMTP id
 38308e7fff4ca-327ed0e90d9mr10292431fa.16.1747216017457; Wed, 14 May 2025
 02:46:57 -0700 (PDT)
MIME-Version: 1.0
References: <1747040619-7566-1-git-send-email-wangmy@fujitsu.com>
 <1747040619-7566-37-git-send-email-wangmy@fujitsu.com> <CA+chaQc5av1DKKu7arqbnG-Vr8A2yVeCAxmy=kr7THKBAUusxA@mail.gmail.com>
 <TYWPR01MB11861463B6E2952F8CA37ECEADC91A@TYWPR01MB11861.jpnprd01.prod.outlook.com>
In-Reply-To: <TYWPR01MB11861463B6E2952F8CA37ECEADC91A@TYWPR01MB11861.jpnprd01.prod.outlook.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 14 May 2025 11:46:44 +0200
X-Gm-Features: AX0GCFvsY7QR11zbd_rYjhLUOLmRHcX4E3jVKGs9tCjsc17w4EoX7Wp5rHma1kI
Message-ID: <CA+chaQcbWNu6nK9DQPdLYUna0XdDSbok+4xBVDa-daYPUjFYMg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 37/56] python3-hatch-fancy-pypi-readme: upgrade
 24.1.0 -> 25.1.0
To: "Mingyu Wang (Fujitsu)" <wangmy@fujitsu.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 May 2025 09:47:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216490

OK, I've sent the .patch update in
https://lists.openembedded.org/g/openembedded-devel/message/117411 to
fix it.

On Wed, May 14, 2025 at 10:39=E2=80=AFAM Mingyu Wang (Fujitsu)
<wangmy@fujitsu.com> wrote:
>
> Yes, there is indeed this issue
> python3-gcovr has not been updated yet
> It seems that we need to synchronize the updates of python3-gcovr and pyt=
hon3-hatch-fancy-pypi-readme.
>
>   --
> Best Regards
> ---------------------------------------------------
> Wang Mingyu
> FUJITSU NANJING SOFTWARE TECHNOLOGY CO., LTD. (FNST)
> No.6 Wenzhu Road, Nanjing, 210012, China
> TEL=EF=BC=9A+86+25-86630566--8568
> COINS: 79988548
> FAX: +86+25-83317685
> MAIL: wangmy@fujitsu.com
>
> > -----Original Message-----
> > From: Martin Jansa <martin.jansa@gmail.com>
> > Sent: Wednesday, May 14, 2025 2:41 PM
> > To: Wang, Mingyu/=E7=8E=8B =E9=B8=A3=E7=91=9C <wangmy@fujitsu.com>
> > Cc: openembedded-core@lists.openembedded.org
> > Subject: Re: [OE-core] [PATCH 37/56] python3-hatch-fancy-pypi-readme:
> > upgrade 24.1.0 -> 25.1.0
> >
> > This seems to break python3-gcovr-8.3 which depends on older version.
> >
> > * Getting build dependencies for wheel...
> >
> > ERROR Missing dependencies:
> > hatch-fancy-pypi-readme=3D=3D24.1.0
> >
> > Do you have pending gcovr update somewhere? Might require patch update =
as
> > in
> > meta-python/recipes-devtools/python/python3-gcovr/0001-pyproject.toml-S=
upp
> > ort-newer-versions.patch
> > as https://github.com/gcovr/gcovr/blob/main/pyproject.toml still depend=
s on
> > 24.1.0.
> >
> > Cheers,
> >
> > On Mon, May 12, 2025 at 11:04=E2=80=AFAM wangmy via lists.openembedded.=
org
> > <wangmy=3Dfujitsu.com@lists.openembedded.org> wrote:
> > >
> > > From: Wang Mingyu <wangmy@fujitsu.com>
> > >
> > > Changelog:
> > > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > - $HFPR_PACKAGE_NAME is now replaced by the package name in the PyPI
> > readme.
> > > - Support for Python 3.7.
> > >
> > > Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> > > ---
> > >  ...adme_24.1.0.bb =3D> python3-hatch-fancy-pypi-readme_25.1.0.bb} | =
2
> > > +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)  rename
> > > meta/recipes-devtools/python/{python3-hatch-fancy-pypi-readme_24.1.0.=
b
> > > b =3D> python3-hatch-fancy-pypi-readme_25.1.0.bb} (80%)
> > >
> > > diff --git
> > > a/meta/recipes-devtools/python/python3-hatch-fancy-pypi-readme_24.1.0=
.
> > > bb
> > > b/meta/recipes-devtools/python/python3-hatch-fancy-pypi-readme_25.1.0=
.
> > > bb
> > > similarity index 80%
> > > rename from
> > > meta/recipes-devtools/python/python3-hatch-fancy-pypi-readme_24.1.0.b=
b
> > > rename to
> > > meta/recipes-devtools/python/python3-hatch-fancy-pypi-readme_25.1.0.b=
b
> > > index b32527f949..5d8d82edd8 100644
> > > ---
> > > a/meta/recipes-devtools/python/python3-hatch-fancy-pypi-readme_24.1.0=
.
> > > bb
> > > +++ b/meta/recipes-devtools/python/python3-hatch-fancy-pypi-readme_25=
.
> > > +++ 1.0.bb
> > > @@ -8,6 +8,6 @@ inherit pypi python_hatchling  PYPI_PACKAGE =3D
> > > "hatch_fancy_pypi_readme"
> > >  UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
> > >
> > > -SRC_URI[sha256sum] =3D
> > "44dd239f1a779b9dcf8ebc9401a611fd7f7e3e14578dcf22c265dfaf7c1514b8"
> > > +SRC_URI[sha256sum] =3D
> > "9c58ed3dff90d51f43414ce37009ad1d5b0f08ffc9fc216998a06380f01c0045"
> > >
> > >  BBCLASSEXTEND =3D "native nativesdk"
> > > --
> > > 2.43.0
> > >
> > >
> > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > > Links: You receive all messages sent to this group.
> > > View/Reply Online (#216335):
> > > https://lists.openembedded.org/g/openembedded-core/message/216335
> > > Mute This Topic: https://lists.openembedded.org/mt/113067219/3617156
> > > Group Owner: openembedded-core+owner@lists.openembedded.org
> > > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub
> > > [martin.jansa@gmail.com]
> > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > >

