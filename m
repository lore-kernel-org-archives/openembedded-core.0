Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91D1ACA9EC5
	for <webhook@archiver.kernel.org>; Mon, 12 Oct 2026 13:04:43 +0000 (UTC)
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12624.1791810280858874866
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Oct 2026 06:04:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=ft7GoJY7;
 spf=pass (domain: gmail.com, ip: 209.85.219.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-91b55859245so33455126d6.0
        for <openembedded-core@lists.openembedded.org>; Mon, 12 Oct 2026 06:04:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791810280; cv=none;
        d=google.com; s=arc-20260327;
        b=Yq91ZdTkTnvjSN/cTlneA/LPe99i6tn/2fsguEZtIuYGVFug75kZEwPrljWjLrvDzK
         NeE2JlzUvoR6B33/N3RrHhgeVsZ3JJyPdBBnAu9cXG6oeNUx2KWfYLASHzTS6xHpfPFm
         Gnkmu8BKACSfeJfH229FQA7kta55LvbxXHhAPWr60JeV0pdW3oFoqjgJXov0406fMldI
         o+RMMv3/RPZmVY3YIKkc+l9VgKM08LQ0WOA133m+W1mK5JryESeNXZwaf9Z0y4UoYNQ4
         9kMaS/DweyDBYis+T1gfXpVp/4/Rl8NQC4Z1V5JgJYup+iTul3IPHdLH63qhbms1WTOj
         ky8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=5r8583vtzN/Q9VqaaI0t1S8UF0Nx/KunJYqUvCM0flE=;
        fh=0iqoBJlOrkZ2+Jga7DlN61sJI371FuApCqqkKjY4ing=;
        b=rDXG0pYf8kF3mJm3+mXve+RJcrUc3kvL1y0vi+ZpLnXyeRM4/jkv5lq0cUHLGxJwDx
         I4SAx0G6XtPaGFKctmtCkCYURZraM0kLXJINMLTTwDnAHe4WXpVT7LUJrOJT511q0C3b
         i38svp4MT9pZvqc5TpAOBYMMV8380gJ9LohD7HdhogWHVzZhmJZ1Yydfs3YRFlLTo2bi
         cWJ4uXAR0rtGRBwVx1AvSgDPPwxMcu6CIDJszLjgT+4P4wQqmGdZw57KG5iMDZ5Wsqqv
         zo02Q8/B1Ik5ZB4LdWuq+gcri0IIgFkgesJ4XFpoT5tCJWSTmM5O2qGXkC01jyX8WRUG
         phKQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791810280; x=1792415080; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5r8583vtzN/Q9VqaaI0t1S8UF0Nx/KunJYqUvCM0flE=;
        b=ft7GoJY7WgiZejNtiWiDAbYjFSIeKxp4s96VdtvrEQM5mYmkRGSvLyUvtNb3RVrz5O
         EU2ZJN5VNnXGXNYx9paaigMr0A60TNTYuoc5e1Ez2hxpnZJrptlJmJ30A7foCkFvdhBp
         4bCnYW7TPDelSz4XXtxtCp+knrOm4zoQacvoNwgSOeO05/zo7Jl1m1D8RkvXv4C3/t3q
         4V2vxDZjxcli+1xcGWo307LfQthinaCfylpFJio0tc2gftAEqvanHfg/XoR2o/mUVa2c
         nMmN6CW96O8xYErXmnlLx7E2iF03a8OVBjQIXTZZTxHksRst833hjI84TKUFGyCewkAG
         +2/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791810280; x=1792415080;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=5r8583vtzN/Q9VqaaI0t1S8UF0Nx/KunJYqUvCM0flE=;
        b=ZAxJWLifHtJGvOmyy4YTELts5ScQdurjr1O0jO7DoTGGimsKhMqJ9vmLaA1oyq4ZKQ
         xcngXrulpMOKtVDN53a2i+EZLgPwrHnrRQ4VjhZarDBlnBGzgYdXeK1up3vdHVSJshUu
         Bl/QwCXFF+sIQRAS9vyPSSBAMhZn7GJ1Pv5mmSvkGg+TuOhE+0Ln11xQ6mXmkndBYl+m
         SUeudDB94/10WVZ93V0cPcRH5O1gdPjoTncm1c/0EQBaglYBxH0plIaapkcfqTHPSD3K
         Kq1oEkciuKQtcvqRm8SP27fxajBY5yrvjRxhSydvZQsSP1tRqCp38iH+c5HmTsRAz4MD
         lOEA==
X-Gm-Message-State: AFq9FYJNEk2ykRt75RM7dHphLkUmsd9ZiLbnUFN+2mGVvsY3JFVKXIUa
	biKLQVxtVi2Dz5mFpKs+ptElJA732K9c8/e4S6JfMp6Sp4K9knlJT35Luvzf3c9S8ZUu8rRTdS7
	hiOEzg2VryGTB49FK4kOcZQoWktYNfuM=
X-Gm-Gg: AYBFou02tHsZjnOshZ8wtcln/b3Lhy0SLeSMcWO2k4UkpFhjCE2qkgTRmOkxuwvj7PJ
	qgGEU1Tm2tHLT+62udpSyuDZxQ60eb+0aLaknNkFceDE6ehyweLr5ARBDM30nQkH0w1p4ynfpro
	8ScL0i83CglgmUSsPfvod2EqbejKcPA8sJYoHqvRxdN4BbfXsGWERme8vfDcDejGPrAFAjU0ymd
	l1C7C0yznJO7OKduORn514bmrtKvLY1lcn+Xrt9CmCOdH0vR0UpAoCPEBUNCBtyKALVlGQEOVS4
	BfxjLbROBYckRYFZ4GYiv2HmUjZAYikFfV7ZdyKBEvpU3WegTOYEL0xvVvXoVCu62RAbqNPzv/x
	r6X0gjoif3EWwlg==
X-Received: by 2002:a05:620a:a0d2:20b0:93e:c12c:f144 with SMTP id
 af79cd13be357-93ec12d0787mr1030500385a.78.1791810279472; Mon, 12 Oct 2026
 06:04:39 -0700 (PDT)
MIME-Version: 1.0
References: <20261010113029.2347847-1-ecordonnier@snap.com>
In-Reply-To: <20261010113029.2347847-1-ecordonnier@snap.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 12 Oct 2026 15:04:27 +0200
X-Gm-Features: AclHuK8x3ivb5mVqQzYFpxf6kgYaO7xh5Mk4Y6RWPUuN5gyWfMYDzICg6ky3JlM
Message-ID: <CANNYZj9kcJ+_Q8gEtmLYqKjwLsHogY1o4b8MeZQf6jTgDp3gtg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] uutils-coreutils: move from meta-openembedded
To: ecordonnier@snap.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000368ae3065da4575b"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Oct 2026 13:04:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247643

--000000000000368ae3065da4575b
Content-Type: text/plain; charset="UTF-8"

On Sat, 10 Oct 2026 at 13:30, Etienne Cordonnier via lists.openembedded.org
<ecordonnier=snap.com@lists.openembedded.org> wrote:

>
> uutils-coreutils, the Rust reimplementation of GNU coreutils, is mature
> enough for production use, so move the recipe from meta-oe to oe-core.
> It provides and rprovides coreutils, and is excluded from world unless
> selected as the coreutils provider.
>

This needs a bit more justification. What is achieved by moving it to core?
What specifically makes this component mature enough? What tests were
performed with it? Does it pass the full autobuilder matrix when selected
as coreutiuls provider? Should we add that test to the autobuilder? Should
we make uutils-coreutils the default choice, or maybe the only choice? Does
it work as a provider of coreutils-native, and is it compatible with pseudo?

Adding things to core has a pretty high bar, and the above commit message
does not meet it.

Alex

--000000000000368ae3065da4575b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote gmail_quote_container"><div dir=
=3D"ltr" class=3D"gmail_attr">On Sat, 10 Oct 2026 at 13:30, Etienne Cordonn=
ier via <a href=3D"http://lists.openembedded.org">lists.openembedded.org</a=
> &lt;ecordonnier=3D<a href=3D"mailto:snap.com@lists.openembedded.org">snap=
.com@lists.openembedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex"><br>
uutils-coreutils, the Rust reimplementation of GNU coreutils, is mature<br>
enough for production use, so move the recipe from meta-oe to oe-core.<br>
It provides and rprovides coreutils, and is excluded from world unless<br>
selected as the coreutils provider.<br></blockquote><div><br></div><div>Thi=
s needs a bit more justification. What is achieved by moving it to core? Wh=
at specifically makes this component mature enough? What tests were perform=
ed with it? Does it pass the full autobuilder matrix when selected as coreu=
tiuls provider? Should we add that test to the autobuilder? Should we make =
uutils-coreutils the default choice, or maybe the only choice? Does it work=
 as a provider of coreutils-native, and is it compatible with pseudo?</div>=
<div><br></div><div>Adding things to core has a pretty high bar, and the ab=
ove commit message does not meet it.</div><div><br></div><div>Alex</div></d=
iv></div>

--000000000000368ae3065da4575b--

