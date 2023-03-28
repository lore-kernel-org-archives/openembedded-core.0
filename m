Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0718DC76196
	for <webhook@archiver.kernel.org>; Tue, 28 Mar 2023 20:04:11 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
 by mx.groups.io with SMTP id smtpd.web11.7113.1680033846238883016
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Mar 2023 13:04:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=O9GY+qJB;
 spf=pass (domain: gmail.com, ip: 209.85.167.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f54.google.com with SMTP id j11so17299730lfg.13
        for <openembedded-core@lists.openembedded.org>; Tue, 28 Mar 2023 13:04:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680033844;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ha2r6qQoTjSoWEQB7JAkDeRyQo3mhwdC8Bz97G+rzg4=;
        b=O9GY+qJB6zVF+dEqy4uKsms/EeTobnjmqe1+yOyK539u4+L3AV4+/KuU5ZZZhDi3/d
         SIc7Z2pT12PBeCY+q0YMSgT9K0hTeozY2JblHIaAdbAjWcg6OVCYjWJFjAlmnkqEQrcR
         Zysz7nItUK/wsCPV/I+tBW4HBxAVl8Fk0/cR4Rkyr3jkXch6+GbH2h6MJtK7UT+h6lk9
         bUgQrmtkgBnGlMi37pNy6dII77c+mq+Wul7FAhU2eqb8MymFzWalaU0sjIJGas8Y6/CV
         bNWl8liBLefeURzpCnJ832wHqH2aZwwgy0pXAtHJIaizEogBGgDIpx96fOVbDdAL2VJh
         ezjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680033844;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ha2r6qQoTjSoWEQB7JAkDeRyQo3mhwdC8Bz97G+rzg4=;
        b=OMmwHZ/bRStWHQFS/Pi5Q+H0XTkUV8XnTVbQxsgsq4/WeFBGHYPGs9jUeG0i8e057z
         6f8jPlhEcU5guoiOFT9b0cPl2n4DO2WhGSbDGXX27H9/dhig2XStuZqGsB/Xutc7GZjG
         a+9fwkE+2v0chfO8bjNWYZxpCpDxvwEwBWkv+7cEkuWeNpYdFWUwF1VCzZMhAjGEjIf2
         dFN/3cJxCLtZkAIE5kQtprANdu0kT5Q8vnE3hSVmuVvbCwq3a9j34uAQWxyn4JkFRaCx
         k2Jn7DPb7P3j9cBpKHJkoBTGShA9nHxWON2NLODovOO+2yoixd6TKO6qYR50ZxytXg1R
         yqVA==
X-Gm-Message-State: AAQBX9e+xWOBNt9ROxA87rA1BifWI5uTUPkrREFhHU0gYKW1IL/zmHs5
	5cPC2Yx2Jas359HNdRUiFbkCXaxG8XZpB1jhJKc=
X-Google-Smtp-Source: AKy350YZ5vKsrM84s20lhNVXqlpxWCm2y0p6gmgIoRBf01MnxS54GhXNADpjWler260pHBda0SFTEhlgjvdgVGoLEAk=
X-Received: by 2002:ac2:4a9d:0:b0:4e8:9988:f8ab with SMTP id
 l29-20020ac24a9d000000b004e89988f8abmr4941627lfp.11.1680033844108; Tue, 28
 Mar 2023 13:04:04 -0700 (PDT)
MIME-Version: 1.0
References: <CA+cAkeqygZo7JXaaatanuNUaq2tpP7jfa8ZgFZ3pj7WgCuN_=w@mail.gmail.com>
 <CANNYZj_gMBkeMPO=zG+OFx84kJj=+DFqQUdULOQ_jR5wGApfjQ@mail.gmail.com>
 <53196741237572435b0a5965aa77a72b021d6fed.camel@linuxfoundation.org>
 <CA+cAkeo_CnnQDLrrmcDE1PP_65qoxkAXU20Ho8r_N-BwqqbObw@mail.gmail.com>
 <72921856ae24cb434edf3698ea51614d7a73a4fb.camel@linuxfoundation.org>
 <CA+cAkerVECW3BPi8nE4SspKVd1BV9ro0j5d3fHT86CAYGahUwQ@mail.gmail.com>
 <CA+cAkep8OAdKUg_nPrGbokXnbF_FshQXeCwGq2ZX-YTJ=wEU7g@mail.gmail.com>
 <1750A7E6D1A5F095.29160@lists.openembedded.org> <CANNYZj_QPcJZmC3HL3AO3mFoY=DN7L0cKwtpOCB2uR55Y+ghEQ@mail.gmail.com>
 <CA+cAkepFoghCFOKQxdwd7Nop1Xq=Vqzg3sdqH=yT7gQh2p2ESg@mail.gmail.com>
In-Reply-To: <CA+cAkepFoghCFOKQxdwd7Nop1Xq=Vqzg3sdqH=yT7gQh2p2ESg@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 28 Mar 2023 22:03:52 +0200
Message-ID: <CANNYZj_G7MtSViD6S+SpWf1wVo_NTQw7Q3mwSEQ5FFWN5foGug@mail.gmail.com>
Subject: Re: [OE-core] oe-selftest for devtool failed
To: =?UTF-8?B?RnLDqWTDqXJpYyBNYXJ0aW5zb25z?= <frederic.martinsons@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Mar 2023 20:04:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179246

Not devtool's fault. The selftest is written so that devtool is
instructed to use /tmp/... to extract sources, and not a workspace in
a build: 'devtool modify -x /tmp/...'.

Having /tmp with noexec is not common, that's why it isn't mentioned.
If the admin is not cooperative, you can hack the selftest definition
to use some other place.

Alex

On Tue, 28 Mar 2023 at 21:02, Fr=C3=A9d=C3=A9ric Martinsons
<frederic.martinsons@gmail.com> wrote:
>
> Oh my, your assumption is surely correct, my build host /tmp is mounted w=
ith noexec so no chance to execute
> anything there:
>
> [ (8) ] jenkins@cibuilder2:~$ mount | grep "/tmp"
> tmpfs on /tmp type tmpfs (rw,nosuid,nodev,noexec,noatime,inode64)
>
> Tomorrow, I'll try with another machine (or talk to the admin of the buil=
d hosts) with a /tmp capable of executing things.
>
> But the requirement to have /tmp directory capable of executing scripts w=
as not mentioned in the oe-selftest
> page (https://wiki.yoctoproject.org/wiki/Oe-selftest) or the quick start =
one (https://docs.yoctoproject.org/brief-yoctoprojectqs/index.html)
>
> I would have thought that devtool, if it needs to execute some scripts, w=
ill execute them in its working directory and not
> in /tmp of build hosts.... Is this something really expected ?
>
>
> On Tue, 28 Mar 2023 at 20:28, Alexander Kanavin <alex.kanavin@gmail.com> =
wrote:
>>
>> Btw, I'm beginning to suspect something isn't right about /tmp on your
>> build host. The test requires being able to write executable scripts
>> into that, and then run them. I just ran the
>> devtool.DevtoolModifyTests.test_devtool_modify_git here, and it
>> succeeded.
>>
>> Alex
>>
>> On Tue, 28 Mar 2023 at 20:14, Alexander Kanavin via
>> lists.openembedded.org <alex.kanavin=3Dgmail.com@lists.openembedded.org>
>> wrote:
>> >
>> > Would you be able to read the failing test, and replicate the steps it
>> > does by hand? If we can narrow down the precise point where it fails,
>> > that would already help.
>> >
>> > Alex
>> >
>> > On Tue, 28 Mar 2023 at 20:01, Fr=C3=A9d=C3=A9ric Martinsons
>> > <frederic.martinsons@gmail.com> wrote:
>> > >
>> > > I rebuilt a poky master from scratch on another machine (Ubuntu 22.0=
4 , 16 Xeon, 124 Gb RAM), it took
>> > >  2h30mn to finish (note that rust-llvm-native and llvm-native both t=
ook around 1h each to be built).
>> > >
>> > > I have two questions for my curiosity:
>> > >    - why rust things (cargo-native, librsvg)  are the last artifacts=
 built on core-image-sato ? it seems strange at first look
>> > > (but may be explained by packages embedded by this image, I didn't l=
ook on what are the dependencies of this image)
>> > >    - my pristine BDIR took around 90 GB , maybe the page https://doc=
s.yoctoproject.org/dev/brief-yoctoprojectqs/index.html stating
>> > > that we need 50 GB of free space needs to be reviewed (unless it was=
 written with another image than core-image-sato in mind) ?
>> > >
>> > > Apart from that,  I have the exact same error on test_devtool_modify=
_git that I had on the other machine under /var build dir:
>> > >
>> > > NOTE: Running setscene task 210 of 213 (virtual:native:/tmp/devtoolq=
acvbsfqx2/core-copy/meta/recipes-devtools/gnu-config/gnu-config_git.bb:do_p=
opulate_sysroot_setscene)
>> > > NOTE: recipe gnu-config-native-20230216+gitAUTOINC+63acb96f92-r0: ta=
sk do_populate_sysroot_setscene: Started
>> > > NOTE: recipe gnu-config-native-20230216+gitAUTOINC+63acb96f92-r0: ta=
sk do_populate_sysroot_setscene: Succeeded
>> > > NOTE: Running task 896 of 918 (/tmp/devtoolqacvbsfqx2/core-copy/meta=
/recipes-core/psplash/psplash_git.bb:do_prepare_recipe_sysroot)
>> > > NOTE: recipe psplash-0.1+git999-r0: task do_prepare_recipe_sysroot: =
Started
>> > > NOTE: recipe psplash-0.1+git999-r0: task do_prepare_recipe_sysroot: =
Succeeded
>> > > NOTE: Running task 910 of 918 (/tmp/devtoolqacvbsfqx2/core-copy/meta=
/recipes-core/psplash/psplash_git.bb:do_configure)
>> > > NOTE: recipe psplash-0.1+git999-r0: task do_configure: Started
>> > > ERROR: psplash-0.1+git999-r0 do_configure: no configure script found=
 at ../../../../../../../../../../../tmp/devtoolqamf2smwsy/configure
>> > > ERROR: psplash-0.1+git999-r0 do_configure: ExecutionError('/home/jen=
kins/yocto-poky-master/poky/build-st/tmp/work/core2-64-poky-linux/psplash/0=
.1+git999-r0/temp/run.do_configure.1967375', 1, None, None)
>> > > ERROR: Logfile of failure stored in: /home/jenkins/yocto-poky-master=
/poky/build-st/tmp/work/core2-64-poky-linux/psplash/0.1+git999-r0/temp/log.=
do_configure.1967375
>> > > NOTE: recipe psplash-0.1+git999-r0: task do_configure: Failed
>> > > ERROR: Task (/tmp/devtoolqacvbsfqx2/core-copy/meta/recipes-core/pspl=
ash/psplash_git.bb:do_configure) failed with exit code '1'
>> > > NOTE: Tasks Summary: Attempted 910 tasks of which 904 didn't need to=
 be rerun and 1 failed.
>> > >
>> > > Full test log joined (I would like to join also the log of do_config=
ure step but it seems that the test do a cleanall of the recipe during its =
tear down method)
>> > >
>> > > I'm kind of stuck here since I cannot develop more oe-selftest tests=
 if I didn't even manage to make the existing ones succeed.
>> > > Can someone give me the setup of this autobuilder where Alexander ta=
lked about ?
>> > >
>> > > I could try to get as close as possible to the autobuilder setup if =
the oe-selftest is ok there.
>> > >
>> > > On Tue, 28 Mar 2023 at 17:36, Fr=C3=A9d=C3=A9ric Martinsons <frederi=
c.martinsons@gmail.com> wrote:
>> > >>
>> > >> Note that I managed to build libtirpc-native and shadow-native with=
 bitbake (and the same setup).
>> > >>
>> > >> I currently try the build on another machine and under /home.
>> > >>
>> > >> I'll tell you the results soon
>> > >>
>> > >> Le mar. 28 mars 2023, 15:13, Richard Purdie <richard.purdie@linuxfo=
undation.org> a =C3=A9crit :
>> > >>>
>> > >>> On Tue, 2023-03-28 at 14:40 +0200, Fr=C3=A9d=C3=A9ric Martinsons w=
rote:
>> > >>> > I just finished a pristine build of core-image-sato on poky mast=
er,
>> > >>> > and set up SSTATE_DIR in my local.conf.
>> > >>> > Tests are now ok, I can start to write some now.
>> > >>> >
>> > >>> > If anyone is interested , please find attached the full log of t=
he
>> > >>> > two first failures.
>> > >>>
>> > >>> Having the errors helps, thanks.
>> > >>>
>> > >>> The short summary is these two lines:
>> > >>>
>> > >>> libtirpc-native
>> > >>> | chown: changing ownership of '/var/lib/jenkins/YOCTO_POKY_MASTER=
_TEST/poky/build-st/tmp/work/x86_64-linux/libtirpc-native/1.3.3-r0/image/va=
r/lib/jenkins/YOCTO_POKY_MASTER_TEST/poky/build-st/tmp/work/x86_64-linux/li=
btirpc-native/1.3.3-r0/recipe-sysroot-native/etc/netconfig': Invalid argume=
nt
>> > >>>
>> > >>> shadow-native
>> > >>> | chown: changing ownership of '/var/lib/jenkins/YOCTO_POKY_MASTER=
_TEST/poky/build-st/tmp/work/x86_64-linux/shadow-native/4.13-r0/image/var/l=
ib/jenkins/YOCTO_POKY_MASTER_TEST/poky/build-st/tmp/work/x86_64-linux/shado=
w-native/4.13-r0/recipe-sysroot-native/var/spool/mail': Invalid argument
>> > >>>
>> > >>>
>> > >>> I'm wondering if the fact the build is under /var might be trigger=
ing
>> > >>> something somehow...
>> > >>>
>> > >>> Cheers,
>> > >>>
>> > >>> Richard
>> >
>> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> > Links: You receive all messages sent to this group.
>> > View/Reply Online (#179243): https://lists.openembedded.org/g/openembe=
dded-core/message/179243
>> > Mute This Topic: https://lists.openembedded.org/mt/97900549/1686489
>> > Group Owner: openembedded-core+owner@lists.openembedded.org
>> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub =
[alex.kanavin@gmail.com]
>> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> >

