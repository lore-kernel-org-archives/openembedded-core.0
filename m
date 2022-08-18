Return-Path: <jstephan@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46017C00140
	for <webhook@archiver.kernel.org>; Thu, 18 Aug 2022 07:03:00 +0000 (UTC)
Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com
 [209.85.160.53])
 by mx.groups.io with SMTP id smtpd.web12.39089.1660806169731947153
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Aug 2022 00:02:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20210112.gappssmtp.com header.s=20210112
 header.b=5sVCoEm+;
 spf=pass (domain: baylibre.com, ip: 209.85.160.53,
 mailfrom: jstephan@baylibre.com)
Received: by mail-oa1-f53.google.com with SMTP id
 586e51a60fabf-11be650aaccso834961fac.6
        for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Aug 2022 00:02:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=17NoMAYFQr5I2mRz7638FmqnHRxfBtta68F2FBFnECA=;
        b=5sVCoEm+MdxFuUy1NNKyKh5uCu32V92JLmJ+2lYCCCf25hSIalH8xLkaux+ShQa32z
         /E99aQr2xk/5o4e3qVWamwBIVLz3jcy3u/I05EoEk7jdT/9muTQ1CZG4OdiZqD7N9K3d
         7VCAJMuEGznFWCwh4THg+uNH5wXCx+BFAB7EfjVGTB24j2pz2SbRJk/pKDlfQIZa6dbE
         gYJ7aH5tRVhodxUZBP7crpSYtJuKKEYsZ6Dj0cYvrcpYHyWdL+gcNg1dgSHHynG/Mb5D
         2geY0iJLULiCs9nPHpylBvVC8sWxstLkJZCKuFY5XXddgD8GUgcCE/sYf7vW35nYdDc3
         7LrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=17NoMAYFQr5I2mRz7638FmqnHRxfBtta68F2FBFnECA=;
        b=GivnpZRCIbYeyeUg+CG2FQcbloYgVtIaI92DjCv0t+pg8w+9VnzDnJ0EH1WcujWls1
         hKKdHhml8cl/CMILzzPN0HHWMVgeZTyZE4Uq/w/RYPD4zgcY5IWG3bEQxyCsLU5cXy+C
         ake0l+zq+VaIZZv7is2rcH7d+gAPZUDMyFJFBJG/kH8ttSQtuZ/n9ccvQvGSeO/VwdIV
         fbAzCQCjz0HRb9lGuNNdwDMYlImV8LKHyuhZugRVzoSAfWjeJmww/zKDXhYzIQ6MK/63
         TZgShzQH1XVW7WXaFGvpklx4a1AcBidQiwqacLJDx+Y6OoLSV3szNcCcxGMHEX5B6AsH
         KVuA==
X-Gm-Message-State: ACgBeo1a6QYnkH0TMauE7IIFQxmC0y2kMR9fnCfmnzO5sNVqOIqqg23Y
	JCIXWSIiq+xsYF9jFpjZ5S0MBLsTn2Ub20lXkJeGnQ==
X-Google-Smtp-Source: 
 AA6agR41lIhc601Y+esKhwYGHoA6Wu0WaojFt3zRXWTnK2K0ycEyCR+eqp34X5/AZPQ/0tz1Ylp2vV7Oid5lpUDZA0s=
X-Received: by 2002:a05:6870:e8c1:b0:10c:e6f8:b922 with SMTP id
 r1-20020a056870e8c100b0010ce6f8b922mr785909oan.29.1660806168503; Thu, 18 Aug
 2022 00:02:48 -0700 (PDT)
MIME-Version: 1.0
References: <20220817190124.2126652-1-jstephan@baylibre.com>
 <CANNYZj_VxXe6aZKXstZVNov9aeQJ-2beBY1=WojSPA-gvXQqvg@mail.gmail.com>
 <CAEHHSvavULJhb-W6MJ+2GSouf8sBk_xFHXeHdQCO_VF_zsqn5g@mail.gmail.com>
 <170C3947C33061FA.1805@lists.openembedded.org>
 <CANNYZj-ZOPgM_iLFw6uQWF+St_GWNNOfdWB0zUw_yZQfWjQuig@mail.gmail.com>
In-Reply-To: 
 <CANNYZj-ZOPgM_iLFw6uQWF+St_GWNNOfdWB0zUw_yZQfWjQuig@mail.gmail.com>
From: Julien Stephan <jstephan@baylibre.com>
Date: Thu, 18 Aug 2022 09:02:36 +0200
Message-ID: 
 <CAEHHSvZaksW7-4Q0bVOd8hdw6KFc7dCdCQ+eUsGd155dGhvoFw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] vulkan-samples: enable network during do_unpack
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000b6fcc405e67e9161"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Aug 2022 07:03:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169514

--000000000000b6fcc405e67e9161
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mer. 17 ao=C3=BBt 2022 =C3=A0 22:33, Alexander Kanavin <alex.kanavin@gma=
il.com> a
=C3=A9crit :

> I reproduced. This happens if all three are true:
> - recipe is using gitsm://
> - one of the submodules contains lfs objects
> - git-lfs is installed on the host (that's why it's not seen on the AB)
>
> Nice! I figured out the first two points, but not the last one.


> There's logic in plain git:// fetcher to deal with lfs, but not in
> gitsm://. So that logic needs to be added there as well. A workaround
> like you suggested is not the right fix.
>
> Can you look into it please? Or at least a ticket would be good to have.
>
> Sure, I will try to look at it
Julien

> Alex
>
> On Wed, 17 Aug 2022 at 21:42, Alexander Kanavin via
> lists.openembedded.org <alex.kanavin=3Dgmail.com@lists.openembedded.org>
> wrote:
> >
> > Just to be sure, can you repeat this on a pristine poky master
> > checkout with no cache and no downloads? 'bitbake -c unpack
> > vulkan-samples' should do.
> >
> > Also what does git --version say? I wonder if there's something in too
> > old or too new versions of it.
> >
> > Alex
> >
> > On Wed, 17 Aug 2022 at 21:22, Julien Stephan <jstephan@baylibre.com>
> wrote:
> > >
> > > Hi Alexander,
> > >
> > > I observe this by just trying to build the vulkan-samples recipe:
> DISTRO=3Dpoky bitbake vulkan-samples.
> > >
> > > Here is the log output (sorry it is a bit verbose):
> > > ERROR: vulkan-samples-git-r0 do_unpack: Bitbake Fetcher Error:
> FetchError('Fetch command export PSEUDO_DISABLED=3D1; export
> SSH_AUTH_SOCK=3D"/home/jstephan/.ssh/ssh_auth_sock"; export
> PATH=3D"/home/jstephan/kirkstone/build/tmp/sysroots-uninative/x86_64-linu=
x/usr/bin:/home/jstephan/kirkstone/src/poky/scripts:/home/jstephan/kirkston=
e/build/tmp/work/cortexa53-poky-linux/vulkan-samples/git-r0/recipe-sysroot-=
native/usr/bin/aarch64-poky-linux:/home/jstephan/kirkstone/build/tmp/work/c=
ortexa53-poky-linux/vulkan-samples/git-r0/recipe-sysroot/usr/bin/crossscrip=
ts:/home/jstephan/kirkstone/build/tmp/work/cortexa53-poky-linux/vulkan-samp=
les/git-r0/recipe-sysroot-native/usr/sbin:/home/jstephan/kirkstone/build/tm=
p/work/cortexa53-poky-linux/vulkan-samples/git-r0/recipe-sysroot-native/usr=
/bin:/home/jstephan/kirkstone/build/tmp/work/cortexa53-poky-linux/vulkan-sa=
mples/git-r0/recipe-sysroot-native/sbin:/home/jstephan/kirkstone/build/tmp/=
work/cortexa53-poky-linux/vulkan-samples/git-r0/recipe-sysroot-native/bin:/=
home/jstephan/kirkstone/src/poky/bitbake/bin:/home/jstephan/kirkstone/build=
/tmp/hosttools";
> export HOME=3D"/home/jstephan"; git -c core.fsyncobjectfiles=3D0 -c
> gc.autoDetach=3Dfalse -c core.pager=3Dcat submodule update --recursive
> --no-fetch failed with exit code 1, output:\nSubmodule path \'assets\':
> checked out \'8a6b7f952d7786a305f89d375a55598e995ee972\'\nSubmodule path
> \'third_party/CTPL\': checked out
> \'437e135dbd94eb65b45533d9ce8ee28b5bd37b6d\'\nSubmodule path
> \'third_party/astc\': checked out
> \'4861c3db1ca50eb5f5767d95d1cd1bacb98ac8a5\'\nSubmodule path
> \'third_party/cli11\': checked out
> \'4af78beef777e313814b4daff70e2da9171a385a\'\nSubmodule path
> \'third_party/glfw\': checked out
> \'6876cf8d7e0e70dc3e4d7b0224d08312c9f78099\'\nSubmodule path
> \'third_party/glm\': checked out
> \'fce2abd01ce21063bd25ba67c9318be83bf48813\'\nSubmodule path
> \'third_party/glslang\': checked out
> \'6baa85f6ceec5fddd2e13b43dd1edc944dd930af\'\nSubmodule path
> \'third_party/hwcpipe\': checked out
> \'5a0c3d0b527bea96154998f29177f3b449cebd3a\'\nSubmodule path
> \'third_party/imgui\': checked out
> \'c23a19c26fa9cc778f755e76799f0cafdcb5a13b\'\nSubmodule path
> \'third_party/opencl\': checked out
> \'1aa1139b58a515877a923cce6b254e09d1b2fb2c\'\nSubmodule path
> \'third_party/spdlog\': checked out
> \'7bf8f148795d2571b4ae4aa9c6d2a8111fbb7077\'\nSubmodule path
> \'third_party/spirv-cross\': checked out
> \'84f56d0b43e5a6874de45e11be2bff9dc336fd7e\'\nSubmodule path
> \'third_party/stb\': checked out
> \'2c2908f50515dcd939f24be261c3ccbcd277bb49\'\nSubmodule path
> \'third_party/tinygltf\': checked out
> \'c0d0251e2c7f2273a894aa1b125af9313a88eae4\'\nSubmodule path
> \'third_party/vma\': checked out
> \'f9921aefddee2437cc2e3303d3175bd8ef23e22c\'\nSubmodule path
> \'third_party/volk\': checked out
> \'b18f3192886981f28d17f8f41c26c5a53ac3b977\'\nSubmodule path
> \'third_party/vulkan\': checked out
> \'76f00ef6cbb1886eb1162d1fa39bee8b51e22ee8\'\n\nDownloading
> other_lib/ios/Debug-iphoneos/libSDL2.a (8.2 MB)\nError downloading object=
:
> other_lib/ios/Debug-iphoneos/libSDL2.a (5045776): Smudge error: Error
> downloading other_lib/ios/Debug-iphoneos/libSDL2.a
> (5045776556ca57f2f7125d89c37a8b94f79cdebdc040d420513f0491787c4ea7): batch
> response: Post
> https://github.com/KhronosGroup/KTX-Software.git/info/lfs/objects/batch:
> dial tcp: lookup github.com: Temporary failure in name
> resolution\n\nErrors logged to
> /home/jstephan/kirkstone/build/tmp/work/cortexa53-poky-linux/vulkan-sampl=
es/git-r0/git/.git/modules/third_party/ktx/lfs/logs/20220817T152514.3376499=
81.log\nUse
> `git lfs logs last` to view the log.\nerror: external filter \'git-lfs
> filter-process\' failed\nfatal: other_lib/ios/Debug-iphoneos/libSDL2.a:
> smudge filter lfs failed\nUnable to checkout
> \'6a38a0694b4d73d22c5d1e22f865d03545e808ea\' in submodule path
> \'third_party/ktx\'\n', None)
> > > ERROR: Logfile of failure stored in:
> /home/jstephan/kirkstone/build/tmp/work/cortexa53-poky-linux/vulkan-sampl=
es/git-r0/temp/log.do_unpack.1796011
> > > ERROR: Task
> (/home/jstephan/kirkstone/src/poky/meta/recipes-graphics/vulkan/vulkan-sa=
mples_git.bb:do_unpack)
> failed with exit code '1'
> > >
> > > Julien
> > >
> > > Le mer. 17 ao=C3=BBt 2022 =C3=A0 21:09, Alexander Kanavin <
> alex.kanavin@gmail.com> a =C3=A9crit :
> > >>
> > >> This has not been observed on the autobuilder or independently
> > >> reported, can you show how to reproduce or the failure log?
> > >>
> > >> Alex
> > >>
> > >> On Wed, 17 Aug 2022 at 21:01, Julien STEPHAN <jstephan@baylibre.com>
> wrote:
> > >> >
> > >> > vulkan-samples uses git submodules and one of the submodules uses
> lfs
> > >> > objects. During the unpack step, the lfs objects are retrieved
> leading to
> > >> > a network failure.
> > >> >
> > >> > The correct fix is to fetch lfs objects during the fetch step, but
> let's
> > >> > workaround this issue for now
> > >> >
> > >> > Signed-off-by: Julien STEPHAN <jstephan@baylibre.com>
> > >> > ---
> > >> >  meta/recipes-graphics/vulkan/vulkan-samples_git.bb | 5 +++++
> > >> >  1 file changed, 5 insertions(+)
> > >> >
> > >> > diff --git a/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
> b/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
> > >> > index 41cb4a437d..b45ee22a69 100644
> > >> > --- a/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
> > >> > +++ b/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
> > >> > @@ -11,6 +11,11 @@ SRC_URI =3D "gitsm://
> github.com/KhronosGroup/Vulkan-Samples.git;branch=3Dmaster;prot
> > >> >
>  file://0001-framework-core-hpp_vulkan_resource.h-add-header-incl.patch \
> > >> >             "
> > >> >
> > >> > +# Workaround for network access issue during the do_unpack step
> > >> > +# this needs to be fixed in the recipes buildsystem to move
> > >> > +# this such that it can be accomplished during do_fetch task
> > >> > +do_unpack[network] =3D "1"
> > >> > +
> > >> >  UPSTREAM_CHECK_COMMITS =3D "1"
> > >> >  SRCREV =3D "ee6c1522af8ba9b56f8416c2eedafb440f681085"
> > >> >
> > >> > --
> > >> > 2.37.1
> > >> >
> > >> >
> > >> >
> > >> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#169504):
> https://lists.openembedded.org/g/openembedded-core/message/169504
> > Mute This Topic: https://lists.openembedded.org/mt/93089137/1686489
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>

--000000000000b6fcc405e67e9161
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0mer. 17 ao=C3=BBt 2022 =C3=A0=
=C2=A022:33, Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com=
">alex.kanavin@gmail.com</a>&gt; a =C3=A9crit=C2=A0:<br></div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex">I reproduced. This happens if all thre=
e are true:<br>
- recipe is using gitsm://<br>
- one of the submodules contains lfs objects<br>
- git-lfs is installed on the host (that&#39;s why it&#39;s not seen on the=
 AB)<br>
<br></blockquote><div>Nice! I figured out the first two points, but not the=
 last one. <br></div><div>=C2=A0<br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">
There&#39;s logic in plain git:// fetcher to deal with lfs, but not in<br>
gitsm://. So that logic needs to be added there as well. A workaround<br>
like you suggested is not the right fix.<br>
<br>
Can you look into it please? Or at least a ticket would be good to have.<br=
>
<br></blockquote><div>Sure, I will try to look at it</div><div>Julien<br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex">
Alex<br>
<br>
On Wed, 17 Aug 2022 at 21:42, Alexander Kanavin via<br>
<a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D"_bla=
nk">lists.openembedded.org</a> &lt;alex.kanavin=3D<a href=3D"mailto:gmail.c=
om@lists.openembedded.org" target=3D"_blank">gmail.com@lists.openembedded.o=
rg</a>&gt;<br>
wrote:<br>
&gt;<br>
&gt; Just to be sure, can you repeat this on a pristine poky master<br>
&gt; checkout with no cache and no downloads? &#39;bitbake -c unpack<br>
&gt; vulkan-samples&#39; should do.<br>
&gt;<br>
&gt; Also what does git --version say? I wonder if there&#39;s something in=
 too<br>
&gt; old or too new versions of it.<br>
&gt;<br>
&gt; Alex<br>
&gt;<br>
&gt; On Wed, 17 Aug 2022 at 21:22, Julien Stephan &lt;<a href=3D"mailto:jst=
ephan@baylibre.com" target=3D"_blank">jstephan@baylibre.com</a>&gt; wrote:<=
br>
&gt; &gt;<br>
&gt; &gt; Hi Alexander,<br>
&gt; &gt;<br>
&gt; &gt; I observe this by just trying to build the vulkan-samples recipe:=
 DISTRO=3Dpoky bitbake vulkan-samples.<br>
&gt; &gt;<br>
&gt; &gt; Here is the log output (sorry it is a bit verbose):<br>
&gt; &gt; ERROR: vulkan-samples-git-r0 do_unpack: Bitbake Fetcher Error: Fe=
tchError(&#39;Fetch command export PSEUDO_DISABLED=3D1; export SSH_AUTH_SOC=
K=3D&quot;/home/jstephan/.ssh/ssh_auth_sock&quot;; export PATH=3D&quot;/hom=
e/jstephan/kirkstone/build/tmp/sysroots-uninative/x86_64-linux/usr/bin:/hom=
e/jstephan/kirkstone/src/poky/scripts:/home/jstephan/kirkstone/build/tmp/wo=
rk/cortexa53-poky-linux/vulkan-samples/git-r0/recipe-sysroot-native/usr/bin=
/aarch64-poky-linux:/home/jstephan/kirkstone/build/tmp/work/cortexa53-poky-=
linux/vulkan-samples/git-r0/recipe-sysroot/usr/bin/crossscripts:/home/jstep=
han/kirkstone/build/tmp/work/cortexa53-poky-linux/vulkan-samples/git-r0/rec=
ipe-sysroot-native/usr/sbin:/home/jstephan/kirkstone/build/tmp/work/cortexa=
53-poky-linux/vulkan-samples/git-r0/recipe-sysroot-native/usr/bin:/home/jst=
ephan/kirkstone/build/tmp/work/cortexa53-poky-linux/vulkan-samples/git-r0/r=
ecipe-sysroot-native/sbin:/home/jstephan/kirkstone/build/tmp/work/cortexa53=
-poky-linux/vulkan-samples/git-r0/recipe-sysroot-native/bin:/home/jstephan/=
kirkstone/src/poky/bitbake/bin:/home/jstephan/kirkstone/build/tmp/hosttools=
&quot;; export HOME=3D&quot;/home/jstephan&quot;; git -c core.fsyncobjectfi=
les=3D0 -c gc.autoDetach=3Dfalse -c core.pager=3Dcat submodule update --rec=
ursive --no-fetch failed with exit code 1, output:\nSubmodule path \&#39;as=
sets\&#39;: checked out \&#39;8a6b7f952d7786a305f89d375a55598e995ee972\&#39=
;\nSubmodule path \&#39;third_party/CTPL\&#39;: checked out \&#39;437e135db=
d94eb65b45533d9ce8ee28b5bd37b6d\&#39;\nSubmodule path \&#39;third_party/ast=
c\&#39;: checked out \&#39;4861c3db1ca50eb5f5767d95d1cd1bacb98ac8a5\&#39;\n=
Submodule path \&#39;third_party/cli11\&#39;: checked out \&#39;4af78beef77=
7e313814b4daff70e2da9171a385a\&#39;\nSubmodule path \&#39;third_party/glfw\=
&#39;: checked out \&#39;6876cf8d7e0e70dc3e4d7b0224d08312c9f78099\&#39;\nSu=
bmodule path \&#39;third_party/glm\&#39;: checked out \&#39;fce2abd01ce2106=
3bd25ba67c9318be83bf48813\&#39;\nSubmodule path \&#39;third_party/glslang\&=
#39;: checked out \&#39;6baa85f6ceec5fddd2e13b43dd1edc944dd930af\&#39;\nSub=
module path \&#39;third_party/hwcpipe\&#39;: checked out \&#39;5a0c3d0b527b=
ea96154998f29177f3b449cebd3a\&#39;\nSubmodule path \&#39;third_party/imgui\=
&#39;: checked out \&#39;c23a19c26fa9cc778f755e76799f0cafdcb5a13b\&#39;\nSu=
bmodule path \&#39;third_party/opencl\&#39;: checked out \&#39;1aa1139b58a5=
15877a923cce6b254e09d1b2fb2c\&#39;\nSubmodule path \&#39;third_party/spdlog=
\&#39;: checked out \&#39;7bf8f148795d2571b4ae4aa9c6d2a8111fbb7077\&#39;\nS=
ubmodule path \&#39;third_party/spirv-cross\&#39;: checked out \&#39;84f56d=
0b43e5a6874de45e11be2bff9dc336fd7e\&#39;\nSubmodule path \&#39;third_party/=
stb\&#39;: checked out \&#39;2c2908f50515dcd939f24be261c3ccbcd277bb49\&#39;=
\nSubmodule path \&#39;third_party/tinygltf\&#39;: checked out \&#39;c0d025=
1e2c7f2273a894aa1b125af9313a88eae4\&#39;\nSubmodule path \&#39;third_party/=
vma\&#39;: checked out \&#39;f9921aefddee2437cc2e3303d3175bd8ef23e22c\&#39;=
\nSubmodule path \&#39;third_party/volk\&#39;: checked out \&#39;b18f319288=
6981f28d17f8f41c26c5a53ac3b977\&#39;\nSubmodule path \&#39;third_party/vulk=
an\&#39;: checked out \&#39;76f00ef6cbb1886eb1162d1fa39bee8b51e22ee8\&#39;\=
n\nDownloading other_lib/ios/Debug-iphoneos/libSDL2.a (8.2 MB)\nError downl=
oading object: other_lib/ios/Debug-iphoneos/libSDL2.a (5045776): Smudge err=
or: Error downloading other_lib/ios/Debug-iphoneos/libSDL2.a (5045776556ca5=
7f2f7125d89c37a8b94f79cdebdc040d420513f0491787c4ea7): batch response: Post =
<a href=3D"https://github.com/KhronosGroup/KTX-Software.git/info/lfs/object=
s/batch" rel=3D"noreferrer" target=3D"_blank">https://github.com/KhronosGro=
up/KTX-Software.git/info/lfs/objects/batch</a>: dial tcp: lookup <a href=3D=
"http://github.com" rel=3D"noreferrer" target=3D"_blank">github.com</a>: Te=
mporary failure in name resolution\n\nErrors logged to /home/jstephan/kirks=
tone/build/tmp/work/cortexa53-poky-linux/vulkan-samples/git-r0/git/.git/mod=
ules/third_party/ktx/lfs/logs/20220817T152514.337649981.log\nUse `git lfs l=
ogs last` to view the log.\nerror: external filter \&#39;git-lfs filter-pro=
cess\&#39; failed\nfatal: other_lib/ios/Debug-iphoneos/libSDL2.a: smudge fi=
lter lfs failed\nUnable to checkout \&#39;6a38a0694b4d73d22c5d1e22f865d0354=
5e808ea\&#39; in submodule path \&#39;third_party/ktx\&#39;\n&#39;, None)<b=
r>
&gt; &gt; ERROR: Logfile of failure stored in: /home/jstephan/kirkstone/bui=
ld/tmp/work/cortexa53-poky-linux/vulkan-samples/git-r0/temp/log.do_unpack.1=
796011<br>
&gt; &gt; ERROR: Task (/home/jstephan/kirkstone/src/poky/meta/recipes-graph=
ics/vulkan/vulkan-samples_git.bb:do_unpack) failed with exit code &#39;1&#3=
9;<br>
&gt; &gt;<br>
&gt; &gt; Julien<br>
&gt; &gt;<br>
&gt; &gt; Le mer. 17 ao=C3=BBt 2022 =C3=A0 21:09, Alexander Kanavin &lt;<a =
href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.kanavin@gmail=
.com</a>&gt; a =C3=A9crit :<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; This has not been observed on the autobuilder or independentl=
y<br>
&gt; &gt;&gt; reported, can you show how to reproduce or the failure log?<b=
r>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; Alex<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; On Wed, 17 Aug 2022 at 21:01, Julien STEPHAN &lt;<a href=3D"m=
ailto:jstephan@baylibre.com" target=3D"_blank">jstephan@baylibre.com</a>&gt=
; wrote:<br>
&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt; vulkan-samples uses git submodules and one of the submod=
ules uses lfs<br>
&gt; &gt;&gt; &gt; objects. During the unpack step, the lfs objects are ret=
rieved leading to<br>
&gt; &gt;&gt; &gt; a network failure.<br>
&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt; The correct fix is to fetch lfs objects during the fetch=
 step, but let&#39;s<br>
&gt; &gt;&gt; &gt; workaround this issue for now<br>
&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt; Signed-off-by: Julien STEPHAN &lt;<a href=3D"mailto:jste=
phan@baylibre.com" target=3D"_blank">jstephan@baylibre.com</a>&gt;<br>
&gt; &gt;&gt; &gt; ---<br>
&gt; &gt;&gt; &gt;=C2=A0 meta/recipes-graphics/vulkan/<a href=3D"http://vul=
kan-samples_git.bb" rel=3D"noreferrer" target=3D"_blank">vulkan-samples_git=
.bb</a> | 5 +++++<br>
&gt; &gt;&gt; &gt;=C2=A0 1 file changed, 5 insertions(+)<br>
&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt; diff --git a/meta/recipes-graphics/vulkan/<a href=3D"htt=
p://vulkan-samples_git.bb" rel=3D"noreferrer" target=3D"_blank">vulkan-samp=
les_git.bb</a> b/meta/recipes-graphics/vulkan/<a href=3D"http://vulkan-samp=
les_git.bb" rel=3D"noreferrer" target=3D"_blank">vulkan-samples_git.bb</a><=
br>
&gt; &gt;&gt; &gt; index 41cb4a437d..b45ee22a69 100644<br>
&gt; &gt;&gt; &gt; --- a/meta/recipes-graphics/vulkan/<a href=3D"http://vul=
kan-samples_git.bb" rel=3D"noreferrer" target=3D"_blank">vulkan-samples_git=
.bb</a><br>
&gt; &gt;&gt; &gt; +++ b/meta/recipes-graphics/vulkan/<a href=3D"http://vul=
kan-samples_git.bb" rel=3D"noreferrer" target=3D"_blank">vulkan-samples_git=
.bb</a><br>
&gt; &gt;&gt; &gt; @@ -11,6 +11,11 @@ SRC_URI =3D &quot;gitsm://<a href=3D"=
http://github.com/KhronosGroup/Vulkan-Samples.git;branch=3Dmaster;prot" rel=
=3D"noreferrer" target=3D"_blank">github.com/KhronosGroup/Vulkan-Samples.gi=
t;branch=3Dmaster;prot</a><br>
&gt; &gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://00=
01-framework-core-hpp_vulkan_resource.h-add-header-incl.patch \<br>
&gt; &gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br=
>
&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt; +# Workaround for network access issue during the do_unp=
ack step<br>
&gt; &gt;&gt; &gt; +# this needs to be fixed in the recipes buildsystem to =
move<br>
&gt; &gt;&gt; &gt; +# this such that it can be accomplished during do_fetch=
 task<br>
&gt; &gt;&gt; &gt; +do_unpack[network] =3D &quot;1&quot;<br>
&gt; &gt;&gt; &gt; +<br>
&gt; &gt;&gt; &gt;=C2=A0 UPSTREAM_CHECK_COMMITS =3D &quot;1&quot;<br>
&gt; &gt;&gt; &gt;=C2=A0 SRCREV =3D &quot;ee6c1522af8ba9b56f8416c2eedafb440=
f681085&quot;<br>
&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt; --<br>
&gt; &gt;&gt; &gt; 2.37.1<br>
&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt;<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#169504): <a href=3D"https://lists.openembedded.org=
/g/openembedded-core/message/169504" rel=3D"noreferrer" target=3D"_blank">h=
ttps://lists.openembedded.org/g/openembedded-core/message/169504</a><br>
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
</blockquote></div></div>

--000000000000b6fcc405e67e9161--

