Return-Path: <joel.winarske@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE769C433F5
	for <webhook@archiver.kernel.org>; Tue, 30 Nov 2021 20:00:30 +0000 (UTC)
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com
 [209.85.221.177])
 by mx.groups.io with SMTP id smtpd.web11.81690.1638302430076946765
 for <Openembedded-core@lists.openembedded.org>;
 Tue, 30 Nov 2021 12:00:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Vm1Uc/IB;
 spf=pass (domain: gmail.com, ip: 209.85.221.177,
 mailfrom: joel.winarske@gmail.com)
Received: by mail-vk1-f177.google.com with SMTP id 188so14446430vku.8
        for <Openembedded-core@lists.openembedded.org>;
 Tue, 30 Nov 2021 12:00:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cfoyHeo8sbFnnpKOUzk93Grtodl7FeRY4KRdq7teRDU=;
        b=Vm1Uc/IBpnvFt2GAOPSiFyTvpAxB+Slhki0jYjcdN1XSQISqvMNLlWWTUQ2PqR6+Ck
         SxmySgjsP2axUdSqZUEWv6qPh9f4J+Jaup+RLGZetBaF1hP+CjTz+/O2UZcSlvOmw3zF
         P+aan07jJq33i7DuzA6ojBd3P9X/U475+ONb1mZGHAfU5R1a3HBDI+b6qhudIB3I/I3j
         UrQ87XvuWT8uebqfXrzTSdTSp+hlRVvBo8SgCEkm0bN2aj2+Eu+3vEL1T63ivtO3TzZS
         TQ6RSOaJePNTZYwK/WqoUBC3pCy9qlhFS2oyU/jFixY4C4IUQS6cq7dlAVjHwJCDe4mh
         de2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cfoyHeo8sbFnnpKOUzk93Grtodl7FeRY4KRdq7teRDU=;
        b=HNCSRZak/N2dh+tTpHqKISnm3txOJ9e2XKBmXRmurdjYWdIREZY8WyJHh+rGWIg2yA
         g5VmnWCvsFDQrGSWhd7jXCfqOe+TmxtN2JxzxRPz9XaWCoR/Bw+jKf4WGX+2+LE2x8Q8
         a9nxoqQv8ifNrrQebPPTkSChFMFzSAGl8PMHeSdclz7aPzCFExHnpg772QOlPofrN3pj
         TR7f/KO3L6lInlgtLV7eXSmsuyDcBWOSmbtoJYUvXTjI7MfqGSusbhWy6Q1JDXHX0CgX
         74zY3ZZzaqe56VxpWExg3g8M6sM0gM5yd89D6ofOPqawDtViNtRetoihZwcVpH9mdnWw
         YQ3A==
X-Gm-Message-State: AOAM530TqRzCWD5zDxX8iK5gO2egvRkV0KGAbHW0asoQiHCMS7/ZGNgb
	SFj24CJBsHlfLJwO0winDUkmfTFBe56iaYxAiQne48+gfNI=
X-Google-Smtp-Source: 
 ABdhPJwhGyJZfQlpS3U674qbg9nm2Y2mo9wd6BRtP2e6ldYRK3+YPUc+3k1wh5cPyH9QEuot5ADV6257RAntJBaHFjc=
X-Received: by 2002:a05:6122:550:: with SMTP id
 y16mr2177474vko.0.1638302429037;
 Tue, 30 Nov 2021 12:00:29 -0800 (PST)
MIME-Version: 1.0
References: 
 <CABKMkPJoE74O2OnAe7WsLSu56Ww4ZfPfxksZ43-Np43otAhRWA@mail.gmail.com>
 <CANNYZj-DYfd_erYQYNzATL5K_rUMfDrrvzsWD2h0n_=_kXTBxA@mail.gmail.com>
 <CABKMkP+1pDhZqzGwz-6baUnhEhsOopGonP5d7njNJ0WxsfgLEA@mail.gmail.com>
 <CANNYZj8+jV09y-p1Fciw6xY_PHabj1DtEdG0ywxGpBOgHrUoyw@mail.gmail.com>
 <CABKMkP+P1cZbuTL-tDFB-TeLB=AAwCc_zWy_D-+C_cDkz19onQ@mail.gmail.com>
 <CANNYZj8EGG17430TY6en_xqcixWXTZ0PTgjfwKerre7EN2O+cA@mail.gmail.com>
In-Reply-To: 
 <CANNYZj8EGG17430TY6en_xqcixWXTZ0PTgjfwKerre7EN2O+cA@mail.gmail.com>
From: Joel Winarske <joel.winarske@gmail.com>
Date: Tue, 30 Nov 2021 12:00:18 -0800
Message-ID: 
 <CABKMkPLw3w+3SSXUVfnKcqfsM-QWeUJ=DpPap=aoXJ=Bt8mD=A@mail.gmail.com>
Subject: Re: [OE-core] [RFC] meson needs a pkg-config wrapper script
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <Openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000051490605d207020d"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Nov 2021 20:00:30 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158991

--00000000000051490605d207020d
Content-Type: text/plain; charset="UTF-8"

Yes, if the sys_root key value in meson.cross is present
PKG_CONFIG_SYSROOT_DIR gets set.  Honister patch I confirmed with:
https://github.com/jwinarske/manifests/blob/honister/rpi64/0001-Add-sys_root-to-properties-section.patch

The issue is that meson doesn't pass PKG_CONFIG_SYSROOT_DIR to the shell
environment that runs pkg-config, as with the pkg-config sandbox test it
does work.


On Tue, Nov 30, 2021 at 11:40 AM Alexander Kanavin <alex.kanavin@gmail.com>
wrote:

> I am seeing in mesonbuild/dependencies/pkgconfig.py
>
>         sysroot = environment.properties[for_machine].get_sys_root()
>         if sysroot:
>             env['PKG_CONFIG_SYSROOT_DIR'] = sysroo
>
> So we probably need to ensure this 'sys_root' is correctly set, and then
> things will simply work?
>
> Alex
>
> On Tue, 30 Nov 2021 at 20:15, Joel Winarske <joel.winarske@gmail.com>
> wrote:
>
>> https://github.com/vkmark/vkmark/blob/master/src/meson.build#L9
>>
>> On Tue, Nov 30, 2021 at 10:53 AM Alexander Kanavin <
>> alex.kanavin@gmail.com> wrote:
>>
>>> I do not quite understand the use case. What is being done with the full
>>> path to the header?
>>>
>>> Alex
>>>
>>> On Tue, 30 Nov 2021 at 19:26, Joel Winarske <joel.winarske@gmail.com>
>>> wrote:
>>>
>>>> This pattern works to get the absolute path of the header:
>>>>
>>>> Yocto
>>>>
>>>>     EXTRA_OEMESON += "--prefix ${STAGING_DIR_TARGET}/usr"
>>>>
>>>> Meson
>>>>
>>>>     vulkan_dep = dependency('vulkan')
>>>>     vulkan_hpp = join_paths([
>>>>         vulkan_dep.get_pkgconfig_variable('includedir',
>>>> define_variable: ['prefix', get_option('prefix')]),
>>>>         'vulkan',
>>>>         'vulkan.hpp'
>>>>         ])
>>>>
>>>> Implementation in build/meson-log.txt
>>>>
>>>> Called
>>>> `/b/github-ci/_work/meta-flutter/rpi4-drm-honister-latest/rpi4/tmp/work/cortexa72-poky-linux/vkmark/git-r0/recipe-sysroot-native/usr/bin/pkg-config
>>>> --define-variable=prefix=/b/github-ci/_work/meta-flutter/rpi4-drm-honister-latest/rpi4/tmp/work/cortexa72-poky-linux/vkmark/git-r0/recipe-sysroot/usr
>>>> --variable=includedir vulkan` -> 0
>>>>
>>>>
>>>> One would expect the following meson to work if STAGING_DIR_TARGET were
>>>> set, as that's how pkg-config works:
>>>>
>>>>     vulkan_dep = dependency('vulkan')
>>>>     vulkan_hpp = join_paths([
>>>>         vulkan_dep.get_pkgconfig_variable('includedir'),
>>>>         'vulkan',
>>>>         'vulkan.hpp'
>>>>         ])
>>>>
>>>> This will always return /usr/include/vulkan/vulkan.hpp regardless of
>>>> PKG_CONFIG_SYSROOT_DIR value.  With PKG_CONFIG_SYSROOT_DIR set, it should
>>>> be /usr/include/vulkan/vulkan.hpp with prepend of PKG_CONFIG_SYSROOT_DIR
>>>> value.
>>>>
>>>>
>>>> Sandbox testing of pkg-config
>>>>
>>>>     $ export
>>>> STAGING_DIR_TARGET=/b/github-ci/_work/meta-flutter/rpi4-drm-honister-latest/raspberrypi4-64/tmp/work/cortexa72-poky-linux/vkmark/git-r0/recipe-sysroot
>>>>     $ PKG_CONFIG_SYSROOT_DIR=$STAGING_DIR_TARGET pkg-config
>>>> --define-variable=prefix=/opt --variable=includedir vulkan
>>>>
>>>> /b/github-ci/_work/meta-flutter/rpi4-drm-honister-latest/raspberrypi4-64/tmp/work/cortexa72-poky-linux/vkmark/git-r0/recipe-sysroot/opt/include
>>>>
>>>>
>>>> meson.cross
>>>>
>>>> Setting sys_root in the properties section of meson.cross (patching
>>>> meson.bbclass) indirectly sets PKG_CONFIG_SYSROOT_DIR.  The setting of
>>>> sys_root is present in nativesdk_meson*.bb, not meson*.bb.
>>>>
>>>> The issue for meson is that they are not passing the
>>>> PKG_CONFIG_SYSROOT_DIR variable to the shell that launches pkg-config.
>>>>
>>>> My proposed work around (this email thread) would fix the behavior.  I
>>>> believe the proper fix is for meson to address upstream.  Still waiting on
>>>> a response from them: https://github.com/mesonbuild/meson/issues/9674
>>>>
>>>>
>>>> Joel
>>>>
>>>> On Tue, Nov 30, 2021 at 9:49 AM Alexander Kanavin <
>>>> alex.kanavin@gmail.com> wrote:
>>>>
>>>>> On Tue, 30 Nov 2021 at 18:20, Joel Winarske <joel.winarske@gmail.com>
>>>>> wrote:
>>>>>
>>>>>> Meson does not expose PKG_CONFIG_SYSROOT_DIR to the pkg-config
>>>>>> process.
>>>>>>
>>>>>> Currently meson.cross as generated in meson.bbclass points directly
>>>>>> to the pkg-config executable (no wrapper script).
>>>>>>
>>>>>> PKG_CONFIG_SYSROOT_DIR behaves like a simple string prepend to all
>>>>>> package config variable queries.  So if you want to determine the absolute
>>>>>> path of a variable in .pc you set PKG_CONFIG_SYSROOT_DIR and make your
>>>>>> query.  Currently this is not possible with Yocto+Meson.
>>>>>>
>>>>>> I think a simple wrapper script would resolve this.  This is from
>>>>>> https://autotools.io/pkgconfig/cross-compiling.html:
>>>>>>
>>>>>> #!/bin/sh
>>>>>>
>>>>>> SYSROOT=/build/root
>>>>>>
>>>>>> export PKG_CONFIG_PATH=
>>>>>> export PKG_CONFIG_LIBDIR=${SYSROOT}/usr/lib/pkgconfig:${SYSROOT}/usr/share/pkgconfig
>>>>>> export PKG_CONFIG_SYSROOT_DIR=${SYSROOT}
>>>>>>
>>>>>> exec pkg-config "$@"
>>>>>>
>>>>>>
>>>>>> The wrapper script would be generated per recipe via meson.bbclass,
>>>>>> meson.cross would then reference this wrapper instead of the pkg-config
>>>>>> executable.
>>>>>>
>>>>>> Thoughts?
>>>>>>
>>>>>
>>>>> I don't think this is correct. Meson's way of doing things is that you
>>>>> are not supposed to get the include/library paths directly from pkg-config,
>>>>> but rather use
>>>>> https://mesonbuild.com/Reference-manual_functions.html#dependency and
>>>>> meson will take care of any needed prefixes to the paths.
>>>>>
>>>>> For the custom variables defined in .pc that happen to contain paths,
>>>>> PKG_CONFIG_SYSROOT_DIR has no effect at all, so you need to manually
>>>>> prepend it anyway everywhere where they're used. pkg-config does not know
>>>>> what variable is a path and what isn't.
>>>>>
>>>>> Alex
>>>>>
>>>>

--00000000000051490605d207020d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Yes, if the sys_root key value in meson.cross is pres=
ent PKG_CONFIG_SYSROOT_DIR gets set.=C2=A0 Honister patch I confirmed with:=
<br><a href=3D"https://github.com/jwinarske/manifests/blob/honister/rpi64/0=
001-Add-sys_root-to-properties-section.patch">https://github.com/jwinarske/=
manifests/blob/honister/rpi64/0001-Add-sys_root-to-properties-section.patch=
</a></div><div><br></div><div>The issue is that meson doesn&#39;t pass PKG_=
CONFIG_SYSROOT_DIR to the shell environment that runs pkg-config, as with t=
he pkg-config sandbox test it does work.<br></div><br></div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Nov 30, 2021=
 at 11:40 AM Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com=
">alex.kanavin@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex"><div dir=3D"ltr"><div>I am seeing in mesonbuild/dep=
endencies/pkgconfig.py</div><div><br></div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 sysroot =3D environment.properties[for_machine].get_sys_root()<br>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 if sysroot:<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 env[&#39;PKG_CONFIG_SYSROOT_DIR&#39;] =3D sysroo</div><div><br></div><d=
iv>So we probably need to ensure this &#39;sys_root&#39; is correctly set, =
and then things will simply work?<br></div><div><div><br></div><div>Alex<br=
></div></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D=
"gmail_attr">On Tue, 30 Nov 2021 at 20:15, Joel Winarske &lt;<a href=3D"mai=
lto:joel.winarske@gmail.com" target=3D"_blank">joel.winarske@gmail.com</a>&=
gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div =
dir=3D"ltr"><div><a href=3D"https://github.com/vkmark/vkmark/blob/master/sr=
c/meson.build#L9" target=3D"_blank">https://github.com/vkmark/vkmark/blob/m=
aster/src/meson.build#L9</a></div></div><br><div class=3D"gmail_quote"><div=
 dir=3D"ltr" class=3D"gmail_attr">On Tue, Nov 30, 2021 at 10:53 AM Alexande=
r Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">a=
lex.kanavin@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex"><div dir=3D"ltr"><div>I do not quite understand the us=
e case. What is being done with the full path to the header?</div><div><br>=
</div><div>Alex<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"l=
tr" class=3D"gmail_attr">On Tue, 30 Nov 2021 at 19:26, Joel Winarske &lt;<a=
 href=3D"mailto:joel.winarske@gmail.com" target=3D"_blank">joel.winarske@gm=
ail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex"><div dir=3D"ltr"><div>This pattern works to get the absolute path of=
 the header:<br></div><div><br></div><div></div><div>Yocto</div><br>=C2=A0 =
=C2=A0 EXTRA_OEMESON +=3D &quot;--prefix ${STAGING_DIR_TARGET}/usr&quot;<br=
><br><div></div><div>Meson</div><br>=C2=A0 =C2=A0 vulkan_dep =3D dependency=
(&#39;vulkan&#39;)<br>=C2=A0 =C2=A0 vulkan_hpp =3D join_paths([<br>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 vulkan_dep.get_pkgconfig_variable(&#39;includedir&#39;=
, define_variable: [&#39;prefix&#39;, get_option(&#39;prefix&#39;)]),<br>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;vulkan&#39;,<br>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 &#39;vulkan.hpp&#39;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 ])<br><br><div></di=
v><div>Implementation in build/meson-log.txt</div><br><div>Called `/b/githu=
b-ci/_work/meta-flutter/rpi4-drm-honister-latest/rpi4/tmp/work/cortexa72-po=
ky-linux/vkmark/git-r0/recipe-sysroot-native/usr/bin/pkg-config --define-va=
riable=3Dprefix=3D/b/github-ci/_work/meta-flutter/rpi4-drm-honister-latest/=
rpi4/tmp/work/cortexa72-poky-linux/vkmark/git-r0/recipe-sysroot/usr --varia=
ble=3Dincludedir vulkan` -&gt; 0</div><div><br></div><div><br></div><div>On=
e would expect the following meson to work if STAGING_DIR_TARGET were set, =
as that&#39;s how pkg-config works:<br></div><div><br></div><div>=C2=A0 =C2=
=A0 vulkan_dep =3D dependency(&#39;vulkan&#39;)<br>=C2=A0 =C2=A0 vulkan_hpp=
 =3D join_paths([<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 vulkan_dep.get_pkgconfig_v=
ariable(&#39;includedir&#39;),<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;vulkan&#=
39;,<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;vulkan.hpp&#39;<br>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 ])</div><div><br></div><div>This will always return /usr/incl=
ude/vulkan/vulkan.hpp regardless of PKG_CONFIG_SYSROOT_DIR value.=C2=A0 Wit=
h PKG_CONFIG_SYSROOT_DIR set, it should be /usr/include/vulkan/vulkan.hpp w=
ith prepend of PKG_CONFIG_SYSROOT_DIR value.<br></div><div><br></div><div><=
br></div><div>Sandbox testing of pkg-config</div><div><br></div><div>=C2=A0=
=C2=A0=C2=A0 $ export STAGING_DIR_TARGET=3D/b/github-ci/_work/meta-flutter/=
rpi4-drm-honister-latest/raspberrypi4-64/tmp/work/cortexa72-poky-linux/vkma=
rk/git-r0/recipe-sysroot<br>=C2=A0=C2=A0=C2=A0 $ PKG_CONFIG_SYSROOT_DIR=3D$=
STAGING_DIR_TARGET pkg-config --define-variable=3Dprefix=3D/opt --variable=
=3Dincludedir vulkan<br>/b/github-ci/_work/meta-flutter/rpi4-drm-honister-l=
atest/raspberrypi4-64/tmp/work/cortexa72-poky-linux/vkmark/git-r0/recipe-sy=
sroot/opt/include</div><div><br></div><div><br></div><div>meson.cross</div>=
<div><br></div><div>Setting sys_root in the properties section of meson.cro=
ss (patching meson.bbclass) indirectly sets PKG_CONFIG_SYSROOT_DIR.=C2=A0 T=
he setting of sys_root is present in nativesdk_meson*.bb, not meson*.bb.<br=
></div><div><br></div><div>The issue for meson is that they are not passing=
 the PKG_CONFIG_SYSROOT_DIR variable to the shell that launches pkg-config.=
<br></div><div></div><br><div>My proposed work around (this email thread) w=
ould fix the behavior.=C2=A0 I believe the proper fix is for meson to addre=
ss upstream.=C2=A0 Still waiting on a response from them: <a href=3D"https:=
//github.com/mesonbuild/meson/issues/9674" target=3D"_blank">https://github=
.com/mesonbuild/meson/issues/9674</a></div><div><br></div><div><br></div><d=
iv>Joel<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" clas=
s=3D"gmail_attr">On Tue, Nov 30, 2021 at 9:49 AM Alexander Kanavin &lt;<a h=
ref=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.kanavin@gmail.=
com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x"><div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gm=
ail_attr">On Tue, 30 Nov 2021 at 18:20, Joel Winarske &lt;<a href=3D"mailto=
:joel.winarske@gmail.com" target=3D"_blank">joel.winarske@gmail.com</a>&gt;=
 wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=
=3D"ltr"><div><div>Meson does not expose PKG_CONFIG_SYSROOT_DIR to the pkg-=
config process.</div></div><div><br></div><div>Currently meson.cross as gen=
erated in meson.bbclass points directly to the pkg-config executable (no wr=
apper script).</div><div><br></div><div>PKG_CONFIG_SYSROOT_DIR behaves like=
 a simple string prepend to all package config variable queries.=C2=A0 So i=
f you want to determine the absolute path of a variable in .pc you set PKG_=
CONFIG_SYSROOT_DIR and make your query.=C2=A0 Currently this is not possibl=
e with Yocto+Meson.<br></div><div><br></div>I think a simple wrapper script=
 would resolve this.=C2=A0 This is from <a href=3D"https://autotools.io/pkg=
config/cross-compiling.html" target=3D"_blank">https://autotools.io/pkgconf=
ig/cross-compiling.html</a>:<br><div><pre>#!/bin/sh

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

--00000000000051490605d207020d--

