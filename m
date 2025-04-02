Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F0FCC28B20
	for <webhook@archiver.kernel.org>; Wed,  2 Apr 2025 11:09:10 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web11.5443.1743592149427026372
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Apr 2025 04:09:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=YF+sHKSm;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43d0618746bso46032385e9.2
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Apr 2025 04:09:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1743592148; x=1744196948; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ckPvcY6lxWlNwPJgzS1tCLZs6M6jXohvwq1XE9Zj32o=;
        b=YF+sHKSmP91R189DB9UaMGMB0ie7YRULSufRODf1md03WLThSWBxAmsMBbPewDtXu8
         H1o4jXbzKck8j+O0aKTtsYUw9gEMZii33bHtGP24aeAQeFWNP9Rcp1KVcDBnOBN6F+jl
         MTH55GSGxyoDM/ML8M+ylVMEGmMDWW9Miq3+w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743592148; x=1744196948;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ckPvcY6lxWlNwPJgzS1tCLZs6M6jXohvwq1XE9Zj32o=;
        b=J3FeKPLH7Zov1G+J0MtPGLLu5Va19tLIoEE2cGmp4zbCdNiJ/MZpJEVMUc5AYAmMok
         XO+EV2/FZ9z0v8A4qnfcv1pTzqCLz/uoLFz+NkuI2MKIJzI3jIgQ5LHzKjDu+nS7kU4D
         XjMo1bZ6KCr+xLmnuDtSBQ02/Bn+HLTngwOv5Qzfnw9nVAZ2500mgATuGQLqwxjCoU+G
         LF9sVoFwP8YgT8bjRRXbYysRbrERSEHoS+Ga6sYHQJ86//iCC+b8Q0krieXrUotEfFVw
         5hMDSZCthGdsXHCTuju8bw9w+Du6Am+QoioEJFbJxZs16gQHSre9ry4dmmgALGBhd8ma
         u0gg==
X-Forwarded-Encrypted: i=1; AJvYcCXYia8n3C9ejLVmp5ljXMsOX5u4YyPUuJTzvLQTbF10yJhM+IcyzRMA/dcjouqWr9NaPlez32Ub3CR9ml4xDjUGpw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxbS/DZFZHAd84dXpoJasEoExu9X+hdGW+UcNGcmRFwBLZXgaFe
	jLRVu6nxokVJI8zgSv0STWTIVigr1OztLRbtVuJrpDMwWFtXPnUMQ24oYdg8bMM=
X-Gm-Gg: ASbGncuYTPFx4x0h5tZ5VTcQArG7bDemHEMtU8r5vO3gJ8BnAYOXvbwB/mwXtv9kYm1
	s3hzmtG1rl6l3FyXp7ZWiY0+VQRzWnZ94x2uey6kclSOwnsoJWCynuN+B7GRfZlHCJeg8g8brss
	nvihdrmhtmqL0TkgwLlBSPh/Q2xspsDlJi+z7GwOsGSlkOwT0j7kyfRscIn5Amc8ki042MKlAXN
	PhW95agJzPZeep2AUQqXsQW/H1I25jmPJHaPsiUQkq/QoNPfRCZpqJrBuqmuORMVfdzUfvAtvTO
	kZ6TgO76ZVso4pk6Ep1uvcuOPUNCiBpCRUdgSOTbVchFnszsnb7vEghj0O9txR5JxUqecK7WiCq
	kGIYIjnjx7dXFm6m124TQHeESS3Fo4kppcA==
X-Google-Smtp-Source: AGHT+IFfaGI0i7N1DnYLgP9UnYMDXmDv8zXXVFyxwPyARPtNi7Qdd7hWKOmNM/k7ooX0vhIDUxGdGw==
X-Received: by 2002:a05:600c:22c1:b0:43c:f61e:6ea8 with SMTP id 5b1f17b1804b1-43dd692392cmr121010085e9.2.1743592147831;
        Wed, 02 Apr 2025 04:09:07 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:24b8:b374:749c:8558? ([2001:8b0:aba:5f3c:24b8:b374:749c:8558])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43eb5fd0d36sm17089865e9.10.2025.04.02.04.09.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 04:09:05 -0700 (PDT)
Message-ID: <5a0c2b8fb787bdf7d433e8b0c0835f75c2b34df4.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] python3-webcolors: upgrade 24.8.0 -> 24.11.1
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Maohui Lei (Fujitsu)" <leimaohui@fujitsu.com>, Martin Jansa
	 <martin.jansa@gmail.com>
Cc: Alexander Kanavin <alex@linutronix.de>, Jose Quaresma
	 <quaresma.jose@gmail.com>, Anuj Mittal <anuj.mittal@intel.com>, 
 "openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Date: Wed, 02 Apr 2025 12:09:04 +0100
In-Reply-To: <TY3PR01MB11056551D94171A6BC8F06F4AA0AF2@TY3PR01MB11056.jpnprd01.prod.outlook.com>
References: <20250402090749.2119-1-leimaohui@fujitsu.com>
	 <20250402090749.2119-2-leimaohui@fujitsu.com>
	 <d59454214fc72c26186fc86f073b66fbef83d12c.camel@linuxfoundation.org>
	 <CA+chaQdN+VKmo+DdYPoDsoz2XZuS9h=ZTJJaQd+3q2v2tJoqRg@mail.gmail.com>
	 <TY3PR01MB11056551D94171A6BC8F06F4AA0AF2@TY3PR01MB11056.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Apr 2025 11:09:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214260

On Wed, 2025-04-02 at 10:31 +0000, Maohui Lei (Fujitsu) wrote:
>=20
>=20
> > -----Original Message-----
> > From: Martin Jansa <martin.jansa@gmail.com>
> > Sent: Wednesday, April 2, 2025 6:04 PM
> > To: richard.purdie@linuxfoundation.org
> > Cc: Lei, Maohui/=E9=9B=B7 =E8=8C=82=E6=85=A7 <leimaohui@fujitsu.com>; A=
lexander Kanavin
> > <alex@linutronix.de>; Jose Quaresma <quaresma.jose@gmail.com>; Anuj
> > Mittal <anuj.mittal@intel.com>;
> > openembedded-core@lists.openembedded.org
> > Subject: Re: [OE-core] [PATCH] python3-webcolors: upgrade 24.8.0 ->
> > 24.11.1
> >=20
> > On Wed, Apr 2, 2025 at 11:59=E2=80=AFAM Richard Purdie via
> > lists.openembedded.org
> > <richard.purdie=3Dlinuxfoundation.org@lists.openembedded.org> wrote:
> > >=20
> > > On Wed, 2025-04-02 at 17:07 +0800, leimaohui via
> > > lists.openembedded.org
> > wrote:
> > > > Fix the issue that:
> > > > =C2=A0| Traceback (most recent call last):
> > > > =C2=A0|=C2=A0=C2=A0 File
> > "/mnt/test/build_auh/tmp/work/core2-64-poky-linux/python3-
> > webcolors/24.
> > 11.1/recipe-sysroot-native/usr/lib/pyth
> > on3.13/site-packages/pyproject_hooks/_impl.py", line 402, in
> > _call_hook
> > > > =C2=A0|=C2=A0=C2=A0=C2=A0=C2=A0 raise BackendUnavailable(
> > > > =C2=A0|=C2=A0=C2=A0=C2=A0=C2=A0 ...<4 lines>...
> > > > =C2=A0|=C2=A0=C2=A0=C2=A0=C2=A0 )
> > > > =C2=A0| pyproject_hooks._impl.BackendUnavailable: Cannot import
> > 'pdm.backend'
> > > >=20
> > > > python3-webcolors has migrated to pdm-backend=C2=A0 | diff --git
> > > > a/pyproject.toml b/pyproject.toml=C2=A0 | index 6fcec77..9f2dfa9
> > > > 100644
> > > > > --- a/pyproject.toml=C2=A0 | +++ b/pyproject.toml=C2=A0 | @@ -1,6=
5
> > > > > +1,110 @@
> > > > > =C2=A0[build-system]=C2=A0 | -requires =3D ["setuptools>=3D61.0"]=
=C2=A0 |
> > > > -build-backend =3D "setuptools.build_meta"
> > > > =C2=A0| +requires =3D [
> > > > =C2=A0| +=C2=A0=C2=A0=C2=A0 "pdm-backend",
> > > > =C2=A0| +]
> > > > =C2=A0| +build-backend =3D "pdm.backend"
> > > >=20
> > > > Signed-off-by: Lei Maohui <leimaohui@fujitsu.com>
> > > > ---
> > > > =C2=A0...n3-webcolors_24.8.0.bb =3D> python3-webcolors_24.11.1.bb} =
| 7
> > > > ++++++-
> > > > =C2=A01 file changed, 6 insertions(+), 1 deletion(-)=C2=A0 rename
> > > > meta/recipes-devtools/python/{python3-webcolors_24.8.0.bb =3D>
> > > > python3-webcolors_24.11.1.bb} (70%)
> > > >=20
> > > > diff --git
> > > > a/meta/recipes-devtools/python/python3-webcolors_24.8.0.bb
> > > > b/meta/recipes-devtools/python/python3-webcolors_24.11.1.bb
> > > > similarity index 70%
> > > > rename from meta/recipes-devtools/python/python3-
> > > > webcolors_24.8.0.bb
> > > > rename to meta/recipes-devtools/python/python3-
> > > > webcolors_24.11.1.bb
> > > > index c5ed4bd7d3..cda63d2a35 100644
> > > > --- a/meta/recipes-devtools/python/python3-webcolors_24.8.0.bb
> > > > +++ b/meta/recipes-devtools/python/python3-webcolors_24.11.1.bb
> > > > @@ -3,10 +3,15 @@ HOMEPAGE =3D
> > > > "https://pypi.org/project/webcolors/"
> > > > =C2=A0LICENSE =3D "BSD-3-Clause"
> > > > =C2=A0LIC_FILES_CHKSUM =3D
> > "file://LICENSE;md5=3Dcbaebec43b7d199c7fd8f5411b3b0448"
> > > >=20
> > > > -SRC_URI[sha256sum] =3D
> > "08b07af286a01bcd30d583a7acadf629583d1f79bfef27dd2c2c5c263817277d
> > "
> > > > +SRC_URI[sha256sum] =3D
> > "ecb3d768f32202af770477b8b65f318fa4f566c22948673a977b00d589dd80f
> > 6"
> > > >=20
> > > > =C2=A0inherit pypi python_setuptools_build_meta ptest-python-pytest
> > > >=20
> > > > +DEPENDS +=3D " \
> > > > +=C2=A0=C2=A0=C2=A0 python3-pdm-native \
> > > > +=C2=A0=C2=A0=C2=A0 python3-pdm-backend-native \
> > > > +"
> > > > +
> > >=20
> > > ERROR: Nothing RPROVIDES 'python3-webcolors-dev' (but
> > > meta/recipes-devtools/python/python3-webcolors_24.11.1.bb
> > > RDEPENDS
> > on or otherwise requires it) No eligible RPROVIDERs exist for
> > 'python3-webcolors-dev'
> >=20
> >=20
> > > That recipe isn't in core.
> >=20
> > Looks like you've accidentally copied the 2nd error about RPROVIDES
> > not the
> > first one about PROVIDES.
> >=20
> > The main error is about python3-pdm which is in
> > meta-oe/meta-python/recipes-devtools/python/python3-pdm_2.22.4.bb
>=20
> Thank you, but how can we solve this kind of issue that 24.11.1
> version of python3-webcolors depends on packages out of core

Sometimes we have to move recipes to oe-core for this reason, or we
move the recipe to meta-oe. It depends what is using it and which layer
it really belongs in.

Cheers,

Richard


