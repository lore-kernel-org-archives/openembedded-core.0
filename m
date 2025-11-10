Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93297CCF9E3
	for <webhook@archiver.kernel.org>; Mon, 10 Nov 2025 14:59:54 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.49914.1762786788896421874
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Nov 2025 06:59:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lERf8f+Y;
 spf=pass (domain: gmail.com, ip: 209.85.214.179, mailfrom: rybczynska@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2957850c63bso31172665ad.0
        for <openembedded-core@lists.openembedded.org>; Mon, 10 Nov 2025 06:59:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762786788; x=1763391588; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=AiybPQ/A/Lm3Ti86D6dtLxwXgxbeffNF2mtqmxpMzLM=;
        b=lERf8f+YGPc5dP4nNm/7rYAzqKHiJfnYHjmXAprrEN8fe09mOHXWEx/0wp7DXNa2uX
         kV+fm5k0GY7AnaCtkMHbvYlSnuH7GOYJwjVr2DAJM77u9RULpH/bu+DW/+G8+6RkShgX
         L+3SRE2FjDX4SHJLy9GafgvIdaS9QqLzioijiFwCP6ZehSCuC3dXk38gVyTATDKLq/6/
         7wrzrOXDXgRgBTdbvpuICQcxn+J6w5D3EAQOFH7Kn9AZ+YM5lU3AMJakdEZD7j7nsgTd
         3XSDYOr2EB1YQcVx+ZP2l0Dp9vEGOmATUsWbWCsFHLSFTSWKSMb6stascVnk03UWw1oa
         fqIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762786788; x=1763391588;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AiybPQ/A/Lm3Ti86D6dtLxwXgxbeffNF2mtqmxpMzLM=;
        b=v0gO4n80zp6iBsHDatnYjf3RNcP5eft6cmJ8CvHLagDtnFY5VydqUIzf4dMLvvzSak
         XVz1bNkixoBuqC60ZJQ39WrDSWQjd7xhO2aTlPYO61g1Ud6CtpTW2ScNyBjAkUvB7TxY
         IrEHO/B4ksr/zrFxX0h4tngq+oT8Pc5FajfkofBlzkyhrdJ8D0hi7RGOvhZNmEkmQehP
         wR9qlVhRJduT68QHCVQ5jWkZs4xVdARWThRe0G/bC2035x7AwiGT2QKxGWob8VFNuHrS
         h514LriTW0UQVDgH/+hagzb7RMQw3DGy0VmgjK5rLWklFLV64WJDxD9NMxbb/xDxw/0A
         Y+7w==
X-Forwarded-Encrypted: i=1; AJvYcCW39mn98Y1RwnbUZ3DSgSgQVURboM/UDp05udiVXTmhFRJHcD3ilVVZoLNcRxZg5YgPBKHjwmclLXkCYE1CLYETCw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyDl0/lnEE5gX4q1B975xlJ4VVXq2hcHjJ/2g67M0upkYEpg9/n
	k47Y4sRtr48RlWe3n0LK+5o2LBg5I8ZRSlJk8ZLzbJfHRsNmCeQ165PP4aVvhWXAljr3s+BzoNM
	dxwfOtiU5lXVPWQexEBCeayssAgjC4ZI=
X-Gm-Gg: ASbGncvbkLz4djrFEBSA8fZSFS6H6to1Ol3uxHX8Xqv7m1ZclAcLC+m+IS4dfa5Tmub
	jMpJ3E9FRcblnFLEHMvQZsSamcohdK4Ro24suecZqDb2wwswjFqCb6mM1XcL/hTKhuRZ8rKs7FE
	DsNjbhBOaRrFlhi2R+ROtJH+ZATbO5xc9BDYQaDJbOcWHQaGHUndsutBhuZlsyAKrmdH8dDT19o
	WPsAHrEpZMIhJ7shR1S4pJdnpy0bwtXeEDV2yuHOSPjVByrY9igx8R1X/4XuAk8E660M0fC
X-Google-Smtp-Source: AGHT+IGpgJrYMfGnuwRo/gQlWU7NzhnbPcP9xk/nKVEkL15F/6eh8lNX8IKJ27YxNLKYE4ohIDXEfkaURxyxOqJWnK0=
X-Received: by 2002:a17:902:db0d:b0:297:eb3c:51ed with SMTP id
 d9443c01a7336-297eb3c5446mr106500045ad.16.1762786788230; Mon, 10 Nov 2025
 06:59:48 -0800 (PST)
MIME-Version: 1.0
References: <20251103143157.315178-1-niko.mauno@vaisala.com>
 <20251103143157.315178-5-niko.mauno@vaisala.com> <1ccdd952a740a2d09774d825cc28bee20ff1525d.camel@linuxfoundation.org>
In-Reply-To: <1ccdd952a740a2d09774d825cc28bee20ff1525d.camel@linuxfoundation.org>
From: Marta Rybczynska <rybczynska@gmail.com>
Date: Mon, 10 Nov 2025 15:59:36 +0100
X-Gm-Features: AWmQ_blq0rwbWgE7mePcVKBDog7aVXdt5TPQj2nIQk-ip3SG6vlWgL3a69Gh_DQ
Message-ID: <CAApg2=R=nyLt3hiqH5uEKqhp1XZ2WKkWrAH837ZqTGRTVSCWHw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 5/5] cve-update: Keep mtime stamp in the
 database itself
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: niko.mauno@vaisala.com, openembedded-core@lists.openembedded.org, 
	ross.burton@arm.com, peter.marko@siemens.com
Content-Type: multipart/alternative; boundary="00000000000053c8f806433ec841"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Nov 2025 14:59:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226124

--00000000000053c8f806433ec841
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 10, 2025 at 3:16=E2=80=AFPM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Mon, 2025-11-03 at 14:31 +0000, Niko Mauno via lists.openembedded.org
> wrote:
> > This should help to avoid problems that will occur if the modification
> > time of database file itself is altered e.g. by unassociated
> > process(es) on the file system which hosts the database file.
> >
> > Since this change updates the database structure by adding a new table,
> > bump the 'minor' version number in database file names to enforce full
> > database fetch. This should also iron out e.g. situation where the
> > database might have inconspicuously omitted entries due to way in which
> > the mtime of database file itself was relied upon.
> >
> > Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
> > ---
> >  meta/classes/cve-check.bbclass                |  2 +-
> >  .../recipes-core/meta/cve-update-db-native.bb |  3 +
> >  meta/recipes-core/meta/cve-update-native.inc  | 59 ++++++++++++-------
> >  .../meta/cve-update-nvd2-native.bb            |  3 +
> >  4 files changed, 46 insertions(+), 21 deletions(-)
>
> I am a bit worried about this since it takes what is a simple mtime
> comparison and means that to check the database you now have to lock
> and open it which is comparatively expensive.
>
> What kind of "unassociated processes" are updating the mtime?
>
>
I second Richard here. If we would really want to keep the date somewhere
else than the file
timestamp, we could create a simple file that stores it, what is way
simpler and doesn't require
to open the database just to see if you want to update it.

I second Richard's question: in what kind of a situation have you seen an
issue?

Kind regards,
Marta

--00000000000053c8f806433ec841
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Nov 10,=
 2025 at 3:16=E2=80=AFPM Richard Purdie &lt;<a href=3D"mailto:richard.purdi=
e@linuxfoundation.org">richard.purdie@linuxfoundation.org</a>&gt; wrote:<br=
></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;=
border-left:1px solid rgb(204,204,204);padding-left:1ex">On Mon, 2025-11-03=
 at 14:31 +0000, Niko Mauno via <a href=3D"http://lists.openembedded.org" r=
el=3D"noreferrer" target=3D"_blank">lists.openembedded.org</a> wrote:<br>
&gt; This should help to avoid problems that will occur if the modification=
<br>
&gt; time of database file itself is altered e.g. by unassociated<br>
&gt; process(es) on the file system which hosts the database file.<br>
&gt; <br>
&gt; Since this change updates the database structure by adding a new table=
,<br>
&gt; bump the &#39;minor&#39; version number in database file names to enfo=
rce full<br>
&gt; database fetch. This should also iron out e.g. situation where the<br>
&gt; database might have inconspicuously omitted entries due to way in whic=
h<br>
&gt; the mtime of database file itself was relied upon.<br>
&gt; <br>
&gt; Signed-off-by: Niko Mauno &lt;<a href=3D"mailto:niko.mauno@vaisala.com=
" target=3D"_blank">niko.mauno@vaisala.com</a>&gt;<br>
&gt; ---<br>
&gt; =C2=A0meta/classes/cve-check.bbclass=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 +-<br>
&gt; =C2=A0.../recipes-core/meta/<a href=3D"http://cve-update-db-native.bb"=
 rel=3D"noreferrer" target=3D"_blank">cve-update-db-native.bb</a> |=C2=A0 3=
 +<br>
&gt; =C2=A0meta/recipes-core/meta/cve-update-native.inc=C2=A0 | 59 ++++++++=
++++-------<br>
&gt; =C2=A0.../meta/<a href=3D"http://cve-update-nvd2-native.bb" rel=3D"nor=
eferrer" target=3D"_blank">cve-update-nvd2-native.bb</a>=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 3 +<br>
&gt; =C2=A04 files changed, 46 insertions(+), 21 deletions(-)<br>
<br>
I am a bit worried about this since it takes what is a simple mtime<br>
comparison and means that to check the database you now have to lock<br>
and open it which is comparatively expensive.<br>
<br>
What kind of &quot;unassociated processes&quot; are updating the mtime?<br>
<br></blockquote><div><br></div><div>I second Richard here. If we would rea=
lly want to keep the date somewhere else than the file</div><div>timestamp,=
 we could create a simple file that stores it, what is way simpler and does=
n&#39;t require</div><div>to open the database just to see if you want to u=
pdate it.</div><div><br></div><div>I second Richard&#39;s question: in what=
 kind of a situation have you seen an issue?</div><div><br></div><div>Kind =
regards,</div><div>Marta <br></div></div></div>

--00000000000053c8f806433ec841--

