Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67FB5C433F5
	for <webhook@archiver.kernel.org>; Wed, 27 Apr 2022 14:55:51 +0000 (UTC)
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com
 [209.85.222.176])
 by mx.groups.io with SMTP id smtpd.web12.9367.1651071344110809831
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Apr 2022 07:55:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=nAM0O6uA;
 spf=pass (domain: gmail.com, ip: 209.85.222.176,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f176.google.com with SMTP id s4so1491797qkh.0
        for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Apr 2022 07:55:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=v4J+LIn/X1tnXkQ/wQLwBe/oYSyXE4MUQnjxgy+CDFs=;
        b=nAM0O6uA5l8wDxIZP9r5XlUl1e4BTAO+Zj84fZ1P0NV/ZX72N00580jUGvxXdET+Ps
         ibk6+2kBCNlpnMsKE2hH9Tp6u8PN2xtIxwFarLjigjcCdHhJetJGPk7xclpcI31LtKHG
         9y5k3SY2o0cqLUU/oqPZDzM2iAkb+2iLVxTivj1s5SrqyHwUvxvW93QiJ0EbSlX4bFYT
         PeBx9Nfx/LXl73s8ttr7iNx/WpP+ds+JVE35xTmqlAfilU+bmBJc0ZbNKTr+KzuOVwcx
         IayMJhNxHugKOWwKpc4M37iIqsLZYBx1iBMn755aTmh/mlwJlN2+i8BPAaR9f4yLZgmg
         eHHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=v4J+LIn/X1tnXkQ/wQLwBe/oYSyXE4MUQnjxgy+CDFs=;
        b=eHx9EcaDv3mQZ8X64Av3/eszIevY7Grq3m2HU6SFwsBDMX9P122LfPfxXYCi68Pe7z
         gy17ol3vhaCL0XfQddcbKf/z+MSwXlDHdbv1Bxxq4vivaynibDcsuCB2CkgWzRmo4VLa
         te7097w5+cj0L8GkDAuucsmk2WZL68oQLMKLXpTXkkF9NqUfJkDfma8c1DSzhFUd/n+c
         eTLpPm9ORZzk/MGvn6yrentecPHBljUjzhbb1aDqQegD6hlZ9Oet9UQBcTdmQX5upE8y
         2aLTARZRhvm+0X/YVIEGL+HjleiAOp+AODDp3Z3xpDCyyxz+jOh66tHF6UyTCzgr3Iyx
         rKbA==
X-Gm-Message-State: AOAM532hbTL5sfP+FC7Iqq05ZcBucloiAJqkfqqEH1/VEonIvRgjyC6P
	dOkH/zprlaQ9VL6paBazUwkIsajkrfI7wVRg5fQ=
X-Google-Smtp-Source: 
 ABdhPJz7taKNBye0uHYXsnAlA+L9qH7qcCCziFnbUOwtHejpJ3/6mHpvz38PqaIM05bog8viA4WeNWAjKSS3DRjlwEo=
X-Received: by 2002:a37:714:0:b0:69f:9086:7792 with SMTP id
 20-20020a370714000000b0069f90867792mr1328867qkh.180.1651071343130; Wed, 27
 Apr 2022 07:55:43 -0700 (PDT)
MIME-Version: 1.0
References: 
 <CAApg2=Q9DOoYVHNSCR_=pEN-x7EQuRw2yhwqWhEG2zaMTONt8w@mail.gmail.com>
 <CAApg2=TjNwub9WsLfh1ZAA8hfMVDPgTYVCELotUfGRGpO9gu8Q@mail.gmail.com>
 <5e82785b-14bc-5a4d-a807-fdaa58afee5d@gmail.com>
 <CAApg2=Rd7rBM_PaVEzt4K4vKd4AqVC1uA6yZJZrABFLFYNWrcQ@mail.gmail.com>
 <6D1CD0C3-16D0-4FB4-BEDF-FA6FDF94724C@arm.com>
 <6dff4bbd3390a8e6f7103210eb8e8d74d9cb239c.camel@linuxfoundation.org>
In-Reply-To: 
 <6dff4bbd3390a8e6f7103210eb8e8d74d9cb239c.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 27 Apr 2022 07:55:32 -0700
Message-ID: 
 <CAMKF1sqdtij84OPpw+p8B-OoNUU-=cUo6AmG5ousZp0xO5aY3w@mail.gmail.com>
Subject: Re: [oe] CVE-check failing on world with meta-openembedded: diff.gz
 file
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Ross Burton <Ross.Burton@arm.com>, Steve Sakoman <steve@sakoman.com>,
	"rybczynska@gmail.com" <rybczynska@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000e7fc9705dda40089"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Apr 2022 14:55:51 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164926

--000000000000e7fc9705dda40089
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 27, 2022 at 3:33 AM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Wed, 2022-04-27 at 10:32 +0000, Ross Burton wrote:
> > On 27 Apr 2022, at 08:14, Marta Rybczynska via lists.openembedded.org
> > <rybczynska=3Dgmail.com@lists.openembedded.org> wrote:
> > > I'm wondering if it makes sense to consider .diff.gz (or .patch.gz)
> files as
> > > patches for
> > > cve-check. They basically come directly from 3rd parties and it is
> quite
> > > unlikely to expect
> > > them to keep the CVE: tag. All the pieces of documentation I can find
> > > mention also only
> > > .patch files for CVEs, and not .patch.gz.
> > >
> > > This is tempting to remove the .gz handling here (for the cve-check)
> in my
> > > opinion.
> > >
> > > Also, since the commit f5f97d33a1703d75b9fd9760f2c7767081538e00,
> cve-check
> > > depends only on do_fetch.
> >
> > The patch being a .patch.gz isn=E2=80=99t entirely relevant, it=E2=80=
=99s the fact that
> it=E2=80=99s a
> > remote http: patch not a local file: patch which is causing the problem=
.
> The
> > code uses the localpath, which only exists for remote URL after
> do_unpack.
> >
> > There are three alternatives here:
> > 1) Only consider local patches.  Any remote patches won=E2=80=99t be sc=
anned,
> but they
> > don=E2=80=99t work anyway right now. This might mean the dependency on =
do_fetch
> can be
> > dropped to speed up checking even further.
> > 2) Change the task dependency to be on do_unpack instead of do_fetch.
> This
> > will slow down processing if a build hasn=E2=80=99t already happened as=
 tarballs
> will
> > be unpacked, but remote files will be present for scanning then.
> > 3) Try to be clever and manually call unpack on remote files.  More
> > complicated but preserves the speed.
> >
> > I=E2=80=99m actually undecided over what the best solution is. Clearly =
we need
> some
> > test cases for this code too.
>
> I think the deciding factor may be that most remote patches probably don'=
t
> have
> the information we're looking for in them anyway?


I think covering more cases has value if it can be done in a reasonable
manner without punishing the system too much otherwise a diagnostic message
should definitely be an improvement which will nudge the user to perhaps
change the patch mechanism like we did for lockdev

>
> Cheers,
>
> Richard
>
>

--000000000000e7fc9705dda40089
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Wed, Apr 27, 2022 at 3:33 AM Richard Purdie &lt;<a href=
=3D"mailto:richard.purdie@linuxfoundation.org">richard.purdie@linuxfoundati=
on.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On Wed, 2022-=
04-27 at 10:32 +0000, Ross Burton wrote:<br>
&gt; On 27 Apr 2022, at 08:14, Marta Rybczynska via <a href=3D"http://lists=
.openembedded.org" rel=3D"noreferrer" target=3D"_blank">lists.openembedded.=
org</a><br>
&gt; &lt;rybczynska=3D<a href=3D"mailto:gmail.com@lists.openembedded.org" t=
arget=3D"_blank">gmail.com@lists.openembedded.org</a>&gt; wrote:<br>
&gt; &gt; I&#39;m wondering if it makes sense to consider .diff.gz (or .pat=
ch.gz) files as<br>
&gt; &gt; patches for<br>
&gt; &gt; cve-check. They basically come directly from 3rd parties and it i=
s quite<br>
&gt; &gt; unlikely to expect<br>
&gt; &gt; them to keep the CVE: tag. All the pieces of documentation I can =
find<br>
&gt; &gt; mention also only<br>
&gt; &gt; .patch files for CVEs, and not .patch.gz.<br>
&gt; &gt; <br>
&gt; &gt; This is tempting to remove the .gz handling here (for the cve-che=
ck) in my<br>
&gt; &gt; opinion.<br>
&gt; &gt; <br>
&gt; &gt; Also, since the commit f5f97d33a1703d75b9fd9760f2c7767081538e00, =
cve-check<br>
&gt; &gt; depends only on do_fetch.<br>
&gt; <br>
&gt; The patch being a .patch.gz isn=E2=80=99t entirely relevant, it=E2=80=
=99s the fact that it=E2=80=99s a<br>
&gt; remote http: patch not a local file: patch which is causing the proble=
m. The<br>
&gt; code uses the localpath, which only exists for remote URL after do_unp=
ack.<br>
&gt; <br>
&gt; There are three alternatives here:<br>
&gt; 1) Only consider local patches.=C2=A0 Any remote patches won=E2=80=99t=
 be scanned, but they<br>
&gt; don=E2=80=99t work anyway right now. This might mean the dependency on=
 do_fetch can be<br>
&gt; dropped to speed up checking even further.<br>
&gt; 2) Change the task dependency to be on do_unpack instead of do_fetch. =
This<br>
&gt; will slow down processing if a build hasn=E2=80=99t already happened a=
s tarballs will<br>
&gt; be unpacked, but remote files will be present for scanning then.<br>
&gt; 3) Try to be clever and manually call unpack on remote files.=C2=A0 Mo=
re<br>
&gt; complicated but preserves the speed.<br>
&gt; <br>
&gt; I=E2=80=99m actually undecided over what the best solution is. Clearly=
 we need some<br>
&gt; test cases for this code too.<br>
<br>
I think the deciding factor may be that most remote patches probably don&#3=
9;t have<br>
the information we&#39;re looking for in them anyway?</blockquote><div dir=
=3D"auto"><br></div><div dir=3D"auto">I think covering more cases has value=
 if it can be done in a reasonable manner without punishing the system too =
much otherwise a diagnostic message should definitely be an improvement whi=
ch will nudge the user to perhaps change the patch mechanism like we did fo=
r lockdev=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 =
0 .8ex;border-left:1px #ccc solid;padding-left:1ex" dir=3D"auto"></blockquo=
te><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left=
:1px #ccc solid;padding-left:1ex"><br>
Cheers,<br>
<br>
Richard<br>
<br>
</blockquote></div></div>

--000000000000e7fc9705dda40089--

