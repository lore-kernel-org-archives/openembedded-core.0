Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
 by mx.groups.io with SMTP id smtpd.web11.7460.1587332956112117583
 for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Apr 2020 14:49:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=mjDR6n0W;
 spf=pass (domain: gmail.com, ip: 209.85.208.44, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f44.google.com with SMTP id d16so5847319edq.7
        for <openembedded-core@lists.openembedded.org>; Sun, 19 Apr 2020 14:49:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6CI/pMwtnj8RRiZLYD1F14HiMzzkr/fIDwRxyI8aNeE=;
        b=mjDR6n0WQmp8vTlHtaAohpqQ2jBP+RkVr1w9DreNjtBzP7ivSgg7PNZQIZFjRT4aI+
         GgbATJNAsytK7LwQSIyjNyOZY6NtWkft9m8o+C1SZHCa8hF44XzEojgJ2T4u5u5wVRVa
         Dvlwxjnk5BwO9zysP2EiuVFPqRj5vvA0FvgHTyxU+qDop7jznsoNghp50lX67vhcKqQG
         i/sBusprvIF3vSec27e8vRjQEfQAPlVoMpL3YpmlaY/PK3DZD7Fo0ueJEmynZBpOkD8O
         d04V9KMdrmJME9dU0oKKqkcHPF1IO3ft9g2cRDhk9mMGrK2iRe+IMblgG9PalNQV087h
         8Sww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6CI/pMwtnj8RRiZLYD1F14HiMzzkr/fIDwRxyI8aNeE=;
        b=pVTCLqGqeGXaCJm/SPturoEw3TILEaxWCAQpYOuSgIYEbRvIeOdLYTij/uup2qrB3k
         bPGvRZPQAt15YDIXx0ptwrcHMj1oDV1widN+6sVH5pIYlJsOiY2DE0pkMm0piUvA0b0g
         ht7ylem70p8HKXAOkUOupVG+JF7KY9AcWjnBa+AzXSSyYh7rh1fTwamzQFHfMwSPaYPJ
         QYZ/yUeC3T7esVVJrarsTNsqhh3TO8ai4kTSnyyosIGWfX244amvbPyq2m192h9lbvfT
         oH2RBVt08Gg4R5H8T4oo1BUPE0elP/Xue6uB0kNcbQRFz5si7AA8DOpBYCTr4Jo+GiDF
         hvgw==
X-Gm-Message-State: AGi0Pua7GFCcw0Dx9wmJ3GbI003CalIN/O00J5Gh8ElliuiAyPqr5BFn
	D+tyh6eoFYST0Gyh/QNHoIuw2GLNg7H03x9vun4=
X-Google-Smtp-Source: APiQypKAVvgYwMVtaTrpmX9QJEcib+wa2+I7psL7rzlFgTiUsAuoUcFr3Mqi1tQwazVmPFKXFQQya/4WgnY9bi9pI0w=
X-Received: by 2002:a50:eb8e:: with SMTP id y14mr11859734edr.270.1587332954579;
 Sun, 19 Apr 2020 14:49:14 -0700 (PDT)
MIME-Version: 1.0
References: <DM5PR12MB24716958338957D20225905B8BD70@DM5PR12MB2471.namprd12.prod.outlook.com>
In-Reply-To: <DM5PR12MB24716958338957D20225905B8BD70@DM5PR12MB2471.namprd12.prod.outlook.com>
From: "Martin Jansa" <Martin.Jansa@gmail.com>
Date: Sun, 19 Apr 2020 22:49:04 +0100
Message-ID: <CA+chaQdBw7KakRcy3A-1TBi361ZPutzWVG3jyRiaswoXH9+2TQ@mail.gmail.com>
Subject: Re: [OE-core] Uninative for i386 native tool?
To: Chris Laplante <chris.laplante@agilent.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000e5e51005a3abc021"

--000000000000e5e51005a3abc021
Content-Type: text/plain; charset="UTF-8"

One possible work around which I'm using for some prebuilt native binaries
is to call them with hosts loader (e.g. /lib32/ld-linux.so.2
${STAGING_BINDIR_NATIVE}/my-tool params)

On Sun, Apr 19, 2020 at 10:37 PM Chris Laplante via lists.openembedded.org
<chris.laplante=agilent.com@lists.openembedded.org> wrote:

> We have a vendor-provided cross-compiler toolchain that is distributed as
> 32-bit binaries. Naturally on my native system (outside of Yocto) I can run
> them by first adding the i386 architecture to dpkg, and then doing "apt-get
> install -y libc6-dbg:i386 lib32stdc++6 libzstd1:i386 libncurses5:i386" or
> similar.
>
> Outside of Yocto (a normal terminal):
> ____
> ldd recipe-sysroot-native/usr/bin/my-tool:
>         linux-gate.so.1 =>  (0xf7f03000)
>         libstdc++.so.6 => /usr/lib/i386-linux-gnu/libstdc++.so.6
> (0xf7d48000)
>         libm.so.6 => /lib/i386-linux-gnu/libm.so.6 (0xf7cf3000)
>         libgcc_s.so.1 => /lib/i386-linux-gnu/libgcc_s.so.1 (0xf7cd6000)
>         libc.so.6 => /lib/i386-linux-gnu/libc.so.6 (0xf7b20000)
>
> /home/laplante/yocto/build/tmp/sysroots-uninative/x86_64-linux/lib/ld-linux-x86-64.so.2
> => /lib/ld-linux.so.2 (0xf7f05000)
> ____
>
>
>
> But in a Yocto devshell:
> ____
> ldd recipe-sysroot-native/usr/bin/my-tool:
>         not a dynamic executable
> ____
>
> Is there a way to get this working in Yocto? I assume it has something to
> do with uninative?
>
> Thanks,
> Chris
> 
>

--000000000000e5e51005a3abc021
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">One possible work around which I&#39;m using for some preb=
uilt native binaries is to call them with hosts loader (e.g. /lib32/ld-linu=
x.so.2 ${STAGING_BINDIR_NATIVE}/my-tool params)</div><br><div class=3D"gmai=
l_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sun, Apr 19, 2020 at 10:3=
7 PM Chris Laplante via <a href=3D"http://lists.openembedded.org">lists.ope=
nembedded.org</a> &lt;chris.laplante=3D<a href=3D"mailto:agilent.com@lists.=
openembedded.org">agilent.com@lists.openembedded.org</a>&gt; wrote:<br></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex">We have a vendor-provid=
ed cross-compiler toolchain that is distributed as 32-bit binaries. Natural=
ly on my native system (outside of Yocto) I can run them by first adding th=
e i386 architecture to dpkg, and then doing &quot;apt-get install -y libc6-=
dbg:i386 lib32stdc++6 libzstd1:i386 libncurses5:i386&quot; or similar.<br>
<br>
Outside of Yocto (a normal terminal):<br>
____<br>
ldd recipe-sysroot-native/usr/bin/my-tool:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 linux-gate.so.1 =3D&gt;=C2=A0 (0xf7f03000)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 libstdc++.so.6 =3D&gt; /usr/lib/i386-linux-gnu=
/libstdc++.so.6 (0xf7d48000)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 libm.so.6 =3D&gt; /lib/i386-linux-gnu/libm.so.=
6 (0xf7cf3000)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 libgcc_s.so.1 =3D&gt; /lib/i386-linux-gnu/libg=
cc_s.so.1 (0xf7cd6000)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 libc.so.6 =3D&gt; /lib/i386-linux-gnu/libc.so.=
6 (0xf7b20000)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 /home/laplante/yocto/build/tmp/sysroots-uninat=
ive/x86_64-linux/lib/ld-linux-x86-64.so.2 =3D&gt; /lib/ld-linux.so.2 (0xf7f=
05000)<br>
____<br>
<br>
<br>
<br>
But in a Yocto devshell:<br>
____<br>
ldd recipe-sysroot-native/usr/bin/my-tool:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 not a dynamic executable<br>
____<br>
<br>
Is there a way to get this working in Yocto? I assume it has something to =
do with uninative?<br>
<br>
Thanks,<br>
Chris<br>
<br>
</blockquote></div>

--000000000000e5e51005a3abc021--
