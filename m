Return-Path: <otavio.salvador@ossystems.com.br>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1B23C19F28
	for <webhook@archiver.kernel.org>; Wed, 27 Jul 2022 17:15:31 +0000 (UTC)
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com
 [209.85.160.171])
 by mx.groups.io with SMTP id smtpd.web09.22509.1658942129382249925
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Jul 2022 10:15:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ossystems-com-br.20210112.gappssmtp.com header.s=20210112
 header.b=txsqouYl;
 spf=pass (domain: ossystems.com.br, ip: 209.85.160.171,
 mailfrom: otavio.salvador@ossystems.com.br)
Received: by mail-qt1-f171.google.com with SMTP id b21so13068245qte.12
        for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Jul 2022 10:15:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ossystems-com-br.20210112.gappssmtp.com; s=20210112;
        h=from:mime-version:references:in-reply-to:date:message-id:subject:to
         :cc;
        bh=7Y9wg/x2UDSCpfup6PFPTEYrFosrJEbd8KYRJM4N2PU=;
        b=txsqouYl0CYhvUMmdE4EZqmMbrp5/bxaeANoTdIBtj8tQw8QAOGgDdWxBSkdF9waAs
         jfUUm5PxFC5rXLqc4YV3Yt7sTVIv9gOVPVdKsOIysB+jqpg/mdCAR5JjjFW5g2ltML0m
         FpOdbgoblOMgGawzqVedSgh2qwQj2Y8ZraUJxVqQPYNPBajiyX79KySPKSgCHrOaUm+C
         sCCvqsHgwf20z+CCBGyivWavzhbARej65SwvJP4UYpXgTlbzS3TM0lPMMo6o/SixTQQ4
         OLb3/phuA3lsYHt1iE4Rye5WM70WFZiNEVCIjehLYIYBtZwAzxCILm8s3pRRJrAySbFf
         uDsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:mime-version:references:in-reply-to:date
         :message-id:subject:to:cc;
        bh=7Y9wg/x2UDSCpfup6PFPTEYrFosrJEbd8KYRJM4N2PU=;
        b=ifXSpGTZGUOdOXSUo4mMOKHofqH1ScRaVQsJ+JLxmXpWhtYfCATmiqZFtlXMmsc7TU
         Jz/z4j2nMMlCjfm0zZ1sWchjGYFpyRkONE/Pd62EEhocKZJyDvY1ZphR557i+b4nLdDR
         VNClOtIEAxnZxDAgWmhh7DJCRYjkNl2d+xDDX7mlVCv1enW7Rp5MiVjJrjeQ1UF2ZT3o
         8mceNk2IZMKiTsBz9SRJcopC1ocfKOEbqFVtcbCJm3SURuSeGju13qTYjcijzZeTRbm0
         EW1j5PFG4ujqHVwwoQz29oHPJ+2+rurfNnQcLH4vdIzpxR6ehgA91UHOBve3qoJXENWc
         x8Sw==
X-Gm-Message-State: AJIora+L4Lugk3uIwPNVYBCaVkiglSbr7OaDesJdtXS4O9zvBjw1AI2G
	7CkjJPCKR6lvZ30s0YMVvpfs6ihfwdVEGabv
X-Google-Smtp-Source: 
 AGRyM1s93uRuzlFuIk2uhf+MqffS1ZDRWDUuk2caRa6XAykAUufJNz0uCozg8Yk60zqmhomhPRT9Vg==
X-Received: by 2002:ac8:7fd4:0:b0:31f:37b4:8d7e with SMTP id
 b20-20020ac87fd4000000b0031f37b48d7emr13124694qtk.673.1658942128065;
        Wed, 27 Jul 2022 10:15:28 -0700 (PDT)
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com.
 [209.85.222.176])
        by smtp.gmail.com with ESMTPSA id
 e19-20020a05620a12d300b006b5905999easm12703823qkl.121.2022.07.27.10.15.27
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Jul 2022 10:15:27 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-qk1-f176.google.com with SMTP id f14so13792675qkm.0
        for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Jul 2022 10:15:27 -0700 (PDT)
X-Received: by 2002:a05:620a:29d6:b0:6b5:be51:fcf0 with SMTP id
 s22-20020a05620a29d600b006b5be51fcf0mr17862134qkp.705.1658942127167; Wed, 27
 Jul 2022 10:15:27 -0700 (PDT)
MIME-Version: 1.0
References: <20220726142413.2262729-1-richard.purdie@linuxfoundation.org>
 <20220726142413.2262729-2-richard.purdie@linuxfoundation.org>
 <20220727184826.04eb9d05@booty>
In-Reply-To: <20220727184826.04eb9d05@booty>
Date: Wed, 27 Jul 2022 14:15:15 -0300
X-Gmail-Original-Message-ID: 
 <CAP9ODKqLy=d9McWhsSk4M+Z+J4sLv02hGHyTojtwWOEnvYiEWw@mail.gmail.com>
Message-ID: 
 <CAP9ODKqLy=d9McWhsSk4M+Z+J4sLv02hGHyTojtwWOEnvYiEWw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/3] oeqa/sdk: Add basic rust cargo test
To: luca.ceresoli@bootlin.com
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
	Otavio Salvador <otavio@ossystems.com.br>
Content-Type: multipart/alternative; boundary="000000000000315f5605e4cc9019"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Jul 2022 17:15:31 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168583

--000000000000315f5605e4cc9019
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Em qua., 27 de jul. de 2022 =C3=A0s 13:48, Luca Ceresoli via
lists.openembedded.org <luca.ceresoli=3Dbootlin.com@lists.openembedded.org>
escreveu:

> On Tue, 26 Jul 2022 15:24:12 +0100
> "Richard Purdie" <richard.purdie@linuxfoundation.org> wrote:
>
> > From: Otavio Salvador <otavio@ossystems.com.br>
> >
> > Add a QA test to the SDK to test that a basic cargo build works.
> >
> > [RP: Tweaked to work for multilibs and updated to match toolchain
> changes]
> >
> > Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>
> We have a build failure with this series applied:
>
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/44/builds/5615/st=
eps/26/logs/stdio
>
> Attached is the do_testsdk log.
>

It seems the SDK test directory is being reused, so it failed as file
already exists.

--=20
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750

--000000000000315f5605e4cc9019
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Em qua., 27 de jul. de 2022 =C3=A0s 1=
3:48, Luca Ceresoli via <a href=3D"http://lists.openembedded.org">lists.ope=
nembedded.org</a> &lt;luca.ceresoli=3D<a href=3D"mailto:bootlin.com@lists.o=
penembedded.org">bootlin.com@lists.openembedded.org</a>&gt; escreveu:<br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex">On Tue, 26 Jul 2022 1=
5:24:12 +0100<br>
&quot;Richard Purdie&quot; &lt;<a href=3D"mailto:richard.purdie@linuxfounda=
tion.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt; wrot=
e:<br>
<br>
&gt; From: Otavio Salvador &lt;<a href=3D"mailto:otavio@ossystems.com.br" t=
arget=3D"_blank">otavio@ossystems.com.br</a>&gt;<br>
&gt; <br>
&gt; Add a QA test to the SDK to test that a basic cargo build works.<br>
&gt; <br>
&gt; [RP: Tweaked to work for multilibs and updated to match toolchain chan=
ges]<br>
&gt; <br>
&gt; Signed-off-by: Otavio Salvador &lt;<a href=3D"mailto:otavio@ossystems.=
com.br" target=3D"_blank">otavio@ossystems.com.br</a>&gt;<br>
&gt; Signed-off-by: Richard Purdie &lt;<a href=3D"mailto:richard.purdie@lin=
uxfoundation.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&=
gt;<br>
<br>
We have a build failure with this series applied:<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/44/build=
s/5615/steps/26/logs/stdio" rel=3D"noreferrer" target=3D"_blank">https://au=
tobuilder.yoctoproject.org/typhoon/#/builders/44/builds/5615/steps/26/logs/=
stdio</a><br>
<br>
Attached is the do_testsdk log.<br></blockquote><div><br></div><div>It seem=
s the SDK test directory is being reused, so it failed as file already exis=
ts.</div><div>=C2=A0</div></div>-- <br><div dir=3D"ltr" class=3D"gmail_sign=
ature">Otavio Salvador =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 O.S. Systems<br><a href=3D"ht=
tp://www.ossystems.com.br" target=3D"_blank">http://www.ossystems.com.br</a=
> =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://code.ossystems.com.br" targe=
t=3D"_blank">http://code.ossystems.com.br</a><br>Mobile: +55 (53) 9 9981-78=
54 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Mobile: +1 (347) 903-9750</div></div>

--000000000000315f5605e4cc9019--

