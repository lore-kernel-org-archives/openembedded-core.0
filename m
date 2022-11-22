Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7C1DC4332F
	for <webhook@archiver.kernel.org>; Tue, 22 Nov 2022 18:04:15 +0000 (UTC)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
 by mx.groups.io with SMTP id smtpd.web11.2157.1669140253123165169
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Nov 2022 10:04:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=mxEIV7a/;
 spf=pass (domain: gmail.com, ip: 209.85.208.175, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f175.google.com with SMTP id k19so18845818lji.2
        for <openembedded-core@lists.openembedded.org>; Tue, 22 Nov 2022 10:04:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=eiSoJGDQq7DXjzGk3UR1oghIAvhLmxy58VxB4JQ1CtE=;
        b=mxEIV7a/AQVCTLxoS8eI0tdNQBbyF6rnMz14i27qhg2ftiN9yYHbZ4DdYHnIO5hBuw
         FCp1u/yKHSd0eKZOxVuBOLVu8BAJexp4NACnyQkpq1+w0wsch44NfMr7uH69OY1lm6ts
         puSVnbECdcLoJ9O6cwdHRU7At+2SrX43ACXoKfRtqRohdn8BfFMQPZvg5Cr2WqZwkL+s
         /b9fqOfSS2p1EKstxiLpxcRkaovauiWXjUMp7NO507sq9AMjjcEbelR+1SEDf1QwzJLp
         l30K+iowEAvedmUg4N9M2Wp5BYMZQduzCuzFLr91bHANgfqlaJ9aaD1/kCM/cspc6lpF
         UTVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eiSoJGDQq7DXjzGk3UR1oghIAvhLmxy58VxB4JQ1CtE=;
        b=pf4beE5DlQv3rWuKc1WrahZTy0McQFsywJrRitDPcWo8PZhhOco+/Bi/1SBC1mVYbT
         sD0LuWfF50oTsrfPieCc/EAWADMuMNka0y4LUyofXM5fl6jpL40QPyUwCYRnSqyOUhW5
         4XO7IoGyGnfKbZ2+TJqF9eJahN69k2fV5rHCwdn4+DtsXfQnmq08aSOZ2KfzDg3HfsgD
         iKEXpVpOyUQjYWObnTW8sF/qr3F7chvRcNiyAyCY7IvpCcd6Npb5jibRGmXJmztcJixE
         GQVmanR8wUX2Qfbu7ggJZqjVbVrtcPoIgrM8BHD6yYxGIjtwb9oiWk02d5TZ/sfhTRwT
         zWEQ==
X-Gm-Message-State: ANoB5pmiTRA+yyNkJKRqGZ/ZGrDKzpc1TgQSrg23U+w0DHCRaLljqJ7y
	fhYu+REz6WofdwQkzIhBqNLo9BUEp7E4j4pRuK4=
X-Google-Smtp-Source: AA0mqf6p6vVQXY5VM+bkvlZ2leO/2aJ1W5vXiC+o83JK54ytJrxbISN9QXbabbl03CI1NCLIu86IQ4XJ5wrUEktDAn8=
X-Received: by 2002:a2e:3a07:0:b0:279:43be:97d6 with SMTP id
 h7-20020a2e3a07000000b0027943be97d6mr4910186lja.33.1669140250504; Tue, 22 Nov
 2022 10:04:10 -0800 (PST)
MIME-Version: 1.0
References: <20221120175237.194899-1-f_l_k@t-online.de> <CAMKF1spErHg3JX+DFRLcW4EthTGBMm4A24XsyAVOO3RNr6Wgfw@mail.gmail.com>
 <CANNYZj-UTuxW0-Rr7FhgjwE007Gr28Pc5ZCo=cnrDcaNsuZStw@mail.gmail.com>
 <CAMKF1srs_tmRRNqWQAmBKOkJkfysJt=OZjefq_mPd4htPGi6VA@mail.gmail.com>
 <1729A925BA1D06C8.25787@lists.openembedded.org> <CANNYZj-mhM6FzQY4Lv2BckodcLtPSUV29GG4TCUb_Tp003SAbw@mail.gmail.com>
 <HRFQLR.NFABK2KMZ9XR2@t-online.de> <4BF25A91-3F02-49A2-A546-A9CF7881E0ED@arm.com>
In-Reply-To: <4BF25A91-3F02-49A2-A546-A9CF7881E0ED@arm.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 22 Nov 2022 19:03:59 +0100
Message-ID: <CANNYZj9uxKov0vrox7N3kv-HdQJ9VDbLu7Jsn_SuVUTz_Nbrzw@mail.gmail.com>
Subject: Re: [oe-core][PATCH] python3: add ${bindir}/python symlink
To: Ross Burton <Ross.Burton@arm.com>
Cc: Khem Raj <raj.khem@gmail.com>, Markus Volk <f_l_k@t-online.de>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000b6330d05ee12ff7f"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Nov 2022 18:04:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173695

--000000000000b6330d05ee12ff7f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

The serious need is that we need to patch all the scripts that ask for
python to add a 3 to it. And there will be more of these going forward, not
less. I=E2=80=99d rather just always have python available. Not a problem w=
orth
deliberating over to be honest.

Alex

On Tue 22. Nov 2022 at 18.41, Ross Burton <Ross.Burton@arm.com> wrote:

> On 22 Nov 2022, at 04:42, Markus Volk via lists.openembedded.org <f_l_k=
=3D
> t-online.de@lists.openembedded.org> wrote:
> > On Mon, Nov 21 2022 at 06:48:07 PM +0100, Alexander Kanavin <
> alex.kanavin@gmail.com> wrote:
> >> On my Debian systems, indeed, /usr/bin/python is absent.
> >
> > Debian has a package for this
> > https://packages.debian.org/bookworm/python-is-python3
>
> And that=E2=80=99s a perfectly good solution that I like.
>
> Personally, I think people should forget that /usr/bin/python exists: the
> recommendation from Python is to call python2 or python3.  I can quote fr=
om
> PEP-0394:
>
> =E2=80=9C=E2=80=9D=E2=80=9D
> Depending on a distribution or system configuration, python may or may no=
t
> be installed. If python is installed its target interpreter may refer to
> python2 or python3.=E2=80=9D
>
> =E2=80=A6
>
>     =E2=80=A2 Distributors may choose to set the behavior of the python c=
ommand as
> follows:
>         =E2=80=A2 python2,
>         =E2=80=A2 python3,
>         =E2=80=A2 not provide python command,
>         =E2=80=A2 allow python to be configurable by an end user or a sys=
tem
> administrator.
> =E2=80=9C=E2=80=9D=E2=80=9D
>
> We=E2=80=99ve picked option 3.  As per Python upstream, that=E2=80=99s ab=
solutely fine.
>
> If you have a serious need that /usr/bin/python exists, and is a symlink
> to python3, then could you not make a simple recipe that RDEPENDS on
> python3 and ships just a /usr/bin/python -> python3 symlink?  You can eve=
n
> put this in your layer to avoid having to debate it with the oe-core
> maintainers.
>
> Ross

--000000000000b6330d05ee12ff7f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">The serious need is that we need to patch all the scripts=
 that ask for python to add a 3 to it. And there will be more of these goin=
g forward, not less. I=E2=80=99d rather just always have python available. =
Not a problem worth deliberating over to be honest.</div><div dir=3D"auto">=
<br></div><div dir=3D"auto">Alex</div><div><br><div class=3D"gmail_quote"><=
div dir=3D"ltr" class=3D"gmail_attr">On Tue 22. Nov 2022 at 18.41, Ross Bur=
ton &lt;<a href=3D"mailto:Ross.Burton@arm.com">Ross.Burton@arm.com</a>&gt; =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left-width:1px;border-left-style:solid;padding-left:1ex;bor=
der-left-color:rgb(204,204,204)">On 22 Nov 2022, at 04:42, Markus Volk via =
<a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D"_bla=
nk">lists.openembedded.org</a> &lt;f_l_k=3D<a href=3D"mailto:t-online.de@li=
sts.openembedded.org" target=3D"_blank">t-online.de@lists.openembedded.org<=
/a>&gt; wrote:<br>
&gt; On Mon, Nov 21 2022 at 06:48:07 PM +0100, Alexander Kanavin &lt;<a hre=
f=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.kanavin@gmail.co=
m</a>&gt; wrote:<br>
&gt;&gt; On my Debian systems, indeed, /usr/bin/python is absent.<br>
&gt; <br>
&gt; Debian has a package for this<br>
&gt; <a href=3D"https://packages.debian.org/bookworm/python-is-python3" rel=
=3D"noreferrer" target=3D"_blank">https://packages.debian.org/bookworm/pyth=
on-is-python3</a><br>
<br>
And that=E2=80=99s a perfectly good solution that I like.<br>
<br>
Personally, I think people should forget that /usr/bin/python exists: the r=
ecommendation from Python is to call python2 or python3.=C2=A0 I can quote =
from PEP-0394:<br>
<br>
=E2=80=9C=E2=80=9D=E2=80=9D<br>
Depending on a distribution or system configuration, python may or may not =
be installed. If python is installed its target interpreter may refer to py=
thon2 or python3.=E2=80=9D<br>
<br>
=E2=80=A6<br>
<br>
=C2=A0 =C2=A0 =E2=80=A2 Distributors may choose to set the behavior of the =
python command as follows:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =E2=80=A2 python2,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =E2=80=A2 python3,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =E2=80=A2 not provide python command,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =E2=80=A2 allow python to be configurable by an=
 end user or a system administrator.<br>
=E2=80=9C=E2=80=9D=E2=80=9D<br>
<br>
We=E2=80=99ve picked option 3.=C2=A0 As per Python upstream, that=E2=80=99s=
 absolutely fine.<br>
<br>
If you have a serious need that /usr/bin/python exists, and is a symlink to=
 python3, then could you not make a simple recipe that RDEPENDS on python3 =
and ships just a /usr/bin/python -&gt; python3 symlink?=C2=A0 You can even =
put this in your layer to avoid having to debate it with the oe-core mainta=
iners.<br>
<br>
Ross</blockquote></div></div>

--000000000000b6330d05ee12ff7f--

