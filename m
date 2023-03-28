Return-Path: <frederic.martinsons@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C04CAC76196
	for <webhook@archiver.kernel.org>; Tue, 28 Mar 2023 19:02:30 +0000 (UTC)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
 by mx.groups.io with SMTP id smtpd.web10.5299.1680030149695949472
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Mar 2023 12:02:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=lOeKcD/j;
 spf=pass (domain: gmail.com, ip: 209.85.208.173, mailfrom: frederic.martinsons@gmail.com)
Received: by mail-lj1-f173.google.com with SMTP id 20so13692716lju.0
        for <openembedded-core@lists.openembedded.org>; Tue, 28 Mar 2023 12:02:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680030148;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=kV2Vs33887PbPDMIHzavBJ7ElMu5O2ZiysJqddnMszo=;
        b=lOeKcD/jw0FsNE0P5Nqs6aqF9gOQWcLHPC04IZCakDeAX2vv5cVDlxXetgghgc7w8F
         Y1aK5xnFxlj8fW+qRBVkgPFfoC+bQRjh/Mzpi++FizYVdAvVnKYZ4lO3vS5fXA/MAcGZ
         4CdoiheB0KDZ/m0vVeEgcqb6j1GYIjRrEZTM7d8YsiGGRcREDWQg38ZENex/Mcy861Rw
         WvAeBMC8mlkvSo0UndxlPMgVzTZjG3vDLweG7WZj5AbvtCTZp4Cmode8J3MeW0eK4yZW
         mZESoW9aobe/K4a0qhdAwLcXiOKfaz3a8JWYMnNmUPpNOSDU7pmGHuAD6sfizZjPeAux
         5xdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680030148;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kV2Vs33887PbPDMIHzavBJ7ElMu5O2ZiysJqddnMszo=;
        b=IwDLGhihHfMd0h2T0SaevFh7mc42xhEot+w+1NescjI7siheSTCDbjVIpoPrFD1dLJ
         3StSdG4yl3adL1KWLGYwyksRcL0ScVzR+HAmak1e3I7/BTQm7LMifrE1FICvdB4XkJOd
         xCeLdUevrTMIwdW+aDVgn4M8gOEBklpVgHv+Z3Dm2NlybXYwaLOj6/7/NuI6UOW4Spdu
         6wHGvRL8oK9J+yaEJicMkVSTt54iheBDziQmxzeJEDMZ/n6MO0zyMZIStmY1UFM92IuR
         ePs050vIpWKt7AKzRfPECLEvgxQ0nMZdyWGCro5M62Nc/cue5HPp2ykUWj+eqo0r5eAT
         D2Kg==
X-Gm-Message-State: AAQBX9efLNI95Bj++vWOYJj5rrlt4//+W6QkBW/0WUp5f+A+WHFSiNlU
	FuBIXw4rWV1Dey6xnUgn6DgewJ6jfZwncUm/AhQ=
X-Google-Smtp-Source: AKy350Yh8lvQQYwQuvKMwNvnmycw4ffUh26YOpNgyKOLRIvhj/aSFW6/BKF/HhnFSx/VLibaVahxC6YHs0GeeEObp5g=
X-Received: by 2002:a05:651c:c1:b0:29a:a76a:194b with SMTP id
 1-20020a05651c00c100b0029aa76a194bmr571003ljr.3.1680030147607; Tue, 28 Mar
 2023 12:02:27 -0700 (PDT)
MIME-Version: 1.0
References: <CA+cAkeqygZo7JXaaatanuNUaq2tpP7jfa8ZgFZ3pj7WgCuN_=w@mail.gmail.com>
 <CANNYZj_gMBkeMPO=zG+OFx84kJj=+DFqQUdULOQ_jR5wGApfjQ@mail.gmail.com>
 <53196741237572435b0a5965aa77a72b021d6fed.camel@linuxfoundation.org>
 <CA+cAkeo_CnnQDLrrmcDE1PP_65qoxkAXU20Ho8r_N-BwqqbObw@mail.gmail.com>
 <72921856ae24cb434edf3698ea51614d7a73a4fb.camel@linuxfoundation.org>
 <CA+cAkerVECW3BPi8nE4SspKVd1BV9ro0j5d3fHT86CAYGahUwQ@mail.gmail.com>
 <CA+cAkep8OAdKUg_nPrGbokXnbF_FshQXeCwGq2ZX-YTJ=wEU7g@mail.gmail.com>
 <1750A7E6D1A5F095.29160@lists.openembedded.org> <CANNYZj_QPcJZmC3HL3AO3mFoY=DN7L0cKwtpOCB2uR55Y+ghEQ@mail.gmail.com>
In-Reply-To: <CANNYZj_QPcJZmC3HL3AO3mFoY=DN7L0cKwtpOCB2uR55Y+ghEQ@mail.gmail.com>
From: =?UTF-8?B?RnLDqWTDqXJpYyBNYXJ0aW5zb25z?= <frederic.martinsons@gmail.com>
Date: Tue, 28 Mar 2023 21:02:16 +0200
Message-ID: <CA+cAkepFoghCFOKQxdwd7Nop1Xq=Vqzg3sdqH=yT7gQh2p2ESg@mail.gmail.com>
Subject: Re: [OE-core] oe-selftest for devtool failed
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000029000f05f7fa807d"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Mar 2023 19:02:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179245

--00000000000029000f05f7fa807d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Oh my, your assumption is surely correct, my build host /tmp is mounted
with noexec so no chance to execute
anything there:

[ (8) ] jenkins@cibuilder2:~$ mount | grep "/tmp"
tmpfs on /tmp type tmpfs (rw,nosuid,nodev,noexec,noatime,inode64)

Tomorrow, I'll try with another machine (or talk to the admin of the build
hosts) with a /tmp capable of executing things.

But the requirement to have /tmp directory capable of executing scripts was
not mentioned in the oe-selftest
page (https://wiki.yoctoproject.org/wiki/Oe-selftest) or the quick start
one (https://docs.yoctoproject.org/brief-yoctoprojectqs/index.html)

I would have thought that devtool, if it needs to execute some scripts,
will execute them in its working directory and not
in /tmp of build hosts.... Is this something really expected ?


On Tue, 28 Mar 2023 at 20:28, Alexander Kanavin <alex.kanavin@gmail.com>
wrote:

> Btw, I'm beginning to suspect something isn't right about /tmp on your
> build host. The test requires being able to write executable scripts
> into that, and then run them. I just ran the
> devtool.DevtoolModifyTests.test_devtool_modify_git here, and it
> succeeded.
>
> Alex
>
> On Tue, 28 Mar 2023 at 20:14, Alexander Kanavin via
> lists.openembedded.org <alex.kanavin=3Dgmail.com@lists.openembedded.org>
> wrote:
> >
> > Would you be able to read the failing test, and replicate the steps it
> > does by hand? If we can narrow down the precise point where it fails,
> > that would already help.
> >
> > Alex
> >
> > On Tue, 28 Mar 2023 at 20:01, Fr=C3=A9d=C3=A9ric Martinsons
> > <frederic.martinsons@gmail.com> wrote:
> > >
> > > I rebuilt a poky master from scratch on another machine (Ubuntu 22.04
> , 16 Xeon, 124 Gb RAM), it took
> > >  2h30mn to finish (note that rust-llvm-native and llvm-native both
> took around 1h each to be built).
> > >
> > > I have two questions for my curiosity:
> > >    - why rust things (cargo-native, librsvg)  are the last artifacts
> built on core-image-sato ? it seems strange at first look
> > > (but may be explained by packages embedded by this image, I didn't
> look on what are the dependencies of this image)
> > >    - my pristine BDIR took around 90 GB , maybe the page
> https://docs.yoctoproject.org/dev/brief-yoctoprojectqs/index.html stating
> > > that we need 50 GB of free space needs to be reviewed (unless it was
> written with another image than core-image-sato in mind) ?
> > >
> > > Apart from that,  I have the exact same error on
> test_devtool_modify_git that I had on the other machine under /var build
> dir:
> > >
> > > NOTE: Running setscene task 210 of 213
> (virtual:native:/tmp/devtoolqacvbsfqx2/core-copy/meta/recipes-devtools/gn=
u-config/gnu-config_git.bb:
> do_populate_sysroot_setscene)
> > > NOTE: recipe gnu-config-native-20230216+gitAUTOINC+63acb96f92-r0: tas=
k
> do_populate_sysroot_setscene: Started
> > > NOTE: recipe gnu-config-native-20230216+gitAUTOINC+63acb96f92-r0: tas=
k
> do_populate_sysroot_setscene: Succeeded
> > > NOTE: Running task 896 of 918
> (/tmp/devtoolqacvbsfqx2/core-copy/meta/recipes-core/psplash/psplash_git.b=
b:
> do_prepare_recipe_sysroot)
> > > NOTE: recipe psplash-0.1+git999-r0: task do_prepare_recipe_sysroot:
> Started
> > > NOTE: recipe psplash-0.1+git999-r0: task do_prepare_recipe_sysroot:
> Succeeded
> > > NOTE: Running task 910 of 918
> (/tmp/devtoolqacvbsfqx2/core-copy/meta/recipes-core/psplash/psplash_git.b=
b:
> do_configure)
> > > NOTE: recipe psplash-0.1+git999-r0: task do_configure: Started
> > > ERROR: psplash-0.1+git999-r0 do_configure: no configure script found
> at ../../../../../../../../../../../tmp/devtoolqamf2smwsy/configure
> > > ERROR: psplash-0.1+git999-r0 do_configure:
> ExecutionError('/home/jenkins/yocto-poky-master/poky/build-st/tmp/work/co=
re2-64-poky-linux/psplash/0.1+git999-r0/temp/run.do_configure.1967375',
> 1, None, None)
> > > ERROR: Logfile of failure stored in:
> /home/jenkins/yocto-poky-master/poky/build-st/tmp/work/core2-64-poky-linu=
x/psplash/0.1+git999-r0/temp/log.do_configure.1967375
> > > NOTE: recipe psplash-0.1+git999-r0: task do_configure: Failed
> > > ERROR: Task
> (/tmp/devtoolqacvbsfqx2/core-copy/meta/recipes-core/psplash/psplash_git.b=
b:do_configure)
> failed with exit code '1'
> > > NOTE: Tasks Summary: Attempted 910 tasks of which 904 didn't need to
> be rerun and 1 failed.
> > >
> > > Full test log joined (I would like to join also the log of
> do_configure step but it seems that the test do a cleanall of the recipe
> during its tear down method)
> > >
> > > I'm kind of stuck here since I cannot develop more oe-selftest tests
> if I didn't even manage to make the existing ones succeed.
> > > Can someone give me the setup of this autobuilder where Alexander
> talked about ?
> > >
> > > I could try to get as close as possible to the autobuilder setup if
> the oe-selftest is ok there.
> > >
> > > On Tue, 28 Mar 2023 at 17:36, Fr=C3=A9d=C3=A9ric Martinsons <
> frederic.martinsons@gmail.com> wrote:
> > >>
> > >> Note that I managed to build libtirpc-native and shadow-native with
> bitbake (and the same setup).
> > >>
> > >> I currently try the build on another machine and under /home.
> > >>
> > >> I'll tell you the results soon
> > >>
> > >> Le mar. 28 mars 2023, 15:13, Richard Purdie <
> richard.purdie@linuxfoundation.org> a =C3=A9crit :
> > >>>
> > >>> On Tue, 2023-03-28 at 14:40 +0200, Fr=C3=A9d=C3=A9ric Martinsons wr=
ote:
> > >>> > I just finished a pristine build of core-image-sato on poky maste=
r,
> > >>> > and set up SSTATE_DIR in my local.conf.
> > >>> > Tests are now ok, I can start to write some now.
> > >>> >
> > >>> > If anyone is interested , please find attached the full log of th=
e
> > >>> > two first failures.
> > >>>
> > >>> Having the errors helps, thanks.
> > >>>
> > >>> The short summary is these two lines:
> > >>>
> > >>> libtirpc-native
> > >>> | chown: changing ownership of
> '/var/lib/jenkins/YOCTO_POKY_MASTER_TEST/poky/build-st/tmp/work/x86_64-li=
nux/libtirpc-native/1.3.3-r0/image/var/lib/jenkins/YOCTO_POKY_MASTER_TEST/p=
oky/build-st/tmp/work/x86_64-linux/libtirpc-native/1.3.3-r0/recipe-sysroot-=
native/etc/netconfig':
> Invalid argument
> > >>>
> > >>> shadow-native
> > >>> | chown: changing ownership of
> '/var/lib/jenkins/YOCTO_POKY_MASTER_TEST/poky/build-st/tmp/work/x86_64-li=
nux/shadow-native/4.13-r0/image/var/lib/jenkins/YOCTO_POKY_MASTER_TEST/poky=
/build-st/tmp/work/x86_64-linux/shadow-native/4.13-r0/recipe-sysroot-native=
/var/spool/mail':
> Invalid argument
> > >>>
> > >>>
> > >>> I'm wondering if the fact the build is under /var might be triggeri=
ng
> > >>> something somehow...
> > >>>
> > >>> Cheers,
> > >>>
> > >>> Richard
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#179243):
> https://lists.openembedded.org/g/openembedded-core/message/179243
> > Mute This Topic: https://lists.openembedded.org/mt/97900549/1686489
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>

--00000000000029000f05f7fa807d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Oh my, your assumption is surely correct, my build host /t=
mp is mounted with noexec so no chance to execute<div>anything there:</div>=
<div><br></div><div>[ (8) ] jenkins@cibuilder2:~$ mount | grep &quot;/tmp&q=
uot;<br>tmpfs on /tmp type tmpfs (rw,nosuid,nodev,noexec,noatime,inode64)<b=
r></div><div><br></div><div>Tomorrow, I&#39;ll try with another machine (or=
 talk to the admin of the build hosts) with a /tmp capable of executing thi=
ngs.</div><div><br></div><div>But the requirement to have /tmp directory ca=
pable of executing scripts was not mentioned in the oe-selftest</div><div>p=
age (<a href=3D"https://wiki.yoctoproject.org/wiki/Oe-selftest">https://wik=
i.yoctoproject.org/wiki/Oe-selftest</a>) or the quick start one (<a href=3D=
"https://docs.yoctoproject.org/brief-yoctoprojectqs/index.html">https://doc=
s.yoctoproject.org/brief-yoctoprojectqs/index.html</a>)</div><div><br></div=
><div>I would have thought that devtool, if it needs to execute some script=
s, will execute them in its working directory and not=C2=A0</div><div>in /t=
mp of build hosts.... Is this something really expected ?</div><div><br></d=
iv></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_att=
r">On Tue, 28 Mar 2023 at 20:28, Alexander Kanavin &lt;<a href=3D"mailto:al=
ex.kanavin@gmail.com">alex.kanavin@gmail.com</a>&gt; wrote:<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex">Btw, I&#39;m beginning to suspe=
ct something isn&#39;t right about /tmp on your<br>
build host. The test requires being able to write executable scripts<br>
into that, and then run them. I just ran the<br>
devtool.DevtoolModifyTests.test_devtool_modify_git here, and it<br>
succeeded.<br>
<br>
Alex<br>
<br>
On Tue, 28 Mar 2023 at 20:14, Alexander Kanavin via<br>
<a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D"_bla=
nk">lists.openembedded.org</a> &lt;alex.kanavin=3D<a href=3D"mailto:gmail.c=
om@lists.openembedded.org" target=3D"_blank">gmail.com@lists.openembedded.o=
rg</a>&gt;<br>
wrote:<br>
&gt;<br>
&gt; Would you be able to read the failing test, and replicate the steps it=
<br>
&gt; does by hand? If we can narrow down the precise point where it fails,<=
br>
&gt; that would already help.<br>
&gt;<br>
&gt; Alex<br>
&gt;<br>
&gt; On Tue, 28 Mar 2023 at 20:01, Fr=C3=A9d=C3=A9ric Martinsons<br>
&gt; &lt;<a href=3D"mailto:frederic.martinsons@gmail.com" target=3D"_blank"=
>frederic.martinsons@gmail.com</a>&gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt; I rebuilt a poky master from scratch on another machine (Ubuntu 2=
2.04 , 16 Xeon, 124 Gb RAM), it took<br>
&gt; &gt;=C2=A0 2h30mn to finish (note that rust-llvm-native and llvm-nativ=
e both took around 1h each to be built).<br>
&gt; &gt;<br>
&gt; &gt; I have two questions for my curiosity:<br>
&gt; &gt;=C2=A0 =C2=A0 - why rust things (cargo-native, librsvg)=C2=A0 are =
the last artifacts built on core-image-sato ? it seems strange at first loo=
k<br>
&gt; &gt; (but may be explained by packages embedded by this image, I didn&=
#39;t look on what are the dependencies of this image)<br>
&gt; &gt;=C2=A0 =C2=A0 - my pristine BDIR took around 90 GB , maybe the pag=
e <a href=3D"https://docs.yoctoproject.org/dev/brief-yoctoprojectqs/index.h=
tml" rel=3D"noreferrer" target=3D"_blank">https://docs.yoctoproject.org/dev=
/brief-yoctoprojectqs/index.html</a> stating<br>
&gt; &gt; that we need 50 GB of free space needs to be reviewed (unless it =
was written with another image than core-image-sato in mind) ?<br>
&gt; &gt;<br>
&gt; &gt; Apart from that,=C2=A0 I have the exact same error on test_devtoo=
l_modify_git that I had on the other machine under /var build dir:<br>
&gt; &gt;<br>
&gt; &gt; NOTE: Running setscene task 210 of 213 (virtual:native:/tmp/devto=
olqacvbsfqx2/core-copy/meta/recipes-devtools/gnu-config/gnu-config_git.bb:d=
o_populate_sysroot_setscene)<br>
&gt; &gt; NOTE: recipe gnu-config-native-20230216+gitAUTOINC+63acb96f92-r0:=
 task do_populate_sysroot_setscene: Started<br>
&gt; &gt; NOTE: recipe gnu-config-native-20230216+gitAUTOINC+63acb96f92-r0:=
 task do_populate_sysroot_setscene: Succeeded<br>
&gt; &gt; NOTE: Running task 896 of 918 (/tmp/devtoolqacvbsfqx2/core-copy/m=
eta/recipes-core/psplash/psplash_git.bb:do_prepare_recipe_sysroot)<br>
&gt; &gt; NOTE: recipe psplash-0.1+git999-r0: task do_prepare_recipe_sysroo=
t: Started<br>
&gt; &gt; NOTE: recipe psplash-0.1+git999-r0: task do_prepare_recipe_sysroo=
t: Succeeded<br>
&gt; &gt; NOTE: Running task 910 of 918 (/tmp/devtoolqacvbsfqx2/core-copy/m=
eta/recipes-core/psplash/psplash_git.bb:do_configure)<br>
&gt; &gt; NOTE: recipe psplash-0.1+git999-r0: task do_configure: Started<br=
>
&gt; &gt; ERROR: psplash-0.1+git999-r0 do_configure: no configure script fo=
und at ../../../../../../../../../../../tmp/devtoolqamf2smwsy/configure<br>
&gt; &gt; ERROR: psplash-0.1+git999-r0 do_configure: ExecutionError(&#39;/h=
ome/jenkins/yocto-poky-master/poky/build-st/tmp/work/core2-64-poky-linux/ps=
plash/0.1+git999-r0/temp/run.do_configure.1967375&#39;, 1, None, None)<br>
&gt; &gt; ERROR: Logfile of failure stored in: /home/jenkins/yocto-poky-mas=
ter/poky/build-st/tmp/work/core2-64-poky-linux/psplash/0.1+git999-r0/temp/l=
og.do_configure.1967375<br>
&gt; &gt; NOTE: recipe psplash-0.1+git999-r0: task do_configure: Failed<br>
&gt; &gt; ERROR: Task (/tmp/devtoolqacvbsfqx2/core-copy/meta/recipes-core/p=
splash/psplash_git.bb:do_configure) failed with exit code &#39;1&#39;<br>
&gt; &gt; NOTE: Tasks Summary: Attempted 910 tasks of which 904 didn&#39;t =
need to be rerun and 1 failed.<br>
&gt; &gt;<br>
&gt; &gt; Full test log joined (I would like to join also the log of do_con=
figure step but it seems that the test do a cleanall of the recipe during i=
ts tear down method)<br>
&gt; &gt;<br>
&gt; &gt; I&#39;m kind of stuck here since I cannot develop more oe-selftes=
t tests if I didn&#39;t even manage to make the existing ones succeed.<br>
&gt; &gt; Can someone give me the setup of this autobuilder where Alexander=
 talked about ?<br>
&gt; &gt;<br>
&gt; &gt; I could try to get as close as possible to the autobuilder setup =
if the oe-selftest is ok there.<br>
&gt; &gt;<br>
&gt; &gt; On Tue, 28 Mar 2023 at 17:36, Fr=C3=A9d=C3=A9ric Martinsons &lt;<=
a href=3D"mailto:frederic.martinsons@gmail.com" target=3D"_blank">frederic.=
martinsons@gmail.com</a>&gt; wrote:<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; Note that I managed to build libtirpc-native and shadow-nativ=
e with bitbake (and the same setup).<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; I currently try the build on another machine and under /home.=
<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; I&#39;ll tell you the results soon<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; Le mar. 28 mars 2023, 15:13, Richard Purdie &lt;<a href=3D"ma=
ilto:richard.purdie@linuxfoundation.org" target=3D"_blank">richard.purdie@l=
inuxfoundation.org</a>&gt; a =C3=A9crit :<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt; On Tue, 2023-03-28 at 14:40 +0200, Fr=C3=A9d=C3=A9ric Mar=
tinsons wrote:<br>
&gt; &gt;&gt;&gt; &gt; I just finished a pristine build of core-image-sato =
on poky master,<br>
&gt; &gt;&gt;&gt; &gt; and set up SSTATE_DIR in my local.conf.<br>
&gt; &gt;&gt;&gt; &gt; Tests are now ok, I can start to write some now.<br>
&gt; &gt;&gt;&gt; &gt;<br>
&gt; &gt;&gt;&gt; &gt; If anyone is interested , please find attached the f=
ull log of the<br>
&gt; &gt;&gt;&gt; &gt; two first failures.<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt; Having the errors helps, thanks.<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt; The short summary is these two lines:<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt; libtirpc-native<br>
&gt; &gt;&gt;&gt; | chown: changing ownership of &#39;/var/lib/jenkins/YOCT=
O_POKY_MASTER_TEST/poky/build-st/tmp/work/x86_64-linux/libtirpc-native/1.3.=
3-r0/image/var/lib/jenkins/YOCTO_POKY_MASTER_TEST/poky/build-st/tmp/work/x8=
6_64-linux/libtirpc-native/1.3.3-r0/recipe-sysroot-native/etc/netconfig&#39=
;: Invalid argument<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt; shadow-native<br>
&gt; &gt;&gt;&gt; | chown: changing ownership of &#39;/var/lib/jenkins/YOCT=
O_POKY_MASTER_TEST/poky/build-st/tmp/work/x86_64-linux/shadow-native/4.13-r=
0/image/var/lib/jenkins/YOCTO_POKY_MASTER_TEST/poky/build-st/tmp/work/x86_6=
4-linux/shadow-native/4.13-r0/recipe-sysroot-native/var/spool/mail&#39;: In=
valid argument<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt; I&#39;m wondering if the fact the build is under /var mig=
ht be triggering<br>
&gt; &gt;&gt;&gt; something somehow...<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt; Cheers,<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt; Richard<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#179243): <a href=3D"https://lists.openembedded.org=
/g/openembedded-core/message/179243" rel=3D"noreferrer" target=3D"_blank">h=
ttps://lists.openembedded.org/g/openembedded-core/message/179243</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/97900549=
/1686489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.o=
rg/mt/97900549/1686489</a><br>
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

--00000000000029000f05f7fa807d--

