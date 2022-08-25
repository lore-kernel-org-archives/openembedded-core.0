Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 537B0C28D13
	for <webhook@archiver.kernel.org>; Thu, 25 Aug 2022 15:25:20 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web10.25212.1661441109350928527
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Aug 2022 08:25:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=DwA93CdG;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.45,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f45.google.com with SMTP id az27so5056794wrb.6
        for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Aug 2022 08:25:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc;
        bh=YCuj1UKBLU5G1wmEvP+qTz9tfUW0fCC/ZZLEJJWyYHk=;
        b=DwA93CdGNmF3RqfvsQCgkDpRVfDGE5z7O8d6AUDrkaYvef2iRbLcu3upEQyrmVNhBr
         3E75yl6wF4p80fqhO+/ktE4L2x/mhiS9cgjFcVdsfA10igCvcxXqEA4c5tcWWV0FGhN0
         7du6nrpkCdcfUl7G6kWZyP4uxfS6rgEj5omNA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc;
        bh=YCuj1UKBLU5G1wmEvP+qTz9tfUW0fCC/ZZLEJJWyYHk=;
        b=cL2w5prlY9obYARRXWVXOj01LGpDyCMFAIVHU/oU1J9UKW82V+mAOjnteXcUTClBFc
         7hvfndvQzjHSr16rtK7HkufaZTanvOsa5u+IyyNR3oHB2Ee7rFR1QNilxESlRqHnG8MI
         zpu4AKQ9PADhtwSxtX10x9X7tBx+u6vQ28xVAHVFpSN2BOIRtfKFvjTTLcjQN/71PIlP
         HrAThvon2YaSAqTc7SEvzLRLwzxNjPlb2lVL+WmtUo+/j8d7hG2yxLcvLmCBA/xJxX9j
         hPHTtsDoFD5E5a3TrXh6LIKEgifQDp6tAaHiYAg13O5Qy06M95ObAWKldleliAL6V+Yo
         +gaQ==
X-Gm-Message-State: ACgBeo3f7dSNE7CiUtSG1PDyDQB+SxUO1a7hy1H9u0iwMrph+xE1RqGf
	FaJSOCImuLmPRC1oeBhu0l5KHQ==
X-Google-Smtp-Source: 
 AA6agR4CzRoR1OtU0AhXJoOKigcCrK6TiqGG8DVzcb+M5nSDXUNtykZKx0bbktmQ9RpW2dEF4cD7iA==
X-Received: by 2002:adf:fbd2:0:b0:21e:7f74:5df1 with SMTP id
 d18-20020adffbd2000000b0021e7f745df1mr2646947wrs.43.1661441107372;
        Thu, 25 Aug 2022 08:25:07 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:8059:8737:891c:87d?
 ([2001:8b0:aba:5f3c:8059:8737:891c:87d])
        by smtp.gmail.com with ESMTPSA id
 h188-20020a1c21c5000000b003a54f1d007csm5668711wmh.10.2022.08.25.08.25.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Aug 2022 08:25:06 -0700 (PDT)
Message-ID: 
 <093ee50ae3296829910f9c6a32209002aa7a2461.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 2/2] oeqa/sdk: extend rust test to also use a
 build script
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Peter Bergin <peter@berginkonsult.se>,
	openembedded-core@lists.openembedded.org
Date: Thu, 25 Aug 2022 16:25:05 +0100
In-Reply-To: <b6d8218a-043e-cb3a-3783-5fe1ce6e4541@berginkonsult.se>
References: <20220823085636.30868-1-peter@berginkonsult.se>
	 <20220823085636.30868-2-peter@berginkonsult.se>
	 <6ca1d415a0faeba53e6a3945bd1fafd89866e2e9.camel@linuxfoundation.org>
	 <f7469b7e-7df2-e418-6da0-7427bbdc8cfd@berginkonsult.se>
	 <af63da104ec9d91ab441d3cabfaadfe4700760fa.camel@linuxfoundation.org>
	 <b6d8218a-043e-cb3a-3783-5fe1ce6e4541@berginkonsult.se>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 25 Aug 2022 15:25:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169878

On Thu, 2022-08-25 at 14:03 +0200, Peter Bergin wrote:
> Hi Richard,
>=20
> On 2022-08-25 10:21, Richard Purdie wrote:
> > <snip>
> > > I've tried locally to reproduce something. I've built and tested
> > > genericx86 and qemuarm64 now on core-image-sato sdk that I saw was th=
e
> > > target for the autobuilder. Both tests passes. The failure I see in t=
he
> > > autobuilder logs is that the build script can not be executed. On my
> > > machine I have that file and it can clearly be executed:
> > >=20
> > > $ find
> > > tmp/work/genericx86-poky-linux/core-image-sato/1.0-r0/testimage-sdk/h=
ello/target/
> > > -name build-script-build
> > > tmp/work/genericx86-poky-linux/core-image-sato/1.0-r0/testimage-sdk/h=
ello/target/debug/build/hello-4dbf26d86b93a892/build-script-build
> > >=20
> > > $
> > > tmp/work/genericx86-poky-linux/core-image-sato/1.0-r0/testimage-sdk/h=
ello/target/debug/build/hello-4dbf26d86b93a892/build-script-build
> > >=20
> > > $ file
> > > tmp/work/genericx86-poky-linux/core-image-sato/1.0-r0/testimage-sdk/h=
ello/target/debug/build/hello-4dbf26d86b93a892/build-script-build
> > >=20
> > > tmp/work/genericx86-poky-linux/core-image-sato/1.0-r0/testimage-sdk/h=
ello/target/debug/build/hello-4dbf26d86b93a892/build-script-build:
> > > ELF 64-bit LSB pie executable, x86-64, version 1 (SYSV), dynamically
> > > linked, interpreter
> > > /storage/yocto/esp5-platform/build/genericx86/tmp/work/genericx86-pok=
y-linux/core-image-sato/1.0-r0/testimage-sdk/sysroots/x86_64-pokysdk-linux/=
lib/ld-linux-x86-64.so.2,
> > > BuildID[sha1]=3Dc5d5e70657f8342addf5343d0206c77d9d767fd8, for GNU/Lin=
ux
> > > 3.2.0, with debug_info, not stripped
> > >=20
> > > Found one interesting link here
> > > https://github.com/rust-lang/cargo/issues/3553. Unfortunately without
> > > answer. But also checked the interpreter in my build which looks corr=
ect?
> > >=20
> > > $ readelf -a
> > > tmp/work/genericx86-poky-linux/core-image-sato/1.0-r0/testimage-sdk/h=
ello/target/debug/build/hello-4dbf26d86b93a892/build-script-build
> > > > grep interpreter
> > >   =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 [Requesting program interpreter:
> > > /storage/yocto/esp5-platform/build/genericx86/tmp/work/genericx86-pok=
y-linux/core-image-sato/1.0-r0/testimage-sdk/sysroots/x86_64-pokysdk-linux/=
lib/ld-linux-x86-64.so.2]
> > >=20
> > >=20
> > > So there are some differences between my machine and the autobuilder
> > > setup that I can't get. I would need help here as I'm not that famili=
ar
> > > with the autobuilder setup. Can it still be some host dependency? I'm
> > > running on Ubuntu 22.04. Is it possible to check in a autobuilder set=
up
> > > if the file 'build-script-build' is present and possible to execute?
> > After staring at this for an hour, I think the pattern is that is it
> > failing on builds with:
> >=20
> > SDKMACHINE =3D "i686"
> >=20
> > which probably means the linker isn't linking against the libc and
> > loader in the SDK properly.
> >=20
> > (i686 SDK binaries should run on x86_64 hosts since we provide our own
> > loader and libc)
>=20
> Thanks a lot for the reproducer. You are correct, with SDKMACHINE i686 I=
=20
> was able to reproduce. I want to share some weird stuff and see if=20
> someone can get a clue for a solution.
>=20
> Did same analyze on the build-script-build file as I did on a working one=
:

As I suspected, the dynamic loader on binaries built using the
toolchain in the SDK isn't working correctly.=20

"/usr/local/oe-sdk-hardcoded-buildpath/sysroots/i686-pokysdk-
linux/lib/ld-linux.so.2"

is the value used at build time. This is supposed to be relocated into
the SDK's install location at runtime.

The question is therefore where is rust getting this value from? You
can specify it to the linker at compile time along the lines of:

-Wl,--dynamic-linker=3D/path/to/ld-linux.so.2

or it can be the default that comes from toolchain. It is important it
points at the one in the SDK, not on the host system.

The bit I don't understand is whether:

a) the compiler in the SDK is generating the wrong loader (in which
case buildtools-extended-tarball would break which it doesn't)
b) rust is hardcoding some dynamic-linker option somewhere it shouldn't
c) whether the toolchain is relocating paths correctly or some path
isn't relocating and is being used here.

I'd suggest first checking that a binary generated by nativesdk-gcc in
the SDK has the right loader. If that is the case, see what compiler
options are being used to create the build tool and go from there.

FWIW you can see/change the interpreter with patchelf.

Cheers,

Richard


