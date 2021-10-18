Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0911C433F5
	for <webhook@archiver.kernel.org>; Mon, 18 Oct 2021 14:09:57 +0000 (UTC)
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com
 [209.85.222.50])
 by mx.groups.io with SMTP id smtpd.web09.36806.1634566196372903663
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Oct 2021 07:09:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=RXz7PS1X;
 spf=pass (domain: gmail.com, ip: 209.85.222.50,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f50.google.com with SMTP id i15so5351371uap.0
        for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Oct 2021 07:09:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=EBk1TMSEXWsmFoUNk1CYQXu+tEosRTxHnDdqqOE79aQ=;
        b=RXz7PS1XXbs0b8OFrnoE4w40dG3pKkGvIq+7nz3QqGUuI8mm5WIkbQIC65e9ldxF8Y
         LehFOusr92th77nmcNOXyjSIDTZdzeP1tIhoiSGni2NKpRkqIoDKWh1YN5J/EN8eIMTB
         wt/NiNyuu1LrsjfluWb6vN8KTWrBw50Ez4h/j7xRKKEYoEWwMDZubaJUZXV8aMIsGAiS
         XBAFznSdSl2VFs7pWUSdSgtrZmHk3B9Wfikm9i3Ym7YAeuzl1ZJfIYLKvYy9GrYAMb8B
         XOFAPmaFQqbJnhW4xKnjupUHzrD5wSWFEEWfoqft8lS2YUmxypOySKibIB7ZOW21yOcN
         RuPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EBk1TMSEXWsmFoUNk1CYQXu+tEosRTxHnDdqqOE79aQ=;
        b=0WPFyRwxl2MlT3r6e89W5cHXJNQzyM3vqwabdh6pyGPHblKmHT/7YY0eHrFr+RwQqQ
         Gh8qvKxks9o5fqlSe8KNV3lBRg0WW6hjYl0yiHa0YqRhwZqIcGgF6YxBQ7tqMcpfzhoS
         NZQeHljHH6fxATve8hGAzMEtd97lWZkysuiOgorEGMwHm9hZ3aLCHcnrbu8ju+P6MbPX
         zJ7NyRrqXTRHPXEKBiLih23RaAZShZ1+dvm3oIh+z1ZKKQzYUm+C3lf0j6cKE3XAxzbt
         CVwP2e4m9kgBwC2HukV6YN1hYWBJlT1urBw/pyn+mhh4yAn0jaJ1LqZhCwRirARUrJNJ
         zyXw==
X-Gm-Message-State: AOAM530kUmefSGE81QRZsh7QFexPYKRyHjsvqHRjK/mSuALaCSG2t/R5
	29L6EJ/aqqFUnzzQvpC7Ykc5gHC1uG9eg/zUysvwID8S
X-Google-Smtp-Source: 
 ABdhPJyON2pS2QFerDAnY9Xy+JXRF+7DeFaDQBbysut2apDhiXfIdkC0QJByhAgfFL0x1gGyewFSy9z9Cq2kobynLUc=
X-Received: by 2002:a05:6102:951:: with SMTP id
 a17mr27019874vsi.18.1634566195556;
 Mon, 18 Oct 2021 07:09:55 -0700 (PDT)
MIME-Version: 1.0
References: <20211017115703.3801301-1-schnitzeltony@gmail.com>
 <e4e32689f8bddb5de2f34b156620cd9cef488cdf.camel@linuxfoundation.org>
 <16AED214610C971D.13161@lists.openembedded.org>
 <CA+chaQeYpbufBvZFgoiaQarwOs5wPVDAfd4DpyLNmDA93=kVgA@mail.gmail.com>
 <7ec1a961dd5fba3b61c76a05b94655ab72a59062.camel@linuxfoundation.org>
In-Reply-To: 
 <7ec1a961dd5fba3b61c76a05b94655ab72a59062.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 18 Oct 2021 16:09:43 +0200
Message-ID: 
 <CANNYZj_+mdm7hgc29WvuZ4jvazJ2pOi06FonrjDACQcVgVyVow@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] webkitgtk: add gperf-native to DEPENDS to fix
 build
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Martin Jansa <martin.jansa@gmail.com>,
 =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>,
	Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000072b3f805cea1192e"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Oct 2021 14:09:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157064

--00000000000072b3f805cea1192e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

But I still don't understand this. How can this be reproduced?

Alex

On Mon, 18 Oct 2021 at 16:07, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Mon, 2021-10-18 at 15:56 +0200, Martin Jansa wrote:
> > On Sun, Oct 17, 2021 at 2:45 PM Martin Jansa via lists.openembedded.org
> > <Martin.Jansa=3Dgmail.com@lists.openembedded.org> wrote:
> > > On Sun, Oct 17, 2021 at 2:03 PM Richard Purdie
> > > <richard.purdie@linuxfoundation.org> wrote:
> > > > On Sun, 2021-10-17 at 13:57 +0200, Andreas M=C3=BCller wrote:
> > > > > >   Could NOT find Gperf (missing: GPERF_EXECUTABLE) (Required is
> at
> > > > > > least
> > > > > >   version "3.0.1")
> > > > >
> > > > > Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
> > > > > ---
> > > > >  meta/recipes-sato/webkit/webkitgtk_2.34.0.bb | 1 +
> > > > >  1 file changed, 1 insertion(+)
> > > > >
> > > > > diff --git a/meta/recipes-sato/webkit/webkitgtk_2.34.0.bb
> > > > > b/meta/recipes-
> > > > > sato/webkit/webkitgtk_2.34.0.bb
> > > > > index 25e1d422cc..a8e067147c 100644
> > > > > --- a/meta/recipes-sato/webkit/webkitgtk_2.34.0.bb
> > > > > +++ b/meta/recipes-sato/webkit/webkitgtk_2.34.0.bb
> > > > > @@ -32,6 +32,7 @@ CVE_PRODUCT =3D "webkitgtk webkitgtk\+"
> > > > >
> > > > >  DEPENDS =3D " \
> > > > >            ruby-native \
> > > > > +          gperf-native \
> > > > >            cairo \
> > > > >            harfbuzz \
> > > > >            jpeg \
> > > >
> > > > Out of interest, why are you seeing that and the automated testing
> isn't?
> > > >
> > >
> > >
> > > FWIW: I'm also seeing webkitgtk failures since last upgrade, but for
> me it
> > > isn't because of gperf, but:
> > >
> > > | CMake Error at Source/cmake/OptionsGTK.cmake:353 (message):
> > > |   Either GLX or EGL is needed.
> > > | Call Stack (most recent call first):
> > > |   Source/cmake/WebKitCommon.cmake:220 (include)
> > > |   CMakeLists.txt:20 (include)
> > >
> > > possibly because the default setup in oe-core doesn't have opengl in
> > > DISTRO_FEATUES while all builds on autobuilder have opengl enabled wi=
th
> > > poky?
> > >
> >
> >
> > I've sent a fix for build for default oe-core setup (without opengl in
> > DISTRO_FEATURES).
> >
> > In my build gperf-native was found in older 2.32.3 from native sysroot:
> >
> > CMakeCache.txt.2.32.3-
> > r0:GPERF_EXECUTABLE:FILEPATH=3D/jenkins/mjansa/build/ros/ros2-foxy-
> > kirkstone/tmp-glibc/work/core2-64-oe-linux/webkitgtk/VER/recipe-sysroot=
-
> > native/usr/bin
> > /gperf
> > CMakeCache.txt.2.32.3-r0://Details about finding Gperf
> > CMakeCache.txt.2.32.3-
> >
> r0:FIND_PACKAGE_MESSAGE_DETAILS_Gperf:INTERNAL=3D[/jenkins/mjansa/build/r=
os/ros2
> > -foxy-kirkstone/tmp-glibc/work/core2-64-oe-linux/webkitgtk/VER/recipe-s=
ys
> > root-native/usr/bin/gperf][v(3.0.1)]
> > CMakeCache.txt.2.32.3-r0://ADVANCED property for variable:
> GPERF_EXECUTABLE
> > CMakeCache.txt.2.32.3-r0:GPERF_EXECUTABLE-ADVANCED:INTERNAL=3D1
> >
> > and it's found there through as transitive dependency from:
> >
> > "fontconfig.do_prepare_recipe_sysroot" ->
> "gperf-native.do_populate_sysroot"
> > "glibc.do_prepare_recipe_sysroot" -> "gperf-native.do_populate_sysroot"
> > "libcap-native.do_prepare_recipe_sysroot" -> "gperf-
> > native.do_populate_sysroot"
> > "libcap.do_prepare_recipe_sysroot" -> "gperf-native.do_populate_sysroot=
"
> > "systemd.do_prepare_recipe_sysroot" -> "gperf-native.do_populate_sysroo=
t"
> >
> > with some other combination of DISTRO_FEATURES it might be missing as i=
n
> > Andreas case and as it's direct dependency of webkitgtk I think removin=
g
> it
> > in:
> >
> https://git.openembedded.org/openembedded-core/commit/?id=3Da5b6f978ef4ae=
f6d484acc6e3c4558df7fec65d2
> > wasn't correct, maybe other dependencies removed here have similar issu=
e
> and
> > successful pass on autobuilder tests only very limited set of
> combinations
> > (understandably).
>
> We could put gperf-native into the same class of dependencies as pkgconfi=
g-
> native which should expose all the missing dependencies at the risk of
> causing
> work in needing to correctly mark up the recipes.
>
> I'm at least happier now I understand why this was being masked.
>
> Cheers,
>
> Richard
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#157063):
> https://lists.openembedded.org/g/openembedded-core/message/157063
> Mute This Topic: https://lists.openembedded.org/mt/86389188/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--00000000000072b3f805cea1192e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>But I still don&#39;t understand this. How can this b=
e reproduced?</div><div><br></div><div>Alex<br></div></div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, 18 Oct 2021 =
at 16:07, Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfoundati=
on.org">richard.purdie@linuxfoundation.org</a>&gt; wrote:<br></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex">On Mon, 2021-10-18 at 15:56 +0200=
, Martin Jansa wrote:<br>
&gt; On Sun, Oct 17, 2021 at 2:45 PM Martin Jansa via <a href=3D"http://lis=
ts.openembedded.org" rel=3D"noreferrer" target=3D"_blank">lists.openembedde=
d.org</a><br>
&gt; &lt;Martin.Jansa=3D<a href=3D"mailto:gmail.com@lists.openembedded.org"=
 target=3D"_blank">gmail.com@lists.openembedded.org</a>&gt; wrote:<br>
&gt; &gt; On Sun, Oct 17, 2021 at 2:03 PM Richard Purdie<br>
&gt; &gt; &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org" target=
=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt; wrote:<br>
&gt; &gt; &gt; On Sun, 2021-10-17 at 13:57 +0200, Andreas M=C3=BCller wrote=
:<br>
&gt; &gt; &gt; &gt; &gt; =C2=A0=C2=A0Could NOT find Gperf (missing: GPERF_E=
XECUTABLE) (Required is at<br>
&gt; &gt; &gt; &gt; &gt; least<br>
&gt; &gt; &gt; &gt; &gt; =C2=A0=C2=A0version &quot;3.0.1&quot;)<br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; Signed-off-by: Andreas M=C3=BCller &lt;<a href=3D"mailt=
o:schnitzeltony@gmail.com" target=3D"_blank">schnitzeltony@gmail.com</a>&gt=
;<br>
&gt; &gt; &gt; &gt; ---<br>
&gt; &gt; &gt; &gt; =C2=A0meta/recipes-sato/webkit/<a href=3D"http://webkit=
gtk_2.34.0.bb" rel=3D"noreferrer" target=3D"_blank">webkitgtk_2.34.0.bb</a>=
 | 1 +<br>
&gt; &gt; &gt; &gt; =C2=A01 file changed, 1 insertion(+)<br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; diff --git a/meta/recipes-sato/webkit/<a href=3D"http:/=
/webkitgtk_2.34.0.bb" rel=3D"noreferrer" target=3D"_blank">webkitgtk_2.34.0=
.bb</a><br>
&gt; &gt; &gt; &gt; b/meta/recipes-<br>
&gt; &gt; &gt; &gt; sato/webkit/<a href=3D"http://webkitgtk_2.34.0.bb" rel=
=3D"noreferrer" target=3D"_blank">webkitgtk_2.34.0.bb</a><br>
&gt; &gt; &gt; &gt; index 25e1d422cc..a8e067147c 100644<br>
&gt; &gt; &gt; &gt; --- a/meta/recipes-sato/webkit/<a href=3D"http://webkit=
gtk_2.34.0.bb" rel=3D"noreferrer" target=3D"_blank">webkitgtk_2.34.0.bb</a>=
<br>
&gt; &gt; &gt; &gt; +++ b/meta/recipes-sato/webkit/<a href=3D"http://webkit=
gtk_2.34.0.bb" rel=3D"noreferrer" target=3D"_blank">webkitgtk_2.34.0.bb</a>=
<br>
&gt; &gt; &gt; &gt; @@ -32,6 +32,7 @@ CVE_PRODUCT =3D &quot;webkitgtk webki=
tgtk\+&quot;<br>
&gt; &gt; &gt; &gt; =C2=A0<br>
&gt; &gt; &gt; &gt; =C2=A0DEPENDS =3D &quot; \<br>
&gt; &gt; &gt; &gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0ruby-native \<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gperf-native \<br>
&gt; &gt; &gt; &gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0cairo \<br>
&gt; &gt; &gt; &gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0harfbuzz \<br>
&gt; &gt; &gt; &gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0jpeg \<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; Out of interest, why are you seeing that and the automated t=
esting isn&#39;t?<br>
&gt; &gt; &gt; <br>
&gt; &gt; <br>
&gt; &gt; <br>
&gt; &gt; FWIW: I&#39;m also seeing webkitgtk failures since last upgrade, =
but for me it<br>
&gt; &gt; isn&#39;t because of gperf, but:<br>
&gt; &gt; <br>
&gt; &gt; | CMake Error at Source/cmake/OptionsGTK.cmake:353 (message):<br>
&gt; &gt; | =C2=A0 Either GLX or EGL is needed.<br>
&gt; &gt; | Call Stack (most recent call first):<br>
&gt; &gt; | =C2=A0 Source/cmake/WebKitCommon.cmake:220 (include)<br>
&gt; &gt; | =C2=A0 CMakeLists.txt:20 (include)<br>
&gt; &gt; <br>
&gt; &gt; possibly because the default setup in oe-core doesn&#39;t have op=
engl in<br>
&gt; &gt; DISTRO_FEATUES while all builds on autobuilder have opengl enable=
d with<br>
&gt; &gt; poky?<br>
&gt; &gt; <br>
&gt; <br>
&gt; <br>
&gt; I&#39;ve sent a fix for build for default oe-core setup (without openg=
l in<br>
&gt; DISTRO_FEATURES).<br>
&gt; <br>
&gt; In my build gperf-native was found in older 2.32.3 from native sysroot=
:<br>
&gt; <br>
&gt; CMakeCache.txt.2.32.3-<br>
&gt; r0:GPERF_EXECUTABLE:FILEPATH=3D/jenkins/mjansa/build/ros/ros2-foxy-<br=
>
&gt; kirkstone/tmp-glibc/work/core2-64-oe-linux/webkitgtk/VER/recipe-sysroo=
t-<br>
&gt; native/usr/bin<br>
&gt; /gperf<br>
&gt; CMakeCache.txt.2.32.3-r0://Details about finding Gperf<br>
&gt; CMakeCache.txt.2.32.3-<br>
&gt; r0:FIND_PACKAGE_MESSAGE_DETAILS_Gperf:INTERNAL=3D[/jenkins/mjansa/buil=
d/ros/ros2<br>
&gt; -foxy-kirkstone/tmp-glibc/work/core2-64-oe-linux/webkitgtk/VER/recipe-=
sys<br>
&gt; root-native/usr/bin/gperf][v(3.0.1)]<br>
&gt; CMakeCache.txt.2.32.3-r0://ADVANCED property for variable: GPERF_EXECU=
TABLE<br>
&gt; CMakeCache.txt.2.32.3-r0:GPERF_EXECUTABLE-ADVANCED:INTERNAL=3D1<br>
&gt; <br>
&gt; and it&#39;s found there through as transitive dependency from:<br>
&gt; <br>
&gt; &quot;fontconfig.do_prepare_recipe_sysroot&quot; -&gt; &quot;gperf-nat=
ive.do_populate_sysroot&quot;<br>
&gt; &quot;glibc.do_prepare_recipe_sysroot&quot; -&gt; &quot;gperf-native.d=
o_populate_sysroot&quot;<br>
&gt; &quot;libcap-native.do_prepare_recipe_sysroot&quot; -&gt; &quot;gperf-=
<br>
&gt; native.do_populate_sysroot&quot;<br>
&gt; &quot;libcap.do_prepare_recipe_sysroot&quot; -&gt; &quot;gperf-native.=
do_populate_sysroot&quot;<br>
&gt; &quot;systemd.do_prepare_recipe_sysroot&quot; -&gt; &quot;gperf-native=
.do_populate_sysroot&quot;<br>
&gt; <br>
&gt; with some other combination of DISTRO_FEATURES it might be missing as =
in<br>
&gt; Andreas case and as it&#39;s direct dependency of webkitgtk I think re=
moving it<br>
&gt; in:<br>
&gt; <a href=3D"https://git.openembedded.org/openembedded-core/commit/?id=
=3Da5b6f978ef4aef6d484acc6e3c4558df7fec65d2" rel=3D"noreferrer" target=3D"_=
blank">https://git.openembedded.org/openembedded-core/commit/?id=3Da5b6f978=
ef4aef6d484acc6e3c4558df7fec65d2</a><br>
&gt; wasn&#39;t correct, maybe other dependencies removed here have similar=
 issue and<br>
&gt; successful pass on autobuilder tests only very limited set of combinat=
ions<br>
&gt; (understandably).<br>
<br>
We could put gperf-native into the same class of dependencies as pkgconfig-=
<br>
native which should expose all the missing dependencies at the risk of caus=
ing<br>
work in needing to correctly mark up the recipes.<br>
<br>
I&#39;m at least happier now I understand why this was being masked.<br>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#157063): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/157063" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/157063</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/86389188/1686=
489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/86389188/1686489</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:alex.kanavin@gmail.com" ta=
rget=3D"_blank">alex.kanavin@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--00000000000072b3f805cea1192e--

