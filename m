Return-Path: <bbnpreetsingh@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C27DEC43458
	for <webhook@archiver.kernel.org>; Tue, 14 Jul 2026 02:32:59 +0000 (UTC)
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1780.1783996378933152444
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Jul 2026 19:32:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=epand3vy;
 spf=pass (domain: gmail.com, ip: 209.85.217.44, mailfrom: bbnpreetsingh@gmail.com)
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-73a75f251a7so171739137.2
        for <openembedded-core@lists.openembedded.org>; Mon, 13 Jul 2026 19:32:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783996378; cv=none;
        d=google.com; s=arc-20260327;
        b=NVtYDMC7HRVN9h9ePzqMWslUCwKiAy8LNfUz4h9FtBZxf7jbULAsHht2c3cZOtOzPu
         D3LRELCLiI2TVSZ42D5aVXpORtaU2fJb8osXxxjT8uU/2K6I0gpyqbHCvMmDY0Ybovmg
         K0IcbhYmWPLMDf5kUq69qc+mQU3J86Nx4VECMZqVPcCTSlCu/4dwlSCb2/6q7Sh1VRJh
         RL0TtqZAH+5Cbz/wKHST8gE+euI0OwagUUI7RXKy86/axyE5LKYmzcjz3C+WsTaB7ZNs
         HpUOCkLZK3HftAaWVWM3gwc+0J8hO8SYxA0Zb165d7Qig7opKKoRnSe/EVv4S8XI3VXs
         u2SQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=I6K0vmkHJ36rHnZKXjgHxhgud21grlgcrq0Xy6QXZeQ=;
        fh=0iOvx24T4W4BAkxgDPen1tvkO9qfN/+STK4hokwhLsc=;
        b=DixL8tWUJDASiXsoi9kekB5NOp0E6CmeAOtCnPwh87pgfvVIGJXK6RZp0A7WhAi0b3
         v+7ykteZ9DD3rJt3DKG6AUaRej3Vjdhyy6OmUJy2o6GCxTjJ6KhVOdbPZ08wNTrcLeeR
         FaZRF641Dr1ME5ZXpA/XGRLFzyzUW37IIsFBgmn9Ej78xh1FzfN8U7VE4H2xQexwnFuJ
         kXr0BpfsgXwpfYTwMRIJlMYGn7wE9sI5bqD+rdR1gGP9zzPcuS84IVxOEoo6guxIqyjo
         a9aC40iTlq2iIjPlnrxAlRnSRAb4q4kK08AItHsCCGxvSbzVrgXao3/DFHtO7YfVOp9v
         Lpjg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783996378; x=1784601178; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I6K0vmkHJ36rHnZKXjgHxhgud21grlgcrq0Xy6QXZeQ=;
        b=epand3vy+DYZpRJtgwderBeF03sJffAUPyqjl45+91n2cYFPIdvSOvJfQzLRCRxp7p
         SPCl2Dnr2UHjnrI/NRfCNTbZje1gSf++z4aAwFQ/fKThFa6tV4MJDmv5SvfsIbib17YD
         7oMGB4Fc8HzpR4/qql6Mg3oa35oaJ5Zb9U/GYFgdU6o+XzcnfniJA1C+Y1mzht2Wduw5
         9G5m6YNJNem1GYWe0nSVzNz7rBrXTDnP1Ow9k/VZXgIramMrsg7tRK62kTY+3ZhjShNA
         BRPxM/7MsjK+49+oebZdJmZI0+KN1s2Q6vi2xmDmE3/JnpeA0mncDPNzVD2FkR3q6lDK
         sMRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783996378; x=1784601178;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=I6K0vmkHJ36rHnZKXjgHxhgud21grlgcrq0Xy6QXZeQ=;
        b=Z6w4Z4OLHWqFwZQuiJ6OvTM/qlvUopzJsZQyTH2s6oLNzJJZ7jDScFCA08gxFGH3Cd
         3GCPmZ05edb9XTGqIdCmJyuyl4d16Ee5Jq6BCHxvTXiAOPTFUUxF2GQ4d8zj2WqVFvCe
         nmJMqK7sE296b21nvDbwgtvUryA1eUHivv+6jzFluh1yA01OENOdTLuL4en68GMTZm2y
         3TCHvmzoWbFWkyj8CyMO7Gc01IWCPOslsHV6+djzpYQxrLxkW47vpE9YcRudt3qHyIq2
         fv+QenFT57KovdRJHc/9lHy3qckZlgQaTwl2Q/mpw6c/7jOHMNA0lRsehtY4s/IFcXwt
         eMjg==
X-Gm-Message-State: AOJu0Yx39pFzq8dqsPsl0SkabKxrMkxtRemQ6CAcK+YTi4RpoI6agOgN
	vuq4W6fo1AQSNaWNrgqhrCMkomVMoLa3GLfU6/ZHd1orH/gUhV+DOGJTPnEVmtOGxeEKqwyOHmB
	wlqKsNGOJFBXS32RE6gbFrDpSduxy0jo=
X-Gm-Gg: AfdE7ckH7HgnMEIWktTEoZRctlLhO2h6CI9q/ZErqmW8fU8Yk8CqxbtQQ2GJQvaerQz
	efYix5cEqKKH7uIbTapwf+32VhCTrQy13b5E8XTZugruLunggxOqgTwUomewmXK/Fx+jb6UwJDi
	dAwYkgcvA2FO3jUtomOE5fmfOudjEwznAs+EgFqVUmsInkrzLq243DKOUuNkYSLKu3RGcPOjNt4
	eeUn4E+5G9nHQJ0m04f7vfTxBe166yj3nqoaRzdDQrzeBcM/cNxLFEmPoB6TpWl2hmyqkSEJtNp
	UdVFzXNklCB7dOysb+xRxZRORm1Vag==
X-Received: by 2002:a05:6102:5a89:b0:737:ba2e:8a29 with SMTP id
 ada2fe7eead31-74533e6fe9dmr6680350137.27.1783996377789; Mon, 13 Jul 2026
 19:32:57 -0700 (PDT)
MIME-Version: 1.0
References: <20260713060444.7-1-bbnpreetsingh@gmail.com> <20260713060444.7-3-bbnpreetsingh@gmail.com>
 <CANNYZj-i5npSXqmB9S8fnnOeLt5AVr3o5-Pdvs6hBru_x+DwJg@mail.gmail.com>
In-Reply-To: <CANNYZj-i5npSXqmB9S8fnnOeLt5AVr3o5-Pdvs6hBru_x+DwJg@mail.gmail.com>
From: Babanpreet Singh <bbnpreetsingh@gmail.com>
Date: Mon, 13 Jul 2026 19:32:46 -0700
X-Gm-Features: AUfX_mz9V1s0eMDqnhu4gl7fqp-n9CpXVGJHX_c71_uI8_2RMyD8Tv4E5lfzW4s
Message-ID: <CAO8wpHzE-o-ugjY_BdrJv0U=2yNU46QqDun=ekiu5RgJTNR7MQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] oeqa/selftest/devtool: add test for
 finishing a recipe using AUTOREV
To: alex.kanavin@gmail.com
Cc: openembedded-core@lists.openembedded.org, randy.macleod@windriver.com, 
	skandigraun@gmail.com, chris.laplante@agilent.com, 
	adrian.freihofer@siemens.com, pkj@axis.com
Content-Type: multipart/alternative; boundary="00000000000060fa4406568906e1"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Jul 2026 02:32:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240859

--00000000000060fa4406568906e1
Content-Type: text/plain; charset="UTF-8"

On Mon, 13 Jul 2026, Alexander Kanavin <alex.kanavin@gmail.com> wrote:
> There is no need to add a whole new test that largely copy-pastes
> other tests. There is already test_devtool_add_fetch_git(), which adds
> a recipe with AUTOREV, but then runs 'reset' instead of 'finish', so
> that test should instead be adjusted.

Fair point - the add/check portion did duplicate what that test
already does. I'll send a v2 that drops the new test and instead
adjust test_devtool_add_fetch_git().

Thanks for the review,
Baban

On Mon, Jul 13, 2026 06:22 AM, Alexander Kanavin <alex.kanavin@gmail.com>
wrote:

> On Mon, 13 Jul 2026 at 08:04, Baban via lists.openembedded.org
> <bbnpreetsingh=gmail.com@lists.openembedded.org> wrote:
> > AI-Generated: Uses Claude (claude-sonnet-5)
> > +    def test_devtool_add_git_autorev_finish(self):
> > +        # Test that a recipe created by devtool add --autorev can be
> finished
> > +        # into a layer; this used to fail with "fatal: bad revision
> 'AUTOINC'"
> > +        # because the unresolved AUTOREV placeholder was used as the git
> > +        # revision to export patches from [YOCTO #16354]
>
> There is no need to add a whole new test that largely copy-pastes
> other tests. There is already test_devtool_add_fetch_git(), which adds
> a recipe with AUTOREV, but then runs 'reset' instead of 'finish', so
> that test should instead be adjusted.
>
> Alex
>

--00000000000060fa4406568906e1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div dir=3D"auto">On Mon, 13 Jul 2026, Alexander Kana=
vin &lt;<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.ka=
navin@gmail.com</a>&gt; wrote:<br>&gt; There is no need to add a whole new =
test that largely copy-pastes<br>&gt; other tests. There is already test_de=
vtool_add_fetch_git(), which adds<br>&gt; a recipe with AUTOREV, but then r=
uns &#39;reset&#39; instead of &#39;finish&#39;, so<br>&gt; that test shoul=
d instead be adjusted.<br><br>Fair point - the add/check portion did duplic=
ate what that test<br>already does. I&#39;ll send a v2 that drops the new t=
est and instead<br>adjust test_devtool_add_fetch_git().<br><br>Thanks for t=
he review,<br>Baban</div></div></div><br><div class=3D"gmail_extra"><div>On=
 Mon, Jul 13, 2026 06:22 AM, Alexander Kanavin &lt;<a href=3D"mailto:alex.k=
anavin@gmail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt; wrote:<b=
r><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex">On Mon, 13 Jul 2026 at =
08:04, Baban via <a href=3D"http://lists.openembedded.org" rel=3D"noreferre=
r" target=3D"_blank">lists.openembedded.org</a><br>
&lt;bbnpreetsingh=3D<a href=3D"mailto:gmail.com@lists.openembedded.org" tar=
get=3D"_blank">gmail.com@lists.openembedded.org</a>&gt; wrote:<br>
&gt; AI-Generated: Uses Claude (claude-sonnet-5)<br>
&gt; +=C2=A0 =C2=A0 def test_devtool_add_git_autorev_finish(self):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Test that a recipe created by devtool a=
dd --autorev can be finished<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # into a layer; this used to fail with &q=
uot;fatal: bad revision &#39;AUTOINC&#39;&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # because the unresolved AUTOREV placehol=
der was used as the git<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # revision to export patches from [YOCTO =
#16354]<br>
<br>
There is no need to add a whole new test that largely copy-pastes<br>
other tests. There is already test_devtool_add_fetch_git(), which adds<br>
a recipe with AUTOREV, but then runs &#39;reset&#39; instead of &#39;finish=
&#39;, so<br>
that test should instead be adjusted.<br>
<br>
Alex<br>
</blockquote></div></div>

--00000000000060fa4406568906e1--

