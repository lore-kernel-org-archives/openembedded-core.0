Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A1D2CE8E90
	for <webhook@archiver.kernel.org>; Thu, 24 Oct 2024 15:57:22 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
 by mx.groups.io with SMTP id smtpd.web10.11.1729785437740659179
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Oct 2024 08:57:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GKJa0hWF;
 spf=pass (domain: gmail.com, ip: 209.85.167.42, mailfrom: jpewhacker@gmail.com)
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-539fbe22ac0so1341603e87.2
        for <openembedded-core@lists.openembedded.org>; Thu, 24 Oct 2024 08:57:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729785436; x=1730390236; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i2a/9FufPHT6CAXaPru8V5o9cYNvOxTvgwNa3iIHujA=;
        b=GKJa0hWFCt3yyIZSbUo6wgUNaZsLE3UqVqAx8vzwmvQDv7GUyYdTji4PtqxlNkvhmw
         usATRoepfvIRpDBtYeK98d7fkzv+ya8BC/b0RBfsX42b4g6TE/4f9C96g4L+aRrs/Lnm
         dxCY6u6h6eLFJitdxP/0Sdg0vNrYVCVgATAvxDo3qgVBVpNFJKYOFqzgQoAXeQmSUSFG
         S/EyIoJly0XApax7fiT1mcaZ9Rrif7ylXK5KhAb/RWwxoUXUo/1ZzZmM0F+hrP0kzNgo
         bwKoYH1pJ7pdQPQA82kafYTi6MTrsp1BHIr+puvqh5JfcidPUb+fa7oXBwfrtxOB95RI
         uNYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729785436; x=1730390236;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i2a/9FufPHT6CAXaPru8V5o9cYNvOxTvgwNa3iIHujA=;
        b=DE0cdxDwXzdyHRf250BCe7jJVrvRqHQTj+9cm5EZmtfB6B11Z7s15qdH9OEYlQbDsL
         HiRCf4yWe859cszpaXSPv1N0MFKokZZYSmjhRneBRcIuzQSsl35ykM+0Rz6tK5dgYbIw
         pw6i3HQ7YmOoDZ+TUUZYLvvZIjnnJAntULlMKZ8pDp6APCkDd6GwKTOPmZ02KsLL9x2r
         pzeFSgfhReNNajrGjN8rKYAt3DuUGUVQ6FeFVlRvtLtw/BPTYFoqBpxy88wPVqB9aj1V
         yuZ9YfymHjOiTCGmOUTyEnBapl3fKi/o8WwTJHNtwXvFFPTH3OYpU2kBYeNuXD2f2Pdv
         Ws2A==
X-Gm-Message-State: AOJu0Yw/Zn0SYW7URRYk6U/bcNKepz1mOL6R1vdwwvf/k3PnBoarwLnC
	v5GI5YuRMyWsioxq0XngLNLl5SVRjQ4KTxXnY5chpqP8/9DrDWaclY7Hoio0DBXFCyFEX+6malN
	YQXq0LQUpceVx0JSfwxn6r7NwNUY=
X-Google-Smtp-Source: AGHT+IFPOtl+uR3nqcdOg/WMXlLjM7voDIUKKMpBnnGMllZw6TqQ3oq04ui09/Hil8oxshIBUEIqeOK+hlJmMtrIePQ=
X-Received: by 2002:a05:6512:3d86:b0:539:f93d:eb3d with SMTP id
 2adb3069b0e04-53b23e8eb10mr1847767e87.46.1729785435512; Thu, 24 Oct 2024
 08:57:15 -0700 (PDT)
MIME-Version: 1.0
References: <20241018220818.4042304-1-JPEWhacker@gmail.com>
 <20241023212013.995247-1-JPEWhacker@gmail.com> <20241023212013.995247-4-JPEWhacker@gmail.com>
 <DB5PR02MB10213AD0C60A058071E19B031EF4E2@DB5PR02MB10213.eurprd02.prod.outlook.com>
In-Reply-To: <DB5PR02MB10213AD0C60A058071E19B031EF4E2@DB5PR02MB10213.eurprd02.prod.outlook.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Thu, 24 Oct 2024 09:57:02 -0600
Message-ID: <CAJdd5GYMkqCbJvzvr=XkT9mmF2VjmTB+NBd3YX4-zJUThz5e=g@mail.gmail.com>
Subject: Re: [OE-core][PATCH v2 3/4] lib: package: Check incompatible licenses
 at packaging time
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Oct 2024 15:57:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206300

On Thu, Oct 24, 2024 at 4:03=E2=80=AFAM Peter Kjellerstedt
<peter.kjellerstedt@axis.com> wrote:
>
> > -----Original Message-----
> > From: openembedded-core@lists.openembedded.org <openembedded-core@lists=
.openembedded.org> On Behalf Of Joshua Watt
> > Sent: den 23 oktober 2024 23:15
> > To: openembedded-core@lists.openembedded.org
> > Cc: Joshua Watt <JPEWhacker@gmail.com>
> > Subject: [OE-core][PATCH v2 3/4] lib: package: Check incompatible licen=
ses at packaging time
> >
> > Instead of checking for incompatible licenses in the anonymous python
> > and setting '_exclude_incompatible-', (re)check all the packages in
> > populate_packages(). This ensures that all packages are processed, even
> > dynamically generated ones.
> >
> > The use of the '_exclude-incompatible-' variable set in base.bbclass ha=
s
> > been the mechanism used for per-packages licenses since its it was adde=
d
> > as a feature (although with different names for the variable throughout
> > history). However, since this misses dynamic packages, calling
> > oe.license.skip_incompatible_package_licenses() a second time on the
> > actual final package set is a better solution.
> >
> > Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> > ---
> >  meta/classes-global/base.bbclass | 1 -
> >  meta/lib/oe/package.py           | 6 +++---
> >  2 files changed, 3 insertions(+), 4 deletions(-)
> >
> > diff --git a/meta/classes-global/base.bbclass b/meta/classes-global/bas=
e.bbclass
> > index 5b8663f454d..b81e61fdb72 100644
> > --- a/meta/classes-global/base.bbclass
> > +++ b/meta/classes-global/base.bbclass
> > @@ -581,7 +581,6 @@ python () {
> >              if unskipped_pkgs:
> >                  for pkg in skipped_pkgs:
> >                      bb.debug(1, "Skipping the package %s at do_rootfs =
because of incompatible license(s): %s" % (pkg, ' '.join(skipped_pkgs[pkg])=
))
> > -                    d.setVar('_exclude_incompatible-' + pkg, ' '.join(=
skipped_pkgs[pkg]))
> >                  for pkg in unskipped_pkgs:
> >                      bb.debug(1, "Including the package %s" % pkg)
> >              else:
> > diff --git a/meta/lib/oe/package.py b/meta/lib/oe/package.py
> > index c213a9a3ca6..480408e41e3 100644
> > --- a/meta/lib/oe/package.py
> > +++ b/meta/lib/oe/package.py
> > @@ -1447,10 +1447,10 @@ def populate_packages(d):
> >
> >      # Handle excluding packages with incompatible licenses
> >      package_list =3D []
> > +    skipped_pkgs =3D oe.license.skip_incompatible_package_licenses(d, =
pkgs):
>
> Umm, how well did you test this? ;)
> The Python interpreter is not too happy about the trailing colon on the l=
ine above...

Yep, because I found that, fixed it, and forgot to squash the fix in
before I submitted

I'll send a V3

>
> >      for pkg in packages:
> > -        licenses =3D d.getVar('_exclude_incompatible-' + pkg)
> > -        if licenses:
> > -            msg =3D "Excluding %s from packaging as it has incompatibl=
e license(s): %s" % (pkg, licenses)
> > +        if pkg in skipped_pkgs:
> > +            msg =3D "Excluding %s from packaging as it has incompatibl=
e license(s): %s" % (pkg, skipped_pkgs[pkg])
> >              oe.qa.handle_error("incompatible-license", msg, d)
> >          else:
> >              package_list.append(pkg)
> > --
> > 2.46.2
>
> //Peter
>

