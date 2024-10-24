Return-Path: <sreejith.ravi087@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83EB2CE8E6F
	for <webhook@archiver.kernel.org>; Thu, 24 Oct 2024 12:43:27 +0000 (UTC)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.web10.13674.1729773797717795146
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Oct 2024 05:43:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CXakq0zK;
 spf=pass (domain: gmail.com, ip: 209.85.215.180, mailfrom: sreejith.ravi087@gmail.com)
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-7c3d8105646so65321a12.2
        for <openembedded-core@lists.openembedded.org>; Thu, 24 Oct 2024 05:43:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729773797; x=1730378597; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hKPLU5H6Pk1XP8RoOM7Hdw7BSrfYCQaerzla7HqbqTY=;
        b=CXakq0zKh23A2JPq4oYADD+7Kzc+JTvL7y9ObBS04/4QG5wRYrNMaNuuP5NImLzjy5
         SR3P/x79Yz0FSN3HdA7r9moDDWa9k6D2gPLufG3AxTO3gOzLVvq6Z5gPxsHBMx9GWYD0
         O1Vqaa20/JZk5la8AK9mQ5pV06oRv5/KiXiB18v93Qcm8Sqkurn4SOhK81BnwS9v/Cp5
         Xxyj+gmT1paKWaHhhGEO/aRvXLH4ZXpMmUG8wtmcXywusT9S+wZ5nwF+hUM1cONN0mCR
         ZugFliLkazmVfFWSbjQ7QFlOJpTWLm1pJ3RVIHkQcXFVbuUckMzZPnaP3z3TISH14n9p
         EPkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729773797; x=1730378597;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hKPLU5H6Pk1XP8RoOM7Hdw7BSrfYCQaerzla7HqbqTY=;
        b=iuwKwred0uZHeSfBf0rc/OjrvhY5SXQGpXZfe+ZU1rbQSxrN+p8IOT/+OGcY3E/lPX
         EBbhIc6NENqxQqNFNxBLs9HqsqPZOa6L/LXUw0jNwopKkAw7Yyp/ov2x6mpOQxTePM1I
         5d8eWkk9j3VgD21fNE6KGoTSxtd4J6iO80RG/oT3MJWP2P06fEBwR3RaKofeontv+Pvb
         7QvpVSrT2aYB05bwZiaRFAuZVOC/3mgX+TqqCxVYfnT/Nh1P/6gLgdKrrwrPhMTYYfdJ
         lKrEjONuVAt5ZykpoFAZVRAqbwbGbFOr0r381BD1jGkEu6nkdJJ/F65MPBatfhXxOqng
         JPMg==
X-Gm-Message-State: AOJu0Yx4wrX3NQMdQ1UzViSbwygd/nsS6qQvc+S2wo7NkEraXNVMhP4u
	3cxTB2knvq8oBfZr4HILoRAucl8KJ7MPgJtjDB3v+GhUCnXNSiHuA9DW6ww1ZbTPsHl+y2kUnid
	oVgqN6M9r4tKCDZYWL0M0pkycZzI=
X-Google-Smtp-Source: AGHT+IHDJ3xu+mm74cpsIiwwDcP0dPxvFcADvgD8cKjPwyZausW3gmeNrwEkl1/mtk+bIq6kiP1fkbtyRMc9AzuLYZM=
X-Received: by 2002:a05:6a21:6d9f:b0:1cf:308f:f87b with SMTP id
 adf61e73a8af0-1d978b0064amr4375439637.4.1729773796533; Thu, 24 Oct 2024
 05:43:16 -0700 (PDT)
MIME-Version: 1.0
References: <20241024103906.41742-1-sreejith.ravi087@gmail.com> <4cabf8db3630df2db2474c476745bf7ecc893f5b.camel@linuxfoundation.org>
In-Reply-To: <4cabf8db3630df2db2474c476745bf7ecc893f5b.camel@linuxfoundation.org>
From: Sreejith Ravi <sreejith.ravi087@gmail.com>
Date: Thu, 24 Oct 2024 13:43:04 +0100
Message-ID: <CAFt4JuFb1kBEFCewG4Oh2efyniEm5v014=My=y3xifCLv1b=Tw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] packagedata.py : Fix RDEPENDS Version issue
 with AUTOINC
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000af31f60625385896"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Oct 2024 12:43:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206293

--000000000000af31f60625385896
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

The issue seems to be that RDEPENDS is set with the value from PKGV (from
configuration) at the recipe parsing stage. In do_package, it is only
replacing AUTOINC in the PKGV variable. This is why the changes are not
reflected in the RDEPENDS field in the package data. I will try to make it
a more generic change instead of being specific to RDEPENDS.

Cheers,
Sreejith

On Thu, Oct 24, 2024 at 11:45=E2=80=AFAM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Thu, 2024-10-24 at 11:39 +0100, Sreejith Ravi via
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
> >  meta/lib/oe/packagedata.py | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/meta/lib/oe/packagedata.py b/meta/lib/oe/packagedata.py
> > index 2d1d6ddeb7..332681d3ec 100644
> > --- a/meta/lib/oe/packagedata.py
> > +++ b/meta/lib/oe/packagedata.py
> > @@ -171,8 +171,11 @@ def runtime_mapping_rename(varname, pkg, d):
> >      #bb.note("%s before: %s" % (varname, d.getVar(varname)))
> >
> >      new_depends =3D {}
> > +    bb.build.exec_func("package_get_auto_pr", d)
> >      deps =3D bb.utils.explode_dep_versions2(d.getVar(varname) or "")
> >      for depend, depversions in deps.items():
> > +        if varname =3D=3D "RDEPENDS":
> > +            deps[depend] =3D [ver.replace("AUTOINC",
> "%s"%d.getVar("PRSERV_PV_AUTOINC")) for ver in deps[depend]]
> >          new_depend =3D get_package_mapping(depend, pkg, d, depversions=
)
> >          if depend !=3D new_depend:
> >              bb.note("package name mapping done: %s -> %s" % (depend,
> new_depend))
> >
>
>
> This is a good start at debugging the issue which is clearly there but
> it doesn't feel like the right fix to me. The question is why the code
> in package.bbclass isn't replacing the values and writing them into the
> data which forms packagedatav. We really need to fix this at the source
> of the issue rather than working around it with special case handling
> of RDEPENDS.
>
> Do you have any idea why the code in do_package doesn't catch these?
>
> Cheers,
>
> Richard
>
>

--000000000000af31f60625385896
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">The issue seems to be that RDEPENDS is set with the value =
from PKGV (from configuration) at the recipe parsing stage. In do_package, =
it is only replacing AUTOINC in the PKGV variable. This is why the changes =
are not reflected in the RDEPENDS field in the package data. I will try to =
make it a more generic change instead of being specific to RDEPENDS. <div><=
br></div><div>Cheers,</div><div>Sreejith</div></div><br><div class=3D"gmail=
_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Oct 24, 2024 at 11:45=
=E2=80=AFAM Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfounda=
tion.org">richard.purdie@linuxfoundation.org</a>&gt; wrote:<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex">On Thu, 2024-10-24 at 11:39 +01=
00, Sreejith Ravi via <a href=3D"http://lists.openembedded.org" rel=3D"nore=
ferrer" target=3D"_blank">lists.openembedded.org</a> wrote:<br>
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
&gt; =C2=A0meta/lib/oe/packagedata.py | 3 +++<br>
&gt; =C2=A01 file changed, 3 insertions(+)<br>
&gt; <br>
&gt; diff --git a/meta/lib/oe/packagedata.py b/meta/lib/oe/packagedata.py<b=
r>
&gt; index 2d1d6ddeb7..332681d3ec 100644<br>
&gt; --- a/meta/lib/oe/packagedata.py<br>
&gt; +++ b/meta/lib/oe/packagedata.py<br>
&gt; @@ -171,8 +171,11 @@ def runtime_mapping_rename(varname, pkg, d):<br>
&gt; =C2=A0=C2=A0=C2=A0=C2=A0 #bb.note(&quot;%s before: %s&quot; % (varname=
, d.getVar(varname)))<br>
&gt; =C2=A0<br>
&gt; =C2=A0=C2=A0=C2=A0=C2=A0 new_depends =3D {}<br>
&gt; +=C2=A0=C2=A0=C2=A0 bb.build.exec_func(&quot;package_get_auto_pr&quot;=
, d)<br>
&gt; =C2=A0=C2=A0=C2=A0=C2=A0 deps =3D bb.utils.explode_dep_versions2(d.get=
Var(varname) or &quot;&quot;)<br>
&gt; =C2=A0=C2=A0=C2=A0=C2=A0 for depend, depversions in deps.items():<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if varname =3D=3D &quot;RD=
EPENDS&quot;:<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 de=
ps[depend] =3D [ver.replace(&quot;AUTOINC&quot;, &quot;%s&quot;%d.getVar(&q=
uot;PRSERV_PV_AUTOINC&quot;)) for ver in deps[depend]]<br>
&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 new_depend =3D get_pa=
ckage_mapping(depend, pkg, d, depversions)<br>
&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if depend !=3D new_de=
pend:<br>
&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 bb.note(&quot;package name mapping done: %s -&gt; %s&quot; % (depend, n=
ew_depend))<br>
&gt; <br>
<br>
<br>
This is a good start at debugging the issue which is clearly there but<br>
it doesn&#39;t feel like the right fix to me. The question is why the code<=
br>
in package.bbclass isn&#39;t replacing the values and writing them into the=
<br>
data which forms packagedatav. We really need to fix this at the source<br>
of the issue rather than working around it with special case handling<br>
of RDEPENDS.<br>
<br>
Do you have any idea why the code in do_package doesn&#39;t catch these?<br=
>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
</blockquote></div>

--000000000000af31f60625385896--

