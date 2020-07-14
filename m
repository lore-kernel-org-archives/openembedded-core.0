Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com [209.85.208.194])
 by mx.groups.io with SMTP id smtpd.web12.18625.1594730536227767969
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Jul 2020 05:42:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=udeP+3Af;
 spf=pass (domain: gmail.com, ip: 209.85.208.194, mailfrom: max.oss.09@gmail.com)
Received: by mail-lj1-f194.google.com with SMTP id r19so22385914ljn.12
        for <openembedded-core@lists.openembedded.org>; Tue, 14 Jul 2020 05:42:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rxtLamSGBAE4iudPtU8YA86Sd/Rn5vntQQvn4Vo2k58=;
        b=udeP+3AftO7uYWCb7rzzfCdOZDj6xW6NdPx2xec5xpl3MpB8Ifo2zsEkhp1hYPexRn
         GqNBEbjMRllurz2DvodGk/BQHXee+bU3GodxUP/UkIVNsyWgRJ7b9eaYdsgoVC9F7sq1
         iEnxHKzU4oRUaze2OkyClbsoTRI79FhGiKpkiWsPWvSGOXlGsZniB5lNv3RmZKzr0UHP
         FiU2QM7+QzuwOyx8OGxSaV2C4/8zOgwPy2BkOUicwS5n4XFd7dei/dxRL0pszr9hE4vX
         5McnKOSwTQrEQVlv+53EzAeYqu6mleurwP0tspxY+koSo7ilWAMV8WvHsTDrbapNLgtM
         W2jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rxtLamSGBAE4iudPtU8YA86Sd/Rn5vntQQvn4Vo2k58=;
        b=bx66IdZjZeKL6fMT3RWJhLc2Hsl1rbsyKCfvZIba8B3wwIzFAID4v5QZTjQKicjfiI
         tyj5EW0O18yUQOaie5geBpXX57mdRRFSxIKu9EO85HVjth29Q+vVg+9SNpXNf6W00whf
         YxAcaf8BJ1WqK64GVXZv02A5piQZLlELxifdPPpkda4utbhWiBe2w3P3vaFVgeXqgFKv
         1p1TR9JnrSkkDeGILUzxA+qOgr+EZmhIEX4xbEcLqVPmtKvijXKuNLE1cmJFta0AfkFM
         IA7bQzXhXAQcZvdh+MCc2OCVkISrzSgYMzZTKj8O27wL6m+Qnh605ywlQtCheK/a6AAE
         JNXg==
X-Gm-Message-State: AOAM532QZTvbkqSUHq83xAj6dDRVmVhGbACx2Mh0hW2PO5NBROxUvY+S
	amnzdldLy4qR2MtMjfFL+6ecITliJrDFeutR8Bk=
X-Google-Smtp-Source: ABdhPJxgVcsXJ7jqL6fH7EWgwOpzbxGfpzHHc4HwzALbN5v3ceCC/02V87Uht9tKmtB+Y2feoJVJAmrb12ZRggkSDAE=
X-Received: by 2002:a05:651c:547:: with SMTP id q7mr2122109ljp.437.1594730534082;
 Tue, 14 Jul 2020 05:42:14 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1594649587.git.steve@sakoman.com> <ad44aab08c0c204923d44aa37c39559a7bd843c0.1594649587.git.steve@sakoman.com>
 <92cf9c7e6eaec95059019b461becd588b2b93dbf.camel@gmail.com> <22d1b9fc-57a6-5648-ce31-a6d14a6f5b59@gmail.com>
In-Reply-To: <22d1b9fc-57a6-5648-ce31-a6d14a6f5b59@gmail.com>
From: "Max Krummenacher" <max.oss.09@gmail.com>
Date: Tue, 14 Jul 2020 14:42:02 +0200
Message-ID: <CAEHkU3UnW2gEZ_ikqicC8KKbrsDGSv7=Rv35CG-OyGYoh1stzw@mail.gmail.com>
Subject: Re: [OE-core][dunfell 08/15] kernel.bbclass: make dependency on lzop-native conditional
To: Khem Raj <raj.khem@gmail.com>
Cc: Steve Sakoman <steve@sakoman.com>, OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000ff1c1105aa662263"

--000000000000ff1c1105aa662263
Content-Type: text/plain; charset="UTF-8"

Note that the kernel config CONFIG_KERNEL_LZO must also be present to
have the compressed part in the zImage using LZO compression.

E.g. the i.MX defconfig uses that:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm/configs/imx_v6_v7_defconfig?h=v5.8-rc5#n1

I personally don't mind adding the dependency in the same place where I set
the
defconfig, but having the dependency removal trickle down to older releases
seems to not merit the build time gain.

Am Di., 14. Juli 2020 um 01:59 Uhr schrieb Khem Raj <raj.khem@gmail.com>:

>
>
> On 7/13/20 2:29 PM, Max Krummenacher wrote:
> > Hi
> >
> > Can we drop this one from the backports?
> >
> > The patch possibly reduces a bit of build time if lzop-native is not used
> > by any other recipe, but does not fix anything.
> >
> > One can build a zImage which is compressed with lzo. For a kernel recipe
> which
> > does use a zImage with lzo and relies on the kernel.bbclass to add a
> depend on
> > lzop-native the build breaks.
> >
>
> it seems original patch is not adequate yet, perhaps it should also
> check for KERNEL_IMAGETYPE to have lzo before dropping this dependency,
> once thats taken care, both together are good for dunfell too.
>
> > Cheers
> > Max
> >
> > Am Montag, den 13.07.2020, 04:16 -1000 schrieb Steve Sakoman:
> >> From: Timon Ulrich <t.ulrich@anapur.de>
> >>
> >> a native lzop is only needed when an lzo compressed initramfs is
> actually present
> >>
> >> Signed-off-by: Timon Ulrich <t.ulrich@anapur.de>
> >> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> >> (cherry picked from commit 1217ddf070261c5fe523729b2a833bd38f1e4ccd)
> >> Signed-off-by: Steve Sakoman <steve@sakoman.com>
> >> ---
> >>   meta/classes/kernel.bbclass | 3 ++-
> >>   1 file changed, 2 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> >> index 9e3c34ad48..af7e88b380 100644
> >> --- a/meta/classes/kernel.bbclass
> >> +++ b/meta/classes/kernel.bbclass
> >> @@ -4,7 +4,8 @@ KERNEL_PACKAGE_NAME ??= "kernel"
> >>   KERNEL_DEPLOYSUBDIR ??= "${@ "" if (d.getVar("KERNEL_PACKAGE_NAME")
> == "kernel") else
> >> d.getVar("KERNEL_PACKAGE_NAME") }"
> >>
> >>   PROVIDES += "${@ "virtual/kernel" if (d.getVar("KERNEL_PACKAGE_NAME")
> == "kernel") else "" }"
> >> -DEPENDS += "virtual/${TARGET_PREFIX}binutils
> virtual/${TARGET_PREFIX}gcc kmod-native bc-native
> >> lzop-native bison-native"
> >> +DEPENDS += "virtual/${TARGET_PREFIX}binutils
> virtual/${TARGET_PREFIX}gcc kmod-native bc-native
> >> bison-native"
> >> +DEPENDS += "${@bb.utils.contains("INITRAMFS_FSTYPES", "cpio.lzo",
> "lzop-native", "", d)}"
> >>   DEPENDS += "${@bb.utils.contains("INITRAMFS_FSTYPES", "cpio.lz4",
> "lz4-native", "", d)}"
> >>   PACKAGE_WRITE_DEPS += "depmodwrapper-cross"
> >>
> >>
> >
> >
> > 
> >
>

--000000000000ff1c1105aa662263
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Note that the kernel config CONFIG_KERNEL_LZO must al=
so be present to</div><div>have the compressed part in the zImage using LZO=
 compression.<br></div><div><br></div><div>E.g. the i.MX defconfig uses tha=
t:<br><a href=3D"https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/l=
inux.git/tree/arch/arm/configs/imx_v6_v7_defconfig?h=3Dv5.8-rc5#n1">https:/=
/git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm/c=
onfigs/imx_v6_v7_defconfig?h=3Dv5.8-rc5#n1</a></div><div><br></div><div>I p=
ersonally don&#39;t mind adding the dependency in the same place where I se=
t the</div><div>defconfig, but having the dependency removal trickle down t=
o older releases</div><div>seems to not merit the build time gain.<br></div=
></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr"=
>Am Di., 14. Juli 2020 um 01:59=C2=A0Uhr schrieb Khem Raj &lt;<a href=3D"ma=
ilto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt;:<br></div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex"><br>
<br>
On 7/13/20 2:29 PM, Max Krummenacher wrote:<br>
&gt; Hi<br>
&gt; <br>
&gt; Can we drop this one from the backports?<br>
&gt; <br>
&gt; The patch possibly reduces a bit of build time if lzop-native is not =
used<br>
&gt; by any other recipe, but does not fix anything.<br>
&gt; <br>
&gt; One can build a zImage which is compressed with lzo. For a kernel rec=
ipe which<br>
&gt; does use a zImage with lzo and relies on the kernel.bbclass to add a =
depend on<br>
&gt; lzop-native the build breaks.<br>
&gt; <br>
<br>
it seems original patch is not adequate yet, perhaps it should also <br>
check for KERNEL_IMAGETYPE to have lzo before dropping this dependency, <b=
r>
once thats taken care, both together are good for dunfell too.<br>
<br>
&gt; Cheers<br>
&gt; Max<br>
&gt; <br>
&gt; Am Montag, den 13.07.2020, 04:16 -1000 schrieb Steve Sakoman:<br>
&gt;&gt; From: Timon Ulrich &lt;<a href=3D"mailto:t.ulrich@anapur.de" targ=
et=3D"_blank">t.ulrich@anapur.de</a>&gt;<br>
&gt;&gt;<br>
&gt;&gt; a native lzop is only needed when an lzo compressed initramfs is =
actually present<br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Timon Ulrich &lt;<a href=3D"mailto:t.ulrich@anapur=
.de" target=3D"_blank">t.ulrich@anapur.de</a>&gt;<br>
&gt;&gt; Signed-off-by: Richard Purdie &lt;<a href=3D"mailto:richard.purdi=
e@linuxfoundation.org" target=3D"_blank">richard.purdie@linuxfoundation.org=
</a>&gt;<br>
&gt;&gt; (cherry picked from commit 1217ddf070261c5fe523729b2a833bd38f1e4c=
cd)<br>
&gt;&gt; Signed-off-by: Steve Sakoman &lt;<a href=3D"mailto:steve@sakoman.=
com" target=3D"_blank">steve@sakoman.com</a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt;=C2=A0 =C2=A0meta/classes/kernel.bbclass | 3 ++-<br>
&gt;&gt;=C2=A0 =C2=A01 file changed, 2 insertions(+), 1 deletion(-)<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bb=
class<br>
&gt;&gt; index 9e3c34ad48..af7e88b380 100644<br>
&gt;&gt; --- a/meta/classes/kernel.bbclass<br>
&gt;&gt; +++ b/meta/classes/kernel.bbclass<br>
&gt;&gt; @@ -4,7 +4,8 @@ KERNEL_PACKAGE_NAME ??=3D &quot;kernel&quot;<br>
&gt;&gt;=C2=A0 =C2=A0KERNEL_DEPLOYSUBDIR ??=3D &quot;${@ &quot;&quot; if (=
d.getVar(&quot;KERNEL_PACKAGE_NAME&quot;) =3D=3D &quot;kernel&quot;) else<b=
r>
&gt;&gt; d.getVar(&quot;KERNEL_PACKAGE_NAME&quot;) }&quot;<br>
&gt;&gt;=C2=A0 =C2=A0<br>
&gt;&gt;=C2=A0 =C2=A0PROVIDES +=3D &quot;${@ &quot;virtual/kernel&quot; if=
 (d.getVar(&quot;KERNEL_PACKAGE_NAME&quot;) =3D=3D &quot;kernel&quot;) else=
 &quot;&quot; }&quot;<br>
&gt;&gt; -DEPENDS +=3D &quot;virtual/${TARGET_PREFIX}binutils virtual/${TA=
RGET_PREFIX}gcc kmod-native bc-native<br>
&gt;&gt; lzop-native bison-native&quot;<br>
&gt;&gt; +DEPENDS +=3D &quot;virtual/${TARGET_PREFIX}binutils virtual/${TA=
RGET_PREFIX}gcc kmod-native bc-native<br>
&gt;&gt; bison-native&quot;<br>
&gt;&gt; +DEPENDS +=3D &quot;${@bb.utils.contains(&quot;INITRAMFS_FSTYPES&=
quot;, &quot;cpio.lzo&quot;, &quot;lzop-native&quot;, &quot;&quot;, d)}&quo=
t;<br>
&gt;&gt;=C2=A0 =C2=A0DEPENDS +=3D &quot;${@bb.utils.contains(&quot;INITRAM=
FS_FSTYPES&quot;, &quot;cpio.lz4&quot;, &quot;lz4-native&quot;, &quot;&quot=
;, d)}&quot;<br>
&gt;&gt;=C2=A0 =C2=A0PACKAGE_WRITE_DEPS +=3D &quot;depmodwrapper-cross&quo=
t;<br>
&gt;&gt;=C2=A0 =C2=A0<br>
&gt;&gt;<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; <br>
</blockquote></div>

--000000000000ff1c1105aa662263--
