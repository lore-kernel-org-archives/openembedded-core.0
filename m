Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 465D0C38145
	for <webhook@archiver.kernel.org>; Fri,  2 Sep 2022 13:58:30 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web08.6798.1662127109238327549
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Sep 2022 06:58:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ieclu1Sx;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.44,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f44.google.com with SMTP id e20so2402696wri.13
        for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Sep 2022 06:58:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date;
        bh=Kd3zdQxCcJRMyFz7Kna/ZfvfuaTWEwfwMHU4KB0E26g=;
        b=ieclu1SxViezEFb3UwYDXY/N9L4WQnRDdEja2qco6X6pbFLR3M2WtDmuq/jJ7qVdnk
         w6F+7mnQX7SS3x4pLaHdMqzDfTSDhUTiwMGWITgBlucu5/xyfh/ihmUbDet15jOHeuap
         RKP/hdIliGQcUt3MjkgFviYUgKrKWbnTmoF48=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date;
        bh=Kd3zdQxCcJRMyFz7Kna/ZfvfuaTWEwfwMHU4KB0E26g=;
        b=0LdPsxbDywqEskZS09TJVhMTMHql7fNH1KWTWNLV9lVsE+SpRebByhUHCZuWY42I9V
         JrtVSDl+8jHlIWefyVhn4b+h9BtqbykDl1rkYpUCaCDg7uV/+sE3jxMXAUv7lSDHc+dB
         c+DM2XRo/KDGVBnP8X+2tksxJJcsD0dCy48JFBv/NHfzcC62qK72ER+3BrOM6IsSEOtW
         oPAWfby7A1DLcgFQ8Y4ubLhgewX45jt3DY436myzg92CIO9fGfz74kLF0eAlsIcP26zw
         pKpi6CuNSF4lUqXy4fY5lET07NHo56KxgVxsQVASC1Gw9jA0i4/8kB++O1v21NnpUUBf
         G6tw==
X-Gm-Message-State: ACgBeo2j7XkgjEvtVyohgaTfGrSndqe5fdwjUgtRRtW2J0EIn9fUO2pv
	OiX7ViRIyKuf2xdtjP0Iy5kweg==
X-Google-Smtp-Source: 
 AA6agR52eyNVI3yyYZI6FkFZjrXCu31zOIectgsDWPEcSZHqmO42qOFU8ASnJ6yop4ExpNaFbUncuw==
X-Received: by 2002:a5d:6f19:0:b0:226:e3d1:52c6 with SMTP id
 ay25-20020a5d6f19000000b00226e3d152c6mr10278795wrb.318.1662127107554;
        Fri, 02 Sep 2022 06:58:27 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:cbec:572b:ff3a:e320?
 ([2001:8b0:aba:5f3c:cbec:572b:ff3a:e320])
        by smtp.gmail.com with ESMTPSA id
 f25-20020a1c6a19000000b003a840690609sm9260071wmc.36.2022.09.02.06.58.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Sep 2022 06:58:26 -0700 (PDT)
Message-ID: 
 <43bf3206b5905ca67bc1c7e50e9d0110c8950bb0.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 2/2] oeqa/sdk: extend rust test to also use a
 build script
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Peter Bergin <peter@berginkonsult.se>,
	openembedded-core@lists.openembedded.org, Khem Raj <raj.khem@gmail.com>
Date: Fri, 02 Sep 2022 14:58:25 +0100
In-Reply-To: <17110E74E03CD5FD.12033@lists.openembedded.org>
References: <20220823085636.30868-1-peter@berginkonsult.se>
	 <20220823085636.30868-2-peter@berginkonsult.se>
	 <6ca1d415a0faeba53e6a3945bd1fafd89866e2e9.camel@linuxfoundation.org>
	 <f7469b7e-7df2-e418-6da0-7427bbdc8cfd@berginkonsult.se>
	 <af63da104ec9d91ab441d3cabfaadfe4700760fa.camel@linuxfoundation.org>
	 <b6d8218a-043e-cb3a-3783-5fe1ce6e4541@berginkonsult.se>
	 <093ee50ae3296829910f9c6a32209002aa7a2461.camel@linuxfoundation.org>
	 <0f4a63bc-4be4-126d-a403-804f75140a53@berginkonsult.se>
	 <17110E74E03CD5FD.12033@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Sep 2022 13:58:30 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170247

On Fri, 2022-09-02 at 14:33 +0100, Richard Purdie via
lists.openembedded.org wrote:
> On Mon, 2022-08-29 at 13:09 +0200, Peter Bergin wrote:
> > Hi Richard,
> >=20
> > (also adding Khem Raj to CC as maintainer for gcc in oe-core)
> >=20
> > On 2022-08-25 17:25, Richard Purdie wrote:
> > > On Thu, 2022-08-25 at 14:03 +0200, Peter Bergin wrote:
> > > > Hi Richard,
> > > >=20
> > > > On 2022-08-25 10:21, Richard Purdie wrote:
> > > > > <snip>
> > > > > > I've tried locally to reproduce something. I've built and teste=
d
> > > > > > genericx86 and qemuarm64 now on core-image-sato sdk that I saw =
was the
> > > > > > target for the autobuilder. Both tests passes. The failure I se=
e in the
> > > > > > autobuilder logs is that the build script can not be executed. =
On my
> > > > > > machine I have that file and it can clearly be executed:
> > > > > >=20
> > > > > > $ find
> > > > > > tmp/work/genericx86-poky-linux/core-image-sato/1.0-r0/testimage=
-sdk/hello/target/
> > > > > > -name build-script-build
> > > > > > tmp/work/genericx86-poky-linux/core-image-sato/1.0-r0/testimage=
-sdk/hello/target/debug/build/hello-4dbf26d86b93a892/build-script-build
> > > > > >=20
> > > > > > $
> > > > > > tmp/work/genericx86-poky-linux/core-image-sato/1.0-r0/testimage=
-sdk/hello/target/debug/build/hello-4dbf26d86b93a892/build-script-build
> > > > > >=20
> > > > > > $ file
> > > > > > tmp/work/genericx86-poky-linux/core-image-sato/1.0-r0/testimage=
-sdk/hello/target/debug/build/hello-4dbf26d86b93a892/build-script-build
> > > > > >=20
> > > > > > tmp/work/genericx86-poky-linux/core-image-sato/1.0-r0/testimage=
-sdk/hello/target/debug/build/hello-4dbf26d86b93a892/build-script-build:
> > > > > > ELF 64-bit LSB pie executable, x86-64, version 1 (SYSV), dynami=
cally
> > > > > > linked, interpreter
> > > > > > /storage/yocto/esp5-platform/build/genericx86/tmp/work/genericx=
86-poky-linux/core-image-sato/1.0-r0/testimage-sdk/sysroots/x86_64-pokysdk-=
linux/lib/ld-linux-x86-64.so.2,
> > > > > > BuildID[sha1]=3Dc5d5e70657f8342addf5343d0206c77d9d767fd8, for G=
NU/Linux
> > > > > > 3.2.0, with debug_info, not stripped
> > > > > >=20
> > > > > > Found one interesting link here
> > > > > > https://github.com/rust-lang/cargo/issues/3553. Unfortunately w=
ithout
> > > > > > answer. But also checked the interpreter in my build which look=
s correct?
> > > > > >=20
> > > > > > $ readelf -a
> > > > > > tmp/work/genericx86-poky-linux/core-image-sato/1.0-r0/testimage=
-sdk/hello/target/debug/build/hello-4dbf26d86b93a892/build-script-build
> > > > > > > grep interpreter
> > > > > >    =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 [Requesting program interpret=
er:
> > > > > > /storage/yocto/esp5-platform/build/genericx86/tmp/work/genericx=
86-poky-linux/core-image-sato/1.0-r0/testimage-sdk/sysroots/x86_64-pokysdk-=
linux/lib/ld-linux-x86-64.so.2]
> > > > > >=20
> > > > > >=20
> > > > > > So there are some differences between my machine and the autobu=
ilder
> > > > > > setup that I can't get. I would need help here as I'm not that =
familiar
> > > > > > with the autobuilder setup. Can it still be some host dependenc=
y? I'm
> > > > > > running on Ubuntu 22.04. Is it possible to check in a autobuild=
er setup
> > > > > > if the file 'build-script-build' is present and possible to exe=
cute?
> > > > > After staring at this for an hour, I think the pattern is that is=
 it
> > > > > failing on builds with:
> > > > >=20
> > > > > SDKMACHINE =3D "i686"
> > > > >=20
> > > > > which probably means the linker isn't linking against the libc an=
d
> > > > > loader in the SDK properly.
> > > > >=20
> > > > > (i686 SDK binaries should run on x86_64 hosts since we provide ou=
r own
> > > > > loader and libc)
> > > > Thanks a lot for the reproducer. You are correct, with SDKMACHINE i=
686 I
> > > > was able to reproduce. I want to share some weird stuff and see if
> > > > someone can get a clue for a solution.
> > > >=20
> > > > Did same analyze on the build-script-build file as I did on a worki=
ng one:
> > > As I suspected, the dynamic loader on binaries built using the
> > > toolchain in the SDK isn't working correctly.
> > >=20
> > > "/usr/local/oe-sdk-hardcoded-buildpath/sysroots/i686-pokysdk-
> > > linux/lib/ld-linux.so.2"
> > >=20
> > > is the value used at build time. This is supposed to be relocated int=
o
> > > the SDK's install location at runtime.
> > >=20
> > > The question is therefore where is rust getting this value from? You
> > > can specify it to the linker at compile time along the lines of:
> > >=20
> > > -Wl,--dynamic-linker=3D/path/to/ld-linux.so.2
> > >=20
> > > or it can be the default that comes from toolchain. It is important i=
t
> > > points at the one in the SDK, not on the host system.
> > >=20
> > > The bit I don't understand is whether:
> > >=20
> > > a) the compiler in the SDK is generating the wrong loader (in which
> > > case buildtools-extended-tarball would break which it doesn't)
> > > b) rust is hardcoding some dynamic-linker option somewhere it shouldn=
't
> > > c) whether the toolchain is relocating paths correctly or some path
> > > isn't relocating and is being used here.
> > >=20
> > > I'd suggest first checking that a binary generated by nativesdk-gcc i=
n
> > > the SDK has the right loader. If that is the case, see what compiler
> > > options are being used to create the build tool and go from there.
> > >=20
> > > FWIW you can see/change the interpreter with patchelf.
> > >=20
> > > Cheers,
> > >=20
> > > Richard
> >=20
> > I've tried to narrow this down further and I can say now that this erro=
r=20
> > when building the native rust build script is not directly related to=
=20
> > cargo/rust but to the native gcc compiler shipped in the SDK. I will=
=20
> > next try to dig down in the gcc build process but before spending time=
=20
> > there I would like to share my finding and see if someone have ideas.
> >=20
> > I have two SDKs one with SDKMACHINE=3D"x86_64" and one with=20
> > SDKMACHINE=3D"i686". I have the hosts gcc compiler installed in them an=
d=20
> > use them to compile a minimal c code example with hello world. The one=
=20
> > for "x86_64" works well and is using the program interpreter from the=
=20
> > SDK. The executable compiled and linked with "i686" toolchain will have=
=20
> > a program interpreter pointing to=20
> > "/usr/local/oe-sdk-hardcoded-buildpath/sysroots/i686-pokysdk-linux/lib/=
ld-linux.so.2".=20
> > I will paste in output from the two experiments here below:
> >=20
> > x86_64:
> >=20
> > $=20
> > <sdk-install>/sysroots/x86_64-pokysdk-linux/usr/bin/x86_64-pokysdk-linu=
x-gcc=20
> > main.c
> > $ ./a.out
> > Hello world!
> > $ readelf -a a.out | grep interpreter
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 [Requesting program interpreter:=20
> > <sdk-install>/sysroots/x86_64-pokysdk-linux/lib/ld-linux-x86-64.so.2]
> > $=20
> > <sdk-install>/sysroots/x86_64-pokysdk-linux/usr/bin/x86_64-pokysdk-linu=
x-gcc=20
> > -dumpspecs | grep -A 1 *dynamic_linker
> >=20
> > i686:
> >=20
> > $=20
> > <sdk-install>/sysroots/i686-pokysdk-linux/usr/bin/i686-pokysdk-linux-gc=
c=20
> > main.c
> > $ ./a.out
> > -bash: ./a.out: No such file or directory
> > $ readelf -a a.out | grep interpreter
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 [Requesting program interpreter:=20
> > /usr/local/oe-sdk-hardcoded-buildpath/sysroots/i686-pokysdk-linux/lib/l=
d-linux.so.2]=20
> >=20
> > $=20
> > <sdk-install>/sysroots/i686-pokysdk-linux/usr/bin/i686-pokysdk-linux-gc=
c=20
> > -dumpspecs | grep -A 1 *dynamic_linker
> > *dynamic_linker:
> > %{muclibc:%rld-uClibc.so.0;:%{mbionic:/system/bin/linker;:%{mmusl:/usr/=
local/oe-sdk-hardcoded-buildpath/sysroots/i686-pokysdk-linux/lib/ld-musl-i3=
86.so.1;:/usr/local/oe-sdk-hardcoded-buildpath/sysroots/i686-pokysdk-linux/=
lib/ld-linux.so.2}}}=20
> >=20
> >=20
> > Noted above is that the spec-file (-dumpspecs) for i686 have a sections=
=20
> > with "*dynamic_linker" but that one is missing in x86_64.
> >=20
> > So my conclusion around the results above is that something seems=20
> > missconfigured in the nativesdk-gcc build for i686. When cargo/rust is=
=20
> > using the native compiler to build its build script it is set to use=
=20
> > wrong program interpreter and when executed it fails just as my a.out=
=20
> > above does. I hope this can give you some more ideas where to look next=
=20
> > and ultimately how to solve this.
> >=20
>=20
> I couldn't remeber the details of how this worked and there has been a
> lot going on so I only just got around to experimenting. This might be
> really simple fix:
>=20
> diff --git a/meta/recipes-devtools/gcc/gcc-multilib-config.inc b/meta/rec=
ipes-devtools/gcc/gcc-multilib-config.inc
> index 26bfed9507b..2dbbc23c940 100644
> --- a/meta/recipes-devtools/gcc/gcc-multilib-config.inc
> +++ b/meta/recipes-devtools/gcc/gcc-multilib-config.inc
> @@ -154,7 +154,7 @@ python gcc_multilib_setup() {
>      gcc_header_config_files =3D {
>          'x86_64'    : ['gcc/config/linux.h', 'gcc/config/i386/linux.h', =
'gcc/config/i386/linux64.h'],
>          'i586'      : ['gcc/config/linux.h', 'gcc/config/i386/linux.h', =
'gcc/config/i386/linux64.h'],
> -        'i686'      : ['gcc/config/linux.h', 'gcc/config/i386/linux64.h'=
],
> +        'i686'      : ['gcc/config/linux.h', 'gcc/config/i386/linux.h', =
'gcc/config/i386/linux64.h'],
>          'mips'      : ['gcc/config/linux.h', 'gcc/config/mips/linux.h', =
'gcc/config/mips/linux64.h'],
>          'mips64'    : ['gcc/config/linux.h', 'gcc/config/mips/linux.h', =
'gcc/config/mips/linux64.h'],
>          'powerpc'   : ['gcc/config/linux.h', 'gcc/config/rs6000/linux64.=
h'],
>=20
>=20
> which changes the linux.h header to have a %r instead of a
> SYSTEMLIBS_DIR hardcoded definition. That will the relocate with the
> toolchain.
>=20
> I've not tested this yet but seems like the right thing to fix.

I was able to confirm that fixed a simple test case for nativesdk-gcc
on i686 so I'll queue it up to reset the rust changes.

Cheers,

Richard

