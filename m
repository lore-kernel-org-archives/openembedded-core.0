Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C48D3EB64D9
	for <webhook@archiver.kernel.org>; Thu, 15 Jun 2023 20:54:13 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web10.29736.1686862443301376008
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Jun 2023 13:54:03 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linuxfoundation.org header.s=google header.b=aNCZSXwF;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-3f7ff69824dso9274595e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Jun 2023 13:54:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1686862441; x=1689454441;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=1U6esgaCo1+FyFA2bhrYrlYkNmaQlp4QyWWGEfymp3Q=;
        b=aNCZSXwFbmRGXVtHRRMKBz0la4Ad4q6sIxMoKWIvouBLIqJ2zvLa6t6FmzXxeOEKKf
         vQgnIyBNUlENAL/bvylzzbkEQquTOBh1CPSIuL1opqA1j+V8Kb09uODXGAcXPdzuLGOD
         VFHi3kvn6++4iqj6ujBXxgcVbXIFuPjab+wk0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686862441; x=1689454441;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1U6esgaCo1+FyFA2bhrYrlYkNmaQlp4QyWWGEfymp3Q=;
        b=GvJWi5/FbcIy7Q8G5Ohj4gnzQ0ipnwRiK4yVoTgmZo81yQ+NGn3eP9m6LfEwvwlW60
         Dh7JyKDuJg4CIp8XcssS6wAzLyupGUR+KzIhV18GnVyvoQb3qMykmxpvAX/aF+f+WtEi
         OyK/7yuX28vWaL1y0/xwnd3E5rTCgjmN+u2gCa/xjkZH/QpLiymPWAnxwIDoY3/jApDw
         EDuC8QnHoptDiA9CbjIQZs7uYG+FxQBraYkVY8RONfAge5y0Gqa+ZP5JQa8hTcajiL2K
         ieGH2yfnVt4jCGHNd1AZd6uM6jHBZRJc/lINcvS5nVpF8afr8YHnmN3CtL8cgmXmh/EK
         VKqA==
X-Gm-Message-State: AC+VfDxd2nM9eX/N4LybcUvLpKf9mC4KCiVnQ+az5SZ7TLBb4iSkJFem
	UaesUDH8e/g5+hJ7EUoOI7s8dg==
X-Google-Smtp-Source: ACHHUZ4NybpNwJEkvwAiZTRHSA74ktZ/InyFsyQLzHokMJjsNp2nzhD+wJ3FI5pQia9ln3Hf3VhgZw==
X-Received: by 2002:a5d:6389:0:b0:30e:47e2:7eca with SMTP id p9-20020a5d6389000000b0030e47e27ecamr5059441wru.3.1686862441557;
        Thu, 15 Jun 2023 13:54:01 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:b814:609:2b03:c353? ([2001:8b0:aba:5f3c:b814:609:2b03:c353])
        by smtp.gmail.com with ESMTPSA id p19-20020a05600c469300b003f7f475c3bcsm5576143wmo.1.2023.06.15.13.54.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jun 2023 13:54:01 -0700 (PDT)
Message-ID: <29d8881ef34f787ac25a7a84f238beeff9dcf447.camel@linuxfoundation.org>
Subject: Re: [OE-core][dunfell 3/5] systemd-systemctl: fix instance template
 WantedBy symlink construction
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>, Steve Sakoman
	 <steve@sakoman.com>
Cc: Martin Siegumfeldt <mns@gomspace.com>, 
	"openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Date: Thu, 15 Jun 2023 21:54:00 +0100
In-Reply-To: <DB5PR02MB102132E7293ED031B16A6C02BEF5BA@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <cover.1686751371.git.steve@sakoman.com>
	 <f5ebbb87943bc583049909f4216ca1d73a794261.1686751371.git.steve@sakoman.com>
	 <DB5PR02MB102132E7293ED031B16A6C02BEF5BA@DB5PR02MB10213.eurprd02.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Jun 2023 20:54:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182873

On Thu, 2023-06-15 at 20:40 +0000, Peter Kjellerstedt wrote:
> > -----Original Message-----
> > From: openembedded-core@lists.openembedded.org <openembedded-
> > core@lists.openembedded.org> On Behalf Of Steve Sakoman
> > Sent: den 14 juni 2023 16:05
> > To: openembedded-core@lists.openembedded.org
> > Subject: [OE-core][dunfell 3/5] systemd-systemctl: fix instance
> > template
> > WantedBy symlink construction
> >=20
> > From: Martin Siegumfeldt <mns@gomspace.com>
> >=20
> > Fix issue of the below instance template systemd service dependency
> >=20
> > [Install]
> > WantedBy=3Dsvc-wants@%i.service
> >=20
> > creating the symlink (instance "a" example)
> >=20
> > /etc/systemd/system/svc-
> > wants@%i.service.wants/svc-wanted-by@a.service
> >=20
> > which should be
> >=20
> > /etc/systemd/system/svc-wants@a.service.wants
> > /svc-wanted-by@a.service
> >=20
> > as implemented by this change.
> >=20
> > The functionality appears regressed just after "thud" baseline when
> > the
> > logic was refactored from shell script into python (commit
> > 925e30cb104ece7bfa48b78144e758a46dc9ec3f)
> >=20
> > (From OE-Core rev: 308397f0bb3d6f3d4e9ec2c6a10823184049c9b5)
> >=20
> > Signed-off-by: Martin Siegumfeldt <mns@gomspace.com>
> > Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > Signed-off-by: Steve Sakoman <steve@sakoman.com>
> > (cherry picked from commit
> > 372b29c8ad270d4d430c26a4e614976c7029afaf)
> > Signed-off-by: Steve Sakoman <steve@sakoman.com>
> > ---
> > =C2=A0.../systemd/systemd-systemctl/systemctl             | 13
> > ++++++++++---
> > =C2=A01 file changed, 10 insertions(+), 3 deletions(-)
> >=20
> > diff --git a/meta/recipes-core/systemd/systemd-systemctl/systemctl
> > b/meta/recipes-core/systemd/systemd-systemctl/systemctl
> > index 6aa2e20465..577c373181 100755
> > --- a/meta/recipes-core/systemd/systemd-systemctl/systemctl
> > +++ b/meta/recipes-core/systemd/systemd-systemctl/systemctl
> > @@ -182,12 +182,19 @@ class SystemdUnit():
> >=20
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0raise SystemdUnit=
NotFoundError(self.root, unit)
> >=20
> > -    def _process_deps(self, config, service, location, prop,
> > dirstem):
> > +    def _process_deps(self, config, service, location, prop,
> > dirstem, instance):
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0systemdir =3D sel=
f.root / SYSCONFDIR / "systemd" / "system"
> >=20
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0target =3D ROOT /=
 location.relative_to(self.root)
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0try:
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0for dependent in config.get('Install', prop):
> > +                # determine whether or not dependent is a template
> > with an actual
> > +                # instance (i.e. a '@%i')
> > +                dependent_is_template =3D
> > re.match(r"[^@]+@(?P<instance>[^\.]*)\.", dependent)
> > +                if dependent_is_template:
> > +                    # if so, replace with the actual instance to
> > achieve
> > +                    #
> > svc-wants@a.service.wants/svc-wanted-by@a.service
> > +                    dependent =3D
> > re.sub(dependent_is_template.group('instance'), instance,
> > dependent, 1)
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0wants =3D systemdir / "{}.{}".format(depen=
dent,
> > dirstem) / service
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0add_link(wants, target)
> >=20
> > @@ -227,8 +234,8 @@ class SystemdUnit():
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0else:
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0service =3D self.unit
> >=20
> > -        self._process_deps(config, service, path, 'WantedBy',
> > 'wants')
> > -        self._process_deps(config, service, path, 'RequiredBy',
> > 'requires')
> > +        self._process_deps(config, service, path, 'WantedBy',
> > 'wants', instance)
> > +        self._process_deps(config, service, path, 'RequiredBy',
> > 'requires', instance)
> >=20
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0try:
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0for also in config.get('Install', 'Also'):
> > --
> > 2.34.1
>=20
> You might want to be careful with this one. It broke systemctl for us
> when it=20
> hit Mickledore and we have had to backport the version from Langdale
> for now.
>=20
> The problem is that it does not handle non-instanced units depending
> on=20
> an instanced unit. In our case we have a unit foo.service that
> contains=20
> a RequiredBy=3Dbar@0.service, which causes an error like this:
>=20
> Traceback (most recent call last):
> =C2=A0=C2=A0File ".../recipe-sysroot-native/usr/bin/systemctl", line 366,=
 in
> <module>
> =C2=A0=C2=A0=C2=A0=C2=A0main()
> =C2=A0=C2=A0File ".../recipe-sysroot-native/usr/bin/systemctl", line 352,=
 in
> main
> =C2=A0=C2=A0=C2=A0=C2=A0SystemdUnit(root, service).enable()
> =C2=A0=C2=A0File ".../recipe-sysroot-native/usr/bin/systemctl", line 250,=
 in
> enable
> =C2=A0=C2=A0=C2=A0=C2=A0self._process_deps(config, service, path, 'Wanted=
By', 'wants',
> instance)
> =C2=A0=C2=A0File ".../recipe-sysroot-native/usr/bin/systemctl", line 210,=
 in
> _process_deps
> =C2=A0=C2=A0=C2=A0=C2=A0dependent =3D re.sub(dependent_is_template.group(=
'instance'),
> instance, dependent, 1)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^=
^^
> ^^^^^^^^^^^^^^^^^^
> =C2=A0=C2=A0File ".../recipe-sysroot-native/usr/lib/python3.11/re/__init_=
_.py",
> line 185, in sub
> =C2=A0=C2=A0=C2=A0=C2=A0return _compile(pattern, flags).sub(repl, string,=
 count)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0^^^^^^^=
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> =C2=A0=C2=A0File ".../recipe-sysroot-native/usr/lib/python3.11/re/__init_=
_.py",
> line 317, in _subx
> =C2=A0=C2=A0=C2=A0=C2=A0template =3D _compile_repl(template, pattern)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> =C2=A0=C2=A0File ".../recipe-sysroot-native/usr/lib/python3.11/re/__init_=
_.py",
> line 308, in _compile_repl
> =C2=A0=C2=A0=C2=A0=C2=A0return _parser.parse_template(repl, pattern)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0^^^^^^^=
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> =C2=A0=C2=A0File ".../recipe-sysroot-native/usr/lib/python3.11/re/_parser=
.py",
> line 1000, in parse_template
> =C2=A0=C2=A0=C2=A0=C2=A0s =3D Tokenizer(source)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0^^^^^^^^^^^^^^^^^
> =C2=A0=C2=A0File ".../recipe-sysroot-native/usr/lib/python3.11/re/_parser=
.py",
> line 226, in __init__
> =C2=A0=C2=A0=C2=A0=C2=A0string =3D str(string, 'latin1')
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0^^^^^^^^^^^^^^^^^^^^^
> TypeError: decoding to str: need a bytes-like object, NoneType found
>=20
> There are probably other cases too when different kinds of units are=20
> involved (at least as far as I could gather from the systemd manual).
>=20
> We have an internal issue to fix this, but I am going on vacation on=20
> Monday, so I will unfortunately not have any time to look at it until
> after summer.

There is a patch in master recently which may help?

Cheers,

Richard

