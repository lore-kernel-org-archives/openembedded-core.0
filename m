Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A9F9C433F5
	for <webhook@archiver.kernel.org>; Wed,  1 Dec 2021 22:39:04 +0000 (UTC)
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com
 [209.85.221.177])
 by mx.groups.io with SMTP id smtpd.web10.594.1638398343402096478
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Dec 2021 14:39:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=CLsRjNus;
 spf=pass (domain: gmail.com, ip: 209.85.221.177,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-vk1-f177.google.com with SMTP id 84so17205211vkc.6
        for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Dec 2021 14:39:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VbIyrXvwaf+O65uCdLW94fUHJTHSoCQf6++PaIY6bGM=;
        b=CLsRjNusNmeSII3CxkrfGj8tYKBPliEgPU9Tn9VMcX9tGfhvtCP18FrGM8WG0UHJXu
         mWl7p29IJqnNJLD+EKMmxqRRMAoM4oR73m4K6tWqrjhgJ8cfnARLRhHoHLpBkwUJGqBn
         dk6e/YchFQuTPHVbsaHu2sqUGnRCLIOW9RDpwFF55e4A253swX5GlgB1Gz+DcNK0Egyk
         NmXePtzUBnQl4akRyiratbhYwvGckAMsB0frysNAilUGD0/0tyJ1fynrmT3Qpz3dlROh
         9mwaj55lJ0j54gYVK85YiQ7SvrTFMSAxwyo7xcXq3cnI6ao96YBppwyDqeWVAxZm04O/
         GMxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VbIyrXvwaf+O65uCdLW94fUHJTHSoCQf6++PaIY6bGM=;
        b=T8IYpt0j3Efq6XqjPOuHdexBvoJf3k8HWMKaRkX6Jy7N7W3EzzNsRhH2UA6G1smORv
         fLdbmIes+Xosp3vA3dK5L8GwM/dwJtRiLvgmS31Tg6D8a/Xt6LfvXmy4gMQM5a/32eCZ
         pobT/YmprknwP2Ny6lqq8FSNBYYOjDq6E5D471jBwu0h4krgv8/ILcemeti935LYpYLd
         gEF0pjd9LtriKbaktFavCueQsY6mdwcCLZyy3x3WLLRG6xuWQaEOn4/eYtGwm+MedIXj
         p0mVAQRbDA04tahsbCGTCQdh7DxEokl9aNsLbxpmV3hMRmvf8gVsZnoTlIebrwwyOsxm
         XGDQ==
X-Gm-Message-State: AOAM531Y3/i0RZ/sxQsmQBtX+gxqeXreFpOMyFJB3zfl6g4kRlcOreH0
	ZFKgleMdSHn3QVBSgkPxLg/Db7C9MyJPcNgUKuM=
X-Google-Smtp-Source: 
 ABdhPJzDoC9njGsgSSP2xs2HVP/Kle421P/iK18OBDH0m2eW3Cc29kksyYNDp4nlwcWBx63GihZCxe8yb1rqOwxAnSs=
X-Received: by 2002:a05:6122:114c:: with SMTP id
 p12mr11539638vko.21.1638398342561;
 Wed, 01 Dec 2021 14:39:02 -0800 (PST)
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
 <CANNYZj9ffMJjzjEOy_T8=WWEj8wtmFEKBHw7VH1+EwCTSjUs3w@mail.gmail.com>
 <CABKMkPJ+6xA9BtZsv-tcKKssJdhfjA4w7eSxJzNyBOg4Ak2=gw@mail.gmail.com>
In-Reply-To: 
 <CABKMkPJ+6xA9BtZsv-tcKKssJdhfjA4w7eSxJzNyBOg4Ak2=gw@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 1 Dec 2021 23:38:51 +0100
Message-ID: 
 <CANNYZj9vhdZupdaH+JwsLq2DT2h=pFPXSu3Q0Sr-q8O+Za2qxA@mail.gmail.com>
Subject: Re: [OE-core] [RFC] meson needs a pkg-config wrapper script
To: Joel Winarske <joel.winarske@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000035834105d21d5798"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Dec 2021 22:39:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159064

--00000000000035834105d21d5798
Content-Type: text/plain; charset="UTF-8"

Please keep the conversation on the list.

Those are two different, independently developed projects:
https://gitlab.freedesktop.org/pkg-config/pkg-config
https://github.com/pkgconf/pkgconf
and they are not fully compatible as you have just shown.

I'm not sure how pkgconf is able to decide that includedir is a path (short
of hardcoding that inside the source somewhere), but such logic needs to be
carefully investigated before we make use of it, e.g. by switching to
pkgconf in oe-core.

Alex

On Wed, 1 Dec 2021 at 23:31, Joel Winarske <joel.winarske@gmail.com> wrote:

> pkg-config --version ?
>
> Using 0.29.2 I get the same output as you:
> $ PKG_CONFIG_SYSROOT_DIR=$STAGING_DIR_TARGET
> /home/linuxbrew/.linuxbrew/bin/pkg-config --define-variable=prefix=/opt
> --variable=includedir glesv2
> /usr/include
>
> Using 1.7.3 it works:
>
> STAGING_DIR_TARGET=/b/github-ci/_work/meta-flutter/rpi4-drm-honister-latest/raspberrypi4-64/tmp/work/cortexa72-poky-linux/vkmark/git-r0/recipe-sysroot
> PKG_CONFIG_SYSROOT_DIR=$STAGING_DIR_TARGET /usr/bin/pkg-config
> --variable=includedir glesv2
>
> /b/github-ci/_work/meta-flutter/rpi4-drm-honister-latest/raspberrypi4-64/tmp/work/cortexa72-poky-linux/vkmark/git-r0/recipe-sysroot/usr/include
>
> $ /usr/bin/pkg-config --version
> 1.7.3
>
> $ /home/linuxbrew/.linuxbrew/bin/pkg-config --version
> 0.29.2
>
> On Wed, Dec 1, 2021 at 12:36 AM Alexander Kanavin <alex.kanavin@gmail.com>
> wrote:
>
>> No, it's not that. Even if you pass PKG_CONFIG_SYSROOT_DIR to pkg-config
>> directly, it will apply that only to --cflags and similar, but not to
>> generic --variable. Try this:
>>
>> alex@alex-lx-laptop:~$ PKG_CONFIG_SYSROOT_DIR=/aaaa pkg-config libdrm
>> --cflags
>> -I/aaaa/usr/include/libdrm
>> alex@alex-lx-laptop:~$ PKG_CONFIG_SYSROOT_DIR=/aaaa pkg-config libdrm
>> --variable=includedir
>> /usr/include
>>
>> So a wrapper will not solve the 'includedir prefix' problem, and neither
>> the wrapper, nor pkg-config or meson can possibly know which variable is a
>> path, and which isn't - the only place where that is known is the component
>> that obtains the variable. And so that's where it has to be prefixed.
>>
>> Alex
>>
>> On Tue, 30 Nov 2021 at 23:38, Joel Winarske <joel.winarske@gmail.com>
>> wrote:
>>
>>> Based on my testing, if PKG_CONFIG_SYSROOT_DIR is set or not makes zero
>>> difference on the outcome.  I suspect this is related to how pkg-config is
>>> launched by meson.
>>>
>>> Looking at the meson source tree, in all ci/test cross compile scenarios
>>> they reference a pkg-config wrapper.  No cross compile scenario I see
>>> referencing the 'pkgconfig' key uses a bare pkg-config.
>>>
>>>     cross/armclang-linux.txt:#pkgconfig =
>>> '/usr/bin/arm-linux-gnueabihf-pkg-config'
>>>     cross/linux-mingw-w64-32bit.txt:pkgconfig =
>>> '/usr/bin/i686-w64-mingw32-pkg-config'
>>>     cross/linux-mingw-w64-64bit.txt:pkgconfig =
>>> '/usr/bin/x86_64-w64-mingw32-pkg-config'
>>>     cross/ubuntu-armhf.txt:pkgconfig =
>>> '/usr/bin/arm-linux-gnueabihf-pkg-config'
>>>     test cases/unit/33 cross file overrides always
>>> args/ubuntu-armhf-overrides.txt:pkgconfig =
>>> '/usr/bin/arm-linux-gnueabihf-pkg-config'
>>>     test cases/unit/36 exe_wrapper behaviour/broken-cross.txt:pkgconfig
>>> = '/usr/bin/x86_64-w64-mingw32-pkg-config'
>>>
>>> I think adding a wrapper makes sense.
>>>
>>> 5.2 Tool Calling Conventions -
>>> https://autotools.io/pkgconfig/cross-compiling.html
>>>
>>> On Tue, Nov 30, 2021 at 12:13 PM Alexander Kanavin <
>>> alex.kanavin@gmail.com> wrote:
>>>
>>>> On Tue, 30 Nov 2021 at 21:00, Joel Winarske <joel.winarske@gmail.com>
>>>> wrote:
>>>>
>>>>> Yes, if the sys_root key value in meson.cross is present
>>>>> PKG_CONFIG_SYSROOT_DIR gets set.  Honister patch I confirmed with:
>>>>>
>>>>> https://github.com/jwinarske/manifests/blob/honister/rpi64/0001-Add-sys_root-to-properties-section.patch
>>>>>
>>>>> The issue is that meson doesn't pass PKG_CONFIG_SYSROOT_DIR to the
>>>>> shell environment that runs pkg-config, as with the pkg-config sandbox test
>>>>> it does work.
>>>>>
>>>>
>>>> Both meson source code and its documentation indicate otherwise - if
>>>> you set sys_root property, it will get passed to pkg-config via environment
>>>> as PKG_CONFIG_SYSROOT_DIR:
>>>>
>>>> https://github.com/mesonbuild/meson/blob/master/mesonbuild/dependencies/pkgconfig.py#L121
>>>>
>>>> Alex
>>>>
>>>>

--00000000000035834105d21d5798
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Please keep the conversation on the list.</div><div><=
br></div><div>Those are two different, independently developed projects:</d=
iv><div><a href=3D"https://gitlab.freedesktop.org/pkg-config/pkg-config">ht=
tps://gitlab.freedesktop.org/pkg-config/pkg-config</a></div><div><a href=3D=
"https://github.com/pkgconf/pkgconf">https://github.com/pkgconf/pkgconf</a>=
</div><div>and they are not fully compatible as you have just shown.<br></d=
iv><div><br></div><div>I&#39;m not sure how pkgconf is able to decide that =
includedir is a path (short of hardcoding that inside the source somewhere)=
, but such logic needs to be carefully investigated before we make use of i=
t, e.g. by switching to pkgconf in oe-core.<br></div><div><br></div><div>Al=
ex<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"=
gmail_attr">On Wed, 1 Dec 2021 at 23:31, Joel Winarske &lt;<a href=3D"mailt=
o:joel.winarske@gmail.com" target=3D"_blank">joel.winarske@gmail.com</a>&gt=
; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div di=
r=3D"ltr"><div></div><div>pkg-config --version ?<br></div><div><br></div><d=
iv>Using 0.29.2 I get the same output as you:</div><div>$ PKG_CONFIG_SYSROO=
T_DIR=3D$STAGING_DIR_TARGET /home/linuxbrew/.linuxbrew/bin/pkg-config --def=
ine-variable=3Dprefix=3D/opt --variable=3Dincludedir glesv2<br>/usr/include=
</div><div><br></div><div>Using 1.7.3 it works:</div><div>STAGING_DIR_TARGE=
T=3D/b/github-ci/_work/meta-flutter/rpi4-drm-honister-latest/raspberrypi4-6=
4/tmp/work/cortexa72-poky-linux/vkmark/git-r0/recipe-sysroot</div><div></di=
v><div></div><div>PKG_CONFIG_SYSROOT_DIR=3D$STAGING_DIR_TARGET /usr/bin/pkg=
-config --variable=3Dincludedir glesv2<br>/b/github-ci/_work/meta-flutter/r=
pi4-drm-honister-latest/raspberrypi4-64/tmp/work/cortexa72-poky-linux/vkmar=
k/git-r0/recipe-sysroot/usr/include</div><div><br></div><div>$ /usr/bin/pkg=
-config --version<br>1.7.3</div><div><br></div><div>$ /home/linuxbrew/.linu=
xbrew/bin/pkg-config --version<br>0.29.2<br></div></div><br><div class=3D"g=
mail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Dec 1, 2021 at 12=
:36 AM Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com" targ=
et=3D"_blank">alex.kanavin@gmail.com</a>&gt; wrote:<br></div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div>No, it&#39;s not =
that. Even if you pass PKG_CONFIG_SYSROOT_DIR to pkg-config directly, it wi=
ll apply that only to --cflags and similar, but not to generic --variable. =
Try this:</div><div><br></div><div>alex@alex-lx-laptop:~$ PKG_CONFIG_SYSROO=
T_DIR=3D/aaaa pkg-config libdrm --cflags<br>-I/aaaa/usr/include/libdrm<br>a=
lex@alex-lx-laptop:~$ PKG_CONFIG_SYSROOT_DIR=3D/aaaa pkg-config libdrm --va=
riable=3Dincludedir<br>/usr/include</div><div><br></div><div>So a wrapper w=
ill not solve the &#39;includedir prefix&#39; problem, and neither the wrap=
per, nor pkg-config or meson can possibly know which variable is a path, an=
d which isn&#39;t - the only place where that is known is the component tha=
t obtains the variable. And so that&#39;s where it has to be prefixed.<br><=
/div><div><br></div><div>Alex<br></div></div><br><div class=3D"gmail_quote"=
><div dir=3D"ltr" class=3D"gmail_attr">On Tue, 30 Nov 2021 at 23:38, Joel W=
inarske &lt;<a href=3D"mailto:joel.winarske@gmail.com" target=3D"_blank">jo=
el.winarske@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex"><div dir=3D"ltr"><div>Based on my testing, if PKG_CONF=
IG_SYSROOT_DIR is set or not makes zero difference on the outcome.=C2=A0 I =
suspect this is related to how pkg-config is launched by meson.<br></div><d=
iv><br></div><div>Looking at the meson source tree, in all ci/test cross co=
mpile=20
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
</blockquote></div>
</blockquote></div>

--00000000000035834105d21d5798--

