Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EB06C04A6A
	for <webhook@archiver.kernel.org>; Wed,  2 Aug 2023 06:26:07 +0000 (UTC)
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
 by mx.groups.io with SMTP id smtpd.web10.8627.1690957559799111608
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Aug 2023 23:25:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=P9hxrfAO;
 spf=pass (domain: gmail.com, ip: 209.85.167.181, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-3a43cbb432aso4821200b6e.3
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Aug 2023 23:25:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690957559; x=1691562359;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kmVft+EsL/vIpT7RmLWaEbCwt0/IAEuWAvt4JfHXmAI=;
        b=P9hxrfAOJLWImmpkiFaTGHiY9JihDIHkgBRv73h++ie8vozsHfns57R6jGZCkV9vE8
         9Mt7RgAQxZGXNqkpiazyG8HimWT2va7gwsjz6rHVpSZqEIiFaRPcd6msxJjfS7d9bxli
         Lkk1ffi7OpVgX4CKYLquy95/PNt1imjPzGYkoDWeIOl0uocusWScyJF4gQf7Sm9du6qV
         2CWmwEV50arRd40n0l2cV9cofrtmhlppAFxwkX0VM6SiprmQcSM2m1IW+xetPQt0hnUN
         vh8BryBrKPrmQjOJ4Fh0b/dxwh8HnpSZ/lDBDGiYiInU2ZSNZhArrtFw3N5eh/aEVA6e
         567w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690957559; x=1691562359;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kmVft+EsL/vIpT7RmLWaEbCwt0/IAEuWAvt4JfHXmAI=;
        b=aT872MhjuTeeWpYWyLrv1Q3FI2xHlQjd1Z3X2RwOtHprVQkHXz53Vl7OJZezkSdVs/
         wRHZ8N6hG88jUkf2xgZ1wX+47COQh8rSfem8j9rHiwrH06+k4rky4KBohbV5/pits4IL
         Xi+49tgcbF7ZGksbGb9sEKw9YNPhmLGExjoNEIy+famxc0D46ImdBc8dNHBJ6Nxob7SD
         2C0LszrcndmvfFTwG1wy8krr04A3QQoKp7Ze3rlFAcX+cJhcn2yd/PQRtoWBvU5CmQGD
         MrLdJ9VWY31npTrNp1TjXYbq7IsmJ6UNi1B3aS5hgR/q2pSuwLLj5Tzfwv4eBUJdGp8p
         tzHg==
X-Gm-Message-State: ABy/qLZ52HjOubjBIxW0SyqglvSltEEOJSP3vYEltwnjibQNwcIvCaCt
	d9adI6N6qycvWsO+QxAm0PEHADUmH6XMBvlf/4U=
X-Google-Smtp-Source: APBJJlF5QNs8wT1DfRtLZTDoYyjWxhat+y6Qa2Rk5AUvSpt+3cW1JIwiyENUlgCQm/IWGwzg/LrohfTW+kKkKijGdXM=
X-Received: by 2002:a05:6808:698:b0:3a1:db18:401e with SMTP id
 k24-20020a056808069800b003a1db18401emr14836870oig.1.1690957558740; Tue, 01
 Aug 2023 23:25:58 -0700 (PDT)
MIME-Version: 1.0
References: <BL1PR11MB53994CAE41FD6DD380B2A385D30BA@BL1PR11MB5399.namprd11.prod.outlook.com>
In-Reply-To: <BL1PR11MB53994CAE41FD6DD380B2A385D30BA@BL1PR11MB5399.namprd11.prod.outlook.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 1 Aug 2023 23:25:32 -0700
Message-ID: <CAMKF1spgyqxTC=dt_CmJZnFRLkqdzP6AkrWewKP4BCH23ahB-w@mail.gmail.com>
Subject: Re: [OE-core] Python3-bcrypt fails for Power Pc
To: krkapate@cisco.com
Cc: "richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Aug 2023 06:26:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185377

On Tue, Aug 1, 2023 at 10:43=E2=80=AFPM Krupal Ka Patel -X (krkapate - E-IN=
FO
CHIPS INC at Cisco) via lists.openembedded.org
<krkapate=3Dcisco.com@lists.openembedded.org> wrote:
>
> Hi Richard,
>
> The python3-bcrypt fails for PowerPC with the below error:
>
> ERROR: python3-bcrypt-4.0.1-r0 do_compile_ptest_cargo: Unable to compile =
test with cargo, '/nobackup/krkapate/poky/poky/build/tmp/work/ppc7400-poky-=
linux/python3-bcrypt/4.0.1-r0/recipe-sysroot-native/usr/bin/cargo build --t=
ests --message-format json -v --offline --target powerpc-poky-linux-gnu --r=
elease --manifest-path=3D/nobackup/krkapate/poky/poky/build/tmp/work/ppc740=
0-poky-linux/python3-bcrypt/4.0.1-r0/bcrypt-4.0.1/src/_bcrypt/Cargo.toml' f=
ailed
> ERROR: Logfile of failure stored in: /nobackup/krkapate/poky/poky/build/t=
mp/work/ppc7400-poky-linux/python3-bcrypt/4.0.1-r0/temp/log.do_compile_ptes=
t_cargo.2752082
> ERROR: Task (/nobackup/krkapate/poky/poky/meta/recipes-devtools/python/py=
thon3-bcrypt_4.0.1.bb:do_compile_ptest_cargo) failed with exit code '1'
> NOTE: Tasks Summary: Attempted 2173 tasks of which 4 didn't need to be re=
run and 1 failed.
>
> Further, in the log.do_compile_ptest_cargo log file, below are the error =
messages:
>
> undefined reference to `PyBytes_AsString'\n          /nobackup/krkapate/p=
oky/poky/build/tmp/work/ppc7400-poky-linux/python3-bcrypt/4.0.1-r0/recipe-s=
ysroot-native/usr/bin/powerpc-poky-linux/../../libexec/powerpc-poky-linux/g=
cc/powerpc-poky-linux/13.2.0/ld.bfd: bcrypt_rust.1fd22faf-cgu.6:(.text._ZN3=
std9panicking3try17h86d4eb792b27c0beE+0x180): undefined reference to `PyByt=
es_Size'\n          /nobackup/krkapate/poky/poky/build/tmp/work/ppc7400-pok=
y-linux/python3-bcrypt/4.0.1-r0/recipe-sysroot-native/usr/bin/powerpc-poky-=
linux/../../libexec/powerpc-poky-linux/gcc/powerpc-poky-linux/13.2.0/ld.bfd=
: bcrypt_rust.1fd22faf-cgu.6:(.text._ZN3std9panicking3try17h86d4eb792b27c0b=
eE+0x258): undefined reference to `PyBytes_AsString'\n          /nobackup/k=
rkapate/poky/poky/build/tmp/work/ppc7400-poky-linux/python3-bcrypt/4.0.1-r0=
/recipe-sysroot-native/usr/bin/powerpc-poky-linux/../../libexec/
>
>
> As a workaround I can remove the below lines from the "bcrypt-4.0.1/src/_=
bcrypt/Cargo.toml" file, after that, I was able to build it successfully.
>
> - [features]
> - extension-module =3D ["pyo3/extension-module"]
> - default =3D ["extension-module"]
>
> Can anyone explain what is the proper way to fix this issue?
>
> Appreciating any responses/insights (for this issue).
>
PyBytes_AsString is python2 stable API and python3 strings are utf so
PyUnicode_AsUTF8 would be something available in python3. Can you post
full log file somewhere ?
secondly, also post the build configuration that bitbake prints at
top. Thirdly does it happen just on
ppc32 or also some other architecture like arm or mips or x86

> Thanks & Regards,
> Krupal
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#185376): https://lists.openembedded.org/g/openembedde=
d-core/message/185376
> Mute This Topic: https://lists.openembedded.org/mt/100499985/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

