Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CEF8C433EF
	for <webhook@archiver.kernel.org>; Wed,  1 Dec 2021 08:36:51 +0000 (UTC)
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com
 [209.85.222.42])
 by mx.groups.io with SMTP id smtpd.web08.89246.1638347810090570113
 for <Openembedded-core@lists.openembedded.org>;
 Wed, 01 Dec 2021 00:36:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ivMKK0GX;
 spf=pass (domain: gmail.com, ip: 209.85.222.42,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f42.google.com with SMTP id i6so47215340uae.6
        for <Openembedded-core@lists.openembedded.org>;
 Wed, 01 Dec 2021 00:36:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vmVarulLeW4/O0CghQcXQImJhXno4M2hbTBsNsc2vLI=;
        b=ivMKK0GXrvHbTADDgA7RQykYGqYTpadeFW9ewoy+hsIiiKp1plyDgupJIDAtxiJYId
         4S36P+82AULplZJYtvECGj/5kgWz6+P60u+9JvciWZTXvG36JUpGtNzqywaywN/mBNEK
         6puTQzQ0g0VhvbcP1pfMav3trqtj4TzVUoWa9thfWeMGG9jDSfIhkeBmTGG3jGDt4rGB
         oSrnohaxL8WN2bIubVU2yZdM9C9Prxf1s+pDhDHSy1I4ItNjFBYav71z+PRPIO8BJjhs
         ddzsU1HWaJKs2WP91BVasugRQp1eqALVZhM0gVlC3prEMuRXA9I/dEJQWfxxHa6ltQkg
         Rxlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vmVarulLeW4/O0CghQcXQImJhXno4M2hbTBsNsc2vLI=;
        b=fNvL/VERprk6UVUuu4eEt/JhKh6/bEnibOh9hbXKdHd4JoYIk+znMfvhvlVrf9+hVX
         HtNbRH0TTnUXqou+YUbGvLmBmqEn6KntkiQJd+hK2gPohiD+f+6/oxClBwwwxr2qwEzA
         xhCd5Q/FLkt2xSyhOZ+e2OrazV1ZmJsBhJGJ+xOI4/c/Hta091p+t+hkQESdSjODcwoS
         0dYGx6aC2V9uXS1vJa6U4skiROkvRp9cFm4+SCSXAreqpeGPtwkW3tSJb3w6e34KpFr4
         xYRt6PwNKtpNcJZrRo0uTAz0BM5IiKMcL5rOXR6nrbd14Sn8C0hGqPcj6Q4w1petMVdA
         /dew==
X-Gm-Message-State: AOAM532qePuJXjyC3OqLMVm9CNqtVUM33RTV06lEfOrtcq1kKgnSfCxO
	krg5SIal+EMYVexcU88yYoTViOWVIrAkjMtFGxg=
X-Google-Smtp-Source: 
 ABdhPJxKXvfDC++blHeXfB5NTojfz2bDAdToULg38yQMX4wzohwABzzhhHEMKGn4pBj2+m/CAVqx96/kPfZGm1tvuco=
X-Received: by 2002:ab0:6f14:: with SMTP id r20mr5874368uah.22.1638347809124;
 Wed, 01 Dec 2021 00:36:49 -0800 (PST)
MIME-Version: 1.0
References: 
 <CABKMkPJoE74O2OnAe7WsLSu56Ww4ZfPfxksZ43-Np43otAhRWA@mail.gmail.com>
 <CANNYZj-DYfd_erYQYNzATL5K_rUMfDrrvzsWD2h0n_=_kXTBxA@mail.gmail.com>
 <CABKMkP+1pDhZqzGwz-6baUnhEhsOopGonP5d7njNJ0WxsfgLEA@mail.gmail.com>
 <CANNYZj8+jV09y-p1Fciw6xY_PHabj1DtEdG0ywxGpBOgHrUoyw@mail.gmail.com>
 <CABKMkP+P1cZbuTL-tDFB-TeLB=AAwCc_zWy_D-+C_cDkz19onQ@mail.gmail.com>
 <CANNYZj8EGG17430TY6en_xqcixWXTZ0PTgjfwKerre7EN2O+cA@mail.gmail.com>
 <CABKMkPLw3w+3SSXUVfnKcqfsM-QWeUJ=DpPap=aoXJ=Bt8mD=A@mail.gmail.com>
 <CANNYZj83cBVit2P32A7bRJizf7AS+3jEcBGS-k83gqy7kRQvrA@mail.gmail.com>
 <CABKMkP+GsTCFyCqB8RihY+u17Y0bts20OpgaoP0d-hZ=Qwi8tQ@mail.gmail.com>
In-Reply-To: 
 <CABKMkP+GsTCFyCqB8RihY+u17Y0bts20OpgaoP0d-hZ=Qwi8tQ@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 1 Dec 2021 09:36:37 +0100
Message-ID: 
 <CANNYZj9ffMJjzjEOy_T8=WWEj8wtmFEKBHw7VH1+EwCTSjUs3w@mail.gmail.com>
Subject: Re: [OE-core] [RFC] meson needs a pkg-config wrapper script
To: Joel Winarske <joel.winarske@gmail.com>
Cc: OE-core <Openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000002e758005d2119300"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Dec 2021 08:36:51 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159019

--0000000000002e758005d2119300
Content-Type: text/plain; charset="UTF-8"

No, it's not that. Even if you pass PKG_CONFIG_SYSROOT_DIR to pkg-config
directly, it will apply that only to --cflags and similar, but not to
generic --variable. Try this:

alex@alex-lx-laptop:~$ PKG_CONFIG_SYSROOT_DIR=/aaaa pkg-config libdrm
--cflags
-I/aaaa/usr/include/libdrm
alex@alex-lx-laptop:~$ PKG_CONFIG_SYSROOT_DIR=/aaaa pkg-config libdrm
--variable=includedir
/usr/include

So a wrapper will not solve the 'includedir prefix' problem, and neither
the wrapper, nor pkg-config or meson can possibly know which variable is a
path, and which isn't - the only place where that is known is the component
that obtains the variable. And so that's where it has to be prefixed.

Alex

On Tue, 30 Nov 2021 at 23:38, Joel Winarske <joel.winarske@gmail.com> wrote:

> Based on my testing, if PKG_CONFIG_SYSROOT_DIR is set or not makes zero
> difference on the outcome.  I suspect this is related to how pkg-config is
> launched by meson.
>
> Looking at the meson source tree, in all ci/test cross compile scenarios
> they reference a pkg-config wrapper.  No cross compile scenario I see
> referencing the 'pkgconfig' key uses a bare pkg-config.
>
>     cross/armclang-linux.txt:#pkgconfig =
> '/usr/bin/arm-linux-gnueabihf-pkg-config'
>     cross/linux-mingw-w64-32bit.txt:pkgconfig =
> '/usr/bin/i686-w64-mingw32-pkg-config'
>     cross/linux-mingw-w64-64bit.txt:pkgconfig =
> '/usr/bin/x86_64-w64-mingw32-pkg-config'
>     cross/ubuntu-armhf.txt:pkgconfig =
> '/usr/bin/arm-linux-gnueabihf-pkg-config'
>     test cases/unit/33 cross file overrides always
> args/ubuntu-armhf-overrides.txt:pkgconfig =
> '/usr/bin/arm-linux-gnueabihf-pkg-config'
>     test cases/unit/36 exe_wrapper behaviour/broken-cross.txt:pkgconfig =
> '/usr/bin/x86_64-w64-mingw32-pkg-config'
>
> I think adding a wrapper makes sense.
>
> 5.2 Tool Calling Conventions -
> https://autotools.io/pkgconfig/cross-compiling.html
>
> On Tue, Nov 30, 2021 at 12:13 PM Alexander Kanavin <alex.kanavin@gmail.com>
> wrote:
>
>> On Tue, 30 Nov 2021 at 21:00, Joel Winarske <joel.winarske@gmail.com>
>> wrote:
>>
>>> Yes, if the sys_root key value in meson.cross is present
>>> PKG_CONFIG_SYSROOT_DIR gets set.  Honister patch I confirmed with:
>>>
>>> https://github.com/jwinarske/manifests/blob/honister/rpi64/0001-Add-sys_root-to-properties-section.patch
>>>
>>> The issue is that meson doesn't pass PKG_CONFIG_SYSROOT_DIR to the shell
>>> environment that runs pkg-config, as with the pkg-config sandbox test it
>>> does work.
>>>
>>
>> Both meson source code and its documentation indicate otherwise - if you
>> set sys_root property, it will get passed to pkg-config via environment as
>> PKG_CONFIG_SYSROOT_DIR:
>>
>> https://github.com/mesonbuild/meson/blob/master/mesonbuild/dependencies/pkgconfig.py#L121
>>
>> Alex
>>
>>

--0000000000002e758005d2119300
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>No, it&#39;s not that. Even if you pass PKG_CONFIG_SY=
SROOT_DIR to pkg-config directly, it will apply that only to --cflags and s=
imilar, but not to generic --variable. Try this:</div><div><br></div><div>a=
lex@alex-lx-laptop:~$ PKG_CONFIG_SYSROOT_DIR=3D/aaaa pkg-config libdrm --cf=
lags<br>-I/aaaa/usr/include/libdrm<br>alex@alex-lx-laptop:~$ PKG_CONFIG_SYS=
ROOT_DIR=3D/aaaa pkg-config libdrm --variable=3Dincludedir<br>/usr/include<=
/div><div><br></div><div>So a wrapper will not solve the &#39;includedir pr=
efix&#39; problem, and neither the wrapper, nor pkg-config or meson can pos=
sibly know which variable is a path, and which isn&#39;t - the only place w=
here that is known is the component that obtains the variable. And so that&=
#39;s where it has to be prefixed.<br></div><div><br></div><div>Alex<br></d=
iv></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_att=
r">On Tue, 30 Nov 2021 at 23:38, Joel Winarske &lt;<a href=3D"mailto:joel.w=
inarske@gmail.com">joel.winarske@gmail.com</a>&gt; wrote:<br></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div>Based on my=
 testing, if PKG_CONFIG_SYSROOT_DIR is set or not makes zero difference on =
the outcome.=C2=A0 I suspect this is related to how pkg-config is launched =
by meson.<br></div><div><br></div><div>Looking at the meson source tree, in=
 all ci/test cross compile=20
scenarios they reference a pkg-config wrapper.=C2=A0 No cross compile=20
scenario I see referencing the &#39;pkgconfig&#39; key uses a bare pkg-conf=
ig.<br></div><div><br></div><div>=C2=A0=C2=A0=C2=A0 cross/armclang-linux.tx=
t:#pkgconfig =3D &#39;/usr/bin/arm-linux-gnueabihf-pkg-config&#39;<br>=C2=
=A0=C2=A0=C2=A0 cross/linux-mingw-w64-32bit.txt:pkgconfig =3D &#39;/usr/bin=
/i686-w64-mingw32-pkg-config&#39;<br>=C2=A0=C2=A0=C2=A0 cross/linux-mingw-w=
64-64bit.txt:pkgconfig =3D &#39;/usr/bin/x86_64-w64-mingw32-pkg-config&#39;=
<br>=C2=A0=C2=A0=C2=A0 cross/ubuntu-armhf.txt:pkgconfig =3D &#39;/usr/bin/a=
rm-linux-gnueabihf-pkg-config&#39;<br>=C2=A0=C2=A0=C2=A0
 test cases/unit/33 cross file overrides always=20
args/ubuntu-armhf-overrides.txt:pkgconfig =3D=20
&#39;/usr/bin/arm-linux-gnueabihf-pkg-config&#39;<br>=C2=A0=C2=A0=C2=A0 tes=
t cases/unit/36 exe_wrapper behaviour/broken-cross.txt:pkgconfig =3D &#39;/=
usr/bin/x86_64-w64-mingw32-pkg-config&#39;</div><div><br></div><div><div></=
div><div>I think adding a wrapper makes sense.</div><div><br></div><div>5.2=
 Tool Calling Conventions - <a href=3D"https://autotools.io/pkgconfig/cross=
-compiling.html" target=3D"_blank">https://autotools.io/pkgconfig/cross-com=
piling.html</a></div></div></div><br><div class=3D"gmail_quote"><div dir=3D=
"ltr" class=3D"gmail_attr">On Tue, Nov 30, 2021 at 12:13 PM Alexander Kanav=
in &lt;<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.kan=
avin@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Tue, 30 Nov 2021 at 21:00, Joel Winarske &lt;<a hre=
f=3D"mailto:joel.winarske@gmail.com" target=3D"_blank">joel.winarske@gmail.=
com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x"><div dir=3D"ltr"><div>Yes, if the sys_root key value in meson.cross is p=
resent PKG_CONFIG_SYSROOT_DIR gets set.=C2=A0 Honister patch I confirmed wi=
th:<br><a href=3D"https://github.com/jwinarske/manifests/blob/honister/rpi6=
4/0001-Add-sys_root-to-properties-section.patch" target=3D"_blank">https://=
github.com/jwinarske/manifests/blob/honister/rpi64/0001-Add-sys_root-to-pro=
perties-section.patch</a></div><div><br></div><div>The issue is that meson =
doesn&#39;t pass PKG_CONFIG_SYSROOT_DIR to the shell environment that runs =
pkg-config, as with the pkg-config sandbox test it does work.<br></div></di=
v></blockquote><div><br></div><div>Both meson source code and its documenta=
tion indicate otherwise - if you set sys_root property, it will get passed =
to pkg-config via environment as PKG_CONFIG_SYSROOT_DIR:</div><div><a href=
=3D"https://github.com/mesonbuild/meson/blob/master/mesonbuild/dependencies=
/pkgconfig.py#L121" target=3D"_blank">https://github.com/mesonbuild/meson/b=
lob/master/mesonbuild/dependencies/pkgconfig.py#L121</a></div><div><br></di=
v><div></div><div>Alex<br></div><br></div></div>
</blockquote></div>
</blockquote></div>

--0000000000002e758005d2119300--

