Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03406C48260
	for <webhook@archiver.kernel.org>; Thu,  8 Feb 2024 11:24:57 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web11.15723.1707391492257260660
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Feb 2024 03:24:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MQjzflrl;
 spf=pass (domain: gmail.com, ip: 209.85.128.45, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4103fc91755so2848635e9.2
        for <openembedded-core@lists.openembedded.org>; Thu, 08 Feb 2024 03:24:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707391491; x=1707996291; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=morj1efvnp6VaycH5qKVMHu13bXxGzG9d6hLbPZvnTg=;
        b=MQjzflrlHMTaj/GtVN8AsN2ZyCoTEEqLEHSQ6JNOefNZFBbDMqb7VySSFxnmAijeMg
         1pG8vxjsQCZgjU1Ng8Xc2dG31rr/ARYIWUz18SZPMAoc5kJ0F0fB651wSlAKiB/X1bwm
         MCMbKp6aFt04JARzkFPULHFD9gFWLMlM+CKvHFC0BIh9lbpJLZkqosFd14ED9nY4RMHP
         S4wtrqLypK+6H5UV8WGhBpGNGtXbXsIT57i+hqjDNdD+c8wXQAyG0ari5Ca0CzRAaxQr
         vTdrRULvzyegaJHpdkl5ufzX5DS9BKi0EWY2UhgrGNVg8e5OFJhz0b+TBHYrdZLw3m+Q
         GUYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707391491; x=1707996291;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=morj1efvnp6VaycH5qKVMHu13bXxGzG9d6hLbPZvnTg=;
        b=vv3CbfpuV/A8LDqS6wmajZ/fvMQgX86jUgaleSX54mJZmQAPO5r+LG2lRlvk10vSaE
         W4oJJdue5lopsMNnwLg35wncr5S6yeZC1pflJAU7mrnkYNPUw9pQbdgYXVQAouLpWMou
         Y682kb3lzdKbNFTkh9gNRF1mawWqJzjmwc9v6b4pA5331uYYa4V3nQEDbwNBuHKfwrJH
         DcQUQ7/mFdeJtKFRlvaa95WTObRpHAEhz1zVauAmoPjYSz+q+JJ6EI1KRFi9cCUcTZPI
         EiPpZRYWWuiZjB54K7fWngmYki93sjg8EN/bBeHG7szam8GzcCbQPc1PURddEMYvdhOh
         fGDg==
X-Forwarded-Encrypted: i=1; AJvYcCWCd8cdnQ8uA2CMVXZJu6EOgDdjxAdVRLKMBff5t2ztVzkWtUb6FWpxUdtspL/QURC3mbi8jD2hEShOx8AgN07wtZL2NVqpvTaxyM5YuByzDRpTlvi+q7Zh
X-Gm-Message-State: AOJu0Ywh/tCkgpOuGqGpVLHX9YTd7hO5kygs61/dGliNWc/Ss0866VKv
	AGYP+zRIJOzUv73hPEwQTcIJPAqe7z1cfgZQmZLJK7UIXW7AJ36YSJ3DwpeQ
X-Google-Smtp-Source: AGHT+IHy8AUNt3xcPBp4x7D0PTCygMKsg9ur3bgxaBZJ0hDxzzWVW3J8eMb7IvrbIK1MnLN/jqgs/Q==
X-Received: by 2002:a05:600c:2255:b0:40e:fa6b:f355 with SMTP id a21-20020a05600c225500b0040efa6bf355mr7176312wmm.41.1707391490339;
        Thu, 08 Feb 2024 03:24:50 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUXkCZecriTodXZrf/GMRLIezKUn5cSGxgnUCFBwthr01E1Xr5Q82VaT7ml64LcyFhdF/PXqCS+B27TUJZq6KIDDXaKm7Zb0HYx3ygRKTklEjh7ltgbGnY1
Received: from ?IPv6:2a02:169:59a6:0:55c4:f628:91f3:4287? ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id z17-20020a056000111100b0033b50344a97sm2937108wrw.7.2024.02.08.03.24.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Feb 2024 03:24:49 -0800 (PST)
Message-ID: <101fd24fc15bde8c8a9650618cb57efbeb49d3a5.camel@gmail.com>
Subject: Re: [OE-core] [PATCH 5/7] oeqa/selftest/runtime_test: allow GPLv3
 for bash
From: adrian.freihofer@gmail.com
To: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org
Date: Thu, 08 Feb 2024 12:24:48 +0100
In-Reply-To: <699a34ce70c4f663938d5b396bcf82d8e8f97698.camel@linuxfoundation.org>
References: <20240208082821.430510-1-adrian.freihofer@siemens.com>
	 <20240208082821.430510-6-adrian.freihofer@siemens.com>
	 <699a34ce70c4f663938d5b396bcf82d8e8f97698.camel@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.module_f38+17164+63eeee4a) 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Feb 2024 11:24:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195136

On Thu, 2024-02-08 at 08:44 +0000, Richard Purdie wrote:
> On Thu, 2024-02-08 at 09:27 +0100, Adrian Freihofer wrote:
> > Test cases failed with:
> > =C2=A0 ERROR: core-image-full-cmdline-1.0-r0 do_rootfs: Package bash
> > cannot
> > =C2=A0 be installed into the image because it has incompatible
> > license(s):
> > =C2=A0 GPL-3.0-or-later
> >=20
> > Allow GPLv3 for these tests.
> >=20
> > Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
> > ---
> > =C2=A0meta/lib/oeqa/selftest/cases/runtime_test.py | 6 ++++++
> > =C2=A01 file changed, 6 insertions(+)
> >=20
> > diff --git a/meta/lib/oeqa/selftest/cases/runtime_test.py
> > b/meta/lib/oeqa/selftest/cases/runtime_test.py
> > index 12000aac16e..4277c98a39c 100644
> > --- a/meta/lib/oeqa/selftest/cases/runtime_test.py
> > +++ b/meta/lib/oeqa/selftest/cases/runtime_test.py
> > @@ -124,6 +124,8 @@ class TestImage(OESelftestTestCase):
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 features =3D 'IMAGE_CL=
ASSES +=3D "testimage"\n'
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 features +=3D 'IMAGE_I=
NSTALL:append =3D " libssl"\n'
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 features +=3D 'TEST_SU=
ITES =3D "ping ssh selftest"\n'
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # core-image-full-cmdline n=
eeds bash which is GPL-3.0-or-
> > later.
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 features +=3D 'INCOMPATIBLE=
_LICENSE:pn-core-image-full-
> > cmdline =3D ""\n'
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self.write_config(feat=
ures)
> > =C2=A0
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bitbake('core-image-fu=
ll-cmdline socat')
> > @@ -175,6 +177,8 @@ TEST_RUNQEMUPARAMS +=3D " slirp"
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 features +=3D 'PACKAGE=
_FEED_GPG_PASSPHRASE_FILE =3D "%s"\n' %
> > os.path.join(signing_key_dir, 'key.passphrase')
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 features +=3D 'GPG_PAT=
H =3D "%s"\n' % self.gpg_home
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 features +=3D 'PSEUDO_=
IGNORE_PATHS .=3D ",%s"\n' %
> > self.gpg_home
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # core-image-full-cmdline n=
eeds bash which is GPL-3.0-or-
> > later.
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 features +=3D 'INCOMPATIBLE=
_LICENSE:pn-core-image-full-
> > cmdline =3D ""\n'
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self.write_config(feat=
ures)
> > =C2=A0
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bitbake('core-image-fu=
ll-cmdline socat')
> > @@ -212,6 +216,8 @@ TEST_RUNQEMUPARAMS +=3D " slirp"
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 features +=3D 'PACKAGE=
_FEED_GPG_PASSPHRASE_FILE =3D "%s"\n' %
> > os.path.join(signing_key_dir, 'key.passphrase')
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 features +=3D 'GPG_PAT=
H =3D "%s"\n' % self.gpg_home
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 features +=3D 'PSEUDO_=
IGNORE_PATHS .=3D ",%s"\n' %
> > self.gpg_home
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # core-image-full-cmdline n=
eeds bash which is GPL-3.0-or-
> > later.
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 features +=3D 'INCOMPATIBLE=
_LICENSE:pn-core-image-full-
> > cmdline =3D ""\n'
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self.write_config(feat=
ures)
> > =C2=A0
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # Build core-image-sat=
o and testimage
>=20
> I don't understand this, where is this failing? We're not seeing this
> on the autobuilder?

You are right. Please ignore this patch.

I tried to recap what I did. Most probably I forgot to remove this
lines from my local.conf after debugging one failing test case
manually:

INCOMPATIBLE_LICENSE:pn-core-image-full-cmdline =3D "GPL-3.0* LGPL-3.0*"
INCOMPATIBLE_LICENSE:pn-core-image-weston =3D "GPL-3.0* LGPL-3.0*"

This would explain it.

Regards,
Adrian

>=20
> Cheers,
>=20
> Richard
>=20
>=20


