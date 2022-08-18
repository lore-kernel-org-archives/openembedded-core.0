Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5936C00140
	for <webhook@archiver.kernel.org>; Thu, 18 Aug 2022 19:46:03 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web12.46601.1660851955021449692
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Aug 2022 12:45:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=iYIB8uAX;
 spf=pass (domain: gmail.com, ip: 209.85.221.46,
 mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f46.google.com with SMTP id a4so2885315wrq.1
        for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Aug 2022 12:45:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=Gy+tihN+qYWeT50vF+cE8CDz0+7sScd13Q/vobvE6s0=;
        b=iYIB8uAXk6uzlp7bkGTDF8EGTsY2eqUQK0kgqGj9zHpV1ZvhrC+gafG9nQMYRRZEAp
         xlERVt5KHQPeMmP77A8JkHX/cesho16L4VNoXfk8D32mg6G/JOM4hHiR107OZEwzOJ8a
         JAv/nLbxIxAeW9nb584bizE8RruECusIvXwI/DexsmMuynQFIhifsjqNnwes2/id80LR
         a49GeBRg5zeRxVQLg2XjicBZLg3Lhds74onZdVt/7nE1shNOD5VicLn7zJ0LSBU3022k
         Ocmtx/KC+BW4hc+Y2jnnajD+z+6+bX5Ec4GDFgSs2czuj5Qb5rvDoEMH7o6muIzR93zf
         +wvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=Gy+tihN+qYWeT50vF+cE8CDz0+7sScd13Q/vobvE6s0=;
        b=1YLY4v4jB9djhnSEP6S+3GJG5lf9jK6T0t9oETUeaqwfNXTuHRRk1t9tq1GIECElmG
         0YN0YOfoj9s3oIbV2tbZk39IMYCtm26JmKCnx6kHHjKzO+P4zCdK3qwjbuVq3Week5Vo
         YnLPXE9IrDqJzMmTXe5vIw9tUdvTGADlVXn0RobHbMMdTkDECNIzfMViwjL5bgl8MEW0
         0UssXsKgLDYFVA9uhfP0d7wNC8Qi8h6iccOH3cLNcgzXXP4Xu3aVwtE227TUPnleeDCz
         iCrqE3sky8Q5wXjc3Abgwu5LpR3i95lGgxwBqmbecJ+N+vNkbEjLy/0gj+aIPp2TjkSn
         BvjA==
X-Gm-Message-State: ACgBeo21dESmG0CMla3TiXZrZ/B8eog3TSB7UMKk+WbyVJbLNu/0yW1b
	3br6UoXHGSL+OkwgmxQfCMFnLs6W0ZoxeApyYdo=
X-Google-Smtp-Source: 
 AA6agR5DQBk40QjslwD2wxZPWGbA0+/j+Ff0yCGwHRUet2Ule4KONtEYdIVUSjzBG3bIyDFKCHTuSCWvhRCv+pvOauo=
X-Received: by 2002:a5d:6d0b:0:b0:222:955a:8774 with SMTP id
 e11-20020a5d6d0b000000b00222955a8774mr2312684wrq.129.1660851953362; Thu, 18
 Aug 2022 12:45:53 -0700 (PDT)
MIME-Version: 1.0
References: <20220817190124.2126652-1-jstephan@baylibre.com>
 <CANNYZj_VxXe6aZKXstZVNov9aeQJ-2beBY1=WojSPA-gvXQqvg@mail.gmail.com>
 <CAEHHSvavULJhb-W6MJ+2GSouf8sBk_xFHXeHdQCO_VF_zsqn5g@mail.gmail.com>
 <170C3947C33061FA.1805@lists.openembedded.org>
 <CANNYZj-ZOPgM_iLFw6uQWF+St_GWNNOfdWB0zUw_yZQfWjQuig@mail.gmail.com>
 <CAEHHSvZaksW7-4Q0bVOd8hdw6KFc7dCdCQ+eUsGd155dGhvoFw@mail.gmail.com>
In-Reply-To: 
 <CAEHHSvZaksW7-4Q0bVOd8hdw6KFc7dCdCQ+eUsGd155dGhvoFw@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 18 Aug 2022 21:45:04 +0200
Message-ID: 
 <CA+chaQdFkumtCNg7AqtwdorpBTvS6MyxO_-vptBysKN9ftoihw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] vulkan-samples: enable network during do_unpack
To: Julien STEPHAN <jstephan@baylibre.com>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000b46bed05e6893af9"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Aug 2022 19:46:03 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169538

--000000000000b46bed05e6893af9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

There is ticket about this already, see
https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D14283

On Thu, Aug 18, 2022 at 9:02 AM Julien STEPHAN <jstephan@baylibre.com>
wrote:

>
>
> Le mer. 17 ao=C3=BBt 2022 =C3=A0 22:33, Alexander Kanavin <alex.kanavin@g=
mail.com>
> a =C3=A9crit :
>
>> I reproduced. This happens if all three are true:
>> - recipe is using gitsm://
>> - one of the submodules contains lfs objects
>> - git-lfs is installed on the host (that's why it's not seen on the AB)
>>
>> Nice! I figured out the first two points, but not the last one.
>
>
>> There's logic in plain git:// fetcher to deal with lfs, but not in
>> gitsm://. So that logic needs to be added there as well. A workaround
>> like you suggested is not the right fix.
>>
>> Can you look into it please? Or at least a ticket would be good to have.
>>
>> Sure, I will try to look at it
> Julien
>
>> Alex
>>
>> On Wed, 17 Aug 2022 at 21:42, Alexander Kanavin via
>> lists.openembedded.org <alex.kanavin=3Dgmail.com@lists.openembedded.org>
>> wrote:
>> >
>> > Just to be sure, can you repeat this on a pristine poky master
>> > checkout with no cache and no downloads? 'bitbake -c unpack
>> > vulkan-samples' should do.
>> >
>> > Also what does git --version say? I wonder if there's something in too
>> > old or too new versions of it.
>> >
>> > Alex
>> >
>> > On Wed, 17 Aug 2022 at 21:22, Julien Stephan <jstephan@baylibre.com>
>> wrote:
>> > >
>> > > Hi Alexander,
>> > >
>> > > I observe this by just trying to build the vulkan-samples recipe:
>> DISTRO=3Dpoky bitbake vulkan-samples.
>> > >
>> > > Here is the log output (sorry it is a bit verbose):
>> > > ERROR: vulkan-samples-git-r0 do_unpack: Bitbake Fetcher Error:
>> FetchError('Fetch command export PSEUDO_DISABLED=3D1; export
>> SSH_AUTH_SOCK=3D"/home/jstephan/.ssh/ssh_auth_sock"; export
>> PATH=3D"/home/jstephan/kirkstone/build/tmp/sysroots-uninative/x86_64-lin=
ux/usr/bin:/home/jstephan/kirkstone/src/poky/scripts:/home/jstephan/kirksto=
ne/build/tmp/work/cortexa53-poky-linux/vulkan-samples/git-r0/recipe-sysroot=
-native/usr/bin/aarch64-poky-linux:/home/jstephan/kirkstone/build/tmp/work/=
cortexa53-poky-linux/vulkan-samples/git-r0/recipe-sysroot/usr/bin/crossscri=
pts:/home/jstephan/kirkstone/build/tmp/work/cortexa53-poky-linux/vulkan-sam=
ples/git-r0/recipe-sysroot-native/usr/sbin:/home/jstephan/kirkstone/build/t=
mp/work/cortexa53-poky-linux/vulkan-samples/git-r0/recipe-sysroot-native/us=
r/bin:/home/jstephan/kirkstone/build/tmp/work/cortexa53-poky-linux/vulkan-s=
amples/git-r0/recipe-sysroot-native/sbin:/home/jstephan/kirkstone/build/tmp=
/work/cortexa53-poky-linux/vulkan-samples/git-r0/recipe-sysroot-native/bin:=
/home/jstephan/kirkstone/src/poky/bitbake/bin:/home/jstephan/kirkstone/buil=
d/tmp/hosttools";
>> export HOME=3D"/home/jstephan"; git -c core.fsyncobjectfiles=3D0 -c
>> gc.autoDetach=3Dfalse -c core.pager=3Dcat submodule update --recursive
>> --no-fetch failed with exit code 1, output:\nSubmodule path \'assets\':
>> checked out \'8a6b7f952d7786a305f89d375a55598e995ee972\'\nSubmodule path
>> \'third_party/CTPL\': checked out
>> \'437e135dbd94eb65b45533d9ce8ee28b5bd37b6d\'\nSubmodule path
>> \'third_party/astc\': checked out
>> \'4861c3db1ca50eb5f5767d95d1cd1bacb98ac8a5\'\nSubmodule path
>> \'third_party/cli11\': checked out
>> \'4af78beef777e313814b4daff70e2da9171a385a\'\nSubmodule path
>> \'third_party/glfw\': checked out
>> \'6876cf8d7e0e70dc3e4d7b0224d08312c9f78099\'\nSubmodule path
>> \'third_party/glm\': checked out
>> \'fce2abd01ce21063bd25ba67c9318be83bf48813\'\nSubmodule path
>> \'third_party/glslang\': checked out
>> \'6baa85f6ceec5fddd2e13b43dd1edc944dd930af\'\nSubmodule path
>> \'third_party/hwcpipe\': checked out
>> \'5a0c3d0b527bea96154998f29177f3b449cebd3a\'\nSubmodule path
>> \'third_party/imgui\': checked out
>> \'c23a19c26fa9cc778f755e76799f0cafdcb5a13b\'\nSubmodule path
>> \'third_party/opencl\': checked out
>> \'1aa1139b58a515877a923cce6b254e09d1b2fb2c\'\nSubmodule path
>> \'third_party/spdlog\': checked out
>> \'7bf8f148795d2571b4ae4aa9c6d2a8111fbb7077\'\nSubmodule path
>> \'third_party/spirv-cross\': checked out
>> \'84f56d0b43e5a6874de45e11be2bff9dc336fd7e\'\nSubmodule path
>> \'third_party/stb\': checked out
>> \'2c2908f50515dcd939f24be261c3ccbcd277bb49\'\nSubmodule path
>> \'third_party/tinygltf\': checked out
>> \'c0d0251e2c7f2273a894aa1b125af9313a88eae4\'\nSubmodule path
>> \'third_party/vma\': checked out
>> \'f9921aefddee2437cc2e3303d3175bd8ef23e22c\'\nSubmodule path
>> \'third_party/volk\': checked out
>> \'b18f3192886981f28d17f8f41c26c5a53ac3b977\'\nSubmodule path
>> \'third_party/vulkan\': checked out
>> \'76f00ef6cbb1886eb1162d1fa39bee8b51e22ee8\'\n\nDownloading
>> other_lib/ios/Debug-iphoneos/libSDL2.a (8.2 MB)\nError downloading objec=
t:
>> other_lib/ios/Debug-iphoneos/libSDL2.a (5045776): Smudge error: Error
>> downloading other_lib/ios/Debug-iphoneos/libSDL2.a
>> (5045776556ca57f2f7125d89c37a8b94f79cdebdc040d420513f0491787c4ea7): batc=
h
>> response: Post
>> https://github.com/KhronosGroup/KTX-Software.git/info/lfs/objects/batch:
>> dial tcp: lookup github.com: Temporary failure in name
>> resolution\n\nErrors logged to
>> /home/jstephan/kirkstone/build/tmp/work/cortexa53-poky-linux/vulkan-samp=
les/git-r0/git/.git/modules/third_party/ktx/lfs/logs/20220817T152514.337649=
981.log\nUse
>> `git lfs logs last` to view the log.\nerror: external filter \'git-lfs
>> filter-process\' failed\nfatal: other_lib/ios/Debug-iphoneos/libSDL2.a:
>> smudge filter lfs failed\nUnable to checkout
>> \'6a38a0694b4d73d22c5d1e22f865d03545e808ea\' in submodule path
>> \'third_party/ktx\'\n', None)
>> > > ERROR: Logfile of failure stored in:
>> /home/jstephan/kirkstone/build/tmp/work/cortexa53-poky-linux/vulkan-samp=
les/git-r0/temp/log.do_unpack.1796011
>> > > ERROR: Task
>> (/home/jstephan/kirkstone/src/poky/meta/recipes-graphics/vulkan/vulkan-s=
amples_git.bb:do_unpack)
>> failed with exit code '1'
>> > >
>> > > Julien
>> > >
>> > > Le mer. 17 ao=C3=BBt 2022 =C3=A0 21:09, Alexander Kanavin <
>> alex.kanavin@gmail.com> a =C3=A9crit :
>> > >>
>> > >> This has not been observed on the autobuilder or independently
>> > >> reported, can you show how to reproduce or the failure log?
>> > >>
>> > >> Alex
>> > >>
>> > >> On Wed, 17 Aug 2022 at 21:01, Julien STEPHAN <jstephan@baylibre.com=
>
>> wrote:
>> > >> >
>> > >> > vulkan-samples uses git submodules and one of the submodules uses
>> lfs
>> > >> > objects. During the unpack step, the lfs objects are retrieved
>> leading to
>> > >> > a network failure.
>> > >> >
>> > >> > The correct fix is to fetch lfs objects during the fetch step, bu=
t
>> let's
>> > >> > workaround this issue for now
>> > >> >
>> > >> > Signed-off-by: Julien STEPHAN <jstephan@baylibre.com>
>> > >> > ---
>> > >> >  meta/recipes-graphics/vulkan/vulkan-samples_git.bb | 5 +++++
>> > >> >  1 file changed, 5 insertions(+)
>> > >> >
>> > >> > diff --git a/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
>> b/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
>> > >> > index 41cb4a437d..b45ee22a69 100644
>> > >> > --- a/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
>> > >> > +++ b/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
>> > >> > @@ -11,6 +11,11 @@ SRC_URI =3D "gitsm://
>> github.com/KhronosGroup/Vulkan-Samples.git;branch=3Dmaster;prot
>> > >> >
>>  file://0001-framework-core-hpp_vulkan_resource.h-add-header-incl.patch =
\
>> > >> >             "
>> > >> >
>> > >> > +# Workaround for network access issue during the do_unpack step
>> > >> > +# this needs to be fixed in the recipes buildsystem to move
>> > >> > +# this such that it can be accomplished during do_fetch task
>> > >> > +do_unpack[network] =3D "1"
>> > >> > +
>> > >> >  UPSTREAM_CHECK_COMMITS =3D "1"
>> > >> >  SRCREV =3D "ee6c1522af8ba9b56f8416c2eedafb440f681085"
>> > >> >
>> > >> > --
>> > >> > 2.37.1
>> > >> >
>> > >> >
>> > >> >
>> > >> >
>> >
>> >
>> >
>>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#169514):
> https://lists.openembedded.org/g/openembedded-core/message/169514
> Mute This Topic: https://lists.openembedded.org/mt/93089137/3617156
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> Martin.Jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000b46bed05e6893af9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">There is ticket about this already, see<div><a href=3D"htt=
ps://bugzilla.yoctoproject.org/show_bug.cgi?id=3D14283">https://bugzilla.yo=
ctoproject.org/show_bug.cgi?id=3D14283</a><br></div></div><br><div class=3D=
"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Aug 18, 2022 at=
 9:02 AM Julien STEPHAN &lt;<a href=3D"mailto:jstephan@baylibre.com">jsteph=
an@baylibre.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0mer. 17 ao=
=C3=BBt 2022 =C3=A0=C2=A022:33, Alexander Kanavin &lt;<a href=3D"mailto:ale=
x.kanavin@gmail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt; a =C3=
=A9crit=C2=A0:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">I=
 reproduced. This happens if all three are true:<br>
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
&gt; <br>
&gt;<br>
</blockquote></div></div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#169514): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/169514" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/169514</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/93089137/3617=
156" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/93089137/3617156</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:Martin.Jansa@gmail.com" ta=
rget=3D"_blank">Martin.Jansa@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--000000000000b46bed05e6893af9--

