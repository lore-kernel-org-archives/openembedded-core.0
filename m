Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 236C4C32772
	for <webhook@archiver.kernel.org>; Wed, 17 Aug 2022 19:42:27 +0000 (UTC)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com
 [209.85.208.178])
 by mx.groups.io with SMTP id smtpd.web11.33234.1660765342358630585
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Aug 2022 12:42:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=C6g7L9JS;
 spf=pass (domain: gmail.com, ip: 209.85.208.178,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f178.google.com with SMTP id bx38so14489557ljb.10
        for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Aug 2022 12:42:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc;
        bh=D3BFgZV6KlDsE77DriY3YfN9Ieb+OyUiMmxzFK6JLas=;
        b=C6g7L9JSFnGYZsUJcEcu9RezQB0eQN9t6O+41SVdL5+INdJ99xH/P+PJSOl+CIb5cX
         FBT3y7K1UBpIwBO2esYKiPZq/vlnt9MGUsAKXsHd5p9w/mYRj0HZ+v1f3LLr5Yqsx/s6
         teM4bD56OmaqiN2XL5KvLDXil19qUA6VvLVvGvLAKZ00n/kH/cx3vR5aTqDj1hTaVuuS
         GmPHJy3B563oytR0CwHaXVSgNwIwb6/QKZev7AeNUfzvMdluEOeLI+zaqolV/PHYU1bC
         2gdIZoXLutCTMaKaeUwUvjp3DanjIhQZuIIsW8tIr5jyOezfM9I++5rsIo/BEgOfzw0H
         /5eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
        bh=D3BFgZV6KlDsE77DriY3YfN9Ieb+OyUiMmxzFK6JLas=;
        b=T1xm9zkcya1YrYE9ZpSC1ZVDjTjIvcYK3fWQW6iH4tpNPyA3ZbcVun5c8p/i+htPC2
         C2BJgFvn2pKA84RcpBsg0iUHR/Y/BVeS+9NP8oQj8U0ZRixPrcqt7RNhtg5aCJdKXyc4
         REdTgWDuyyqPGLagSh5k8x3UOLS664c9h5v2r6qcUEwxfqPsPh3ODTcn+yuM6+Su1ntX
         Krmh4V7CeOvRp4ADkBpwl6KopGycpNSTGr+NnRmhVu61MVtQ9Z2xMM31JwZmhD3QJFrO
         ad7JdSXQUVRZdAzoEDEmbwMSVovn45Seu8kLiuLQO5owgCaux91DtTkvO4owneNXp1OE
         gdlQ==
X-Gm-Message-State: ACgBeo0Z0aRorRx2EWv1pBZpMy+iI+Juh0wYWrUwtcuhCgLUOT7Gq+5E
	on5C7mE468YNXhQ/4GQpSOixqAA/8qVIjR82xhw=
X-Google-Smtp-Source: 
 AA6agR4lL0ANR57EX8L0Zo18HBTWM2TJQ9gmoe9VoBunAUayXOJXqtABr7tT85FyCm6g2kCOJ8QdZEwvM2ETK23rHTM=
X-Received: by 2002:a2e:7d12:0:b0:261:81ae:f804 with SMTP id
 y18-20020a2e7d12000000b0026181aef804mr5822079ljc.56.1660765340339; Wed, 17
 Aug 2022 12:42:20 -0700 (PDT)
MIME-Version: 1.0
References: <20220817190124.2126652-1-jstephan@baylibre.com>
 <CANNYZj_VxXe6aZKXstZVNov9aeQJ-2beBY1=WojSPA-gvXQqvg@mail.gmail.com>
 <CAEHHSvavULJhb-W6MJ+2GSouf8sBk_xFHXeHdQCO_VF_zsqn5g@mail.gmail.com>
In-Reply-To: 
 <CAEHHSvavULJhb-W6MJ+2GSouf8sBk_xFHXeHdQCO_VF_zsqn5g@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 17 Aug 2022 21:42:08 +0200
Message-ID: 
 <CANNYZj8unR_g7=HOJfYdHftufEopHAqyX56ySW0oQj_gw286tA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] vulkan-samples: enable network during do_unpack
To: Julien Stephan <jstephan@baylibre.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Aug 2022 19:42:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169504

Just to be sure, can you repeat this on a pristine poky master
checkout with no cache and no downloads? 'bitbake -c unpack
vulkan-samples' should do.

Also what does git --version say? I wonder if there's something in too
old or too new versions of it.

Alex

On Wed, 17 Aug 2022 at 21:22, Julien Stephan <jstephan@baylibre.com> wrote:
>
> Hi Alexander,
>
> I observe this by just trying to build the vulkan-samples recipe: DISTRO=
=3Dpoky bitbake vulkan-samples.
>
> Here is the log output (sorry it is a bit verbose):
> ERROR: vulkan-samples-git-r0 do_unpack: Bitbake Fetcher Error: FetchError=
('Fetch command export PSEUDO_DISABLED=3D1; export SSH_AUTH_SOCK=3D"/home/j=
stephan/.ssh/ssh_auth_sock"; export PATH=3D"/home/jstephan/kirkstone/build/=
tmp/sysroots-uninative/x86_64-linux/usr/bin:/home/jstephan/kirkstone/src/po=
ky/scripts:/home/jstephan/kirkstone/build/tmp/work/cortexa53-poky-linux/vul=
kan-samples/git-r0/recipe-sysroot-native/usr/bin/aarch64-poky-linux:/home/j=
stephan/kirkstone/build/tmp/work/cortexa53-poky-linux/vulkan-samples/git-r0=
/recipe-sysroot/usr/bin/crossscripts:/home/jstephan/kirkstone/build/tmp/wor=
k/cortexa53-poky-linux/vulkan-samples/git-r0/recipe-sysroot-native/usr/sbin=
:/home/jstephan/kirkstone/build/tmp/work/cortexa53-poky-linux/vulkan-sample=
s/git-r0/recipe-sysroot-native/usr/bin:/home/jstephan/kirkstone/build/tmp/w=
ork/cortexa53-poky-linux/vulkan-samples/git-r0/recipe-sysroot-native/sbin:/=
home/jstephan/kirkstone/build/tmp/work/cortexa53-poky-linux/vulkan-samples/=
git-r0/recipe-sysroot-native/bin:/home/jstephan/kirkstone/src/poky/bitbake/=
bin:/home/jstephan/kirkstone/build/tmp/hosttools"; export HOME=3D"/home/jst=
ephan"; git -c core.fsyncobjectfiles=3D0 -c gc.autoDetach=3Dfalse -c core.p=
ager=3Dcat submodule update --recursive --no-fetch failed with exit code 1,=
 output:\nSubmodule path \'assets\': checked out \'8a6b7f952d7786a305f89d37=
5a55598e995ee972\'\nSubmodule path \'third_party/CTPL\': checked out \'437e=
135dbd94eb65b45533d9ce8ee28b5bd37b6d\'\nSubmodule path \'third_party/astc\'=
: checked out \'4861c3db1ca50eb5f5767d95d1cd1bacb98ac8a5\'\nSubmodule path =
\'third_party/cli11\': checked out \'4af78beef777e313814b4daff70e2da9171a38=
5a\'\nSubmodule path \'third_party/glfw\': checked out \'6876cf8d7e0e70dc3e=
4d7b0224d08312c9f78099\'\nSubmodule path \'third_party/glm\': checked out \=
'fce2abd01ce21063bd25ba67c9318be83bf48813\'\nSubmodule path \'third_party/g=
lslang\': checked out \'6baa85f6ceec5fddd2e13b43dd1edc944dd930af\'\nSubmodu=
le path \'third_party/hwcpipe\': checked out \'5a0c3d0b527bea96154998f29177=
f3b449cebd3a\'\nSubmodule path \'third_party/imgui\': checked out \'c23a19c=
26fa9cc778f755e76799f0cafdcb5a13b\'\nSubmodule path \'third_party/opencl\':=
 checked out \'1aa1139b58a515877a923cce6b254e09d1b2fb2c\'\nSubmodule path \=
'third_party/spdlog\': checked out \'7bf8f148795d2571b4ae4aa9c6d2a8111fbb70=
77\'\nSubmodule path \'third_party/spirv-cross\': checked out \'84f56d0b43e=
5a6874de45e11be2bff9dc336fd7e\'\nSubmodule path \'third_party/stb\': checke=
d out \'2c2908f50515dcd939f24be261c3ccbcd277bb49\'\nSubmodule path \'third_=
party/tinygltf\': checked out \'c0d0251e2c7f2273a894aa1b125af9313a88eae4\'\=
nSubmodule path \'third_party/vma\': checked out \'f9921aefddee2437cc2e3303=
d3175bd8ef23e22c\'\nSubmodule path \'third_party/volk\': checked out \'b18f=
3192886981f28d17f8f41c26c5a53ac3b977\'\nSubmodule path \'third_party/vulkan=
\': checked out \'76f00ef6cbb1886eb1162d1fa39bee8b51e22ee8\'\n\nDownloading=
 other_lib/ios/Debug-iphoneos/libSDL2.a (8.2 MB)\nError downloading object:=
 other_lib/ios/Debug-iphoneos/libSDL2.a (5045776): Smudge error: Error down=
loading other_lib/ios/Debug-iphoneos/libSDL2.a (5045776556ca57f2f7125d89c37=
a8b94f79cdebdc040d420513f0491787c4ea7): batch response: Post https://github=
.com/KhronosGroup/KTX-Software.git/info/lfs/objects/batch: dial tcp: lookup=
 github.com: Temporary failure in name resolution\n\nErrors logged to /home=
/jstephan/kirkstone/build/tmp/work/cortexa53-poky-linux/vulkan-samples/git-=
r0/git/.git/modules/third_party/ktx/lfs/logs/20220817T152514.337649981.log\=
nUse `git lfs logs last` to view the log.\nerror: external filter \'git-lfs=
 filter-process\' failed\nfatal: other_lib/ios/Debug-iphoneos/libSDL2.a: sm=
udge filter lfs failed\nUnable to checkout \'6a38a0694b4d73d22c5d1e22f865d0=
3545e808ea\' in submodule path \'third_party/ktx\'\n', None)
> ERROR: Logfile of failure stored in: /home/jstephan/kirkstone/build/tmp/w=
ork/cortexa53-poky-linux/vulkan-samples/git-r0/temp/log.do_unpack.1796011
> ERROR: Task (/home/jstephan/kirkstone/src/poky/meta/recipes-graphics/vulk=
an/vulkan-samples_git.bb:do_unpack) failed with exit code '1'
>
> Julien
>
> Le mer. 17 ao=C3=BBt 2022 =C3=A0 21:09, Alexander Kanavin <alex.kanavin@g=
mail.com> a =C3=A9crit :
>>
>> This has not been observed on the autobuilder or independently
>> reported, can you show how to reproduce or the failure log?
>>
>> Alex
>>
>> On Wed, 17 Aug 2022 at 21:01, Julien STEPHAN <jstephan@baylibre.com> wro=
te:
>> >
>> > vulkan-samples uses git submodules and one of the submodules uses lfs
>> > objects. During the unpack step, the lfs objects are retrieved leading=
 to
>> > a network failure.
>> >
>> > The correct fix is to fetch lfs objects during the fetch step, but let=
's
>> > workaround this issue for now
>> >
>> > Signed-off-by: Julien STEPHAN <jstephan@baylibre.com>
>> > ---
>> >  meta/recipes-graphics/vulkan/vulkan-samples_git.bb | 5 +++++
>> >  1 file changed, 5 insertions(+)
>> >
>> > diff --git a/meta/recipes-graphics/vulkan/vulkan-samples_git.bb b/meta=
/recipes-graphics/vulkan/vulkan-samples_git.bb
>> > index 41cb4a437d..b45ee22a69 100644
>> > --- a/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
>> > +++ b/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
>> > @@ -11,6 +11,11 @@ SRC_URI =3D "gitsm://github.com/KhronosGroup/Vulkan=
-Samples.git;branch=3Dmaster;prot
>> >             file://0001-framework-core-hpp_vulkan_resource.h-add-heade=
r-incl.patch \
>> >             "
>> >
>> > +# Workaround for network access issue during the do_unpack step
>> > +# this needs to be fixed in the recipes buildsystem to move
>> > +# this such that it can be accomplished during do_fetch task
>> > +do_unpack[network] =3D "1"
>> > +
>> >  UPSTREAM_CHECK_COMMITS =3D "1"
>> >  SRCREV =3D "ee6c1522af8ba9b56f8416c2eedafb440f681085"
>> >
>> > --
>> > 2.37.1
>> >
>> >
>> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> > Links: You receive all messages sent to this group.
>> > View/Reply Online (#169500): https://lists.openembedded.org/g/openembe=
dded-core/message/169500
>> > Mute This Topic: https://lists.openembedded.org/mt/93089137/1686489
>> > Group Owner: openembedded-core+owner@lists.openembedded.org
>> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub =
[alex.kanavin@gmail.com]
>> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> >

