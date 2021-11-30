Return-Path: <joel.winarske@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0125C433EF
	for <webhook@archiver.kernel.org>; Tue, 30 Nov 2021 20:03:26 +0000 (UTC)
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com
 [209.85.222.53])
 by mx.groups.io with SMTP id smtpd.web11.81733.1638302605515921812
 for <Openembedded-core@lists.openembedded.org>;
 Tue, 30 Nov 2021 12:03:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=poZC3tGO;
 spf=pass (domain: gmail.com, ip: 209.85.222.53,
 mailfrom: joel.winarske@gmail.com)
Received: by mail-ua1-f53.google.com with SMTP id w23so43968575uao.5
        for <Openembedded-core@lists.openembedded.org>;
 Tue, 30 Nov 2021 12:03:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4rmRSAYCvpUL9XXj2qYC8uF/ER0FwyWvOUc8bm217lk=;
        b=poZC3tGOUDjFmClYGWC4ZStKNF9/3BgSbYxIH9Y/VqgeOn7LmfZUtv1yra5U+zzd5k
         E0ATC2NoebNThZ0G6Lj3k47nkANME0Roc6i8cijT+VxnWPGYnoxxNzcewpJ0Qcy4EmOS
         qUd616DDFce8piiWUShKV2S5Dq3LSvvJAQpRIlP6BW2nMT74CrRidCrtHkQW9IGcH/Gl
         ekj7xixC43cug2hf3SEm5ddh5WWnr3UlYm57thWPGxIG/3Wyi/SkKZPDaHWv1r6v4i8B
         L3Y2k6X43QyTZQkE4OHODOKGxaSF3V6I86eTvhPKIKGpCy2gVVd/dcxq/jzMfJViZVGl
         Zwvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4rmRSAYCvpUL9XXj2qYC8uF/ER0FwyWvOUc8bm217lk=;
        b=KFcBaQ+YJ+qKnKlHMpf/R3kcNoMpjyUb/nPmU93T9vVxYY1XDixP1PBhaaI85WaHtc
         aPzz6ud8g2xYAHKb25R7fduxQa3Ht9a3JF1go/n8FCXKwxoyxGYwl3oypQ3UODioRR2e
         dsGFG/hrdtZ8WMS67+InHh3YuHdwTv14YCNz7bLVBKI4xjTZ1ffPicGOp/d5l2XoHVs3
         AC7+f7SpNHzPLEaiCn92lS35z+UVNC+WzFyFS/+0VBkSQ9TtelBcvuzsLetMMv7jzjX5
         xHsbrs+FHIdv9Bv4eq0kIH1OC8Hd/636cVsTAeviLVuwSUYtrMBUJ31C2cWb3BoDcizt
         nzdw==
X-Gm-Message-State: AOAM533p4Vp+0Fs3HwiX7StUMtBR4qlKOUeOdFB3xPdRV6WfR/x6hJoB
	7ST5kyjtYvdF4mwi6+e1HnoHxl8O5+A87ktbTuU=
X-Google-Smtp-Source: 
 ABdhPJwYrGo/XXBnlz7SSi1muqlewi86eYG/b+35r+dP09kvfnWXN0BX/AOW5Lc9suCHmVhF5p7db4fR3beJyMMEI28=
X-Received: by 2002:a67:e90d:: with SMTP id c13mr2192614vso.12.1638302604574;
 Tue, 30 Nov 2021 12:03:24 -0800 (PST)
MIME-Version: 1.0
References: 
 <CABKMkPJoE74O2OnAe7WsLSu56Ww4ZfPfxksZ43-Np43otAhRWA@mail.gmail.com>
 <CANNYZj-DYfd_erYQYNzATL5K_rUMfDrrvzsWD2h0n_=_kXTBxA@mail.gmail.com>
 <CABKMkP+1pDhZqzGwz-6baUnhEhsOopGonP5d7njNJ0WxsfgLEA@mail.gmail.com>
 <CANNYZj8+jV09y-p1Fciw6xY_PHabj1DtEdG0ywxGpBOgHrUoyw@mail.gmail.com>
 <CABKMkP+P1cZbuTL-tDFB-TeLB=AAwCc_zWy_D-+C_cDkz19onQ@mail.gmail.com>
 <CANNYZj8EGG17430TY6en_xqcixWXTZ0PTgjfwKerre7EN2O+cA@mail.gmail.com>
 <CABKMkPLw3w+3SSXUVfnKcqfsM-QWeUJ=DpPap=aoXJ=Bt8mD=A@mail.gmail.com>
In-Reply-To: 
 <CABKMkPLw3w+3SSXUVfnKcqfsM-QWeUJ=DpPap=aoXJ=Bt8mD=A@mail.gmail.com>
From: Joel Winarske <joel.winarske@gmail.com>
Date: Tue, 30 Nov 2021 12:03:13 -0800
Message-ID: 
 <CABKMkPKE7PVKCN2GvDM96PyB_QeNOwbNsPh_f9595=4F7erkvA@mail.gmail.com>
Subject: Re: [OE-core] [RFC] meson needs a pkg-config wrapper script
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <Openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000c7c30705d2070cf3"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Nov 2021 20:03:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158992

--000000000000c7c30705d2070cf3
Content-Type: text/plain; charset="UTF-8"

Also all of the above requires this change:
https://github.com/KhronosGroup/Vulkan-Loader/pull/756


On Tue, Nov 30, 2021 at 12:00 PM Joel Winarske <joel.winarske@gmail.com>
wrote:

> Yes, if the sys_root key value in meson.cross is present
> PKG_CONFIG_SYSROOT_DIR gets set.  Honister patch I confirmed with:
>
> https://github.com/jwinarske/manifests/blob/honister/rpi64/0001-Add-sys_root-to-properties-section.patch
>
> The issue is that meson doesn't pass PKG_CONFIG_SYSROOT_DIR to the shell
> environment that runs pkg-config, as with the pkg-config sandbox test it
> does work.
>
>
> On Tue, Nov 30, 2021 at 11:40 AM Alexander Kanavin <alex.kanavin@gmail.com>
> wrote:
>
>> I am seeing in mesonbuild/dependencies/pkgconfig.py
>>
>>         sysroot = environment.properties[for_machine].get_sys_root()
>>         if sysroot:
>>             env['PKG_CONFIG_SYSROOT_DIR'] = sysroo
>>
>> So we probably need to ensure this 'sys_root' is correctly set, and then
>> things will simply work?
>>
>> Alex
>>
>> On Tue, 30 Nov 2021 at 20:15, Joel Winarske <joel.winarske@gmail.com>
>> wrote:
>>
>>> https://github.com/vkmark/vkmark/blob/master/src/meson.build#L9
>>>
>>> On Tue, Nov 30, 2021 at 10:53 AM Alexander Kanavin <
>>> alex.kanavin@gmail.com> wrote:
>>>
>>>> I do not quite understand the use case. What is being done with the
>>>> full path to the header?
>>>>
>>>> Alex
>>>>
>>>> On Tue, 30 Nov 2021 at 19:26, Joel Winarske <joel.winarske@gmail.com>
>>>> wrote:
>>>>
>>>>> This pattern works to get the absolute path of the header:
>>>>>
>>>>> Yocto
>>>>>
>>>>>     EXTRA_OEMESON += "--prefix ${STAGING_DIR_TARGET}/usr"
>>>>>
>>>>> Meson
>>>>>
>>>>>     vulkan_dep = dependency('vulkan')
>>>>>     vulkan_hpp = join_paths([
>>>>>         vulkan_dep.get_pkgconfig_variable('includedir',
>>>>> define_variable: ['prefix', get_option('prefix')]),
>>>>>         'vulkan',
>>>>>         'vulkan.hpp'
>>>>>         ])
>>>>>
>>>>> Implementation in build/meson-log.txt
>>>>>
>>>>> Called
>>>>> `/b/github-ci/_work/meta-flutter/rpi4-drm-honister-latest/rpi4/tmp/work/cortexa72-poky-linux/vkmark/git-r0/recipe-sysroot-native/usr/bin/pkg-config
>>>>> --define-variable=prefix=/b/github-ci/_work/meta-flutter/rpi4-drm-honister-latest/rpi4/tmp/work/cortexa72-poky-linux/vkmark/git-r0/recipe-sysroot/usr
>>>>> --variable=includedir vulkan` -> 0
>>>>>
>>>>>
>>>>> One would expect the following meson to work if STAGING_DIR_TARGET
>>>>> were set, as that's how pkg-config works:
>>>>>
>>>>>     vulkan_dep = dependency('vulkan')
>>>>>     vulkan_hpp = join_paths([
>>>>>         vulkan_dep.get_pkgconfig_variable('includedir'),
>>>>>         'vulkan',
>>>>>         'vulkan.hpp'
>>>>>         ])
>>>>>
>>>>> This will always return /usr/include/vulkan/vulkan.hpp regardless of
>>>>> PKG_CONFIG_SYSROOT_DIR value.  With PKG_CONFIG_SYSROOT_DIR set, it should
>>>>> be /usr/include/vulkan/vulkan.hpp with prepend of PKG_CONFIG_SYSROOT_DIR
>>>>> value.
>>>>>
>>>>>
>>>>> Sandbox testing of pkg-config
>>>>>
>>>>>     $ export
>>>>> STAGING_DIR_TARGET=/b/github-ci/_work/meta-flutter/rpi4-drm-honister-latest/raspberrypi4-64/tmp/work/cortexa72-poky-linux/vkmark/git-r0/recipe-sysroot
>>>>>     $ PKG_CONFIG_SYSROOT_DIR=$STAGING_DIR_TARGET pkg-config
>>>>> --define-variable=prefix=/opt --variable=includedir vulkan
>>>>>
>>>>> /b/github-ci/_work/meta-flutter/rpi4-drm-honister-latest/raspberrypi4-64/tmp/work/cortexa72-poky-linux/vkmark/git-r0/recipe-sysroot/opt/include
>>>>>
>>>>>
>>>>> meson.cross
>>>>>
>>>>> Setting sys_root in the properties section of meson.cross (patching
>>>>> meson.bbclass) indirectly sets PKG_CONFIG_SYSROOT_DIR.  The setting of
>>>>> sys_root is present in nativesdk_meson*.bb, not meson*.bb.
>>>>>
>>>>> The issue for meson is that they are not passing the
>>>>> PKG_CONFIG_SYSROOT_DIR variable to the shell that launches pkg-config.
>>>>>
>>>>> My proposed work around (this email thread) would fix the behavior.  I
>>>>> believe the proper fix is for meson to address upstream.  Still waiting on
>>>>> a response from them: https://github.com/mesonbuild/meson/issues/9674
>>>>>
>>>>>
>>>>> Joel
>>>>>
>>>>> On Tue, Nov 30, 2021 at 9:49 AM Alexander Kanavin <
>>>>> alex.kanavin@gmail.com> wrote:
>>>>>
>>>>>> On Tue, 30 Nov 2021 at 18:20, Joel Winarske <joel.winarske@gmail.com>
>>>>>> wrote:
>>>>>>
>>>>>>> Meson does not expose PKG_CONFIG_SYSROOT_DIR to the pkg-config
>>>>>>> process.
>>>>>>>
>>>>>>> Currently meson.cross as generated in meson.bbclass points directly
>>>>>>> to the pkg-config executable (no wrapper script).
>>>>>>>
>>>>>>> PKG_CONFIG_SYSROOT_DIR behaves like a simple string prepend to all
>>>>>>> package config variable queries.  So if you want to determine the absolute
>>>>>>> path of a variable in .pc you set PKG_CONFIG_SYSROOT_DIR and make your
>>>>>>> query.  Currently this is not possible with Yocto+Meson.
>>>>>>>
>>>>>>> I think a simple wrapper script would resolve this.  This is from
>>>>>>> https://autotools.io/pkgconfig/cross-compiling.html:
>>>>>>>
>>>>>>> #!/bin/sh
>>>>>>>
>>>>>>> SYSROOT=/build/root
>>>>>>>
>>>>>>> export PKG_CONFIG_PATH=
>>>>>>> export PKG_CONFIG_LIBDIR=${SYSROOT}/usr/lib/pkgconfig:${SYSROOT}/usr/share/pkgconfig
>>>>>>> export PKG_CONFIG_SYSROOT_DIR=${SYSROOT}
>>>>>>>
>>>>>>> exec pkg-config "$@"
>>>>>>>
>>>>>>>
>>>>>>> The wrapper script would be generated per recipe via meson.bbclass,
>>>>>>> meson.cross would then reference this wrapper instead of the pkg-config
>>>>>>> executable.
>>>>>>>
>>>>>>> Thoughts?
>>>>>>>
>>>>>>
>>>>>> I don't think this is correct. Meson's way of doing things is that
>>>>>> you are not supposed to get the include/library paths directly from
>>>>>> pkg-config, but rather use
>>>>>> https://mesonbuild.com/Reference-manual_functions.html#dependency
>>>>>> and meson will take care of any needed prefixes to the paths.
>>>>>>
>>>>>> For the custom variables defined in .pc that happen to contain paths,
>>>>>> PKG_CONFIG_SYSROOT_DIR has no effect at all, so you need to manually
>>>>>> prepend it anyway everywhere where they're used. pkg-config does not know
>>>>>> what variable is a path and what isn't.
>>>>>>
>>>>>> Alex
>>>>>>
>>>>>

--000000000000c7c30705d2070cf3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Also all of the above requires this change: <a href=
=3D"https://github.com/KhronosGroup/Vulkan-Loader/pull/756">https://github.=
com/KhronosGroup/Vulkan-Loader/pull/756</a></div><div><br></div></div><br><=
div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Nov=
 30, 2021 at 12:00 PM Joel Winarske &lt;<a href=3D"mailto:joel.winarske@gma=
il.com">joel.winarske@gmail.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div>Yes, if the sys_root=
 key value in meson.cross is present PKG_CONFIG_SYSROOT_DIR gets set.=C2=A0=
 Honister patch I confirmed with:<br><a href=3D"https://github.com/jwinarsk=
e/manifests/blob/honister/rpi64/0001-Add-sys_root-to-properties-section.pat=
ch" target=3D"_blank">https://github.com/jwinarske/manifests/blob/honister/=
rpi64/0001-Add-sys_root-to-properties-section.patch</a></div><div><br></div=
><div>The issue is that meson doesn&#39;t pass PKG_CONFIG_SYSROOT_DIR to th=
e shell environment that runs pkg-config, as with the pkg-config sandbox te=
st it does work.<br></div><br></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Tue, Nov 30, 2021 at 11:40 AM Alexander Ka=
navin &lt;<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.=
kanavin@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex"><div dir=3D"ltr"><div>I am seeing in mesonbuild/dependenci=
es/pkgconfig.py</div><div><br></div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 sysroo=
t =3D environment.properties[for_machine].get_sys_root()<br>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 if sysroot:<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 env[=
&#39;PKG_CONFIG_SYSROOT_DIR&#39;] =3D sysroo</div><div><br></div><div>So we=
 probably need to ensure this &#39;sys_root&#39; is correctly set, and then=
 things will simply work?<br></div><div><div><br></div><div>Alex<br></div><=
/div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_a=
ttr">On Tue, 30 Nov 2021 at 20:15, Joel Winarske &lt;<a href=3D"mailto:joel=
.winarske@gmail.com" target=3D"_blank">joel.winarske@gmail.com</a>&gt; wrot=
e:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"l=
tr"><div><a href=3D"https://github.com/vkmark/vkmark/blob/master/src/meson.=
build#L9" target=3D"_blank">https://github.com/vkmark/vkmark/blob/master/sr=
c/meson.build#L9</a></div></div><br><div class=3D"gmail_quote"><div dir=3D"=
ltr" class=3D"gmail_attr">On Tue, Nov 30, 2021 at 10:53 AM Alexander Kanavi=
n &lt;<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.kana=
vin@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex"><div dir=3D"ltr"><div>I do not quite understand the use case. =
What is being done with the full path to the header?</div><div><br></div><d=
iv>Alex<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" clas=
s=3D"gmail_attr">On Tue, 30 Nov 2021 at 19:26, Joel Winarske &lt;<a href=3D=
"mailto:joel.winarske@gmail.com" target=3D"_blank">joel.winarske@gmail.com<=
/a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><=
div dir=3D"ltr"><div>This pattern works to get the absolute path of the hea=
der:<br></div><div><br></div><div></div><div>Yocto</div><br>=C2=A0 =C2=A0 E=
XTRA_OEMESON +=3D &quot;--prefix ${STAGING_DIR_TARGET}/usr&quot;<br><br><di=
v></div><div>Meson</div><br>=C2=A0 =C2=A0 vulkan_dep =3D dependency(&#39;vu=
lkan&#39;)<br>=C2=A0 =C2=A0 vulkan_hpp =3D join_paths([<br>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 vulkan_dep.get_pkgconfig_variable(&#39;includedir&#39;, defin=
e_variable: [&#39;prefix&#39;, get_option(&#39;prefix&#39;)]),<br>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 &#39;vulkan&#39;,<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;=
vulkan.hpp&#39;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 ])<br><br><div></div><div>Im=
plementation in build/meson-log.txt</div><br><div>Called `/b/github-ci/_wor=
k/meta-flutter/rpi4-drm-honister-latest/rpi4/tmp/work/cortexa72-poky-linux/=
vkmark/git-r0/recipe-sysroot-native/usr/bin/pkg-config --define-variable=3D=
prefix=3D/b/github-ci/_work/meta-flutter/rpi4-drm-honister-latest/rpi4/tmp/=
work/cortexa72-poky-linux/vkmark/git-r0/recipe-sysroot/usr --variable=3Dinc=
ludedir vulkan` -&gt; 0</div><div><br></div><div><br></div><div>One would e=
xpect the following meson to work if STAGING_DIR_TARGET were set, as that&#=
39;s how pkg-config works:<br></div><div><br></div><div>=C2=A0 =C2=A0 vulka=
n_dep =3D dependency(&#39;vulkan&#39;)<br>=C2=A0 =C2=A0 vulkan_hpp =3D join=
_paths([<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 vulkan_dep.get_pkgconfig_variable(&=
#39;includedir&#39;),<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;vulkan&#39;,<br>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;vulkan.hpp&#39;<br>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 ])</div><div><br></div><div>This will always return /usr/include/vul=
kan/vulkan.hpp regardless of PKG_CONFIG_SYSROOT_DIR value.=C2=A0 With PKG_C=
ONFIG_SYSROOT_DIR set, it should be /usr/include/vulkan/vulkan.hpp with pre=
pend of PKG_CONFIG_SYSROOT_DIR value.<br></div><div><br></div><div><br></di=
v><div>Sandbox testing of pkg-config</div><div><br></div><div>=C2=A0=C2=A0=
=C2=A0 $ export STAGING_DIR_TARGET=3D/b/github-ci/_work/meta-flutter/rpi4-d=
rm-honister-latest/raspberrypi4-64/tmp/work/cortexa72-poky-linux/vkmark/git=
-r0/recipe-sysroot<br>=C2=A0=C2=A0=C2=A0 $ PKG_CONFIG_SYSROOT_DIR=3D$STAGIN=
G_DIR_TARGET pkg-config --define-variable=3Dprefix=3D/opt --variable=3Dincl=
udedir vulkan<br>/b/github-ci/_work/meta-flutter/rpi4-drm-honister-latest/r=
aspberrypi4-64/tmp/work/cortexa72-poky-linux/vkmark/git-r0/recipe-sysroot/o=
pt/include</div><div><br></div><div><br></div><div>meson.cross</div><div><b=
r></div><div>Setting sys_root in the properties section of meson.cross (pat=
ching meson.bbclass) indirectly sets PKG_CONFIG_SYSROOT_DIR.=C2=A0 The sett=
ing of sys_root is present in nativesdk_meson*.bb, not meson*.bb.<br></div>=
<div><br></div><div>The issue for meson is that they are not passing the PK=
G_CONFIG_SYSROOT_DIR variable to the shell that launches pkg-config.<br></d=
iv><div></div><br><div>My proposed work around (this email thread) would fi=
x the behavior.=C2=A0 I believe the proper fix is for meson to address upst=
ream.=C2=A0 Still waiting on a response from them: <a href=3D"https://githu=
b.com/mesonbuild/meson/issues/9674" target=3D"_blank">https://github.com/me=
sonbuild/meson/issues/9674</a></div><div><br></div><div><br></div><div>Joel=
<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gm=
ail_attr">On Tue, Nov 30, 2021 at 9:49 AM Alexander Kanavin &lt;<a href=3D"=
mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.kanavin@gmail.com</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div=
 dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_att=
r">On Tue, 30 Nov 2021 at 18:20, Joel Winarske &lt;<a href=3D"mailto:joel.w=
inarske@gmail.com" target=3D"_blank">joel.winarske@gmail.com</a>&gt; wrote:=
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr=
"><div><div>Meson does not expose PKG_CONFIG_SYSROOT_DIR to the pkg-config =
process.</div></div><div><br></div><div>Currently meson.cross as generated =
in meson.bbclass points directly to the pkg-config executable (no wrapper s=
cript).</div><div><br></div><div>PKG_CONFIG_SYSROOT_DIR behaves like a simp=
le string prepend to all package config variable queries.=C2=A0 So if you w=
ant to determine the absolute path of a variable in .pc you set PKG_CONFIG_=
SYSROOT_DIR and make your query.=C2=A0 Currently this is not possible with =
Yocto+Meson.<br></div><div><br></div>I think a simple wrapper script would =
resolve this.=C2=A0 This is from <a href=3D"https://autotools.io/pkgconfig/=
cross-compiling.html" target=3D"_blank">https://autotools.io/pkgconfig/cros=
s-compiling.html</a>:<br><div><pre>#!/bin/sh

SYSROOT=3D/build/root

export PKG_CONFIG_PATH=3D
export PKG_CONFIG_LIBDIR=3D${SYSROOT}/usr/lib/pkgconfig:${SYSROOT}/usr/shar=
e/pkgconfig
export PKG_CONFIG_SYSROOT_DIR=3D${SYSROOT}

exec pkg-config &quot;$@&quot;</pre></div><div><br></div><div>The wrapper s=
cript would be generated per recipe via meson.bbclass, meson.cross would th=
en reference this wrapper instead of the pkg-config executable.<br></div><d=
iv><br></div><div>Thoughts?<br></div></div></blockquote><div><br></div>I do=
n&#39;t think this is correct. Meson&#39;s way of doing things is that you =
are not supposed to get the include/library paths directly from pkg-config,=
 but rather use</div><div class=3D"gmail_quote"><a href=3D"https://mesonbui=
ld.com/Reference-manual_functions.html#dependency" target=3D"_blank">https:=
//mesonbuild.com/Reference-manual_functions.html#dependency</a> and meson w=
ill take care of any needed prefixes to the paths.</div><div class=3D"gmail=
_quote"><br></div><div class=3D"gmail_quote">For the custom variables defin=
ed in .pc that happen to contain paths, PKG_CONFIG_SYSROOT_DIR has no effec=
t at all, so you need to manually prepend it anyway everywhere where they&#=
39;re used. pkg-config does not know what variable is a path and what isn&#=
39;t.<br></div><div class=3D"gmail_quote"><br></div><div class=3D"gmail_quo=
te">Alex<br></div></div>
</blockquote></div>
</blockquote></div>
</blockquote></div>
</blockquote></div>
</blockquote></div>
</blockquote></div>

--000000000000c7c30705d2070cf3--

