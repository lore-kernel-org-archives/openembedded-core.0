Return-Path: <liu.ming50@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A85B2D10C1B
	for <webhook@archiver.kernel.org>; Sun, 27 Oct 2024 10:35:02 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web10.27411.1730025293253810709
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Oct 2024 03:34:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Z48N9BDy;
 spf=pass (domain: gmail.com, ip: 209.85.216.50, mailfrom: liu.ming50@gmail.com)
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-2e2a999b287so2705130a91.0
        for <openembedded-core@lists.openembedded.org>; Sun, 27 Oct 2024 03:34:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730025293; x=1730630093; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NuBzpoZG81uNJSBiBK4g7QtFWuCnlVsEIQtKYsTI/0Y=;
        b=Z48N9BDyBUB7qa5+S6druXeIzdlUUTfyXdGiH0MMjZ1LAjtVO6N7X4gdf5oy6B86Cg
         cLnaxzI2bcCLmBLukhrXprnCQXBK9veuxm2Nn1vDMknzG+nLKntwTXT0G7x8GRytxIt2
         Uvk8Y+EqpiACVVkKpFR4iowGpKQDRGyqi9iNoVDe9LA1FaULtq+urydVYzH8kL6bqFrx
         PLvGYcml4L38dgTTY+5aERtfzNJn2z/5hXYih0MiQsHkEMQ9Ah2TQ7z03phY4mkl09pL
         AFRblJVW01ofcNUGUsQqgKYFRZF/dSKBFPe7ny7t4UCW82E09Z6uOSN9JNTJQ30UrYdn
         H8oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730025293; x=1730630093;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NuBzpoZG81uNJSBiBK4g7QtFWuCnlVsEIQtKYsTI/0Y=;
        b=kMqRW0briGxwbPgctan2H4IVXOrw1ZVNBTfYVqQM1/TcaAWwr5rcYZRFPZXa7eBC8X
         8K3/+BF37SuP8osNzGfPyMaVyy7hzYmkSXIu7Uj5jT/v86vVddSd9wlG7eGn5C2OKS3a
         d4mFdaLGux8hEXpWkjwt2THfyHBSCTU4OnZZ8m5dgokk/2XGukSJNDrPzsS9N+AWjE5J
         NVte8rzTeH9n0G87J37vb1Xl57D2mhHOII5nBc6Tm9kGGWELU9MmpAc6ulvQr3bU3Koe
         csuebsV/yUIPtFW63RWpIrWyqfkWOFj8faXmffZeVHz7u1x0mPPK82mMeRAcRde7qmKb
         QERw==
X-Gm-Message-State: AOJu0Yzr8foqamdpOlNwe/mvivxQ6IPYraJ8CRD72iKTNDvEYPvh2iMH
	8kRCykp4ZabBXk/n9YPzZeFqp7uCTTxGuuhk/ZJkmSJpKRdMp6fEoVLbPHeO1uo4PGoc2MHTADZ
	rqdPYalcOMtRnFCJTBrLUzz5fBG0=
X-Google-Smtp-Source: AGHT+IGUv3w4apRpOyfA6rGSzefxL0QVrMtmw8qIyEL7TTvYqvcB0O4CzELS60HntwayEnuJH9hlMJApXjgLpKRglrs=
X-Received: by 2002:a17:90a:d807:b0:2d3:c638:ec67 with SMTP id
 98e67ed59e1d1-2e8f0d4d3bfmr5872625a91.0.1730025292552; Sun, 27 Oct 2024
 03:34:52 -0700 (PDT)
MIME-Version: 1.0
References: <20241023151127.3611757-1-liu.ming50@gmail.com> <E55625D9-E305-463B-B7C4-4E75B41A8646@arm.com>
In-Reply-To: <E55625D9-E305-463B-B7C4-4E75B41A8646@arm.com>
From: Ming Liu <liu.ming50@gmail.com>
Date: Sun, 27 Oct 2024 11:34:41 +0100
Message-ID: <CALatG=7-Y+czk7zgzU-2dnD85G2dk50aSvTyeOcqAus-bYqzeg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH V2 1/2] toolchain-shar-extract.sh: check
 required tool before extracting SDK
To: Ross Burton <Ross.Burton@arm.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000003e1f7062572e7ec"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 27 Oct 2024 10:35:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206393

--00000000000003e1f7062572e7ec
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Ross:

Thanks for the reply, will make a V3!

Ross Burton <Ross.Burton@arm.com> =E6=96=BC 2024=E5=B9=B410=E6=9C=8824=E6=
=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=8812:59=E5=AF=AB=E9=81=93=EF=BC=
=9A

> On 23 Oct 2024, at 16:11, Ming Liu via lists.openembedded.org <liu.ming50=
=3D
> gmail.com@lists.openembedded.org> wrote:
> >
> > To extract the SDK archive, the proper tools need to be present on
> > system, check unzip for zip archive type, check xz for tar.xz archive
> > type.
> >
> > Signed-off-by: Ming Liu <liu.ming50@gmail.com>
> > ---
> > meta/files/toolchain-shar-extract.sh | 8 ++++++++
> > 1 file changed, 8 insertions(+)
> >
> > diff --git a/meta/files/toolchain-shar-extract.sh
> b/meta/files/toolchain-shar-extract.sh
> > index 3b4647fca7..9b72499ccf 100644
> > --- a/meta/files/toolchain-shar-extract.sh
> > +++ b/meta/files/toolchain-shar-extract.sh
> > @@ -245,6 +245,10 @@ fi
> >
> > printf "Extracting SDK..."
> > if [ @SDK_ARCHIVE_TYPE@ =3D "zip" ]; then
> > +    if [ -z "$(which unzip)" ]; then
> > +        echo "Aborted, unzip is required to extract the SDK archive,
> please make sure it's installed on your system!"
> > +        exit 1
> > +    fi
>
> Unfortunately =E2=80=98which=E2=80=99 is not POSIX or even universally in=
stalled on Linux
> systems.
>
> https://hynek.me/til/which-not-posix/
>
> Using command -v is the portable alternative.
>
> Ross
>
>

--00000000000003e1f7062572e7ec
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi, Ross:<div><br></div><div>Thanks for the reply, will ma=
ke a V3!</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">Ross Burton &lt;<a href=3D"mailto:Ross.Burton@arm.com">Ross=
.Burton@arm.com</a>&gt; =E6=96=BC 2024=E5=B9=B410=E6=9C=8824=E6=97=A5 =E9=
=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=8812:59=E5=AF=AB=E9=81=93=EF=BC=9A<br></div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex">On 23 Oct 2024, at 16:11=
, Ming Liu via <a href=3D"http://lists.openembedded.org" rel=3D"noreferrer"=
 target=3D"_blank">lists.openembedded.org</a> &lt;liu.ming50=3D<a href=3D"m=
ailto:gmail.com@lists.openembedded.org" target=3D"_blank">gmail.com@lists.o=
penembedded.org</a>&gt; wrote:<br>
&gt; <br>
&gt; To extract the SDK archive, the proper tools need to be present on<br>
&gt; system, check unzip for zip archive type, check xz for tar.xz archive<=
br>
&gt; type.<br>
&gt; <br>
&gt; Signed-off-by: Ming Liu &lt;<a href=3D"mailto:liu.ming50@gmail.com" ta=
rget=3D"_blank">liu.ming50@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt; meta/files/toolchain-shar-extract.sh | 8 ++++++++<br>
&gt; 1 file changed, 8 insertions(+)<br>
&gt; <br>
&gt; diff --git a/meta/files/toolchain-shar-extract.sh b/meta/files/toolcha=
in-shar-extract.sh<br>
&gt; index 3b4647fca7..9b72499ccf 100644<br>
&gt; --- a/meta/files/toolchain-shar-extract.sh<br>
&gt; +++ b/meta/files/toolchain-shar-extract.sh<br>
&gt; @@ -245,6 +245,10 @@ fi<br>
&gt; <br>
&gt; printf &quot;Extracting SDK...&quot;<br>
&gt; if [ @SDK_ARCHIVE_TYPE@ =3D &quot;zip&quot; ]; then<br>
&gt; +=C2=A0 =C2=A0 if [ -z &quot;$(which unzip)&quot; ]; then<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &quot;Aborted, unzip is required to =
extract the SDK archive, please make sure it&#39;s installed on your system=
!&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 exit 1<br>
&gt; +=C2=A0 =C2=A0 fi<br>
<br>
Unfortunately =E2=80=98which=E2=80=99 is not POSIX or even universally inst=
alled on Linux systems.<br>
<br>
<a href=3D"https://hynek.me/til/which-not-posix/" rel=3D"noreferrer" target=
=3D"_blank">https://hynek.me/til/which-not-posix/</a><br>
<br>
Using command -v is the portable alternative.<br>
<br>
Ross<br>
<br>
</blockquote></div>

--00000000000003e1f7062572e7ec--

