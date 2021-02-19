Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
 by mx.groups.io with SMTP id smtpd.web09.7130.1613733979317554328
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Feb 2021 03:26:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=VAYS35Wr;
 spf=pass (domain: gmail.com, ip: 209.85.208.42, mailfrom: quaresma.jose@gmail.com)
Received: by mail-ed1-f42.google.com with SMTP id c6so9340346ede.0
        for <openembedded-core@lists.openembedded.org>; Fri, 19 Feb 2021 03:26:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VLw9QIPFSIz6Zx1sH9ncm7oCXWRqm//bcWa+LpueXPg=;
        b=VAYS35Wrq17ghu1L9imliZOKVl1VYo9oxFYAVmuTvjE6ZC+Y11rcwgUFQwwe5bNDNz
         LtuT0JRJqDD7+RNmaqOmozGQBcZlLx5jRAhMSGpUdjSAtPDPyBj9ndKkyhUekKQkJezD
         4X8DUqcyVOEi9e3FP++8qyCm7A7XLUtzZp+5Um+i0odUExucMT1l5EiRYY/Ek14rb7S9
         VkzF38TudEiOD7hrm1MJqon8yfvOaJJXN77J+48eEpbAtpj0/u8mp+s1aYOvS5kkXpZa
         3Fxqt1d7FTCBtDHEOAgzU21MTWO2k+79ttndVE+DQD55hQKgNQogfkKSqSKU2Q7HlFuJ
         xOFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VLw9QIPFSIz6Zx1sH9ncm7oCXWRqm//bcWa+LpueXPg=;
        b=RbtRBLyAgpBcw/tKGalj1JJBZdaBzhv9JbyxVnhdARxE596uoLlL6JRXwsvf8+itaC
         UB02/61qL1q4/l1Iz3QRM8fyb22mB+9HzgWkHvDd6gvl74OdhUxO699pcC4Zlnh13c06
         p3JoM3i9AHHwNC96ZtV2eCc6pIRyZ67gAalGSOAIZPqvhnoxBdg+pNAI2b2CAEG3JpeP
         tXARdHw8Ip+jE+9AOLmDn7/FuuTOEvcLeZNFJdAqqEqtPhdfzihvsSQuHsIcSbwG2KoU
         AC7eQVZNynxlTweNHU7S7gAm3CVbYtSgeMTj4ua0Y3vEO/+Q/IjDPEfTfigLinMhe9Lq
         Bdwg==
X-Gm-Message-State: AOAM53072x9zME3ErQjoTe4u12wv39uRhpPrFt60JYGPRM3yMByqLrqS
	sl4wIYpZ7e+sCTNxiyiMTfNoN5XvrhWW1ZYSHHI=
X-Google-Smtp-Source: ABdhPJwOIdkv5hGLopVPmYF+bn1MlixI3pOCq8lcXIBu9GBBtj6HDqE1ef/Zk7et7d1CvnFFO1yJtdwwUU9DK0m0Zl0=
X-Received: by 2002:a05:6402:94d:: with SMTP id h13mr8995569edz.19.1613733977688;
 Fri, 19 Feb 2021 03:26:17 -0800 (PST)
MIME-Version: 1.0
References: <20210218192138.39449-1-jatedev@gmail.com> <20210218192138.39449-2-jatedev@gmail.com>
 <CANNYZj9W4N0VeTi2WOQYG0c_XzwYX0EwEXD-GVkoUz_ciaoUCw@mail.gmail.com> <623d1b0df8dec2247f9d0c41ca8372cfb0af59e8.camel@linuxfoundation.org>
In-Reply-To: <623d1b0df8dec2247f9d0c41ca8372cfb0af59e8.camel@linuxfoundation.org>
From: "Jose Quaresma" <quaresma.jose@gmail.com>
Date: Fri, 19 Feb 2021 11:26:06 +0000
Message-ID: <CANPvuRkeiwD0ngL8Ang-v4X2iHUxU9aVK5feDGAQ3kYqST-hdA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 2/2] iputils: Use STAGING_DIR_NATIVE for setcap detection
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>, Jate Sujjavanich <jatedev@gmail.com>, 
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000808ded05bbaeb828"

--000000000000808ded05bbaeb828
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

The only change needed on the recipe are:

-PACKAGECONFIG[libcap] =3D "-DUSE_CAP=3Dtrue, -DUSE_CAP=3Dfalse, libcap"
+PACKAGECONFIG[libcap] =3D "-DUSE_CAP=3Dtrue, -DUSE_CAP=3Dfalse, libcap
libcap-native"

The patch 0001-Add-support-for-setcap-in-STAGING_DIR_NATIVE.patch is not
need because
with the addition of the libcap-native the meson find_program will find
the setcap binary on the native sysroot
and will use it.


Richard Purdie <richard.purdie@linuxfoundation.org> escreveu no dia quinta=
,
18/02/2021 =C3=A0(s) 21:44:

> On Thu, 2021-02-18 at 20:58 +0100, Alexander Kanavin wrote:
> > On Thu, 18 Feb 2021 at 20:22, Jate Sujjavanich <jatedev@gmail.com>
> wrote:
> > > +-setcap =3D find_program('setcap', '/usr/sbin/setcap', '/sbin/setca=
p',
> required : false)
> > > ++stagingdirnative =3D get_option('stagingdirnative')
> > > ++setcap =3D find_program(stagingdirnative + '/usr/sbin/setcap',
> stagingdirnative + '/sbin/setcap', required
> > > : false)
> > >
> >
> > Just remove the hardcoded paths from find_program altogether (see meso=
n
> manual), and it will take the binary
> > from PATH env var, which is exactly how native sysroots are supposed t=
o
> work.
>
> I'm guessing upstream does this so you can build as a normal user who
> doesn't have sbin in PATH and still use setcap during "make install".
>
> We need something upstream might accept. I suspect what we need here
> is a way to specify a specific path to the util and then fall back on
> the current approach if the feature is enabled but no path provided.
> Please do ensure that it won't look in the host's directories unless
> its enabled though.
>
> Cheers,
>
> Richard
>
>
>=20
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--000000000000808ded05bbaeb828
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<div><br></div><div>The only change needed on the recip=
e are:</div><div><br></div><div><span style=3D"color:rgb(0,0,0)">-PACKAGECO=
NFIG[libcap] =3D &quot;-DUSE_CAP=3Dtrue, -DUSE_CAP=3Dfalse, libcap&quot;</s=
pan><br style=3D"color:rgb(0,0,0)"><span style=3D"color:rgb(0,0,0)">+PACKAG=
ECONFIG[libcap] =3D &quot;-DUSE_CAP=3Dtrue, -DUSE_CAP=3Dfalse, libcap libca=
p-native&quot;</span><br></div><div><span style=3D"color:rgb(0,0,0)"><br></=
span></div><div><span style=3D"color:rgb(0,0,0)">The patch=C2=A0</span><spa=
n style=3D"color:rgb(0,0,0)">0001-Add-support-for-s</span><span style=3D"co=
lor:rgb(0,0,0)">etcap-in-STAGING_DIR_NATIVE.pa</span><span style=3D"color:r=
gb(0,0,0)">tch is not need because</span></div><div><span style=3D"color:rg=
b(0,0,0)">with the addition of the=C2=A0</span>libcap-native=C2=A0<span sty=
le=3D"color:rgb(0,0,0)">the meson=C2=A0</span>find_program will find the=C2=
=
=A0setcap binary on the native sysroot</div><div>and will use it.</div><di=
v><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"=
gmail_attr">Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfounda=
tion.org">richard.purdie@linuxfoundation.org</a>&gt; escreveu no dia quinta=
, 18/02/2021 =C3=A0(s) 21:44:<br></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex">On Thu, 2021-02-18 at 20:58 +0100, Alexander Kanavin wrote:<b=
r>
&gt; On Thu, 18 Feb 2021 at 20:22, Jate Sujjavanich &lt;<a href=3D"mailto:=
jatedev@gmail.com" target=3D"_blank">jatedev@gmail.com</a>&gt; wrote:<br>
&gt; &gt; +-setcap =3D find_program(&#39;setcap&#39;, &#39;/usr/sbin/setca=
p&#39;, &#39;/sbin/setcap&#39;, required : false)<br>
&gt; &gt; ++stagingdirnative =3D get_option(&#39;stagingdirnative&#39;)<br=
>
&gt; &gt; ++setcap =3D find_program(stagingdirnative + &#39;/usr/sbin/setc=
ap&#39;, stagingdirnative + &#39;/sbin/setcap&#39;, required<br>
&gt; &gt; : false)<br>
&gt; &gt; <br>
&gt; <br>
&gt; Just remove the hardcoded paths from find_program altogether (see mes=
on manual), and it will take the binary<br>
&gt; from PATH env var, which is exactly how native sysroots are supposed =
to work.<br>
<br>
I&#39;m guessing upstream does this so you can build as a normal user who<=
br>
doesn&#39;t have sbin in PATH and=C2=A0still use setcap during &quot;make =
install&quot;.<br>
<br>
We need something upstream might accept. I suspect what we need here=C2=A0=
<br>
is a way to specify a specific path to the util and then fall back on=C2=
=A0<br>
the current approach if the feature is enabled but no path provided.=C2=A0=
<br>
Please do ensure that it won&#39;t look in the host&#39;s directories unle=
ss=C2=A0<br>
its enabled though.<br>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr=
" class=3D"gmail_signature"><div dir=3D"ltr">Best regards,<div><br>Jos=C3=
=A9 Quaresma</div></div></div>

--000000000000808ded05bbaeb828--
