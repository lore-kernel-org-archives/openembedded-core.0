Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DD82C4332F
	for <webhook@archiver.kernel.org>; Mon, 17 Oct 2022 12:25:43 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web12.40200.1666009535219114949
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Oct 2022 05:25:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=fA0Pfrxf;
 spf=pass (domain: gmail.com, ip: 209.85.221.41, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f41.google.com with SMTP id bu30so18187445wrb.8
        for <openembedded-core@lists.openembedded.org>; Mon, 17 Oct 2022 05:25:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=I7MrEyunIAMFnfnPJW1f9M/I6Y3hR2mZr10LYnY2nCk=;
        b=fA0Pfrxfza85lPqHlyDEFs77JXVzd+g9pnxoC7P8gPrLBmZIgZ9GqYIBzk9/7btVGa
         8q4upS5pWqT95v0U3xyVJFkPoBs0U5mTaNpwCYoygvTaomB7CDf5oD2J5WXRoIGe6rbE
         ez+4jNbASe9VWiBOdykCHyb4EeS9gbsjGlIPaTzc4QaaL/oXVSRM3ITc5unvpos2AmE1
         AaxAgsXA4KycS1tf26LlSab96exg+TakIpoluMhAcMe1FkUBL+qm1t96aILqTJK7bS7z
         nAM8srd4Q/pLQfhEsQbvkgCgBZJ9ADc7Slg03U555bcTwvmUoO1+PFt8fQxvNTWfdqOx
         MlIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I7MrEyunIAMFnfnPJW1f9M/I6Y3hR2mZr10LYnY2nCk=;
        b=YkLHlx7tUrfqSqvemz96XxFottXlYXrb1mmzSfmi3W/IvGD0KX+NvZIi0JZgOM3iK5
         HFr8S8pJCfefVApZA4yb3IqZx0aUhy8w1pJ1GRSKQh/0eujtQvqYlSB9eOBXTFjGgOlJ
         V4l1ozX0HeqEDvSfbddNfueEr1AmvNXH/dl9xEmvddEy+hBxGrES8yXg+ehl+Hzbf08L
         HyFfwmv5FhouUlZrma29c4hVb7yWHo002ThZcvP+2QsDAcF1Xc/3FJwJOU0zWGCUJnlJ
         4542amQ+e7B11Ss/jo0qMc3WqNmf7eseOh6oLFYCENmF7bpbQdV6k5aiGVfTMebba/iA
         eW0w==
X-Gm-Message-State: ACrzQf0hi4h/P4r33emdAExRwUiv0NPJmb3O0gPoTmWhqfEigjV8wLcw
	GYFPMTjoyCl3gXEG0n7WCfqE6OOUbTTm+ei9JbI=
X-Google-Smtp-Source: AMsMyM5X2jt5qOV+txCU56l5Lwm5PoEQn0YV0nsl92/hQFtnn0omOPnD4seaQwvu3B74T9gFj8Bweu+i3t4EhH/iVqQ=
X-Received: by 2002:a5d:500a:0:b0:22e:34bd:c907 with SMTP id
 e10-20020a5d500a000000b0022e34bdc907mr5836016wrt.548.1666009533486; Mon, 17
 Oct 2022 05:25:33 -0700 (PDT)
MIME-Version: 1.0
References: <20220817190124.2126652-1-jstephan@baylibre.com>
 <CANNYZj_VxXe6aZKXstZVNov9aeQJ-2beBY1=WojSPA-gvXQqvg@mail.gmail.com>
 <CAEHHSvavULJhb-W6MJ+2GSouf8sBk_xFHXeHdQCO_VF_zsqn5g@mail.gmail.com>
 <170C3947C33061FA.1805@lists.openembedded.org> <CANNYZj-ZOPgM_iLFw6uQWF+St_GWNNOfdWB0zUw_yZQfWjQuig@mail.gmail.com>
 <CAEHHSvZaksW7-4Q0bVOd8hdw6KFc7dCdCQ+eUsGd155dGhvoFw@mail.gmail.com>
 <CA+chaQdFkumtCNg7AqtwdorpBTvS6MyxO_-vptBysKN9ftoihw@mail.gmail.com> <CANNYZj-4-cieSDbj48siDwZrTZHA64s=x=GAhYu4ohOF0XzP_A@mail.gmail.com>
In-Reply-To: <CANNYZj-4-cieSDbj48siDwZrTZHA64s=x=GAhYu4ohOF0XzP_A@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 17 Oct 2022 14:25:20 +0200
Message-ID: <CA+chaQc2xgTNgYZ3BFAQaAsrbKQ_CMaaXvO4LwZVMHOL+1XYWg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] vulkan-samples: enable network during do_unpack
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Julien STEPHAN <jstephan@baylibre.com>, 
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000006f9a8f05eb3a12cc"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Oct 2022 12:25:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/171907

--0000000000006f9a8f05eb3a12cc
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D14938

On Thu, Aug 18, 2022 at 10:00 PM Alexander Kanavin <alex.kanavin@gmail.com>
wrote:

> The ticket is RESOLVED/FIXED, which is surely not the case here?
>
> Alex
>
> On Thu, 18 Aug 2022 at 21:45, Martin Jansa <martin.jansa@gmail.com> wrote=
:
> >
> > There is ticket about this already, see
> > https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D14283
> >
> > On Thu, Aug 18, 2022 at 9:02 AM Julien STEPHAN <jstephan@baylibre.com>
> wrote:
> >>
> >>
> >>
> >> Le mer. 17 ao=C3=BBt 2022 =C3=A0 22:33, Alexander Kanavin <alex.kanavi=
n@gmail.com>
> a =C3=A9crit :
> >>>
> >>> I reproduced. This happens if all three are true:
> >>> - recipe is using gitsm://
> >>> - one of the submodules contains lfs objects
> >>> - git-lfs is installed on the host (that's why it's not seen on the A=
B)
> >>>
> >> Nice! I figured out the first two points, but not the last one.
> >>
> >>>
> >>> There's logic in plain git:// fetcher to deal with lfs, but not in
> >>> gitsm://. So that logic needs to be added there as well. A workaround
> >>> like you suggested is not the right fix.
> >>>
> >>> Can you look into it please? Or at least a ticket would be good to
> have.
> >>>
> >> Sure, I will try to look at it
> >> Julien
> >>>
> >>> Alex
> >>>
> >>> On Wed, 17 Aug 2022 at 21:42, Alexander Kanavin via
> >>> lists.openembedded.org <alex.kanavin=3Dgmail.com@lists.openembedded.o=
rg>
> >>> wrote:
> >>> >
> >>> > Just to be sure, can you repeat this on a pristine poky master
> >>> > checkout with no cache and no downloads? 'bitbake -c unpack
> >>> > vulkan-samples' should do.
> >>> >
> >>> > Also what does git --version say? I wonder if there's something in
> too
> >>> > old or too new versions of it.
> >>> >
> >>> > Alex
> >>> >
> >>> > On Wed, 17 Aug 2022 at 21:22, Julien Stephan <jstephan@baylibre.com=
>
> wrote:
> >>> > >
> >>> > > Hi Alexander,
> >>> > >
> >>> > > I observe this by just trying to build the vulkan-samples recipe:
> DISTRO=3Dpoky bitbake vulkan-samples.
> >>> > >
> >>> > > Here is the log output (sorry it is a bit verbose):
> >>> > > ERROR: vulkan-samples-git-r0 do_unpack: Bitbake Fetcher Error:
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
> >>> > > ERROR: Logfile of failure stored in:
> /home/jstephan/kirkstone/build/tmp/work/cortexa53-poky-linux/vulkan-sampl=
es/git-r0/temp/log.do_unpack.1796011
> >>> > > ERROR: Task
> (/home/jstephan/kirkstone/src/poky/meta/recipes-graphics/vulkan/vulkan-sa=
mples_git.bb:do_unpack)
> failed with exit code '1'
> >>> > >
> >>> > > Julien
> >>> > >
> >>> > > Le mer. 17 ao=C3=BBt 2022 =C3=A0 21:09, Alexander Kanavin <
> alex.kanavin@gmail.com> a =C3=A9crit :
> >>> > >>
> >>> > >> This has not been observed on the autobuilder or independently
> >>> > >> reported, can you show how to reproduce or the failure log?
> >>> > >>
> >>> > >> Alex
> >>> > >>
> >>> > >> On Wed, 17 Aug 2022 at 21:01, Julien STEPHAN <
> jstephan@baylibre.com> wrote:
> >>> > >> >
> >>> > >> > vulkan-samples uses git submodules and one of the submodules
> uses lfs
> >>> > >> > objects. During the unpack step, the lfs objects are retrieved
> leading to
> >>> > >> > a network failure.
> >>> > >> >
> >>> > >> > The correct fix is to fetch lfs objects during the fetch step,
> but let's
> >>> > >> > workaround this issue for now
> >>> > >> >
> >>> > >> > Signed-off-by: Julien STEPHAN <jstephan@baylibre.com>
> >>> > >> > ---
> >>> > >> >  meta/recipes-graphics/vulkan/vulkan-samples_git.bb | 5 +++++
> >>> > >> >  1 file changed, 5 insertions(+)
> >>> > >> >
> >>> > >> > diff --git a/meta/recipes-graphics/vulkan/vulkan-samples_git.b=
b
> b/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
> >>> > >> > index 41cb4a437d..b45ee22a69 100644
> >>> > >> > --- a/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
> >>> > >> > +++ b/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
> >>> > >> > @@ -11,6 +11,11 @@ SRC_URI =3D "gitsm://
> github.com/KhronosGroup/Vulkan-Samples.git;branch=3Dmaster;prot
> >>> > >> >
>  file://0001-framework-core-hpp_vulkan_resource.h-add-header-incl.patch \
> >>> > >> >             "
> >>> > >> >
> >>> > >> > +# Workaround for network access issue during the do_unpack st=
ep
> >>> > >> > +# this needs to be fixed in the recipes buildsystem to move
> >>> > >> > +# this such that it can be accomplished during do_fetch task
> >>> > >> > +do_unpack[network] =3D "1"
> >>> > >> > +
> >>> > >> >  UPSTREAM_CHECK_COMMITS =3D "1"
> >>> > >> >  SRCREV =3D "ee6c1522af8ba9b56f8416c2eedafb440f681085"
> >>> > >> >
> >>> > >> > --
> >>> > >> > 2.37.1
> >>> > >> >
> >>> > >> >
> >>> > >> >
> >>> > >> >
> >>> >
> >>> >
> >>> >
> >>
> >>
> >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >> Links: You receive all messages sent to this group.
> >> View/Reply Online (#169514):
> https://lists.openembedded.org/g/openembedded-core/message/169514
> >> Mute This Topic: https://lists.openembedded.org/mt/93089137/3617156
> >> Group Owner: openembedded-core+owner@lists.openembedded.org
> >> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub =
[
> Martin.Jansa@gmail.com]
> >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >>
>

--0000000000006f9a8f05eb3a12cc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><a href=3D"https://bugzilla.yoctoproject.org/show_bug.cgi?=
id=3D14938">https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D14938</a><b=
r></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr=
">On Thu, Aug 18, 2022 at 10:00 PM Alexander Kanavin &lt;<a href=3D"mailto:=
alex.kanavin@gmail.com">alex.kanavin@gmail.com</a>&gt; wrote:<br></div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex">The ticket is RESOLVED/FIXED,=
 which is surely not the case here?<br>
<br>
Alex<br>
<br>
On Thu, 18 Aug 2022 at 21:45, Martin Jansa &lt;<a href=3D"mailto:martin.jan=
sa@gmail.com" target=3D"_blank">martin.jansa@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; There is ticket about this already, see<br>
&gt; <a href=3D"https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D14283" =
rel=3D"noreferrer" target=3D"_blank">https://bugzilla.yoctoproject.org/show=
_bug.cgi?id=3D14283</a><br>
&gt;<br>
&gt; On Thu, Aug 18, 2022 at 9:02 AM Julien STEPHAN &lt;<a href=3D"mailto:j=
stephan@baylibre.com" target=3D"_blank">jstephan@baylibre.com</a>&gt; wrote=
:<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; Le mer. 17 ao=C3=BBt 2022 =C3=A0 22:33, Alexander Kanavin &lt;<a h=
ref=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.kanavin@gmail.=
com</a>&gt; a =C3=A9crit :<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; I reproduced. This happens if all three are true:<br>
&gt;&gt;&gt; - recipe is using gitsm://<br>
&gt;&gt;&gt; - one of the submodules contains lfs objects<br>
&gt;&gt;&gt; - git-lfs is installed on the host (that&#39;s why it&#39;s no=
t seen on the AB)<br>
&gt;&gt;&gt;<br>
&gt;&gt; Nice! I figured out the first two points, but not the last one.<br=
>
&gt;&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; There&#39;s logic in plain git:// fetcher to deal with lfs, bu=
t not in<br>
&gt;&gt;&gt; gitsm://. So that logic needs to be added there as well. A wor=
karound<br>
&gt;&gt;&gt; like you suggested is not the right fix.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Can you look into it please? Or at least a ticket would be goo=
d to have.<br>
&gt;&gt;&gt;<br>
&gt;&gt; Sure, I will try to look at it<br>
&gt;&gt; Julien<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Alex<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; On Wed, 17 Aug 2022 at 21:42, Alexander Kanavin via<br>
&gt;&gt;&gt; <a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" t=
arget=3D"_blank">lists.openembedded.org</a> &lt;alex.kanavin=3D<a href=3D"m=
ailto:gmail.com@lists.openembedded.org" target=3D"_blank">gmail.com@lists.o=
penembedded.org</a>&gt;<br>
&gt;&gt;&gt; wrote:<br>
&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt; Just to be sure, can you repeat this on a pristine poky m=
aster<br>
&gt;&gt;&gt; &gt; checkout with no cache and no downloads? &#39;bitbake -c =
unpack<br>
&gt;&gt;&gt; &gt; vulkan-samples&#39; should do.<br>
&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt; Also what does git --version say? I wonder if there&#39;s=
 something in too<br>
&gt;&gt;&gt; &gt; old or too new versions of it.<br>
&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt; Alex<br>
&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt; On Wed, 17 Aug 2022 at 21:22, Julien Stephan &lt;<a href=
=3D"mailto:jstephan@baylibre.com" target=3D"_blank">jstephan@baylibre.com</=
a>&gt; wrote:<br>
&gt;&gt;&gt; &gt; &gt;<br>
&gt;&gt;&gt; &gt; &gt; Hi Alexander,<br>
&gt;&gt;&gt; &gt; &gt;<br>
&gt;&gt;&gt; &gt; &gt; I observe this by just trying to build the vulkan-sa=
mples recipe: DISTRO=3Dpoky bitbake vulkan-samples.<br>
&gt;&gt;&gt; &gt; &gt;<br>
&gt;&gt;&gt; &gt; &gt; Here is the log output (sorry it is a bit verbose):<=
br>
&gt;&gt;&gt; &gt; &gt; ERROR: vulkan-samples-git-r0 do_unpack: Bitbake Fetc=
her Error: FetchError(&#39;Fetch command export PSEUDO_DISABLED=3D1; export=
 SSH_AUTH_SOCK=3D&quot;/home/jstephan/.ssh/ssh_auth_sock&quot;; export PATH=
=3D&quot;/home/jstephan/kirkstone/build/tmp/sysroots-uninative/x86_64-linux=
/usr/bin:/home/jstephan/kirkstone/src/poky/scripts:/home/jstephan/kirkstone=
/build/tmp/work/cortexa53-poky-linux/vulkan-samples/git-r0/recipe-sysroot-n=
ative/usr/bin/aarch64-poky-linux:/home/jstephan/kirkstone/build/tmp/work/co=
rtexa53-poky-linux/vulkan-samples/git-r0/recipe-sysroot/usr/bin/crossscript=
s:/home/jstephan/kirkstone/build/tmp/work/cortexa53-poky-linux/vulkan-sampl=
es/git-r0/recipe-sysroot-native/usr/sbin:/home/jstephan/kirkstone/build/tmp=
/work/cortexa53-poky-linux/vulkan-samples/git-r0/recipe-sysroot-native/usr/=
bin:/home/jstephan/kirkstone/build/tmp/work/cortexa53-poky-linux/vulkan-sam=
ples/git-r0/recipe-sysroot-native/sbin:/home/jstephan/kirkstone/build/tmp/w=
ork/cortexa53-poky-linux/vulkan-samples/git-r0/recipe-sysroot-native/bin:/h=
ome/jstephan/kirkstone/src/poky/bitbake/bin:/home/jstephan/kirkstone/build/=
tmp/hosttools&quot;; export HOME=3D&quot;/home/jstephan&quot;; git -c core.=
fsyncobjectfiles=3D0 -c gc.autoDetach=3Dfalse -c core.pager=3Dcat submodule=
 update --recursive --no-fetch failed with exit code 1, output:\nSubmodule =
path \&#39;assets\&#39;: checked out \&#39;8a6b7f952d7786a305f89d375a55598e=
995ee972\&#39;\nSubmodule path \&#39;third_party/CTPL\&#39;: checked out \&=
#39;437e135dbd94eb65b45533d9ce8ee28b5bd37b6d\&#39;\nSubmodule path \&#39;th=
ird_party/astc\&#39;: checked out \&#39;4861c3db1ca50eb5f5767d95d1cd1bacb98=
ac8a5\&#39;\nSubmodule path \&#39;third_party/cli11\&#39;: checked out \&#3=
9;4af78beef777e313814b4daff70e2da9171a385a\&#39;\nSubmodule path \&#39;thir=
d_party/glfw\&#39;: checked out \&#39;6876cf8d7e0e70dc3e4d7b0224d08312c9f78=
099\&#39;\nSubmodule path \&#39;third_party/glm\&#39;: checked out \&#39;fc=
e2abd01ce21063bd25ba67c9318be83bf48813\&#39;\nSubmodule path \&#39;third_pa=
rty/glslang\&#39;: checked out \&#39;6baa85f6ceec5fddd2e13b43dd1edc944dd930=
af\&#39;\nSubmodule path \&#39;third_party/hwcpipe\&#39;: checked out \&#39=
;5a0c3d0b527bea96154998f29177f3b449cebd3a\&#39;\nSubmodule path \&#39;third=
_party/imgui\&#39;: checked out \&#39;c23a19c26fa9cc778f755e76799f0cafdcb5a=
13b\&#39;\nSubmodule path \&#39;third_party/opencl\&#39;: checked out \&#39=
;1aa1139b58a515877a923cce6b254e09d1b2fb2c\&#39;\nSubmodule path \&#39;third=
_party/spdlog\&#39;: checked out \&#39;7bf8f148795d2571b4ae4aa9c6d2a8111fbb=
7077\&#39;\nSubmodule path \&#39;third_party/spirv-cross\&#39;: checked out=
 \&#39;84f56d0b43e5a6874de45e11be2bff9dc336fd7e\&#39;\nSubmodule path \&#39=
;third_party/stb\&#39;: checked out \&#39;2c2908f50515dcd939f24be261c3ccbcd=
277bb49\&#39;\nSubmodule path \&#39;third_party/tinygltf\&#39;: checked out=
 \&#39;c0d0251e2c7f2273a894aa1b125af9313a88eae4\&#39;\nSubmodule path \&#39=
;third_party/vma\&#39;: checked out \&#39;f9921aefddee2437cc2e3303d3175bd8e=
f23e22c\&#39;\nSubmodule path \&#39;third_party/volk\&#39;: checked out \&#=
39;b18f3192886981f28d17f8f41c26c5a53ac3b977\&#39;\nSubmodule path \&#39;thi=
rd_party/vulkan\&#39;: checked out \&#39;76f00ef6cbb1886eb1162d1fa39bee8b51=
e22ee8\&#39;\n\nDownloading other_lib/ios/Debug-iphoneos/libSDL2.a (8.2 MB)=
\nError downloading object: other_lib/ios/Debug-iphoneos/libSDL2.a (5045776=
): Smudge error: Error downloading other_lib/ios/Debug-iphoneos/libSDL2.a (=
5045776556ca57f2f7125d89c37a8b94f79cdebdc040d420513f0491787c4ea7): batch re=
sponse: Post <a href=3D"https://github.com/KhronosGroup/KTX-Software.git/in=
fo/lfs/objects/batch" rel=3D"noreferrer" target=3D"_blank">https://github.c=
om/KhronosGroup/KTX-Software.git/info/lfs/objects/batch</a>: dial tcp: look=
up <a href=3D"http://github.com" rel=3D"noreferrer" target=3D"_blank">githu=
b.com</a>: Temporary failure in name resolution\n\nErrors logged to /home/j=
stephan/kirkstone/build/tmp/work/cortexa53-poky-linux/vulkan-samples/git-r0=
/git/.git/modules/third_party/ktx/lfs/logs/20220817T152514.337649981.log\nU=
se `git lfs logs last` to view the log.\nerror: external filter \&#39;git-l=
fs filter-process\&#39; failed\nfatal: other_lib/ios/Debug-iphoneos/libSDL2=
.a: smudge filter lfs failed\nUnable to checkout \&#39;6a38a0694b4d73d22c5d=
1e22f865d03545e808ea\&#39; in submodule path \&#39;third_party/ktx\&#39;\n&=
#39;, None)<br>
&gt;&gt;&gt; &gt; &gt; ERROR: Logfile of failure stored in: /home/jstephan/=
kirkstone/build/tmp/work/cortexa53-poky-linux/vulkan-samples/git-r0/temp/lo=
g.do_unpack.1796011<br>
&gt;&gt;&gt; &gt; &gt; ERROR: Task (/home/jstephan/kirkstone/src/poky/meta/=
recipes-graphics/vulkan/vulkan-samples_git.bb:do_unpack) failed with exit c=
ode &#39;1&#39;<br>
&gt;&gt;&gt; &gt; &gt;<br>
&gt;&gt;&gt; &gt; &gt; Julien<br>
&gt;&gt;&gt; &gt; &gt;<br>
&gt;&gt;&gt; &gt; &gt; Le mer. 17 ao=C3=BBt 2022 =C3=A0 21:09, Alexander Ka=
navin &lt;<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.=
kanavin@gmail.com</a>&gt; a =C3=A9crit :<br>
&gt;&gt;&gt; &gt; &gt;&gt;<br>
&gt;&gt;&gt; &gt; &gt;&gt; This has not been observed on the autobuilder or=
 independently<br>
&gt;&gt;&gt; &gt; &gt;&gt; reported, can you show how to reproduce or the f=
ailure log?<br>
&gt;&gt;&gt; &gt; &gt;&gt;<br>
&gt;&gt;&gt; &gt; &gt;&gt; Alex<br>
&gt;&gt;&gt; &gt; &gt;&gt;<br>
&gt;&gt;&gt; &gt; &gt;&gt; On Wed, 17 Aug 2022 at 21:01, Julien STEPHAN &lt=
;<a href=3D"mailto:jstephan@baylibre.com" target=3D"_blank">jstephan@baylib=
re.com</a>&gt; wrote:<br>
&gt;&gt;&gt; &gt; &gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt; &gt;&gt; &gt; vulkan-samples uses git submodules and one =
of the submodules uses lfs<br>
&gt;&gt;&gt; &gt; &gt;&gt; &gt; objects. During the unpack step, the lfs ob=
jects are retrieved leading to<br>
&gt;&gt;&gt; &gt; &gt;&gt; &gt; a network failure.<br>
&gt;&gt;&gt; &gt; &gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt; &gt;&gt; &gt; The correct fix is to fetch lfs objects dur=
ing the fetch step, but let&#39;s<br>
&gt;&gt;&gt; &gt; &gt;&gt; &gt; workaround this issue for now<br>
&gt;&gt;&gt; &gt; &gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt; &gt;&gt; &gt; Signed-off-by: Julien STEPHAN &lt;<a href=
=3D"mailto:jstephan@baylibre.com" target=3D"_blank">jstephan@baylibre.com</=
a>&gt;<br>
&gt;&gt;&gt; &gt; &gt;&gt; &gt; ---<br>
&gt;&gt;&gt; &gt; &gt;&gt; &gt;=C2=A0 meta/recipes-graphics/vulkan/<a href=
=3D"http://vulkan-samples_git.bb" rel=3D"noreferrer" target=3D"_blank">vulk=
an-samples_git.bb</a> | 5 +++++<br>
&gt;&gt;&gt; &gt; &gt;&gt; &gt;=C2=A0 1 file changed, 5 insertions(+)<br>
&gt;&gt;&gt; &gt; &gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt; &gt;&gt; &gt; diff --git a/meta/recipes-graphics/vulkan/<=
a href=3D"http://vulkan-samples_git.bb" rel=3D"noreferrer" target=3D"_blank=
">vulkan-samples_git.bb</a> b/meta/recipes-graphics/vulkan/<a href=3D"http:=
//vulkan-samples_git.bb" rel=3D"noreferrer" target=3D"_blank">vulkan-sample=
s_git.bb</a><br>
&gt;&gt;&gt; &gt; &gt;&gt; &gt; index 41cb4a437d..b45ee22a69 100644<br>
&gt;&gt;&gt; &gt; &gt;&gt; &gt; --- a/meta/recipes-graphics/vulkan/<a href=
=3D"http://vulkan-samples_git.bb" rel=3D"noreferrer" target=3D"_blank">vulk=
an-samples_git.bb</a><br>
&gt;&gt;&gt; &gt; &gt;&gt; &gt; +++ b/meta/recipes-graphics/vulkan/<a href=
=3D"http://vulkan-samples_git.bb" rel=3D"noreferrer" target=3D"_blank">vulk=
an-samples_git.bb</a><br>
&gt;&gt;&gt; &gt; &gt;&gt; &gt; @@ -11,6 +11,11 @@ SRC_URI =3D &quot;gitsm:=
//<a href=3D"http://github.com/KhronosGroup/Vulkan-Samples.git;branch=3Dmas=
ter;prot" rel=3D"noreferrer" target=3D"_blank">github.com/KhronosGroup/Vulk=
an-Samples.git;branch=3Dmaster;prot</a><br>
&gt;&gt;&gt; &gt; &gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0file://0001-framework-core-hpp_vulkan_resource.h-add-header-incl.patc=
h \<br>
&gt;&gt;&gt; &gt; &gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0&quot;<br>
&gt;&gt;&gt; &gt; &gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt; &gt;&gt; &gt; +# Workaround for network access issue duri=
ng the do_unpack step<br>
&gt;&gt;&gt; &gt; &gt;&gt; &gt; +# this needs to be fixed in the recipes bu=
ildsystem to move<br>
&gt;&gt;&gt; &gt; &gt;&gt; &gt; +# this such that it can be accomplished du=
ring do_fetch task<br>
&gt;&gt;&gt; &gt; &gt;&gt; &gt; +do_unpack[network] =3D &quot;1&quot;<br>
&gt;&gt;&gt; &gt; &gt;&gt; &gt; +<br>
&gt;&gt;&gt; &gt; &gt;&gt; &gt;=C2=A0 UPSTREAM_CHECK_COMMITS =3D &quot;1&qu=
ot;<br>
&gt;&gt;&gt; &gt; &gt;&gt; &gt;=C2=A0 SRCREV =3D &quot;ee6c1522af8ba9b56f84=
16c2eedafb440f681085&quot;<br>
&gt;&gt;&gt; &gt; &gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt; &gt;&gt; &gt; --<br>
&gt;&gt;&gt; &gt; &gt;&gt; &gt; 2.37.1<br>
&gt;&gt;&gt; &gt; &gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt; &gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt; &gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt; &gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;&gt; Links: You receive all messages sent to this group.<br>
&gt;&gt; View/Reply Online (#169514): <a href=3D"https://lists.openembedded=
.org/g/openembedded-core/message/169514" rel=3D"noreferrer" target=3D"_blan=
k">https://lists.openembedded.org/g/openembedded-core/message/169514</a><br=
>
&gt;&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/9308=
9137/3617156" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedd=
ed.org/mt/93089137/3617156</a><br>
&gt;&gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.ope=
nembedded.org" target=3D"_blank">openembedded-core+owner@lists.openembedded=
.org</a><br>
&gt;&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembed=
ded-core/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembe=
dded.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:Martin.Jansa@gmai=
l.com" target=3D"_blank">Martin.Jansa@gmail.com</a>]<br>
&gt;&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;&gt;<br>
</blockquote></div>

--0000000000006f9a8f05eb3a12cc--

