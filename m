Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F4B8C433EF
	for <webhook@archiver.kernel.org>; Sat, 11 Dec 2021 16:40:13 +0000 (UTC)
Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by mx.groups.io with SMTP id smtpd.web08.23657.1639240812052989446
 for <openembedded-core@lists.openembedded.org>;
 Sat, 11 Dec 2021 08:40:12 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.81,
 mailfrom: f_l_k@t-online.de)
Received: from fwd88.dcpf.telekom.de (fwd88.aul.t-online.de [10.223.144.114])
	by mailout03.t-online.de (Postfix) with SMTP id 7E71E2C38;
	Sat, 11 Dec 2021 17:36:45 +0100 (CET)
Received: from [192.168.178.83] ([84.163.37.8]) by fwd88.t-online.de
	with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
	esmtp id 1mw5Mb-2LDCHB0; Sat, 11 Dec 2021 17:36:45 +0100
Subject: Re: [OE-core] [PATCH] libva: move wayland PACKAGECONFIG to libva.inc
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
References: <20211210140234.3713-1-f_l_k@t-online.de>
 <CANNYZj9YbZJxLADiti4fzsCex06DK9RUk4G-y3ARb3tLgkW9=w@mail.gmail.com>
 <d95c3019-ae4b-f94c-fb34-ab9ac669b6e2@t-online.de>
 <CAMKF1srHmV5dy=vZigjUZf+7pOBOyqPu8myaQXcECpne6HmhJw@mail.gmail.com>
 <d7cad6f0-dee4-1946-e0de-9f2113cf9f4a@t-online.de>
 <CANNYZj9Ypym1V7NjoO_9fv-xnAdfwj4ecbfNTVdneDOXA8XTkQ@mail.gmail.com>
From: Markus Volk <f_l_k@t-online.de>
Message-ID: <dd1b6214-3b44-b8c5-d0ae-f3323f2d6fb2@t-online.de>
Date: Sat, 11 Dec 2021 17:36:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: 
 <CANNYZj9Ypym1V7NjoO_9fv-xnAdfwj4ecbfNTVdneDOXA8XTkQ@mail.gmail.com>
Content-Type: multipart/alternative;
 boundary="------------D3DACBC27B6FBB507001B0E2"
Content-Language: en-US
X-TOI-EXPURGATEID: 150726::1639240605-00001485-EAF6FB80/0/0 CLEAN NORMAL
X-TOI-MSGID: 90110322-c019-475b-b465-9f50e9df60ef
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 11 Dec 2021 16:40:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159572

This is a multi-part message in MIME format.
--------------D3DACBC27B6FBB507001B0E2
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

Thanks. I've sent a new patch

Am 11.12.21 um 16:53 schrieb Alexander Kanavin:
> Right, then the correct fix is to move all PACKAGECONFIG options to=20
> libva.inc, then set
> PACKAGECONFIG ?=3D "" in libva-initial.
>
> Alex
>
> On Sat, 11 Dec 2021 at 11:00, Markus Volk <f_l_k@t-online.de=20
> <mailto:f_l_k@t-online.de>> wrote:
>
>     I was able to narrow the issue down a little bit. I can reproduce
>     it with plain poky by adding this to local.conf
>
>
>     PACKAGECONFIG:append:pn-libdrm =3D " udev"
>     DISTRO_FEATURES:append =3D " systemd"
>
>     and do
>
>     'bitbake libva-initial'
>
>     Am 10.12.21 um 16:47 schrieb Khem Raj:
>>
>>
>>     On Fri, Dec 10, 2021 at 6:33 AM Markus Volk <f_l_k@t-online.de
>>     <mailto:f_l_k@t-online.de>> wrote:
>>
>>         Thats strange indeed. Wayland is set as a DISTRO_FEATURE for
>>         my image, so it gets built by a lot ofpackages. This wasn't a
>>         clean build, i had sstate cache availbale when i started to
>>         experiment with libva and normally it doesn't get=C2=A0 built
>>         inside my image because i can't use it on my board. First i
>>         did 'bitbake libva' and this succeeded. Second i added 'va'
>>         PACKAGECONFIG to a mesa.bbappend and started rebuilding the
>>         image. Now the build for libva-initial was started and failed
>>         with the error about missing wayland-scanner.
>>
>>         I also wondered what is pulling=C2=A0 wayland into=C2=A0 its s=
ysroot .
>>         Did 'bitbake -c cleanstate libva-initial libva' and tried to
>>         build libva-initial again with 'bitbake libva-initial' and
>>         had the same issue. On my machine this is reproducible
>>
>>
>>     Post configure logs including meson run =C2=A0logs for this packag=
e
>>     perhaps there is some hint in there
>>
>>
>>         Markus
>>
>>         Am 10.12.21 um 15:06 schrieb Alexander Kanavin:
>>>         | Run-time dependency wayland-client found: YES 1.19.0
>>>
>>>         Can you please explain how the issue can be reproduced? I
>>>         find it odd that libva-initial (which only needs libdrm, and
>>>         is required by mesa) has wayland in its sysroot in your
>>>         build - where does that come from? There's a chance the
>>>         problem is elsewhere.
>>>
>>>         Alex
>>>
>>>         On Fri, 10 Dec 2021 at 15:03, Markus Volk <f_l_k@t-online.de
>>>         <mailto:f_l_k@t-online.de>> wrote:
>>>
>>>             I encountered an error while trying to build libva under
>>>             wayland. libva-initial
>>>             was missing wayland-native dependency and failed like thi=
s:
>>>
>>>             | Run-time dependency xfixes found: NO (tried pkgconfig
>>>             and cmake)
>>>             | Run-time dependency wayland-client found: YES 1.19.0
>>>             | Program wayland-scanner /usr/bin/wayland-scanner found:=
 NO
>>>             |
>>>             | ../libva-2.13.0/meson.build:107:4: ERROR: Program
>>>             'wayland-scanner /usr/bin/wayland-scanner' not found
>>>             |
>>>             | A full log can be found at
>>>             /home/flk/build/poky/build-rock/tmp/work/cortexa72-cortex=
a53-crypto-poky-linux/libva-initial/2.13.0-r0/build/meson-logs/meson-log.=
txt
>>>             | ERROR: meson failed
>>>             | WARNING: exit code 1 from a shell command.
>>>
>>>             This commit moves the PACKAGECONFIG[wayland] to
>>>             libva.inc to make it available to libva-initial also
>>>
>>>             Signed-off-by: MarkusVolk <f_l_k@t-online.de
>>>             <mailto:f_l_k@t-online.de>>
>>>             ---
>>>             =C2=A0meta/recipes-graphics/libva/libva.inc =C2=A0| 7 +++=
++++
>>>             =C2=A0meta/recipes-graphics/libva/libva_2.13.0.bb
>>>             <http://libva_2.13.0.bb> | 4 +---
>>>             =C2=A02 files changed, 8 insertions(+), 3 deletions(-)
>>>
>>>             diff --git a/meta/recipes-graphics/libva/libva.inc
>>>             b/meta/recipes-graphics/libva/libva.inc
>>>             index bcf9757c1a..0e2721e291 100644
>>>             --- a/meta/recipes-graphics/libva/libva.inc
>>>             +++ b/meta/recipes-graphics/libva/libva.inc
>>>             @@ -27,3 +27,10 @@ UPSTREAM_CHECK_URI =3D
>>>             "https://github.com/intel/libva/releases
>>>             <https://github.com/intel/libva/releases>"
>>>             =C2=A0DEPENDS =3D "libdrm"
>>>
>>>             =C2=A0inherit meson pkgconfig
>>>             +
>>>             +PACKAGECONFIG:append =3D " \
>>>             +=C2=A0 =C2=A0 ${@bb.utils.filter('DISTRO_FEATURES', 'way=
land', d)} \
>>>             +"
>>>             +
>>>             +PACKAGECONFIG[wayland] =3D
>>>             "-Dwith_wayland=3Dyes,-Dwith_wayland=3Dno,wayland-native
>>>             wayland"
>>>             +
>>>             diff --git a/meta/recipes-graphics/libva/libva_2.13.0.bb
>>>             <http://libva_2.13.0.bb>
>>>             b/meta/recipes-graphics/libva/libva_2.13.0.bb
>>>             <http://libva_2.13.0.bb>
>>>             index ed2be289fc..a8c6355b01 100644
>>>             --- a/meta/recipes-graphics/libva/libva_2.13.0.bb
>>>             <http://libva_2.13.0.bb>
>>>             +++ b/meta/recipes-graphics/libva/libva_2.13.0.bb
>>>             <http://libva_2.13.0.bb>
>>>             @@ -2,14 +2,12 @@ require libva.inc
>>>
>>>             =C2=A0PACKAGECONFIG ??=3D " \
>>>             =C2=A0 =C2=A0 =C2=A0${@bb.utils.contains('DISTRO_FEATURES=
', 'x11
>>>             opengl', 'glx', '', d)} \
>>>             -=C2=A0 =C2=A0 ${@bb.utils.filter('DISTRO_FEATURES', 'x11
>>>             wayland', d)} \
>>>             +=C2=A0 =C2=A0 ${@bb.utils.filter('DISTRO_FEATURES', 'x11=
', d)} \
>>>             =C2=A0"
>>>
>>>             =C2=A0PACKAGECONFIG[x11] =3D
>>>             "-Dwith_x11=3Dyes,-Dwith_x11=3Dno,virtual/libx11 libxext
>>>             libxfixes"
>>>             =C2=A0PACKAGECONFIG[glx] =3D
>>>             "-Dwith_glx=3Dyes,-Dwith_glx=3Dno,virtual/mesa"
>>>
>>>             -PACKAGECONFIG[wayland] =3D
>>>             "-Dwith_wayland=3Dyes,-Dwith_wayland=3Dno,wayland-native
>>>             wayland"
>>>             -
>>>             =C2=A0PACKAGES =3D+ "${PN}-x11 ${PN}-glx ${PN}-wayland"
>>>
>>>             =C2=A0RDEPENDS:${PN}-x11 =3D+ "${PN}"
>>>             --=20
>>>             2.25.1
>>>
>>>
>>>
>>>
>>>
>>
>>
>>
>>
>
>     -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>     Links: You receive all messages sent to this group.
>     View/Reply Online (#159561):
>     https://lists.openembedded.org/g/openembedded-core/message/159561
>     <https://lists.openembedded.org/g/openembedded-core/message/159561>
>     Mute This Topic:
>     https://lists.openembedded.org/mt/87636241/1686489
>     <https://lists.openembedded.org/mt/87636241/1686489>
>     Group Owner: openembedded-core+owner@lists.openembedded.org
>     <mailto:openembedded-core%2Bowner@lists.openembedded.org>
>     Unsubscribe:
>     https://lists.openembedded.org/g/openembedded-core/unsub
>     <https://lists.openembedded.org/g/openembedded-core/unsub>
>     [alex.kanavin@gmail.com <mailto:alex.kanavin@gmail.com>]
>     -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

--------------D3DACBC27B6FBB507001B0E2
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html>
  <head>
    <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF=
-8">
  </head>
  <body>
    <p>Thanks. I've sent a new patch<br>
    </p>
    <div class=3D"moz-cite-prefix">Am 11.12.21 um 16:53 schrieb Alexander
      Kanavin:<br>
    </div>
    <blockquote type=3D"cite"
cite=3D"mid:CANNYZj9Ypym1V7NjoO_9fv-xnAdfwj4ecbfNTVdneDOXA8XTkQ@mail.gmai=
l.com">
      <meta http-equiv=3D"content-type" content=3D"text/html; charset=3DU=
TF-8">
      <div dir=3D"ltr">
        <div>Right, then the correct fix is to move all PACKAGECONFIG
          options to libva.inc, then set <br>
        </div>
        <div>PACKAGECONFIG ?=3D "" in libva-initial.</div>
        <div><br>
        </div>
        <div>Alex<br>
        </div>
      </div>
      <br>
      <div class=3D"gmail_quote">
        <div dir=3D"ltr" class=3D"gmail_attr">On Sat, 11 Dec 2021 at 11:0=
0,
          Markus Volk &lt;<a href=3D"mailto:f_l_k@t-online.de"
            moz-do-not-send=3D"true">f_l_k@t-online.de</a>&gt; wrote:<br>
        </div>
        <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px
          0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
          <div>
            <p>I was able to narrow the issue down a little bit. I can
              reproduce it with plain poky by adding this to local.conf<b=
r>
            </p>
            <p><br>
              PACKAGECONFIG:append:pn-libdrm =3D " udev"<br>
              DISTRO_FEATURES:append =3D " systemd"<br>
            </p>
            <p>and do <br>
            </p>
            <p>'bitbake libva-initial'<br>
              <br>
            </p>
            <div>Am 10.12.21 um 16:47 schrieb Khem Raj:<br>
            </div>
            <blockquote type=3D"cite">
              <div><br>
              </div>
              <div><br>
                <div class=3D"gmail_quote">
                  <div dir=3D"ltr" class=3D"gmail_attr">On Fri, Dec 10, 2=
021
                    at 6:33 AM Markus Volk &lt;<a
                      href=3D"mailto:f_l_k@t-online.de" target=3D"_blank"
                      moz-do-not-send=3D"true">f_l_k@t-online.de</a>&gt;
                    wrote:<br>
                  </div>
                  <blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px
                    0px 0.8ex;border-left:1px solid
                    rgb(204,204,204);padding-left:1ex">
                    <div>
                      <p><font face=3D"Liberation Sans">Thats strange
                          indeed. Wayland is set as a DISTRO_FEATURE for
                          my image, so it gets built by a lot of</font><f=
ont
                          face=3D"Liberation Sans"> packages. This wasn't
                          a clean build, i had sstate cache availbale
                          when i started to experiment with libva and
                          normally it doesn't get=C2=A0 built inside my i=
mage
                          because i can't use it on my board. First i
                          did 'bitbake libva' and this succeeded. Second
                          i added 'va' PACKAGECONFIG to a mesa.bbappend
                          and started rebuilding the image. Now the
                          build for libva-initial was started and failed
                          with the error about missing wayland-scanner.</=
font></p>
                      <p><font face=3D"Liberation Sans">I also wondered
                          what is pulling=C2=A0 wayland into=C2=A0 its sy=
sroot .
                          Did 'bitbake -c cleanstate libva-initial
                          libva' and tried to build libva-initial again
                          with 'bitbake libva-initial' and had the same
                          issue. On my machine this is reproducible</font=
></p>
                    </div>
                  </blockquote>
                  <div dir=3D"auto"><br>
                  </div>
                  <div dir=3D"auto">Post configure logs including meson
                    run =C2=A0logs for this package perhaps there is some
                    hint in there=C2=A0</div>
                  <blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px
                    0px 0.8ex;border-left:1px solid
                    rgb(204,204,204);padding-left:1ex">
                    <div>
                      <p dir=3D"auto"><font face=3D"Liberation Sans"><br>
                        </font></p>
                      <p><font face=3D"Liberation Sans">Markus<br>
                        </font></p>
                      <div>Am 10.12.21 um 15:06 schrieb Alexander
                        Kanavin:<br>
                      </div>
                    </div>
                    <div>
                      <blockquote type=3D"cite">
                        <div dir=3D"ltr">
                          <div> | Run-time dependency wayland-client
                            found: YES 1.19.0</div>
                          <div><br>
                          </div>
                          <div>Can you please explain how the issue can
                            be reproduced? I find it odd that
                            libva-initial (which only needs libdrm, and
                            is required by mesa) has wayland in its
                            sysroot in your build - where does that come
                            from? There's a chance the problem is
                            elsewhere.<br>
                          </div>
                          <div><br>
                          </div>
                          <div>Alex<br>
                          </div>
                        </div>
                        <br>
                        <div class=3D"gmail_quote">
                          <div dir=3D"ltr" class=3D"gmail_attr">On Fri, 1=
0
                            Dec 2021 at 15:03, Markus Volk &lt;<a
                              href=3D"mailto:f_l_k@t-online.de"
                              target=3D"_blank" moz-do-not-send=3D"true">=
f_l_k@t-online.de</a>&gt;
                            wrote:<br>
                          </div>
                          <blockquote class=3D"gmail_quote"
                            style=3D"margin:0px 0px 0px
                            0.8ex;border-left:1px solid
                            rgb(204,204,204);padding-left:1ex">I
                            encountered an error while trying to build
                            libva under wayland. libva-initial<br>
                            was missing wayland-native dependency and
                            failed like this:<br>
                            <br>
                            | Run-time dependency xfixes found: NO
                            (tried pkgconfig and cmake)<br>
                            | Run-time dependency wayland-client found:
                            YES 1.19.0<br>
                            | Program wayland-scanner
                            /usr/bin/wayland-scanner found: NO<br>
                            |<br>
                            | ../libva-2.13.0/meson.build:107:4: ERROR:
                            Program 'wayland-scanner
                            /usr/bin/wayland-scanner' not found<br>
                            |<br>
                            | A full log can be found at
/home/flk/build/poky/build-rock/tmp/work/cortexa72-cortexa53-crypto-poky-=
linux/libva-initial/2.13.0-r0/build/meson-logs/meson-log.txt<br>
                            | ERROR: meson failed<br>
                            | WARNING: exit code 1 from a shell command.<=
br>
                            <br>
                            This commit moves the PACKAGECONFIG[wayland]
                            to libva.inc to make it available to
                            libva-initial also<br>
                            <br>
                            Signed-off-by: MarkusVolk &lt;<a
                              href=3D"mailto:f_l_k@t-online.de"
                              target=3D"_blank" moz-do-not-send=3D"true">=
f_l_k@t-online.de</a>&gt;<br>
                            ---<br>
                            =C2=A0meta/recipes-graphics/libva/libva.inc=C2=
=A0 =C2=A0 =C2=A0
                            =C2=A0| 7 +++++++<br>
                            =C2=A0meta/recipes-graphics/libva/<a
                              href=3D"http://libva_2.13.0.bb"
                              rel=3D"noreferrer" target=3D"_blank"
                              moz-do-not-send=3D"true">libva_2.13.0.bb</a=
>
                            | 4 +---<br>
                            =C2=A02 files changed, 8 insertions(+), 3
                            deletions(-)<br>
                            <br>
                            diff --git
                            a/meta/recipes-graphics/libva/libva.inc
                            b/meta/recipes-graphics/libva/libva.inc<br>
                            index bcf9757c1a..0e2721e291 100644<br>
                            --- a/meta/recipes-graphics/libva/libva.inc<b=
r>
                            +++ b/meta/recipes-graphics/libva/libva.inc<b=
r>
                            @@ -27,3 +27,10 @@ UPSTREAM_CHECK_URI =3D "<a
href=3D"https://github.com/intel/libva/releases" rel=3D"noreferrer"
                              target=3D"_blank" moz-do-not-send=3D"true">=
https://github.com/intel/libva/releases</a>"<br>
                            =C2=A0DEPENDS =3D "libdrm"<br>
                            <br>
                            =C2=A0inherit meson pkgconfig<br>
                            +<br>
                            +PACKAGECONFIG:append =3D " \<br>
                            +=C2=A0 =C2=A0 ${@bb.utils.filter('DISTRO_FEA=
TURES',
                            'wayland', d)} \<br>
                            +"<br>
                            +<br>
                            +PACKAGECONFIG[wayland] =3D
                            "-Dwith_wayland=3Dyes,-Dwith_wayland=3Dno,way=
land-native
                            wayland"<br>
                            +<br>
                            diff --git a/meta/recipes-graphics/libva/<a
                              href=3D"http://libva_2.13.0.bb"
                              rel=3D"noreferrer" target=3D"_blank"
                              moz-do-not-send=3D"true">libva_2.13.0.bb</a=
>
                            b/meta/recipes-graphics/libva/<a
                              href=3D"http://libva_2.13.0.bb"
                              rel=3D"noreferrer" target=3D"_blank"
                              moz-do-not-send=3D"true">libva_2.13.0.bb</a=
><br>
                            index ed2be289fc..a8c6355b01 100644<br>
                            --- a/meta/recipes-graphics/libva/<a
                              href=3D"http://libva_2.13.0.bb"
                              rel=3D"noreferrer" target=3D"_blank"
                              moz-do-not-send=3D"true">libva_2.13.0.bb</a=
><br>
                            +++ b/meta/recipes-graphics/libva/<a
                              href=3D"http://libva_2.13.0.bb"
                              rel=3D"noreferrer" target=3D"_blank"
                              moz-do-not-send=3D"true">libva_2.13.0.bb</a=
><br>
                            @@ -2,14 +2,12 @@ require libva.inc<br>
                            <br>
                            =C2=A0PACKAGECONFIG ??=3D " \<br>
                            =C2=A0 =C2=A0 =C2=A0${@bb.utils.contains('DIS=
TRO_FEATURES',
                            'x11 opengl', 'glx', '', d)} \<br>
                            -=C2=A0 =C2=A0 ${@bb.utils.filter('DISTRO_FEA=
TURES',
                            'x11 wayland', d)} \<br>
                            +=C2=A0 =C2=A0 ${@bb.utils.filter('DISTRO_FEA=
TURES',
                            'x11', d)} \<br>
                            =C2=A0"<br>
                            <br>
                            =C2=A0PACKAGECONFIG[x11] =3D
                            "-Dwith_x11=3Dyes,-Dwith_x11=3Dno,virtual/lib=
x11
                            libxext libxfixes"<br>
                            =C2=A0PACKAGECONFIG[glx] =3D
                            "-Dwith_glx=3Dyes,-Dwith_glx=3Dno,virtual/mes=
a"<br>
                            <br>
                            -PACKAGECONFIG[wayland] =3D
                            "-Dwith_wayland=3Dyes,-Dwith_wayland=3Dno,way=
land-native
                            wayland"<br>
                            -<br>
                            =C2=A0PACKAGES =3D+ "${PN}-x11 ${PN}-glx
                            ${PN}-wayland"<br>
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
                        <fieldset></fieldset>
                      </blockquote>
                    </div>
                    <br>
                    <br>
                    <br>
                  </blockquote>
                </div>
              </div>
              <br>
              <fieldset></fieldset>
            </blockquote>
          </div>
          <br>
          -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
          Links: You receive all messages sent to this group.<br>
          View/Reply Online (#159561): <a
            href=3D"https://lists.openembedded.org/g/openembedded-core/me=
ssage/159561"
            rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true"=
>https://lists.openembedded.org/g/openembedded-core/message/159561</a><br=
>
          Mute This Topic: <a
            href=3D"https://lists.openembedded.org/mt/87636241/1686489"
            rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true"=
>https://lists.openembedded.org/mt/87636241/1686489</a><br>
          Group Owner: <a
            href=3D"mailto:openembedded-core%2Bowner@lists.openembedded.o=
rg"
            target=3D"_blank" moz-do-not-send=3D"true">openembedded-core+=
owner@lists.openembedded.org</a><br>
          Unsubscribe: <a
            href=3D"https://lists.openembedded.org/g/openembedded-core/un=
sub"
            rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true"=
>https://lists.openembedded.org/g/openembedded-core/unsub</a>
          [<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank"
            moz-do-not-send=3D"true">alex.kanavin@gmail.com</a>]<br>
          -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
          <br>
        </blockquote>
      </div>
    </blockquote>
  </body>
</html>

--------------D3DACBC27B6FBB507001B0E2--

