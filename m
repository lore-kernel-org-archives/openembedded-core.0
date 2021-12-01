Return-Path: <joel.winarske@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2AA8C433EF
	for <webhook@archiver.kernel.org>; Wed,  1 Dec 2021 23:27:50 +0000 (UTC)
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com
 [209.85.221.175])
 by mx.groups.io with SMTP id smtpd.web09.1197.1638401269396557341
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Dec 2021 15:27:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=hljJn+zN;
 spf=pass (domain: gmail.com, ip: 209.85.221.175,
 mailfrom: joel.winarske@gmail.com)
Received: by mail-vk1-f175.google.com with SMTP id j1so17303459vkr.1
        for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Dec 2021 15:27:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5UcxMRf+X4VkQrQYi/n9RcwqzNoqojH1wmPsIyyl8vA=;
        b=hljJn+zNA/yJLmPM2vXnABSdsG1i/3OcwZrvbFWXwaO7dk8V21YccwInYrcOKYjtJE
         3DcIkvmEYX4lumOzbzD4Pzh0jqpjIjigXcHApgW/MUihigSfbZXPEjTOGQw2xtIeZH31
         SpESYQgTlgvAzp4K0i06jo/OVPM0bVKznvD8NVm6uRrS/0EuKl+emsc9xOqiWkznUoma
         bFZ1oeoWPJlxq9kGbuecB6kgeFlJfYwBsxO85YjsMCsknpLsy5mDG+/MgqsliLJ71RyV
         Ueeg5gw79QpFCe2IeFBvd7mDZ/Wz07i3s07LDc40d3kNzopM4UUuV2qYL5mQzCj0Gyc7
         mJJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5UcxMRf+X4VkQrQYi/n9RcwqzNoqojH1wmPsIyyl8vA=;
        b=jevkR+Hoq5C4c2EWad9S1OZ2tOpFm8pqgjvGpnzWzT8jGznjCH8XfZPpRLQmk0vM2m
         9hMn1UWvAvW3hhhS8y17TICfEZSAYt2YHZtGj15aX1XXYjg4yeOnAV/0FSoBgD2aH38r
         8xYdy8zCsgsW/fwfPgc2jX4O5sxxyLZ9HAXDTQA9MPn7/vHtjjf5Q7Tgab79JMGBee07
         irFcLACOpfga/mPeA6VvYoFOmB6280qwf+/1gASjn6g4FRXO9zppZSI4lqNPCBYfOm03
         Ocvf7dFkSAkzM8uzRF4KalNWoYdEDJ2g7P4++a+tw/NqxpDEZ9z6OGZ/PSjqvyUNKgQ7
         cwYQ==
X-Gm-Message-State: AOAM533LGcfoW+aiP6ncObOusUvSiqV0GDBeheFcCd53uizfTJSCDcTs
	UzqmwDH9ypmvL3SnzZrzutt9IjDil3mTyG17TvI=
X-Google-Smtp-Source: 
 ABdhPJykMzgzrYJux5QcEj/h8F+T4JbrS+1O5zmXNtS7Dqfb/eJtXZwSKVecYBicNQB1uAkC2OMZojvYjIgPyz+kmu0=
X-Received: by 2002:a05:6122:550:: with SMTP id
 y16mr12669949vko.0.1638401268399;
 Wed, 01 Dec 2021 15:27:48 -0800 (PST)
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
 <CANNYZj9vhdZupdaH+JwsLq2DT2h=pFPXSu3Q0Sr-q8O+Za2qxA@mail.gmail.com>
In-Reply-To: 
 <CANNYZj9vhdZupdaH+JwsLq2DT2h=pFPXSu3Q0Sr-q8O+Za2qxA@mail.gmail.com>
From: Joel Winarske <joel.winarske@gmail.com>
Date: Wed, 1 Dec 2021 15:27:37 -0800
Message-ID: 
 <CABKMkP+aR4js4QUMwaPVQf7pCpWBdJw-OqgML+GwVHq680UoxA@mail.gmail.com>
Subject: Re: [OE-core] [RFC] meson needs a pkg-config wrapper script
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000009a533205d21e052d"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Dec 2021 23:27:50 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159068

--0000000000009a533205d21e052d
Content-Type: text/plain; charset="UTF-8"

Forgot the reply all, not intentional :)

Looks like the build is using the pkgconfig flavor:
meta/recipes-devtools/pkgconfig/pkgconfig_git.bb

Perhaps I just need a PREFERRED_PROVIDER_pkgconfig ?= "pkg-config" and
pkg-config recipe, then perhaps it will just work.

On Wed, Dec 1, 2021 at 2:39 PM Alexander Kanavin <alex.kanavin@gmail.com>
wrote:

> Please keep the conversation on the list.
>
> Those are two different, independently developed projects:
> https://gitlab.freedesktop.org/pkg-config/pkg-config
> https://github.com/pkgconf/pkgconf
> and they are not fully compatible as you have just shown.
>
> I'm not sure how pkgconf is able to decide that includedir is a path
> (short of hardcoding that inside the source somewhere), but such logic
> needs to be carefully investigated before we make use of it, e.g. by
> switching to pkgconf in oe-core.
>
> Alex
>
> On Wed, 1 Dec 2021 at 23:31, Joel Winarske <joel.winarske@gmail.com>
> wrote:
>
>> pkg-config --version ?
>>
>> Using 0.29.2 I get the same output as you:
>> $ PKG_CONFIG_SYSROOT_DIR=$STAGING_DIR_TARGET
>> /home/linuxbrew/.linuxbrew/bin/pkg-config --define-variable=prefix=/opt
>> --variable=includedir glesv2
>> /usr/include
>>
>> Using 1.7.3 it works:
>>
>> STAGING_DIR_TARGET=/b/github-ci/_work/meta-flutter/rpi4-drm-honister-latest/raspberrypi4-64/tmp/work/cortexa72-poky-linux/vkmark/git-r0/recipe-sysroot
>> PKG_CONFIG_SYSROOT_DIR=$STAGING_DIR_TARGET /usr/bin/pkg-config
>> --variable=includedir glesv2
>>
>> /b/github-ci/_work/meta-flutter/rpi4-drm-honister-latest/raspberrypi4-64/tmp/work/cortexa72-poky-linux/vkmark/git-r0/recipe-sysroot/usr/include
>>
>> $ /usr/bin/pkg-config --version
>> 1.7.3
>>
>> $ /home/linuxbrew/.linuxbrew/bin/pkg-config --version
>> 0.29.2
>>
>> On Wed, Dec 1, 2021 at 12:36 AM Alexander Kanavin <alex.kanavin@gmail.com>
>> wrote:
>>
>>> No, it's not that. Even if you pass PKG_CONFIG_SYSROOT_DIR to pkg-config
>>> directly, it will apply that only to --cflags and similar, but not to
>>> generic --variable. Try this:
>>>
>>> alex@alex-lx-laptop:~$ PKG_CONFIG_SYSROOT_DIR=/aaaa pkg-config libdrm
>>> --cflags
>>> -I/aaaa/usr/include/libdrm
>>> alex@alex-lx-laptop:~$ PKG_CONFIG_SYSROOT_DIR=/aaaa pkg-config libdrm
>>> --variable=includedir
>>> /usr/include
>>>
>>> So a wrapper will not solve the 'includedir prefix' problem, and neither
>>> the wrapper, nor pkg-config or meson can possibly know which variable is a
>>> path, and which isn't - the only place where that is known is the component
>>> that obtains the variable. And so that's where it has to be prefixed.
>>>
>>> Alex
>>>
>>> On Tue, 30 Nov 2021 at 23:38, Joel Winarske <joel.winarske@gmail.com>
>>> wrote:
>>>
>>>> Based on my testing, if PKG_CONFIG_SYSROOT_DIR is set or not makes zero
>>>> difference on the outcome.  I suspect this is related to how pkg-config is
>>>> launched by meson.
>>>>
>>>> Looking at the meson source tree, in all ci/test cross compile
>>>> scenarios they reference a pkg-config wrapper.  No cross compile scenario I
>>>> see referencing the 'pkgconfig' key uses a bare pkg-config.
>>>>
>>>>     cross/armclang-linux.txt:#pkgconfig =
>>>> '/usr/bin/arm-linux-gnueabihf-pkg-config'
>>>>     cross/linux-mingw-w64-32bit.txt:pkgconfig =
>>>> '/usr/bin/i686-w64-mingw32-pkg-config'
>>>>     cross/linux-mingw-w64-64bit.txt:pkgconfig =
>>>> '/usr/bin/x86_64-w64-mingw32-pkg-config'
>>>>     cross/ubuntu-armhf.txt:pkgconfig =
>>>> '/usr/bin/arm-linux-gnueabihf-pkg-config'
>>>>     test cases/unit/33 cross file overrides always
>>>> args/ubuntu-armhf-overrides.txt:pkgconfig =
>>>> '/usr/bin/arm-linux-gnueabihf-pkg-config'
>>>>     test cases/unit/36 exe_wrapper behaviour/broken-cross.txt:pkgconfig
>>>> = '/usr/bin/x86_64-w64-mingw32-pkg-config'
>>>>
>>>> I think adding a wrapper makes sense.
>>>>
>>>> 5.2 Tool Calling Conventions -
>>>> https://autotools.io/pkgconfig/cross-compiling.html
>>>>
>>>> On Tue, Nov 30, 2021 at 12:13 PM Alexander Kanavin <
>>>> alex.kanavin@gmail.com> wrote:
>>>>
>>>>> On Tue, 30 Nov 2021 at 21:00, Joel Winarske <joel.winarske@gmail.com>
>>>>> wrote:
>>>>>
>>>>>> Yes, if the sys_root key value in meson.cross is present
>>>>>> PKG_CONFIG_SYSROOT_DIR gets set.  Honister patch I confirmed with:
>>>>>>
>>>>>> https://github.com/jwinarske/manifests/blob/honister/rpi64/0001-Add-sys_root-to-properties-section.patch
>>>>>>
>>>>>> The issue is that meson doesn't pass PKG_CONFIG_SYSROOT_DIR to the
>>>>>> shell environment that runs pkg-config, as with the pkg-config sandbox test
>>>>>> it does work.
>>>>>>
>>>>>
>>>>> Both meson source code and its documentation indicate otherwise - if
>>>>> you set sys_root property, it will get passed to pkg-config via environment
>>>>> as PKG_CONFIG_SYSROOT_DIR:
>>>>>
>>>>> https://github.com/mesonbuild/meson/blob/master/mesonbuild/dependencies/pkgconfig.py#L121
>>>>>
>>>>> Alex
>>>>>
>>>>>

--0000000000009a533205d21e052d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Forgot the reply all, not intentional :)<br></div><di=
v><br></div><div>Looks like the build is using the pkgconfig flavor: meta/r=
ecipes-devtools/pkgconfig/<a href=3D"http://pkgconfig_git.bb">pkgconfig_git=
.bb</a><br><br></div><div>Perhaps I just need a PREFERRED_PROVIDER_pkgconfi=
g ?=3D &quot;pkg-config&quot; and pkg-config recipe, then perhaps it will j=
ust work.<br></div><div></div></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Wed, Dec 1, 2021 at 2:39 PM Alexander Kana=
vin &lt;<a href=3D"mailto:alex.kanavin@gmail.com">alex.kanavin@gmail.com</a=
>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><di=
v dir=3D"ltr"><div>Please keep the conversation on the list.</div><div><br>=
</div><div>Those are two different, independently developed projects:</div>=
<div><a href=3D"https://gitlab.freedesktop.org/pkg-config/pkg-config" targe=
t=3D"_blank">https://gitlab.freedesktop.org/pkg-config/pkg-config</a></div>=
<div><a href=3D"https://github.com/pkgconf/pkgconf" target=3D"_blank">https=
://github.com/pkgconf/pkgconf</a></div><div>and they are not fully compatib=
le as you have just shown.<br></div><div><br></div><div>I&#39;m not sure ho=
w pkgconf is able to decide that includedir is a path (short of hardcoding =
that inside the source somewhere), but such logic needs to be carefully inv=
estigated before we make use of it, e.g. by switching to pkgconf in oe-core=
.<br></div><div><br></div><div>Alex<br></div></div><br><div class=3D"gmail_=
quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, 1 Dec 2021 at 23:31, J=
oel Winarske &lt;<a href=3D"mailto:joel.winarske@gmail.com" target=3D"_blan=
k">joel.winarske@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex"><div dir=3D"ltr"><div></div><div>pkg-config --ver=
sion ?<br></div><div><br></div><div>Using 0.29.2 I get the same output as y=
ou:</div><div>$ PKG_CONFIG_SYSROOT_DIR=3D$STAGING_DIR_TARGET /home/linuxbre=
w/.linuxbrew/bin/pkg-config --define-variable=3Dprefix=3D/opt --variable=3D=
includedir glesv2<br>/usr/include</div><div><br></div><div>Using 1.7.3 it w=
orks:</div><div>STAGING_DIR_TARGET=3D/b/github-ci/_work/meta-flutter/rpi4-d=
rm-honister-latest/raspberrypi4-64/tmp/work/cortexa72-poky-linux/vkmark/git=
-r0/recipe-sysroot</div><div></div><div></div><div>PKG_CONFIG_SYSROOT_DIR=
=3D$STAGING_DIR_TARGET /usr/bin/pkg-config --variable=3Dincludedir glesv2<b=
r>/b/github-ci/_work/meta-flutter/rpi4-drm-honister-latest/raspberrypi4-64/=
tmp/work/cortexa72-poky-linux/vkmark/git-r0/recipe-sysroot/usr/include</div=
><div><br></div><div>$ /usr/bin/pkg-config --version<br>1.7.3</div><div><br=
></div><div>$ /home/linuxbrew/.linuxbrew/bin/pkg-config --version<br>0.29.2=
<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gm=
ail_attr">On Wed, Dec 1, 2021 at 12:36 AM Alexander Kanavin &lt;<a href=3D"=
mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.kanavin@gmail.com</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div=
 dir=3D"ltr"><div>No, it&#39;s not that. Even if you pass PKG_CONFIG_SYSROO=
T_DIR to pkg-config directly, it will apply that only to --cflags and simil=
ar, but not to generic --variable. Try this:</div><div><br></div><div>alex@=
alex-lx-laptop:~$ PKG_CONFIG_SYSROOT_DIR=3D/aaaa pkg-config libdrm --cflags=
<br>-I/aaaa/usr/include/libdrm<br>alex@alex-lx-laptop:~$ PKG_CONFIG_SYSROOT=
_DIR=3D/aaaa pkg-config libdrm --variable=3Dincludedir<br>/usr/include</div=
><div><br></div><div>So a wrapper will not solve the &#39;includedir prefix=
&#39; problem, and neither the wrapper, nor pkg-config or meson can possibl=
y know which variable is a path, and which isn&#39;t - the only place where=
 that is known is the component that obtains the variable. And so that&#39;=
s where it has to be prefixed.<br></div><div><br></div><div>Alex<br></div><=
/div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">O=
n Tue, 30 Nov 2021 at 23:38, Joel Winarske &lt;<a href=3D"mailto:joel.winar=
ske@gmail.com" target=3D"_blank">joel.winarske@gmail.com</a>&gt; wrote:<br>=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><d=
iv>Based on my testing, if PKG_CONFIG_SYSROOT_DIR is set or not makes zero =
difference on the outcome.=C2=A0 I suspect this is related to how pkg-confi=
g is launched by meson.<br></div><div><br></div><div>Looking at the meson s=
ource tree, in all ci/test cross compile=20
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
</blockquote></div>

--0000000000009a533205d21e052d--

