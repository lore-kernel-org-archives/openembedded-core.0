Return-Path: <jstephan@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59615C4167B
	for <webhook@archiver.kernel.org>; Wed,  6 Dec 2023 08:24:36 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web10.27059.1701851073551036141
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Dec 2023 00:24:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=BTs6bIAy;
 spf=pass (domain: baylibre.com, ip: 209.85.218.52, mailfrom: jstephan@baylibre.com)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a1ca24776c3so106943866b.0
        for <openembedded-core@lists.openembedded.org>; Wed, 06 Dec 2023 00:24:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1701851071; x=1702455871; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gEIVFnUQjZDZNDa6hW/22QjPvBGjt8NKIMKm0kUuPe0=;
        b=BTs6bIAySFktaYHcOz4QxXvIDUjDQqzkRpMULf48X3b6Xfnysg7Z/R372hOc+T7F1p
         foUbaR+Un4eaSK0mhxickZWr2OY2Lmuoo3WJ8iiwl48VqlNC+EXbIWUf9vB+tmL+atIf
         Jt+n68F8wHKSFmlXVkte1jafj+qcPJSZw4c+WbjmsUXJeouuQOdiBmNhSTTv1ztoafzo
         UnzP3Mpl0SU4jNKdWxh8czy2ySWh6mMdvPUBYn2FJpDAKj6M9vEzZoWFiXA4LJYxEahN
         xmC3jHt9Lb6uD9czcv8Fxnh255QEbwZVAGfjXMAhtApfP5KVZj9ruK8F4osmu/k+Ti+X
         p0Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701851071; x=1702455871;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gEIVFnUQjZDZNDa6hW/22QjPvBGjt8NKIMKm0kUuPe0=;
        b=SWkiZO+KTNczd1BBzcLhMMjbvkNtP8Sfp830TRFXNTMaxRPZJKGv2UPrHSX35q0Z6C
         VKpJWNGSDwWVF5SiNjUkgAccKmWUn9BVfTUsuOMI58Blnsf6XkH2I+jS2cFalyyCJy30
         3ilDNNltA5Kc3pNXEDrLlSGS9mpjbgC4ORrUOdLJoum8TMCypPo6MKETxitp+OG3NeyM
         uDQD/4sGJyaHBf4Hcby8kR8e4hNRD56dabYnmFma68x7ykce0nKPH0CRAhPd+DgL30KC
         ydDKo9yu1cH6KQGTdXcTKP6AH7MNDg8U6iSoss058gIMJuI2BhG1kr0kjMO+am6KU/H7
         vM7w==
X-Gm-Message-State: AOJu0YxTew/vDoo9rcd64AbQm5EYQBNuNP6bh6zCb5eZPo9/MyypsrjW
	3xEgXSuF3BFQAwkT/lnHBl+PLzmqfPj+sxqAq2P/mA==
X-Google-Smtp-Source: AGHT+IHvYAcCwdkB/vZ7Lcgoj9KpLEAIETn+MSIcfLfWg1W1Sc6rCEKYEg5oaRFnV+wYM8v2QqHsh4eB4dFnh1OCNMk=
X-Received: by 2002:a17:906:4910:b0:a1d:3511:6674 with SMTP id
 b16-20020a170906491000b00a1d35116674mr1593767ejq.13.1701851071510; Wed, 06
 Dec 2023 00:24:31 -0800 (PST)
MIME-Version: 1.0
References: <20231204155934.836992-1-jstephan@baylibre.com>
 <20231204155934.836992-2-jstephan@baylibre.com> <202312050750270cac2691@mail.local>
 <CAEHHSvb2aKwWmS50G4QZ57oaBJmdkHME01ju4Wa-Nuo+Unnz0A@mail.gmail.com>
 <20231205154519437ea7da@mail.local> <179DFC50B5886FE5.18076@lists.openembedded.org>
In-Reply-To: <179DFC50B5886FE5.18076@lists.openembedded.org>
From: Julien Stephan <jstephan@baylibre.com>
Date: Wed, 6 Dec 2023 09:24:15 +0100
Message-ID: <CAEHHSvZ0o+2xxR7xNzohAmSx3mXBekAgV6AE7G8cAkorH-3e1A@mail.gmail.com>
Subject: Re: [OE-core] [RESEND][PATCH 1/7] bitbake: utils: remove spaces on
 empty lines
To: jstephan@baylibre.com
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Dec 2023 08:24:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191871

Le mar. 5 d=C3=A9c. 2023 =C3=A0 17:27, Julien Stephan via lists.openembedde=
d.org
<jstephan=3Dbaylibre.com@lists.openembedded.org> a =C3=A9crit :
>
> Le mar. 5 d=C3=A9c. 2023 =C3=A0 16:45, Alexandre Belloni
> <alexandre.belloni@bootlin.com> a =C3=A9crit :
> >
> > On 05/12/2023 15:57:58+0100, Julien Stephan wrote:
> > > Le mar. 5 d=C3=A9c. 2023 =C3=A0 08:50, Alexandre Belloni
> > > <alexandre.belloni@bootlin.com> a =C3=A9crit :
> > > >
> > > > Please do not send bitbake patches in the same series as oe-core pa=
tches
> > > > if there is no dependency. Those patches are applied on different
> > > > repositories.
> > >
> > > Hi Alexandre,
> > >
> > > Noted! Do you want me to resend the series without the bitbake patch?
> >
> > No but  didn't take the bitbake patch because it doesn't do what the
> > commit message says. (i.e. it touches non empty lines)
> >
>
> oups, I will update the commit message and send it to the appropriate lis=
t.
>

It has already been merged with the incorrect commit message :( sorry for t=
hat

Cheers
Julien
> > >
> > > Cheers
> > > Julien
> > > >
> > > > On 04/12/2023 16:59:28+0100, Julien Stephan wrote:
> > > > > Signed-off-by: Julien Stephan <jstephan@baylibre.com>
> > > > > ---
> > > > >  bitbake/lib/bb/utils.py | 16 ++++++++--------
> > > > >  1 file changed, 8 insertions(+), 8 deletions(-)
> > > > >
> > > > > diff --git a/bitbake/lib/bb/utils.py b/bitbake/lib/bb/utils.py
> > > > > index b401fa5ec7a..61ffad92ce3 100644
> > > > > --- a/bitbake/lib/bb/utils.py
> > > > > +++ b/bitbake/lib/bb/utils.py
> > > > > @@ -50,7 +50,7 @@ def clean_context():
> > > > >
> > > > >  def get_context():
> > > > >      return _context
> > > > > -
> > > > > +
> > > > >
> > > > >  def set_context(ctx):
> > > > >      _context =3D ctx
> > > > > @@ -212,8 +212,8 @@ def explode_dep_versions2(s, *, sort=3DTrue):
> > > > >              inversion =3D True
> > > > >              # This list is based on behavior and supported compa=
risons from deb, opkg and rpm.
> > > > >              #
> > > > > -            # Even though =3D<, <<, =3D=3D, !=3D, =3D>, and >> m=
ay not be supported,
> > > > > -            # we list each possibly valid item.
> > > > > +            # Even though =3D<, <<, =3D=3D, !=3D, =3D>, and >> m=
ay not be supported,
> > > > > +            # we list each possibly valid item.
> > > > >              # The build system is responsible for validation of =
what it supports.
> > > > >              if i.startswith(('<=3D', '=3D<', '<<', '=3D=3D', '!=
=3D', '>=3D', '=3D>', '>>')):
> > > > >                  lastcmp =3D i[0:2]
> > > > > @@ -347,7 +347,7 @@ def _print_exception(t, value, tb, realfile, =
text, context):
> > > > >          exception =3D traceback.format_exception_only(t, value)
> > > > >          error.append('Error executing a python function in %s:\n=
' % realfile)
> > > > >
> > > > > -        # Strip 'us' from the stack (better_exec call) unless th=
at was where the
> > > > > +        # Strip 'us' from the stack (better_exec call) unless th=
at was where the
> > > > >          # error came from
> > > > >          if tb.tb_next is not None:
> > > > >              tb =3D tb.tb_next
> > > > > @@ -746,9 +746,9 @@ def prunedir(topdir, ionice=3DFalse):
> > > > >  # but thats possibly insane and suffixes is probably going to be=
 small
> > > > >  #
> > > > >  def prune_suffix(var, suffixes, d):
> > > > > -    """
> > > > > +    """
> > > > >      See if var ends with any of the suffixes listed and
> > > > > -    remove it if found
> > > > > +    remove it if found
> > > > >      """
> > > > >      for suffix in suffixes:
> > > > >          if suffix and var.endswith(suffix):
> > > > > @@ -1001,9 +1001,9 @@ def umask(new_mask):
> > > > >          os.umask(current_mask)
> > > > >
> > > > >  def to_boolean(string, default=3DNone):
> > > > > -    """
> > > > > +    """
> > > > >      Check input string and return boolean value True/False/None
> > > > > -    depending upon the checks
> > > > > +    depending upon the checks
> > > > >      """
> > > > >      if not string:
> > > > >          return default
> > > > > --
> > > > > 2.42.0
> > > > >
> > > >
> > > > >
> > > > >
> > > > >
> > > >
> > > >
> > > > --
> > > > Alexandre Belloni, co-owner and COO, Bootlin
> > > > Embedded Linux and Kernel engineering
> > > > https://bootlin.com
> >
> > --
> > Alexandre Belloni, co-owner and COO, Bootlin
> > Embedded Linux and Kernel engineering
> > https://bootlin.com
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#191847): https://lists.openembedded.org/g/openembedde=
d-core/message/191847
> Mute This Topic: https://lists.openembedded.org/mt/102972946/4356723
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [js=
tephan@baylibre.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

