Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1D47C433EF
	for <webhook@archiver.kernel.org>; Mon, 18 Jul 2022 21:18:14 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web10.33163.1658179088363570058
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Jul 2022 14:18:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ZodAE5S/;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.50,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f50.google.com with SMTP id d16so18826583wrv.10
        for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Jul 2022 14:18:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=+Qq+z8PjE7Dl2w2w/QkRhaBDYJbadrFatWHrx8IDFlI=;
        b=ZodAE5S/7RxItnYhYIIc/Gn0vkrQC7rtC1nQr7bjTRItI9cGqtme6RiHbyQ2xwA3t9
         Qn5vLZkk2X6einvlXl8hzXSNprH/IgTR2b98GGQ5ogX4hgFk4vKQyYMNxesRsI9KGvMy
         DfLAt3EkjEnGjWz6JfAjTlJJGmNf121b8bs1M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=+Qq+z8PjE7Dl2w2w/QkRhaBDYJbadrFatWHrx8IDFlI=;
        b=kZAPMaV13WfUzOP822/9Y9G8l/Orzqk7ELv9axiNz9lZzfrFEAtbsdeJTiZoGcv7m0
         MbYk0o//GRiOLExe0vFDyFa9y8L1Wr8AUoMLE2NNYD6V/FJu69nYl9WYsiHUlFXK5xTK
         ystmUx+Cv+ker8r1SKqZBL5JG3k7cO2i0jecfhq+ZlTISx4JMpL2k26HEKjSW+NztdfK
         4lTHsXbWHZT/K7H/EuEqLCRihfibeE28qF98Rr4FurAedvHqdxitIkjwNLMj4TmB9lZ0
         p4T1h/Qiu/QPPvyHRRoTKezWoYlU0gIBtWt+eeLwpV6KHbHhx4KQsv11FMrFEnXr+xGY
         yQ7w==
X-Gm-Message-State: AJIora/sznz+O/fVGggvnLmlCjSQJ2gFN6pJakXzNPVhtyA9IFH278CO
	+aZdbssEqEoMeIJeH+TKLWsiNA==
X-Google-Smtp-Source: 
 AGRyM1vywwXEIGa7u3/JJ9LFdmTw/me+XgVo5iHfoLrzhH1PkrEkiBfN9Jmh2y1VvvWUBRMGF0ACEQ==
X-Received: by 2002:adf:ffc1:0:b0:21d:efac:100b with SMTP id
 x1-20020adfffc1000000b0021defac100bmr9982857wrs.444.1658179086647;
        Mon, 18 Jul 2022 14:18:06 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:22db:3f70:c684:113a?
 ([2001:8b0:aba:5f3c:22db:3f70:c684:113a])
        by smtp.gmail.com with ESMTPSA id
 v10-20020a05600c428a00b003a2fc754313sm15718981wmc.10.2022.07.18.14.18.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Jul 2022 14:18:05 -0700 (PDT)
Message-ID: 
 <bba9495ce38c56f914c391f054ce2bd77f2bef55.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2 2/2] cargo-cross-canadian: Use SDK's flags
 during target linking
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>, Khem Raj
	 <raj.khem@gmail.com>
Cc: Otavio Salvador <otavio@ossystems.com.br>, Patches and discussions
	about the oe-core layer <openembedded-core@lists.openembedded.org>
Date: Mon, 18 Jul 2022 22:18:02 +0100
In-Reply-To: 
 <CAP9ODKp1_CV4N-RB+NR4nTdvVgSR=pu6V7q2T2sQ8Pu8w=Ew2g@mail.gmail.com>
References: <20220710164300.953098-1-otavio@ossystems.com.br>
	 <20220710164300.953098-2-otavio@ossystems.com.br>
	 <e642480e892b0b411acb509c0de11aa7e52d4412.camel@linuxfoundation.org>
	 <CAP9ODKooHNY8GyNuY8hDHyscEAJJfCfTXdThVMQW5TOGnjOZxw@mail.gmail.com>
	 <8e065ede6abdb6065c862bd8b25cdccf2b6828a8.camel@linuxfoundation.org>
	 <CAP9ODKp1_CV4N-RB+NR4nTdvVgSR=pu6V7q2T2sQ8Pu8w=Ew2g@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Jul 2022 21:18:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168258

On Mon, 2022-07-18 at 16:25 -0300, Otavio Salvador wrote:
> Hello Richard and Khem
>=20
> Em seg., 18 de jul. de 2022 =C3=A0s 12:59, Richard Purdie
> <richard.purdie@linuxfoundation.org> escreveu:
> > On Mon, 2022-07-18 at 12:49 -0300, Otavio Salvador wrote:
> > > Em seg., 18 de jul. de 2022 =C3=A0s 09:45, Richard Purdie
> > > <richard.purdie@linuxfoundation.org> escreveu:
> > > > On Sun, 2022-07-10 at 13:43 -0300, Otavio Salvador wrote:
> > > > > Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> > > > SDKAMCHINE =3D "aarch64"
> > > > MACHINE =3D "qemuarm64"
> > > >=20
> > > > bitbake rust-cross-canadian-aarch64
> > > >=20
> > > > still fails so there is still something wrong with the SDK
> > > > builds
> > > > :/
> > > >=20
> > >=20
> > >=20
> > > I'll check this. I didn't check this combination.
> >=20
> > I tried an experiment to see which combinations worked. To do that
> > I
> > added:
> >=20
> > TOOLCHAIN_HOST_TASK:append =3D ' packagegroup-rust-cross-canadian-
> > ${MACHINE}'
> >=20
> > to the autobuilder config. This resulted in:
> >=20
> > qemux86:
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/59/builds/5491
> >=20
> > buildtools:
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/20/builds/5885
> >=20
> > beaglebone:
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/65/builds/5563
> >=20
> > edgerouter:
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/62/builds/5533
> >=20
> > genericx86:
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/48/builds/5548
> >=20
> > genericx86-64:
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/37/builds/5533
> >=20
> > multilib:
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/44/builds/5554
> >=20
> > pkgman-deb-non-deb:
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/50/builds/5554
> >=20
> > qemumips:
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/60/builds/5498
> >=20
> > qemux86-64:
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/73/builds/5487
> >=20
> > qemuarm64:
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/42/builds/5510
> >=20
> > qemuarm:
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/53/builds/5525
> >=20
> > so there is something rather wrong :(
> >=20
>=20
>=20
> It does, indeed, but it doesn't seem related to this PR.=C2=A0
>=20
> Do you know if this has worked?
>=20
> I am asking as I did all development and testing using=C2=A0SDKMACHINE ?=
=3D
> 'x86_64' and even=C2=A0MACHINE ?=3D 'qemuarm64' worked just fine. However=
,
> looking at some of the logs above, it seems it is using an SDKMACHINE
> as i686, so this appears as a different issue for me.
>=20

rust-cross-canadian hasn't officially worked properly or been
supported. In assessing whether a patch is better or worse, it is
useful to know which cases regress and which improve. I had hoped this
list of failures would be smaller. I will admit I don't know whether
this is better or worse than before so I guess that is the next thing I
need to determine.

What we don't know right now is which combinations work and which don't
so we can't even tell people what is expected to work and what
isn't/doesn't :(

I mentioned this report in case someone can work out the pattern, or
even better, understand what a fix looks like...

Cheers,

Richard





