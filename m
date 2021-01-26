Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
 by mx.groups.io with SMTP id smtpd.web11.15019.1611678664134656213
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Jan 2021 08:31:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=k8wz+yUb;
 spf=pass (domain: gmail.com, ip: 209.85.208.50, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f50.google.com with SMTP id dj23so20492892edb.13
        for <openembedded-core@lists.openembedded.org>; Tue, 26 Jan 2021 08:31:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DURBHFPw55TKftTNioIaQY0eWwXLJP5B5uplcOwxW2I=;
        b=k8wz+yUb9JGaiA+x1VsWFkgAP14JVce5dcAyPLkgp7UUE4hvxqwGscGaB9PunC7FrV
         CzRdCDg92FSaFJdh8v64dosbcb0naSKOCGA7IXsZvIBvuH7OSQoQw9j+WY380MoyXKSm
         jQt1iLFo62FOJnqj3BIYhAWb0Y/n5AYSp5sN1f8am9/XVjdGHt0yoBPVj5uu+/W/CCoU
         dCw9BK3v7FKgnjhKZ/Ce4EA+mg0XPF8FaNfz4s8c8d2btfltP7ZRX3ev8dBpzdELaRuZ
         VK7bsYZpMXLWsuxxavGJVF4hAtPV6PpYfywqlfd2KvrDdrvNH7J/+Fh4ivqZrbVeME3w
         0Dhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DURBHFPw55TKftTNioIaQY0eWwXLJP5B5uplcOwxW2I=;
        b=aFv0CAZIlWm/SGO5GK0Zo+va6oJdKypWfreZtwByfalMZR8am50+xZWkzd9r8wpwBY
         ks9O7rOU6vsBkR+on3nLI03wUe9apSc72NfQVv43DLE9QAfbF+8HwmZK40LGnSxZixgO
         zZIFgAItAo5hWU/8qG80RKg9gC60PFQXp0UTZwf8Q0q040af5OgLaZAWJgC2JiVZJ6Aa
         tEPVArvI+nV0mPa2V9RirAX7gk4glsxto88hCr34Pbs9F0VcogcQHuMfhbQP0kVP4aAX
         cFgjvLDdaFVd45awP3DcxmJH1QcrYEV4S/Um1i48YibMo92dchDatAz3wxWD6kK3zAXw
         +evQ==
X-Gm-Message-State: AOAM531zKMwS5fuF6rAAICCH4fmv0r+cV/ffDKRBgTNaG4+JcJW8esdx
	rrWFfyVJaQn+c7peMCD+LqaWVdMJT+r7N9w05PU=
X-Google-Smtp-Source: ABdhPJxIOmMRDFmMIR/Fn4k0l4W6MUaqXhTEs+H50G0m6Eol1gmggK/HX6DyOM0YIDW3vt7cOVTzko4HRYn9pUhFiu4=
X-Received: by 2002:a05:6402:60a:: with SMTP id n10mr5138854edv.230.1611678662529;
 Tue, 26 Jan 2021 08:31:02 -0800 (PST)
MIME-Version: 1.0
References: <CAHtQpK71uAoq_hwDGJCvt5O_=kNXHkWFkmHC-BQkzcSCM3ys7A@mail.gmail.com>
 <CAOSpxdZ_0+QOwnpaCMMm=+1WUcedQ7aqnm=rmg1=_bU8TWOELQ@mail.gmail.com>
 <CAHtQpK7N-vmpvTpm2Jt-3Q4i+WXtMHfNSq4Jf+BsgsjkETwv7Q@mail.gmail.com> <559613c2-7d69-8ec6-a341-84ebf036d1b9@actia.se>
In-Reply-To: <559613c2-7d69-8ec6-a341-84ebf036d1b9@actia.se>
From: "Martin Jansa" <Martin.Jansa@gmail.com>
Date: Tue, 26 Jan 2021 08:30:50 -0800
Message-ID: <CA+chaQffacKr+9M5ibjui4Xt69+7vz3xLWdSpbO=hA5JcNW20Q@mail.gmail.com>
Subject: Re: [OE-core] [dunfell]: gpsd recipe (3.19) build is broken
To: John Ernberg <john.ernberg@actia.se>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000002c1b3205b9d02e4f"

--0000000000002c1b3205b9d02e4f
Content-Type: text/plain; charset="UTF-8"

Yes, it's related to rebuilding in the same WORKDIR and the only fix which
is needed to be backported to dunfell should be:
04afc692a gpsd: mark CLEANBROKEN

see the previous discussion about this issue:
https://lists.openembedded.org/g/openembedded-devel/topic/74225704#84379

On Tue, Jan 26, 2021 at 7:58 AM John Ernberg <john.ernberg@actia.se> wrote:

> Hi Andrey, Steve,
>
> On 1/26/21 4:25 PM, Andrey Zhizhikin wrote:
> > Hello Steve,
> >
> > On Tue, Jan 26, 2021 at 3:29 PM Steve Sakoman <steve@sakoman.com> wrote:
> >>
> >> Hi Andrey,
> >>
> >> Thanks for reporting this issue.
> >>
> >> I'm the maintainer for the dunfell branch of oe-core.  The gpsd recipe
> >> is part of meta-openembedded. I'm copying Armin, who is the maintainer
> >> for the dunfell branch of meta-openembedded.
> >
> > True, I've realized the recipe is not part of OE-Core.
> >
> >>
> >> That said, I'm surprised you are seeing this issue since the gpsd
> >> recipe has been fairly stable for quite some time.  I know that Armin
> >> does test builds quite frequently.
> >>
> >> FWIW, I tried doing a gpsd build with oe-core, meta-openembedded,
> >> meta-freescale, and meta-freescale-distro on an Ubuntu 20.04 and it
> >> completed successfully.
> >
> > Arghh, got the same setup now - and the build issue was gone! :( Looks
> > like this was an intermittent one
> >
> > I went ahead and invalidated the sstate for the recipe, and build went
> > through alright.
> >
> > With that said: please discard this message, and thanks for responding
> here!
> >
> >>
> >> Perhaps more information on your environment might help.  What
> >> distro/version is the OS on your build machine? What other layers are
> >> enabled in your build? What are you using for MACHINE and DISTRO?  Do
> >> any of your layers have a .bbappend for gpsd?
> >
> > For the record: had nothing fancy, same setup as you've indicated above:
> >
> > Build Configuration:
> > BB_VERSION           = "1.46.0"
> > BUILD_SYS            = "x86_64-linux"
> > NATIVELSBSTRING      = "universal"
> > TARGET_SYS           = "aarch64-fsl-linux"
> > MACHINE              = "imx8mmevk"
> > DISTRO               = "fsl-wayland"
> > DISTRO_VERSION       = "3.1"
> > TUNE_FEATURES        = "aarch64 cortexa53 crc crypto"
> > TARGET_FPU           = ""
> > meta
> > meta-poky            = "HEAD:bb7747497adbc7c99f6fc9b48b643eecb4cb1408"
> > meta-oe
> > meta-multimedia
> > meta-python
> > meta-networking
> > meta-filesystems     = "dunfell:5bba79488b7d393d2258d6e917f7bf7b0d7c4073"
> > meta-freescale       =
> > "update-kernel-dunfell:184ee6b12d1c06db9327535ad1ae84d4709cfdb0"
> > meta-freescale-3rdparty = "HEAD:ed841161a97307ebd901c31c62f8ecbee6baaacf"
> > meta-freescale-distro = "HEAD:5d882cdf079b3bde0bd9869ce3ca3db411acbf3b"
> >
> >>
> >> Regards,
> >>
> >> Steve
> >>
> >> On Tue, Jan 26, 2021 at 2:13 AM Andrey Zhizhikin <andrey.z@gmail.com>
> wrote:
> >>>
> >>> Hello Steve,
> >>>
> >>> gpsd recipe build breaks on the dunfell branch with following error
> messages:
> >>>
> >>> |
> /development/dunfell/build-output/work/aarch64-fsl-linux/gpsd/3.19-r0/recipe-sysroot-native/usr/bin/aarch64-fsl-linux/../../libexec/aarch64-fsl-linux/gcc/aarch64-fsl-linux/9.3.0/ld:
> >>> ./libgpsd.a(ppsthread.o): undefined reference to symbol
> >>> 'pthread_create@@GLIBC_2.17'
> >>> |
> /development/dunfell/build-output/work/aarch64-fsl-linux/gpsd/3.19-r0/recipe-sysroot-native/usr/bin/aarch64-fsl-linux/../../libexec/aarch64-fsl-linux/gcc/aarch64-fsl-linux/9.3.0/ld:
> >>>
> /development/dunfell/build-output/work/aarch64-fsl-linux/gpsd/3.19-r0/recipe-sysroot/lib/libpthread.so.0:
> >>> error adding symbols: DSO missing from command line
>
> We have seen this one as well, we have not identified why it happens,
> but we believe it is triggered by an incremental rebuild of the recipe.
>
> We have enabled systemd for gpsd, and if systemd is rebuilt due to a
> patch or whatever, gpsd appears to error out exactly like this.
>
> A very quick analysis we did when it first happened seem to indicate
> that Scons (when using a cache) gets confused about the pthread
> capability in the environment.
>
> We have not been able to research the error further yet.
>
> Best regards // John Ernberg
> >>>
> >>> This cannot be reproduced on the current master branch, where the
> >>> version of gpsd recipe has been bumped up from 3.19 to 3.20.
> >>>
> >>> Can you please consider to cherry-pick following commits from master
> >>> in order to upgrade the gspd version on dunfell branch:
> >>>
> >>> 98e61961c gpsd: add new init script
> >>> 04afc692a gpsd: mark CLEANBROKEN
> >>> 33a15c790 gpsd: fix build on aarch64
> >>> cecab9c4c gpsd: Upgrade 3.19 -> 3.20
> >>>
> >>> I've tried to cherry-pick them locally and they do apply clean. Also
> >>> the build of gpsd is successful after this upgrade.
> >>>
> >>> --
> >>> Regards,
> >>> Andrey.
> >
> >
> > --
> > Regards,
> > Andrey.
> >
> >
> >
> >
> >
>
> 
>
>

--0000000000002c1b3205b9d02e4f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Yes, it&#39;s related to rebuilding in the same WORKDIR an=
d the only fix which is needed to be backported to dunfell should be:<div>0=
4afc692a gpsd: mark CLEANBROKEN=C2=A0</div><div><br></div><div>see the prev=
ious discussion about this issue:=C2=A0<br><div><a href=3D"https://lists.op=
enembedded.org/g/openembedded-devel/topic/74225704#84379">https://lists.ope=
nembedded.org/g/openembedded-devel/topic/74225704#84379</a><br></div></div>=
</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">=
On Tue, Jan 26, 2021 at 7:58 AM John Ernberg &lt;<a href=3D"mailto:john.ern=
berg@actia.se">john.ernberg@actia.se</a>&gt; wrote:<br></div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex">Hi Andrey, Steve,<br>
<br>
On 1/26/21 4:25 PM, Andrey Zhizhikin wrote:<br>
&gt; Hello Steve,<br>
&gt; <br>
&gt; On Tue, Jan 26, 2021 at 3:29 PM Steve Sakoman &lt;<a href=3D"mailto:s=
teve@sakoman.com" target=3D"_blank">steve@sakoman.com</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; Hi Andrey,<br>
&gt;&gt;<br>
&gt;&gt; Thanks for reporting this issue.<br>
&gt;&gt;<br>
&gt;&gt; I&#39;m the maintainer for the dunfell branch of oe-core.=C2=A0 T=
he gpsd recipe<br>
&gt;&gt; is part of meta-openembedded. I&#39;m copying Armin, who is the m=
aintainer<br>
&gt;&gt; for the dunfell branch of meta-openembedded.<br>
&gt; <br>
&gt; True, I&#39;ve realized the recipe is not part of OE-Core.<br>
&gt; <br>
&gt;&gt;<br>
&gt;&gt; That said, I&#39;m surprised you are seeing this issue since the =
gpsd<br>
&gt;&gt; recipe has been fairly stable for quite some time.=C2=A0 I know t=
hat Armin<br>
&gt;&gt; does test builds quite frequently.<br>
&gt;&gt;<br>
&gt;&gt; FWIW, I tried doing a gpsd build with oe-core, meta-openembedded,=
<br>
&gt;&gt; meta-freescale, and meta-freescale-distro on an Ubuntu 20.04 and =
it<br>
&gt;&gt; completed successfully.<br>
&gt; <br>
&gt; Arghh, got the same setup now - and the build issue was gone! :( Look=
s<br>
&gt; like this was an intermittent one<br>
&gt; <br>
&gt; I went ahead and invalidated the sstate for the recipe, and build wen=
t<br>
&gt; through alright.<br>
&gt; <br>
&gt; With that said: please discard this message, and thanks for respondin=
g here!<br>
&gt; <br>
&gt;&gt;<br>
&gt;&gt; Perhaps more information on your environment might help.=C2=A0 Wh=
at<br>
&gt;&gt; distro/version is the OS on your build machine? What other layers=
 are<br>
&gt;&gt; enabled in your build? What are you using for MACHINE and DISTRO?=
=
=C2=A0 Do<br>
&gt;&gt; any of your layers have a .bbappend for gpsd?<br>
&gt; <br>
&gt; For the record: had nothing fancy, same setup as you&#39;ve indicated=
 above:<br>
&gt; <br>
&gt; Build Configuration:<br>
&gt; BB_VERSION=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;1.46.0&q=
uot;<br>
&gt; BUILD_SYS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;x86_64-l=
inux&quot;<br>
&gt; NATIVELSBSTRING=C2=A0 =C2=A0 =C2=A0 =3D &quot;universal&quot;<br>
&gt; TARGET_SYS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;aarch64-=
fsl-linux&quot;<br>
&gt; MACHINE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;imx=
8mmevk&quot;<br>
&gt; DISTRO=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quo=
t;fsl-wayland&quot;<br>
&gt; DISTRO_VERSION=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;3.1&quot;<br>
&gt; TUNE_FEATURES=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;aarch64 cortexa53 =
crc crypto&quot;<br>
&gt; TARGET_FPU=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;&quot;<b=
r>
&gt; meta<br>
&gt; meta-poky=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;HEAD:bb7=
747497adbc7c99f6fc9b48b643eecb4cb1408&quot;<br>
&gt; meta-oe<br>
&gt; meta-multimedia<br>
&gt; meta-python<br>
&gt; meta-networking<br>
&gt; meta-filesystems=C2=A0 =C2=A0 =C2=A0=3D &quot;dunfell:5bba79488b7d393=
d2258d6e917f7bf7b0d7c4073&quot;<br>
&gt; meta-freescale=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D<br>
&gt; &quot;update-kernel-dunfell:184ee6b12d1c06db9327535ad1ae84d4709cfdb0&=
quot;<br>
&gt; meta-freescale-3rdparty =3D &quot;HEAD:ed841161a97307ebd901c31c62f8ec=
bee6baaacf&quot;<br>
&gt; meta-freescale-distro =3D &quot;HEAD:5d882cdf079b3bde0bd9869ce3ca3db4=
11acbf3b&quot;<br>
&gt; <br>
&gt;&gt;<br>
&gt;&gt; Regards,<br>
&gt;&gt;<br>
&gt;&gt; Steve<br>
&gt;&gt;<br>
&gt;&gt; On Tue, Jan 26, 2021 at 2:13 AM Andrey Zhizhikin &lt;<a href=3D"m=
ailto:andrey.z@gmail.com" target=3D"_blank">andrey.z@gmail.com</a>&gt; wrot=
e:<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Hello Steve,<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; gpsd recipe build breaks on the dunfell branch with following=
 error messages:<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; | /development/dunfell/build-output/work/aarch64-fsl-linux/gp=
sd/3.19-r0/recipe-sysroot-native/usr/bin/aarch64-fsl-linux/../../libexec/aa=
rch64-fsl-linux/gcc/aarch64-fsl-linux/9.3.0/ld:<br>
&gt;&gt;&gt; ./libgpsd.a(ppsthread.o): undefined reference to symbol<br>
&gt;&gt;&gt; &#39;pthread_create@@GLIBC_2.17&#39;<br>
&gt;&gt;&gt; | /development/dunfell/build-output/work/aarch64-fsl-linux/gp=
sd/3.19-r0/recipe-sysroot-native/usr/bin/aarch64-fsl-linux/../../libexec/aa=
rch64-fsl-linux/gcc/aarch64-fsl-linux/9.3.0/ld:<br>
&gt;&gt;&gt; /development/dunfell/build-output/work/aarch64-fsl-linux/gpsd=
/3.19-r0/recipe-sysroot/lib/libpthread.so.0:<br>
&gt;&gt;&gt; error adding symbols: DSO missing from command line<br>
<br>
We have seen this one as well, we have not identified why it happens, <br>
but we believe it is triggered by an incremental rebuild of the recipe.<br=
>
<br>
We have enabled systemd for gpsd, and if systemd is rebuilt due to a <br>
patch or whatever, gpsd appears to error out exactly like this.<br>
<br>
A very quick analysis we did when it first happened seem to indicate <br>
that Scons (when using a cache) gets confused about the pthread <br>
capability in the environment.<br>
<br>
We have not been able to research the error further yet.<br>
<br>
Best regards // John Ernberg<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; This cannot be reproduced on the current master branch, where=
 the<br>
&gt;&gt;&gt; version of gpsd recipe has been bumped up from 3.19 to 3.20.<=
br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Can you please consider to cherry-pick following commits from=
 master<br>
&gt;&gt;&gt; in order to upgrade the gspd version on dunfell branch:<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; 98e61961c gpsd: add new init script<br>
&gt;&gt;&gt; 04afc692a gpsd: mark CLEANBROKEN<br>
&gt;&gt;&gt; 33a15c790 gpsd: fix build on aarch64<br>
&gt;&gt;&gt; cecab9c4c gpsd: Upgrade 3.19 -&gt; 3.20<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; I&#39;ve tried to cherry-pick them locally and they do apply =
clean. Also<br>
&gt;&gt;&gt; the build of gpsd is successful after this upgrade.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; --<br>
&gt;&gt;&gt; Regards,<br>
&gt;&gt;&gt; Andrey.<br>
&gt; <br>
&gt; <br>
&gt; --<br>
&gt; Regards,<br>
&gt; Andrey.<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; <br>
<br>
<br>
<br>
</blockquote></div>

--0000000000002c1b3205b9d02e4f--
