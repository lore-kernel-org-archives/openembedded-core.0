Return-Path: <jstephan@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 017B2C25B08
	for <webhook@archiver.kernel.org>; Wed, 17 Aug 2022 19:23:07 +0000 (UTC)
Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com
 [209.85.160.41])
 by mx.groups.io with SMTP id smtpd.web12.33227.1660764178439697422
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Aug 2022 12:22:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20210112.gappssmtp.com header.s=20210112
 header.b=1wfcpFbZ;
 spf=pass (domain: baylibre.com, ip: 209.85.160.41,
 mailfrom: jstephan@baylibre.com)
Received: by mail-oa1-f41.google.com with SMTP id
 586e51a60fabf-11ba6e79dd1so11109570fac.12
        for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Aug 2022 12:22:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=nH7mOhyObIFzN2M2xNywMWssuIrlNTx9VzeG9it3WT8=;
        b=1wfcpFbZucI28DP2cFRlaXBjUJErri0Af9ZSxoXO32nx8yAT86yO01cxK+1DH0vX5A
         xREgW+ejG6a5X3nNBpjpxFt3Yjv9Nkf1qCSG/3KymNKNA+7vi/N9nGNwSGmwJRns9b3z
         ncIfprURg4d3C6HSvFyRUcL9cZyYxYEj/o20NTveVaYYaUMYXndjDudIoQ5exBfNWEkh
         V6H/TNncbW5UOLALzt9IYkf6fqd0AYEvrSbMACt2WgTx3MjEQJPvFv804WTiKmBdHEtN
         oPAqmpEFZwTrGoCy3/IKZ+CNwsluYjIY78p91HyVafP4Zo7L9+YldsJm2JUhhjjXyMmq
         GMOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=nH7mOhyObIFzN2M2xNywMWssuIrlNTx9VzeG9it3WT8=;
        b=u4ZQ+L0rcOoqjpOnwNpZJ1X2mEPIg41seDMqLAe1goqK5guy5XDpStzGBg16x+whLW
         ByJzQGuzIBjlMxpNuupO8jVjZ0yoQ0uW3j8+CJxnoDxaIL2QN1YADGm0bmsNxfnayOyU
         W2YPzR7EIBgYVFMFNSFCAu2WcIFz4cLns+PBiZkDOicDj1OoBZonLZlM/d1shZRjotjv
         qYOz5AAot1dwVVCf2wFOVQvoH51/dXxwr3nyGfke0BDjxl1Mq6EaUPVLngT3ShF7Pkf+
         4A8NntRLAOFPtZQRVRMfDFheHS9S1p+ue2Tgg2Et31hHVDgSfnCLyd5NWEOlbLRQ6VYN
         mXYA==
X-Gm-Message-State: ACgBeo3NfxsmN1HVtVmRwVZC7Q+RuSTLRiRKiloFX5sNM+yu06C7ZRrh
	tqIIjRNNmUtzSt0apo06ruc8RWeO7tAYnFs1lFgL4Q==
X-Google-Smtp-Source: 
 AA6agR6x/1WqmKqAilZuvscSNpb4A3fA3H6PrlOvZ2JRq2XTYvGvOxFydllQtVB71c7iM99K+e8kPIb/ODG5DiTQUL4=
X-Received: by 2002:a05:6870:e8c1:b0:10c:e6f8:b922 with SMTP id
 r1-20020a056870e8c100b0010ce6f8b922mr2608658oan.29.1660764177590; Wed, 17 Aug
 2022 12:22:57 -0700 (PDT)
MIME-Version: 1.0
References: <20220817190124.2126652-1-jstephan@baylibre.com>
 <CANNYZj_VxXe6aZKXstZVNov9aeQJ-2beBY1=WojSPA-gvXQqvg@mail.gmail.com>
In-Reply-To: 
 <CANNYZj_VxXe6aZKXstZVNov9aeQJ-2beBY1=WojSPA-gvXQqvg@mail.gmail.com>
From: Julien Stephan <jstephan@baylibre.com>
Date: Wed, 17 Aug 2022 21:22:46 +0200
Message-ID: 
 <CAEHHSvavULJhb-W6MJ+2GSouf8sBk_xFHXeHdQCO_VF_zsqn5g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] vulkan-samples: enable network during do_unpack
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000dc815805e674ca03"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Aug 2022 19:23:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169503

--000000000000dc815805e674ca03
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Alexander,

I observe this by just trying to build the vulkan-samples recipe:
DISTRO=3Dpoky bitbake vulkan-samples.

Here is the log output (sorry it is a bit verbose):
ERROR: vulkan-samples-git-r0 do_unpack: Bitbake Fetcher Error:
FetchError('Fetch command export PSEUDO_DISABLED=3D1; export
SSH_AUTH_SOCK=3D"/home/jstephan/.ssh/ssh_auth_sock"; export
PATH=3D"/home/jstephan/kirkstone/build/tmp/sysroots-uninative/x86_64-linux/=
usr/bin:/home/jstephan/kirkstone/src/poky/scripts:/home/jstephan/kirkstone/=
build/tmp/work/cortexa53-poky-linux/vulkan-samples/git-r0/recipe-sysroot-na=
tive/usr/bin/aarch64-poky-linux:/home/jstephan/kirkstone/build/tmp/work/cor=
texa53-poky-linux/vulkan-samples/git-r0/recipe-sysroot/usr/bin/crossscripts=
:/home/jstephan/kirkstone/build/tmp/work/cortexa53-poky-linux/vulkan-sample=
s/git-r0/recipe-sysroot-native/usr/sbin:/home/jstephan/kirkstone/build/tmp/=
work/cortexa53-poky-linux/vulkan-samples/git-r0/recipe-sysroot-native/usr/b=
in:/home/jstephan/kirkstone/build/tmp/work/cortexa53-poky-linux/vulkan-samp=
les/git-r0/recipe-sysroot-native/sbin:/home/jstephan/kirkstone/build/tmp/wo=
rk/cortexa53-poky-linux/vulkan-samples/git-r0/recipe-sysroot-native/bin:/ho=
me/jstephan/kirkstone/src/poky/bitbake/bin:/home/jstephan/kirkstone/build/t=
mp/hosttools";
export HOME=3D"/home/jstephan"; git -c core.fsyncobjectfiles=3D0 -c
gc.autoDetach=3Dfalse -c core.pager=3Dcat submodule update --recursive
--no-fetch failed with exit code 1, output:\nSubmodule path \'assets\':
checked out \'8a6b7f952d7786a305f89d375a55598e995ee972\'\nSubmodule path
\'third_party/CTPL\': checked out
\'437e135dbd94eb65b45533d9ce8ee28b5bd37b6d\'\nSubmodule path
\'third_party/astc\': checked out
\'4861c3db1ca50eb5f5767d95d1cd1bacb98ac8a5\'\nSubmodule path
\'third_party/cli11\': checked out
\'4af78beef777e313814b4daff70e2da9171a385a\'\nSubmodule path
\'third_party/glfw\': checked out
\'6876cf8d7e0e70dc3e4d7b0224d08312c9f78099\'\nSubmodule path
\'third_party/glm\': checked out
\'fce2abd01ce21063bd25ba67c9318be83bf48813\'\nSubmodule path
\'third_party/glslang\': checked out
\'6baa85f6ceec5fddd2e13b43dd1edc944dd930af\'\nSubmodule path
\'third_party/hwcpipe\': checked out
\'5a0c3d0b527bea96154998f29177f3b449cebd3a\'\nSubmodule path
\'third_party/imgui\': checked out
\'c23a19c26fa9cc778f755e76799f0cafdcb5a13b\'\nSubmodule path
\'third_party/opencl\': checked out
\'1aa1139b58a515877a923cce6b254e09d1b2fb2c\'\nSubmodule path
\'third_party/spdlog\': checked out
\'7bf8f148795d2571b4ae4aa9c6d2a8111fbb7077\'\nSubmodule path
\'third_party/spirv-cross\': checked
out \'84f56d0b43e5a6874de45e11be2bff9dc336fd7e\'\nSubmodule path
\'third_party/stb\': checked out
\'2c2908f50515dcd939f24be261c3ccbcd277bb49\'\nSubmodule path
\'third_party/tinygltf\': checked out
\'c0d0251e2c7f2273a894aa1b125af9313a88eae4\'\nSubmodule path
\'third_party/vma\': checked out
\'f9921aefddee2437cc2e3303d3175bd8ef23e22c\'\nSubmodule path
\'third_party/volk\': checked out
\'b18f3192886981f28d17f8f41c26c5a53ac3b977\'\nSubmodule path
\'third_party/vulkan\': checked out
\'76f00ef6cbb1886eb1162d1fa39bee8b51e22ee8\'\n\nDownloading
other_lib/ios/Debug-iphoneos/libSDL2.a (8.2 MB)\nError downloading object:
other_lib/ios/Debug-iphoneos/libSDL2.a (5045776): Smudge error: Error
downloading other_lib/ios/Debug-iphoneos/libSDL2.a
(5045776556ca57f2f7125d89c37a8b94f79cdebdc040d420513f0491787c4ea7): batch
response: Post
https://github.com/KhronosGroup/KTX-Software.git/info/lfs/objects/batch:
dial tcp: lookup github.com: Temporary failure in name resolution\n\nErrors
logged to
/home/jstephan/kirkstone/build/tmp/work/cortexa53-poky-linux/vulkan-samples=
/git-r0/git/.git/modules/third_party/ktx/lfs/logs/20220817T152514.337649981=
.log\nUse
`git lfs logs last` to view the log.\nerror: external filter \'git-lfs
filter-process\' failed\nfatal: other_lib/ios/Debug-iphoneos/libSDL2.a:
smudge filter lfs failed\nUnable to checkout
\'6a38a0694b4d73d22c5d1e22f865d03545e808ea\' in submodule path
\'third_party/ktx\'\n', None)
ERROR: Logfile of failure stored in:
/home/jstephan/kirkstone/build/tmp/work/cortexa53-poky-linux/vulkan-samples=
/git-r0/temp/log.do_unpack.1796011
ERROR: Task
(/home/jstephan/kirkstone/src/poky/meta/recipes-graphics/vulkan/vulkan-samp=
les_git.bb:do_unpack)
failed with exit code '1'

Julien

Le mer. 17 ao=C3=BBt 2022 =C3=A0 21:09, Alexander Kanavin <alex.kanavin@gma=
il.com> a
=C3=A9crit :

> This has not been observed on the autobuilder or independently
> reported, can you show how to reproduce or the failure log?
>
> Alex
>
> On Wed, 17 Aug 2022 at 21:01, Julien STEPHAN <jstephan@baylibre.com>
> wrote:
> >
> > vulkan-samples uses git submodules and one of the submodules uses lfs
> > objects. During the unpack step, the lfs objects are retrieved leading =
to
> > a network failure.
> >
> > The correct fix is to fetch lfs objects during the fetch step, but let'=
s
> > workaround this issue for now
> >
> > Signed-off-by: Julien STEPHAN <jstephan@baylibre.com>
> > ---
> >  meta/recipes-graphics/vulkan/vulkan-samples_git.bb | 5 +++++
> >  1 file changed, 5 insertions(+)
> >
> > diff --git a/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
> b/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
> > index 41cb4a437d..b45ee22a69 100644
> > --- a/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
> > +++ b/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
> > @@ -11,6 +11,11 @@ SRC_URI =3D "gitsm://
> github.com/KhronosGroup/Vulkan-Samples.git;branch=3Dmaster;prot
> >
>  file://0001-framework-core-hpp_vulkan_resource.h-add-header-incl.patch \
> >             "
> >
> > +# Workaround for network access issue during the do_unpack step
> > +# this needs to be fixed in the recipes buildsystem to move
> > +# this such that it can be accomplished during do_fetch task
> > +do_unpack[network] =3D "1"
> > +
> >  UPSTREAM_CHECK_COMMITS =3D "1"
> >  SRCREV =3D "ee6c1522af8ba9b56f8416c2eedafb440f681085"
> >
> > --
> > 2.37.1
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#169500):
> https://lists.openembedded.org/g/openembedded-core/message/169500
> > Mute This Topic: https://lists.openembedded.org/mt/93089137/1686489
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>

--000000000000dc815805e674ca03
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Alexander,</div><div><br></div><div>I observe this=
 by just trying to build the vulkan-samples recipe: DISTRO=3Dpoky bitbake v=
ulkan-samples. <br></div><div><br></div><div>Here is the log output (sorry =
it is a bit verbose): <br></div><div>ERROR: vulkan-samples-git-r0 do_unpack=
: Bitbake Fetcher Error: FetchError(&#39;Fetch command export PSEUDO_DISABL=
ED=3D1; export SSH_AUTH_SOCK=3D&quot;/home/jstephan/.ssh/ssh_auth_sock&quot=
;; export PATH=3D&quot;/home/jstephan/kirkstone/build/tmp/sysroots-uninativ=
e/x86_64-linux/usr/bin:/home/jstephan/kirkstone/src/poky/scripts:/home/jste=
phan/kirkstone/build/tmp/work/cortexa53-poky-linux/vulkan-samples/git-r0/re=
cipe-sysroot-native/usr/bin/aarch64-poky-linux:/home/jstephan/kirkstone/bui=
ld/tmp/work/cortexa53-poky-linux/vulkan-samples/git-r0/recipe-sysroot/usr/b=
in/crossscripts:/home/jstephan/kirkstone/build/tmp/work/cortexa53-poky-linu=
x/vulkan-samples/git-r0/recipe-sysroot-native/usr/sbin:/home/jstephan/kirks=
tone/build/tmp/work/cortexa53-poky-linux/vulkan-samples/git-r0/recipe-sysro=
ot-native/usr/bin:/home/jstephan/kirkstone/build/tmp/work/cortexa53-poky-li=
nux/vulkan-samples/git-r0/recipe-sysroot-native/sbin:/home/jstephan/kirksto=
ne/build/tmp/work/cortexa53-poky-linux/vulkan-samples/git-r0/recipe-sysroot=
-native/bin:/home/jstephan/kirkstone/src/poky/bitbake/bin:/home/jstephan/ki=
rkstone/build/tmp/hosttools&quot;; export HOME=3D&quot;/home/jstephan&quot;=
; git -c core.fsyncobjectfiles=3D0 -c gc.autoDetach=3Dfalse -c core.pager=
=3Dcat submodule update --recursive --no-fetch failed with exit code 1, out=
put:\nSubmodule path \&#39;assets\&#39;: checked out \&#39;8a6b7f952d7786a3=
05f89d375a55598e995ee972\&#39;\nSubmodule path \&#39;third_party/CTPL\&#39;=
: checked out \&#39;437e135dbd94eb65b45533d9ce8ee28b5bd37b6d\&#39;\nSubmodu=
le path \&#39;third_party/astc\&#39;: checked out \&#39;4861c3db1ca50eb5f57=
67d95d1cd1bacb98ac8a5\&#39;\nSubmodule path \&#39;third_party/cli11\&#39;: =
checked out \&#39;4af78beef777e313814b4daff70e2da9171a385a\&#39;\nSubmodule=
 path \&#39;third_party/glfw\&#39;: checked out \&#39;6876cf8d7e0e70dc3e4d7=
b0224d08312c9f78099\&#39;\nSubmodule path \&#39;third_party/glm\&#39;: chec=
ked out \&#39;fce2abd01ce21063bd25ba67c9318be83bf48813\&#39;\nSubmodule pat=
h \&#39;third_party/glslang\&#39;: checked out \&#39;6baa85f6ceec5fddd2e13b=
43dd1edc944dd930af\&#39;\nSubmodule path \&#39;third_party/hwcpipe\&#39;: c=
hecked out \&#39;5a0c3d0b527bea96154998f29177f3b449cebd3a\&#39;\nSubmodule =
path \&#39;third_party/imgui\&#39;: checked out \&#39;c23a19c26fa9cc778f755=
e76799f0cafdcb5a13b\&#39;\nSubmodule path \&#39;third_party/opencl\&#39;: c=
hecked out \&#39;1aa1139b58a515877a923cce6b254e09d1b2fb2c\&#39;\nSubmodule =
path \&#39;third_party/spdlog\&#39;: checked out \&#39;7bf8f148795d2571b4ae=
4aa9c6d2a8111fbb7077\&#39;\nSubmodule path \&#39;third_party/spirv-cross\&#=
39;: checked out=C2=A0\&#39;84f56d0b43e5a6874de45e11be2bff9dc336fd7e\&#39;\=
nSubmodule path \&#39;third_party/stb\&#39;: checked out \&#39;2c2908f50515=
dcd939f24be261c3ccbcd277bb49\&#39;\nSubmodule path \&#39;third_party/tinygl=
tf\&#39;: checked out \&#39;c0d0251e2c7f2273a894aa1b125af9313a88eae4\&#39;\=
nSubmodule path \&#39;third_party/vma\&#39;: checked out \&#39;f9921aefddee=
2437cc2e3303d3175bd8ef23e22c\&#39;\nSubmodule path \&#39;third_party/volk\&=
#39;: checked out \&#39;b18f3192886981f28d17f8f41c26c5a53ac3b977\&#39;\nSub=
module path \&#39;third_party/vulkan\&#39;: checked out \&#39;76f00ef6cbb18=
86eb1162d1fa39bee8b51e22ee8\&#39;\n\nDownloading other_lib/ios/Debug-iphone=
os/libSDL2.a (8.2 MB)\nError downloading object: other_lib/ios/Debug-iphone=
os/libSDL2.a (5045776): Smudge error: Error downloading other_lib/ios/Debug=
-iphoneos/libSDL2.a (5045776556ca57f2f7125d89c37a8b94f79cdebdc040d420513f04=
91787c4ea7): batch response: Post <a href=3D"https://github.com/KhronosGrou=
p/KTX-Software.git/info/lfs/objects/batch">https://github.com/KhronosGroup/=
KTX-Software.git/info/lfs/objects/batch</a>: dial tcp: lookup <a href=3D"ht=
tp://github.com">github.com</a>: Temporary failure in name resolution\n\nEr=
rors logged to /home/jstephan/kirkstone/build/tmp/work/cortexa53-poky-linux=
/vulkan-samples/git-r0/git/.git/modules/third_party/ktx/lfs/logs/20220817T1=
52514.337649981.log\nUse `git lfs logs last` to view the log.\nerror: exter=
nal filter \&#39;git-lfs filter-process\&#39; failed\nfatal: other_lib/ios/=
Debug-iphoneos/libSDL2.a: smudge filter lfs failed\nUnable to checkout \&#3=
9;6a38a0694b4d73d22c5d1e22f865d03545e808ea\&#39; in submodule path \&#39;th=
ird_party/ktx\&#39;\n&#39;, None)<br>ERROR: Logfile of failure stored in: /=
home/jstephan/kirkstone/build/tmp/work/cortexa53-poky-linux/vulkan-samples/=
git-r0/temp/log.do_unpack.1796011<br>ERROR: Task (/home/jstephan/kirkstone/=
src/poky/meta/recipes-graphics/vulkan/vulkan-samples_git.bb:do_unpack) fail=
ed with exit code &#39;1&#39;</div><div><br></div><div>Julien<br></div></di=
v><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Le=
=C2=A0mer. 17 ao=C3=BBt 2022 =C3=A0=C2=A021:09, Alexander Kanavin &lt;<a hr=
ef=3D"mailto:alex.kanavin@gmail.com">alex.kanavin@gmail.com</a>&gt; a =C3=
=A9crit=C2=A0:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">T=
his has not been observed on the autobuilder or independently<br>
reported, can you show how to reproduce or the failure log?<br>
<br>
Alex<br>
<br>
On Wed, 17 Aug 2022 at 21:01, Julien STEPHAN &lt;<a href=3D"mailto:jstephan=
@baylibre.com" target=3D"_blank">jstephan@baylibre.com</a>&gt; wrote:<br>
&gt;<br>
&gt; vulkan-samples uses git submodules and one of the submodules uses lfs<=
br>
&gt; objects. During the unpack step, the lfs objects are retrieved leading=
 to<br>
&gt; a network failure.<br>
&gt;<br>
&gt; The correct fix is to fetch lfs objects during the fetch step, but let=
&#39;s<br>
&gt; workaround this issue for now<br>
&gt;<br>
&gt; Signed-off-by: Julien STEPHAN &lt;<a href=3D"mailto:jstephan@baylibre.=
com" target=3D"_blank">jstephan@baylibre.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/recipes-graphics/vulkan/<a href=3D"http://vulkan-samples_gi=
t.bb" rel=3D"noreferrer" target=3D"_blank">vulkan-samples_git.bb</a> | 5 ++=
+++<br>
&gt;=C2=A0 1 file changed, 5 insertions(+)<br>
&gt;<br>
&gt; diff --git a/meta/recipes-graphics/vulkan/<a href=3D"http://vulkan-sam=
ples_git.bb" rel=3D"noreferrer" target=3D"_blank">vulkan-samples_git.bb</a>=
 b/meta/recipes-graphics/vulkan/<a href=3D"http://vulkan-samples_git.bb" re=
l=3D"noreferrer" target=3D"_blank">vulkan-samples_git.bb</a><br>
&gt; index 41cb4a437d..b45ee22a69 100644<br>
&gt; --- a/meta/recipes-graphics/vulkan/<a href=3D"http://vulkan-samples_gi=
t.bb" rel=3D"noreferrer" target=3D"_blank">vulkan-samples_git.bb</a><br>
&gt; +++ b/meta/recipes-graphics/vulkan/<a href=3D"http://vulkan-samples_gi=
t.bb" rel=3D"noreferrer" target=3D"_blank">vulkan-samples_git.bb</a><br>
&gt; @@ -11,6 +11,11 @@ SRC_URI =3D &quot;gitsm://<a href=3D"http://github.=
com/KhronosGroup/Vulkan-Samples.git;branch=3Dmaster;prot" rel=3D"noreferrer=
" target=3D"_blank">github.com/KhronosGroup/Vulkan-Samples.git;branch=3Dmas=
ter;prot</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-framework-c=
ore-hpp_vulkan_resource.h-add-header-incl.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
&gt;<br>
&gt; +# Workaround for network access issue during the do_unpack step<br>
&gt; +# this needs to be fixed in the recipes buildsystem to move<br>
&gt; +# this such that it can be accomplished during do_fetch task<br>
&gt; +do_unpack[network] =3D &quot;1&quot;<br>
&gt; +<br>
&gt;=C2=A0 UPSTREAM_CHECK_COMMITS =3D &quot;1&quot;<br>
&gt;=C2=A0 SRCREV =3D &quot;ee6c1522af8ba9b56f8416c2eedafb440f681085&quot;<=
br>
&gt;<br>
&gt; --<br>
&gt; 2.37.1<br>
&gt;<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#169500): <a href=3D"https://lists.openembedded.org=
/g/openembedded-core/message/169500" rel=3D"noreferrer" target=3D"_blank">h=
ttps://lists.openembedded.org/g/openembedded-core/message/169500</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/93089137=
/1686489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.o=
rg/mt/93089137/1686489</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openemb=
edded.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org=
</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
core/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded=
.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:alex.kanavin@gmail.co=
m" target=3D"_blank">alex.kanavin@gmail.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
</blockquote></div>

--000000000000dc815805e674ca03--

