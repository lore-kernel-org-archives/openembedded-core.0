Received: from mail-io1-f65.google.com (mail-io1-f65.google.com [209.85.166.65])
 by mx.groups.io with SMTP id smtpd.web10.53787.1600726733962573463
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Sep 2020 15:18:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=oOg/4/4q;
 spf=pass (domain: gmail.com, ip: 209.85.166.65, mailfrom: ticotimo@gmail.com)
Received: by mail-io1-f65.google.com with SMTP id v8so10562820iom.6
        for <openembedded-core@lists.openembedded.org>; Mon, 21 Sep 2020 15:18:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=HWkMvpFP/IG4sIZk/TngLMmH542qcDgqx+iYyLWYBy0=;
        b=oOg/4/4qalQEVzU6oPcy4M03hwLSuEV61GUd70Vb/nGx9pqOPUeNv+f5Ysg14SjIKz
         iU9t7++fKwRtU+nda8gjKngCmmkH2PzPcvAyf3wKnYY0bBuqtpBssCJ1/m524T6cdr9+
         mibX+rT0X5WD/yT/zE6urs37o2ZF4CnP2ivA7YfeV/yO3srJxWYsZCottFLpD2dWylox
         Z3TDX7HyV8FiRFwPZa2EwGfVRTCkplRdfxB0N2y6ZYsSQdrsuAvIasUANSPyiE4n9pfl
         4uyIriiC497WznXl4iwOBCcug1OK6VGmuxt9TPiGvH4MhaxAAOpdpGrBUCeLyfLLGqYP
         bsVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HWkMvpFP/IG4sIZk/TngLMmH542qcDgqx+iYyLWYBy0=;
        b=EXvNiNCaTyCw18D58CokiNYZG4S796BEzd7lXwHi8Kd0ZPOqhR2u633z0yUleLCtCT
         EIbepzaqFdaefTsTLSDitVMqwXcWoa9Job1bqYcv4x+nNxiVgRAM/qEuA+N42PvxZzPA
         uhjf35SCmrZY58oumUVrsIWK8zsxrxbx3cfeE7rxZt1nDkT1XbyL9orBhcC0o5bLzme/
         vbYQtJ65ua9lOKx8W9dFXlerB0Ftea25JaLrIPHxfKpWP1MRDsj7BenQMkFSZGtAW83d
         0zVh8xAvW/y1h4HOqpsoQJq07zjl6x+qlIW6a6Aa8ZdTlAg2XnroLI5RLeXrlBV6Wz7j
         6LTA==
X-Gm-Message-State: AOAM5313/NSdRZPQPnUNGRasNh/Vak4I80AzvfF1QDbztiSuBZMraKGr
	t1VXT/BhyslQw9s/cShIHKj0V4oE0E/7pEG3+c0=
X-Google-Smtp-Source: ABdhPJzkO7scNWBRAPcPLclWLxwNP06QbmmezJr/eW1adHvuYKCrG+JV7ClcnONd5u0Ye2LYaD12/UGhCcJ9Q/wMPMQ=
X-Received: by 2002:a02:9a0e:: with SMTP id b14mr1855653jal.22.1600726733130;
 Mon, 21 Sep 2020 15:18:53 -0700 (PDT)
MIME-Version: 1.0
References: <20200921121204.2443466-1-richard.purdie@linuxfoundation.org>
In-Reply-To: <20200921121204.2443466-1-richard.purdie@linuxfoundation.org>
From: "Tim Orling" <ticotimo@gmail.com>
Date: Mon, 21 Sep 2020 15:18:42 -0700
Message-ID: <CANx9H-C+JH7Dm1JcuC2-4JBOXSr0XqAqO=xCkfjfL-yan0ucyA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 0/3] Import two python recipes from meta-oe/meta-python
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000004f905805afda3cab"

--0000000000004f905805afda3cab
Content-Type: text/plain; charset="UTF-8"

On Mon, Sep 21, 2020 at 5:12 AM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> We have a slightly pressing situation where the performance test builds
> are failing after we cleaned up the system installs on those machines
> and tried to switch over to buildtools entirely.
>
> The issue is the need for jinja2, complicated by the recipe's ptest
> dependencies. This series imports them with ptest not inherited, the
> idea being meta-python can bbappend and add the inherit.
>
> The alternatives are either to try and solve this on the performace
> test machines using horrible hacks and revert my earlier attempted fix
> (which is correct but makes the situation worse), or import pytest
> over too which we may ultimately end up doing but probably should
> do right now?
>
>
While bringing pytest into oe-core may ultimately make sense, the shear
number of dependencies
should not be brought in lightly. Given the urgency of the situation, I
agree with the approach to only
bring in what is necessary and disable ptest for these recipes. I will work
on .bbappends for meta-python.
Trevor G and I will fix any collateral damage in meta-python.

Richard Purdie (3):
>   python3-markupsafe: Import from meta-oe/meta-python
>   python3-jinja2: Import from meta-oe/meta-python
>   buildtools-tarball: Add python3-jinja2
>
>  meta/conf/distro/include/maintainers.inc      |  2 +
>  meta/recipes-core/meta/buildtools-tarball.bb  |  1 +
>  .../python/python3-jinja2/run-ptest           |  3 ++
>  .../python/python3-jinja2_2.11.2.bb           | 45 +++++++++++++++++++
>  .../python/python3-markupsafe/run-ptest       |  3 ++
>  .../python/python3-markupsafe_1.1.1.bb        | 28 ++++++++++++
>  6 files changed, 82 insertions(+)
>  create mode 100644 meta/recipes-devtools/python/python3-jinja2/run-ptest
>  create mode 100644 meta/recipes-devtools/python/python3-jinja2_2.11.2.bb
>  create mode 100644
> meta/recipes-devtools/python/python3-markupsafe/run-ptest
>  create mode 100644 meta/recipes-devtools/python/
> python3-markupsafe_1.1.1.bb
>
> --
> 2.25.1
>
>
> 
>
>

--0000000000004f905805afda3cab
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Sep 21, 2020 at 5:12 AM Richa=
rd Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org">richard=
.purdie@linuxfoundation.org</a>&gt; wrote:<br></div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-l=
eft-style:solid;border-left-color:rgb(204,204,204);padding-left:1ex">We hav=
e a slightly pressing situation where the performance test builds<br>
are failing after we cleaned up the system installs on those machines<br>
and tried to switch over to buildtools entirely.<br>
<br>
The issue is the need for jinja2, complicated by the recipe&#39;s ptest<br=
>
dependencies. This series imports them with ptest not inherited, the<br>
idea being meta-python can bbappend and add the inherit.<br>
<br>
The alternatives are either to try and solve this on the performace<br>
test machines using horrible hacks and revert my earlier attempted fix<br>
(which is correct but makes the situation worse), or import pytest <br>
over too which we may ultimately end up doing but probably should <br>
do right now?<br>
<br></blockquote><div><br></div><div>While bringing pytest into oe-core ma=
y ultimately make sense, the shear number of dependencies</div><div>should =
not be brought in lightly. Given the urgency of the situation, I agree with=
 the approach to only</div><div>bring in what is necessary and disable ptes=
t for these recipes. I will work on .bbappends for meta-python.</div><div>T=
revor G and I will fix any collateral damage in meta-python.</div><div><br>=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left-width:1px;border-left-style:solid;border-left-color:rgb(204,204,=
204);padding-left:1ex">
Richard Purdie (3):<br>
=C2=A0 python3-markupsafe: Import from meta-oe/meta-python<br>
=C2=A0 python3-jinja2: Import from meta-oe/meta-python<br>
=C2=A0 buildtools-tarball: Add python3-jinja2<br>
<br>
=C2=A0meta/conf/distro/include/maintainers.inc=C2=A0 =C2=A0 =C2=A0 |=C2=A0=
 2 +<br>
=C2=A0meta/recipes-core/meta/<a href=3D"http://buildtools-tarball.bb" rel=
=3D"noreferrer" target=3D"_blank">buildtools-tarball.bb</a>=C2=A0 |=C2=A0 =
1 +<br>
=C2=A0.../python/python3-jinja2/run-ptest=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0|=C2=A0 3 ++<br>
=C2=A0.../python/<a href=3D"http://python3-jinja2_2.11.2.bb" rel=3D"norefe=
rrer" target=3D"_blank">python3-jinja2_2.11.2.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0| 45 +++++++++++++++++++<br>
=C2=A0.../python/python3-markupsafe/run-ptest=C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 3 ++<br>
=C2=A0.../python/<a href=3D"http://python3-markupsafe_1.1.1.bb" rel=3D"nor=
eferrer" target=3D"_blank">python3-markupsafe_1.1.1.bb</a>=C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 | 28 ++++++++++++<br>
=C2=A06 files changed, 82 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-devtools/python/python3-jinja2/run-p=
test<br>
=C2=A0create mode 100644 meta/recipes-devtools/python/<a href=3D"http://py=
thon3-jinja2_2.11.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-jinja2=
_2.11.2.bb</a><br>
=C2=A0create mode 100644 meta/recipes-devtools/python/python3-markupsafe/r=
un-ptest<br>
=C2=A0create mode 100644 meta/recipes-devtools/python/<a href=3D"http://py=
thon3-markupsafe_1.1.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-mar=
kupsafe_1.1.1.bb</a><br>
<br>
-- <br>
2.25.1<br>
<br>
<br>
<br>
<br>
</blockquote></div></div>

--0000000000004f905805afda3cab--
