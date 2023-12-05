Return-Path: <jstephan@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0334C4167B
	for <webhook@archiver.kernel.org>; Tue,  5 Dec 2023 16:27:41 +0000 (UTC)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
 by mx.groups.io with SMTP id smtpd.web10.105404.1701793656575910282
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Dec 2023 08:27:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=jvyAJRAh;
 spf=pass (domain: baylibre.com, ip: 209.85.208.179, mailfrom: jstephan@baylibre.com)
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2c9f559b82cso36435721fa.0
        for <openembedded-core@lists.openembedded.org>; Tue, 05 Dec 2023 08:27:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1701793654; x=1702398454; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NL/SDtu84sBrLnSL9FIC7M1EzkWzsFjPIFT36B8JhF0=;
        b=jvyAJRAhDWOiHq/HBQA3wGvPtPNYNb3QqDqfOqgZNGM6GwD+MevtAjJuNXtS4EHRcq
         DU+xn08E0FaHIy96X/VDjm3fBsCaouBSftaNZKww2KtdJOg7VeeCQMAO/VkzLpged6gI
         5UbUSXVjbFi2jblhCvIu28UsRBr4s/HxBsjfvoLTXLs4MxsAxJzolKrL2WM8gr7EzZ9d
         nYCO1YNz/yT1ovNlORoSXVH3PUlXSrr+VnuHqR25je9qTb0dcnTgpV3P7C1+7fBImzge
         rUlsU10pQBfTVlQqj6eFnVUfLx+ArSWf9kKNpATuwTZseOS11R85lPoj0dnJOQEANfNa
         1OUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701793654; x=1702398454;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NL/SDtu84sBrLnSL9FIC7M1EzkWzsFjPIFT36B8JhF0=;
        b=aG1CykeWih2Hv07R8gW+GzuvF8zdFaq8iM2Adsa2+uPxYsH5EgVWMdhJhXW4ccMxZQ
         4zZveBMRkAvSfScwH8e6QS5kvqNkQ3QIwHLq2vVnKhiCmNQYmmQtp3yyVhCr3u6YLs4h
         c9BTd6D5RNdoKc7x8oP06tXWx1qGXpBwFvEpy9lFOCDfaklAWmc5Erw++6aiB0dQwEe+
         qsNzJiEUVBfORXgvcIRtskXzipRZuPSTBYUpXKCnpqNxdV+y8+pMAeMW3T1NTbqz1ElA
         D8iw44TE2wKGTjx4MWQ9Buz+2Ux9rE7acEH5GZ+BkPfXc27ah/7Jb1kUJ48icQnahF2/
         uZYA==
X-Gm-Message-State: AOJu0YwYYNa766M4vmzPxykYaXtqyrOU5FHXzhDG+GpTX9FzR8U+RZbg
	i4QLzRZEBDiYjZP8ldKdWvrxkQh+uyEGb1yF5WJA3Q==
X-Google-Smtp-Source: AGHT+IF/QYp+qh9uDaBVH69sub9Fi8PX/yMLa8Rs+sVc90FuWS9KQdxR6RxleP3E9yDBS20plGYqIB4DE3wKxYNnffY=
X-Received: by 2002:a2e:86cd:0:b0:2c9:f975:8c59 with SMTP id
 n13-20020a2e86cd000000b002c9f9758c59mr1977379ljj.87.1701793654075; Tue, 05
 Dec 2023 08:27:34 -0800 (PST)
MIME-Version: 1.0
References: <20231204155934.836992-1-jstephan@baylibre.com>
 <20231204155934.836992-2-jstephan@baylibre.com> <202312050750270cac2691@mail.local>
 <CAEHHSvb2aKwWmS50G4QZ57oaBJmdkHME01ju4Wa-Nuo+Unnz0A@mail.gmail.com> <20231205154519437ea7da@mail.local>
In-Reply-To: <20231205154519437ea7da@mail.local>
From: Julien Stephan <jstephan@baylibre.com>
Date: Tue, 5 Dec 2023 17:27:17 +0100
Message-ID: <CAEHHSvbG2uSmWMJ8XXe4DgMPBFEHur2LFLWbGbNozP1H3p3-Hg@mail.gmail.com>
Subject: Re: [OE-core] [RESEND][PATCH 1/7] bitbake: utils: remove spaces on
 empty lines
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Dec 2023 16:27:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191847

Le mar. 5 d=C3=A9c. 2023 =C3=A0 16:45, Alexandre Belloni
<alexandre.belloni@bootlin.com> a =C3=A9crit :
>
> On 05/12/2023 15:57:58+0100, Julien Stephan wrote:
> > Le mar. 5 d=C3=A9c. 2023 =C3=A0 08:50, Alexandre Belloni
> > <alexandre.belloni@bootlin.com> a =C3=A9crit :
> > >
> > > Please do not send bitbake patches in the same series as oe-core patc=
hes
> > > if there is no dependency. Those patches are applied on different
> > > repositories.
> >
> > Hi Alexandre,
> >
> > Noted! Do you want me to resend the series without the bitbake patch?
>
> No but  didn't take the bitbake patch because it doesn't do what the
> commit message says. (i.e. it touches non empty lines)
>

oups, I will update the commit message and send it to the appropriate list.

> >
> > Cheers
> > Julien
> > >
> > > On 04/12/2023 16:59:28+0100, Julien Stephan wrote:
> > > > Signed-off-by: Julien Stephan <jstephan@baylibre.com>
> > > > ---
> > > >  bitbake/lib/bb/utils.py | 16 ++++++++--------
> > > >  1 file changed, 8 insertions(+), 8 deletions(-)
> > > >
> > > > diff --git a/bitbake/lib/bb/utils.py b/bitbake/lib/bb/utils.py
> > > > index b401fa5ec7a..61ffad92ce3 100644
> > > > --- a/bitbake/lib/bb/utils.py
> > > > +++ b/bitbake/lib/bb/utils.py
> > > > @@ -50,7 +50,7 @@ def clean_context():
> > > >
> > > >  def get_context():
> > > >      return _context
> > > > -
> > > > +
> > > >
> > > >  def set_context(ctx):
> > > >      _context =3D ctx
> > > > @@ -212,8 +212,8 @@ def explode_dep_versions2(s, *, sort=3DTrue):
> > > >              inversion =3D True
> > > >              # This list is based on behavior and supported compari=
sons from deb, opkg and rpm.
> > > >              #
> > > > -            # Even though =3D<, <<, =3D=3D, !=3D, =3D>, and >> may=
 not be supported,
> > > > -            # we list each possibly valid item.
> > > > +            # Even though =3D<, <<, =3D=3D, !=3D, =3D>, and >> may=
 not be supported,
> > > > +            # we list each possibly valid item.
> > > >              # The build system is responsible for validation of wh=
at it supports.
> > > >              if i.startswith(('<=3D', '=3D<', '<<', '=3D=3D', '!=3D=
', '>=3D', '=3D>', '>>')):
> > > >                  lastcmp =3D i[0:2]
> > > > @@ -347,7 +347,7 @@ def _print_exception(t, value, tb, realfile, te=
xt, context):
> > > >          exception =3D traceback.format_exception_only(t, value)
> > > >          error.append('Error executing a python function in %s:\n' =
% realfile)
> > > >
> > > > -        # Strip 'us' from the stack (better_exec call) unless that=
 was where the
> > > > +        # Strip 'us' from the stack (better_exec call) unless that=
 was where the
> > > >          # error came from
> > > >          if tb.tb_next is not None:
> > > >              tb =3D tb.tb_next
> > > > @@ -746,9 +746,9 @@ def prunedir(topdir, ionice=3DFalse):
> > > >  # but thats possibly insane and suffixes is probably going to be s=
mall
> > > >  #
> > > >  def prune_suffix(var, suffixes, d):
> > > > -    """
> > > > +    """
> > > >      See if var ends with any of the suffixes listed and
> > > > -    remove it if found
> > > > +    remove it if found
> > > >      """
> > > >      for suffix in suffixes:
> > > >          if suffix and var.endswith(suffix):
> > > > @@ -1001,9 +1001,9 @@ def umask(new_mask):
> > > >          os.umask(current_mask)
> > > >
> > > >  def to_boolean(string, default=3DNone):
> > > > -    """
> > > > +    """
> > > >      Check input string and return boolean value True/False/None
> > > > -    depending upon the checks
> > > > +    depending upon the checks
> > > >      """
> > > >      if not string:
> > > >          return default
> > > > --
> > > > 2.42.0
> > > >
> > >
> > > >
> > > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > > > Links: You receive all messages sent to this group.
> > > > View/Reply Online (#191754): https://lists.openembedded.org/g/opene=
mbedded-core/message/191754
> > > > Mute This Topic: https://lists.openembedded.org/mt/102972946/361717=
9
> > > > Group Owner: openembedded-core+owner@lists.openembedded.org
> > > > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/uns=
ub [alexandre.belloni@bootlin.com]
> > > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > > >
> > >
> > >
> > > --
> > > Alexandre Belloni, co-owner and COO, Bootlin
> > > Embedded Linux and Kernel engineering
> > > https://bootlin.com
>
> --
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

