Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 263EBCD6E6B
	for <webhook@archiver.kernel.org>; Fri,  5 Jun 2026 07:02:50 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2321.1780639440620257870
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Jun 2026 23:04:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=owQ89Qao;
 spf=pass (domain: gmail.com, ip: 209.85.218.52, mailfrom: adityags2004@gmail.com)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-beb7f26ed62so164286666b.0
        for <openembedded-core@lists.openembedded.org>; Thu, 04 Jun 2026 23:04:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780639439; cv=none;
        d=google.com; s=arc-20240605;
        b=Qqy5ftMHDczvCr96RkLR9j8HVF71pvoD641c1NfIwNR3ghe1pubtAX2NNmbGjQTbdj
         6rYnEKX7xdGpnXipEPePwXmkOn6uMJyF7uAbFIjeJ7N07Ff5XE8ZCeIlHhCf2iIAA20l
         wtRaudF2ysjpTyOcGF7HTur4VzNHZPt+sbcmWJ2ikDuMt4e5wf4VQTgDoSquaxJgpQ9A
         op/mPhsCL1NRDY5TsT+s81PIg4yvXDIby5rSfXGWdu6WEiyj3Px9e3zRNjJfka/ZL/j6
         U+619r1MRUhOTamHqX5MGt56acfE+ahlNtJfeWsMHzz7N/FAkqiA171reHphV/Wey/tC
         TNVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=JfpOyutprif6z9ywgyjddjBRgXjwoYHFrbEN2EIHQC0=;
        fh=7T5fgh5iWnve6c6Qn2vGdyJAqFFyjwQqYCBWNb2ZoRc=;
        b=X/qOSlWQYkNE5/dt2rE3epaS3d5nc2DxgQyJ3YXtfRezem7Yc/CL8Q+pIZuvW/ZM2w
         t9yN3xAaHdxhShsKhb8rt/U6m6WMhX2u3lyRFA6xmhJBJ+WWnn8+NxL6Q8zBOGXJKgI/
         DFHck9N3LzhjLnUvagLx2t2mpAKBk7oSPLMMtXJLIP4Hi+JqvWHQdqp+nqbg3rm829HI
         tudg67B7xWSm/KIkFJaj7/3zD5msmCszzYxTKVG4ymOX7OedFE5T4VllS0cTyq8HqK76
         izFtyEptFj4yXZcNlZhtT0KSPenaBZ3jr/N24qNfHzcLgFXb1eI8s7h92BaH9p2kZ+ZC
         YIoQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780639439; x=1781244239; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=JfpOyutprif6z9ywgyjddjBRgXjwoYHFrbEN2EIHQC0=;
        b=owQ89Qao/j/cd41ttzKGUgIjOTxZvb+RIbf7cTc+sSBPpsd7oY0vIYOqQrqLgdS7Fh
         2KJpLTZJXeU23RYVEn0AKKet48cXrOT+ovXagBhnkktRhweRoYgnb0HbSWzHBSOKGURX
         xZE3hZxGg3RFUY6YAIz+g9nD1GHEmvckEq4jx71kVwbNdhK4hmdKIJGstgPSUKZUDViC
         OSvPEW6EhUj02O/AgKnBDa17PUTmSWXFKdXqxVCQRyUtDnrgjXbj2cFtZnjEBZ7v0vZ+
         /ct4daz4wWyPpR/Jh+2aM5ygccE1b0Z5OMWnI8H0uEzGr/ATYWawh+Vra82D5V63K9bj
         A9cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780639439; x=1781244239;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JfpOyutprif6z9ywgyjddjBRgXjwoYHFrbEN2EIHQC0=;
        b=BGMZCgdJAM60BBzdlk3XrxlztZb5yuYyJ3NcKTlfPW2Ro6FFrsAYGtqg5Fhy/pN22l
         ln6L24tnyvatW13A2wkDzYSq/Cat1lNeh0EqtrO3le5IZBt7+qS6Hw2SRL7pRcm9etWw
         G1WA3AyCS5qkt2keeJs6+iR0x627djRlAxURt1btXjqYT0Ni8cgEAT54ESrJfYY+8VUO
         pAM6ZRjLUGfWKLbnblgBEYn3BOpVI22wKSzlagKSg3wM7pNh8Vcr+IC+eAnoM7+eoS7C
         MB2YXtlJ2VTJ/Xh726gFaIzN7bpM0ZlrvNE5RlVH7nb/gIHnaqDRl+h0jx8Djw9h+MBl
         ASsQ==
X-Gm-Message-State: AOJu0YzZ75gD3K6ZMj45L0kKpuZizy0g4Y/+g7qL2/YCdOwNt9iJbDgX
	rGIkzyxWmUsScRabjjQIlATzX25rQtOjiDmu+xK9rKpusVheAY7obn5gp0XOyKec5bNOBxdOB+i
	VJKCT5Bt1TZJ9GaZbLqsbk+sX4nhuQ3eS9g==
X-Gm-Gg: Acq92OFOz8tZOZI1Grrezh9YV6tUsswtyr+TuDVBEt0x9Q1EJCEvOXsKk1wUaTc/rek
	1baRDR8nZD/VXzdXwFnLNgA4Ubc83YxAbDTB4FSB0KOvdPYXfuQgQlNHYHEAG3JLsSJTTDhOyyM
	+OBkDmxrS8kE2TkIQEYSWTf9Sh49TixA0FiPlI/pGN1l2zQAKNEHn8F/YiBUFqQ2HoFXJ5kRL3X
	HAo5xQp3/czaifGABJd1UjEd7n2BZ+s4SINrdDrYH3tz+71flmA4ZBTGndvtYFu5EIgQGwueqzZ
	zEPXgOVeZiaKepT/pe7yZhf1xvJNy/Fl+iR0kaMlRnSkluBWJ/5waiJoq/zh9rUzYBqzbb8mBlx
	wlSsjwQ==
X-Received: by 2002:a2e:be12:0:b0:396:668f:b7f9 with SMTP id
 38308e7fff4ca-396d097b35cmr4766021fa.24.1780638964716; Thu, 04 Jun 2026
 22:56:04 -0700 (PDT)
MIME-Version: 1.0
References: <20260601082006.1496-1-adityags2004@gmail.com> <CANNYZj_V6GeZKVTpwaikLgeFO3h-9jVQwbM0Yj2Eyp8MWxED8A@mail.gmail.com>
In-Reply-To: <CANNYZj_V6GeZKVTpwaikLgeFO3h-9jVQwbM0Yj2Eyp8MWxED8A@mail.gmail.com>
From: "Aditya G.S" <adityags2004@gmail.com>
Date: Fri, 5 Jun 2026 11:25:52 +0530
X-Gm-Features: AVHnY4LJoWyWQJ-6hOw10ZG8Z_en4zL5xzWTFZd0k-6ulhE9Hw2POKGVqlLYKEQ
Message-ID: <CAHaUZZCPhRWKUoG+-DiTMXMdYvN3B8mv9as-0uXbAJnkt+-JQA@mail.gmail.com>
Subject: Re: [PATCH] gawk: improve randtest stability
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, joaomarcos.costa@bootlin.com, 
	ross.burton@arm.com, randy.macleod@windriver.com
Content-Type: multipart/alternative; boundary="000000000000f719d606537b5091"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Jun 2026 07:02:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238144

--000000000000f719d606537b5091
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Alex,

Thanks for the feedback.

You're right I had mistakenly included the earlier test-disabling patch in
the submission.

I've now removed it and ensured that only the upstream backport fix is
included with the correct metadata.

Resending.

Thanks,
Aditya

On Mon, Jun 1, 2026, 2:14=E2=80=AFPM Alexander Kanavin <alex.kanavin@gmail.=
com>
wrote:

> On Mon, 1 Jun 2026 at 10:20, Aditya GS <adityags2004@gmail.com> wrote:
> > +++
> b/meta/recipes-extended/gawk/0001-gawk-disable-randtest-in-ptest.patch
> > +          file://randtest-fix.patch \
>
> The filenames do not match. How was this tested?
>
> Also the patch content isn't a backport, but an earlier test disabling fi=
x.
>
> I'd suggest you run 'git format-patch' before 'git send-email' so you
> can inspect what is going to be sent, and to avoid mistakes like this.
>
> Alex
>

--000000000000f719d606537b5091
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Hi Alex,<div dir=3D"auto"><br></div><div dir=3D"auto">Tha=
nks for the feedback.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Yo=
u&#39;re right I had mistakenly included the earlier test-disabling patch i=
n the submission.</div><div dir=3D"auto"><br></div><div dir=3D"auto">I&#39;=
ve now removed it and ensured that only the upstream backport fix is includ=
ed with the correct metadata.</div><div dir=3D"auto"><br></div><div dir=3D"=
auto">Resending.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Thanks,=
</div><div dir=3D"auto">Aditya</div></div><br><div class=3D"gmail_quote gma=
il_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Jun 1, 20=
26, 2:14=E2=80=AFPM Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gm=
ail.com">alex.kanavin@gmail.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex">On Mon, 1 Jun 2026 at 10:20, Aditya GS &lt;<a href=3D"mailto:=
adityags2004@gmail.com" target=3D"_blank" rel=3D"noreferrer">adityags2004@g=
mail.com</a>&gt; wrote:<br>
&gt; +++ b/meta/recipes-extended/gawk/0001-gawk-disable-randtest-in-ptest.p=
atch<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://randtest-fix.patch \<br>
<br>
The filenames do not match. How was this tested?<br>
<br>
Also the patch content isn&#39;t a backport, but an earlier test disabling =
fix.<br>
<br>
I&#39;d suggest you run &#39;git format-patch&#39; before &#39;git send-ema=
il&#39; so you<br>
can inspect what is going to be sent, and to avoid mistakes like this.<br>
<br>
Alex<br>
</blockquote></div>

--000000000000f719d606537b5091--

