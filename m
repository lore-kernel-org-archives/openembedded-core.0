Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 170D0C433EF
	for <webhook@archiver.kernel.org>; Mon, 18 Jul 2022 15:59:23 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web10.28988.1658159953136310632
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Jul 2022 08:59:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=CdDobyPo;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.44,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f44.google.com with SMTP id p4so7424647wms.0
        for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Jul 2022 08:59:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=z1YOJ29SApPSyefMEL9pPCIIb8kSgcDlf9SiBdU4StI=;
        b=CdDobyPordlc5qzfJ3g00Y0RzbmtTmXbpdNl0fpNe/DYFm/IhmGDaDybJMEjjRCV72
         laQMbF5n7hUlKFq1RcdrFzevsjpCncad0jZ3c4tQeQ0lMfXsTZ3equZSItULuiACzpX2
         fiHCcbihqz6MHiBMwA/CiRye3reK7CI+TS4s8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=z1YOJ29SApPSyefMEL9pPCIIb8kSgcDlf9SiBdU4StI=;
        b=hdFQogS7eM7xJejH704rWXElM7AU98iab+1kGEN5/fhKOdQCAhMoW+oSGwSxqFb3Ul
         A9VrXiYOHEzQD1K2XPWrJ7zgIyZ2nObObDquoios4sXy+m+KA6kINzBtEwxIS6G4T6X2
         zVdLK+aN/ACpRmQwXU8zGDp5OEmJM8Ro3Cu5VJ+PjIywX0kOVOKEScRdYBgErC5WPUxW
         u9CiNr1HpdDiyklR7xeGXCaVIdhZL+ZRP+5AgIsIq83y36lMiplJ9SDBNF96X+xlT1UC
         dW8Bumc7c1GvNmU6SjzlrkRG0Vy9rX+ZfL6sxBXCgpS1M1DtEMApumax5Cepz5AwmoIN
         LMWA==
X-Gm-Message-State: AJIora+hs7KH6uZ/7uMcWDu1T/Lm9KAFG9nYQ1EeXpaH4RFnArS5w214
	TRfBUP3XBJzbF9SufF+XIjMm6g==
X-Google-Smtp-Source: 
 AGRyM1vyhp95NprrE2XF9NBnS74xiKe5drgcVIbr3TZsxSINa3tOvKXOHNv2HIj1B9u65wTIyoDZfg==
X-Received: by 2002:a05:600c:4fcc:b0:3a1:987c:82c9 with SMTP id
 o12-20020a05600c4fcc00b003a1987c82c9mr34397337wmq.73.1658159951512;
        Mon, 18 Jul 2022 08:59:11 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:5ca2:743d:43c8:8a3?
 ([2001:8b0:aba:5f3c:5ca2:743d:43c8:8a3])
        by smtp.gmail.com with ESMTPSA id
 p17-20020adff211000000b0021d9207e6f1sm11102648wro.34.2022.07.18.08.59.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Jul 2022 08:59:10 -0700 (PDT)
Message-ID: 
 <8e065ede6abdb6065c862bd8b25cdccf2b6828a8.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2 2/2] cargo-cross-canadian: Use SDK's flags
 during target linking
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>, Patches and discussions
	about the oe-core layer <openembedded-core@lists.openembedded.org>
Date: Mon, 18 Jul 2022 16:59:10 +0100
In-Reply-To: 
 <CAP9ODKooHNY8GyNuY8hDHyscEAJJfCfTXdThVMQW5TOGnjOZxw@mail.gmail.com>
References: <20220710164300.953098-1-otavio@ossystems.com.br>
	 <20220710164300.953098-2-otavio@ossystems.com.br>
	 <e642480e892b0b411acb509c0de11aa7e52d4412.camel@linuxfoundation.org>
	 <CAP9ODKooHNY8GyNuY8hDHyscEAJJfCfTXdThVMQW5TOGnjOZxw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Jul 2022 15:59:23 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168239

On Mon, 2022-07-18 at 12:49 -0300, Otavio Salvador wrote:
>=20
>=20
> Em seg., 18 de jul. de 2022 =C3=A0s 09:45, Richard Purdie
> <richard.purdie@linuxfoundation.org> escreveu:
> > On Sun, 2022-07-10 at 13:43 -0300, Otavio Salvador wrote:
> > > Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> > > ---
> > >=20
> > > (no changes since v1)
> > >=20
> > > =C2=A0 .../cargo/cargo-cross-canadian.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 | 20
> > > ++++++++++++++++++-
> > > =C2=A0 1 file changed, 19 insertions(+), 1 deletion(-)
> >=20
> > I did look into this with some local testing. With:
> >=20
> > SDKAMCHINE =3D "aarch64"
> > MACHINE =3D "qemuarm64"
> >=20
> > bitbake rust-cross-canadian-aarch64
> >=20
> > still fails so there is still something wrong with the SDK builds
> > :/
> >=20
>=20
>=20
> I'll check this. I didn't check this combination.

I tried an experiment to see which combinations worked. To do that I
added:

TOOLCHAIN_HOST_TASK:append =3D ' packagegroup-rust-cross-canadian-${MACHINE=
}'

to the autobuilder config. This resulted in:

qemux86:
https://autobuilder.yoctoproject.org/typhoon/#/builders/59/builds/5491

buildtools:
https://autobuilder.yoctoproject.org/typhoon/#/builders/20/builds/5885

beaglebone:
https://autobuilder.yoctoproject.org/typhoon/#/builders/65/builds/5563

edgerouter:
https://autobuilder.yoctoproject.org/typhoon/#/builders/62/builds/5533

genericx86:
https://autobuilder.yoctoproject.org/typhoon/#/builders/48/builds/5548

genericx86-64:
https://autobuilder.yoctoproject.org/typhoon/#/builders/37/builds/5533

multilib:
https://autobuilder.yoctoproject.org/typhoon/#/builders/44/builds/5554

pkgman-deb-non-deb:
https://autobuilder.yoctoproject.org/typhoon/#/builders/50/builds/5554

qemumips:
https://autobuilder.yoctoproject.org/typhoon/#/builders/60/builds/5498
 =20
qemux86-64:
https://autobuilder.yoctoproject.org/typhoon/#/builders/73/builds/5487

qemuarm64:
https://autobuilder.yoctoproject.org/typhoon/#/builders/42/builds/5510

qemuarm:
https://autobuilder.yoctoproject.org/typhoon/#/builders/53/builds/5525

so there is something rather wrong :(

Cheers,

Richard

