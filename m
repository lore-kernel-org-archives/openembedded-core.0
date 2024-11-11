Return-Path: <sreejith.ravi087@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD45AD2E9D4
	for <webhook@archiver.kernel.org>; Mon, 11 Nov 2024 10:23:58 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
 by mx.groups.io with SMTP id smtpd.web10.56193.1731320630606631899
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Nov 2024 02:23:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BeZWwYU9;
 spf=pass (domain: gmail.com, ip: 209.85.208.50, mailfrom: sreejith.ravi087@gmail.com)
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5c937982445so617834a12.2
        for <openembedded-core@lists.openembedded.org>; Mon, 11 Nov 2024 02:23:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731320629; x=1731925429; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=I38yjcGnIzmLTIejhOfC/TqOZwch3XPt9wSZ0CegPu0=;
        b=BeZWwYU99kMrLstu/HVuHDuS5iF+eYWKon38Jd96gd/slYwHHzVQaRCJ2DmSA/el3G
         cvslwEEdZ+NhwCdQFONdHGwZRCE0niOxW1nw0wokLmyh3/J3mybWGH9lbP14nV3uHqsS
         Vj5JxfFRiUHASZZCPMmHkqc0UzjiowmVVT5ZmojDmsCQ0OjvVICkmiY4+ZxATO/vQjWW
         GoUDhInjbN3gOidbfCx/qH8hWlIMhj7459lGbM/tqJtWQH7HPKNtwifA6BochNXU+0F4
         RP2efcKPYcx8GnxgFPS/9tswgFk9HSnKSF1Qt4K8E6ZBRjwB15csJVSjHSJZhqQx0d6u
         fqYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731320629; x=1731925429;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I38yjcGnIzmLTIejhOfC/TqOZwch3XPt9wSZ0CegPu0=;
        b=bQqtIWDmB2oig54OyalUNZH48cO/Sn9n+tXaR4hH+Rnxfo59g2mNgItps3mkaYA8Xs
         03CI4yk2g882csYloSjmJoKdsL3f77cCAq22odV+imMDTcKO+54RY8R8gZQa++oPxxmI
         LQ+mvWrrv3w7lCRDU7iCxvuDL3mw6kFByZULis1U/Ra9d2OEbQao2qDf0aNDU0igvOaJ
         9WN4hK9XyHZQUWRJWwi4jQVC7HYKrMUX37Kni/TBHXjx8OINGKGnVVLvKVKv82z0Znhy
         1ZAZqXPxOCw+fv78Vpkoak4++xx6KYM+UBuHJbTAvIXUkgaYSoorngZy3pMhMVqapfuW
         c9yA==
X-Gm-Message-State: AOJu0YyeoU9DTnzUOkZW8jf3yx3ywkdYtczvjhOK9QQsK1PJ91CaiGdX
	nSLJBh5EFYSKbdIX4WKRbfnr0ov4B0COhpDruRjpFnpkSvBxO0uE6VRy1HjhUjApBo1MnhkFRN2
	9Cf5g2mkO4qf1xBedcvcFpx/CYbY=
X-Google-Smtp-Source: AGHT+IHJh03wl/4/tlgBiSf42TIAwklcfa2a5LrwVrRetRG7L3yQPvc9u453GA/dC9nZm7HE412G2qItr5KZRYKICL4=
X-Received: by 2002:a05:6402:26c8:b0:5ce:fc33:5c8f with SMTP id
 4fb4d7f45d1cf-5cf0a310d6cmr3950640a12.3.1731320628674; Mon, 11 Nov 2024
 02:23:48 -0800 (PST)
MIME-Version: 1.0
References: <20241024144845.43504-1-sreejith.ravi087@gmail.com> <e5078dbc15b853f94edf433891fbfe21ff077576.camel@linuxfoundation.org>
In-Reply-To: <e5078dbc15b853f94edf433891fbfe21ff077576.camel@linuxfoundation.org>
From: Sreejith Ravi <sreejith.ravi087@gmail.com>
Date: Mon, 11 Nov 2024 10:23:35 +0000
Message-ID: <CAFt4JuEedBeZvsi1vouzMMm+iZXTv+=nXoPVzfn7+RPgF9r6Uw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] packagedata.py : Fix RDEPENDS Version issue
 with AUTOINC
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000001088080626a07f1d"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Nov 2024 10:23:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206943

--0000000000001088080626a07f1d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

That was my mistake.

I modified RDEPENDS without using expand=3DFalse before the do_package task=
,
which caused the issue. The PKGV value is updated with AUTOINC only during
the do_package task. Since we modified RDEPENDS before do_package, it was
already set with the expanded PKGV, preventing it from updating with
AUTOINC.

Is there another way to handle AUTOINC? It seems that if the variable is
expanded before the do_package task, it will not reflect the updated value
during do_package.

Thanks
Sreejith

On Mon, Oct 28, 2024 at 11:04=E2=80=AFAM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Thu, 2024-10-24 at 15:48 +0100, Sreejith Ravi via
> lists.openembedded.org wrote:
> > Currently, RDEPENDS for -staticdev and -dev is set using EXTENDPKGV
> > in meta/conf/bitbake.conf:
> > ----------------------------------
> > EXTENDPKGV ?=3D "${EXTENDPKGEVER}${PKGV}-${PKGR}"
> > DEV_PKG_DEPENDENCY =3D "${PN} (=3D ${EXTENDPKGV})"
> > RDEPENDS:${PN}-staticdev =3D "${PN}-dev (=3D ${EXTENDPKGV})"
> > ----------------------------------
> >
> > During the do_package task, AUTOINC is replaced in PKGV
> > (via package_setup_pkgv), which is used for creating the package name.
> > However, Yocto sets RDEPENDS with PKGV during the recipe parsing stage,
> > resulting in the RDEPENDS field in the IPK control data containing
> AUTOINC.
> >
> > As the IPK name is generated with the updated PKGV, but the version in
> > RDEPENDS still uses AUTOINC, this mismatch leads to installation
> failures.
> >
> > Example: libnsl
> > install libnsl-staticdev throws the error,  nothing provides
> > libnsl-dev =3D 1.2.0+gitAUTOINC+4a062cf418-r0
> > ----------------------------------
> > IPKs available:
> > libnsl2_1.2.0+git0+4a062cf418-r0_armv7at2hf-neon.ipk
> > libnsl-src_1.2.0+git0+4a062cf418-r0_armv7at2hf-neon.ipk
> > libnsl-dbg_1.2.0+git0+4a062cf418-r0_armv7at2hf-neon.ipk
> > libnsl-staticdev_1.2.0+git0+4a062cf418-r0_armv7at2hf-neon.ipk
> > libnsl-dev_1.2.0+git0+4a062cf418-r0_armv7at2hf-neon.ipk
> >
> > control data: libnsl-staticdev
> > Package: libnsl-staticdev
> > Version: 1.2.0+git0+4a062cf418-r0
> > ----
> > ----
> > Depends: libnsl-dev (=3D 1.2.0+gitAUTOINC+4a062cf418-r0)
> > Provides: libnsl2-staticdev
> > Source: libnsl2_git.bb
> >
> > control data: libnsl-dev
> > Package: libnsl-dev
> > Version: 1.2.0+git0+4a062cf418-r0
> > ----
> > ----
> > Depends: libnsl2 (=3D 1.2.0+gitAUTOINC+4a062cf418-r0), libtirpc-dev
> > Recommends: gcc-runtime-dev, glibc-dev, libtirpc-dev
> > Provides: libnsl2-dev
> > Source: libnsl2_git.bb
> > ----------------------------------
> >
> > This patch fixes the RDEPENDS versions set using EXTENDPKGV in the -dev
> and
> > -staticdev packages. It replaces AUTOINC before generating the package
> control data.
> >
> > Updated control data:
> > ----------------------------------
> > Package: libnsl-dev
> > Version: 1.2.0+git0+4a062cf418-r0
> > ----
> > ----
> > Depends: libnsl2 (=3D 1.2.0+git0+4a062cf418-r0), libtirpc-dev
> > Recommends: gcc-runtime-dev, glibc-dev, libtirpc-dev
> > Provides: libnsl2-dev
> > Source: libnsl2_git.bb
> >
> > Package: libnsl-staticdev
> > Version: 1.2.0+git0+4a062cf418-r0
> > ----
> > ----
> > Depends: libnsl-dev (=3D 1.2.0+git0+4a062cf418-r0)
> > Provides: libnsl2-staticdev
> > Source: libnsl2_git.bb
> > ----------------------------------
> >
> > Signed-off-by: Sreejith Ravi <sreejith.ravi087@gmail.com>
> > ---
> >  meta/classes-global/package.bbclass | 9 +++++++++
> >  1 file changed, 9 insertions(+)
> >
> > diff --git a/meta/classes-global/package.bbclass
> b/meta/classes-global/package.bbclass
> > index 6cd8c0140f..066a7ff835 100644
> > --- a/meta/classes-global/package.bbclass
> > +++ b/meta/classes-global/package.bbclass
> > @@ -325,6 +325,15 @@ python package_setup_pkgv() {
> >      # Adjust pkgv as necessary...
> >      if 'AUTOINC' in pkgv:
> >          d.setVar("PKGV", pkgv.replace("AUTOINC",
> "${PRSERV_PV_AUTOINC}"))
> > +
> > +    # Adjust dependencies that are statically set with EXTENDPKGV
> > +    vars =3D
> ["RDEPENDS","RPROVIDES","RRECOMMENDS","RSUGGESTS","RREPLACES","RCONFLICTS=
"]
> > +    packages =3D d.getVar('PACKAGES').split()
> > +    for var in vars:
> > +        for pkg in packages:
> > +            val =3D d.getVar("%s_%s"%(var,pkg))
> > +            if val and 'AUTOINC' in val:
> > +                d.setVar("%s_%s"%(var,pkg), val.replace("AUTOINC",
> "${PRSERV_PV_AUTOINC}"))
> >  }
> >
>
> Something isn't adding up here. With master, if I set:
>
> DISABLE_STATIC:pn-libnsl2 =3D ""
>
> and put PV =3D "2.0.1+git${SRCPV}" into the recipe, then bitbake libnsl2,
> I see:
>
> dpkg --info libnsl-staticdev_2.0.1+git0+d4b22e54b5-r0_amd64.deb
>
>  Package: libnsl-staticdev
>  Version: 2.0.1+git0+d4b22e54b5-r0
>  Architecture: amd64
>  OE: libnsl2
>  PackageArch: core2-64
>  Depends: libnsl-dev (=3D 2.0.1+git0+d4b22e54b5-r0)
>  Provides: libnsl2-staticdev (=3D 2.0.1+git0+d4b22e54b5)
>
> which looks right to me. Similarly, the ipk looks correct.
>
> cat kgdata/runtime/libnsl2-staticdev
>
> PN: libnsl2
> PV: 2.0.1+git
> PR: r0
> PKGV: 2.0.1+git@PRSERV_PV_AUTOINC@+d4b22e54b5
> PKGR: r0@EXTENDPRAUTO@
> LICENSE: LGPL-2.1-only
> RDEPENDS:libnsl2-staticdev: libnsl2-dev (=3D 2.0.1+git@PRSERV_PV_AUTOINC
> @+d4b22e54b5-r0@EXTENDPRAUTO@)
> RPROVIDES:libnsl2-staticdev:  libnsl2-staticdev
> (=3D2.0.1+git@PRSERV_PV_AUTOINC@+d4b22e54b5)
> SECTION:libnsl2-staticdev: devel
>
> which again, looks ok.
>
> So which release are you seeing the issue on as I suspect it isn't
> master?
>
> Cheers,
>
> Richard
>
>
>
>
>
>
>

--0000000000001088080626a07f1d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">That was my mistake.<br><br>I modified RDEPENDS without us=
ing expand=3DFalse before the do_package task, which caused the issue. The =
PKGV value is updated with AUTOINC only during the do_package task. Since w=
e modified RDEPENDS before do_package, it was already set with the expanded=
 PKGV, preventing it from updating with AUTOINC.<br><br>Is there another wa=
y to handle AUTOINC? It seems that if the variable is expanded before the d=
o_package task, it will not reflect the updated value during do_package.<di=
v><br></div><div>Thanks</div><div>Sreejith</div></div><br><div class=3D"gma=
il_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Oct 28, 2024 at 11:=
04=E2=80=AFAM Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfoun=
dation.org">richard.purdie@linuxfoundation.org</a>&gt; wrote:<br></div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex">On Thu, 2024-10-24 at 15:48 +=
0100, Sreejith Ravi via <a href=3D"http://lists.openembedded.org" rel=3D"no=
referrer" target=3D"_blank">lists.openembedded.org</a> wrote:<br>
&gt; Currently, RDEPENDS for -staticdev and -dev is set using EXTENDPKGV<br=
>
&gt; in meta/conf/bitbake.conf:<br>
&gt; ----------------------------------<br>
&gt; EXTENDPKGV ?=3D &quot;${EXTENDPKGEVER}${PKGV}-${PKGR}&quot;<br>
&gt; DEV_PKG_DEPENDENCY =3D &quot;${PN} (=3D ${EXTENDPKGV})&quot;<br>
&gt; RDEPENDS:${PN}-staticdev =3D &quot;${PN}-dev (=3D ${EXTENDPKGV})&quot;=
<br>
&gt; ----------------------------------<br>
&gt; <br>
&gt; During the do_package task, AUTOINC is replaced in PKGV<br>
&gt; (via package_setup_pkgv), which is used for creating the package name.=
<br>
&gt; However, Yocto sets RDEPENDS with PKGV during the recipe parsing stage=
,<br>
&gt; resulting in the RDEPENDS field in the IPK control data containing AUT=
OINC.<br>
&gt; <br>
&gt; As the IPK name is generated with the updated PKGV, but the version in=
<br>
&gt; RDEPENDS still uses AUTOINC, this mismatch leads to installation failu=
res.<br>
&gt; <br>
&gt; Example: libnsl<br>
&gt; install libnsl-staticdev throws the error,=C2=A0 nothing provides<br>
&gt; libnsl-dev =3D 1.2.0+gitAUTOINC+4a062cf418-r0<br>
&gt; ----------------------------------<br>
&gt; IPKs available:<br>
&gt; libnsl2_1.2.0+git0+4a062cf418-r0_armv7at2hf-neon.ipk<br>
&gt; libnsl-src_1.2.0+git0+4a062cf418-r0_armv7at2hf-neon.ipk<br>
&gt; libnsl-dbg_1.2.0+git0+4a062cf418-r0_armv7at2hf-neon.ipk<br>
&gt; libnsl-staticdev_1.2.0+git0+4a062cf418-r0_armv7at2hf-neon.ipk<br>
&gt; libnsl-dev_1.2.0+git0+4a062cf418-r0_armv7at2hf-neon.ipk<br>
&gt; <br>
&gt; control data: libnsl-staticdev<br>
&gt; Package: libnsl-staticdev<br>
&gt; Version: 1.2.0+git0+4a062cf418-r0<br>
&gt; ----<br>
&gt; ----<br>
&gt; Depends: libnsl-dev (=3D 1.2.0+gitAUTOINC+4a062cf418-r0)<br>
&gt; Provides: libnsl2-staticdev<br>
&gt; Source: <a href=3D"http://libnsl2_git.bb" rel=3D"noreferrer" target=3D=
"_blank">libnsl2_git.bb</a><br>
&gt; <br>
&gt; control data: libnsl-dev<br>
&gt; Package: libnsl-dev<br>
&gt; Version: 1.2.0+git0+4a062cf418-r0<br>
&gt; ----<br>
&gt; ----<br>
&gt; Depends: libnsl2 (=3D 1.2.0+gitAUTOINC+4a062cf418-r0), libtirpc-dev<br=
>
&gt; Recommends: gcc-runtime-dev, glibc-dev, libtirpc-dev<br>
&gt; Provides: libnsl2-dev<br>
&gt; Source: <a href=3D"http://libnsl2_git.bb" rel=3D"noreferrer" target=3D=
"_blank">libnsl2_git.bb</a><br>
&gt; ----------------------------------<br>
&gt; <br>
&gt; This patch fixes the RDEPENDS versions set using EXTENDPKGV in the -de=
v and<br>
&gt; -staticdev packages. It replaces AUTOINC before generating the package=
 control data.<br>
&gt; <br>
&gt; Updated control data:<br>
&gt; ----------------------------------<br>
&gt; Package: libnsl-dev<br>
&gt; Version: 1.2.0+git0+4a062cf418-r0<br>
&gt; ----<br>
&gt; ----<br>
&gt; Depends: libnsl2 (=3D 1.2.0+git0+4a062cf418-r0), libtirpc-dev<br>
&gt; Recommends: gcc-runtime-dev, glibc-dev, libtirpc-dev<br>
&gt; Provides: libnsl2-dev<br>
&gt; Source: <a href=3D"http://libnsl2_git.bb" rel=3D"noreferrer" target=3D=
"_blank">libnsl2_git.bb</a><br>
&gt; <br>
&gt; Package: libnsl-staticdev<br>
&gt; Version: 1.2.0+git0+4a062cf418-r0<br>
&gt; ----<br>
&gt; ----<br>
&gt; Depends: libnsl-dev (=3D 1.2.0+git0+4a062cf418-r0)<br>
&gt; Provides: libnsl2-staticdev<br>
&gt; Source: <a href=3D"http://libnsl2_git.bb" rel=3D"noreferrer" target=3D=
"_blank">libnsl2_git.bb</a><br>
&gt; ----------------------------------<br>
&gt; <br>
&gt; Signed-off-by: Sreejith Ravi &lt;<a href=3D"mailto:sreejith.ravi087@gm=
ail.com" target=3D"_blank">sreejith.ravi087@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt; =C2=A0meta/classes-global/package.bbclass | 9 +++++++++<br>
&gt; =C2=A01 file changed, 9 insertions(+)<br>
&gt; <br>
&gt; diff --git a/meta/classes-global/package.bbclass b/meta/classes-global=
/package.bbclass<br>
&gt; index 6cd8c0140f..066a7ff835 100644<br>
&gt; --- a/meta/classes-global/package.bbclass<br>
&gt; +++ b/meta/classes-global/package.bbclass<br>
&gt; @@ -325,6 +325,15 @@ python package_setup_pkgv() {<br>
&gt; =C2=A0=C2=A0=C2=A0=C2=A0 # Adjust pkgv as necessary...<br>
&gt; =C2=A0=C2=A0=C2=A0=C2=A0 if &#39;AUTOINC&#39; in pkgv:<br>
&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 d.setVar(&quot;PKGV&q=
uot;, pkgv.replace(&quot;AUTOINC&quot;, &quot;${PRSERV_PV_AUTOINC}&quot;))<=
br>
&gt; +<br>
&gt; +=C2=A0=C2=A0=C2=A0 # Adjust dependencies that are statically set with=
 EXTENDPKGV<br>
&gt; +=C2=A0=C2=A0=C2=A0 vars =3D [&quot;RDEPENDS&quot;,&quot;RPROVIDES&quo=
t;,&quot;RRECOMMENDS&quot;,&quot;RSUGGESTS&quot;,&quot;RREPLACES&quot;,&quo=
t;RCONFLICTS&quot;]<br>
&gt; +=C2=A0=C2=A0=C2=A0 packages =3D d.getVar(&#39;PACKAGES&#39;).split()<=
br>
&gt; +=C2=A0=C2=A0=C2=A0 for var in vars:<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for pkg in packages:<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 va=
l =3D d.getVar(&quot;%s_%s&quot;%(var,pkg))<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if=
 val and &#39;AUTOINC&#39; in val:<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 d.setVar(&quot;%s_%s&quot;%(var,pkg), val.replace(&qu=
ot;AUTOINC&quot;, &quot;${PRSERV_PV_AUTOINC}&quot;))<br>
&gt; =C2=A0}<br>
&gt; <br>
<br>
Something isn&#39;t adding up here. With master, if I set:<br>
<br>
DISABLE_STATIC:pn-libnsl2 =3D &quot;&quot;<br>
<br>
and put PV =3D &quot;2.0.1+git${SRCPV}&quot; into the recipe, then bitbake =
libnsl2,<br>
I see:<br>
<br>
dpkg --info libnsl-staticdev_2.0.1+git0+d4b22e54b5-r0_amd64.deb <br>
<br>
=C2=A0Package: libnsl-staticdev<br>
=C2=A0Version: 2.0.1+git0+d4b22e54b5-r0<br>
=C2=A0Architecture: amd64<br>
=C2=A0OE: libnsl2<br>
=C2=A0PackageArch: core2-64<br>
=C2=A0Depends: libnsl-dev (=3D 2.0.1+git0+d4b22e54b5-r0)<br>
=C2=A0Provides: libnsl2-staticdev (=3D 2.0.1+git0+d4b22e54b5)<br>
<br>
which looks right to me. Similarly, the ipk looks correct.<br>
<br>
cat kgdata/runtime/libnsl2-staticdev<br>
<br>
PN: libnsl2<br>
PV: 2.0.1+git<br>
PR: r0<br>
PKGV: 2.0.1+git@PRSERV_PV_AUTOINC@+d4b22e54b5<br>
PKGR: r0@EXTENDPRAUTO@<br>
LICENSE: LGPL-2.1-only<br>
RDEPENDS:libnsl2-staticdev: libnsl2-dev (=3D 2.0.1+git@PRSERV_PV_AUTOINC@+d=
4b22e54b5-r0@EXTENDPRAUTO@)<br>
RPROVIDES:libnsl2-staticdev:=C2=A0 libnsl2-staticdev (=3D2.0.1+git@PRSERV_P=
V_AUTOINC@+d4b22e54b5)<br>
SECTION:libnsl2-staticdev: devel<br>
<br>
which again, looks ok.<br>
<br>
So which release are you seeing the issue on as I suspect it isn&#39;t<br>
master?<br>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
<br>
<br>
<br>
<br>
<br>
</blockquote></div>

--0000000000001088080626a07f1d--

