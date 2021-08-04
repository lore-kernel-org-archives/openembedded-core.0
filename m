Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
 by mx.groups.io with SMTP id smtpd.web10.12325.1628097643113699577
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Aug 2021 10:20:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=SAtay+xm;
 spf=pass (domain: gmail.com, ip: 209.85.208.50, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f50.google.com with SMTP id i6so4547356edu.1
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Aug 2021 10:20:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=TwDfoAgypLT8l03j38lLFzbOlQqJwdvqWyDi7lubj74=;
        b=SAtay+xmF2uyZep1vaDC24rf31B8hPnGqGj+thXWo3Iueer33jBidLY2Ss3xaGWZ8c
         pO+he7oKjVCkFjgHtnoODFvOWMkLByC97nbtcUjknHJQA0tv7eTREnCQalIEUvz/ojXm
         T4k8XmaO40eazd9y9KiwvLU01OZ+sE9QsNVJkRzrtLro0+xIs3yKD76a9Fp9R8sKjYED
         fB/g13ZtlhqpB9LwPzlSqG8a14+ZdcFrFY6ssBarb8y+EMf/CWjFGTIn9TVvu4iZScqQ
         FsbYsU14Y9bWCFJ27myCd2WNcSrs+vtpPtfl/MZJGHtmWkIdc19vlUhyDYNM8cv1qKOY
         olzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TwDfoAgypLT8l03j38lLFzbOlQqJwdvqWyDi7lubj74=;
        b=ouCT3pHYV5iBIjQ+QatGswde/u07ZmSwYPsANdGRNi4K2gJHJmqBsTOPSDmDbgIYUj
         QRE/PsgfeZhmPvo4ZqffrccgN+KWiZ6X9bbAbjeGUXWYMtbMzHn8VSiMGzjnjheEnUNK
         jx6Qd+PQ210cuyCFalT2zSuI7buHUrsQIJ4oL2/VQ6KJQyBTajg0BpIINuMaQ8OJAdMk
         o54HMibWMOrH25+gVYQ3myp0+X186/zk6mVS4pWRLSCDY1MTPEXAgcsV1vWx+bCpS25O
         b9TPk4ik0b6tnhbAHxgmhHtQnQtmVl32Hh2x9CvjtUtSVF9vjzYju7CLosu+JIZL3kPB
         Xq4Q==
X-Gm-Message-State: AOAM530E9yEs7ZAUJsrGg5tVHwNnFVGkJw3Y09F3omccWLa0pW/D08n4
	aRlKQqN3oOcIsdRUvnKTC3eKuI5xGyz9ZYUnHDo=
X-Google-Smtp-Source: ABdhPJy39QoZ9CUsvif5PGHkFtwZlvf/XmKy/NgH5ARTOeFR2oZK/CZbxs/Lx4UIhXNf/cxfHql9a1XZLm/SKSOjFDM=
X-Received: by 2002:a05:6402:4d1:: with SMTP id n17mr924346edw.337.1628097641503;
 Wed, 04 Aug 2021 10:20:41 -0700 (PDT)
MIME-Version: 1.0
References: <1697E299D6012A1A.32176@lists.openembedded.org>
 <20210804103627.238411-1-Martin.Jansa@gmail.com> <3e567fd7b645657303e7bf2271f8ac1d039709f5.camel@linuxfoundation.org>
In-Reply-To: <3e567fd7b645657303e7bf2271f8ac1d039709f5.camel@linuxfoundation.org>
From: "Martin Jansa" <Martin.Jansa@gmail.com>
Date: Wed, 4 Aug 2021 19:20:30 +0200
Message-ID: <CA+chaQeyjFEsF1MQYXTBhJh8B+ckkLW6BYevNdjqgXZL1R4_Lw@mail.gmail.com>
Subject: Re: [OE-core] [PATCHv2] systemd-boot: use ld.bfd as efi-ld even when gold or lld is used in ${LD}
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	Alexander Kanavin <alex.kanavin@gmail.com>
Content-Type: multipart/alternative; boundary="00000000000094ded005c8bf0541"

--00000000000094ded005c8bf0541
Content-Type: text/plain; charset="UTF-8"

I've tried to reproduce this with:

BB_VERSION           = "1.51.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "genericx86-64"
DISTRO               = "poky-altcfg"
DISTRO_VERSION       =
"3.3+snapshot-e2e76a4f7f4ff58a51592fdab0e9cbf2a69524bc"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta
meta-poky
meta-yocto-bsp       = "master:e2e76a4f7f4ff58a51592fdab0e9cbf2a69524bc"

martin@jama:/OE/build/poky$ git log --oneline | head -n 1
e2e76a4f7f systemd-boot: use ld.bfd as efi-ld even when gold or lld is used
in ${LD}

and it built fine here, not sure what the autobuilder is doing differently,
was it failing only for this poky-altcfg build or some other ones as well?

On Wed, Aug 4, 2021 at 2:46 PM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Wed, 2021-08-04 at 12:36 +0200, Martin Jansa wrote:
> > * since the upgrade to 249.1 in:
> >
> https://git.openembedded.org/openembedded-core/commit/?id=323ec445dfe22860cd450c303db5ed8fcb4e791c
> >   the builds with ld-is-gold are failing with:
> >
> >   [17/21] Generating linuxx64.elf.stub with a custom command
> >   FAILED: src/boot/efi/linuxx64.elf.stub
> >
>   /OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/systemd-boot/249.1-r0/recipe-sysroot-native/usr/bin/x86_64-oe-linux/x86_64-oe-linux-ld
> -o src/boot/efi/linuxx64.elf.stub -T
> /OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/systemd-boot/249.1-r0/recipe-sysroot/usr/lib/elf_x86_64_efi.lds
> -shared -Bsymbolic -nostdlib -znocombreloc --build-id=sha1 -L
> /OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/systemd-boot/249.1-r0/recipe-sysroot/usr/lib
> /OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/systemd-boot/249.1-r0/recipe-sysroot/usr/lib/crt0-efi-x86_64.o
> src/boot/efi/string-util-fundamental.c.o src/boot/efi/disk.c.o
> src/boot/efi/graphics.c.o src/boot/efi/measure.c.o src/boot/efi/pe.c.o
> src/boot/efi/secure-boot.c.o src/boot/efi/util.c.o src/boot/efi/linux.c.o
> src/boot/efi/splash.c.o src/boot/efi/stub.c.o -lefi -lgnuefi
> /OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/systemd-boot/249.1-r0/recipe-sysroot/usr/lib/../lib/x86_64-oe-linux/11.2.0/libgcc.a
> >
>   /OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/systemd-boot/249.1-r0/recipe-sysroot-native/usr/bin/x86_64-oe-linux/x86_64-oe-linux-ld:
> internal error in segment_precedes, at ../../gold/layout.cc:3721
> >   [18/21] Generating boot.c.o with a custom command
> >   ninja: build stopped: subcommand failed.
> >   WARNING: exit code 1 from a shell command.
> >
> >   as reported in:
> >   https://lists.openembedded.org/g/openembedded-core/message/154246
> >
> > * if someone is using lld or ld.lld in ${LD} then it would fail as well:
> >
> https://github.com/systemd/systemd/commit/e39288193fcdf3a36dbc49b78e6c9bf86a764e31
> >
> > * work around this by always using ld.bfd instead of whatever is set in
> ${LD}
> >
> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > ---
> >  meta/recipes-core/systemd/systemd-boot_249.1.bb | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
>
> I suspect but haven't confirmed this is probably the cause of:
>
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/104/builds/2673/steps/11/logs/stdio
>
> Cheers,
>
> Richard
>
>

--00000000000094ded005c8bf0541
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I&#39;ve tried to reproduce this with:</div><div><br>=
</div>BB_VERSION =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;1.51.1&quot;<=
br>BUILD_SYS =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;x86_64-linu=
x&quot;<br>NATIVELSBSTRING =C2=A0 =C2=A0 =C2=A0=3D &quot;universal&quot;<br=
>TARGET_SYS =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;x86_64-poky-linux&=
quot;<br>MACHINE =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;=
genericx86-64&quot;<br>DISTRO =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =3D &quot;poky-altcfg&quot;<br>DISTRO_VERSION =C2=A0 =C2=A0 =C2=A0 =3D =
&quot;3.3+snapshot-e2e76a4f7f4ff58a51592fdab0e9cbf2a69524bc&quot;<br>TUNE_F=
EATURES =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;m64 core2&quot;<br>TARGET_FPU =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;&quot;<br>meta<br>meta-poky<br=
>meta-yocto-bsp =C2=A0 =C2=A0 =C2=A0 =3D &quot;master:e2e76a4f7f4ff58a51592=
fdab0e9cbf2a69524bc&quot;<br><div><br></div><div>martin@jama:/OE/build/poky=
$ git log --oneline | head -n 1<br>e2e76a4f7f systemd-boot: use ld.bfd as e=
fi-ld even when gold or lld is used in ${LD}<br></div><div><br></div><div>a=
nd it built fine here, not sure what the autobuilder is doing differently, =
was it failing only for this poky-altcfg build or some other ones as well?<=
/div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_a=
ttr">On Wed, Aug 4, 2021 at 2:46 PM Richard Purdie &lt;<a href=3D"mailto:ri=
chard.purdie@linuxfoundation.org">richard.purdie@linuxfoundation.org</a>&gt=
; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Wed,=
 2021-08-04 at 12:36 +0200, Martin Jansa wrote:<br>
&gt; * since the upgrade to 249.1 in:<br>
&gt; =C2=A0=C2=A0<a href=3D"https://git.openembedded.org/openembedded-core/=
commit/?id=3D323ec445dfe22860cd450c303db5ed8fcb4e791c" rel=3D"noreferrer" t=
arget=3D"_blank">https://git.openembedded.org/openembedded-core/commit/?id=
=3D323ec445dfe22860cd450c303db5ed8fcb4e791c</a><br>
&gt; =C2=A0=C2=A0the builds with ld-is-gold are failing with:<br>
&gt; <br>
&gt; =C2=A0=C2=A0[17/21] Generating linuxx64.elf.stub with a custom command=
<br>
&gt; =C2=A0=C2=A0FAILED: src/boot/efi/linuxx64.elf.stub<br>
&gt; =C2=A0=C2=A0/OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/systemd=
-boot/249.1-r0/recipe-sysroot-native/usr/bin/x86_64-oe-linux/x86_64-oe-linu=
x-ld -o src/boot/efi/linuxx64.elf.stub -T /OE/build/oe-core/tmp-glibc/work/=
core2-64-oe-linux/systemd-boot/249.1-r0/recipe-sysroot/usr/lib/elf_x86_64_e=
fi.lds -shared -Bsymbolic -nostdlib -znocombreloc --build-id=3Dsha1 -L /OE/=
build/oe-core/tmp-glibc/work/core2-64-oe-linux/systemd-boot/249.1-r0/recipe=
-sysroot/usr/lib /OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/systemd=
-boot/249.1-r0/recipe-sysroot/usr/lib/crt0-efi-x86_64.o src/boot/efi/string=
-util-fundamental.c.o src/boot/efi/disk.c.o src/boot/efi/graphics.c.o src/b=
oot/efi/measure.c.o src/boot/efi/pe.c.o src/boot/efi/secure-boot.c.o src/bo=
ot/efi/util.c.o src/boot/efi/linux.c.o src/boot/efi/splash.c.o src/boot/efi=
/stub.c.o -lefi -lgnuefi /OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux=
/systemd-boot/249.1-r0/recipe-sysroot/usr/lib/../lib/x86_64-oe-linux/11.2.0=
/libgcc.a<br>
&gt; =C2=A0=C2=A0/OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/systemd=
-boot/249.1-r0/recipe-sysroot-native/usr/bin/x86_64-oe-linux/x86_64-oe-linu=
x-ld: internal error in segment_precedes, at ../../gold/layout.cc:3721<br>
&gt; =C2=A0=C2=A0[18/21] Generating boot.c.o with a custom command<br>
&gt; =C2=A0=C2=A0ninja: build stopped: subcommand failed.<br>
&gt; =C2=A0=C2=A0WARNING: exit code 1 from a shell command.<br>
&gt; <br>
&gt; =C2=A0=C2=A0as reported in:<br>
&gt; =C2=A0=C2=A0<a href=3D"https://lists.openembedded.org/g/openembedded-c=
ore/message/154246" rel=3D"noreferrer" target=3D"_blank">https://lists.open=
embedded.org/g/openembedded-core/message/154246</a><br>
&gt; <br>
&gt; * if someone is using lld or ld.lld in ${LD} then it would fail as wel=
l:<br>
&gt; =C2=A0=C2=A0<a href=3D"https://github.com/systemd/systemd/commit/e3928=
8193fcdf3a36dbc49b78e6c9bf86a764e31" rel=3D"noreferrer" target=3D"_blank">h=
ttps://github.com/systemd/systemd/commit/e39288193fcdf3a36dbc49b78e6c9bf86a=
764e31</a><br>
&gt; <br>
&gt; * work around this by always using ld.bfd instead of whatever is set i=
n ${LD}<br>
&gt; <br>
&gt; Signed-off-by: Martin Jansa &lt;<a href=3D"mailto:Martin.Jansa@gmail.c=
om" target=3D"_blank">Martin.Jansa@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt; =C2=A0meta/recipes-core/systemd/<a href=3D"http://systemd-boot_249.1.b=
b" rel=3D"noreferrer" target=3D"_blank">systemd-boot_249.1.bb</a> | 4 +++-<=
br>
&gt; =C2=A01 file changed, 3 insertions(+), 1 deletion(-)<br>
<br>
I suspect but haven&#39;t confirmed this is probably the cause of:<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/104/buil=
ds/2673/steps/11/logs/stdio" rel=3D"noreferrer" target=3D"_blank">https://a=
utobuilder.yoctoproject.org/typhoon/#/builders/104/builds/2673/steps/11/log=
s/stdio</a><br>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
</blockquote></div>

--00000000000094ded005c8bf0541--
