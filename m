Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 657AEC25B08
	for <webhook@archiver.kernel.org>; Wed, 17 Aug 2022 20:33:27 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.web11.33835.1660768401409790829
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Aug 2022 13:33:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=L8TpTbFh;
 spf=pass (domain: gmail.com, ip: 209.85.167.46,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f46.google.com with SMTP id i19so2133090lfr.10
        for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Aug 2022 13:33:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc;
        bh=6TuAq9hHt91UX1o3XLhnVkyUUuoNFcFi+9H+kkGiX6c=;
        b=L8TpTbFhhOtJeUjiP7FA2B+/7kTK2pidajAim1wLH1x/b0hLWT+QMTQ7Cb/dXnr0md
         UqXOhrgkAcR/SNcKpmyENK6jMt1efA66XeS7PbGlag6/1cLE+kp07pggWy9L8UGDjiza
         JZ5+FXCr2FoCuFcU4jNlE9vlElG9gbz+A8ARMGo6Qm1Ize3Wh7iEDCOgiBMGIWZzS21D
         AvOye03QBroAqmFR7W/WWSk2NHQgG2UnzYLQ8DX5m8x+5qwDHrKquSog6/Wy/ZFYUUOt
         lVGqT6Rf73L0PjJlLTwBCcgZedOmTxyq6ubz85xc0nYWBdZ/cZRclx4J2Iz5En6J8BSc
         fuLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
        bh=6TuAq9hHt91UX1o3XLhnVkyUUuoNFcFi+9H+kkGiX6c=;
        b=HRTfWNfjCHLYN/JMu9EewoAZn2bWu+ixvfGf8d+i+raPyMEY00Sq1BH13uUg71da8h
         9rSFC7+gNp/LpBvo+7pgFmRSJpu8nf7JlfRlymATKRtJwmtkn48Z87dCT2riETVBEIxR
         D4Rj21SOdf8l4kkZrmFh1KGeuF2Ci/ZBTS94fUo6UmMchltEminSJ0ffgKr1DLhn1NHd
         1EOB2GqbVtacdessOEYAm0gS4IUFQpGOlMPFQQXkyQzxSwUn2nTRMqcQJ6o4+PjkKu3B
         KzUQjOfu7wWzmP95jZKzWAgXygDD/dqaVHPkioz/IzmE0JHbOoF+BAyvWLUMowzr9Id9
         I2eA==
X-Gm-Message-State: ACgBeo130Qp0+sAdMQPv+s2KK2WqMvRH6CmbJWByHcwhDBXRk7SOiC+s
	7/Tu7yQcL6JUcFBjhVBu3P3nwys6OkejVjD3hSs=
X-Google-Smtp-Source: 
 AA6agR53UUlpVfBjnuwxwgH7z8Ge1RTKKBEYx4S0YDfxXzzrN7i1AYG4L6AmUbXG7IjHdKOPESHo+el7VxIAx3wCqGo=
X-Received: by 2002:a05:6512:33d4:b0:48b:3a5f:e6e7 with SMTP id
 d20-20020a05651233d400b0048b3a5fe6e7mr8798335lfg.665.1660768399559; Wed, 17
 Aug 2022 13:33:19 -0700 (PDT)
MIME-Version: 1.0
References: <20220817190124.2126652-1-jstephan@baylibre.com>
 <CANNYZj_VxXe6aZKXstZVNov9aeQJ-2beBY1=WojSPA-gvXQqvg@mail.gmail.com>
 <CAEHHSvavULJhb-W6MJ+2GSouf8sBk_xFHXeHdQCO_VF_zsqn5g@mail.gmail.com>
 <170C3947C33061FA.1805@lists.openembedded.org>
In-Reply-To: <170C3947C33061FA.1805@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 17 Aug 2022 22:33:07 +0200
Message-ID: 
 <CANNYZj-ZOPgM_iLFw6uQWF+St_GWNNOfdWB0zUw_yZQfWjQuig@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] vulkan-samples: enable network during do_unpack
To: Julien Stephan <jstephan@baylibre.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Aug 2022 20:33:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169505

I reproduced. This happens if all three are true:
- recipe is using gitsm://
- one of the submodules contains lfs objects
- git-lfs is installed on the host (that's why it's not seen on the AB)

There's logic in plain git:// fetcher to deal with lfs, but not in
gitsm://. So that logic needs to be added there as well. A workaround
like you suggested is not the right fix.

Can you look into it please? Or at least a ticket would be good to have.

Alex

On Wed, 17 Aug 2022 at 21:42, Alexander Kanavin via
lists.openembedded.org <alex.kanavin=3Dgmail.com@lists.openembedded.org>
wrote:
>
> Just to be sure, can you repeat this on a pristine poky master
> checkout with no cache and no downloads? 'bitbake -c unpack
> vulkan-samples' should do.
>
> Also what does git --version say? I wonder if there's something in too
> old or too new versions of it.
>
> Alex
>
> On Wed, 17 Aug 2022 at 21:22, Julien Stephan <jstephan@baylibre.com> wrot=
e:
> >
> > Hi Alexander,
> >
> > I observe this by just trying to build the vulkan-samples recipe: DISTR=
O=3Dpoky bitbake vulkan-samples.
> >
> > Here is the log output (sorry it is a bit verbose):
> > ERROR: vulkan-samples-git-r0 do_unpack: Bitbake Fetcher Error: FetchErr=
or('Fetch command export PSEUDO_DISABLED=3D1; export SSH_AUTH_SOCK=3D"/home=
/jstephan/.ssh/ssh_auth_sock"; export PATH=3D"/home/jstephan/kirkstone/buil=
d/tmp/sysroots-uninative/x86_64-linux/usr/bin:/home/jstephan/kirkstone/src/=
poky/scripts:/home/jstephan/kirkstone/build/tmp/work/cortexa53-poky-linux/v=
ulkan-samples/git-r0/recipe-sysroot-native/usr/bin/aarch64-poky-linux:/home=
/jstephan/kirkstone/build/tmp/work/cortexa53-poky-linux/vulkan-samples/git-=
r0/recipe-sysroot/usr/bin/crossscripts:/home/jstephan/kirkstone/build/tmp/w=
ork/cortexa53-poky-linux/vulkan-samples/git-r0/recipe-sysroot-native/usr/sb=
in:/home/jstephan/kirkstone/build/tmp/work/cortexa53-poky-linux/vulkan-samp=
les/git-r0/recipe-sysroot-native/usr/bin:/home/jstephan/kirkstone/build/tmp=
/work/cortexa53-poky-linux/vulkan-samples/git-r0/recipe-sysroot-native/sbin=
:/home/jstephan/kirkstone/build/tmp/work/cortexa53-poky-linux/vulkan-sample=
s/git-r0/recipe-sysroot-native/bin:/home/jstephan/kirkstone/src/poky/bitbak=
e/bin:/home/jstephan/kirkstone/build/tmp/hosttools"; export HOME=3D"/home/j=
stephan"; git -c core.fsyncobjectfiles=3D0 -c gc.autoDetach=3Dfalse -c core=
.pager=3Dcat submodule update --recursive --no-fetch failed with exit code =
1, output:\nSubmodule path \'assets\': checked out \'8a6b7f952d7786a305f89d=
375a55598e995ee972\'\nSubmodule path \'third_party/CTPL\': checked out \'43=
7e135dbd94eb65b45533d9ce8ee28b5bd37b6d\'\nSubmodule path \'third_party/astc=
\': checked out \'4861c3db1ca50eb5f5767d95d1cd1bacb98ac8a5\'\nSubmodule pat=
h \'third_party/cli11\': checked out \'4af78beef777e313814b4daff70e2da9171a=
385a\'\nSubmodule path \'third_party/glfw\': checked out \'6876cf8d7e0e70dc=
3e4d7b0224d08312c9f78099\'\nSubmodule path \'third_party/glm\': checked out=
 \'fce2abd01ce21063bd25ba67c9318be83bf48813\'\nSubmodule path \'third_party=
/glslang\': checked out \'6baa85f6ceec5fddd2e13b43dd1edc944dd930af\'\nSubmo=
dule path \'third_party/hwcpipe\': checked out \'5a0c3d0b527bea96154998f291=
77f3b449cebd3a\'\nSubmodule path \'third_party/imgui\': checked out \'c23a1=
9c26fa9cc778f755e76799f0cafdcb5a13b\'\nSubmodule path \'third_party/opencl\=
': checked out \'1aa1139b58a515877a923cce6b254e09d1b2fb2c\'\nSubmodule path=
 \'third_party/spdlog\': checked out \'7bf8f148795d2571b4ae4aa9c6d2a8111fbb=
7077\'\nSubmodule path \'third_party/spirv-cross\': checked out \'84f56d0b4=
3e5a6874de45e11be2bff9dc336fd7e\'\nSubmodule path \'third_party/stb\': chec=
ked out \'2c2908f50515dcd939f24be261c3ccbcd277bb49\'\nSubmodule path \'thir=
d_party/tinygltf\': checked out \'c0d0251e2c7f2273a894aa1b125af9313a88eae4\=
'\nSubmodule path \'third_party/vma\': checked out \'f9921aefddee2437cc2e33=
03d3175bd8ef23e22c\'\nSubmodule path \'third_party/volk\': checked out \'b1=
8f3192886981f28d17f8f41c26c5a53ac3b977\'\nSubmodule path \'third_party/vulk=
an\': checked out \'76f00ef6cbb1886eb1162d1fa39bee8b51e22ee8\'\n\nDownloadi=
ng other_lib/ios/Debug-iphoneos/libSDL2.a (8.2 MB)\nError downloading objec=
t: other_lib/ios/Debug-iphoneos/libSDL2.a (5045776): Smudge error: Error do=
wnloading other_lib/ios/Debug-iphoneos/libSDL2.a (5045776556ca57f2f7125d89c=
37a8b94f79cdebdc040d420513f0491787c4ea7): batch response: Post https://gith=
ub.com/KhronosGroup/KTX-Software.git/info/lfs/objects/batch: dial tcp: look=
up github.com: Temporary failure in name resolution\n\nErrors logged to /ho=
me/jstephan/kirkstone/build/tmp/work/cortexa53-poky-linux/vulkan-samples/gi=
t-r0/git/.git/modules/third_party/ktx/lfs/logs/20220817T152514.337649981.lo=
g\nUse `git lfs logs last` to view the log.\nerror: external filter \'git-l=
fs filter-process\' failed\nfatal: other_lib/ios/Debug-iphoneos/libSDL2.a: =
smudge filter lfs failed\nUnable to checkout \'6a38a0694b4d73d22c5d1e22f865=
d03545e808ea\' in submodule path \'third_party/ktx\'\n', None)
> > ERROR: Logfile of failure stored in: /home/jstephan/kirkstone/build/tmp=
/work/cortexa53-poky-linux/vulkan-samples/git-r0/temp/log.do_unpack.1796011
> > ERROR: Task (/home/jstephan/kirkstone/src/poky/meta/recipes-graphics/vu=
lkan/vulkan-samples_git.bb:do_unpack) failed with exit code '1'
> >
> > Julien
> >
> > Le mer. 17 ao=C3=BBt 2022 =C3=A0 21:09, Alexander Kanavin <alex.kanavin=
@gmail.com> a =C3=A9crit :
> >>
> >> This has not been observed on the autobuilder or independently
> >> reported, can you show how to reproduce or the failure log?
> >>
> >> Alex
> >>
> >> On Wed, 17 Aug 2022 at 21:01, Julien STEPHAN <jstephan@baylibre.com> w=
rote:
> >> >
> >> > vulkan-samples uses git submodules and one of the submodules uses lf=
s
> >> > objects. During the unpack step, the lfs objects are retrieved leadi=
ng to
> >> > a network failure.
> >> >
> >> > The correct fix is to fetch lfs objects during the fetch step, but l=
et's
> >> > workaround this issue for now
> >> >
> >> > Signed-off-by: Julien STEPHAN <jstephan@baylibre.com>
> >> > ---
> >> >  meta/recipes-graphics/vulkan/vulkan-samples_git.bb | 5 +++++
> >> >  1 file changed, 5 insertions(+)
> >> >
> >> > diff --git a/meta/recipes-graphics/vulkan/vulkan-samples_git.bb b/me=
ta/recipes-graphics/vulkan/vulkan-samples_git.bb
> >> > index 41cb4a437d..b45ee22a69 100644
> >> > --- a/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
> >> > +++ b/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
> >> > @@ -11,6 +11,11 @@ SRC_URI =3D "gitsm://github.com/KhronosGroup/Vulk=
an-Samples.git;branch=3Dmaster;prot
> >> >             file://0001-framework-core-hpp_vulkan_resource.h-add-hea=
der-incl.patch \
> >> >             "
> >> >
> >> > +# Workaround for network access issue during the do_unpack step
> >> > +# this needs to be fixed in the recipes buildsystem to move
> >> > +# this such that it can be accomplished during do_fetch task
> >> > +do_unpack[network] =3D "1"
> >> > +
> >> >  UPSTREAM_CHECK_COMMITS =3D "1"
> >> >  SRCREV =3D "ee6c1522af8ba9b56f8416c2eedafb440f681085"
> >> >
> >> > --
> >> > 2.37.1
> >> >
> >> >
> >> >
> >> >
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#169504): https://lists.openembedded.org/g/openembedde=
d-core/message/169504
> Mute This Topic: https://lists.openembedded.org/mt/93089137/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
ex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

