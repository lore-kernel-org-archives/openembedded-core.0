Return-Path: <joel.winarske@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23741C433EF
	for <webhook@archiver.kernel.org>; Wed,  1 Dec 2021 23:57:13 +0000 (UTC)
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com
 [209.85.222.47])
 by mx.groups.io with SMTP id smtpd.web10.1505.1638403031832790491
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Dec 2021 15:57:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Fi4AZPEp;
 spf=pass (domain: gmail.com, ip: 209.85.222.47,
 mailfrom: joel.winarske@gmail.com)
Received: by mail-ua1-f47.google.com with SMTP id ay21so52544657uab.12
        for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Dec 2021 15:57:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=5Bc1bQJisBYOI+SNtvIYi/DkNb1ef7EoAbadFQ5osjM=;
        b=Fi4AZPEppMekx9IG1NZiznxIXC+Izw6yXCrzTLM0EXvCzpbkoHQtA2RXXECeHD1noP
         /1UdszFss0hMBJv47j8hqLOgy+T8DWHOpKIEUi/crc0UI0p0KS7H0dcw0Wu0cyqR7a0g
         iAlmbTVbGnPBoprKUqOnXl4x8boYNqvZ7N8tzRiG356ZYa/yi3KW0EV/DrOqAx/m4BrL
         u4bPE4h9o3JC/+dnfaLkZ++FHskGmPllLVm0koVLxuX+ReLbQQpQHE8qzSy8Fron2T77
         2/kOLLYfNMXPfOuZzon38f/fv4XG4ic0KXz3g2+aa6piATy3N1p69K3kkWCJ1JN8NU1S
         250A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=5Bc1bQJisBYOI+SNtvIYi/DkNb1ef7EoAbadFQ5osjM=;
        b=HjJlogypqXV2ZbVxVhFIwvGEJJXDdu/rem/THDQbu2ERNCUWL6yrT0Sskt3+NzV3Zv
         mV880mQg0EMze0LNKPV+A1LlJBQjQMTqKbsPyl+zencMsIJ8TUhYA7r31GAql7a21UtB
         SJdtfrJPoKfvRbimvK6oQrVlvVYzSBlI5aUe049pN5XMbD6N90HNTlJ8ggxkrxzlPkf/
         QpKyM7CEnyTvn2mbHIGBUADiInv8Uin3vrvjS8Wj4SKt1kmYKEpZN1xVezhwmwZrT9hj
         xf/vIRrA67iV8VSV8bx05m/gTKqWFWHCGvwEA2Ez/TFgNb8fMCvehs0lUT3VpIlOCeb4
         4z/g==
X-Gm-Message-State: AOAM530s2D/3ElNbYwN2evM3iQ2F8tMLW4oOUBJRtHjFxInCDrjqIxa/
	ngJGYbG5RnfYAw2lyTtzRyrOz90sIiSzjMkev48=
X-Google-Smtp-Source: 
 ABdhPJyZwr6zc5tRBtk0gKtYT27WMDfvwO0Q0qrZNEzdcAnoWUGyou5CPAntCPkbILQxlnjcU8rWYuy8r4tCHKwhnoc=
X-Received: by 2002:a05:6102:5489:: with SMTP id
 bk9mr12719064vsb.37.1638403030819;
 Wed, 01 Dec 2021 15:57:10 -0800 (PST)
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
 <16BCC5463709ABBF.10763@lists.openembedded.org>
In-Reply-To: <16BCC5463709ABBF.10763@lists.openembedded.org>
From: Joel Winarske <joel.winarske@gmail.com>
Date: Wed, 1 Dec 2021 15:56:59 -0800
Message-ID: 
 <CABKMkP+t=Cgj9GJ1BcaDWc3Cu9xz+Yq2hYrGahdLxpPa3OnV1w@mail.gmail.com>
Subject: Re: [OE-core] [RFC] meson needs a pkg-config wrapper script
To: Alexander Kanavin <alex.kanavin@gmail.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000a6a53605d21e6ea9"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Dec 2021 23:57:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159069

--000000000000a6a53605d21e6ea9
Content-Type: text/plain; charset="UTF-8"

Actually the recipe pkgconfig_git.bb points to the freedesktop pkg-config
repo, which is used by default.

On Wed, Dec 1, 2021 at 3:27 PM Joel Winarske via lists.openembedded.org
<joel.winarske=gmail.com@lists.openembedded.org> wrote:

> Forgot the reply all, not intentional :)
>
> Looks like the build is using the pkgconfig flavor:
> meta/recipes-devtools/pkgconfig/pkgconfig_git.bb
>
> Perhaps I just need a PREFERRED_PROVIDER_pkgconfig ?= "pkg-config" and
> pkg-config recipe, then perhaps it will just work.
>
> On Wed, Dec 1, 2021 at 2:39 PM Alexander Kanavin <alex.kanavin@gmail.com>
> wrote:
>
>> Please keep the conversation on the list.
>>
>> Those are two different, independently developed projects:
>> https://gitlab.freedesktop.org/pkg-config/pkg-config
>> https://github.com/pkgconf/pkgconf
>> and they are not fully compatible as you have just shown.
>>
>> I'm not sure how pkgconf is able to decide that includedir is a path
>> (short of hardcoding that inside the source somewhere), but such logic
>> needs to be carefully investigated before we make use of it, e.g. by
>> switching to pkgconf in oe-core.
>>
>> Alex
>>
>> On Wed, 1 Dec 2021 at 23:31, Joel Winarske <joel.winarske@gmail.com>
>> wrote:
>>
>>> pkg-config --version ?
>>>
>>> Using 0.29.2 I get the same output as you:
>>> $ PKG_CONFIG_SYSROOT_DIR=$STAGING_DIR_TARGET
>>> /home/linuxbrew/.linuxbrew/bin/pkg-config --define-variable=prefix=/opt
>>> --variable=includedir glesv2
>>> /usr/include
>>>
>>> Using 1.7.3 it works:
>>>
>>> STAGING_DIR_TARGET=/b/github-ci/_work/meta-flutter/rpi4-drm-honister-latest/raspberrypi4-64/tmp/work/cortexa72-poky-linux/vkmark/git-r0/recipe-sysroot
>>> PKG_CONFIG_SYSROOT_DIR=$STAGING_DIR_TARGET /usr/bin/pkg-config
>>> --variable=includedir glesv2
>>>
>>> /b/github-ci/_work/meta-flutter/rpi4-drm-honister-latest/raspberrypi4-64/tmp/work/cortexa72-poky-linux/vkmark/git-r0/recipe-sysroot/usr/include
>>>
>>> $ /usr/bin/pkg-config --version
>>> 1.7.3
>>>
>>> $ /home/linuxbrew/.linuxbrew/bin/pkg-config --version
>>> 0.29.2
>>>
>>> On Wed, Dec 1, 2021 at 12:36 AM Alexander Kanavin <
>>> alex.kanavin@gmail.com> wrote:
>>>
>>>> No, it's not that. Even if you pass PKG_CONFIG_SYSROOT_DIR to
>>>> pkg-config directly, it will apply that only to --cflags and similar, but
>>>> not to generic --variable. Try this:
>>>>
>>>> alex@alex-lx-laptop:~$ PKG_CONFIG_SYSROOT_DIR=/aaaa pkg-config libdrm
>>>> --cflags
>>>> -I/aaaa/usr/include/libdrm
>>>> alex@alex-lx-laptop:~$ PKG_CONFIG_SYSROOT_DIR=/aaaa pkg-config libdrm
>>>> --variable=includedir
>>>> /usr/include
>>>>
>>>> So a wrapper will not solve the 'includedir prefix' problem, and
>>>> neither the wrapper, nor pkg-config or meson can possibly know which
>>>> variable is a path, and which isn't - the only place where that is known is
>>>> the component that obtains the variable. And so that's where it has to be
>>>> prefixed.
>>>>
>>>> Alex
>>>>
>>>> On Tue, 30 Nov 2021 at 23:38, Joel Winarske <joel.winarske@gmail.com>
>>>> wrote:
>>>>
>>>>> Based on my testing, if PKG_CONFIG_SYSROOT_DIR is set or not makes
>>>>> zero difference on the outcome.  I suspect this is related to how
>>>>> pkg-config is launched by meson.
>>>>>
>>>>> Looking at the meson source tree, in all ci/test cross compile
>>>>> scenarios they reference a pkg-config wrapper.  No cross compile scenario I
>>>>> see referencing the 'pkgconfig' key uses a bare pkg-config.
>>>>>
>>>>>     cross/armclang-linux.txt:#pkgconfig =
>>>>> '/usr/bin/arm-linux-gnueabihf-pkg-config'
>>>>>     cross/linux-mingw-w64-32bit.txt:pkgconfig =
>>>>> '/usr/bin/i686-w64-mingw32-pkg-config'
>>>>>     cross/linux-mingw-w64-64bit.txt:pkgconfig =
>>>>> '/usr/bin/x86_64-w64-mingw32-pkg-config'
>>>>>     cross/ubuntu-armhf.txt:pkgconfig =
>>>>> '/usr/bin/arm-linux-gnueabihf-pkg-config'
>>>>>     test cases/unit/33 cross file overrides always
>>>>> args/ubuntu-armhf-overrides.txt:pkgconfig =
>>>>> '/usr/bin/arm-linux-gnueabihf-pkg-config'
>>>>>     test cases/unit/36 exe_wrapper
>>>>> behaviour/broken-cross.txt:pkgconfig =
>>>>> '/usr/bin/x86_64-w64-mingw32-pkg-config'
>>>>>
>>>>> I think adding a wrapper makes sense.
>>>>>
>>>>> 5.2 Tool Calling Conventions -
>>>>> https://autotools.io/pkgconfig/cross-compiling.html
>>>>>
>>>>> On Tue, Nov 30, 2021 at 12:13 PM Alexander Kanavin <
>>>>> alex.kanavin@gmail.com> wrote:
>>>>>
>>>>>> On Tue, 30 Nov 2021 at 21:00, Joel Winarske <joel.winarske@gmail.com>
>>>>>> wrote:
>>>>>>
>>>>>>> Yes, if the sys_root key value in meson.cross is present
>>>>>>> PKG_CONFIG_SYSROOT_DIR gets set.  Honister patch I confirmed with:
>>>>>>>
>>>>>>> https://github.com/jwinarske/manifests/blob/honister/rpi64/0001-Add-sys_root-to-properties-section.patch
>>>>>>>
>>>>>>> The issue is that meson doesn't pass PKG_CONFIG_SYSROOT_DIR to the
>>>>>>> shell environment that runs pkg-config, as with the pkg-config sandbox test
>>>>>>> it does work.
>>>>>>>
>>>>>>
>>>>>> Both meson source code and its documentation indicate otherwise - if
>>>>>> you set sys_root property, it will get passed to pkg-config via environment
>>>>>> as PKG_CONFIG_SYSROOT_DIR:
>>>>>>
>>>>>> https://github.com/mesonbuild/meson/blob/master/mesonbuild/dependencies/pkgconfig.py#L121
>>>>>>
>>>>>> Alex
>>>>>>
>>>>>>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#159068):
> https://lists.openembedded.org/g/openembedded-core/message/159068
> Mute This Topic: https://lists.openembedded.org/mt/87407703/2167248
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> joel.winarske@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--000000000000a6a53605d21e6ea9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Actually the recipe <span class=3D"gmail-im"><a href=3D"ht=
tp://pkgconfig_git.bb" target=3D"_blank">pkgconfig_git.bb</a></span> points=
 to the freedesktop pkg-config repo, which is used by default.</div><br><di=
v class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Dec 1=
, 2021 at 3:27 PM Joel Winarske via <a href=3D"http://lists.openembedded.or=
g">lists.openembedded.org</a> &lt;joel.winarske=3D<a href=3D"mailto:gmail.c=
om@lists.openembedded.org">gmail.com@lists.openembedded.org</a>&gt; wrote:<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"=
><div>Forgot the reply all, not intentional :)<br></div><div><br></div><div=
>Looks like the build is using the pkgconfig flavor: meta/recipes-devtools/=
pkgconfig/<a href=3D"http://pkgconfig_git.bb" target=3D"_blank">pkgconfig_g=
it.bb</a><br><br></div><div>Perhaps I just need a PREFERRED_PROVIDER_pkgcon=
fig ?=3D &quot;pkg-config&quot; and pkg-config recipe, then perhaps it will=
 just work.<br></div><div></div></div><br><div class=3D"gmail_quote"><div d=
ir=3D"ltr" class=3D"gmail_attr">On Wed, Dec 1, 2021 at 2:39 PM Alexander Ka=
navin &lt;<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.=
kanavin@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex"><div dir=3D"ltr"><div>Please keep the conversation on the =
list.</div><div><br></div><div>Those are two different, independently devel=
oped projects:</div><div><a href=3D"https://gitlab.freedesktop.org/pkg-conf=
ig/pkg-config" target=3D"_blank">https://gitlab.freedesktop.org/pkg-config/=
pkg-config</a></div><div><a href=3D"https://github.com/pkgconf/pkgconf" tar=
get=3D"_blank">https://github.com/pkgconf/pkgconf</a></div><div>and they ar=
e not fully compatible as you have just shown.<br></div><div><br></div><div=
>I&#39;m not sure how pkgconf is able to decide that includedir is a path (=
short of hardcoding that inside the source somewhere), but such logic needs=
 to be carefully investigated before we make use of it, e.g. by switching t=
o pkgconf in oe-core.<br></div><div><br></div><div>Alex<br></div></div><br>=
<div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, 1 =
Dec 2021 at 23:31, Joel Winarske &lt;<a href=3D"mailto:joel.winarske@gmail.=
com" target=3D"_blank">joel.winarske@gmail.com</a>&gt; wrote:<br></div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div></div><=
div>pkg-config --version ?<br></div><div><br></div><div>Using 0.29.2 I get =
the same output as you:</div><div>$ PKG_CONFIG_SYSROOT_DIR=3D$STAGING_DIR_T=
ARGET /home/linuxbrew/.linuxbrew/bin/pkg-config --define-variable=3Dprefix=
=3D/opt --variable=3Dincludedir glesv2<br>/usr/include</div><div><br></div>=
<div>Using 1.7.3 it works:</div><div>STAGING_DIR_TARGET=3D/b/github-ci/_wor=
k/meta-flutter/rpi4-drm-honister-latest/raspberrypi4-64/tmp/work/cortexa72-=
poky-linux/vkmark/git-r0/recipe-sysroot</div><div></div><div></div><div>PKG=
_CONFIG_SYSROOT_DIR=3D$STAGING_DIR_TARGET /usr/bin/pkg-config --variable=3D=
includedir glesv2<br>/b/github-ci/_work/meta-flutter/rpi4-drm-honister-late=
st/raspberrypi4-64/tmp/work/cortexa72-poky-linux/vkmark/git-r0/recipe-sysro=
ot/usr/include</div><div><br></div><div>$ /usr/bin/pkg-config --version<br>=
1.7.3</div><div><br></div><div>$ /home/linuxbrew/.linuxbrew/bin/pkg-config =
--version<br>0.29.2<br></div></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Wed, Dec 1, 2021 at 12:36 AM Alexander Kan=
avin &lt;<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.k=
anavin@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex"><div dir=3D"ltr"><div>No, it&#39;s not that. Even if you pa=
ss PKG_CONFIG_SYSROOT_DIR to pkg-config directly, it will apply that only t=
o --cflags and similar, but not to generic --variable. Try this:</div><div>=
<br></div><div>alex@alex-lx-laptop:~$ PKG_CONFIG_SYSROOT_DIR=3D/aaaa pkg-co=
nfig libdrm --cflags<br>-I/aaaa/usr/include/libdrm<br>alex@alex-lx-laptop:~=
$ PKG_CONFIG_SYSROOT_DIR=3D/aaaa pkg-config libdrm --variable=3Dincludedir<=
br>/usr/include</div><div><br></div><div>So a wrapper will not solve the &#=
39;includedir prefix&#39; problem, and neither the wrapper, nor pkg-config =
or meson can possibly know which variable is a path, and which isn&#39;t - =
the only place where that is known is the component that obtains the variab=
le. And so that&#39;s where it has to be prefixed.<br></div><div><br></div>=
<div>Alex<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" cl=
ass=3D"gmail_attr">On Tue, 30 Nov 2021 at 23:38, Joel Winarske &lt;<a href=
=3D"mailto:joel.winarske@gmail.com" target=3D"_blank">joel.winarske@gmail.c=
om</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
"><div dir=3D"ltr"><div>Based on my testing, if PKG_CONFIG_SYSROOT_DIR is s=
et or not makes zero difference on the outcome.=C2=A0 I suspect this is rel=
ated to how pkg-config is launched by meson.<br></div><div><br></div><div>L=
ooking at the meson source tree, in all ci/test cross compile=20
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
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#159068): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/159068" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/159068</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/87407703/2167=
248" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/87407703/2167248</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:joel.winarske@gmail.com" t=
arget=3D"_blank">joel.winarske@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--000000000000a6a53605d21e6ea9--

