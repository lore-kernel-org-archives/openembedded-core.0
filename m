Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8912C3F6B0
	for <webhook@archiver.kernel.org>; Thu, 18 Aug 2022 20:01:03 +0000 (UTC)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com
 [209.85.208.172])
 by mx.groups.io with SMTP id smtpd.web11.46784.1660852857744763490
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Aug 2022 13:00:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=m1WonPGE;
 spf=pass (domain: gmail.com, ip: 209.85.208.172,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f172.google.com with SMTP id bx38so2679675ljb.10
        for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Aug 2022 13:00:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc;
        bh=DXgJ5u1qIeSSYRkdeaFCe0HgrMkbKJ02s/zsnrrD6xg=;
        b=m1WonPGEUsRcyZsGszGA2nliZcR9WEA8dFeHjZ9BEx7iZg1mRwecrtiLPhAGHl3ahf
         CY9GDzJgH5cXBySucWf+tb38b/m/w4Ir1O2dsPnVUrBlZmCq1sk9LdxgM/hmdBnGo79O
         U/liSBnTaNAJn0zdlKJ/iXA2H0RtGrDWZXnnHxMXxuIptWxUMKxS8XauGHH6w97ll9j/
         yEK3QqMKdF582IzlTJuDzqCoJ46a5pZof3r+6PWKIWtOKiSl/vqDsCy5feMzRp5J8hDD
         gnBQPS+LqHWJe9SbG+JDBB8p0CruHU8+m2GGDMaTO64uvShltMIETzl+PWbxxVcVG2Do
         0F/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
        bh=DXgJ5u1qIeSSYRkdeaFCe0HgrMkbKJ02s/zsnrrD6xg=;
        b=EHjpwTQG9LMyB5lDGTruidvnHgItP9fSd/+OgOhvbP1hFSotxxrXmDqvPirdXTc1mK
         EDbP6mc+HZjRMEe76mC3IiHJhk2DCU00c2aQ6GFRpuYSLKD8ug4iYtVgzDX/Oxa60PBb
         QZllZ23iyRirKdb7j5j2goISGL2b3Bmt/uDJsgb0ysVzPbJaYjH+eicTOBzojMhrgn6S
         hZjLz3Ol2T+JlmcBGXSfnI7e7gHvtM3dxzajw1EXUrGYY0HTrjrpJruAfxOynmQOb64d
         Usxm1dElh8Jt5AYUEfHc3GYhvGlY3ZJM4JtaWCfk0tsZTbz/QAOcijCX51M0hdTTmO7n
         tKAw==
X-Gm-Message-State: ACgBeo0/p5aeJDpw+e8I8R7m8QDIBdg3ZU5/JeRyNDPYycxv7DJi30dH
	1tjdprOtZ26YtAFGgaRPggmB8Lfpsv51bjojzH4=
X-Google-Smtp-Source: 
 AA6agR6PxRG43k2xFDTxUHWXW3XMTy45wALmB1EjUgRmQNLxcPjY5kCDiyxa+VnX7lNeCRhdnpXJKFpgxJmnRDh07Uo=
X-Received: by 2002:a2e:9415:0:b0:25e:477b:adc9 with SMTP id
 i21-20020a2e9415000000b0025e477badc9mr1200016ljh.109.1660852855618; Thu, 18
 Aug 2022 13:00:55 -0700 (PDT)
MIME-Version: 1.0
References: <20220817190124.2126652-1-jstephan@baylibre.com>
 <CANNYZj_VxXe6aZKXstZVNov9aeQJ-2beBY1=WojSPA-gvXQqvg@mail.gmail.com>
 <CAEHHSvavULJhb-W6MJ+2GSouf8sBk_xFHXeHdQCO_VF_zsqn5g@mail.gmail.com>
 <170C3947C33061FA.1805@lists.openembedded.org>
 <CANNYZj-ZOPgM_iLFw6uQWF+St_GWNNOfdWB0zUw_yZQfWjQuig@mail.gmail.com>
 <CAEHHSvZaksW7-4Q0bVOd8hdw6KFc7dCdCQ+eUsGd155dGhvoFw@mail.gmail.com>
 <CA+chaQdFkumtCNg7AqtwdorpBTvS6MyxO_-vptBysKN9ftoihw@mail.gmail.com>
In-Reply-To: 
 <CA+chaQdFkumtCNg7AqtwdorpBTvS6MyxO_-vptBysKN9ftoihw@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 18 Aug 2022 22:00:43 +0200
Message-ID: 
 <CANNYZj-4-cieSDbj48siDwZrTZHA64s=x=GAhYu4ohOF0XzP_A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] vulkan-samples: enable network during do_unpack
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Julien STEPHAN <jstephan@baylibre.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Aug 2022 20:01:03 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169540

The ticket is RESOLVED/FIXED, which is surely not the case here?

Alex

On Thu, 18 Aug 2022 at 21:45, Martin Jansa <martin.jansa@gmail.com> wrote:
>
> There is ticket about this already, see
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D14283
>
> On Thu, Aug 18, 2022 at 9:02 AM Julien STEPHAN <jstephan@baylibre.com> wr=
ote:
>>
>>
>>
>> Le mer. 17 ao=C3=BBt 2022 =C3=A0 22:33, Alexander Kanavin <alex.kanavin@=
gmail.com> a =C3=A9crit :
>>>
>>> I reproduced. This happens if all three are true:
>>> - recipe is using gitsm://
>>> - one of the submodules contains lfs objects
>>> - git-lfs is installed on the host (that's why it's not seen on the AB)
>>>
>> Nice! I figured out the first two points, but not the last one.
>>
>>>
>>> There's logic in plain git:// fetcher to deal with lfs, but not in
>>> gitsm://. So that logic needs to be added there as well. A workaround
>>> like you suggested is not the right fix.
>>>
>>> Can you look into it please? Or at least a ticket would be good to have=
.
>>>
>> Sure, I will try to look at it
>> Julien
>>>
>>> Alex
>>>
>>> On Wed, 17 Aug 2022 at 21:42, Alexander Kanavin via
>>> lists.openembedded.org <alex.kanavin=3Dgmail.com@lists.openembedded.org=
>
>>> wrote:
>>> >
>>> > Just to be sure, can you repeat this on a pristine poky master
>>> > checkout with no cache and no downloads? 'bitbake -c unpack
>>> > vulkan-samples' should do.
>>> >
>>> > Also what does git --version say? I wonder if there's something in to=
o
>>> > old or too new versions of it.
>>> >
>>> > Alex
>>> >
>>> > On Wed, 17 Aug 2022 at 21:22, Julien Stephan <jstephan@baylibre.com> =
wrote:
>>> > >
>>> > > Hi Alexander,
>>> > >
>>> > > I observe this by just trying to build the vulkan-samples recipe: D=
ISTRO=3Dpoky bitbake vulkan-samples.
>>> > >
>>> > > Here is the log output (sorry it is a bit verbose):
>>> > > ERROR: vulkan-samples-git-r0 do_unpack: Bitbake Fetcher Error: Fetc=
hError('Fetch command export PSEUDO_DISABLED=3D1; export SSH_AUTH_SOCK=3D"/=
home/jstephan/.ssh/ssh_auth_sock"; export PATH=3D"/home/jstephan/kirkstone/=
build/tmp/sysroots-uninative/x86_64-linux/usr/bin:/home/jstephan/kirkstone/=
src/poky/scripts:/home/jstephan/kirkstone/build/tmp/work/cortexa53-poky-lin=
ux/vulkan-samples/git-r0/recipe-sysroot-native/usr/bin/aarch64-poky-linux:/=
home/jstephan/kirkstone/build/tmp/work/cortexa53-poky-linux/vulkan-samples/=
git-r0/recipe-sysroot/usr/bin/crossscripts:/home/jstephan/kirkstone/build/t=
mp/work/cortexa53-poky-linux/vulkan-samples/git-r0/recipe-sysroot-native/us=
r/sbin:/home/jstephan/kirkstone/build/tmp/work/cortexa53-poky-linux/vulkan-=
samples/git-r0/recipe-sysroot-native/usr/bin:/home/jstephan/kirkstone/build=
/tmp/work/cortexa53-poky-linux/vulkan-samples/git-r0/recipe-sysroot-native/=
sbin:/home/jstephan/kirkstone/build/tmp/work/cortexa53-poky-linux/vulkan-sa=
mples/git-r0/recipe-sysroot-native/bin:/home/jstephan/kirkstone/src/poky/bi=
tbake/bin:/home/jstephan/kirkstone/build/tmp/hosttools"; export HOME=3D"/ho=
me/jstephan"; git -c core.fsyncobjectfiles=3D0 -c gc.autoDetach=3Dfalse -c =
core.pager=3Dcat submodule update --recursive --no-fetch failed with exit c=
ode 1, output:\nSubmodule path \'assets\': checked out \'8a6b7f952d7786a305=
f89d375a55598e995ee972\'\nSubmodule path \'third_party/CTPL\': checked out =
\'437e135dbd94eb65b45533d9ce8ee28b5bd37b6d\'\nSubmodule path \'third_party/=
astc\': checked out \'4861c3db1ca50eb5f5767d95d1cd1bacb98ac8a5\'\nSubmodule=
 path \'third_party/cli11\': checked out \'4af78beef777e313814b4daff70e2da9=
171a385a\'\nSubmodule path \'third_party/glfw\': checked out \'6876cf8d7e0e=
70dc3e4d7b0224d08312c9f78099\'\nSubmodule path \'third_party/glm\': checked=
 out \'fce2abd01ce21063bd25ba67c9318be83bf48813\'\nSubmodule path \'third_p=
arty/glslang\': checked out \'6baa85f6ceec5fddd2e13b43dd1edc944dd930af\'\nS=
ubmodule path \'third_party/hwcpipe\': checked out \'5a0c3d0b527bea96154998=
f29177f3b449cebd3a\'\nSubmodule path \'third_party/imgui\': checked out \'c=
23a19c26fa9cc778f755e76799f0cafdcb5a13b\'\nSubmodule path \'third_party/ope=
ncl\': checked out \'1aa1139b58a515877a923cce6b254e09d1b2fb2c\'\nSubmodule =
path \'third_party/spdlog\': checked out \'7bf8f148795d2571b4ae4aa9c6d2a811=
1fbb7077\'\nSubmodule path \'third_party/spirv-cross\': checked out \'84f56=
d0b43e5a6874de45e11be2bff9dc336fd7e\'\nSubmodule path \'third_party/stb\': =
checked out \'2c2908f50515dcd939f24be261c3ccbcd277bb49\'\nSubmodule path \'=
third_party/tinygltf\': checked out \'c0d0251e2c7f2273a894aa1b125af9313a88e=
ae4\'\nSubmodule path \'third_party/vma\': checked out \'f9921aefddee2437cc=
2e3303d3175bd8ef23e22c\'\nSubmodule path \'third_party/volk\': checked out =
\'b18f3192886981f28d17f8f41c26c5a53ac3b977\'\nSubmodule path \'third_party/=
vulkan\': checked out \'76f00ef6cbb1886eb1162d1fa39bee8b51e22ee8\'\n\nDownl=
oading other_lib/ios/Debug-iphoneos/libSDL2.a (8.2 MB)\nError downloading o=
bject: other_lib/ios/Debug-iphoneos/libSDL2.a (5045776): Smudge error: Erro=
r downloading other_lib/ios/Debug-iphoneos/libSDL2.a (5045776556ca57f2f7125=
d89c37a8b94f79cdebdc040d420513f0491787c4ea7): batch response: Post https://=
github.com/KhronosGroup/KTX-Software.git/info/lfs/objects/batch: dial tcp: =
lookup github.com: Temporary failure in name resolution\n\nErrors logged to=
 /home/jstephan/kirkstone/build/tmp/work/cortexa53-poky-linux/vulkan-sample=
s/git-r0/git/.git/modules/third_party/ktx/lfs/logs/20220817T152514.33764998=
1.log\nUse `git lfs logs last` to view the log.\nerror: external filter \'g=
it-lfs filter-process\' failed\nfatal: other_lib/ios/Debug-iphoneos/libSDL2=
.a: smudge filter lfs failed\nUnable to checkout \'6a38a0694b4d73d22c5d1e22=
f865d03545e808ea\' in submodule path \'third_party/ktx\'\n', None)
>>> > > ERROR: Logfile of failure stored in: /home/jstephan/kirkstone/build=
/tmp/work/cortexa53-poky-linux/vulkan-samples/git-r0/temp/log.do_unpack.179=
6011
>>> > > ERROR: Task (/home/jstephan/kirkstone/src/poky/meta/recipes-graphic=
s/vulkan/vulkan-samples_git.bb:do_unpack) failed with exit code '1'
>>> > >
>>> > > Julien
>>> > >
>>> > > Le mer. 17 ao=C3=BBt 2022 =C3=A0 21:09, Alexander Kanavin <alex.kan=
avin@gmail.com> a =C3=A9crit :
>>> > >>
>>> > >> This has not been observed on the autobuilder or independently
>>> > >> reported, can you show how to reproduce or the failure log?
>>> > >>
>>> > >> Alex
>>> > >>
>>> > >> On Wed, 17 Aug 2022 at 21:01, Julien STEPHAN <jstephan@baylibre.co=
m> wrote:
>>> > >> >
>>> > >> > vulkan-samples uses git submodules and one of the submodules use=
s lfs
>>> > >> > objects. During the unpack step, the lfs objects are retrieved l=
eading to
>>> > >> > a network failure.
>>> > >> >
>>> > >> > The correct fix is to fetch lfs objects during the fetch step, b=
ut let's
>>> > >> > workaround this issue for now
>>> > >> >
>>> > >> > Signed-off-by: Julien STEPHAN <jstephan@baylibre.com>
>>> > >> > ---
>>> > >> >  meta/recipes-graphics/vulkan/vulkan-samples_git.bb | 5 +++++
>>> > >> >  1 file changed, 5 insertions(+)
>>> > >> >
>>> > >> > diff --git a/meta/recipes-graphics/vulkan/vulkan-samples_git.bb =
b/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
>>> > >> > index 41cb4a437d..b45ee22a69 100644
>>> > >> > --- a/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
>>> > >> > +++ b/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
>>> > >> > @@ -11,6 +11,11 @@ SRC_URI =3D "gitsm://github.com/KhronosGroup/=
Vulkan-Samples.git;branch=3Dmaster;prot
>>> > >> >             file://0001-framework-core-hpp_vulkan_resource.h-add=
-header-incl.patch \
>>> > >> >             "
>>> > >> >
>>> > >> > +# Workaround for network access issue during the do_unpack step
>>> > >> > +# this needs to be fixed in the recipes buildsystem to move
>>> > >> > +# this such that it can be accomplished during do_fetch task
>>> > >> > +do_unpack[network] =3D "1"
>>> > >> > +
>>> > >> >  UPSTREAM_CHECK_COMMITS =3D "1"
>>> > >> >  SRCREV =3D "ee6c1522af8ba9b56f8416c2eedafb440f681085"
>>> > >> >
>>> > >> > --
>>> > >> > 2.37.1
>>> > >> >
>>> > >> >
>>> > >> >
>>> > >> >
>>> >
>>> >
>>> >
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#169514): https://lists.openembedded.org/g/openembedd=
ed-core/message/169514
>> Mute This Topic: https://lists.openembedded.org/mt/93089137/3617156
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [M=
artin.Jansa@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>

