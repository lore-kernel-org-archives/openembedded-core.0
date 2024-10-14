Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF229CF2579
	for <webhook@archiver.kernel.org>; Mon, 14 Oct 2024 02:00:30 +0000 (UTC)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
 by mx.groups.io with SMTP id smtpd.web11.45125.1728871221149460423
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Oct 2024 19:00:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OSPzaDqX;
 spf=pass (domain: gmail.com, ip: 209.85.208.179, mailfrom: ticotimo@gmail.com)
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2fb51e00c05so2343351fa.0
        for <openembedded-core@lists.openembedded.org>; Sun, 13 Oct 2024 19:00:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728871219; x=1729476019; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=l8jmkN+IKV4xnymMSqVXPhOJ4uPrvj6gzOVzK3/fiGE=;
        b=OSPzaDqXZZHwx1HhABqz95Y44nSDc4TpeNqYNs4mzB+d0B2CKaldbskp89x2uYTnIk
         XG5wQibcpLNKhV1Iu6OFIqpcrSUQLQOzKYVuCSiGoJpVNGYdlsA4UEbZHhZHRQ/AT34A
         niZHKtcSaiTLpzYfZf5FmYnF25ONb0K+7BkkR8Q1ZG1tA/41d8AZL1CLxz4U+ATVJaSK
         3YaYnc+jm+IYHUFlOQFkF1wLUT676zmuP2IT5xb9grWJsc4e9aHgldP2YCB2C4siPvL2
         hWYLWy4PTf1q6g0tEzV5S1iOvtljIH/P3EI6QKEK9xILiVEHZ+KRY7z+iFFeTKCKDXC9
         y8mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728871219; x=1729476019;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l8jmkN+IKV4xnymMSqVXPhOJ4uPrvj6gzOVzK3/fiGE=;
        b=SZQD1agA5UOqu2XnrYbU+3RPkafOduJZ3qEj1HqLBXpRC/Z/tEMb50OTVIF3PNWaWC
         0vCuk+6yBub1Vyu6Ssx4LCOrpDDB+gz/uZFV8KgE2LsnGn8nojxquSAxs4NR7lMfC4RF
         2f1cXWCCdQ4/L7xO4hG5kp/KibY6J3qvhzUHkzKeaLQzg7uakPB9AbbhN5xAj2NgjdKW
         L7nY+nu7u+RaUoBcH8noHU7pjMC7FqRwYVoHc2+Bkwn4DegMDtA2XsvGutWplXAsiLAZ
         meJ4tv3RgteaxVVF38u3FvFH5AjJQY7nt8xaiiHYh9DQUQ8gDh6/y1wwumRjHcjZUMXD
         wGCQ==
X-Forwarded-Encrypted: i=1; AJvYcCW263m+weL6woFkV31yjGow8VWewZRi3a/vlTQWG32CeT01Xs9FGW5eFnduUkYpvAP3gjnU1HOeI8C0CPxNsuK/Rw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwWHNBQnaPC4BHRxjUwiPQ3klmXavLVS8CHJe7bt2+J/MoogJdx
	WOeNqiezQa3zfSHu5los4zSh2LjARaovWdAuqh8O+y/3nJu18tqJ5qogJy+Hxj9e+3bJuYi9fIz
	jGEMGaeMXzymL/HHaxh/4q87IPt0=
X-Google-Smtp-Source: AGHT+IGwAFcHuvMslqrfUi0YJ8DUnj4npaOpflXoGjRlM9f/QnbpHuCuj1rCudYlhBDupQXqEvSeiKifDnWaNOT1h7E=
X-Received: by 2002:a05:6512:6c9:b0:533:71f:3a3d with SMTP id
 2adb3069b0e04-539e54f8ca7mr2218254e87.24.1728871218780; Sun, 13 Oct 2024
 19:00:18 -0700 (PDT)
MIME-Version: 1.0
References: <20241010205033.159589-2-t.f.g.geelen@gmail.com>
 <CANNYZj-NujKn-r+j_KgGs4PRCAxUY5Z1v=gU_hx8fg1hBa+KSw@mail.gmail.com>
 <CAJo0Az5a=-diCyNyAC14Ef6JTS4auzcSO2NQnaiYG1k3WpCw0g@mail.gmail.com>
 <CANNYZj_w+Ba7mhS4Jd=LaiVPZse0+pqGL3KSFN1uyHXTmuEkRg@mail.gmail.com>
 <CANx9H-CksfTYqbSbiirRT0cWeDy9sOPJgrA_s66Oj52d6Q44Yw@mail.gmail.com>
 <3d120a63-7fbf-43fc-8f44-5ad50ab1a061@smile.fr> <CANx9H-Bi0CKSMdH9fsQ8hAzabuyk2bX3hm3ZqUoPdmuupLeK_A@mail.gmail.com>
 <CAJo0Az6nDT-av_8HuudUt5Ob5ga7+=Qofaaa2Z2RTjKpsC1T+w@mail.gmail.com> <3831edba-2e59-48a8-9186-52c5a4081fd1@smile.fr>
In-Reply-To: <3831edba-2e59-48a8-9186-52c5a4081fd1@smile.fr>
From: Tim Orling <ticotimo@gmail.com>
Date: Sun, 13 Oct 2024 19:00:07 -0700
Message-ID: <CANx9H-C3W5A=gQWR=x7GS4OuS1m9qB6tv7H3s+GMD1Lj25g89Q@mail.gmail.com>
Subject: Re: [OE-core] [meta][PATCH v2] python3-cryptography: upgrade 42.0.8
 -> 43.0.1 -> reproducibility doc improvement
To: Yoann Congal <yoann.congal@smile.fr>
Cc: Tom Geelen <t.f.g.geelen@gmail.com>, Alexander Kanavin <alex.kanavin@gmail.com>, 
	openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000dba3a806246632d4"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Oct 2024 02:00:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205731

--000000000000dba3a806246632d4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 13, 2024 at 6:18=E2=80=AFAM Yoann Congal <yoann.congal@smile.fr=
> wrote:

> Hi,
>
> On Sat, Oct 12, 2024, 8:32=E2=80=AFPM Tim Orling <ticotimo@gmail.com> wro=
te:
> > We need to capture more of how to do this in the documentation. I
> > did what seemed to be what the variable names would indicate. In the
> > past, I always ran the full reproducible builds without restricting
> > to =E2=80=9Cone recipe=E2=80=9D (slow).
>
> Le 12/10/2024 =C3=A0 20:38, Tom Geelen a =C3=A9crit :
> > That the documentation could be more elaborate I agree on,
>
> I've filed https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D15619 abou=
t
> this (attributed to me since I plan to take care of it some day)
>
> > this is my
> > first attempt at pushing a fix I Poky and there is a lot of things to
> > take into account. It makes it daunting to contribute as I'll be making
> > a lot of mistakes.
>
> The fact that python3-cryptography is not an "easy" recipe does not help
> at all. But correcting your mistakes and improving your patch is the
> review process working as intended, so, please don't be discouraged.
>

Yoann and I were able to figure out a promising fix for maturin which is
the root cause of the reproducibility issues. It needs a little more
testing and rewording the commit message before we submit upstream (I
mentioned data.tar which is a .deb thing not a wheel thing)

https://github.com/moto-timo/maturin/tree/sort-records

Tom,

Some of the changes to ptest for cryptography need to be refactored. We
don=E2=80=99t want to add RDEPENDS from meta-python, they are for benchmark=
s,
coverage a distributed tests which are hard to argue belong in oe-core and
will simply be skipped. Puyhon3-mmap is still required for ptests and
dhould not have been dropped.

My functional branch:

https://git.yoctoproject.org/poky-contrib/log/?h=3Dtimo/maturin-sort-record=
s



> Regards,
> --
> Yoann Congal
> Smile ECS - Tech Expert
>

--000000000000dba3a806246632d4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Sun, Oct 13, 2024 at 6:18=E2=80=AFAM Yoann Congal &lt;<a=
 href=3D"mailto:yoann.congal@smile.fr">yoann.congal@smile.fr</a>&gt; wrote:=
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left-width:1px;border-left-style:solid;padding-left:1ex;border-le=
ft-color:rgb(204,204,204)">Hi,<br>
<br>
On Sat, Oct 12, 2024, 8:32=E2=80=AFPM Tim Orling &lt;<a href=3D"mailto:tico=
timo@gmail.com" target=3D"_blank">ticotimo@gmail.com</a>&gt; wrote:<br>
&gt; We need to capture more of how to do this in the documentation. I<br>
&gt; did what seemed to be what the variable names would indicate. In the<b=
r>
&gt; past, I always ran the full reproducible builds without restricting<br=
>
&gt; to =E2=80=9Cone recipe=E2=80=9D (slow).<br>
<br>
Le 12/10/2024 =C3=A0 20:38, Tom Geelen a =C3=A9crit=C2=A0:<br>
&gt; That the documentation could be more elaborate I agree on,<br>
<br>
I&#39;ve filed <a href=3D"https://bugzilla.yoctoproject.org/show_bug.cgi?id=
=3D15619" rel=3D"noreferrer" target=3D"_blank">https://bugzilla.yoctoprojec=
t.org/show_bug.cgi?id=3D15619</a> about<br>
this (attributed to me since I plan to take care of it some day)<br>
<br>
&gt; this is my<br>
&gt; first attempt at pushing a fix I Poky and there is a lot of things to<=
br>
&gt; take into account. It makes it daunting to contribute as I&#39;ll be m=
aking<br>
&gt; a lot of mistakes.<br>
<br>
The fact that python3-cryptography is not an &quot;easy&quot; recipe does n=
ot help<br>
at all. But correcting your mistakes and improving your patch is the<br>
review process working as intended, so, please don&#39;t be discouraged.<br=
>
</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">Yoann and I were=
 able to figure out a promising fix for maturin which is the root cause of =
the reproducibility issues. It needs a little more testing and rewording th=
e commit message before we submit upstream (I mentioned data.tar which is a=
 .deb thing not a wheel thing)</div><div dir=3D"auto"><div dir=3D"auto"><br=
></div><div><a href=3D"https://github.com/moto-timo/maturin/tree/sort-recor=
ds">https://github.com/moto-timo/maturin/tree/sort-records</a></div><br></d=
iv><div dir=3D"auto">Tom,</div><div dir=3D"auto"><br></div><div dir=3D"auto=
">Some of the changes to ptest for cryptography need to be refactored. We d=
on=E2=80=99t want to add RDEPENDS from meta-python, they are for benchmarks=
, coverage a distributed tests which are hard to argue belong in oe-core an=
d will simply be skipped. Puyhon3-mmap is still required for ptests and dho=
uld not have been dropped.</div><div dir=3D"auto"><br></div><div dir=3D"aut=
o">My functional branch:</div><div dir=3D"auto"><br></div><div dir=3D"auto"=
><div><a href=3D"https://git.yoctoproject.org/poky-contrib/log/?h=3Dtimo/ma=
turin-sort-records">https://git.yoctoproject.org/poky-contrib/log/?h=3Dtimo=
/maturin-sort-records</a></div><br></div><div dir=3D"auto"><br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-w=
idth:1px;border-left-style:solid;padding-left:1ex;border-left-color:rgb(204=
,204,204)"><br>
Regards,<br>
-- <br>
Yoann Congal<br>
Smile ECS - Tech Expert<br>
</blockquote></div></div>

--000000000000dba3a806246632d4--

