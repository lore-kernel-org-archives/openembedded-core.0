Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 738A9C28B20
	for <webhook@archiver.kernel.org>; Wed,  2 Apr 2025 10:03:59 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
 by mx.groups.io with SMTP id smtpd.web11.4479.1743588228807009738
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Apr 2025 03:03:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Pj263i2v;
 spf=pass (domain: gmail.com, ip: 209.85.167.50, mailfrom: martin.jansa@gmail.com)
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-54963160818so7216625e87.2
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Apr 2025 03:03:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743588227; x=1744193027; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iKwd7DAKFElGJtX1kizsjVoPbbgBzHI5+xDJP/40nbE=;
        b=Pj263i2vR02yAzWV1JlsaCbAZ/zhkePg877cPqQeeW7nnGTacxMXLT2Zqf1NWuKBsr
         qBWEPCNb/Sc+0wYOULjzdt/GxAVYTQSBjjEz7Z7jc1yE9dzhPEoqVR7PBUAzXkkoF38Y
         RZFPK/zfHPLKbFyYbK5Tdkr2Xjk7wkvZfFulPZHZCYaaOqyn/NGVh5AsdasX+bO7nr6g
         fXp0HSghQcsw96GFnT5u2cfk0Dh8vodUd2QoQuBLXkuT2mRe/mDZ3Gp7J0pGvlhMzVxs
         3aB/V1JUnhzCwPvPoQ7jJzNjh4IsYw+n0e6RKIkOITjXFeQTjN+Vp8tn29gQQ7vLkfM3
         C1Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743588227; x=1744193027;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iKwd7DAKFElGJtX1kizsjVoPbbgBzHI5+xDJP/40nbE=;
        b=R2G6c7eUb6MCLkte/Vsa58IH/CK0YUWCTqX8Kl70qRt0Lgl6txC0IKCbfnCuOPM24o
         bABTqw0RCcnQKgNJqvR1jhfGkaBPQKUdHiGSYyPzd5kP95bn87FgDmMQJ6aU5+KU24kG
         rL71+cz76aV+pKPGJ36nfEjQVm7mPu8r9G9/aYFkLRQ3VJWYpZGgNGMYBPInQC2YjmMU
         R2t4Usg8cDfF9zpaaFc7BNit292H0WLerzNsRA5VZ1genopzeH7w3+O0XZTrqg89Qu0+
         t2H3ffqCZJLnXfAZB2YQ+orlWhzyO4bRwcgRQtIVFCBhf9T7UGCqo7J/W8Igm3BRshgN
         9C+g==
X-Forwarded-Encrypted: i=1; AJvYcCUOJRmXZ+TOiPV9WWYsSK3uo2hK6825UDd3Xg+FB59lkswcvPQzbTRk7Nr5hj0F32Fl2pzg1n0b0vto1aFPmhKtJQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yz7lFZmGrL8fCG83HUIZYlGO3429ckK7WI9npQgZcH99DauEkRm
	Nj19V7YCtklKfAiTyyPfsluVcqoBl+0o5uGkhpv4/fzOsLa1KpXuFXufGMgniQA4TH2vwRg/OF/
	mSqR+k2iTEv6Zg6r3POm234S+1Fg=
X-Gm-Gg: ASbGncs2eC67D89pujPFIeoo1Q3Q3sIfR84wht/76bp14x67EHjtFi2zyJnh2llQAoz
	5qKK4oJIteVgBKiMOpwqCfpOwpMJ4K8GDSzdPUOZ82lJ/OCzHn708XzTAYbUg4zfDNjHt0IQV/4
	YC+hvuTTTK8LbWweg9P5+vMUaWhTx/
X-Google-Smtp-Source: AGHT+IEDNq3WHGuwUTpEF6sDLB8csCRTcyCogcukOxObyt4oHXHbaRWRltMKNVxUiUKxJD6xi6NxlvZZutJVwb7g3l8=
X-Received: by 2002:a05:6512:334f:b0:54b:117c:118a with SMTP id
 2adb3069b0e04-54b117c1200mr3629364e87.55.1743588226733; Wed, 02 Apr 2025
 03:03:46 -0700 (PDT)
MIME-Version: 1.0
References: <20250402090749.2119-1-leimaohui@fujitsu.com> <20250402090749.2119-2-leimaohui@fujitsu.com>
 <d59454214fc72c26186fc86f073b66fbef83d12c.camel@linuxfoundation.org>
In-Reply-To: <d59454214fc72c26186fc86f073b66fbef83d12c.camel@linuxfoundation.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 2 Apr 2025 12:03:33 +0200
X-Gm-Features: AQ5f1JpoMFgbTXTiSD19gORwaBYmVuHR5KgaVCZvkUtoS7petbv93_zm4VtJttI
Message-ID: <CA+chaQdN+VKmo+DdYPoDsoz2XZuS9h=ZTJJaQd+3q2v2tJoqRg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] python3-webcolors: upgrade 24.8.0 -> 24.11.1
To: richard.purdie@linuxfoundation.org
Cc: leimaohui@fujitsu.com, Alexander Kanavin <alex@linutronix.de>, 
	Jose Quaresma <quaresma.jose@gmail.com>, Anuj Mittal <anuj.mittal@intel.com>, 
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Apr 2025 10:03:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214247

On Wed, Apr 2, 2025 at 11:59=E2=80=AFAM Richard Purdie via
lists.openembedded.org
<richard.purdie=3Dlinuxfoundation.org@lists.openembedded.org> wrote:
>
> On Wed, 2025-04-02 at 17:07 +0800, leimaohui via lists.openembedded.org w=
rote:
> > Fix the issue that:
> >  | Traceback (most recent call last):
> >  |   File "/mnt/test/build_auh/tmp/work/core2-64-poky-linux/python3-web=
colors/24.11.1/recipe-sysroot-native/usr/lib/pyth on3.13/site-packages/pypr=
oject_hooks/_impl.py", line 402, in _call_hook
> >  |     raise BackendUnavailable(
> >  |     ...<4 lines>...
> >  |     )
> >  | pyproject_hooks._impl.BackendUnavailable: Cannot import 'pdm.backend=
'
> >
> > python3-webcolors has migrated to pdm-backend
> >  | diff --git a/pyproject.toml b/pyproject.toml
> >  | index 6fcec77..9f2dfa9 100644
> >  | --- a/pyproject.toml
> >  | +++ b/pyproject.toml
> >  | @@ -1,65 +1,110 @@
> >  |  [build-system]
> >  | -requires =3D ["setuptools>=3D61.0"]
> >  | -build-backend =3D "setuptools.build_meta"
> >  | +requires =3D [
> >  | +    "pdm-backend",
> >  | +]
> >  | +build-backend =3D "pdm.backend"
> >
> > Signed-off-by: Lei Maohui <leimaohui@fujitsu.com>
> > ---
> >  ...n3-webcolors_24.8.0.bb =3D> python3-webcolors_24.11.1.bb} | 7 +++++=
+-
> >  1 file changed, 6 insertions(+), 1 deletion(-)
> >  rename meta/recipes-devtools/python/{python3-webcolors_24.8.0.bb =3D> =
python3-webcolors_24.11.1.bb} (70%)
> >
> > diff --git a/meta/recipes-devtools/python/python3-webcolors_24.8.0.bb b=
/meta/recipes-devtools/python/python3-webcolors_24.11.1.bb
> > similarity index 70%
> > rename from meta/recipes-devtools/python/python3-webcolors_24.8.0.bb
> > rename to meta/recipes-devtools/python/python3-webcolors_24.11.1.bb
> > index c5ed4bd7d3..cda63d2a35 100644
> > --- a/meta/recipes-devtools/python/python3-webcolors_24.8.0.bb
> > +++ b/meta/recipes-devtools/python/python3-webcolors_24.11.1.bb
> > @@ -3,10 +3,15 @@ HOMEPAGE =3D "https://pypi.org/project/webcolors/"
> >  LICENSE =3D "BSD-3-Clause"
> >  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dcbaebec43b7d199c7fd8f5411b3=
b0448"
> >
> > -SRC_URI[sha256sum] =3D "08b07af286a01bcd30d583a7acadf629583d1f79bfef27=
dd2c2c5c263817277d"
> > +SRC_URI[sha256sum] =3D "ecb3d768f32202af770477b8b65f318fa4f566c2294867=
3a977b00d589dd80f6"
> >
> >  inherit pypi python_setuptools_build_meta ptest-python-pytest
> >
> > +DEPENDS +=3D " \
> > +    python3-pdm-native \
> > +    python3-pdm-backend-native \
> > +"
> > +
>
> ERROR: Nothing RPROVIDES 'python3-webcolors-dev' (but meta/recipes-devtoo=
ls/python/python3-webcolors_24.11.1.bb RDEPENDS on or otherwise requires it=
)
> No eligible RPROVIDERs exist for 'python3-webcolors-dev'


> That recipe isn't in core.

Looks like you've accidentally copied the 2nd error about RPROVIDES
not the first one about PROVIDES.

The main error is about python3-pdm which is in
meta-oe/meta-python/recipes-devtools/python/python3-pdm_2.22.4.bb

