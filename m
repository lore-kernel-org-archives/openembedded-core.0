Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68CD1CD6E4A
	for <webhook@archiver.kernel.org>; Wed,  3 Jun 2026 11:38:49 +0000 (UTC)
Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com [74.125.224.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18064.1780486721703884336
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Jun 2026 04:38:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=ISzfGPZa;
 spf=pass (domain: gmail.com, ip: 74.125.224.52, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-66062a414fcso4717935d50.1
        for <openembedded-core@lists.openembedded.org>; Wed, 03 Jun 2026 04:38:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780486721; cv=none;
        d=google.com; s=arc-20240605;
        b=AIojIVS+197o+xhItVrRsHVSncJEOEyi7pC+jtFhbuxn6gs9WDkLpoiCp3cDY4Xklj
         e26ae6TguPH/YSpMgt0piLWbYHcTUw4/lk3Mbz31+Q444HfOkwPITIbV4mkCrolSHVll
         yovg4SlFQF/Qy+lZ/Z3lVXvxvpThOzA0BBPhdxDwO5i79REYau7blB+jUt6ojzEig12L
         e19IhCt3VwW4NPE4u6P3yyTm7B8yY/2PtZ5/ah9yaFNUA6EgSSj9rTtEwWexzivxLjO6
         usQO472Za1ibsNhDEoukLm6nII+OAN+SgtT9aAiHOeL5nM0uwBbhtmTcRa64+4GsTymL
         PRCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=xktgSWZDGoyzQYxLbwCsXBGPT7nMAl5IYbYnmf7kUzI=;
        fh=c5Pz8iP3nY9JFN6i1RdYsawJLh0Ap8Z3uCW5k3SSsIM=;
        b=JW+T9vlAivIYqH7rx2wlACO3WGghaRMayBCl0zYYLzTRvRM1+YqGaXXTi/zsqGcuj9
         lKhGOqTm5T5BA8DO8NaScIIYhqUv3j2tRBjLt6ylLXIqwFOrwBgbAhurZFUbz4p1KCG6
         KqlCNhqCWe5Z/pcpOwHfOGkw375hU+tbWYFtq3QjflkW2KzsNMO2XnIEhlTkvi1Tln3u
         xUtmC4Q5/X3LmuBCgRV6wjfcWj3Q02y56+9bXIgPJ6pUspQ8qZ4a39r2ZNdAdq4FLp7t
         QA7ERfx36BblBnha0rCGMDFKQ4gUFFg9si6piHdDzWuK6mSKErQOqUAMx1NIzZ+/bl7D
         AG5Q==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780486721; x=1781091521; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=xktgSWZDGoyzQYxLbwCsXBGPT7nMAl5IYbYnmf7kUzI=;
        b=ISzfGPZaZq+MarylBuLGPCLXs3/KiqIO136mNRtmO1N54k54VaV19td2mjwTf1DlEp
         DnBqUA0u6PlxgwxW9BFkHIdtAnYwh+ypAaazq1XamOxz8TsVbbx2eZWdaQK72CqjBf56
         yXrLGrkyZgtmE5tbQwjCf3H7RND11KoNf5NjEuUo2OpaD0fT3rppwW+ui+bHZBDOtpVA
         qnPetwNCJb/XPvR7zG/WTRXYjf2b5n5vhgSGuEIFpJFnyABdoHsoEd+FRWqWwyn+oKp6
         audrufZL0+DZrDiUjqOTO3MmL5m28479xn2X3C/F4DccC8C2zMTcPiMnoweDicZ8wU0w
         ElVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780486721; x=1781091521;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xktgSWZDGoyzQYxLbwCsXBGPT7nMAl5IYbYnmf7kUzI=;
        b=EGARPFpPGwaim17jQayHsNpq6kjC6xkp7t16FvIGBnXbEpyOyx/iL4hmphrzrZGZcy
         WHb/I+gmZrXiipU7rxwTwMTjxRhZR2aT4gc8dfCVkzg++zEXTvN5+CiJZAa76JS7d14g
         6tNMNj0XvsUC94ViaEkMq5ARVvckhHpXFDXvfykzm9oMw+5XCAIAsVisAbIdG5N3dOwm
         tJUBuZRTImMmum285uoMzUh0SZ3SWEq5eVd94fLCRPKwiP5kLXK4b5xq6AtU/KAfybNu
         oItArH9LfAjZ4JdMt2NuYKF4UesNfL/GlCmRZ+WbWc5Lb3NNkd1WhoxGsIHgigCWWiWV
         iWJg==
X-Forwarded-Encrypted: i=1; AFNElJ8dwkEPnpL6A6DfST49V5VId4GA4FntvhGdB3VEqLsGWEWAB2HcuaNEFCdmi5u9D2t7Je3RD6xY9MVNq9iIsfkDjA==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yzos7WJcw0P6TqB/P9Z/9fJVhwTpSOu3dVIohCv23Xajsj52H2L
	WLZknmBNNJuT0cDZyRxGd4DA9DrrgTYnS+BMVWIuOY7OjWrYxv/YZShd562UXeXOfFNJgqS0d0k
	GkNcgaYVjk0xkgUSQqxmkf15JiMKtxok=
X-Gm-Gg: Acq92OFImZmDcsNNkHZcnpCQkQzBYrZF4SpHYVU/M17eD2BSZsjL+IN8F3WJiYBEjQd
	OPJjrvNusDz+RsPtps94tnysFpXrInJ7NvZujHtbi1xiztjU/y5tLMyFtZth6SS9sf+3husWe+n
	wfvsLE1xVMAjDjbcHFX2hbi92EqzRFXRNKFlTDR/O52MdOjgb+H9HPa3agR/yi7OgnqM4e4C5FA
	KsemAObTYN/FKDSqe9+KELsNGmYiZj7eW/FSTA43PRB/KiTONBfUnVRqo+X2Rwxs5eIyIaA3vFT
	ND+gjRJjctHqqS813FTM0vREwlKSu0LNGVAqaQAl77uWIXfuRrsJGUlBkGjRXtugBrTdY5JXb37
	0w9vVrHM3XSBtoluhmomJr0sHdGFQpOG1RApUd+MMAffEJwYbs5plVbcZkC1bOPbkypUblkPSl1
	vRm6pvhROD9iYJyi4=
X-Received: by 2002:a05:690e:484f:b0:660:2f29:a0f6 with SMTP id
 956f58d0204a3-660dbe7b615mr1750356d50.5.1780486720723; Wed, 03 Jun 2026
 04:38:40 -0700 (PDT)
MIME-Version: 1.0
References: <20260514133748.219486-1-ross.burton@arm.com> <CAMKF1soV8G-LLutq=9Ba-pkz=XyEJ=5812eQnaYOP834pvBNDg@mail.gmail.com>
 <8FD4DA19-AA50-430F-9B77-0B79D6E70F26@arm.com> <CANNYZj_2Ky4KYra153oe85KSArHOe5Uawi4aK=SZe+-c5zvuaA@mail.gmail.com>
 <77901880-9008-468E-9FD3-07408FFA9310@arm.com>
In-Reply-To: <77901880-9008-468E-9FD3-07408FFA9310@arm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 3 Jun 2026 13:38:29 +0200
X-Gm-Features: AVHnY4JG_ZLpcqVZslIfhWp9huMOmT3_XIqJTvufdDipmhjuQIlAQ-IuJBNk9mA
Message-ID: <CAMKF1sopgUP2e=_GroM9H4WWZ1TBdViLx0egROwhYYBiM=4YVQ@mail.gmail.com>
Subject: Re: [OE-core] [RFC PATCH] avahi: upgrade 0.8 -> 0.9-rc4
To: Ross Burton <Ross.Burton@arm.com>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000841f39065357dea8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Jun 2026 11:38:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238093

--000000000000841f39065357dea8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Ross,

Do we know if other distributions are already shipping 0.9-rc4? If they
are, then we are likely in a safer position.

Thanks,
Khem


On Wed, Jun 3, 2026, 11:49=E2=80=AFAM Ross Burton <Ross.Burton@arm.com> wro=
te:

> On 2 Jun 2026, at 18:43, Alexander Kanavin <alex.kanavin@gmail.com> wrote=
:
> >
> > On Thu, 14 May 2026 at 18:33, Ross Burton via lists.openembedded.org
> > <ross.burton=3Darm.com@lists.openembedded.org> wrote:
> >>> How confident are we with the release happening on time before we
> release in next 5 months time
> >>
> >> There=E2=80=99s a lot of distros leaning on this to happen but indeed =
it=E2=80=99s a
> long time coming=E2=80=A6
> >
> > *rant*
> >
> > I wish upstream developers, and I don't just mean avahi, would
> > remember that 'rc' stands for 'release candidate'. And 'release
> > candidate' means a candidate for release, a source snapshot that is
> > deemed ready, and becomes the actual release, unless any embarrassing
> > last minute issues are reported in a limited timeframe (e.g. days).
> >
> > What is avahi's track record with those 'rc' tags?
> >
> > https://github.com/avahi/avahi/tags
> >
> > *end rant*
> >
> > That said, we probably should just take it, as long as PV of the
> > actual 0.9 would sort higher than this rc.
>
> Agreed, see https://github.com/avahi/avahi/issues/503.
>
> I explicitly set the PV to "0.9~rc4=E2=80=9D so that it sorts *before* 0.=
9.
>
> Ross

--000000000000841f39065357dea8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Hi Ross,<br><br>Do we know if other distributions are alr=
eady shipping 0.9-rc4? If they are, then we are likely in a safer position.=
<br><br>Thanks,<br>Khem<div><br></div></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jun 3, =
2026, 11:49=E2=80=AFAM Ross Burton &lt;<a href=3D"mailto:Ross.Burton@arm.co=
m">Ross.Burton@arm.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex">On 2 Jun 2026, at 18:43, Alexander Kanavin &lt;<a hre=
f=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank" rel=3D"noreferrer">al=
ex.kanavin@gmail.com</a>&gt; wrote:<br>
&gt; <br>
&gt; On Thu, 14 May 2026 at 18:33, Ross Burton via <a href=3D"http://lists.=
openembedded.org" rel=3D"noreferrer noreferrer" target=3D"_blank">lists.ope=
nembedded.org</a><br>
&gt; &lt;ross.burton=3D<a href=3D"mailto:arm.com@lists.openembedded.org" ta=
rget=3D"_blank" rel=3D"noreferrer">arm.com@lists.openembedded.org</a>&gt; w=
rote:<br>
&gt;&gt;&gt; How confident are we with the release happening on time before=
 we release in next 5 months time<br>
&gt;&gt; <br>
&gt;&gt; There=E2=80=99s a lot of distros leaning on this to happen but ind=
eed it=E2=80=99s a long time coming=E2=80=A6<br>
&gt; <br>
&gt; *rant*<br>
&gt; <br>
&gt; I wish upstream developers, and I don&#39;t just mean avahi, would<br>
&gt; remember that &#39;rc&#39; stands for &#39;release candidate&#39;. And=
 &#39;release<br>
&gt; candidate&#39; means a candidate for release, a source snapshot that i=
s<br>
&gt; deemed ready, and becomes the actual release, unless any embarrassing<=
br>
&gt; last minute issues are reported in a limited timeframe (e.g. days).<br=
>
&gt; <br>
&gt; What is avahi&#39;s track record with those &#39;rc&#39; tags?<br>
&gt; <br>
&gt; <a href=3D"https://github.com/avahi/avahi/tags" rel=3D"noreferrer nore=
ferrer" target=3D"_blank">https://github.com/avahi/avahi/tags</a><br>
&gt; <br>
&gt; *end rant*<br>
&gt; <br>
&gt; That said, we probably should just take it, as long as PV of the<br>
&gt; actual 0.9 would sort higher than this rc.<br>
<br>
Agreed, see <a href=3D"https://github.com/avahi/avahi/issues/503" rel=3D"no=
referrer noreferrer" target=3D"_blank">https://github.com/avahi/avahi/issue=
s/503</a>.<br>
<br>
I explicitly set the PV to &quot;0.9~rc4=E2=80=9D so that it sorts *before*=
 0.9.<br>
<br>
Ross</blockquote></div>

--000000000000841f39065357dea8--

