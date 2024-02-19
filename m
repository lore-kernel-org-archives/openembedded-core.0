Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4D40C48260
	for <webhook@archiver.kernel.org>; Mon, 19 Feb 2024 04:19:37 +0000 (UTC)
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
 by mx.groups.io with SMTP id smtpd.web11.34717.1708316368789884744
 for <openembedded-core@lists.openembedded.org>;
 Sun, 18 Feb 2024 20:19:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ihT8gUpq;
 spf=pass (domain: gmail.com, ip: 209.85.160.49, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-214def5da12so1706733fac.2
        for <openembedded-core@lists.openembedded.org>; Sun, 18 Feb 2024 20:19:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708316368; x=1708921168; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=LiRdx25sx5n3m4LNbGe5gxy0Rb2i0rBAO5csbGkz5eg=;
        b=ihT8gUpqeBuK5q5TfD6G65x+ipTn//Z0v+9nGxaeneO97wr56P6CBPDQGADodxr5qk
         pPEF5sckoNtYat/nEk+vGLEuNpshaVmsA6klo1XLFL0FbBgcccMGzpcs5zi0FuJ/ic5I
         90cnkSCSZ7bV+x6UbbsR5zv9oiUxuzb7BW0Yt+sdzcr6OEApkEI2yZoySoKIIs4PBrU5
         eg0XuQZDsks0S2LUHTQLNluf0+XOhwQii8pmVQYslwkJzrIscFvXA/lylcZpK1kmPNOF
         al0E2iYwT1RuYUEEG7Pg4Rk/mrKHXuiOwpI6x8Y29faLCqyYM+fNic2zEhnVOhwnQwvw
         wLOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708316368; x=1708921168;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LiRdx25sx5n3m4LNbGe5gxy0Rb2i0rBAO5csbGkz5eg=;
        b=TAJiQAjJSnx5Ya285iZvs1+HEX2NH3FZIvvcwjT5P+fwTNOtRQiSVprb3TVGsweRzP
         ABA6CkybZKUdi/WDPayUM2Nkbog0oRHsiV1evhzt0NyDQ6MGR+rgfOfcSiWokBxneiCA
         mFNUeqZ0kFz1K/t/o2lH6AgnBaFSI0eT2/oN7wWVFOtU4310xdNmMh/LUG7IQTKmJ2I9
         ZVnvxLWFmgGRPySZwS8FE5s7smz7yx0ZG7B6R6Lth40oItYRn2SYa5NlThkQE8Ba02iw
         bHHMlUa4qcxgJ1DCzaoun6HWTJwxD2zqaGp1NlouGk8+vjGOmzjZvPcs3ogc64bWVV/I
         CQPg==
X-Gm-Message-State: AOJu0YwqqJM3j9XcBZ+NrlAB5TYwxPbp/o2EjFIAee0GTT/ne8GIG45K
	+UhMGXqW6Lpv12RBR+IK07kaxtQgrBXIoPuEoQNeuKw7G3Uf5HMF/F99zVDTj5nPuEX4/EN8Lu8
	OpONv+A7uOeVHtB2ugGPejzja+Gw=
X-Google-Smtp-Source: AGHT+IFqYSIC9zBZEJMUqyNUxStd/WnuMiGH67FHJ2vqhoyqYhD8CtLFx+gTSX6hng5LiZqZ/lwstcRENnu0YTrmpLE=
X-Received: by 2002:a05:6870:93c3:b0:21e:d763:f5f1 with SMTP id
 c3-20020a05687093c300b0021ed763f5f1mr2107433oal.42.1708316367750; Sun, 18 Feb
 2024 20:19:27 -0800 (PST)
MIME-Version: 1.0
References: <20240216114034.109257-1-anuj.mittal@intel.com>
 <20240216114034.109257-7-anuj.mittal@intel.com> <33de869a-1a09-41c9-be4b-6de1d0c29417@gmail.com>
 <CAMKF1sqQAXDDbrQA8QOvYvgrkxEjOp=MiJBeWdz8=wo6BpyFeg@mail.gmail.com> <75f9de29128444bd08ff36628be4c0f2e364a417.camel@intel.com>
In-Reply-To: <75f9de29128444bd08ff36628be4c0f2e364a417.camel@intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 18 Feb 2024 20:19:16 -0800
Message-ID: <CAMKF1sr5etVYGje4EkEn+vZdoUQw7x-wC3RKy3T3s1PMogopRQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 7/9] swig: upgrade 4.1.1 -> 4.2.0
To: "Mittal, Anuj" <anuj.mittal@intel.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000043899a0611b466d7"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Feb 2024 04:19:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195863

--00000000000043899a0611b466d7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 18, 2024 at 6:51=E2=80=AFPM Mittal, Anuj <anuj.mittal@intel.com=
> wrote:

> On Sat, 2024-02-17 at 19:01 -0800, Khem Raj wrote:
> > here is one failure due to this upgrade -
> > https://errors.yoctoproject.org/Errors/Details/753587/
>
> Thanks for checking. This project and its dependencies that are giving
> error aren't maintained any more.
>
>
> https://github.com/bambocher/pocketsphinx-python/commit/73b7e6da54f57b82d=
50ab278ad61f2cfa9b4dc4b
>
>
> https://github.com/cmusphinx/sphinxbase/tree/a74a11df3a021e9a26b0d20c3de9=
99b8eb0afcef
>
> The recipe should be deleted or replaced by bindings from:
>
> https://github.com/cmusphinx/pocketsphinx


I am fine with either. If deletion is easy so be it
Please send a patch

<https://github.com/cmusphinx/pocketsphinx>
>
> Thanks,
>
> Anuj
>
> >
> > On Fri, Feb 16, 2024 at 6:59=E2=80=AFPM Khem Raj <raj.khem@gmail.com> w=
rote:
> > >
> > > this can be tricky for many apps depend on it subtly might fail.
> > > Perhaps
> > > doing an extended world build with this might be good.
> > >
> > > On 2/16/24 3:40 AM, Anuj Mittal wrote:
> > > > Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
> > > > ---
> > > >   ...self-exe-for-swig-swiglib-on-non-Win32-plat.patch | 10
> > > > ++++++----
> > > >   ...configure-use-pkg-config-for-pcre-detection.patch |  6 +++--
> > > > -
> > > >   meta/recipes-devtools/swig/swig/determinism.patch    | 12
> > > > +++++++++++-
> > > >   .../swig/{swig_4.1.1.bb =3D> swig_4.2.0.bb}            |  2 +-
> > > >   4 files changed, 21 insertions(+), 9 deletions(-)
> > > >   rename meta/recipes-devtools/swig/{swig_4.1.1.bb =3D>
> > > > swig_4.2.0.bb} (72%)
> > > >
> > > > diff --git a/meta/recipes-devtools/swig/swig/0001-Use-proc-self-
> > > > exe-for-swig-swiglib-on-non-Win32-plat.patch b/meta/recipes-
> > > > devtools/swig/swig/0001-Use-proc-self-exe-for-swig-swiglib-on-
> > > > non-Win32-plat.patch
> > > > index f27f80ea184..9c6ae389be2 100644
> > > > --- a/meta/recipes-devtools/swig/swig/0001-Use-proc-self-exe-for-
> > > > swig-swiglib-on-non-Win32-plat.patch
> > > > +++ b/meta/recipes-devtools/swig/swig/0001-Use-proc-self-exe-for-
> > > > swig-swiglib-on-non-Win32-plat.patch
> > > > @@ -1,4 +1,4 @@
> > > > -From a4a0440a644c6c5e5da096efe3cf05ba309a284f Mon Sep 17
> > > > 00:00:00 2001
> > > > +From ab0ab5e685bd9077c44fdca5c1a27b0f477444d7 Mon Sep 17
> > > > 00:00:00 2001
> > > >   From: "NODA, Kai" <nodakai@gmail.com>
> > > >   Date: Sun, 22 Apr 2012 17:01:02 +0900
> > > >   Subject: [PATCH] Use /proc/self/exe for "swig -swiglib" on non-
> > > > Win32
> > > > @@ -10,9 +10,11 @@ Upstream-Status: Submitted
> > > >   http://sourceforge.net/mailarchive/message.php?msg_id=3D29179733
> > > >
> > > >   ---
> > > > - Source/Modules/main.cxx |   24 ++++++++++++++++++++++--
> > > > + Source/Modules/main.cxx | 24 ++++++++++++++++++++++--
> > > >    1 file changed, 22 insertions(+), 2 deletions(-)
> > > >
> > > > +diff --git a/Source/Modules/main.cxx b/Source/Modules/main.cxx
> > > > +index 8a44921..8250dee 100644
> > > >   --- a/Source/Modules/main.cxx
> > > >   +++ b/Source/Modules/main.cxx
> > > >   @@ -25,6 +25,11 @@
> > > > @@ -27,7 +29,7 @@
> > > > http://sourceforge.net/mailarchive/message.php?msg_id=3D29179733
> > > >
> > > >    // Global variables
> > > >
> > > > -@@ -934,9 +939,9 @@ int SWIG_main(int argc, char *argv[], co
> > > > +@@ -886,9 +891,9 @@ int SWIG_main(int argc, char *argv[], const
> > > > TargetLanguageModule *tlm) {
> > > >
> > > >      // Check for SWIG_LIB environment variable
> > > >      if ((c =3D getenv("SWIG_LIB")) =3D=3D (char *) 0) {
> > > > @@ -38,7 +40,7 @@
> > > > http://sourceforge.net/mailarchive/message.php?msg_id=3D29179733
> > > >        if (!(GetModuleFileName(0, buf, MAX_PATH) =3D=3D 0 || (p =3D
> > > > strrchr(buf, '\\')) =3D=3D 0)) {
> > > >          *(p + 1) =3D '\0';
> > > >          SwigLib =3D NewStringf("%sLib", buf); // Native windows
> > > > installation path
> > > > -@@ -946,7 +951,22 @@ int SWIG_main(int argc, char *argv[], co
> > > > +@@ -898,7 +903,22 @@ int SWIG_main(int argc, char *argv[], const
> > > > TargetLanguageModule *tlm) {
> > > >        if (Len(SWIG_LIB_WIN_UNIX) > 0)
> > > >          SwigLibWinUnix =3D NewString(SWIG_LIB_WIN_UNIX); // Unix
> > > > installation path using a drive letter (for msys/mingw)
> > > >    #else
> > > > diff --git a/meta/recipes-devtools/swig/swig/0001-configure-use-
> > > > pkg-config-for-pcre-detection.patch b/meta/recipes-
> > > > devtools/swig/swig/0001-configure-use-pkg-config-for-pcre-
> > > > detection.patch
> > > > index cfcbd8c73ae..9e16caecca1 100644
> > > > --- a/meta/recipes-devtools/swig/swig/0001-configure-use-pkg-
> > > > config-for-pcre-detection.patch
> > > > +++ b/meta/recipes-devtools/swig/swig/0001-configure-use-pkg-
> > > > config-for-pcre-detection.patch
> > > > @@ -1,4 +1,4 @@
> > > > -From ffb785ed8d3cac3c28e014b1238d93e2bc1f0c01 Mon Sep 17
> > > > 00:00:00 2001
> > > > +From 57a15651b46a0f1f84a4dd15d67d104fbfbe3f6e Mon Sep 17
> > > > 00:00:00 2001
> > > >   From: Koen Kooi <koen.kooi@linaro.org>
> > > >   Date: Tue, 17 Jun 2014 08:18:17 +0200
> > > >   Subject: [PATCH] configure: use pkg-config for pcre detection
> > > > @@ -11,10 +11,10 @@ Upstream-Status: Pending
> > > >    1 file changed, 7 insertions(+), 32 deletions(-)
> > > >
> > > >   diff --git a/configure.ac b/configure.ac
> > > > -index f88004a..3a2b47c 100644
> > > > +index c060028..a330266 100644
> > > >   --- a/configure.ac
> > > >   +++ b/configure.ac
> > > > -@@ -57,39 +57,14 @@ AC_MSG_RESULT([$with_pcre])
> > > > +@@ -49,39 +49,14 @@ AC_MSG_RESULT([$with_pcre])
> > > >
> > > >    dnl To make configuring easier, check for a locally built PCRE
> > > > using the Tools/pcre-build.sh script
> > > >    if test x"${with_pcre}" =3D xyes ; then
> > > > diff --git a/meta/recipes-devtools/swig/swig/determinism.patch
> > > > b/meta/recipes-devtools/swig/swig/determinism.patch
> > > > index 84c399182a4..417f0c43178 100644
> > > > --- a/meta/recipes-devtools/swig/swig/determinism.patch
> > > > +++ b/meta/recipes-devtools/swig/swig/determinism.patch
> > > > @@ -1,13 +1,23 @@
> > > > +From 25bf9893ec1f557781eb241508ea1bec959061fe Mon Sep 17
> > > > 00:00:00 2001
> > > > +From: Richard Purdie <richard.purdie@linuxfoundation.org>
> > > > +Date: Mon, 1 Mar 2021 00:11:10 +0000
> > > > +Subject: [PATCH] swig: Fix reproducibility issue
> > > > +
> > > >   Remove the compiler commandline/platform from the compiled
> > > > binary as this
> > > >   breaks reproducibilty.
> > > >
> > > >   Upstream-Status: Inappropriate [OE reproducibiity fix upstream
> > > > unlikely to take]
> > > >   RP 2021/3/1
> > > >
> > > > +---
> > > > + Source/Modules/main.cxx | 1 -
> > > > + 1 file changed, 1 deletion(-)
> > > >
> > > > +diff --git a/Source/Modules/main.cxx b/Source/Modules/main.cxx
> > > > +index 8250dee..415761d 100644
> > > >   --- a/Source/Modules/main.cxx
> > > >   +++ b/Source/Modules/main.cxx
> > > > -@@ -642,7 +642,6 @@ static void getoptions(int argc, char *a
> > > > +@@ -629,7 +629,6 @@ static void getoptions(int argc, char
> > > > *argv[]) {
> > > >       }
> > > >          } else if (strcmp(argv[i], "-version") =3D=3D 0) {
> > > >       fprintf(stdout, "\nSWIG Version %s\n",
> > > > Swig_package_version());
> > > > diff --git a/meta/recipes-devtools/swig/swig_4.1.1.bb
> > > > b/meta/recipes-devtools/swig/swig_4.2.0.bb
> > > > similarity index 72%
> > > > rename from meta/recipes-devtools/swig/swig_4.1.1.bb
> > > > rename to meta/recipes-devtools/swig/swig_4.2.0.bb
> > > > index b9e01752993..2ab4ed006c6 100644
> > > > --- a/meta/recipes-devtools/swig/swig_4.1.1.bb
> > > > +++ b/meta/recipes-devtools/swig/swig_4.2.0.bb
> > > > @@ -4,4 +4,4 @@ SRC_URI +=3D
> > > > "file://0001-Use-proc-self-exe-for-swig-swiglib-on-non-Win32-plat
> > > > .pat
> > > >
> > > > file://0001-configure-use-pkg-config-for-pcre-detection.patch \
> > > >               file://determinism.patch \
> > > >              "
> > > > -SRC_URI[sha256sum] =3D
> > > > "2af08aced8fcd65cdb5cc62426768914bedc735b1c250325203716f78e39ac9b
> > > > "
> > > > +SRC_URI[sha256sum] =3D
> > > > "261ca2d7589e260762817b912c075831572b72ff2717942f75b3e51244829c97
> > > > "
> > > >
> > > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > > > Links: You receive all messages sent to this group.
> > > > View/Reply Online (#195754):
> > > > https://lists.openembedded.org/g/openembedded-core/message/195754
> > > > Mute This Topic:
> > > > https://lists.openembedded.org/mt/104390933/1997914
> > > > Group Owner: openembedded-core+owner@lists.openembedded.org
> > > > Unsubscribe:
> > > > https://lists.openembedded.org/g/openembedded-core/unsub [
> > > > raj.khem@gmail.com]
> > > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > > >
>
>

--00000000000043899a0611b466d7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Sun, Feb 18, 2024 at 6:51=E2=80=AFPM Mittal, Anuj &lt;<a=
 href=3D"mailto:anuj.mittal@intel.com">anuj.mittal@intel.com</a>&gt; wrote:=
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left-width:1px;border-left-style:solid;padding-left:1ex;border-le=
ft-color:rgb(204,204,204)">On Sat, 2024-02-17 at 19:01 -0800, Khem Raj wrot=
e:<br>
&gt; here is one failure due to this upgrade -<br>
&gt; <a href=3D"https://errors.yoctoproject.org/Errors/Details/753587/" rel=
=3D"noreferrer" target=3D"_blank">https://errors.yoctoproject.org/Errors/De=
tails/753587/</a><br>
<br>
Thanks for checking. This project and its dependencies that are giving<br>
error aren&#39;t maintained any more.<br>
<br>
<a href=3D"https://github.com/bambocher/pocketsphinx-python/commit/73b7e6da=
54f57b82d50ab278ad61f2cfa9b4dc4b" rel=3D"noreferrer" target=3D"_blank">http=
s://github.com/bambocher/pocketsphinx-python/commit/73b7e6da54f57b82d50ab27=
8ad61f2cfa9b4dc4b</a><br>
<br>
<a href=3D"https://github.com/cmusphinx/sphinxbase/tree/a74a11df3a021e9a26b=
0d20c3de999b8eb0afcef" rel=3D"noreferrer" target=3D"_blank">https://github.=
com/cmusphinx/sphinxbase/tree/a74a11df3a021e9a26b0d20c3de999b8eb0afcef</a><=
br>
<br>
The recipe should be deleted or replaced by bindings from:<br>
<br>
<a href=3D"https://github.com/cmusphinx/pocketsphinx" rel=3D"noreferrer" ta=
rget=3D"_blank">https://github.com/cmusphinx/pocketsphinx</a></blockquote><=
div dir=3D"auto"><br></div><div dir=3D"auto">I am fine with either. If dele=
tion is easy so be it=C2=A0</div><div dir=3D"auto">Please send a patch=C2=
=A0</div><div dir=3D"auto"><br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid=
;padding-left:1ex;border-left-color:rgb(204,204,204)" dir=3D"auto"><a href=
=3D"https://github.com/cmusphinx/pocketsphinx" rel=3D"noreferrer" target=3D=
"_blank"></a><br>
<br>
Thanks,<br>
<br>
Anuj<br>
<br>
&gt; <br>
&gt; On Fri, Feb 16, 2024 at 6:59=E2=80=AFPM Khem Raj &lt;<a href=3D"mailto=
:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt; wrote:<br=
>
&gt; &gt; <br>
&gt; &gt; this can be tricky for many apps depend on it subtly might fail.<=
br>
&gt; &gt; Perhaps<br>
&gt; &gt; doing an extended world build with this might be good.<br>
&gt; &gt; <br>
&gt; &gt; On 2/16/24 3:40 AM, Anuj Mittal wrote:<br>
&gt; &gt; &gt; Signed-off-by: Anuj Mittal &lt;<a href=3D"mailto:anuj.mittal=
@intel.com" target=3D"_blank">anuj.mittal@intel.com</a>&gt;<br>
&gt; &gt; &gt; ---<br>
&gt; &gt; &gt; =C2=A0 ...self-exe-for-swig-swiglib-on-non-Win32-plat.patch =
| 10<br>
&gt; &gt; &gt; ++++++----<br>
&gt; &gt; &gt; =C2=A0 ...configure-use-pkg-config-for-pcre-detection.patch =
|=C2=A0 6 +++--<br>
&gt; &gt; &gt; -<br>
&gt; &gt; &gt; =C2=A0 meta/recipes-devtools/swig/swig/determinism.patch=C2=
=A0=C2=A0=C2=A0 | 12<br>
&gt; &gt; &gt; +++++++++++-<br>
&gt; &gt; &gt; =C2=A0 .../swig/{<a href=3D"http://swig_4.1.1.bb" rel=3D"nor=
eferrer" target=3D"_blank">swig_4.1.1.bb</a> =3D&gt; <a href=3D"http://swig=
_4.2.0.bb" rel=3D"noreferrer" target=3D"_blank">swig_4.2.0.bb</a>}=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 +-<br>
&gt; &gt; &gt; =C2=A0 4 files changed, 21 insertions(+), 9 deletions(-)<br>
&gt; &gt; &gt; =C2=A0 rename meta/recipes-devtools/swig/{<a href=3D"http://=
swig_4.1.1.bb" rel=3D"noreferrer" target=3D"_blank">swig_4.1.1.bb</a> =3D&g=
t;<br>
&gt; &gt; &gt; <a href=3D"http://swig_4.2.0.bb" rel=3D"noreferrer" target=
=3D"_blank">swig_4.2.0.bb</a>} (72%)<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; diff --git a/meta/recipes-devtools/swig/swig/0001-Use-proc-s=
elf-<br>
&gt; &gt; &gt; exe-for-swig-swiglib-on-non-Win32-plat.patch b/meta/recipes-=
<br>
&gt; &gt; &gt; devtools/swig/swig/0001-Use-proc-self-exe-for-swig-swiglib-o=
n-<br>
&gt; &gt; &gt; non-Win32-plat.patch<br>
&gt; &gt; &gt; index f27f80ea184..9c6ae389be2 100644<br>
&gt; &gt; &gt; --- a/meta/recipes-devtools/swig/swig/0001-Use-proc-self-exe=
-for-<br>
&gt; &gt; &gt; swig-swiglib-on-non-Win32-plat.patch<br>
&gt; &gt; &gt; +++ b/meta/recipes-devtools/swig/swig/0001-Use-proc-self-exe=
-for-<br>
&gt; &gt; &gt; swig-swiglib-on-non-Win32-plat.patch<br>
&gt; &gt; &gt; @@ -1,4 +1,4 @@<br>
&gt; &gt; &gt; -From a4a0440a644c6c5e5da096efe3cf05ba309a284f Mon Sep 17<br=
>
&gt; &gt; &gt; 00:00:00 2001<br>
&gt; &gt; &gt; +From ab0ab5e685bd9077c44fdca5c1a27b0f477444d7 Mon Sep 17<br=
>
&gt; &gt; &gt; 00:00:00 2001<br>
&gt; &gt; &gt; =C2=A0 From: &quot;NODA, Kai&quot; &lt;<a href=3D"mailto:nod=
akai@gmail.com" target=3D"_blank">nodakai@gmail.com</a>&gt;<br>
&gt; &gt; &gt; =C2=A0 Date: Sun, 22 Apr 2012 17:01:02 +0900<br>
&gt; &gt; &gt; =C2=A0 Subject: [PATCH] Use /proc/self/exe for &quot;swig -s=
wiglib&quot; on non-<br>
&gt; &gt; &gt; Win32<br>
&gt; &gt; &gt; @@ -10,9 +10,11 @@ Upstream-Status: Submitted<br>
&gt; &gt; &gt; =C2=A0 <a href=3D"http://sourceforge.net/mailarchive/message=
.php?msg_id=3D29179733" rel=3D"noreferrer" target=3D"_blank">http://sourcef=
orge.net/mailarchive/message.php?msg_id=3D29179733</a><br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; =C2=A0 ---<br>
&gt; &gt; &gt; - Source/Modules/main.cxx |=C2=A0=C2=A0 24 +++++++++++++++++=
+++++--<br>
&gt; &gt; &gt; + Source/Modules/main.cxx | 24 ++++++++++++++++++++++--<br>
&gt; &gt; &gt; =C2=A0=C2=A0 1 file changed, 22 insertions(+), 2 deletions(-=
)<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; +diff --git a/Source/Modules/main.cxx b/Source/Modules/main.=
cxx<br>
&gt; &gt; &gt; +index 8a44921..8250dee 100644<br>
&gt; &gt; &gt; =C2=A0 --- a/Source/Modules/main.cxx<br>
&gt; &gt; &gt; =C2=A0 +++ b/Source/Modules/main.cxx<br>
&gt; &gt; &gt; =C2=A0 @@ -25,6 +25,11 @@<br>
&gt; &gt; &gt; @@ -27,7 +29,7 @@<br>
&gt; &gt; &gt; <a href=3D"http://sourceforge.net/mailarchive/message.php?ms=
g_id=3D29179733" rel=3D"noreferrer" target=3D"_blank">http://sourceforge.ne=
t/mailarchive/message.php?msg_id=3D29179733</a><br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; =C2=A0=C2=A0 // Global variables<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; -@@ -934,9 +939,9 @@ int SWIG_main(int argc, char *argv[], c=
o<br>
&gt; &gt; &gt; +@@ -886,9 +891,9 @@ int SWIG_main(int argc, char *argv[], c=
onst<br>
&gt; &gt; &gt; TargetLanguageModule *tlm) {<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; =C2=A0=C2=A0=C2=A0=C2=A0 // Check for SWIG_LIB environment v=
ariable<br>
&gt; &gt; &gt; =C2=A0=C2=A0=C2=A0=C2=A0 if ((c =3D getenv(&quot;SWIG_LIB&qu=
ot;)) =3D=3D (char *) 0) {<br>
&gt; &gt; &gt; @@ -38,7 +40,7 @@<br>
&gt; &gt; &gt; <a href=3D"http://sourceforge.net/mailarchive/message.php?ms=
g_id=3D29179733" rel=3D"noreferrer" target=3D"_blank">http://sourceforge.ne=
t/mailarchive/message.php?msg_id=3D29179733</a><br>
&gt; &gt; &gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!(GetModuleFileName=
(0, buf, MAX_PATH) =3D=3D 0 || (p =3D<br>
&gt; &gt; &gt; strrchr(buf, &#39;\\&#39;)) =3D=3D 0)) {<br>
&gt; &gt; &gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *(p + 1) =
=3D &#39;\0&#39;;<br>
&gt; &gt; &gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 SwigLib =3D=
 NewStringf(&quot;%sLib&quot;, buf); // Native windows<br>
&gt; &gt; &gt; installation path<br>
&gt; &gt; &gt; -@@ -946,7 +951,22 @@ int SWIG_main(int argc, char *argv[], =
co<br>
&gt; &gt; &gt; +@@ -898,7 +903,22 @@ int SWIG_main(int argc, char *argv[], =
const<br>
&gt; &gt; &gt; TargetLanguageModule *tlm) {<br>
&gt; &gt; &gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (Len(SWIG_LIB_WIN_UN=
IX) &gt; 0)<br>
&gt; &gt; &gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 SwigLibWinU=
nix =3D NewString(SWIG_LIB_WIN_UNIX); // Unix<br>
&gt; &gt; &gt; installation path using a drive letter (for msys/mingw)<br>
&gt; &gt; &gt; =C2=A0=C2=A0 #else<br>
&gt; &gt; &gt; diff --git a/meta/recipes-devtools/swig/swig/0001-configure-=
use-<br>
&gt; &gt; &gt; pkg-config-for-pcre-detection.patch b/meta/recipes-<br>
&gt; &gt; &gt; devtools/swig/swig/0001-configure-use-pkg-config-for-pcre-<b=
r>
&gt; &gt; &gt; detection.patch<br>
&gt; &gt; &gt; index cfcbd8c73ae..9e16caecca1 100644<br>
&gt; &gt; &gt; --- a/meta/recipes-devtools/swig/swig/0001-configure-use-pkg=
-<br>
&gt; &gt; &gt; config-for-pcre-detection.patch<br>
&gt; &gt; &gt; +++ b/meta/recipes-devtools/swig/swig/0001-configure-use-pkg=
-<br>
&gt; &gt; &gt; config-for-pcre-detection.patch<br>
&gt; &gt; &gt; @@ -1,4 +1,4 @@<br>
&gt; &gt; &gt; -From ffb785ed8d3cac3c28e014b1238d93e2bc1f0c01 Mon Sep 17<br=
>
&gt; &gt; &gt; 00:00:00 2001<br>
&gt; &gt; &gt; +From 57a15651b46a0f1f84a4dd15d67d104fbfbe3f6e Mon Sep 17<br=
>
&gt; &gt; &gt; 00:00:00 2001<br>
&gt; &gt; &gt; =C2=A0 From: Koen Kooi &lt;<a href=3D"mailto:koen.kooi@linar=
o.org" target=3D"_blank">koen.kooi@linaro.org</a>&gt;<br>
&gt; &gt; &gt; =C2=A0 Date: Tue, 17 Jun 2014 08:18:17 +0200<br>
&gt; &gt; &gt; =C2=A0 Subject: [PATCH] configure: use pkg-config for pcre d=
etection<br>
&gt; &gt; &gt; @@ -11,10 +11,10 @@ Upstream-Status: Pending<br>
&gt; &gt; &gt; =C2=A0=C2=A0 1 file changed, 7 insertions(+), 32 deletions(-=
)<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; =C2=A0 diff --git a/<a href=3D"http://configure.ac" rel=3D"n=
oreferrer" target=3D"_blank">configure.ac</a> b/<a href=3D"http://configure=
.ac" rel=3D"noreferrer" target=3D"_blank">configure.ac</a><br>
&gt; &gt; &gt; -index f88004a..3a2b47c 100644<br>
&gt; &gt; &gt; +index c060028..a330266 100644<br>
&gt; &gt; &gt; =C2=A0 --- a/<a href=3D"http://configure.ac" rel=3D"noreferr=
er" target=3D"_blank">configure.ac</a><br>
&gt; &gt; &gt; =C2=A0 +++ b/<a href=3D"http://configure.ac" rel=3D"noreferr=
er" target=3D"_blank">configure.ac</a><br>
&gt; &gt; &gt; -@@ -57,39 +57,14 @@ AC_MSG_RESULT([$with_pcre])<br>
&gt; &gt; &gt; +@@ -49,39 +49,14 @@ AC_MSG_RESULT([$with_pcre])<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; =C2=A0=C2=A0 dnl To make configuring easier, check for a loc=
ally built PCRE<br>
&gt; &gt; &gt; using the Tools/pcre-build.sh script<br>
&gt; &gt; &gt; =C2=A0=C2=A0 if test x&quot;${with_pcre}&quot; =3D xyes ; th=
en<br>
&gt; &gt; &gt; diff --git a/meta/recipes-devtools/swig/swig/determinism.pat=
ch<br>
&gt; &gt; &gt; b/meta/recipes-devtools/swig/swig/determinism.patch<br>
&gt; &gt; &gt; index 84c399182a4..417f0c43178 100644<br>
&gt; &gt; &gt; --- a/meta/recipes-devtools/swig/swig/determinism.patch<br>
&gt; &gt; &gt; +++ b/meta/recipes-devtools/swig/swig/determinism.patch<br>
&gt; &gt; &gt; @@ -1,13 +1,23 @@<br>
&gt; &gt; &gt; +From 25bf9893ec1f557781eb241508ea1bec959061fe Mon Sep 17<br=
>
&gt; &gt; &gt; 00:00:00 2001<br>
&gt; &gt; &gt; +From: Richard Purdie &lt;<a href=3D"mailto:richard.purdie@l=
inuxfoundation.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a=
>&gt;<br>
&gt; &gt; &gt; +Date: Mon, 1 Mar 2021 00:11:10 +0000<br>
&gt; &gt; &gt; +Subject: [PATCH] swig: Fix reproducibility issue<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; =C2=A0 Remove the compiler commandline/platform from the com=
piled<br>
&gt; &gt; &gt; binary as this<br>
&gt; &gt; &gt; =C2=A0 breaks reproducibilty.<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; =C2=A0 Upstream-Status: Inappropriate [OE reproducibiity fix=
 upstream<br>
&gt; &gt; &gt; unlikely to take]<br>
&gt; &gt; &gt; =C2=A0 RP 2021/3/1<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; +---<br>
&gt; &gt; &gt; + Source/Modules/main.cxx | 1 -<br>
&gt; &gt; &gt; + 1 file changed, 1 deletion(-)<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; +diff --git a/Source/Modules/main.cxx b/Source/Modules/main.=
cxx<br>
&gt; &gt; &gt; +index 8250dee..415761d 100644<br>
&gt; &gt; &gt; =C2=A0 --- a/Source/Modules/main.cxx<br>
&gt; &gt; &gt; =C2=A0 +++ b/Source/Modules/main.cxx<br>
&gt; &gt; &gt; -@@ -642,7 +642,6 @@ static void getoptions(int argc, char *=
a<br>
&gt; &gt; &gt; +@@ -629,7 +629,6 @@ static void getoptions(int argc, char<b=
r>
&gt; &gt; &gt; *argv[]) {<br>
&gt; &gt; &gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }<br>
&gt; &gt; &gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 } else if (=
strcmp(argv[i], &quot;-version&quot;) =3D=3D 0) {<br>
&gt; &gt; &gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fprintf(stdout, &quot;\nSWIG =
Version %s\n&quot;,<br>
&gt; &gt; &gt; Swig_package_version());<br>
&gt; &gt; &gt; diff --git a/meta/recipes-devtools/swig/<a href=3D"http://sw=
ig_4.1.1.bb" rel=3D"noreferrer" target=3D"_blank">swig_4.1.1.bb</a><br>
&gt; &gt; &gt; b/meta/recipes-devtools/swig/<a href=3D"http://swig_4.2.0.bb=
" rel=3D"noreferrer" target=3D"_blank">swig_4.2.0.bb</a><br>
&gt; &gt; &gt; similarity index 72%<br>
&gt; &gt; &gt; rename from meta/recipes-devtools/swig/<a href=3D"http://swi=
g_4.1.1.bb" rel=3D"noreferrer" target=3D"_blank">swig_4.1.1.bb</a><br>
&gt; &gt; &gt; rename to meta/recipes-devtools/swig/<a href=3D"http://swig_=
4.2.0.bb" rel=3D"noreferrer" target=3D"_blank">swig_4.2.0.bb</a><br>
&gt; &gt; &gt; index b9e01752993..2ab4ed006c6 100644<br>
&gt; &gt; &gt; --- a/meta/recipes-devtools/swig/<a href=3D"http://swig_4.1.=
1.bb" rel=3D"noreferrer" target=3D"_blank">swig_4.1.1.bb</a><br>
&gt; &gt; &gt; +++ b/meta/recipes-devtools/swig/<a href=3D"http://swig_4.2.=
0.bb" rel=3D"noreferrer" target=3D"_blank">swig_4.2.0.bb</a><br>
&gt; &gt; &gt; @@ -4,4 +4,4 @@ SRC_URI +=3D<br>
&gt; &gt; &gt; &quot;file://0001-Use-proc-self-exe-for-swig-swiglib-on-non-=
Win32-plat<br>
&gt; &gt; &gt; .pat<br>
&gt; &gt; &gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0<br>
&gt; &gt; &gt; file://0001-configure-use-pkg-config-for-pcre-detection.patc=
h=C2=A0\<br>
&gt; &gt; &gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 file://determinism.patch=C2=A0\<br>
&gt; &gt; &gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 &quot;<br>
&gt; &gt; &gt; -SRC_URI[sha256sum] =3D<br>
&gt; &gt; &gt; &quot;2af08aced8fcd65cdb5cc62426768914bedc735b1c250325203716=
f78e39ac9b<br>
&gt; &gt; &gt; &quot;<br>
&gt; &gt; &gt; +SRC_URI[sha256sum] =3D<br>
&gt; &gt; &gt; &quot;261ca2d7589e260762817b912c075831572b72ff2717942f75b3e5=
1244829c97<br>
&gt; &gt; &gt; &quot;<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; &gt; &gt; Links: You receive all messages sent to this group.<br>
&gt; &gt; &gt; View/Reply Online (#195754):<br>
&gt; &gt; &gt; <a href=3D"https://lists.openembedded.org/g/openembedded-cor=
e/message/195754" rel=3D"noreferrer" target=3D"_blank">https://lists.openem=
bedded.org/g/openembedded-core/message/195754</a><br>
&gt; &gt; &gt; Mute This Topic:<br>
&gt; &gt; &gt; <a href=3D"https://lists.openembedded.org/mt/104390933/19979=
14" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt/=
104390933/1997914</a><br>
&gt; &gt; &gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lis=
ts.openembedded.org" target=3D"_blank">openembedded-core+owner@lists.openem=
bedded.org</a><br>
&gt; &gt; &gt; Unsubscribe:<br>
&gt; &gt; &gt; <a href=3D"https://lists.openembedded.org/g/openembedded-cor=
e/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.or=
g/g/openembedded-core/unsub</a>=C2=A0[<br>
&gt; &gt; &gt; <a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.=
khem@gmail.com</a>]<br>
&gt; &gt; &gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; &gt; &gt; <br>
<br>
</blockquote></div></div>

--00000000000043899a0611b466d7--

