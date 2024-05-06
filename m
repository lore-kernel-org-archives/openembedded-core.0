Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECD47C4345F
	for <webhook@archiver.kernel.org>; Mon,  6 May 2024 00:13:10 +0000 (UTC)
Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
 by mx.groups.io with SMTP id smtpd.web11.9876.1714954388983639988
 for <openembedded-core@lists.openembedded.org>;
 Sun, 05 May 2024 17:13:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Il/c+5kL;
 spf=pass (domain: gmail.com, ip: 209.85.160.41, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-23f0d7d2ce6so738062fac.2
        for <openembedded-core@lists.openembedded.org>; Sun, 05 May 2024 17:13:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714954388; x=1715559188; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rrfg+DhNG2F3bNFCR/uu8y5k+FE1VsHH2NeibSJCqPY=;
        b=Il/c+5kL4KlE+gtZDCGZaFbv/IumnCZQXj8T+ZYQITikTQzyHVyPk/PfF0O5xh/PW6
         5HiCVmNnhVfZwHh0NYYoKoLBiaqF33xcOQPzKLysLcU+vPHoJ973BaQKwU6iMCoAs5BV
         QDzqPLcXSzDB/u69bhXQ4iMTodrx/5GX1TFc37dH9Xx69NCN8saXUBoJ5qD+43FysylQ
         eH1roUGkjLmwth2Uhizt1Rxp4P55K9ltK6GYZ+D3Ic401CieXKuWFyjjE28LXKQ83AGt
         ODmQfC+cHQ2QjTRf+nxlvzbtlMOs1IQt6CQiW+wn73LQZNLpZRZIS9+zF2nVUSboxlbi
         gBEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714954388; x=1715559188;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Rrfg+DhNG2F3bNFCR/uu8y5k+FE1VsHH2NeibSJCqPY=;
        b=wlpcg8rinzfrdpWZDZkeP7rgq6uz5uzxdd9OjUUBrSu10KH4x7DJs4g5cJl7OTcQ+4
         HiKQhsQOs12MoguYQnGpxjejIWlr1bH2/TeXJXpy1IuXYOEmdn/V3DBF1UMGkWI95R9Z
         LONxYQFTE06mxJmcUWRT1JiNXiM9WQSbziDgi7rKU67qaoCq3sOgMSyAcMlMFqaS4zX5
         m5PjrFNLfdrtMGGdvt2waK+vGyhEzuTlrnjXPAPCg6DEGFRR4v2CaPVBGmRVUrwSBd1k
         hYZEXkb0q6gaeLIWyfi/HHQyJ/uDybz348vB7IZGLoZSsM4NlFZzv99dsm9+ZBEG9T0w
         fbhg==
X-Gm-Message-State: AOJu0YwJTBt/gCAktT/9JwNLW57TuEQrd93BEROj9ztrzO2pxljnq46+
	Y5ddvly/aw6Xg6RALEnscRMApcPs6mGm5q+t6dwSut7Lmo+Dp6e8O+oBJnVYSMqiU4Qc+N3eFHb
	IeF1pZ8QYq/wni8W0VtjDeqKx8GE=
X-Google-Smtp-Source: AGHT+IG9wbtfj/Zxymfn62CUYHo4u1XNDFOEMHO8CGsaEoVIjhJeasCRpEGr9LoTA2FvHbzDmrEm04EqTKFuEjEx0EE=
X-Received: by 2002:a05:6871:7821:b0:22e:d0e3:925f with SMTP id
 oy33-20020a056871782100b0022ed0e3925fmr12359580oac.1.1714954388198; Sun, 05
 May 2024 17:13:08 -0700 (PDT)
MIME-Version: 1.0
References: <20240505091720.8682-1-peter.marko@siemens.com>
 <CAMKF1sp1=f6Akrn2NeYtS6EuOO+_PVxpbc+oSCNyFSVsKnktDg@mail.gmail.com> <AS1PR10MB569772E4AD10E6FAA803DBDCFD1D2@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: <AS1PR10MB569772E4AD10E6FAA803DBDCFD1D2@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 5 May 2024 17:12:41 -0700
Message-ID: <CAMKF1soUDFBKQSXbMuLVo0uFU00G3VOU6F-x38V=ArFkwXvJZA@mail.gmail.com>
Subject: Re: [OE-core][PATCH] glibc: correct license
To: "Marko, Peter" <Peter.Marko@siemens.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 May 2024 00:13:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199027

On Sun, May 5, 2024 at 1:43=E2=80=AFPM Marko, Peter <Peter.Marko@siemens.co=
m> wrote:
>
> From: Khem Raj <raj.khem@gmail.com>
> Sent: Sunday, May 5, 2024 21:22
> To: Marko, Peter (ADV D EU SK BFS1) <Peter.Marko@siemens.com>
> Cc: openembedded-core@lists.openembedded.org
> Subject: Re: [OE-core][PATCH] glibc: correct license
>
> > On Sun, May 5, 2024 at 2:18=E2=80=AFAM Peter Marko via http://lists.ope=
nembedded.org <peter.marko=3Dmailto:siemens.com@lists.openembedded.org> wro=
te:
> > > From: Peter Marko <mailto:peter.marko@siemens.com>
> > >
> > > The license per https://www.gnu.org/software/libc/ is LGPL-2.1-or-lat=
er.
> > > https://sourceware.org/git/?p=3Dglibc.git;a=3Dcommitdiff;h=3D273a835f=
e7c685cc54266bb8b502787bad5e9bae
> > > converted last LGPL-2.1-only references.
> > >
> > > License-Update: correction
> >
> > This should reflect reason but overall the patch is ok
> >
>
> Could you please be more specific what should I write?

its can be changed/corrected from X to Y then point to supporting
links you have cited as links using [1] [2] etc.

> The long reason is written above the License-Update field, I just added t=
he field to satisfy the patch checker bot.
> Putting the whole text to this field doesn't look right.
>
> I don't know the history of glibc license to be able to assess if they mi=
grated recently or if these were just wrongly committed licenses.
> I just noticed the commit when updating glibc to the latest hash and deci=
ded to correct the recipe LICENSE field according to this hint.
> So "correction" looks to me like a good short statement wrt the recipe LI=
CENSE field.
>
> Thanks,
>   Peter

