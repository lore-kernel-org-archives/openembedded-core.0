Return-Path: <otavio.salvador@ossystems.com.br>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29761C43334
	for <webhook@archiver.kernel.org>; Mon, 18 Jul 2022 19:25:24 +0000 (UTC)
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com
 [209.85.160.173])
 by mx.groups.io with SMTP id smtpd.web09.31720.1658172319186023544
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Jul 2022 12:25:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ossystems-com-br.20210112.gappssmtp.com header.s=20210112
 header.b=NhZJEZem;
 spf=pass (domain: ossystems.com.br, ip: 209.85.160.173,
 mailfrom: otavio.salvador@ossystems.com.br)
Received: by mail-qt1-f173.google.com with SMTP id e5so9529529qts.1
        for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Jul 2022 12:25:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ossystems-com-br.20210112.gappssmtp.com; s=20210112;
        h=from:mime-version:references:in-reply-to:date:message-id:subject:to
         :cc;
        bh=7zCqIaHWz2i7f1ESkfDE4Nl4M8UpcdY2lfD+3fKntOQ=;
        b=NhZJEZemGjGFSpL7Gv6PqDYeqoaQtoC9b9Ld6EmiNinR+lnsxRoT0tj4n9yU3eTltR
         dvLRBcHNeIp8PTUeDAD6g2VazQIPYT1aUMrfoeDsJNOnNN6PMwCY/0ScxdfpmrhxB3G+
         Q8boMUe6n20RQ4mMwTfXGUw6DRMmzMKasiy2DVD3OT4UUxXITaT97Pjs8T+i+lmmzbjd
         tcl4n5Q3amfmffvlQZ65NTGkqzdDkwFSYmIKpUajmGWQPAIAQXTv6j4Yq9NmAcWRc39b
         3gIUmJ3EzGfPgCq9uMkBYN7vbbJvQgniQhO7NQImOuJOAljWP/4ijTwWgajfOVUZYrcj
         6+XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:mime-version:references:in-reply-to:date
         :message-id:subject:to:cc;
        bh=7zCqIaHWz2i7f1ESkfDE4Nl4M8UpcdY2lfD+3fKntOQ=;
        b=A8aN4ql/WT1bJwSaK7IfQjIoWYHq216AjB8hqpfwX7N87iMH+1ftyMEtfcr7T1lxbX
         ysg0zaiNgQr4jjNDEIysczX4Zvt7TN+UNKdWfsntgjP7EQppTThTekNtobKf5lNB4QXu
         aVsSfa8fBJmMorPFtoQNiPWsEsD/5gaGkdCzgX1+ziprElxoKzkxUrKOubSgGYkaxwRp
         LX9HUAuyPsthULD1XYqG9OaqMuQ+of5ANFMp9HQ5pnhxmcEqidW0jJlqoOgdfCecPKKH
         MhP1MhRMhyhio/gj5Xk5F9bAUHGOsjyFGhIhUn5d7h1dmsju1VjYFMrZ9l1Omf2PZrag
         m7GA==
X-Gm-Message-State: AJIora+Jz/Kh6EyEo8nQkHMe7PMR9F50Ly+og0ZFuQwEof5HFjb3P/fk
	dVPbwR8NiPpZZe15WqKCCml7qo8UTN0D1iKY
X-Google-Smtp-Source: 
 AGRyM1sMtQxpQdeys/mz96y4XWc8yMAbVu/U1KJ78qZWDuPZdQwR4Fq+2+uJzGYhg+FADwsbwX4hBQ==
X-Received: by 2002:ac8:5c8d:0:b0:31e:cf54:5ede with SMTP id
 r13-20020ac85c8d000000b0031ecf545edemr19191628qta.531.1658172317977;
        Mon, 18 Jul 2022 12:25:17 -0700 (PDT)
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com.
 [209.85.222.180])
        by smtp.gmail.com with ESMTPSA id
 m6-20020a05620a290600b006b5c492aafesm10822069qkp.86.2022.07.18.12.25.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Jul 2022 12:25:17 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-qk1-f180.google.com with SMTP id c3so3799734qko.1
        for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Jul 2022 12:25:16 -0700 (PDT)
X-Received: by 2002:a37:4115:0:b0:6b5:da97:fe0d with SMTP id
 o21-20020a374115000000b006b5da97fe0dmr7458723qka.370.1658172316704; Mon, 18
 Jul 2022 12:25:16 -0700 (PDT)
MIME-Version: 1.0
References: <20220710164300.953098-1-otavio@ossystems.com.br>
 <20220710164300.953098-2-otavio@ossystems.com.br>
 <e642480e892b0b411acb509c0de11aa7e52d4412.camel@linuxfoundation.org>
 <CAP9ODKooHNY8GyNuY8hDHyscEAJJfCfTXdThVMQW5TOGnjOZxw@mail.gmail.com>
 <8e065ede6abdb6065c862bd8b25cdccf2b6828a8.camel@linuxfoundation.org>
In-Reply-To: 
 <8e065ede6abdb6065c862bd8b25cdccf2b6828a8.camel@linuxfoundation.org>
Date: Mon, 18 Jul 2022 16:25:05 -0300
X-Gmail-Original-Message-ID: 
 <CAP9ODKp1_CV4N-RB+NR4nTdvVgSR=pu6V7q2T2sQ8Pu8w=Ew2g@mail.gmail.com>
Message-ID: 
 <CAP9ODKp1_CV4N-RB+NR4nTdvVgSR=pu6V7q2T2sQ8Pu8w=Ew2g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 2/2] cargo-cross-canadian: Use SDK's flags
 during target linking
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 Khem Raj <raj.khem@gmail.com>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000e9e97905e41953f5"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Jul 2022 19:25:24 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168253

--000000000000e9e97905e41953f5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Richard and Khem

Em seg., 18 de jul. de 2022 =C3=A0s 12:59, Richard Purdie <
richard.purdie@linuxfoundation.org> escreveu:

> On Mon, 2022-07-18 at 12:49 -0300, Otavio Salvador wrote:
> > Em seg., 18 de jul. de 2022 =C3=A0s 09:45, Richard Purdie
> > <richard.purdie@linuxfoundation.org> escreveu:
> > > On Sun, 2022-07-10 at 13:43 -0300, Otavio Salvador wrote:
> > > > Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> > > SDKAMCHINE =3D "aarch64"
> > > MACHINE =3D "qemuarm64"
> > >
> > > bitbake rust-cross-canadian-aarch64
> > >
> > > still fails so there is still something wrong with the SDK builds
> > > :/
> > >
> >
> >
> > I'll check this. I didn't check this combination.
>
> I tried an experiment to see which combinations worked. To do that I
> added:
>
> TOOLCHAIN_HOST_TASK:append =3D ' packagegroup-rust-cross-canadian-${MACHI=
NE}'
>
> to the autobuilder config. This resulted in:
>
> qemux86:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/59/builds/5491
>
> buildtools:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/20/builds/5885
>
> beaglebone:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/65/builds/5563
>
> edgerouter:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/62/builds/5533
>
> genericx86:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/48/builds/5548
>
> genericx86-64:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/37/builds/5533
>
> multilib:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/44/builds/5554
>
> pkgman-deb-non-deb:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/50/builds/5554
>
> qemumips:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/60/builds/5498
>
> qemux86-64:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/73/builds/5487
>
> qemuarm64:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/42/builds/5510
>
> qemuarm:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/53/builds/5525
>
> so there is something rather wrong :(
>

It does, indeed, but it doesn't seem related to this PR.

Do you know if this has worked?

I am asking as I did all development and testing using SDKMACHINE ?=3D
'x86_64' and even MACHINE ?=3D 'qemuarm64' worked just fine. However, looki=
ng
at some of the logs above, it seems it is using an SDKMACHINE as i686, so
this appears as a different issue for me.

--=20
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750

--000000000000e9e97905e41953f5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello Richard and Khem</div><br><div class=3D"gmail_q=
uote"><div dir=3D"ltr" class=3D"gmail_attr">Em seg., 18 de jul. de 2022 =C3=
=A0s 12:59, Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfounda=
tion.org">richard.purdie@linuxfoundation.org</a>&gt; escreveu:<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex">On Mon, 2022-07-18 at 12:49 =
-0300, Otavio Salvador wrote:<br>&gt; Em seg., 18 de jul. de 2022 =C3=A0s 0=
9:45, Richard Purdie<br>
&gt; &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_b=
lank">richard.purdie@linuxfoundation.org</a>&gt; escreveu:<br>
&gt; &gt; On Sun, 2022-07-10 at 13:43 -0300, Otavio Salvador wrote:<br>
&gt; &gt; &gt; Signed-off-by: Otavio Salvador &lt;<a href=3D"mailto:otavio@=
ossystems.com.br" target=3D"_blank">otavio@ossystems.com.br</a>&gt;<br>&gt;=
 &gt; SDKAMCHINE =3D &quot;aarch64&quot;<br>
&gt; &gt; MACHINE =3D &quot;qemuarm64&quot;<br>
&gt; &gt; <br>
&gt; &gt; bitbake rust-cross-canadian-aarch64<br>
&gt; &gt; <br>
&gt; &gt; still fails so there is still something wrong with the SDK builds=
<br>
&gt; &gt; :/<br>
&gt; &gt; <br>
&gt; <br>
&gt; <br>
&gt; I&#39;ll check this. I didn&#39;t check this combination.<br>
<br>
I tried an experiment to see which combinations worked. To do that I<br>
added:<br>
<br>
TOOLCHAIN_HOST_TASK:append =3D &#39; packagegroup-rust-cross-canadian-${MAC=
HINE}&#39;<br>
<br>
to the autobuilder config. This resulted in:<br>
<br>
qemux86:<br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/59/build=
s/5491" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproje=
ct.org/typhoon/#/builders/59/builds/5491</a><br>
<br>
buildtools:<br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/20/build=
s/5885" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproje=
ct.org/typhoon/#/builders/20/builds/5885</a><br>
<br>
beaglebone:<br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/65/build=
s/5563" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproje=
ct.org/typhoon/#/builders/65/builds/5563</a><br>
<br>
edgerouter:<br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/62/build=
s/5533" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproje=
ct.org/typhoon/#/builders/62/builds/5533</a><br>
<br>
genericx86:<br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/48/build=
s/5548" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproje=
ct.org/typhoon/#/builders/48/builds/5548</a><br>
<br>
genericx86-64:<br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/37/build=
s/5533" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproje=
ct.org/typhoon/#/builders/37/builds/5533</a><br>
<br>
multilib:<br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/44/build=
s/5554" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproje=
ct.org/typhoon/#/builders/44/builds/5554</a><br>
<br>
pkgman-deb-non-deb:<br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/50/build=
s/5554" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproje=
ct.org/typhoon/#/builders/50/builds/5554</a><br>
<br>
qemumips:<br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/60/build=
s/5498" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproje=
ct.org/typhoon/#/builders/60/builds/5498</a><br>
<br>
qemux86-64:<br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/73/build=
s/5487" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproje=
ct.org/typhoon/#/builders/73/builds/5487</a><br>
<br>
qemuarm64:<br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/42/build=
s/5510" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproje=
ct.org/typhoon/#/builders/42/builds/5510</a><br>
<br>
qemuarm:<br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/53/build=
s/5525" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproje=
ct.org/typhoon/#/builders/53/builds/5525</a><br>
<br>
so there is something rather wrong :(<br></blockquote><div><br></div><div>I=
t does, indeed, but it doesn&#39;t seem related to this PR.=C2=A0</div><div=
><br></div><div>Do you know if this has worked?</div><div><br></div><div>I =
am asking as I did all development and testing using=C2=A0SDKMACHINE ?=3D &=
#39;x86_64&#39; and even=C2=A0MACHINE ?=3D &#39;qemuarm64&#39; worked just =
fine. However, looking at some of the logs above, it seems it is using an S=
DKMACHINE as i686, so this appears as a different issue for me.</div><div>=
=C2=A0</div></div>-- <br><div dir=3D"ltr" class=3D"gmail_signature">Otavio =
Salvador =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 O.S. Systems<br><a href=3D"http://www.ossys=
tems.com.br" target=3D"_blank">http://www.ossystems.com.br</a> =C2=A0 =C2=
=A0 =C2=A0 =C2=A0<a href=3D"http://code.ossystems.com.br" target=3D"_blank"=
>http://code.ossystems.com.br</a><br>Mobile: +55 (53) 9 9981-7854 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0Mobile: +1 (347) 903-9750</div></div>

--000000000000e9e97905e41953f5--

