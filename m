Return-Path: <joel.winarske@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19759C433EF
	for <webhook@archiver.kernel.org>; Tue, 30 Nov 2021 22:38:03 +0000 (UTC)
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com
 [209.85.222.47])
 by mx.groups.io with SMTP id smtpd.web11.83704.1638311882375144274
 for <Openembedded-core@lists.openembedded.org>;
 Tue, 30 Nov 2021 14:38:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=jv4bN/aI;
 spf=pass (domain: gmail.com, ip: 209.85.222.47,
 mailfrom: joel.winarske@gmail.com)
Received: by mail-ua1-f47.google.com with SMTP id a14so44890529uak.0
        for <Openembedded-core@lists.openembedded.org>;
 Tue, 30 Nov 2021 14:38:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VG/3knHHceWb5+cF77Tfb6mLIgE4YPBu4LDSreqiDqI=;
        b=jv4bN/aIKCeW/yyaYWmTKBx/F+elWuCQNFoo9Qym/ocistQyypg/Metr+PGtuyEhk1
         hCjTwJvF9bXTgJmCPgisneLR+GSEwuLEcBJQwbPMv5vjPwDEHBmu/wW1f3IX0m5m75IR
         mtjKuUwBu3XJqmY1tVX0vJa94ekQDD9iKI5mfeMxMcANfU+25xjuFHzw4+SWZVSA2y/Y
         rcPz4cTm5AySkB6z24tPke7CJG39uXleNynrFdLCGL++jkRSt7LmiAtuQGl3rMf5dS1K
         OH8OBa3L8mSgZP18zHkMB/1AyQd3YEvha7jFqGX7ZPjjYUw31KXtOhcRu7KK7cJPJbzA
         RdEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VG/3knHHceWb5+cF77Tfb6mLIgE4YPBu4LDSreqiDqI=;
        b=O69xbYyFTW/GUCvjpdduXpW2Q7RuH7bLsSjzNrikfbtPz3Fv360NjlN0SmQpPP1He9
         hAFo79rWmds+f4f6u9aY68Md4oU0z2BAI59DgvogD0WlofIon5lAHv3SVOmzFjaNSrVB
         9dheTsiybGlMQHyyzWFNr59SvxJ1Y1YR1ytaxhRkdgYcgFfrj9LV2ocncrtXr4zPF6Xn
         paUONgd0ETnLbPFcauVRbqTpHwCE653ma7oEHHLZvKY47QQknWokla2mBsrmSz29kMcH
         CGlnqswjy1GdmSFxAQSyNCok+tVUnQbXoBs+rSdpv4ctydsz+rm5cVjd73XCV+k6+tmk
         OkUg==
X-Gm-Message-State: AOAM530ScGxQIkgl1CRViLjccg9pIq0dDMULaNP6QJwjUIJXZ/pDarvD
	6BxCLoie69D+W8BzzKuo9p2COMsgzhO10LkEauM=
X-Google-Smtp-Source: 
 ABdhPJwJPupI6PN1HnX8FQdtG0a5QycrvyQKBpPL4+4fg14w8AzE4vI+Q9KRz6wzzM8VqX+gZxH7oPJ/CQq6cSNRcgc=
X-Received: by 2002:a67:e90d:: with SMTP id c13mr3657303vso.12.1638311881317;
 Tue, 30 Nov 2021 14:38:01 -0800 (PST)
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
In-Reply-To: 
 <CANNYZj83cBVit2P32A7bRJizf7AS+3jEcBGS-k83gqy7kRQvrA@mail.gmail.com>
From: Joel Winarske <joel.winarske@gmail.com>
Date: Tue, 30 Nov 2021 14:37:49 -0800
Message-ID: 
 <CABKMkP+GsTCFyCqB8RihY+u17Y0bts20OpgaoP0d-hZ=Qwi8tQ@mail.gmail.com>
Subject: Re: [OE-core] [RFC] meson needs a pkg-config wrapper script
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <Openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000b7a0f005d2093515"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Nov 2021 22:38:03 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159001

--000000000000b7a0f005d2093515
Content-Type: text/plain; charset="UTF-8"

Based on my testing, if PKG_CONFIG_SYSROOT_DIR is set or not makes zero
difference on the outcome.  I suspect this is related to how pkg-config is
launched by meson.

Looking at the meson source tree, in all ci/test cross compile scenarios
they reference a pkg-config wrapper.  No cross compile scenario I see
referencing the 'pkgconfig' key uses a bare pkg-config.

    cross/armclang-linux.txt:#pkgconfig =
'/usr/bin/arm-linux-gnueabihf-pkg-config'
    cross/linux-mingw-w64-32bit.txt:pkgconfig =
'/usr/bin/i686-w64-mingw32-pkg-config'
    cross/linux-mingw-w64-64bit.txt:pkgconfig =
'/usr/bin/x86_64-w64-mingw32-pkg-config'
    cross/ubuntu-armhf.txt:pkgconfig =
'/usr/bin/arm-linux-gnueabihf-pkg-config'
    test cases/unit/33 cross file overrides always
args/ubuntu-armhf-overrides.txt:pkgconfig =
'/usr/bin/arm-linux-gnueabihf-pkg-config'
    test cases/unit/36 exe_wrapper behaviour/broken-cross.txt:pkgconfig =
'/usr/bin/x86_64-w64-mingw32-pkg-config'

I think adding a wrapper makes sense.

5.2 Tool Calling Conventions -
https://autotools.io/pkgconfig/cross-compiling.html

On Tue, Nov 30, 2021 at 12:13 PM Alexander Kanavin <alex.kanavin@gmail.com>
wrote:

> On Tue, 30 Nov 2021 at 21:00, Joel Winarske <joel.winarske@gmail.com>
> wrote:
>
>> Yes, if the sys_root key value in meson.cross is present
>> PKG_CONFIG_SYSROOT_DIR gets set.  Honister patch I confirmed with:
>>
>> https://github.com/jwinarske/manifests/blob/honister/rpi64/0001-Add-sys_root-to-properties-section.patch
>>
>> The issue is that meson doesn't pass PKG_CONFIG_SYSROOT_DIR to the shell
>> environment that runs pkg-config, as with the pkg-config sandbox test it
>> does work.
>>
>
> Both meson source code and its documentation indicate otherwise - if you
> set sys_root property, it will get passed to pkg-config via environment as
> PKG_CONFIG_SYSROOT_DIR:
>
> https://github.com/mesonbuild/meson/blob/master/mesonbuild/dependencies/pkgconfig.py#L121
>
> Alex
>
>

--000000000000b7a0f005d2093515
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Based on my testing, if PKG_CONFIG_SYSROOT_DIR is set=
 or not makes zero difference on the outcome.=C2=A0 I suspect this is relat=
ed to how pkg-config is launched by meson.<br></div><div><br></div><div>Loo=
king at the meson source tree, in all ci/test cross compile=20
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
-compiling.html">https://autotools.io/pkgconfig/cross-compiling.html</a></d=
iv></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gma=
il_attr">On Tue, Nov 30, 2021 at 12:13 PM Alexander Kanavin &lt;<a href=3D"=
mailto:alex.kanavin@gmail.com">alex.kanavin@gmail.com</a>&gt; wrote:<br></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div =
class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, 30 Nov =
2021 at 21:00, Joel Winarske &lt;<a href=3D"mailto:joel.winarske@gmail.com"=
 target=3D"_blank">joel.winarske@gmail.com</a>&gt; wrote:<br></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div>Yes, if the=
 sys_root key value in meson.cross is present PKG_CONFIG_SYSROOT_DIR gets s=
et.=C2=A0 Honister patch I confirmed with:<br><a href=3D"https://github.com=
/jwinarske/manifests/blob/honister/rpi64/0001-Add-sys_root-to-properties-se=
ction.patch" target=3D"_blank">https://github.com/jwinarske/manifests/blob/=
honister/rpi64/0001-Add-sys_root-to-properties-section.patch</a></div><div>=
<br></div><div>The issue is that meson doesn&#39;t pass PKG_CONFIG_SYSROOT_=
DIR to the shell environment that runs pkg-config, as with the pkg-config s=
andbox test it does work.<br></div></div></blockquote><div><br></div><div>B=
oth meson source code and its documentation indicate otherwise - if you set=
 sys_root property, it will get passed to pkg-config via environment as PKG=
_CONFIG_SYSROOT_DIR:</div><div><a href=3D"https://github.com/mesonbuild/mes=
on/blob/master/mesonbuild/dependencies/pkgconfig.py#L121" target=3D"_blank"=
>https://github.com/mesonbuild/meson/blob/master/mesonbuild/dependencies/pk=
gconfig.py#L121</a></div><div><br></div><div></div><div>Alex<br></div><br><=
/div></div>
</blockquote></div>

--000000000000b7a0f005d2093515--

