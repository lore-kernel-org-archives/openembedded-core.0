Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB78BC52D7D
	for <webhook@archiver.kernel.org>; Fri, 16 Aug 2024 13:18:54 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web10.147812.1723814333763839065
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Aug 2024 06:18:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YFgnAkpp;
 spf=pass (domain: gmail.com, ip: 209.85.216.43, mailfrom: rybczynska@gmail.com)
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-2d3eda6603cso404778a91.3
        for <openembedded-core@lists.openembedded.org>; Fri, 16 Aug 2024 06:18:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723814333; x=1724419133; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=a7R/gyYl8ickHDctUd+LMt9dU7xnjeydlOSvHnf2vQU=;
        b=YFgnAkpp7WPK7ws648Gkr5dPO5U3NfOxxrUGRy63z0KTFW3XN4M58Ex2vs+bA2hkS8
         01n0XvjiCvfI7ii4RWOawwtP4cIJRD0Si6zffewwgDJZFpt7zrr7mc6/IPSPmIWOQ3W7
         /NQljpiDeU8n0SwHDdTh2IueMY0hHXV7z2LIG38ubRETYVs3tOevNg95SBjV3jPamftX
         7c24sOw3l2R9trdToWjbrOMteWY8SU3lOKzXy5tp4QZcntkA/E5tcg89E/ZVv2mbbBX2
         LGrSRzgZn1Oi0LcF9/YRNX5Imu2tATbaUcZlyFeYK87mOlP2s2NpxIyb01/bpiOAA4lt
         SgZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723814333; x=1724419133;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a7R/gyYl8ickHDctUd+LMt9dU7xnjeydlOSvHnf2vQU=;
        b=iEvTWl4zjmt9nSu9n0CPoaJgz0g5WlHtFVKe1IBVNtIEYSlOYKis7lPIcwShkFVDya
         FU04TrQEtzlYdax1aEszm4L010j6RNetu0bSglN+B9hqVfx4WWRhO2piEzgxXjUbwn1L
         NAEb3n25cgZg396zQPh4kAfoAEivLxeut0LbVEgR2fT5YFhGu1NfGK3SIkHtDjV4ZfUA
         sO9f7GZ4paceFhonjs0vGWepWMhBWCQsaDjPXHxWaRIDOez2rvkzUlS43exn8vy7AG1P
         LyI068Q/N36Tv92L97ALS8bESKABDtDnh6dFH4PAgLokzjDjcKe4A6ceq4dRApNU8Feg
         OWmg==
X-Gm-Message-State: AOJu0YxiqbiTSrCp1OUsHwhRzaYBaA1RkqH+GciFFZqLfRQOm7bmqXNa
	0mwoiJU3/xfSk/HOIjZf280J8wJlGpkyvcWS4U8SUsEMkiUqYn1jK0fBP9wSCRl9zWqoO1IgMjm
	xOuHCbzWYZmh0YWciQYfQgp+6SIw=
X-Google-Smtp-Source: AGHT+IFiGRymENFzUZ8rADWVEezPAAZRO6sqDUy0b2hK6ZY/SPaHLgPeodUKoHkPFoUzjQ5y7fEfb9O4qJOutblyQxk=
X-Received: by 2002:a17:90a:b117:b0:2d3:c31f:c822 with SMTP id
 98e67ed59e1d1-2d3dfc7a33dmr3297047a91.21.1723814332845; Fri, 16 Aug 2024
 06:18:52 -0700 (PDT)
MIME-Version: 1.0
References: <20240816122342.974794-1-marta.rybczynska@syslinbit.com> <ca9c814c589839548a08544b8c6d403226852c9a.camel@linuxfoundation.org>
In-Reply-To: <ca9c814c589839548a08544b8c6d403226852c9a.camel@linuxfoundation.org>
From: Marta Rybczynska <rybczynska@gmail.com>
Date: Fri, 16 Aug 2024 15:18:40 +0200
Message-ID: <CAApg2=RJZwMd9ued9UHTGENnwO8uHqPMOz5K7BTv_Je2oa1sMA@mail.gmail.com>
Subject: Re: [PATCH v2][OE-core] cve-check: nvd2 download database variables update
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org, 
	Marta Rybczynska <marta.rybczynska@syslinbit.com>
Content-Type: multipart/alternative; boundary="000000000000f7db68061fcccc46"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Aug 2024 13:18:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203464

--000000000000f7db68061fcccc46
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 16, 2024 at 3:05=E2=80=AFPM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Fri, 2024-08-16 at 14:23 +0200, Marta Rybczynska via
> lists.openembedded.org wrote:
> > Update the recent code adding local/source database files. Add LOCAL an=
d
> > SOURCE part to variable names, as none of them needs to be in DL_DIR.
> > Use old variable names for the source files, so that the change should =
be
> > invisible to users after backporting.
> >
> > At the same time fix a bug: handle a situation when both point to the
> > same place (was: a deadlock).
> >
> > Fixes: 03596904392d257572a905a182b92c780d636744 (cve_check: Use a local
> copy of the database during builds)
> >
> > Signed-off-by: Marta Rybczynska <marta.rybczynska@syslinbit.com>
> > ---
> >  meta/classes/cve-check.bbclass                | 14 ++++++-------
> >  .../meta/cve-update-nvd2-native.bb            | 21 ++++++++++++-------
> >  2 files changed, 21 insertions(+), 14 deletions(-)
>
> I'm not convinced about this I'm afraid. I think do_fetch should put
> data into DL_DIR and share it, "cve-update-nvd2" isn't special in that
> regard. We do want to have our source artefacts stored in one place
> consistently.
>
> If we keep DL_DIR, the naming the makes sense?
>
>
I'm not sure I understand. I haven't changed the fact that it gets stored i=
n
DL_DIR (after download, because you have moved the download itself to the
local dir
- maybe that wasn't your intent).

More about my use-case, that can give context: I tell many of my customers
to override
the variable, download outside of DL_DIR and then move the database file
manually while
disabling the automatic download.

This is the way I have found to have consistent scan results when running
multiple image
builds in different configurations (various hardware platforms) on machines
that do not
share a filesystem.

Regards,
Marta

--000000000000f7db68061fcccc46
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Aug 16, 2024 at 3:05=E2=80=AF=
PM Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org"=
>richard.purdie@linuxfoundation.org</a>&gt; wrote:<br></div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex">On Fri, 2024-08-16 at 14:23 +0200, Marta=
 Rybczynska via <a href=3D"http://lists.openembedded.org" rel=3D"noreferrer=
" target=3D"_blank">lists.openembedded.org</a> wrote:<br>
&gt; Update the recent code adding local/source database files. Add LOCAL a=
nd<br>
&gt; SOURCE part to variable names, as none of them needs to be in DL_DIR.<=
br>
&gt; Use old variable names for the source files, so that the change should=
 be<br>
&gt; invisible to users after backporting.<br>
&gt; <br>
&gt; At the same time fix a bug: handle a situation when both point to the<=
br>
&gt; same place (was: a deadlock).<br>
&gt; <br>
&gt; Fixes: 03596904392d257572a905a182b92c780d636744 (cve_check: Use a loca=
l copy of the database during builds)<br>
&gt; <br>
&gt; Signed-off-by: Marta Rybczynska &lt;<a href=3D"mailto:marta.rybczynska=
@syslinbit.com" target=3D"_blank">marta.rybczynska@syslinbit.com</a>&gt;<br=
>
&gt; ---<br>
&gt; =C2=A0meta/classes/cve-check.bbclass=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 14 ++++++------=
-<br>
&gt; =C2=A0.../meta/<a href=3D"http://cve-update-nvd2-native.bb" rel=3D"nor=
eferrer" target=3D"_blank">cve-update-nvd2-native.bb</a>=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 21 ++++++++++++-------<b=
r>
&gt; =C2=A02 files changed, 21 insertions(+), 14 deletions(-)<br>
<br>
I&#39;m not convinced about this I&#39;m afraid. I think do_fetch should pu=
t<br>
data into DL_DIR and share it, &quot;cve-update-nvd2&quot; isn&#39;t specia=
l in that<br>
regard. We do want to have our source artefacts stored in one place<br>
consistently.<br>
<br>
If we keep DL_DIR, the naming the makes sense?<br>
<br></blockquote><div><br></div><div>I&#39;m not sure I understand. I haven=
&#39;t changed the fact that it gets stored in</div><div>DL_DIR (after down=
load, because you have moved the download itself to the local dir <br></div=
><div>- maybe that wasn&#39;t your intent).<br></div><div><br></div><div>Mo=
re about my use-case, that can give context: I tell many of my customers to=
 override</div><div>the variable, download outside of DL_DIR and then move =
the database file manually while</div><div>disabling the automatic download=
. <br></div><div><br></div><div>This is the way I have found to have consis=
tent scan results when running multiple image</div><div>builds in different=
 configurations (various hardware platforms) on machines that do not</div><=
div>share a filesystem.</div><div><br></div><div>Regards,</div><div>Marta<b=
r></div></div></div>

--000000000000f7db68061fcccc46--

