Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40DC8EB64D9
	for <webhook@archiver.kernel.org>; Thu, 15 Jun 2023 21:31:44 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
 by mx.groups.io with SMTP id smtpd.web11.30468.1686864701087115639
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Jun 2023 14:31:41 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=uZ1ePU7D;
 spf=softfail (domain: sakoman.com, ip: 209.85.208.50, mailfrom: steve@sakoman.com)
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-519608ddbf7so2888999a12.2
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Jun 2023 14:31:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1686864699; x=1689456699;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QLMS5FrnNsK1n1gxwXJ/BB52hJCcfNFRl2Qb4XZ8g/U=;
        b=uZ1ePU7DOIDCh7jru6CPMAsjN1jUmctrGYq0KXa6SggN/RjYRj6e6eXq6wgeQma5C7
         dL6PSgobQZdMen7y/EbPjzSa9LM7ZQHUM5XbETm/0Iyj4XRcYLSkK5zQkxaZll3NBeeh
         eur81t1jpI9L9NEIJwwp6I6aeN9EgxaPYuqECkeQt8fsUnGdZ1oWSYOHh9U0aUyetFfh
         hsM8Ds29lBuR3o5Q735PgKOw9Fy68G118MXnM6MlrViILP3QYV8/MSUAAkQqMgG2UKo4
         bVErxzKMT4+5o1iuzHO7qFZjyLBYhbDofYAHMnUSBE8pYpxGO6movj4f+l0rjuMKV8V3
         B8XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686864699; x=1689456699;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QLMS5FrnNsK1n1gxwXJ/BB52hJCcfNFRl2Qb4XZ8g/U=;
        b=EWX0SJBWY+obfUAC2L2KeH2eRIBEUuksNpghTZHCxR/JYY52gBWpg1dEnxeA1Wim0u
         M/b0XiCGIFMBKx61jdgA7O0CTNblIlzKJ28M7ZKYSLV2IfYZ/LT6mPpvO9em3lyq/ABT
         TQnd1jl9WfnQjyCjuzjJxTkkybVLjKffsieM9atQoXebzH8wGezCvMElPwfk7t+AQM7p
         oXsKR6E6eyl4GgbeINgHobKwxrr/AF+d5RJjyBewgej9478e39sCkYH0SvNM+PIbUI52
         NlsxVugYyeYudZoj7VHQiK0d47krhpKZnJZy8CCMBbaDFbVyzP4vg+raUauz3pGamuwU
         dE9w==
X-Gm-Message-State: AC+VfDzK1Bm6PJ20BWrQJjiiyVAbJeB39wDtqcIe6ek+Y+A5jhgfYg4G
	cu1YGyE0494s9Kxs4nQV9e6TzW/HI/Shza7czauKxw==
X-Google-Smtp-Source: ACHHUZ6PN8NNk3H9Hl0WYzJ/xrncvwBPFE8lqTwNrB5AilO/GX546xslsfzpp8C14afsbQEfov1Z83f89z9KD9J62I0=
X-Received: by 2002:aa7:c602:0:b0:514:7a67:44dc with SMTP id
 h2-20020aa7c602000000b005147a6744dcmr61284edq.19.1686864699106; Thu, 15 Jun
 2023 14:31:39 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1686751371.git.steve@sakoman.com> <f5ebbb87943bc583049909f4216ca1d73a794261.1686751371.git.steve@sakoman.com>
 <DB5PR02MB102132E7293ED031B16A6C02BEF5BA@DB5PR02MB10213.eurprd02.prod.outlook.com>
In-Reply-To: <DB5PR02MB102132E7293ED031B16A6C02BEF5BA@DB5PR02MB10213.eurprd02.prod.outlook.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Thu, 15 Jun 2023 11:31:28 -1000
Message-ID: <CAOSpxdZVtk+5ujjsahR+EAHEybCYtUOJWLdgd7EepfR3KaqPOQ@mail.gmail.com>
Subject: Re: [OE-core][dunfell 3/5] systemd-systemctl: fix instance template
 WantedBy symlink construction
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: Martin Siegumfeldt <mns@gomspace.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Jun 2023 21:31:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182886

On Thu, Jun 15, 2023 at 10:41=E2=80=AFAM Peter Kjellerstedt
<peter.kjellerstedt@axis.com> wrote:
>
> > -----Original Message-----
> > From: openembedded-core@lists.openembedded.org <openembedded-
> > core@lists.openembedded.org> On Behalf Of Steve Sakoman
> > Sent: den 14 juni 2023 16:05
> > To: openembedded-core@lists.openembedded.org
> > Subject: [OE-core][dunfell 3/5] systemd-systemctl: fix instance templat=
e
> > WantedBy symlink construction
> >
> > From: Martin Siegumfeldt <mns@gomspace.com>
> >
> > Fix issue of the below instance template systemd service dependency
> >
> > [Install]
> > WantedBy=3Dsvc-wants@%i.service
> >
> > creating the symlink (instance "a" example)
> >
> > /etc/systemd/system/svc-wants@%i.service.wants/svc-wanted-by@a.service
> >
> > which should be
> >
> > /etc/systemd/system/svc-wants@a.service.wants/svc-wanted-by@a.service
> >
> > as implemented by this change.
> >
> > The functionality appears regressed just after "thud" baseline when the
> > logic was refactored from shell script into python (commit
> > 925e30cb104ece7bfa48b78144e758a46dc9ec3f)
> >
> > (From OE-Core rev: 308397f0bb3d6f3d4e9ec2c6a10823184049c9b5)
> >
> > Signed-off-by: Martin Siegumfeldt <mns@gomspace.com>
> > Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > Signed-off-by: Steve Sakoman <steve@sakoman.com>
> > (cherry picked from commit 372b29c8ad270d4d430c26a4e614976c7029afaf)
> > Signed-off-by: Steve Sakoman <steve@sakoman.com>
> > ---
> >  .../systemd/systemd-systemctl/systemctl             | 13 ++++++++++---
> >  1 file changed, 10 insertions(+), 3 deletions(-)
> >
> > diff --git a/meta/recipes-core/systemd/systemd-systemctl/systemctl
> > b/meta/recipes-core/systemd/systemd-systemctl/systemctl
> > index 6aa2e20465..577c373181 100755
> > --- a/meta/recipes-core/systemd/systemd-systemctl/systemctl
> > +++ b/meta/recipes-core/systemd/systemd-systemctl/systemctl
> > @@ -182,12 +182,19 @@ class SystemdUnit():
> >
> >          raise SystemdUnitNotFoundError(self.root, unit)
> >
> > -    def _process_deps(self, config, service, location, prop, dirstem):
> > +    def _process_deps(self, config, service, location, prop, dirstem, =
instance):
> >          systemdir =3D self.root / SYSCONFDIR / "systemd" / "system"
> >
> >          target =3D ROOT / location.relative_to(self.root)
> >          try:
> >              for dependent in config.get('Install', prop):
> > +                # determine whether or not dependent is a template wit=
h an actual
> > +                # instance (i.e. a '@%i')
> > +                dependent_is_template =3D re.match(r"[^@]+@(?P<instanc=
e>[^\.]*)\.", dependent)
> > +                if dependent_is_template:
> > +                    # if so, replace with the actual instance to achie=
ve
> > +                    # svc-wants@a.service.wants/svc-wanted-by@a.servic=
e
> > +                    dependent =3D re.sub(dependent_is_template.group('=
instance'), instance, dependent, 1)
> >                  wants =3D systemdir / "{}.{}".format(dependent, dirste=
m) / service
> >                  add_link(wants, target)
> >
> > @@ -227,8 +234,8 @@ class SystemdUnit():
> >          else:
> >              service =3D self.unit
> >
> > -        self._process_deps(config, service, path, 'WantedBy', 'wants')
> > -        self._process_deps(config, service, path, 'RequiredBy', 'requi=
res')
> > +        self._process_deps(config, service, path, 'WantedBy', 'wants',=
 instance)
> > +        self._process_deps(config, service, path, 'RequiredBy', 'requi=
res', instance)
> >
> >          try:
> >              for also in config.get('Install', 'Also'):
> > --
> > 2.34.1
>
> You might want to be careful with this one. It broke systemctl for us whe=
n it
> hit Mickledore and we have had to backport the version from Langdale for =
now.

Thanks for reviewing.  I'll drop this from dunfell for now and will
look for the potential fix in master for mickledore.

Steve

> The problem is that it does not handle non-instanced units depending on
> an instanced unit. In our case we have a unit foo.service that contains
> a RequiredBy=3Dbar@0.service, which causes an error like this:
>
> Traceback (most recent call last):
>   File ".../recipe-sysroot-native/usr/bin/systemctl", line 366, in <modul=
e>
>     main()
>   File ".../recipe-sysroot-native/usr/bin/systemctl", line 352, in main
>     SystemdUnit(root, service).enable()
>   File ".../recipe-sysroot-native/usr/bin/systemctl", line 250, in enable
>     self._process_deps(config, service, path, 'WantedBy', 'wants', instan=
ce)
>   File ".../recipe-sysroot-native/usr/bin/systemctl", line 210, in _proce=
ss_deps
>     dependent =3D re.sub(dependent_is_template.group('instance'), instanc=
e, dependent, 1)
>                 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^=
^^^^^^^^^^^^^^
>   File ".../recipe-sysroot-native/usr/lib/python3.11/re/__init__.py", lin=
e 185, in sub
>     return _compile(pattern, flags).sub(repl, string, count)
>            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>   File ".../recipe-sysroot-native/usr/lib/python3.11/re/__init__.py", lin=
e 317, in _subx
>     template =3D _compile_repl(template, pattern)
>                ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>   File ".../recipe-sysroot-native/usr/lib/python3.11/re/__init__.py", lin=
e 308, in _compile_repl
>     return _parser.parse_template(repl, pattern)
>            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>   File ".../recipe-sysroot-native/usr/lib/python3.11/re/_parser.py", line=
 1000, in parse_template
>     s =3D Tokenizer(source)
>         ^^^^^^^^^^^^^^^^^
>   File ".../recipe-sysroot-native/usr/lib/python3.11/re/_parser.py", line=
 226, in __init__
>     string =3D str(string, 'latin1')
>              ^^^^^^^^^^^^^^^^^^^^^
> TypeError: decoding to str: need a bytes-like object, NoneType found
>
> There are probably other cases too when different kinds of units are
> involved (at least as far as I could gather from the systemd manual).
>
> We have an internal issue to fix this, but I am going on vacation on
> Monday, so I will unfortunately not have any time to look at it until
> after summer.
>
> //Peter

