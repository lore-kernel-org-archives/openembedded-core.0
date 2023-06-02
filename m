Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8A22C77B7A
	for <webhook@archiver.kernel.org>; Fri,  2 Jun 2023 11:32:37 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web10.10194.1685705554753611254
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Jun 2023 04:32:35 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linuxfoundation.org header.s=google header.b=gLppMT1A;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-3f6094cb2d2so19779865e9.2
        for <openembedded-core@lists.openembedded.org>; Fri, 02 Jun 2023 04:32:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1685705553; x=1688297553;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=EZdBOAtftd+bxPexG5qt95Mqi/FiXYkoRoR9mqy8JVY=;
        b=gLppMT1AunTU0URfnMACUdupqy9lvK1EqnraB2xkyXikdM7wwNzqyw1+nltcHsW6c/
         0h583Dwv7fnfXcW0omIMeCKg9MjMA8kC7WZWt8UD5BbMeRfeUgcIKjG8IYKJYtA6tVy0
         YP/nQJ+RxVNR6JPQOL/1e0FUK5E5uOz2q6LuQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685705553; x=1688297553;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EZdBOAtftd+bxPexG5qt95Mqi/FiXYkoRoR9mqy8JVY=;
        b=XimkNwzzEv3trpCiDgojR9/eAQoHteTO7irlPLF6GhbfRD80BrPzCfuVz/gilJQtPp
         euwHi5niJKcFkTNotfJi5cxaT3boIDv338QchPo2du35WyXFAYrCXsYnqaBrHKdCwT8T
         pcrBnsqmw5o8de9l2e5ECv3oFr8OEz0UEWRe5+nvZ0b5Kyoft6hNSyWO3UhSx4bR2GRI
         P3E1rOO5AyjmHgNWGC74P4/pScwt1Nxw9n//T6x1/hbPntH1iWxJjTa9GFJ1unhIhL8H
         6fibgr01qL0j50OO1ix2FG+0p3n7lYa/tyNYwStKK9KCZ+PDFXy/s06pO9a3GMP5SdUB
         /jgw==
X-Gm-Message-State: AC+VfDztG0rmBIV5j5KYu73rR4cJgZ2wMjACcqAQ5kW9Orq+KRpbL5g+
	YtHC9yxUr4wls8QWswMCToPMOQ==
X-Google-Smtp-Source: ACHHUZ4yvV4c/3Qtuq4q1gMzVmaTrm+wiUrmQpUD5u8JOqDcdYk2V7WeFsBCQjswODl8Fdb3VWhSsA==
X-Received: by 2002:a7b:c847:0:b0:3f4:21ff:b91f with SMTP id c7-20020a7bc847000000b003f421ffb91fmr1507662wml.28.1685705553032;
        Fri, 02 Jun 2023 04:32:33 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:527f:ecab:4831:c523? ([2001:8b0:aba:5f3c:527f:ecab:4831:c523])
        by smtp.gmail.com with ESMTPSA id x13-20020a1c7c0d000000b003f4247fbb5fsm5246357wmc.10.2023.06.02.04.32.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jun 2023 04:32:32 -0700 (PDT)
Message-ID: <32fea4adeae13df4a98727293e9aa82b0f65b87d.camel@linuxfoundation.org>
Subject: Re: [PATCH v14] Rust Oe-Selftest implementation
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Shinde, Yash" <Yash.Shinde@windriver.com>, "Kokkonda, Sundeep"
 <Sundeep.Kokkonda@windriver.com>,
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
Cc: "MacLeod, Randy" <Randy.MacLeod@windriver.com>, "Kallapa, Umesh"
 <Umesh.Kallapa@windriver.com>, "Gowda, Naveen"
 <Naveen.Gowda@windriver.com>,  "Moodalappa, Shivaprasad"
 <Shivaprasad.Moodalappa@windriver.com>
Date: Fri, 02 Jun 2023 12:32:31 +0100
In-Reply-To: <SJ1PR11MB61294CC48FD3D027E729C03CEB4EA@SJ1PR11MB6129.namprd11.prod.outlook.com>
References: <20230530105125.445622-1-yashinde145@gmail.com>
	 <7c9a0a78204958d84c4a3779da7c0f1b0e66dda8.camel@linuxfoundation.org>
	 <CH2PR11MB4470880E838BBC66386FA2A489489@CH2PR11MB4470.namprd11.prod.outlook.com>
	 <SJ1PR11MB61294CC48FD3D027E729C03CEB4EA@SJ1PR11MB6129.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Jun 2023 11:32:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182304

Hi Yash,

On Fri, 2023-06-02 at 07:25 +0000, Shinde, Yash wrote:
>=20
> As discussed in the meeting, I am sharing the steps followed and host con=
figurations used for the testing-
> =C2=A0
> Steps followed for testing-
> =C2=A0
> 1. Clone a fresh poky from $ git clone git://git.yoctoproject.org/poky
> 2. source the build environment setup script
> 3. add the meta-selftest layer in conf/bblayers.conf
> 4. add SANITY_TESTED_DISTROS=3D"" to local.conf
> 5. Apply the testing patch changes-
> =C2=A0=C2=A0 a. Add=C2=A0 meta/lib/oeqa/selftest/cases/rust.py file conta=
ining testing code
> =C2=A0=C2=A0 b. Add meta/recipes-devtools/rust/files/rust-oe-selftest.pat=
ch to exclude failing cases.
> =C2=A0=C2=A0 c. Add rust-oe-selftest.patch in meta/recipes-devtools/rust/=
rust-source.inc to apply on rust sources.
> =C2=A0=C2=A0 d. Add "do_test_compile ()" for testing rust sources in meta=
/recipes-devtools/rust/rust_1.69.0.bb
> =C2=A0=C2=A0 e. Run the oe-selftest via "oe-selftest -r rust.RustSelfTest=
Base.test_check" command.

As I promised, I did try these steps and you are correct that they are
successful. However, if I try:

"bitbake rust"

I see the failure here:

https://autobuilder.yoctoproject.org/typhoon/#/builders/73/builds/7128/step=
s/12/logs/stdio

likewise, I suspect "bitbake nativesdk-rust" will also fail with the
other failure mentioned there.

This does not happen unless your patch is applied so it is a
regression. There are likely other failures however this one is pretty
fundamental so we should start by fixing that.

I did document my exact steps as follows:

$ git clone git://git.yoctoproject.org/poky poky-rusttest
$ cd poky-rusttest/
$ source oe-init-build-env
$ echo 'BBLAYERS +=3D "/media/build/poky-rusttest/meta-selftest"' >>
conf/bblayers.conf=20
$ echo 'SANITY_TESTED_DISTROS =3D ""' >> conf/local.conf=20
$ echo 'DL_DIR =3D "/media/sources/"' >> conf/local.conf=20
$ wget
https://lore.kernel.org/openembedded-core/20230530105125.445622-1-yashinde1=
45@gmail.com/raw
$ git am -s raw
$ oe-selftest -r rust.RustSelfTestBase.test_check
$ bitbake rust nativesdk-rust -k

where the only real difference to your steps was to set DL_DIR to my
local sources cache to avoid downloading things needlessly.


Cheers,

Richard


