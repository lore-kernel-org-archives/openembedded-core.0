Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48858C433EF
	for <webhook@archiver.kernel.org>; Sat, 11 Dec 2021 20:33:54 +0000 (UTC)
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com
 [209.85.222.47])
 by mx.groups.io with SMTP id smtpd.web08.26571.1639254833240081216
 for <openembedded-core@lists.openembedded.org>;
 Sat, 11 Dec 2021 12:33:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=BW/pPq4x;
 spf=pass (domain: gmail.com, ip: 209.85.222.47,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f47.google.com with SMTP id p2so22592317uad.11
        for <openembedded-core@lists.openembedded.org>;
 Sat, 11 Dec 2021 12:33:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=I2EeXaR5L4m4VKHJ9U08cLUJf033bmi9SwlpePu1MuU=;
        b=BW/pPq4xFB3JZCcxUHewBH/lnnLwIcAeoS+XMKj3lMovAW4a7P+JRaYffYMVtpM5jG
         J1Q7hesg8bD0wg40CbYovDAgw7wFw+i1yzv+5sBC8Z4NbMNPgqL5EuP+nkvwpNHnY6Il
         MtgmvHflJSTDO9sTPVvN6uGX8OU3pourunti+KEurIWk4o2xVZj4+9mHaY6ZFEqQ7i/7
         rhpCrkv3b+lP5xaII2rhAde1yMEiU/L7PwzWV71HYXSgZmJMAJEy/pr9neibkqst5Nre
         7vAK4f1q1PvFkVRQqxbEG4PJ96/WrZd1aB1werYEHgV4kqnVmYZFWCWRRnif4VOB/RuQ
         OWXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=I2EeXaR5L4m4VKHJ9U08cLUJf033bmi9SwlpePu1MuU=;
        b=SSEBADSilcrTZlJY+AxJxUxXnhvcufwC7/Bk/hjuaO6oT/Ln6r7Fproo0tYiq0pBv7
         pCVBAwApCcBfL3D/y8B7MJ2lylb1yRf2AeqHau7EJPonLxjwHbfVxHtRId12/hSoXPS8
         q/G+76vvaeBw0RzXErzmUdIsdD//CIVyb30TXjAaFhPtncV9P5eFdInTr59BR0uUAiOd
         zgLTRhJHwxx9Fdynan0uKEvAxmp9eZjsC8U5irbN5JGYE86AnTFOkRL7p6whw9Ef3yAo
         H6ZE+6T/Gn4INaVnCrA9Le5FmvYL7F95YVzRdrAzHyMxQJ7ZDp3af0RK9bgVoQ/WPp+q
         Ic7A==
X-Gm-Message-State: AOAM530q0RbvjwA9O8gOylVI4LLQEpAsOBYXtogeeqpB3ozQSRxkFlI3
	aDamgUSTmZ16AOeHohXtZQ2Rnq7FUvUNXuEQmZQ=
X-Google-Smtp-Source: 
 ABdhPJwD9WVWnK6ROTS6Qrq29xUKDLEPZ4SpSjWdru5vaTOa1w1OU8Sy+JG7TZr/Qa3cV5xHKQiC7Ud1wD6kUK4ftiY=
X-Received: by 2002:a05:6102:38d4:: with SMTP id
 k20mr21972281vst.42.1639254832287;
 Sat, 11 Dec 2021 12:33:52 -0800 (PST)
MIME-Version: 1.0
References: <20211210140234.3713-1-f_l_k@t-online.de>
 <CANNYZj9YbZJxLADiti4fzsCex06DK9RUk4G-y3ARb3tLgkW9=w@mail.gmail.com>
 <d95c3019-ae4b-f94c-fb34-ab9ac669b6e2@t-online.de>
 <CAMKF1srHmV5dy=vZigjUZf+7pOBOyqPu8myaQXcECpne6HmhJw@mail.gmail.com>
 <d7cad6f0-dee4-1946-e0de-9f2113cf9f4a@t-online.de>
 <CANNYZj9Ypym1V7NjoO_9fv-xnAdfwj4ecbfNTVdneDOXA8XTkQ@mail.gmail.com>
 <dd1b6214-3b44-b8c5-d0ae-f3323f2d6fb2@t-online.de>
In-Reply-To: <dd1b6214-3b44-b8c5-d0ae-f3323f2d6fb2@t-online.de>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sat, 11 Dec 2021 21:33:40 +0100
Message-ID: 
 <CANNYZj9Q4a+jA7gvadcCpL6WdiTPPkxx=_WPLb0YnWhWgYkAgw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] libva: move wayland PACKAGECONFIG to libva.inc
To: Markus Volk <f_l_k@t-online.de>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000f9954105d2e4c159"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 11 Dec 2021 20:33:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159574

--000000000000f9954105d2e4c159
Content-Type: text/plain; charset="UTF-8"

Looks good now, thanks :)

Alex

On Sat, 11 Dec 2021 at 17:40, Markus Volk <f_l_k@t-online.de> wrote:

> Thanks. I've sent a new patch
> Am 11.12.21 um 16:53 schrieb Alexander Kanavin:
>
> Right, then the correct fix is to move all PACKAGECONFIG options to
> libva.inc, then set
> PACKAGECONFIG ?= "" in libva-initial.
>
> Alex
>
> On Sat, 11 Dec 2021 at 11:00, Markus Volk <f_l_k@t-online.de> wrote:
>
>> I was able to narrow the issue down a little bit. I can reproduce it with
>> plain poky by adding this to local.conf
>>
>>
>> PACKAGECONFIG:append:pn-libdrm = " udev"
>> DISTRO_FEATURES:append = " systemd"
>>
>> and do
>>
>> 'bitbake libva-initial'
>>
>> Am 10.12.21 um 16:47 schrieb Khem Raj:
>>
>>
>>
>> On Fri, Dec 10, 2021 at 6:33 AM Markus Volk <f_l_k@t-online.de> wrote:
>>
>>> Thats strange indeed. Wayland is set as a DISTRO_FEATURE for my image,
>>> so it gets built by a lot of packages. This wasn't a clean build, i had
>>> sstate cache availbale when i started to experiment with libva and normally
>>> it doesn't get  built inside my image because i can't use it on my board.
>>> First i did 'bitbake libva' and this succeeded. Second i added 'va'
>>> PACKAGECONFIG to a mesa.bbappend and started rebuilding the image. Now the
>>> build for libva-initial was started and failed with the error about missing
>>> wayland-scanner.
>>>
>>> I also wondered what is pulling  wayland into  its sysroot . Did
>>> 'bitbake -c cleanstate libva-initial libva' and tried to build
>>> libva-initial again with 'bitbake libva-initial' and had the same issue. On
>>> my machine this is reproducible
>>>
>>
>> Post configure logs including meson run  logs for this package perhaps
>> there is some hint in there
>>
>>>
>>> Markus
>>> Am 10.12.21 um 15:06 schrieb Alexander Kanavin:
>>>
>>> | Run-time dependency wayland-client found: YES 1.19.0
>>>
>>> Can you please explain how the issue can be reproduced? I find it odd
>>> that libva-initial (which only needs libdrm, and is required by mesa) has
>>> wayland in its sysroot in your build - where does that come from? There's a
>>> chance the problem is elsewhere.
>>>
>>> Alex
>>>
>>> On Fri, 10 Dec 2021 at 15:03, Markus Volk <f_l_k@t-online.de> wrote:
>>>
>>>> I encountered an error while trying to build libva under wayland.
>>>> libva-initial
>>>> was missing wayland-native dependency and failed like this:
>>>>
>>>> | Run-time dependency xfixes found: NO (tried pkgconfig and cmake)
>>>> | Run-time dependency wayland-client found: YES 1.19.0
>>>> | Program wayland-scanner /usr/bin/wayland-scanner found: NO
>>>> |
>>>> | ../libva-2.13.0/meson.build:107:4: ERROR: Program 'wayland-scanner
>>>> /usr/bin/wayland-scanner' not found
>>>> |
>>>> | A full log can be found at
>>>> /home/flk/build/poky/build-rock/tmp/work/cortexa72-cortexa53-crypto-poky-linux/libva-initial/2.13.0-r0/build/meson-logs/meson-log.txt
>>>> | ERROR: meson failed
>>>> | WARNING: exit code 1 from a shell command.
>>>>
>>>> This commit moves the PACKAGECONFIG[wayland] to libva.inc to make it
>>>> available to libva-initial also
>>>>
>>>> Signed-off-by: MarkusVolk <f_l_k@t-online.de>
>>>> ---
>>>>  meta/recipes-graphics/libva/libva.inc       | 7 +++++++
>>>>  meta/recipes-graphics/libva/libva_2.13.0.bb | 4 +---
>>>>  2 files changed, 8 insertions(+), 3 deletions(-)
>>>>
>>>> diff --git a/meta/recipes-graphics/libva/libva.inc
>>>> b/meta/recipes-graphics/libva/libva.inc
>>>> index bcf9757c1a..0e2721e291 100644
>>>> --- a/meta/recipes-graphics/libva/libva.inc
>>>> +++ b/meta/recipes-graphics/libva/libva.inc
>>>> @@ -27,3 +27,10 @@ UPSTREAM_CHECK_URI = "
>>>> https://github.com/intel/libva/releases"
>>>>  DEPENDS = "libdrm"
>>>>
>>>>  inherit meson pkgconfig
>>>> +
>>>> +PACKAGECONFIG:append = " \
>>>> +    ${@bb.utils.filter('DISTRO_FEATURES', 'wayland', d)} \
>>>> +"
>>>> +
>>>> +PACKAGECONFIG[wayland] =
>>>> "-Dwith_wayland=yes,-Dwith_wayland=no,wayland-native wayland"
>>>> +
>>>> diff --git a/meta/recipes-graphics/libva/libva_2.13.0.bb
>>>> b/meta/recipes-graphics/libva/libva_2.13.0.bb
>>>> index ed2be289fc..a8c6355b01 100644
>>>> --- a/meta/recipes-graphics/libva/libva_2.13.0.bb
>>>> +++ b/meta/recipes-graphics/libva/libva_2.13.0.bb
>>>> @@ -2,14 +2,12 @@ require libva.inc
>>>>
>>>>  PACKAGECONFIG ??= " \
>>>>      ${@bb.utils.contains('DISTRO_FEATURES', 'x11 opengl', 'glx', '',
>>>> d)} \
>>>> -    ${@bb.utils.filter('DISTRO_FEATURES', 'x11 wayland', d)} \
>>>> +    ${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)} \
>>>>  "
>>>>
>>>>  PACKAGECONFIG[x11] = "-Dwith_x11=yes,-Dwith_x11=no,virtual/libx11
>>>> libxext libxfixes"
>>>>  PACKAGECONFIG[glx] = "-Dwith_glx=yes,-Dwith_glx=no,virtual/mesa"
>>>>
>>>> -PACKAGECONFIG[wayland] =
>>>> "-Dwith_wayland=yes,-Dwith_wayland=no,wayland-native wayland"
>>>> -
>>>>  PACKAGES =+ "${PN}-x11 ${PN}-glx ${PN}-wayland"
>>>>
>>>>  RDEPENDS:${PN}-x11 =+ "${PN}"
>>>> --
>>>> 2.25.1
>>>>
>>>>
>>>>
>>>>
>>>>
>>>
>>>
>>>
>>>
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#159561):
>> https://lists.openembedded.org/g/openembedded-core/message/159561
>> Mute This Topic: https://lists.openembedded.org/mt/87636241/1686489
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
>> alex.kanavin@gmail.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>
>>

--000000000000f9954105d2e4c159
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Looks good now, thanks :)</div><div><br></div><div>Al=
ex<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"=
gmail_attr">On Sat, 11 Dec 2021 at 17:40, Markus Volk &lt;<a href=3D"mailto=
:f_l_k@t-online.de">f_l_k@t-online.de</a>&gt; wrote:<br></div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex">
 =20
   =20
 =20
  <div>
    <p>Thanks. I&#39;ve sent a new patch<br>
    </p>
    <div>Am 11.12.21 um 16:53 schrieb Alexander
      Kanavin:<br>
    </div>
    <blockquote type=3D"cite">
     =20
      <div dir=3D"ltr">
        <div>Right, then the correct fix is to move all PACKAGECONFIG
          options to libva.inc, then set <br>
        </div>
        <div>PACKAGECONFIG ?=3D &quot;&quot; in libva-initial.</div>
        <div><br>
        </div>
        <div>Alex<br>
        </div>
      </div>
      <br>
      <div class=3D"gmail_quote">
        <div dir=3D"ltr" class=3D"gmail_attr">On Sat, 11 Dec 2021 at 11:00,
          Markus Volk &lt;<a href=3D"mailto:f_l_k@t-online.de" target=3D"_b=
lank">f_l_k@t-online.de</a>&gt; wrote:<br>
        </div>
        <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex">
          <div>
            <p>I was able to narrow the issue down a little bit. I can
              reproduce it with plain poky by adding this to local.conf<br>
            </p>
            <p><br>
              PACKAGECONFIG:append:pn-libdrm =3D &quot; udev&quot;<br>
              DISTRO_FEATURES:append =3D &quot; systemd&quot;<br>
            </p>
            <p>and do <br>
            </p>
            <p>&#39;bitbake libva-initial&#39;<br>
              <br>
            </p>
            <div>Am 10.12.21 um 16:47 schrieb Khem Raj:<br>
            </div>
            <blockquote type=3D"cite">
              <div><br>
              </div>
              <div><br>
                <div class=3D"gmail_quote">
                  <div dir=3D"ltr" class=3D"gmail_attr">On Fri, Dec 10, 202=
1
                    at 6:33 AM Markus Volk &lt;<a href=3D"mailto:f_l_k@t-on=
line.de" target=3D"_blank">f_l_k@t-online.de</a>&gt;
                    wrote:<br>
                  </div>
                  <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
                    <div>
                      <p><font face=3D"Liberation Sans">Thats strange
                          indeed. Wayland is set as a DISTRO_FEATURE for
                          my image, so it gets built by a lot of</font><fon=
t face=3D"Liberation Sans"> packages. This wasn&#39;t
                          a clean build, i had sstate cache availbale
                          when i started to experiment with libva and
                          normally it doesn&#39;t get=C2=A0 built inside my=
 image
                          because i can&#39;t use it on my board. First i
                          did &#39;bitbake libva&#39; and this succeeded. S=
econd
                          i added &#39;va&#39; PACKAGECONFIG to a mesa.bbap=
pend
                          and started rebuilding the image. Now the
                          build for libva-initial was started and failed
                          with the error about missing wayland-scanner.</fo=
nt></p>
                      <p><font face=3D"Liberation Sans">I also wondered
                          what is pulling=C2=A0 wayland into=C2=A0 its sysr=
oot .
                          Did &#39;bitbake -c cleanstate libva-initial
                          libva&#39; and tried to build libva-initial again
                          with &#39;bitbake libva-initial&#39; and had the =
same
                          issue. On my machine this is reproducible</font><=
/p>
                    </div>
                  </blockquote>
                  <div dir=3D"auto"><br>
                  </div>
                  <div dir=3D"auto">Post configure logs including meson
                    run =C2=A0logs for this package perhaps there is some
                    hint in there=C2=A0</div>
                  <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
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
                            from? There&#39;s a chance the problem is
                            elsewhere.<br>
                          </div>
                          <div><br>
                          </div>
                          <div>Alex<br>
                          </div>
                        </div>
                        <br>
                        <div class=3D"gmail_quote">
                          <div dir=3D"ltr" class=3D"gmail_attr">On Fri, 10
                            Dec 2021 at 15:03, Markus Volk &lt;<a href=3D"m=
ailto:f_l_k@t-online.de" target=3D"_blank">f_l_k@t-online.de</a>&gt;
                            wrote:<br>
                          </div>
                          <blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>I
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
                            Program &#39;wayland-scanner
                            /usr/bin/wayland-scanner&#39; not found<br>
                            |<br>
                            | A full log can be found at
/home/flk/build/poky/build-rock/tmp/work/cortexa72-cortexa53-crypto-poky-li=
nux/libva-initial/2.13.0-r0/build/meson-logs/meson-log.txt<br>
                            | ERROR: meson failed<br>
                            | WARNING: exit code 1 from a shell command.<br=
>
                            <br>
                            This commit moves the PACKAGECONFIG[wayland]
                            to libva.inc to make it available to
                            libva-initial also<br>
                            <br>
                            Signed-off-by: MarkusVolk &lt;<a href=3D"mailto=
:f_l_k@t-online.de" target=3D"_blank">f_l_k@t-online.de</a>&gt;<br>
                            ---<br>
                            =C2=A0meta/recipes-graphics/libva/libva.inc=C2=
=A0 =C2=A0 =C2=A0
                            =C2=A0| 7 +++++++<br>
                            =C2=A0meta/recipes-graphics/libva/<a href=3D"ht=
tp://libva_2.13.0.bb" rel=3D"noreferrer" target=3D"_blank">libva_2.13.0.bb<=
/a>
                            | 4 +---<br>
                            =C2=A02 files changed, 8 insertions(+), 3
                            deletions(-)<br>
                            <br>
                            diff --git
                            a/meta/recipes-graphics/libva/libva.inc
                            b/meta/recipes-graphics/libva/libva.inc<br>
                            index bcf9757c1a..0e2721e291 100644<br>
                            --- a/meta/recipes-graphics/libva/libva.inc<br>
                            +++ b/meta/recipes-graphics/libva/libva.inc<br>
                            @@ -27,3 +27,10 @@ UPSTREAM_CHECK_URI =3D &quot=
;<a href=3D"https://github.com/intel/libva/releases" rel=3D"noreferrer" tar=
get=3D"_blank">https://github.com/intel/libva/releases</a>&quot;<br>
                            =C2=A0DEPENDS =3D &quot;libdrm&quot;<br>
                            <br>
                            =C2=A0inherit meson pkgconfig<br>
                            +<br>
                            +PACKAGECONFIG:append =3D &quot; \<br>
                            +=C2=A0 =C2=A0 ${@bb.utils.filter(&#39;DISTRO_F=
EATURES&#39;,
                            &#39;wayland&#39;, d)} \<br>
                            +&quot;<br>
                            +<br>
                            +PACKAGECONFIG[wayland] =3D
                            &quot;-Dwith_wayland=3Dyes,-Dwith_wayland=3Dno,=
wayland-native
                            wayland&quot;<br>
                            +<br>
                            diff --git a/meta/recipes-graphics/libva/<a hre=
f=3D"http://libva_2.13.0.bb" rel=3D"noreferrer" target=3D"_blank">libva_2.1=
3.0.bb</a>
                            b/meta/recipes-graphics/libva/<a href=3D"http:/=
/libva_2.13.0.bb" rel=3D"noreferrer" target=3D"_blank">libva_2.13.0.bb</a><=
br>
                            index ed2be289fc..a8c6355b01 100644<br>
                            --- a/meta/recipes-graphics/libva/<a href=3D"ht=
tp://libva_2.13.0.bb" rel=3D"noreferrer" target=3D"_blank">libva_2.13.0.bb<=
/a><br>
                            +++ b/meta/recipes-graphics/libva/<a href=3D"ht=
tp://libva_2.13.0.bb" rel=3D"noreferrer" target=3D"_blank">libva_2.13.0.bb<=
/a><br>
                            @@ -2,14 +2,12 @@ require libva.inc<br>
                            <br>
                            =C2=A0PACKAGECONFIG ??=3D &quot; \<br>
                            =C2=A0 =C2=A0 =C2=A0${@bb.utils.contains(&#39;D=
ISTRO_FEATURES&#39;,
                            &#39;x11 opengl&#39;, &#39;glx&#39;, &#39;&#39;=
, d)} \<br>
                            -=C2=A0 =C2=A0 ${@bb.utils.filter(&#39;DISTRO_F=
EATURES&#39;,
                            &#39;x11 wayland&#39;, d)} \<br>
                            +=C2=A0 =C2=A0 ${@bb.utils.filter(&#39;DISTRO_F=
EATURES&#39;,
                            &#39;x11&#39;, d)} \<br>
                            =C2=A0&quot;<br>
                            <br>
                            =C2=A0PACKAGECONFIG[x11] =3D
                            &quot;-Dwith_x11=3Dyes,-Dwith_x11=3Dno,virtual/=
libx11
                            libxext libxfixes&quot;<br>
                            =C2=A0PACKAGECONFIG[glx] =3D
                            &quot;-Dwith_glx=3Dyes,-Dwith_glx=3Dno,virtual/=
mesa&quot;<br>
                            <br>
                            -PACKAGECONFIG[wayland] =3D
                            &quot;-Dwith_wayland=3Dyes,-Dwith_wayland=3Dno,=
wayland-native
                            wayland&quot;<br>
                            -<br>
                            =C2=A0PACKAGES =3D+ &quot;${PN}-x11 ${PN}-glx
                            ${PN}-wayland&quot;<br>
                            <br>
                            =C2=A0RDEPENDS:${PN}-x11 =3D+ &quot;${PN}&quot;=
<br>
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
          View/Reply Online (#159561): <a href=3D"https://lists.openembedde=
d.org/g/openembedded-core/message/159561" rel=3D"noreferrer" target=3D"_bla=
nk">https://lists.openembedded.org/g/openembedded-core/message/159561</a><b=
r>
          Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/876=
36241/1686489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembed=
ded.org/mt/87636241/1686489</a><br>
          Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.op=
enembedded.org" target=3D"_blank">openembedded-core+owner@lists.openembedde=
d.org</a><br>
          Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembe=
dded-core/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openemb=
edded.org/g/openembedded-core/unsub</a>
          [<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex=
.kanavin@gmail.com</a>]<br>
          -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
          <br>
        </blockquote>
      </div>
    </blockquote>
  </div>

</blockquote></div>

--000000000000f9954105d2e4c159--

