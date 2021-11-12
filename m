Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67DCAC433F5
	for <webhook@archiver.kernel.org>; Fri, 12 Nov 2021 15:02:50 +0000 (UTC)
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com
 [209.85.222.173])
 by mx.groups.io with SMTP id smtpd.web11.16925.1636729365441216701
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Nov 2021 07:02:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=S5zWhTgI;
 spf=pass (domain: gmail.com, ip: 209.85.222.173,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f173.google.com with SMTP id p4so927297qkm.7
        for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Nov 2021 07:02:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BIyGkY95HBwP/0SZRk7d0YRsJNs/G7AlOHUENcuYD0o=;
        b=S5zWhTgIYKhV0r7b9tES8ETMln2uPY0eX+Bvsyo3IT9gRFg/vgCn3Gb/TGfFXazf1Z
         uJCd7mX8gAkoGpmYklnKGF0MTXMcOFt72g3eTANUumEt4q9h/YvrQmAKj3d8VeMbPKux
         99O/rE6Eudx1xknqqp4LopA6HysJ9HHrr6hSj/iJ/0Gma3Hk424E/1r7cChj9OMyUyM0
         4zF8LLgVHmnmzpRTBVbzqJzP9EpaYppdBEXJkd8H+R7uQSqyIl+xxV4Bn9RqMXLWMDMi
         vl9YjByLDGF37ETWQlY2hcfRvhEfiaN8wvHg9nebQ/BiKvEtdkHSTuAoq61Jjt/FVR3g
         WWtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BIyGkY95HBwP/0SZRk7d0YRsJNs/G7AlOHUENcuYD0o=;
        b=CMHqpyZpVkg8FMeCc/lyn8/e/U/TTZiTkJfEbDE/OSsES/9f4AeccD6iz5rPTNBFNd
         8CkS4aKH1fOwQ2wSrhLEYTp1qX6Tt2b5V/LV5hjACvSWEMtR0DsaPuEcd1ztPk5+rFiV
         lCFu5BNznLYphkZRlGEbUFawH2octUigqEGURiP/Gi63BGc3hJvCNAX0/0e5oP7zyr+T
         ud2uY2HNUkxqxKLn1/4GDCA+dIp30zfBZw94VgX7FkonDCiy7QXYkM44L6mOe0ZDH74s
         edSPBThIiYKv2sdzY8kV7Ap4s3J9dA1J6a/FUPULufliqET8uV9H32NYj1fUNksLUvE7
         vGxw==
X-Gm-Message-State: AOAM5325XkBfwL64LliR67RbD0dUoSJrNtrMEe3nLB3gJfi2Lbd3tRzx
	wueQfOki/KdR6HdsGY4ocl0FQ21+LHwd0VOcX04=
X-Google-Smtp-Source: 
 ABdhPJwCmQ6fsDGRJ/V1fPRd3/sFXyChywO/5bBAklz6HsZvTbemctbpleWUhm8RZ3aOhTZNRCOvlarpVqWk5eY/BQI=
X-Received: by 2002:ae9:de07:: with SMTP id s7mr13021949qkf.47.1636729364528;
 Fri, 12 Nov 2021 07:02:44 -0800 (PST)
MIME-Version: 1.0
References: <20211109152851.8137-1-lukma@denx.de>
 <CAMKF1spswf07YOPg4WOHmvnaTi4LQT09GAnXEukBObNawEMyBg@mail.gmail.com>
 <20211112094116.2509d8f3@ktm>
 <15d0a240c146628550e6867ca0e3c46ebfb14959.camel@linuxfoundation.org>
In-Reply-To: 
 <15d0a240c146628550e6867ca0e3c46ebfb14959.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 12 Nov 2021 07:02:33 -0800
Message-ID: 
 <CAMKF1srGyJW-8MmQgW6S-WKA5tbGTB3raObLYUhTbF078DO2Pw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v4] glibc: ptest: Add running glibc time related
 test suite (Y2038) with ptest
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Adhemerval Zanella <adhemerval.zanella@linaro.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Lee Chee Yang <chee.yang.lee@intel.com>,
	Lukasz Majewski <lukma@denx.de>, Nathan Rossi <nathan@nathanrossi.com>,
	Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000005dbfe105d098c0fa"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Nov 2021 15:02:50 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158225

--0000000000005dbfe105d098c0fa
Content-Type: text/plain; charset="UTF-8"

On Fri, Nov 12, 2021 at 12:54 AM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Fri, 2021-11-12 at 09:41 +0100, Lukasz Majewski wrote:
> > Hi Khem,
> >
> > > seeing this
> > >
> > > https://errors.yoctoproject.org/Errors/Details/616955/
> >
> > The error is about autoconf version:
> >
> > DEBUG: Executing shell function do_configure
> > aclocal.m4:6: error: Exactly version 2.69 of Autoconf is required but
> > you have 2.71
> >
> > aclocal.m4:6: the top level
> > autom4te: error: m4 failed with exit status: 63
> >
> > This is strange, as on my setup (qemuarm, qemuarm64, qemux86) the glibc
> > and glibc-tests are built without any issues with autoconf version 2.71.
> >
> >
> > I've built the glibc-tests without issues with:
> >
> > Build Configuration:
> > BB_VERSION           = "1.52.0"
> > BUILD_SYS            = "x86_64-linux"
> > NATIVELSBSTRING      = "universal"
> > TARGET_SYS           = "riscv64-poky-linux"
> > MACHINE              = "qemuriscv64"
> > DISTRO               = "poky"
> > DISTRO_VERSION       = "3.4"
> > TUNE_FEATURES        = "riscv64"
> > meta
> > meta-poky
> > meta-yocto-bsp       =
> > "glibc-ptest_v4:164923f0586ac189f01938a32fa102c2df7cc447"
> >
> > DISTRO=poky MACHINE=qemuriscv64 bitbake glibc-tests
> >
> >
> > Khem, could you help me with setting up environment to reproduce this
> > issue?
>
> The autoconf version message isn't a fatal error and if you look at your
> own
> build logs you probably have that too. What looks like it is the issue is:
>
> checking if riscv64-yoe-linux-clang -target riscv64-yoe-linux
> -mlittle-endian -mno-relax -Qunused-arguments -fstack-protector-strong  -O2
> -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security
> --sysroot=TOPDIR/build/tmp/work/riscv64-yoe-linux/glibc-tests/2.34-r0/recipe-sysroot
> is sufficient to build libc... no
>

Right so perhaps we need to set TOOLCHAIN to gcc for this in meta-clang
which should fix it


> which I think leads to:
>
> configure: error:
> *** These critical programs are missing or too old: compiler
>
> Khem was implying this was a musl build, I can't see that from the logs
> but if
> it is a musl build, it shouldn't be building glibc tests.
>
> For that reason I did add:
>
>
> http://git.yoctoproject.org/cgit.cgi/poky/commit/?h=master-next&id=f54774199ef09b655de1b586045995e0f284925a
>
> to master-next since I believe that was the remaining issue blocking the
> patch
> apart from a typo Khem also mentioned which I meant to find and tweak.
>
> I still am concerned about having duplication of tests but I don't see any
> way
> around that since you want to get this patch merged and I don't have any
> solution for that.
>
> Cheers,
>
> Richard
>
>
>

--0000000000005dbfe105d098c0fa
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Fri, Nov 12, 2021 at 12:54 AM Richard Purdie &lt;<a href=
=3D"mailto:richard.purdie@linuxfoundation.org">richard.purdie@linuxfoundati=
on.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On Fri, 2021-=
11-12 at 09:41 +0100, Lukasz Majewski wrote:<br>
&gt; Hi Khem,<br>
&gt; <br>
&gt; &gt; seeing this<br>
&gt; &gt; <br>
&gt; &gt; <a href=3D"https://errors.yoctoproject.org/Errors/Details/616955/=
" rel=3D"noreferrer" target=3D"_blank">https://errors.yoctoproject.org/Erro=
rs/Details/616955/</a><br>
&gt; <br>
&gt; The error is about autoconf version:<br>
&gt; <br>
&gt; DEBUG: Executing shell function do_configure<br>
&gt; aclocal.m4:6: error: Exactly version 2.69 of Autoconf is required but<=
br>
&gt; you have 2.71<br>
&gt; <br>
&gt; aclocal.m4:6: the top level<br>
&gt; autom4te: error: m4 failed with exit status: 63<br>
&gt; <br>
&gt; This is strange, as on my setup (qemuarm, qemuarm64, qemux86) the glib=
c<br>
&gt; and glibc-tests are built without any issues with autoconf version 2.7=
1.<br>
&gt; <br>
&gt; <br>
&gt; I&#39;ve built the glibc-tests without issues with:<br>
&gt; <br>
&gt; Build Configuration:<br>
&gt; BB_VERSION=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;1.52.0&qu=
ot;<br>
&gt; BUILD_SYS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;x86_64-li=
nux&quot;<br>
&gt; NATIVELSBSTRING=C2=A0 =C2=A0 =C2=A0 =3D &quot;universal&quot;<br>
&gt; TARGET_SYS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;riscv64-p=
oky-linux&quot;<br>
&gt; MACHINE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;qemu=
riscv64&quot;<br>
&gt; DISTRO=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot=
;poky&quot;<br>
&gt; DISTRO_VERSION=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;3.4&quot;<br>
&gt; TUNE_FEATURES=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;riscv64&quot;<br>
&gt; meta<br>
&gt; meta-poky<br>
&gt; meta-yocto-bsp=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D<br>
&gt; &quot;glibc-ptest_v4:164923f0586ac189f01938a32fa102c2df7cc447&quot;<br=
>
&gt; <br>
&gt; DISTRO=3Dpoky MACHINE=3Dqemuriscv64 bitbake glibc-tests<br>
&gt; <br>
&gt; <br>
&gt; Khem, could you help me with setting up environment to reproduce this<=
br>
&gt; issue?<br>
<br>
The autoconf version message isn&#39;t a fatal error and if you look at you=
r own<br>
build logs you probably have that too. What looks like it is the issue is:<=
br>
<br>
checking if riscv64-yoe-linux-clang -target riscv64-yoe-linux=C2=A0 =C2=A0 =
-mlittle-endian -mno-relax -Qunused-arguments -fstack-protector-strong=C2=
=A0 -O2 -D_FORTIFY_SOURCE=3D2 -Wformat -Wformat-security -Werror=3Dformat-s=
ecurity --sysroot=3DTOPDIR/build/tmp/work/riscv64-yoe-linux/glibc-tests/2.3=
4-r0/recipe-sysroot is sufficient to build libc... no<br>
</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">Right so perhaps=
 we need to set TOOLCHAIN to gcc for this in meta-clang which should fix it=
=C2=A0</div><div dir=3D"auto"><br></div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><br>
which I think leads to:<br>
<br>
configure: error: <br>
*** These critical programs are missing or too old: compiler<br>
<br>
Khem was implying this was a musl build, I can&#39;t see that from the logs=
 but if<br>
it is a musl build, it shouldn&#39;t be building glibc tests.<br>
<br>
For that reason I did add:<br>
<br>
<a href=3D"http://git.yoctoproject.org/cgit.cgi/poky/commit/?h=3Dmaster-nex=
t&amp;id=3Df54774199ef09b655de1b586045995e0f284925a" rel=3D"noreferrer" tar=
get=3D"_blank">http://git.yoctoproject.org/cgit.cgi/poky/commit/?h=3Dmaster=
-next&amp;id=3Df54774199ef09b655de1b586045995e0f284925a</a><br>
<br>
to master-next since I believe that was the remaining issue blocking the pa=
tch<br>
apart from a typo Khem also mentioned which I meant to find and tweak.<br>
<br>
I still am concerned about having duplication of tests but I don&#39;t see =
any way<br>
around that since you want to get this patch merged and I don&#39;t have an=
y<br>
solution for that.<br>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
<br>
</blockquote></div></div>

--0000000000005dbfe105d098c0fa--

