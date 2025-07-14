Return-Path: <vince@underview.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BC1DC83F17
	for <webhook@archiver.kernel.org>; Mon, 14 Jul 2025 17:50:44 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web10.84645.1752515435545698467
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Jul 2025 10:50:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@underview.tech header.s=google header.b=OdUEJfVj;
 spf=pass (domain: underview.tech, ip: 209.85.221.51, mailfrom: vince@underview.tech)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3a4fb9c2436so2778809f8f.1
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Jul 2025 10:50:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=underview.tech; s=google; t=1752515434; x=1753120234; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Kejs+TiRL8XOTUN4Hh4THjFyY4mFgujzf76aV5pZRXc=;
        b=OdUEJfVjD8NHStvgHJe/2WxoefPAaWrmkvrUEqRbD8cOVJNM1zI3OsOC8HsW+h0a8u
         a9mCS5NrBjoI2Azwyd0QkFb+LWADiAR7W0TU2dnNQoA8KPMXHvWfL9elh7QIdI5NPo85
         XL/AXPrDOlf7qG2r/YvbPOTnkNSi33KxxjMthgeFrUGCqfLTaw4VBp8kuYEC4RDm/Fjy
         WvGIGXibd68CvCGHI2j05qkT/hG+XCRDXnn6jw6lhh1k8qAwhR4U54aJGcM504DdKK+J
         iJcCjYz3WeY5IBO/FjWHKHjUvwKsKKj0gq+x75XKWpRWbDmx6zYDhmVmWmcKBWT7tmth
         4JwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752515434; x=1753120234;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Kejs+TiRL8XOTUN4Hh4THjFyY4mFgujzf76aV5pZRXc=;
        b=sFxaqJrcKbCJABMoh34u4o2BbIMy//a1SWttC2EWWpqp/+M2Uk5NTriq9rjesVQDqI
         iDx+Po9qO5JoPF57S7OeStkqTB74BDYSd+2yDPVH7CtuAc7OyNH/LslqkSELw3sRTPOp
         1kOg6D2N7u3nV1lZqEycYoYdK7AfBobsMg5SVOm8fTnuX8DCYrDWivSYLKTrx1slTihz
         N705wpYi3IENF+IgKha6tpEuvPvL+La++CP0D8AnT4EpkuQ0RfzppyezncQTX8vqddz0
         2rRu0vte40Sl7pj02poA7g7TtKxCsVW5Kg/wyt5og7XhsImauUUoppAZz81fuQJjo/Wf
         J5gA==
X-Gm-Message-State: AOJu0Yx1OvblAMXI44T+V6W3YVI6lmoIm10QUWXWoZkgWPXqnvVtoutD
	XLc41XXPU6YtYm1HpSs9oQ5u4Cpx0yvMzEEofxNxS8pLx3j3yLT2kQOlZ3n8+9ncC9yhbboATlv
	Uw9yfVVDU4oKb/IURw3DSN8Edwqi0Y66wTY6IMaJftQ==
X-Gm-Gg: ASbGncsveGU+GJvIxxC20ft0f2LuljEvUS4DbjxysecYJLLXBBKJA2ooZOuD2B0d2RC
	LunjoDHxVrnnDQzvc485lp7ZCFHi29d7H7B/eilNpYJxeZyAaHLEX+vOkr1IpOebsRJUifBwOuu
	yA2utwe8PCqghebIkM6u0zRxQzLRGpIKbvNo3CbjIYMhgiZzT+xgt1VoGB08A5XqRPDB6cMCaza
	a2z1067nGJAHMM=
X-Google-Smtp-Source: AGHT+IE+C0+uIKt+irvfZ7hrvTrZCa7fEUNFcTikOiAYcK/DLjVWxUE1tulinrg02ljW+RXktjDAiTf7OSf0mC5ySZk=
X-Received: by 2002:adf:cc0c:0:b0:3b5:f168:5e60 with SMTP id
 ffacd0b85a97d-3b5f1880e73mr9153278f8f.19.1752515433781; Mon, 14 Jul 2025
 10:50:33 -0700 (PDT)
MIME-Version: 1.0
References: <20250714020900.1240597-1-vince@underview.tech>
 <CANNYZj_xp7_QMttJ3cjRnfErXoKvuQ-SR4kErQMu_XvAGPdHoQ@mail.gmail.com>
 <CAPQx_gNG3kum-xKnbAazGxC8U7-2-M6mh+g6BbeRkDWVqK2nZg@mail.gmail.com> <CANNYZj_OrTfY6m394mopWscAXe9TXKWnnhHaJ+ry+n4NZraTkQ@mail.gmail.com>
In-Reply-To: <CANNYZj_OrTfY6m394mopWscAXe9TXKWnnhHaJ+ry+n4NZraTkQ@mail.gmail.com>
From: Vincent Davis <vince@underview.tech>
Date: Mon, 14 Jul 2025 13:50:22 -0400
X-Gm-Features: Ac12FXw9UBb1hovhDSknCwqV6r6Is-nUJBPaGUkgpCP6KocyIJvQcN-RpxccPuU
Message-ID: <CAPQx_gOsBAxhwv-+Vfw+5K4ncze2OuPMRmncY0k2YdSH924XQg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] grub_install: add new wics plugin
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000e4ef530639e74bd4"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Jul 2025 17:50:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220258

--000000000000e4ef530639e74bd4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

That's, probably the better route.

Okay will look into how I can integrate some of grub_install into currently
existing plug-ins.

With tests.

On Mon, Jul 14, 2025, 11:12=E2=80=AFAM Alexander Kanavin <alex.kanavin@gmai=
l.com>
wrote:

> On Mon, 14 Jul 2025 at 17:05, Vincent Davis <vince@underview.tech> wrote:
> > Examples and usage may be found in comments under class declaration. Ar=
e
> they sufficient?
> >
> > Will add more comments and move example comments to top of file.
> >
> > Per what I understand from GPT partition table format. If you want to
> hybrid boot you have to create a separate bios_boot partition to store
> core.img.
> >
> > I haven't tested this, but it appears bootimg_biosplusefi.py only
> accounts for MBR partition table format. grub_install accounts for both G=
PT
> and MBR. Hybrid or non-hybrid boot.
>
> Without tests this is still not acceptable.
>
> Generally, I would much rather see existing plugins improved, rather
> than have multiple plugins (and only some of them tested) with
> overlapping functionality and features.
>
> Alex
>

--000000000000e4ef530639e74bd4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div dir=3D"auto">That&#39;s, probably the better route.<=
/div><div dir=3D"auto"><br></div><div dir=3D"auto">Okay will look into how =
I can integrate some of grub_install into currently existing plug-ins.</div=
><div dir=3D"auto"><br></div><div dir=3D"auto">With tests.</div></div><br><=
div class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"g=
mail_attr">On Mon, Jul 14, 2025, 11:12=E2=80=AFAM Alexander Kanavin &lt;<a =
href=3D"mailto:alex.kanavin@gmail.com">alex.kanavin@gmail.com</a>&gt; wrote=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bor=
der-left:1px #ccc solid;padding-left:1ex">On Mon, 14 Jul 2025 at 17:05, Vin=
cent Davis &lt;vince@underview.tech&gt; wrote:<br>
&gt; Examples and usage may be found in comments under class declaration. A=
re they sufficient?<br>
&gt;<br>
&gt; Will add more comments and move example comments to top of file.<br>
&gt;<br>
&gt; Per what I understand from GPT partition table format. If you want to =
hybrid boot you have to create a separate bios_boot partition to store core=
.img.<br>
&gt;<br>
&gt; I haven&#39;t tested this, but it appears bootimg_biosplusefi.py only =
accounts for MBR partition table format. grub_install accounts for both GPT=
 and MBR. Hybrid or non-hybrid boot.<br>
<br>
Without tests this is still not acceptable.<br>
<br>
Generally, I would much rather see existing plugins improved, rather<br>
than have multiple plugins (and only some of them tested) with<br>
overlapping functionality and features.<br>
<br>
Alex<br>
</blockquote></div>

--000000000000e4ef530639e74bd4--

