Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web11.9442.1622043806416369228
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 May 2021 08:43:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=s9uSwBVP;
 spf=pass (domain: gmail.com, ip: 209.85.218.48, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f48.google.com with SMTP id b9so3144079ejc.13
        for <openembedded-core@lists.openembedded.org>; Wed, 26 May 2021 08:43:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XZ9y0PTx+IhsiIaCizDmUdq4YDKK7lijM8wLoLaYpaw=;
        b=s9uSwBVPXIopByhCZG9O49XdcfvM8gcD1wq4LOXSrhr3VkSTfK2cuNugxe/gg9guUc
         1toiLDmn/oTGRKlHCQnSeFWqjZpZL0h65Ok8/b1OQyQljr19O1P8nepz+qHI7S7z2JJm
         scbHH0UYinh7BUnzJ4haPg52XiMMEdbOsIeeFFXc7XytW8XnoJ17OMU27Vy6a9G/2QCR
         Nt9HRS8JUFj56fyPPGBLyBLC1JzAJ0GVLyVCEIFCCqYoiA/82TXReK51RVf5uvxXSY6L
         3AdTkvFszXMNnAyy8LlN94Q4VEWxtpkj0kuGOtTcEluHhN5/zy2mKj6SwQhVGSXXaTUL
         A9BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XZ9y0PTx+IhsiIaCizDmUdq4YDKK7lijM8wLoLaYpaw=;
        b=GAksRNvqGqNosJjj8NihWfdAnd6Y90Foup9e+vGw/wE39u8oPymkvm+SjNGBtVp31U
         ZKEOX2BvrZl/ZkaU4pAiKJQZW9mgBO0n1k6SXqeOHV4HEUBoK++YPlQ6TDl3akZPn84w
         vR8Aa+auaevDOsDAfbBmA942Egvg2wlxhIBGr+xbn8SZFC49uWBfrYl3QPYzdwp9D6Ls
         9paASBIeig9XaDtBYJmWQkao86/r0JmsQY66rmu0HqSfaEMwVZayNnNdJ70a7fMWmpGL
         CI0LvKNZ9sb4wJkQdQJAMiopVTS7sTSVmGDv4xXSIKgQEj9dLuXWUFdSmSQFpc7Xyb19
         Y/dw==
X-Gm-Message-State: AOAM531+qGM9FhjZUOMCTLmRMIsd1QTLjqzFEPVrK5hYL6wfCxSoqi82
	2kbhUAT6HkA70/ps+8VULMRHhT4EaCv0aBLpiho=
X-Google-Smtp-Source: ABdhPJzK5xMr7Dn/7xZvfuuqktGv7FNTDmvh8JBoc2qX3zQd2ePmN7UVby2yy0YK1ZiZG3ngwx0JtNfIIl5SEBHTTXU=
X-Received: by 2002:a17:907:98c9:: with SMTP id kd9mr18519082ejc.54.1622043804753;
 Wed, 26 May 2021 08:43:24 -0700 (PDT)
MIME-Version: 1.0
References: <20210524152106.4160032-1-raj.khem@gmail.com> <CAAnfSTvgOiJ5hvG41fTqW3XD73bBB5nJOG7FaySPzspcGOj1bg@mail.gmail.com>
 <CAMKF1soOUcqa6huRjbn5QgP0hkBaFafS2PkgWHbVazW4R0NRnQ@mail.gmail.com>
In-Reply-To: <CAMKF1soOUcqa6huRjbn5QgP0hkBaFafS2PkgWHbVazW4R0NRnQ@mail.gmail.com>
From: "Martin Jansa" <Martin.Jansa@gmail.com>
Date: Wed, 26 May 2021 17:43:13 +0200
Message-ID: <CA+chaQcHqvid8LUX+H4tWi=wgOKHnvNY0rtEGZ7a3KqvDFAuYQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] gcc: Update to latest on release/gcc-11 branch
To: Khem Raj <raj.khem@gmail.com>
Cc: Ross Burton <ross@burtonini.com>, OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000cae46305c33d80e9"

--000000000000cae46305c33d80e9
Content-Type: text/plain; charset="UTF-8"

I'm seeing different error with gcc-sanitizers and this new revision:

work-shared/gcc-11.1.0-r0/gcc-11.1.0/libsanitizer/lsan/lsan_common_linux.cpp:164:25:
error: invalid conversion from 'void (*)(void*)' to 'void* (*)(void*)'
[-fpermissive]

will double-check if it was introduced by this upgrade or something else in
oe-core master update today and also if there is a fix in even newer gcc
already.

On Wed, May 26, 2021 at 4:19 PM Khem Raj <raj.khem@gmail.com> wrote:

> On Wed, May 26, 2021 at 3:55 AM Ross Burton <ross@burtonini.com> wrote:
> >
> > I think this breaks non-Linux builds.  All of our Zephyr targets now
> fail:
> >
> > ERROR: gcc-runtime-11.1.0-r0 do_package:
> > QA Issue: gcc-runtime: Files/directories were installed but not
> > shipped in any package:
> > /usr/lib/-gdb.py
>
> this should have had some prefix. do you have this script around if so
> then share
>
> >
> > Ross
> >
> > Ross
> >
> > On Mon, 24 May 2021 at 16:21, Khem Raj <raj.khem@gmail.com> wrote:
> > >
> > > There has been 150+ fixes made available after gcc 11.1.0
> > > was released, details of these fixes is here
> > >
> > >
> https://gcc.gnu.org/git/?p=gcc.git;a=commitdiff_plain;hp=releases/gcc-11.1.0;h=9ee61d2b51d
> > >
> > > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > > ---
> > > v2: Use download mirror to fetch the patch
> > >
> > >  meta/recipes-devtools/gcc/gcc-11.1.inc | 8 ++++++--
> > >  1 file changed, 6 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/meta/recipes-devtools/gcc/gcc-11.1.inc
> b/meta/recipes-devtools/gcc/gcc-11.1.inc
> > > index 713002266a..aa7ac9be59 100644
> > > --- a/meta/recipes-devtools/gcc/gcc-11.1.inc
> > > +++ b/meta/recipes-devtools/gcc/gcc-11.1.inc
> > > @@ -6,7 +6,7 @@ PV = "11.1.0"
> > >
> > >  # BINV should be incremented to a revision after a minor gcc release
> > >
> > > -BINV = "11.1.0"
> > > +BINV = "11.1.1"
> > >
> > >  FILESEXTRAPATHS =. "${FILE_DIRNAME}/gcc:${FILE_DIRNAME}/gcc/backport:"
> > >
> > > @@ -25,7 +25,10 @@ LIC_FILES_CHKSUM = "\
> > >
> > >  #RELEASE ?= "5b2ac9b40c325e9209c0bd55955db84aad4a0cc5"
> > >  #BASEURI ?= "
> https://github.com/gcc-mirror/gcc/archive/${RELEASE}.zip;downloadfilename=gcc-${PV}-${RELEASE}.zip
> "
> > > -BASEURI ?= "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.xz"
> > > +
> > > +BASEURI ?= "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.xz \
> > > +
> http://downloads.yoctoproject.org/mirror/sources/gcc-11.1.0-9ee61d2b51df012c659359873637cc2162ecccf3.patch;apply=yes;name=backports
> \
> > > +           "
> > >  SRC_URI = "\
> > >             ${BASEURI} \
> > >             file://0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch \
> > > @@ -67,6 +70,7 @@ SRC_URI = "\
> > >
>  file://0037-libatomic-Do-not-enforce-march-on-aarch64.patch \
> > >  "
> > >  SRC_URI[sha256sum] =
> "4c4a6fb8a8396059241c2e674b85b351c26a5d678274007f076957afa1cc9ddf"
> > > +SRC_URI[backports.sha256sum] =
> "69274bebd6c069a13443d4af61070e854740a639ec4d66eedf3e80070363587b"
> > >
> > >  S = "${TMPDIR}/work-shared/gcc-${PV}-${PR}/gcc-${PV}"
> > >
> > > --
> > > 2.31.1
> > >
> > >
> > >
> > >
>
> 
>
>

--000000000000cae46305c33d80e9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I&#39;m seeing different error with gcc-sanitizers an=
d this new revision:</div><div><br></div>work-shared/gcc-11.1.0-r0/gcc-11.1=
.0/libsanitizer/lsan/lsan_common_linux.cpp:164:25: error: invalid conversio=
n from &#39;void (*)(void*)&#39; to &#39;void* (*)(void*)&#39; [-fpermissiv=
e]<br><div><br></div><div>will double-check if it was introduced by this up=
grade or something else in oe-core master update today and also if there is=
 a fix in even newer gcc already.</div></div><br><div class=3D"gmail_quote"=
><div dir=3D"ltr" class=3D"gmail_attr">On Wed, May 26, 2021 at 4:19 PM Khem=
 Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; w=
rote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Wed, Ma=
y 26, 2021 at 3:55 AM Ross Burton &lt;<a href=3D"mailto:ross@burtonini.com"=
 target=3D"_blank">ross@burtonini.com</a>&gt; wrote:<br>
&gt;<br>
&gt; I think this breaks non-Linux builds.=C2=A0 All of our Zephyr targets=
 now fail:<br>
&gt;<br>
&gt; ERROR: gcc-runtime-11.1.0-r0 do_package:<br>
&gt; QA Issue: gcc-runtime: Files/directories were installed but not<br>
&gt; shipped in any package:<br>
&gt; /usr/lib/-gdb.py<br>
<br>
this should have had some prefix. do you have this script around if so<br>
then share<br>
<br>
&gt;<br>
&gt; Ross<br>
&gt;<br>
&gt; Ross<br>
&gt;<br>
&gt; On Mon, 24 May 2021 at 16:21, Khem Raj &lt;<a href=3D"mailto:raj.khem=
@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt; There has been 150+ fixes made available after gcc 11.1.0<br>
&gt; &gt; was released, details of these fixes is here<br>
&gt; &gt;<br>
&gt; &gt; <a href=3D"https://gcc.gnu.org/git/?p=3Dgcc.git;a=3Dcommitdiff_p=
lain;hp=3Dreleases/gcc-11.1.0;h=3D9ee61d2b51d" rel=3D"noreferrer" target=3D=
"_blank">https://gcc.gnu.org/git/?p=3Dgcc.git;a=3Dcommitdiff_plain;hp=3Drel=
eases/gcc-11.1.0;h=3D9ee61d2b51d</a><br>
&gt; &gt;<br>
&gt; &gt; Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com=
" target=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt; &gt; ---<br>
&gt; &gt; v2: Use download mirror to fetch the patch<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 meta/recipes-devtools/gcc/gcc-11.1.inc | 8 ++++++--<br>
&gt; &gt;=C2=A0 1 file changed, 6 insertions(+), 2 deletions(-)<br>
&gt; &gt;<br>
&gt; &gt; diff --git a/meta/recipes-devtools/gcc/gcc-11.1.inc b/meta/recip=
es-devtools/gcc/gcc-11.1.inc<br>
&gt; &gt; index 713002266a..aa7ac9be59 100644<br>
&gt; &gt; --- a/meta/recipes-devtools/gcc/gcc-11.1.inc<br>
&gt; &gt; +++ b/meta/recipes-devtools/gcc/gcc-11.1.inc<br>
&gt; &gt; @@ -6,7 +6,7 @@ PV =3D &quot;11.1.0&quot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 # BINV should be incremented to a revision after a minor g=
cc release<br>
&gt; &gt;<br>
&gt; &gt; -BINV =3D &quot;11.1.0&quot;<br>
&gt; &gt; +BINV =3D &quot;11.1.1&quot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 FILESEXTRAPATHS =3D. &quot;${FILE_DIRNAME}/gcc:${FILE_DIRN=
AME}/gcc/backport:&quot;<br>
&gt; &gt;<br>
&gt; &gt; @@ -25,7 +25,10 @@ LIC_FILES_CHKSUM =3D &quot;\<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 #RELEASE ?=3D &quot;5b2ac9b40c325e9209c0bd55955db84aad4a0c=
c5&quot;<br>
&gt; &gt;=C2=A0 #BASEURI ?=3D &quot;<a href=3D"https://github.com/gcc-mirr=
or/gcc/archive/$%7BRELEASE%7D.zip;downloadfilename=3Dgcc-$%7BPV%7D-$%7BRELE=
ASE%7D.zip" rel=3D"noreferrer" target=3D"_blank">https://github.com/gcc-mir=
ror/gcc/archive/${RELEASE}.zip;downloadfilename=3Dgcc-${PV}-${RELEASE}.zip<=
/a>&quot;<br>
&gt; &gt; -BASEURI ?=3D &quot;${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.xz=
&quot;<br>
&gt; &gt; +<br>
&gt; &gt; +BASEURI ?=3D &quot;${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.xz=
 \<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://dow=
nloads.yoctoproject.org/mirror/sources/gcc-11.1.0-9ee61d2b51df012c659359873=
637cc2162ecccf3.patch;apply=3Dyes;name=3Dbackports" rel=3D"noreferrer" targ=
et=3D"_blank">http://downloads.yoctoproject.org/mirror/sources/gcc-11.1.0-9=
ee61d2b51df012c659359873637cc2162ecccf3.patch;apply=3Dyes;name=3Dbackports<=
/a> \<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
&gt; &gt;=C2=A0 SRC_URI =3D &quot;\<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${BASEURI} \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-gcc-4=
.3.1-ARCH_FLAGS_FOR_TARGET.patch \<br>
&gt; &gt; @@ -67,6 +70,7 @@ SRC_URI =3D &quot;\<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0037-libat=
omic-Do-not-enforce-march-on-aarch64.patch \<br>
&gt; &gt;=C2=A0 &quot;<br>
&gt; &gt;=C2=A0 SRC_URI[sha256sum] =3D &quot;4c4a6fb8a8396059241c2e674b85b=
351c26a5d678274007f076957afa1cc9ddf&quot;<br>
&gt; &gt; +SRC_URI[backports.sha256sum] =3D &quot;69274bebd6c069a13443d4af=
61070e854740a639ec4d66eedf3e80070363587b&quot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 S =3D &quot;${TMPDIR}/work-shared/gcc-${PV}-${PR}/gcc-${PV=
}&quot;<br>
&gt; &gt;<br>
&gt; &gt; --<br>
&gt; &gt; 2.31.1<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; <br>
&gt; &gt;<br>
<br>
<br>
<br>
</blockquote></div>

--000000000000cae46305c33d80e9--
