Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DD40C76196
	for <webhook@archiver.kernel.org>; Tue, 28 Mar 2023 18:28:50 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.web10.4172.1680028127257767006
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Mar 2023 11:28:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=fNvD6x1R;
 spf=pass (domain: gmail.com, ip: 209.85.167.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f53.google.com with SMTP id g17so17026483lfv.4
        for <openembedded-core@lists.openembedded.org>; Tue, 28 Mar 2023 11:28:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680028125;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ME7gmeBA3V1pdyh71HTky3OQzy/4uzN7msTVT/5N9Mo=;
        b=fNvD6x1RFzPTfQaTTNVC7jIPA7UFc8A1tlZcAEbPZHbpmwwwOHe0Xz36axiyeYZzEe
         J0qH3BvR1box1vA5TR0cQo+Rzt+Qt2JA2oZI+sdZ5hxDC7zyy9DJWWDmPJGis2ZOlnap
         TH+YsO+I/oL4S6+kw9KIN34CbWuB7MkT/ms76foy7Hu2QS5KoUxyJVInTtKQJcsuDHUs
         +kEdgjRU7WrNp5uFCLoGDzNfNPT4dU0eRLrqCuZfgbaMiXbn0Q+w+8MRGi9xhdmGVbte
         JD8sTrD2Sw1DgyfpRS745F6DvgvuPxmf6S4gtwTEh/Aqg5mqL7hrLB6zAJnEnOR3V8uJ
         mgHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680028125;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ME7gmeBA3V1pdyh71HTky3OQzy/4uzN7msTVT/5N9Mo=;
        b=OZhdAbvga8BGXXW7W284X+439dxeTfXThoqev7WEyakxsnP5BYDLAXBhYgSZIxCmQA
         YVNiu5H5MTE7iee745QoKMftkBdmXLPwYP8QUNMFYiL2GHk5JKqnRiRHYlQWGpnO5ZMN
         sUuACDSEmvyHKBnSsWDiaM4OGdPbWm/5rjS9NoIbon3aYEy53h3j8/tCHhaRoU4gdsZ1
         4S3Kf7NzAe+VELBMC2UlsZ6c6Cs/MihATYsbvCs8EoNQYuT88+fyZLzEfn0v7Ekr2OX3
         hEfRAQrlqZeA8f3mHGNmTp+j8xdOw6i/6VDYEbmix+oC79x2D3y73A75xohwTc0AVTgR
         4IUw==
X-Gm-Message-State: AAQBX9eMdkaRGD7G1DBj2dB7+aSqS4U4ftKMXbEPI8daC8cUlOOcrqpR
	puEeZ/Zqfl020In2mZoc2QIPIApFto/NWrLnNLk=
X-Google-Smtp-Source: AKy350YXi/1o5ChC7V7j09/n98xil8+GcA8WuBeAfxwcGgXiPcert59G6ePLoInMO74Cf+iiej3X7rsq17mvlNgWvog=
X-Received: by 2002:a19:f602:0:b0:4e1:dbbb:4937 with SMTP id
 x2-20020a19f602000000b004e1dbbb4937mr4959277lfe.11.1680028125221; Tue, 28 Mar
 2023 11:28:45 -0700 (PDT)
MIME-Version: 1.0
References: <CA+cAkeqygZo7JXaaatanuNUaq2tpP7jfa8ZgFZ3pj7WgCuN_=w@mail.gmail.com>
 <CANNYZj_gMBkeMPO=zG+OFx84kJj=+DFqQUdULOQ_jR5wGApfjQ@mail.gmail.com>
 <53196741237572435b0a5965aa77a72b021d6fed.camel@linuxfoundation.org>
 <CA+cAkeo_CnnQDLrrmcDE1PP_65qoxkAXU20Ho8r_N-BwqqbObw@mail.gmail.com>
 <72921856ae24cb434edf3698ea51614d7a73a4fb.camel@linuxfoundation.org>
 <CA+cAkerVECW3BPi8nE4SspKVd1BV9ro0j5d3fHT86CAYGahUwQ@mail.gmail.com>
 <CA+cAkep8OAdKUg_nPrGbokXnbF_FshQXeCwGq2ZX-YTJ=wEU7g@mail.gmail.com> <1750A7E6D1A5F095.29160@lists.openembedded.org>
In-Reply-To: <1750A7E6D1A5F095.29160@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 28 Mar 2023 20:28:33 +0200
Message-ID: <CANNYZj_QPcJZmC3HL3AO3mFoY=DN7L0cKwtpOCB2uR55Y+ghEQ@mail.gmail.com>
Subject: Re: [OE-core] oe-selftest for devtool failed
To: alex.kanavin@gmail.com
Cc: =?UTF-8?B?RnLDqWTDqXJpYyBNYXJ0aW5zb25z?= <frederic.martinsons@gmail.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Mar 2023 18:28:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179244

Btw, I'm beginning to suspect something isn't right about /tmp on your
build host. The test requires being able to write executable scripts
into that, and then run them. I just ran the
devtool.DevtoolModifyTests.test_devtool_modify_git here, and it
succeeded.

Alex

On Tue, 28 Mar 2023 at 20:14, Alexander Kanavin via
lists.openembedded.org <alex.kanavin=3Dgmail.com@lists.openembedded.org>
wrote:
>
> Would you be able to read the failing test, and replicate the steps it
> does by hand? If we can narrow down the precise point where it fails,
> that would already help.
>
> Alex
>
> On Tue, 28 Mar 2023 at 20:01, Fr=C3=A9d=C3=A9ric Martinsons
> <frederic.martinsons@gmail.com> wrote:
> >
> > I rebuilt a poky master from scratch on another machine (Ubuntu 22.04 ,=
 16 Xeon, 124 Gb RAM), it took
> >  2h30mn to finish (note that rust-llvm-native and llvm-native both took=
 around 1h each to be built).
> >
> > I have two questions for my curiosity:
> >    - why rust things (cargo-native, librsvg)  are the last artifacts bu=
ilt on core-image-sato ? it seems strange at first look
> > (but may be explained by packages embedded by this image, I didn't look=
 on what are the dependencies of this image)
> >    - my pristine BDIR took around 90 GB , maybe the page https://docs.y=
octoproject.org/dev/brief-yoctoprojectqs/index.html stating
> > that we need 50 GB of free space needs to be reviewed (unless it was wr=
itten with another image than core-image-sato in mind) ?
> >
> > Apart from that,  I have the exact same error on test_devtool_modify_gi=
t that I had on the other machine under /var build dir:
> >
> > NOTE: Running setscene task 210 of 213 (virtual:native:/tmp/devtoolqacv=
bsfqx2/core-copy/meta/recipes-devtools/gnu-config/gnu-config_git.bb:do_popu=
late_sysroot_setscene)
> > NOTE: recipe gnu-config-native-20230216+gitAUTOINC+63acb96f92-r0: task =
do_populate_sysroot_setscene: Started
> > NOTE: recipe gnu-config-native-20230216+gitAUTOINC+63acb96f92-r0: task =
do_populate_sysroot_setscene: Succeeded
> > NOTE: Running task 896 of 918 (/tmp/devtoolqacvbsfqx2/core-copy/meta/re=
cipes-core/psplash/psplash_git.bb:do_prepare_recipe_sysroot)
> > NOTE: recipe psplash-0.1+git999-r0: task do_prepare_recipe_sysroot: Sta=
rted
> > NOTE: recipe psplash-0.1+git999-r0: task do_prepare_recipe_sysroot: Suc=
ceeded
> > NOTE: Running task 910 of 918 (/tmp/devtoolqacvbsfqx2/core-copy/meta/re=
cipes-core/psplash/psplash_git.bb:do_configure)
> > NOTE: recipe psplash-0.1+git999-r0: task do_configure: Started
> > ERROR: psplash-0.1+git999-r0 do_configure: no configure script found at=
 ../../../../../../../../../../../tmp/devtoolqamf2smwsy/configure
> > ERROR: psplash-0.1+git999-r0 do_configure: ExecutionError('/home/jenkin=
s/yocto-poky-master/poky/build-st/tmp/work/core2-64-poky-linux/psplash/0.1+=
git999-r0/temp/run.do_configure.1967375', 1, None, None)
> > ERROR: Logfile of failure stored in: /home/jenkins/yocto-poky-master/po=
ky/build-st/tmp/work/core2-64-poky-linux/psplash/0.1+git999-r0/temp/log.do_=
configure.1967375
> > NOTE: recipe psplash-0.1+git999-r0: task do_configure: Failed
> > ERROR: Task (/tmp/devtoolqacvbsfqx2/core-copy/meta/recipes-core/psplash=
/psplash_git.bb:do_configure) failed with exit code '1'
> > NOTE: Tasks Summary: Attempted 910 tasks of which 904 didn't need to be=
 rerun and 1 failed.
> >
> > Full test log joined (I would like to join also the log of do_configure=
 step but it seems that the test do a cleanall of the recipe during its tea=
r down method)
> >
> > I'm kind of stuck here since I cannot develop more oe-selftest tests if=
 I didn't even manage to make the existing ones succeed.
> > Can someone give me the setup of this autobuilder where Alexander talke=
d about ?
> >
> > I could try to get as close as possible to the autobuilder setup if the=
 oe-selftest is ok there.
> >
> > On Tue, 28 Mar 2023 at 17:36, Fr=C3=A9d=C3=A9ric Martinsons <frederic.m=
artinsons@gmail.com> wrote:
> >>
> >> Note that I managed to build libtirpc-native and shadow-native with bi=
tbake (and the same setup).
> >>
> >> I currently try the build on another machine and under /home.
> >>
> >> I'll tell you the results soon
> >>
> >> Le mar. 28 mars 2023, 15:13, Richard Purdie <richard.purdie@linuxfound=
ation.org> a =C3=A9crit :
> >>>
> >>> On Tue, 2023-03-28 at 14:40 +0200, Fr=C3=A9d=C3=A9ric Martinsons wrot=
e:
> >>> > I just finished a pristine build of core-image-sato on poky master,
> >>> > and set up SSTATE_DIR in my local.conf.
> >>> > Tests are now ok, I can start to write some now.
> >>> >
> >>> > If anyone is interested , please find attached the full log of the
> >>> > two first failures.
> >>>
> >>> Having the errors helps, thanks.
> >>>
> >>> The short summary is these two lines:
> >>>
> >>> libtirpc-native
> >>> | chown: changing ownership of '/var/lib/jenkins/YOCTO_POKY_MASTER_TE=
ST/poky/build-st/tmp/work/x86_64-linux/libtirpc-native/1.3.3-r0/image/var/l=
ib/jenkins/YOCTO_POKY_MASTER_TEST/poky/build-st/tmp/work/x86_64-linux/libti=
rpc-native/1.3.3-r0/recipe-sysroot-native/etc/netconfig': Invalid argument
> >>>
> >>> shadow-native
> >>> | chown: changing ownership of '/var/lib/jenkins/YOCTO_POKY_MASTER_TE=
ST/poky/build-st/tmp/work/x86_64-linux/shadow-native/4.13-r0/image/var/lib/=
jenkins/YOCTO_POKY_MASTER_TEST/poky/build-st/tmp/work/x86_64-linux/shadow-n=
ative/4.13-r0/recipe-sysroot-native/var/spool/mail': Invalid argument
> >>>
> >>>
> >>> I'm wondering if the fact the build is under /var might be triggering
> >>> something somehow...
> >>>
> >>> Cheers,
> >>>
> >>> Richard
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#179243): https://lists.openembedded.org/g/openembedde=
d-core/message/179243
> Mute This Topic: https://lists.openembedded.org/mt/97900549/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
ex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

