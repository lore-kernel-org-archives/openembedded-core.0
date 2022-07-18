Return-Path: <otavio.salvador@ossystems.com.br>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3FE4C43334
	for <webhook@archiver.kernel.org>; Mon, 18 Jul 2022 21:41:14 +0000 (UTC)
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com
 [209.85.222.169])
 by mx.groups.io with SMTP id smtpd.web12.33396.1658180473910007344
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Jul 2022 14:41:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ossystems-com-br.20210112.gappssmtp.com header.s=20210112
 header.b=iZBSpL+4;
 spf=pass (domain: ossystems.com.br, ip: 209.85.222.169,
 mailfrom: otavio.salvador@ossystems.com.br)
Received: by mail-qk1-f169.google.com with SMTP id m16so5594945qka.12
        for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Jul 2022 14:41:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ossystems-com-br.20210112.gappssmtp.com; s=20210112;
        h=from:mime-version:references:in-reply-to:date:message-id:subject:to
         :cc;
        bh=NSrzJZxibQPyvsmIAtWeutJfg1/R7tKA+Tk/hB9jj/w=;
        b=iZBSpL+4ttPPPT/tse7+JlRvUCer+q1+T5hPQT3O4ZxVngN+pS/laIPciCuZObVY4t
         mk2O04nM79lwjUKdb13IJ9yobiNPFjl9LzfSd8pd+rSz49gD30hVcvzvdHzlKuzVpn3L
         OTE5X7mVbmg+4ir9YbHhg+RU7sSvwsdlXXCxrYMkasvUjIyKvKI7j9fl8hotkiunqdWw
         73vz0dYsBbt5dKhIuuPDShCYO8lv066LFuX8o0B69yJ1OiY3O+xcMVAarzVbLtESuxFu
         MpyBv/uXmxtVgB8eE0J9tOv1p/JL126k/AZWUG8bBRFWE5sPJnecdeeLzeFqVRJ2KKlZ
         d8/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:mime-version:references:in-reply-to:date
         :message-id:subject:to:cc;
        bh=NSrzJZxibQPyvsmIAtWeutJfg1/R7tKA+Tk/hB9jj/w=;
        b=bRPZISyoFFQGVK7my/OXsp0BWp2tTkFfVV+RbzH9Nnzu8drrkoLfruMRzA7spHsyxF
         D5P9BgIQkvNiHXSFtRGlEK2Bf5XEsiAdR9G9wSrxdj2DWsh3KHRdyWWt9n1hLflIVd7k
         XYrzxZDABhuSrNieXsrw5RSQOQEhucFrv8wP21RzwBlMxfmz4eKEGOT51SCuztj3e5I1
         36l7KLilwXVbzkmrvscZuISffzv3+b0cdhXuP44AEl3VI4yOL/Kd55e/FMJ3Z+0nzHGd
         /AFDvFgxi5CdVZA9RxrxwAuUNSlTnb7hKV/UdNNwohKzxWdFu7enzr1AQJOiO0pWe/Yd
         z/7w==
X-Gm-Message-State: AJIora+rbaALiF0KpP1KGoBJjzujRU0SHOFg1Gy9vaM9muzHXPW9asLW
	AZzed+QMIcqdHcdA/eNZ2OmpmK5GzVPdGJ3s
X-Google-Smtp-Source: 
 AGRyM1tyWWYQnZF8PIU+KUsf+6FEgGOLWCjb49D6ARRx7qSOccPytih4gxCDQv/N7wiDQoF4R43AjA==
X-Received: by 2002:a05:620a:25c8:b0:6ae:2408:6e9a with SMTP id
 y8-20020a05620a25c800b006ae24086e9amr18863741qko.222.1658180472714;
        Mon, 18 Jul 2022 14:41:12 -0700 (PDT)
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com.
 [209.85.222.169])
        by smtp.gmail.com with ESMTPSA id
 bk30-20020a05620a1a1e00b006b5e23587c2sm6049737qkb.85.2022.07.18.14.41.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Jul 2022 14:41:12 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-qk1-f169.google.com with SMTP id o26so9846822qkl.6
        for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Jul 2022 14:41:12 -0700 (PDT)
X-Received: by 2002:a05:620a:29d6:b0:6b5:be51:fcf0 with SMTP id
 s22-20020a05620a29d600b006b5be51fcf0mr17197576qkp.705.1658180471839; Mon, 18
 Jul 2022 14:41:11 -0700 (PDT)
MIME-Version: 1.0
References: <20220710164300.953098-1-otavio@ossystems.com.br>
 <20220710164300.953098-2-otavio@ossystems.com.br>
 <e642480e892b0b411acb509c0de11aa7e52d4412.camel@linuxfoundation.org>
 <CAP9ODKooHNY8GyNuY8hDHyscEAJJfCfTXdThVMQW5TOGnjOZxw@mail.gmail.com>
 <8e065ede6abdb6065c862bd8b25cdccf2b6828a8.camel@linuxfoundation.org>
 <CAP9ODKp1_CV4N-RB+NR4nTdvVgSR=pu6V7q2T2sQ8Pu8w=Ew2g@mail.gmail.com>
 <bba9495ce38c56f914c391f054ce2bd77f2bef55.camel@linuxfoundation.org>
In-Reply-To: 
 <bba9495ce38c56f914c391f054ce2bd77f2bef55.camel@linuxfoundation.org>
Date: Mon, 18 Jul 2022 18:41:00 -0300
X-Gmail-Original-Message-ID: 
 <CAP9ODKrTbdjMOK5scpWEeh2Fdk0gt4XTdsVR0MLTb7GKEfpKJw@mail.gmail.com>
Message-ID: 
 <CAP9ODKrTbdjMOK5scpWEeh2Fdk0gt4XTdsVR0MLTb7GKEfpKJw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 2/2] cargo-cross-canadian: Use SDK's flags
 during target linking
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Khem Raj <raj.khem@gmail.com>, Otavio Salvador <otavio@ossystems.com.br>,
	Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000ff626805e41b39cf"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Jul 2022 21:41:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168259

--000000000000ff626805e41b39cf
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Em seg., 18 de jul. de 2022 =C3=A0s 18:18, Richard Purdie <
richard.purdie@linuxfoundation.org> escreveu:

> > It does, indeed, but it doesn't seem related to this PR.
> >
> > Do you know if this has worked?
> >
> > I am asking as I did all development and testing using SDKMACHINE ?=3D
> > 'x86_64' and even MACHINE ?=3D 'qemuarm64' worked just fine. However,
> > looking at some of the logs above, it seems it is using an SDKMACHINE
> > as i686, so this appears as a different issue for me.
> >
>
> rust-cross-canadian hasn't officially worked properly or been
> supported. In assessing whether a patch is better or worse, it is
> useful to know which cases regress and which improve. I had hoped this
> list of failures would be smaller. I will admit I don't know whether
> this is better or worse than before so I guess that is the next thing I
> need to determine.
>

I told you. I tried SDKMACHINE as x86_64 on a x86_64 host and this worked.

What we don't know right now is which combinations work and which don't
> so we can't even tell people what is expected to work and what
> isn't/doesn't :(
>

See above.


> I mentioned this report in case someone can work out the pattern, or
> even better, understand what a fix looks like...
>

I am not familiar enough to Rust boostrap to help here but we spent a lot
of time to get the SDK working and I think this is a step on the right
direction, at least.

--=20
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750

--000000000000ff626805e41b39cf
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Em seg., 18 de jul. de 2022 =C3=A0s 1=
8:18, Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.o=
rg">richard.purdie@linuxfoundation.org</a>&gt; escreveu:<br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">&gt; It does, indeed, but it doesn=
&#39;t seem related to this PR.=C2=A0<br>
&gt; <br>
&gt; Do you know if this has worked?<br>
&gt; <br>
&gt; I am asking as I did all development and testing using=C2=A0SDKMACHINE=
 ?=3D<br>
&gt; &#39;x86_64&#39; and even=C2=A0MACHINE ?=3D &#39;qemuarm64&#39; worked=
 just fine. However,<br>
&gt; looking at some of the logs above, it seems it is using an SDKMACHINE<=
br>
&gt; as i686, so this appears as a different issue for me.<br>
&gt; <br>
<br>
rust-cross-canadian hasn&#39;t officially worked properly or been<br>
supported. In assessing whether a patch is better or worse, it is<br>
useful to know which cases regress and which improve. I had hoped this<br>
list of failures would be smaller. I will admit I don&#39;t know whether<br=
>
this is better or worse than before so I guess that is the next thing I<br>
need to determine.<br></blockquote><div><br></div><div>I told you. I tried =
SDKMACHINE as x86_64 on a x86_64 host and this worked.</div><div><br></div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">What we don&#39;t know ri=
ght now is which combinations work and which don&#39;t<br>
so we can&#39;t even tell people what is expected to work and what<br>
isn&#39;t/doesn&#39;t :(<br></blockquote><div><br></div><div>See above.</di=
v><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
I mentioned this report in case someone can work out the pattern, or<br>
even better, understand what a fix looks like...<br></blockquote><div><br><=
/div><div>I am not familiar enough to Rust boostrap=C2=A0to help here but w=
e spent a lot of time to get the SDK working and I think this is a step on =
the right direction, at least.</div><div>=C2=A0</div></div>-- <br><div dir=
=3D"ltr" class=3D"gmail_signature">Otavio Salvador =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 O=
.S. Systems<br><a href=3D"http://www.ossystems.com.br" target=3D"_blank">ht=
tp://www.ossystems.com.br</a> =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://=
code.ossystems.com.br" target=3D"_blank">http://code.ossystems.com.br</a><b=
r>Mobile: +55 (53) 9 9981-7854 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Mobile: +1=
 (347) 903-9750</div></div>

--000000000000ff626805e41b39cf--

