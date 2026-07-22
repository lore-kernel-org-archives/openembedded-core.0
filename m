Return-Path: <emailaddress.ashish@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D48F4C44539
	for <webhook@archiver.kernel.org>; Wed, 22 Jul 2026 12:26:03 +0000 (UTC)
Received: from mail-yx1-f51.google.com (mail-yx1-f51.google.com [74.125.224.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.46702.1784723154968535392
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jul 2026 05:25:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=XFMA3WDW;
 spf=pass (domain: gmail.com, ip: 74.125.224.51, mailfrom: emailaddress.ashish@gmail.com)
Received: by mail-yx1-f51.google.com with SMTP id 956f58d0204a3-664c6304683so7363456d50.2
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 05:25:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784723154; cv=none;
        d=google.com; s=arc-20260327;
        b=cQ05J/6CSCDod5C31boIv2cRlArEDy5PZ8l7DdI3TrDzui7QashgPN6fjP+VSODZ/Q
         gKYrl2tjezzIgMDmNJ8+2uYozA63Wyy0FD/N7QrxVQFmv+lvvSfdN+UbwAPbq0O1yoNY
         I73vZX30f02iBZL3mx/kyuC1W4PPMb8dBdcX1sod904mfzSbecfxa0pnmZdCokwKOT2h
         hHcOz1fGZ0gnH78bKHLpXd/bRLooJyL8oaCEH6J0bPdSQ/Vm+W9bdJBvLqMLCG+RArCW
         mpsjoCQ5aqD5j5ZY1LLrhROCt8PbiAZIbV9ew2Lo5DLX+xeSnrbaAtR3U0ZO5UKnAmrc
         nNdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=783/oCdRKfZ76hRMV3UFn3qEW6Ly8Je7uX7cT5z/+II=;
        fh=w283Fqx70AgY5BUX46GozZd2SM/7JmiLEqcLp/9K+vU=;
        b=MYBJLveKKCJd3x57t/LC06+N1GNRajOPMfO9ODfs/QPp5+AOhkiKvMYJdw9Swd8/v0
         sfjzAZIN/mrTaN6hyFZsTLOYmr/ymbkelk8VMbBLm/l8rXfBSalalpwko47Ap5i2Emn1
         lGa6yduJL30ELlBuvqh75X112SUFUlB5SkEBDqVICATMBhx35dxNdUVT116V+PIf8NXX
         1QJrVMUVxDI75MgVOkgRbWWVyGHDI1b1u3124Z15Xd32R/PiCmCJbNMknJFVyJaPXbu9
         JZ/IlTzCIXHnn8zZsdYAo6vPYF5NquQWjtdZuc52f/7vHMqO0baaC0eCd/Hymff6SASs
         xvoA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784723154; x=1785327954; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=783/oCdRKfZ76hRMV3UFn3qEW6Ly8Je7uX7cT5z/+II=;
        b=XFMA3WDW7o0NBzshOl1Z/bRrbbYmSDIAsyvu2fO2SjZDe7SwgzYgldhs4YByWpfU8N
         0tXbKvwya4MFCUHfvI30G5rtb33lXB10hCj0s9qc6PFeEm6Xhsg1vVxmgvq3aqCZbVV2
         jksQVofB9tgbflUmLHec7RkdpP+v0D/jHLiyGPHtL/kuFwQyguHLH83ILV8NgZ/3/1B8
         JtRSBoR1FJW3/fJGsnm+U+vto9Q569iPBWg8FV9nuetwr3BBwyurvBE7EQb0Qv77D1bZ
         sPHfYziAcrUiSJgBUmbwyM/u68WZjJYd7XdXvleMAKJj0BnA3C8EmnW1SeplPmBnTvP7
         rrzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784723154; x=1785327954;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=783/oCdRKfZ76hRMV3UFn3qEW6Ly8Je7uX7cT5z/+II=;
        b=b5Qn+omVqIlftNDqwMPBLieHeMH7Ylv1DIA9U13zMiNBI7aHhfi512X9XOvOX8ncL0
         Ou5iEAEmtsGjEygTuI2l+dKhmvlQq7e9uAqHMkyx3CxwcFMOkJd7GHe5T2qYfpT/JuX5
         7uMgQSzKl+gq6Mk6nSvHZxdzU4BDSosNKdw2fte1c0jWph+4Tey372Yvt/UyYyZUEQVV
         /UnRgBH4xAwNMivrnm9Yaaj4NZO1Ri7QeKdduZBNJM7H30vuIVAE9mE1amsXPkL7/oQL
         +vK5efMOjuw5R0G17Sv2xtDaUGXOLAD9vphFPZckA62hMRaru9uKujku6KnEJwtPGpO4
         8GaA==
X-Forwarded-Encrypted: i=1; AHgh+RotcbwvG4H/96F1rb+7ceRuQDyT9sANOQG9nmX4Xxs+Vgud53o197hegwB+UotidW+wGEbnScJQBqUDTwEnBvPajg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyvYPPeVinyNvS7lTXqkxCCxAeyd5sMWhafnydrZTIixqONeZGw
	ebUh5Z17NLhObMNHJKKzhCzD7iQ/pddFrCzKoBQklZCny7CzM0KG/UqZVqsC7VXkZCMj6idxJd5
	aJqAKICdCLynQM5F2REjrnRt8COiEQNk=
X-Gm-Gg: AR+sD10WVuCljC3txjp2BhnkNHOKAtT+lbQmT+BDdiHtlAXzF9pvXtjtiQY7Td3gluy
	zI4dvyetoZyNVS4tFnB88bQSZW7rwgJhpvlXQ7k82+xLmbIdQQ9SJPFU9Eo1G4W+/Yk+pH5PNJO
	wmROBXNQkHz+9QV7UNziwIwIoFH4JaETw3zmz0mQ39wz2/8hWkn5qyF4IbRnLfEyTRWOfGac1s5
	kvt0hBWGAspj1fcYYh9od4SZpZqCoH/xFTp07JZ6edbcT5nuaQAH9WQRuHq6qzHeWmaobGRMnte
	6UurMgpB5yhK3/dChGE=
X-Received: by 2002:a05:690e:454f:20b0:667:e855:ecdb with SMTP id
 956f58d0204a3-6683bb2e3a5mr4695310d50.3.1784723154006; Wed, 22 Jul 2026
 05:25:54 -0700 (PDT)
MIME-Version: 1.0
References: <20260722121119.888611-1-emailaddress.ashish@gmail.com>
 <978937.1784722525653637859@lists.openembedded.org> <DK53FLV3KVRE.3GAZN2WD4XNY9@smile.fr>
In-Reply-To: <DK53FLV3KVRE.3GAZN2WD4XNY9@smile.fr>
From: Ashish Mishra <emailaddress.ashish@gmail.com>
Date: Wed, 22 Jul 2026 17:55:41 +0530
X-Gm-Features: AUfX_myWHi4N1nJETh2NjqAGtO9UL2F3dDE3C5I0W6hdTTGsMDwgU06WMOlt97A
Message-ID: <CAE_=ZzEVtYkPzW3F+an=5T7aRA++WsdXEgejrSZ6oX6Dz0xWjg@mail.gmail.com>
Subject: Re: [OE-core] [scarthgap][PATCH] package.bbclass: fix execution order
 bug in emit_pkgdata
To: Yoann Congal <yoann.congal@smile.fr>
Cc: AshishKumar Mishra <ashishkumar.mishra@bmwtechworks.in>, 
	openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000009df7770657323dd4"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 12:26:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241666

--0000000000009df7770657323dd4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Yoann ,

I tested on Scarthgap today and hence shared for it

Will create an patch for Wrynose and share after testing it once.

In meantime, can you please take this in consideration for Scarthgap?
Or as an process i should send Wrynose.

So accordingly from next patch onwards, will follow the same.

Thanks ,
Ashish


On Wed, Jul 22, 2026, 5:50=E2=80=AFPM Yoann Congal via lists.openembedded.o=
rg
<yoann.congal=3Dsmile.fr@lists.openembedded.org> wrote:

> On Wed Jul 22, 2026 at 2:15 PM CEST, AshishKumar Mishra via
> lists.openembedded.org wrote:
> > Hi Yoann ,
> >
> > This is an bug fix patch which fixes the emit_pkgdata order
> > The same have been merged in master at
> https://git.openembedded.org/openembedded-core-contrib/commit/?h=3Dross/w=
ip/nasm&id=3Daa85baff9ebdd3f932811c3b43d1918c38373cb9
> >
> > Request to take this patch in scarthgap
>
> Hello,
>
> This also need backporting to wrynose, right?
> If that's the case, please send a cherry-pick request (if trivial) or a
> backported patch.
>
> Thanks!
> --
> Yoann Congal
> Smile ECS
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#241665):
> https://lists.openembedded.org/g/openembedded-core/message/241665
> Mute This Topic: https://lists.openembedded.org/mt/120392420/1334323
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> emailaddress.ashish@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000009df7770657323dd4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Hi Yoann ,<div dir=3D"auto"><br><div dir=3D"auto">I teste=
d on Scarthgap today and hence shared for it=C2=A0</div><div dir=3D"auto"><=
br></div><div dir=3D"auto">Will create an patch for Wrynose and share after=
 testing it once.</div><div dir=3D"auto"><br></div><div dir=3D"auto">In mea=
ntime, can you please take this in consideration for Scarthgap?</div><div d=
ir=3D"auto">Or as an process i should send Wrynose.</div><div dir=3D"auto">=
<br></div><div dir=3D"auto">So accordingly from next patch onwards, will fo=
llow the=C2=A0same.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Than=
ks ,=C2=A0</div><div dir=3D"auto">Ashish=C2=A0</div><div dir=3D"auto"><br><=
/div></div></div><br><div class=3D"gmail_quote gmail_quote_container"><div =
dir=3D"ltr" class=3D"gmail_attr">On Wed, Jul 22, 2026, 5:50=E2=80=AFPM Yoan=
n Congal via <a href=3D"http://lists.openembedded.org">lists.openembedded.o=
rg</a> &lt;yoann.congal=3D<a href=3D"mailto:smile.fr@lists.openembedded.org=
">smile.fr@lists.openembedded.org</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex">On Wed Jul 22, 2026 at 2:15 PM CEST, AshishKumar Mishra via <=
a href=3D"http://lists.openembedded.org" rel=3D"noreferrer noreferrer" targ=
et=3D"_blank">lists.openembedded.org</a> wrote:<br>
&gt; Hi Yoann ,<br>
&gt;<br>
&gt; This is an bug fix patch which fixes the emit_pkgdata order<br>
&gt; The same have been merged in master at <a href=3D"https://git.openembe=
dded.org/openembedded-core-contrib/commit/?h=3Dross/wip/nasm&amp;id=3Daa85b=
aff9ebdd3f932811c3b43d1918c38373cb9" rel=3D"noreferrer noreferrer" target=
=3D"_blank">https://git.openembedded.org/openembedded-core-contrib/commit/?=
h=3Dross/wip/nasm&amp;id=3Daa85baff9ebdd3f932811c3b43d1918c38373cb9</a><br>
&gt;<br>
&gt; Request to take this patch in scarthgap<br>
<br>
Hello,<br>
<br>
This also need backporting to wrynose, right?<br>
If that&#39;s the case, please send a cherry-pick request (if trivial) or a=
<br>
backported patch.<br>
<br>
Thanks!<br>
-- <br>
Yoann Congal<br>
Smile ECS<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#241665): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/241665" rel=3D"noreferrer noreferrer" target=3D"_bl=
ank">https://lists.openembedded.org/g/openembedded-core/message/241665</a><=
br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/120392420/133=
4323" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.openemb=
edded.org/mt/120392420/1334323</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank" rel=3D"noreferrer">openembedded-core+owner@lists.op=
enembedded.org</a><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.openem=
bedded.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:emailaddress.as=
hish@gmail.com" target=3D"_blank" rel=3D"noreferrer">emailaddress.ashish@gm=
ail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--0000000000009df7770657323dd4--

