Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C01CC433F5
	for <webhook@archiver.kernel.org>; Fri, 10 Dec 2021 14:33:42 +0000 (UTC)
Received: from mailout12.t-online.de (mailout12.t-online.de [194.25.134.22])
 by mx.groups.io with SMTP id smtpd.web08.7941.1639146820609110610
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Dec 2021 06:33:41 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.22,
 mailfrom: f_l_k@t-online.de)
Received: from fwd88.dcpf.telekom.de (fwd88.aul.t-online.de [10.223.144.114])
	by mailout12.t-online.de (Postfix) with SMTP id BD5B880C2
	for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Dec 2021 15:33:38 +0100 (CET)
Received: from [192.168.178.83] ([84.163.46.27]) by fwd88.t-online.de
	with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
	esmtp id 1mvgxu-1IBgFF0; Fri, 10 Dec 2021 15:33:38 +0100
Subject: Re: [OE-core] [PATCH] libva: move wayland PACKAGECONFIG to libva.inc
To: openembedded-core@lists.openembedded.org
References: <20211210140234.3713-1-f_l_k@t-online.de>
 <CANNYZj9YbZJxLADiti4fzsCex06DK9RUk4G-y3ARb3tLgkW9=w@mail.gmail.com>
From: Markus Volk <f_l_k@t-online.de>
Message-ID: <d95c3019-ae4b-f94c-fb34-ab9ac669b6e2@t-online.de>
Date: Fri, 10 Dec 2021 15:33:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: 
 <CANNYZj9YbZJxLADiti4fzsCex06DK9RUk4G-y3ARb3tLgkW9=w@mail.gmail.com>
Content-Type: multipart/alternative;
 boundary="------------52072EF7BAB517AE3DFE00F4"
Content-Language: en-US
X-TOI-EXPURGATEID: 150726::1639146818-00001485-00F83AD8/0/0 CLEAN NORMAL
X-TOI-MSGID: 4c9e20a8-2080-4143-9fd4-f412b8b2ee3a
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Dec 2021 14:33:42 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159539

This is a multi-part message in MIME format.
--------------52072EF7BAB517AE3DFE00F4
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

Thats strange indeed. Wayland is set as a DISTRO_FEATURE for my image,=20
so it gets built by a lot ofpackages. This wasn't a clean build, i had=20
sstate cache availbale when i started to experiment with libva and=20
normally it doesn't get=C2=A0 built inside my image because i can't use i=
t on=20
my board. First i did 'bitbake libva' and this succeeded. Second i added=20
'va' PACKAGECONFIG to a mesa.bbappend and started rebuilding the image.=20
Now the build for libva-initial was started and failed with the error=20
about missing wayland-scanner.

I also wondered what is pulling wayland into=C2=A0 its sysroot . Did 'bit=
bake=20
-c cleanstate libva-initial libva' and tried to build libva-initial=20
again with 'bitbake libva-initial' and had the same issue. On my machine=20
this is reproducible

Markus

Am 10.12.21 um 15:06 schrieb Alexander Kanavin:
> | Run-time dependency wayland-client found: YES 1.19.0
>
> Can you please explain how the issue can be reproduced? I find it odd=20
> that libva-initial (which only needs libdrm, and is required by mesa)=20
> has wayland in its sysroot in your build - where does that come from?=20
> There's a chance the problem is elsewhere.
>
> Alex
>
> On Fri, 10 Dec 2021 at 15:03, Markus Volk <f_l_k@t-online.de=20
> <mailto:f_l_k@t-online.de>> wrote:
>
>     I encountered an error while trying to build libva under wayland.
>     libva-initial
>     was missing wayland-native dependency and failed like this:
>
>     | Run-time dependency xfixes found: NO (tried pkgconfig and cmake)
>     | Run-time dependency wayland-client found: YES 1.19.0
>     | Program wayland-scanner /usr/bin/wayland-scanner found: NO
>     |
>     | ../libva-2.13.0/meson.build:107:4: ERROR: Program
>     'wayland-scanner /usr/bin/wayland-scanner' not found
>     |
>     | A full log can be found at
>     /home/flk/build/poky/build-rock/tmp/work/cortexa72-cortexa53-crypto=
-poky-linux/libva-initial/2.13.0-r0/build/meson-logs/meson-log.txt
>     | ERROR: meson failed
>     | WARNING: exit code 1 from a shell command.
>
>     This commit moves the PACKAGECONFIG[wayland] to libva.inc to make
>     it available to libva-initial also
>
>     Signed-off-by: MarkusVolk <f_l_k@t-online.de
>     <mailto:f_l_k@t-online.de>>
>     ---
>     =C2=A0meta/recipes-graphics/libva/libva.inc=C2=A0 =C2=A0 =C2=A0 =C2=
=A0| 7 +++++++
>     =C2=A0meta/recipes-graphics/libva/libva_2.13.0.bb
>     <http://libva_2.13.0.bb> | 4 +---
>     =C2=A02 files changed, 8 insertions(+), 3 deletions(-)
>
>     diff --git a/meta/recipes-graphics/libva/libva.inc
>     b/meta/recipes-graphics/libva/libva.inc
>     index bcf9757c1a..0e2721e291 100644
>     --- a/meta/recipes-graphics/libva/libva.inc
>     +++ b/meta/recipes-graphics/libva/libva.inc
>     @@ -27,3 +27,10 @@ UPSTREAM_CHECK_URI =3D
>     "https://github.com/intel/libva/releases
>     <https://github.com/intel/libva/releases>"
>     =C2=A0DEPENDS =3D "libdrm"
>
>     =C2=A0inherit meson pkgconfig
>     +
>     +PACKAGECONFIG:append =3D " \
>     +=C2=A0 =C2=A0 ${@bb.utils.filter('DISTRO_FEATURES', 'wayland', d)}=
 \
>     +"
>     +
>     +PACKAGECONFIG[wayland] =3D
>     "-Dwith_wayland=3Dyes,-Dwith_wayland=3Dno,wayland-native wayland"
>     +
>     diff --git a/meta/recipes-graphics/libva/libva_2.13.0.bb
>     <http://libva_2.13.0.bb>
>     b/meta/recipes-graphics/libva/libva_2.13.0.bb <http://libva_2.13.0.=
bb>
>     index ed2be289fc..a8c6355b01 100644
>     --- a/meta/recipes-graphics/libva/libva_2.13.0.bb
>     <http://libva_2.13.0.bb>
>     +++ b/meta/recipes-graphics/libva/libva_2.13.0.bb
>     <http://libva_2.13.0.bb>
>     @@ -2,14 +2,12 @@ require libva.inc
>
>     =C2=A0PACKAGECONFIG ??=3D " \
>     =C2=A0 =C2=A0 =C2=A0${@bb.utils.contains('DISTRO_FEATURES', 'x11 op=
engl', 'glx',
>     '', d)} \
>     -=C2=A0 =C2=A0 ${@bb.utils.filter('DISTRO_FEATURES', 'x11 wayland',=
 d)} \
>     +=C2=A0 =C2=A0 ${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)} \
>     =C2=A0"
>
>     =C2=A0PACKAGECONFIG[x11] =3D "-Dwith_x11=3Dyes,-Dwith_x11=3Dno,virt=
ual/libx11
>     libxext libxfixes"
>     =C2=A0PACKAGECONFIG[glx] =3D "-Dwith_glx=3Dyes,-Dwith_glx=3Dno,virt=
ual/mesa"
>
>     -PACKAGECONFIG[wayland] =3D
>     "-Dwith_wayland=3Dyes,-Dwith_wayland=3Dno,wayland-native wayland"
>     -
>     =C2=A0PACKAGES =3D+ "${PN}-x11 ${PN}-glx ${PN}-wayland"
>
>     =C2=A0RDEPENDS:${PN}-x11 =3D+ "${PN}"
>     --=20
>     2.25.1
>
>
>
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#159524): https://lists.openembedded.org/g/openembed=
ded-core/message/159524
> Mute This Topic: https://lists.openembedded.org/mt/87636241/3618223
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
f_l_k@t-online.de]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

--------------52072EF7BAB517AE3DFE00F4
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html>
  <head>
    <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF=
-8">
  </head>
  <body>
    <p><font face=3D"Liberation Sans">Thats strange indeed. Wayland is se=
t
        as a DISTRO_FEATURE for my image, so it gets built by a lot of</f=
ont><font
        face=3D"Liberation Sans"> packages. This wasn't a clean build, i
        had sstate cache availbale when i started to experiment with
        libva and normally it doesn't get=C2=A0 built inside my image bec=
ause
        i can't use it on my board. First i did 'bitbake libva' and this
        succeeded. Second i added 'va' PACKAGECONFIG to a mesa.bbappend
        and started rebuilding the image. Now the build for
        libva-initial was started and failed with the error about
        missing wayland-scanner.</font></p>
    <p><font face=3D"Liberation Sans">I also wondered what is pulling=C2=A0
        wayland into=C2=A0 its sysroot . Did 'bitbake -c cleanstate
        libva-initial libva' and tried to build libva-initial again with
        'bitbake libva-initial' and had the same issue. On my machine
        this is reproducible<br>
      </font></p>
    <p><font face=3D"Liberation Sans">Markus<br>
      </font></p>
    <div class=3D"moz-cite-prefix">Am 10.12.21 um 15:06 schrieb Alexander
      Kanavin:<br>
    </div>
    <blockquote type=3D"cite"
cite=3D"mid:CANNYZj9YbZJxLADiti4fzsCex06DK9RUk4G-y3ARb3tLgkW9=3Dw@mail.gm=
ail.com">
      <meta http-equiv=3D"content-type" content=3D"text/html; charset=3DU=
TF-8">
      <div dir=3D"ltr">
        <div>
          | Run-time dependency wayland-client found: YES 1.19.0</div>
        <div><br>
        </div>
        <div>Can you please explain how the issue can be reproduced? I
          find it odd that libva-initial (which only needs libdrm, and
          is required by mesa) has wayland in its sysroot in your build
          - where does that come from? There's a chance the problem is
          elsewhere.<br>
        </div>
        <div><br>
        </div>
        <div>Alex<br>
        </div>
      </div>
      <br>
      <div class=3D"gmail_quote">
        <div dir=3D"ltr" class=3D"gmail_attr">On Fri, 10 Dec 2021 at 15:0=
3,
          Markus Volk &lt;<a href=3D"mailto:f_l_k@t-online.de"
            moz-do-not-send=3D"true">f_l_k@t-online.de</a>&gt; wrote:<br>
        </div>
        <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px
          0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=
I
          encountered an error while trying to build libva under
          wayland. libva-initial<br>
          was missing wayland-native dependency and failed like this:<br>
          <br>
          | Run-time dependency xfixes found: NO (tried pkgconfig and
          cmake)<br>
          | Run-time dependency wayland-client found: YES 1.19.0<br>
          | Program wayland-scanner /usr/bin/wayland-scanner found: NO<br=
>
          |<br>
          | ../libva-2.13.0/meson.build:107:4: ERROR: Program
          'wayland-scanner /usr/bin/wayland-scanner' not found<br>
          |<br>
          | A full log can be found at
/home/flk/build/poky/build-rock/tmp/work/cortexa72-cortexa53-crypto-poky-=
linux/libva-initial/2.13.0-r0/build/meson-logs/meson-log.txt<br>
          | ERROR: meson failed<br>
          | WARNING: exit code 1 from a shell command.<br>
          <br>
          This commit moves the PACKAGECONFIG[wayland] to libva.inc to
          make it available to libva-initial also<br>
          <br>
          Signed-off-by: MarkusVolk &lt;<a
            href=3D"mailto:f_l_k@t-online.de" target=3D"_blank"
            moz-do-not-send=3D"true">f_l_k@t-online.de</a>&gt;<br>
          ---<br>
          =C2=A0meta/recipes-graphics/libva/libva.inc=C2=A0 =C2=A0 =C2=A0=
 =C2=A0| 7 +++++++<br>
          =C2=A0meta/recipes-graphics/libva/<a href=3D"http://libva_2.13.=
0.bb"
            rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true"=
>libva_2.13.0.bb</a>
          | 4 +---<br>
          =C2=A02 files changed, 8 insertions(+), 3 deletions(-)<br>
          <br>
          diff --git a/meta/recipes-graphics/libva/libva.inc
          b/meta/recipes-graphics/libva/libva.inc<br>
          index bcf9757c1a..0e2721e291 100644<br>
          --- a/meta/recipes-graphics/libva/libva.inc<br>
          +++ b/meta/recipes-graphics/libva/libva.inc<br>
          @@ -27,3 +27,10 @@ UPSTREAM_CHECK_URI =3D "<a
            href=3D"https://github.com/intel/libva/releases"
            rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true"=
>https://github.com/intel/libva/releases</a>"<br>
          =C2=A0DEPENDS =3D "libdrm"<br>
          <br>
          =C2=A0inherit meson pkgconfig<br>
          +<br>
          +PACKAGECONFIG:append =3D " \<br>
          +=C2=A0 =C2=A0 ${@bb.utils.filter('DISTRO_FEATURES', 'wayland',=
 d)} \<br>
          +"<br>
          +<br>
          +PACKAGECONFIG[wayland] =3D
          "-Dwith_wayland=3Dyes,-Dwith_wayland=3Dno,wayland-native waylan=
d"<br>
          +<br>
          diff --git a/meta/recipes-graphics/libva/<a
            href=3D"http://libva_2.13.0.bb" rel=3D"noreferrer"
            target=3D"_blank" moz-do-not-send=3D"true">libva_2.13.0.bb</a=
>
          b/meta/recipes-graphics/libva/<a href=3D"http://libva_2.13.0.bb=
"
            rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true"=
>libva_2.13.0.bb</a><br>
          index ed2be289fc..a8c6355b01 100644<br>
          --- a/meta/recipes-graphics/libva/<a
            href=3D"http://libva_2.13.0.bb" rel=3D"noreferrer"
            target=3D"_blank" moz-do-not-send=3D"true">libva_2.13.0.bb</a=
><br>
          +++ b/meta/recipes-graphics/libva/<a
            href=3D"http://libva_2.13.0.bb" rel=3D"noreferrer"
            target=3D"_blank" moz-do-not-send=3D"true">libva_2.13.0.bb</a=
><br>
          @@ -2,14 +2,12 @@ require libva.inc<br>
          <br>
          =C2=A0PACKAGECONFIG ??=3D " \<br>
          =C2=A0 =C2=A0 =C2=A0${@bb.utils.contains('DISTRO_FEATURES', 'x1=
1 opengl',
          'glx', '', d)} \<br>
          -=C2=A0 =C2=A0 ${@bb.utils.filter('DISTRO_FEATURES', 'x11 wayla=
nd', d)}
          \<br>
          +=C2=A0 =C2=A0 ${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)}=
 \<br>
          =C2=A0"<br>
          <br>
          =C2=A0PACKAGECONFIG[x11] =3D
          "-Dwith_x11=3Dyes,-Dwith_x11=3Dno,virtual/libx11 libxext
          libxfixes"<br>
          =C2=A0PACKAGECONFIG[glx] =3D
          "-Dwith_glx=3Dyes,-Dwith_glx=3Dno,virtual/mesa"<br>
          <br>
          -PACKAGECONFIG[wayland] =3D
          "-Dwith_wayland=3Dyes,-Dwith_wayland=3Dno,wayland-native waylan=
d"<br>
          -<br>
          =C2=A0PACKAGES =3D+ "${PN}-x11 ${PN}-glx ${PN}-wayland"<br>
          <br>
          =C2=A0RDEPENDS:${PN}-x11 =3D+ "${PN}"<br>
          -- <br>
          2.25.1<br>
          <br>
          <br>
          <br>
          <br>
        </blockquote>
      </div>
      <br>
      <fieldset class=3D"mimeAttachmentHeader"></fieldset>
      <pre class=3D"moz-quote-pre" wrap=3D"">
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#159524): <a class=3D"moz-txt-link-freetext" href=3D"h=
ttps://lists.openembedded.org/g/openembedded-core/message/159524">https:/=
/lists.openembedded.org/g/openembedded-core/message/159524</a>
Mute This Topic: <a class=3D"moz-txt-link-freetext" href=3D"https://lists=
.openembedded.org/mt/87636241/3618223">https://lists.openembedded.org/mt/=
87636241/3618223</a>
Group Owner: <a class=3D"moz-txt-link-abbreviated" href=3D"mailto:openemb=
edded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.op=
enembedded.org</a>
Unsubscribe: <a class=3D"moz-txt-link-freetext" href=3D"https://lists.ope=
nembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g=
/openembedded-core/unsub</a> [<a class=3D"moz-txt-link-abbreviated" href=3D=
"mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

</pre>
    </blockquote>
  </body>
</html>

--------------52072EF7BAB517AE3DFE00F4--

