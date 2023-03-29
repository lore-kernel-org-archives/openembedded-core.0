Return-Path: <frederic.martinsons@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFA9EC74A5B
	for <webhook@archiver.kernel.org>; Wed, 29 Mar 2023 07:08:43 +0000 (UTC)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
 by mx.groups.io with SMTP id smtpd.web11.18346.1680073715795705093
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Mar 2023 00:08:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=h1U/0pfP;
 spf=pass (domain: gmail.com, ip: 209.85.208.180, mailfrom: frederic.martinsons@gmail.com)
Received: by mail-lj1-f180.google.com with SMTP id t14so15062716ljd.5
        for <openembedded-core@lists.openembedded.org>; Wed, 29 Mar 2023 00:08:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680073714;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=uj9cms+VFIVM9O5evFlGzLTyWIOLCVv1TW8EvPWjTPc=;
        b=h1U/0pfP7whyC/nGX0fBpOYJRntLqPi+lMl0xoFKK3b5/kOS2g30disVJKOWfUNubb
         QYauUHFhNfUHvsmCCXb08kKtLaKt5ET0uWdzDHNTDUjTaooeDrhdp0pEORpBFdxZ/GPh
         U5jBRb+pFJR3WWwF8NMneEMLIztcgtVzESxRuJtqYgiJ3BYRKwrcET9dz+Cm12ioS3Ru
         Mg/8Z04ngkHjsqRfKdmwRzpKbnLYyETSmYTAThe83iRV7TRQnqqgUMEpK6r2LVzGoqk9
         ynQgsuGnuxeaRGm4INzN51I8i3wh45R6nNN3W2tBX2Imd/8i6QKO93BgcCSGeRShcyWo
         tCxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680073714;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uj9cms+VFIVM9O5evFlGzLTyWIOLCVv1TW8EvPWjTPc=;
        b=cSt0um5LPA9cU2Wi2el6UjL/d/UXeXAFsBfiRE1s4bFd/lfHKQW5TF2+E1LVUSXus1
         d2YDVoGxnvTXa6ARzNaIloN6wCqv/kAp/+5nZmih/TatLSFEy1ZASHZD6LYSOdiYyJMb
         XzxIpkbI4djaEm1EmQTCAuB3kBMeuyevFQmjFmNkPuyazaa6II+ttCByQ1+Euo3rhQ1i
         60B6JG56z7cEvLz2y2Bl4jnPfUYl+O1ps407P05Es3IYobu/Z6XaicXzPZms9qDH6yn8
         5g8XltDwghaLZmFFN6SzKgynThGouWGA6VFv+LxzYAO+RjeV1H1orTnDliphjMPF1dXr
         ZqDg==
X-Gm-Message-State: AAQBX9ek9Gpa0ViELqVDB5ko8F6Qjgw+afJ8Sw2m/zFXwH7QpOeSaDk4
	K5IEQgKBVtwP6e6PwkIekn29UNgoO4Qssw/ajtc=
X-Google-Smtp-Source: AKy350Z07Cb66zbiY5uboANTfIXLA2GOkfULPwyMaQW1sXMbbWMsTywOo+4Maz5WaCFuk+a3+n/6FIywNx6do7P/TMU=
X-Received: by 2002:a2e:a0c6:0:b0:293:39fe:b712 with SMTP id
 f6-20020a2ea0c6000000b0029339feb712mr5607637ljm.3.1680073713114; Wed, 29 Mar
 2023 00:08:33 -0700 (PDT)
MIME-Version: 1.0
References: <CA+cAkeqygZo7JXaaatanuNUaq2tpP7jfa8ZgFZ3pj7WgCuN_=w@mail.gmail.com>
 <CANNYZj_gMBkeMPO=zG+OFx84kJj=+DFqQUdULOQ_jR5wGApfjQ@mail.gmail.com>
 <53196741237572435b0a5965aa77a72b021d6fed.camel@linuxfoundation.org>
 <CA+cAkeo_CnnQDLrrmcDE1PP_65qoxkAXU20Ho8r_N-BwqqbObw@mail.gmail.com>
 <72921856ae24cb434edf3698ea51614d7a73a4fb.camel@linuxfoundation.org>
 <CA+cAkerVECW3BPi8nE4SspKVd1BV9ro0j5d3fHT86CAYGahUwQ@mail.gmail.com>
 <CA+cAkep8OAdKUg_nPrGbokXnbF_FshQXeCwGq2ZX-YTJ=wEU7g@mail.gmail.com>
 <1750A7E6D1A5F095.29160@lists.openembedded.org> <CANNYZj_QPcJZmC3HL3AO3mFoY=DN7L0cKwtpOCB2uR55Y+ghEQ@mail.gmail.com>
 <CA+cAkepFoghCFOKQxdwd7Nop1Xq=Vqzg3sdqH=yT7gQh2p2ESg@mail.gmail.com> <CANNYZj_G7MtSViD6S+SpWf1wVo_NTQw7Q3mwSEQ5FFWN5foGug@mail.gmail.com>
In-Reply-To: <CANNYZj_G7MtSViD6S+SpWf1wVo_NTQw7Q3mwSEQ5FFWN5foGug@mail.gmail.com>
From: =?UTF-8?B?RnLDqWTDqXJpYyBNYXJ0aW5zb25z?= <frederic.martinsons@gmail.com>
Date: Wed, 29 Mar 2023 09:08:21 +0200
Message-ID: <CA+cAkeqDmxHRauUJyw7Am9sSaBzXH68NpGchjcnpuTz4EPiHDg@mail.gmail.com>
Subject: Re: [OE-core] oe-selftest for devtool failed
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000dde37205f804a4a4"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Mar 2023 07:08:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179263

--000000000000dde37205f804a4a4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks, after having "fixed" /tmp, I managed to play
test_devtool_modify_git successfully.

Le mar. 28 mars 2023, 22:04, Alexander Kanavin <alex.kanavin@gmail.com> a
=C3=A9crit :

> Not devtool's fault. The selftest is written so that devtool is
> instructed to use /tmp/... to extract sources, and not a workspace in
> a build: 'devtool modify -x /tmp/...'.
>
> Having /tmp with noexec is not common, that's why it isn't mentioned.
> If the admin is not cooperative, you can hack the selftest definition
> to use some other place.
>
> Alex
>
> On Tue, 28 Mar 2023 at 21:02, Fr=C3=A9d=C3=A9ric Martinsons
> <frederic.martinsons@gmail.com> wrote:
> >
> > Oh my, your assumption is surely correct, my build host /tmp is mounted
> with noexec so no chance to execute
> > anything there:
> >
> > [ (8) ] jenkins@cibuilder2:~$ mount | grep "/tmp"
> > tmpfs on /tmp type tmpfs (rw,nosuid,nodev,noexec,noatime,inode64)
> >
> > Tomorrow, I'll try with another machine (or talk to the admin of the
> build hosts) with a /tmp capable of executing things.
> >
> > But the requirement to have /tmp directory capable of executing scripts
> was not mentioned in the oe-selftest
> > page (https://wiki.yoctoproject.org/wiki/Oe-selftest) or the quick
> start one (https://docs.yoctoproject.org/brief-yoctoprojectqs/index.html)
> >
> > I would have thought that devtool, if it needs to execute some scripts,
> will execute them in its working directory and not
> > in /tmp of build hosts.... Is this something really expected ?
> >
> >
> > On Tue, 28 Mar 2023 at 20:28, Alexander Kanavin <alex.kanavin@gmail.com=
>
> wrote:
> >>
> >> Btw, I'm beginning to suspect something isn't right about /tmp on your
> >> build host. The test requires being able to write executable scripts
> >> into that, and then run them. I just ran the
> >> devtool.DevtoolModifyTests.test_devtool_modify_git here, and it
> >> succeeded.
> >>
> >> Alex
> >>
> >> On Tue, 28 Mar 2023 at 20:14, Alexander Kanavin via
> >> lists.openembedded.org <alex.kanavin=3Dgmail.com@lists.openembedded.or=
g>
> >> wrote:
> >> >
> >> > Would you be able to read the failing test, and replicate the steps =
it
> >> > does by hand? If we can narrow down the precise point where it fails=
,
> >> > that would already help.
> >> >
> >> > Alex
> >> >
> >> > On Tue, 28 Mar 2023 at 20:01, Fr=C3=A9d=C3=A9ric Martinsons
> >> > <frederic.martinsons@gmail.com> wrote:
> >> > >
> >> > > I rebuilt a poky master from scratch on another machine (Ubuntu
> 22.04 , 16 Xeon, 124 Gb RAM), it took
> >> > >  2h30mn to finish (note that rust-llvm-native and llvm-native both
> took around 1h each to be built).
> >> > >
> >> > > I have two questions for my curiosity:
> >> > >    - why rust things (cargo-native, librsvg)  are the last
> artifacts built on core-image-sato ? it seems strange at first look
> >> > > (but may be explained by packages embedded by this image, I didn't
> look on what are the dependencies of this image)
> >> > >    - my pristine BDIR took around 90 GB , maybe the page
> https://docs.yoctoproject.org/dev/brief-yoctoprojectqs/index.html stating
> >> > > that we need 50 GB of free space needs to be reviewed (unless it
> was written with another image than core-image-sato in mind) ?
> >> > >
> >> > > Apart from that,  I have the exact same error on
> test_devtool_modify_git that I had on the other machine under /var build
> dir:
> >> > >
> >> > > NOTE: Running setscene task 210 of 213
> (virtual:native:/tmp/devtoolqacvbsfqx2/core-copy/meta/recipes-devtools/gn=
u-config/gnu-config_git.bb:
> do_populate_sysroot_setscene)
> >> > > NOTE: recipe gnu-config-native-20230216+gitAUTOINC+63acb96f92-r0:
> task do_populate_sysroot_setscene: Started
> >> > > NOTE: recipe gnu-config-native-20230216+gitAUTOINC+63acb96f92-r0:
> task do_populate_sysroot_setscene: Succeeded
> >> > > NOTE: Running task 896 of 918
> (/tmp/devtoolqacvbsfqx2/core-copy/meta/recipes-core/psplash/psplash_git.b=
b:
> do_prepare_recipe_sysroot)
> >> > > NOTE: recipe psplash-0.1+git999-r0: task do_prepare_recipe_sysroot=
:
> Started
> >> > > NOTE: recipe psplash-0.1+git999-r0: task do_prepare_recipe_sysroot=
:
> Succeeded
> >> > > NOTE: Running task 910 of 918
> (/tmp/devtoolqacvbsfqx2/core-copy/meta/recipes-core/psplash/psplash_git.b=
b:
> do_configure)
> >> > > NOTE: recipe psplash-0.1+git999-r0: task do_configure: Started
> >> > > ERROR: psplash-0.1+git999-r0 do_configure: no configure script
> found at ../../../../../../../../../../../tmp/devtoolqamf2smwsy/configure
> >> > > ERROR: psplash-0.1+git999-r0 do_configure:
> ExecutionError('/home/jenkins/yocto-poky-master/poky/build-st/tmp/work/co=
re2-64-poky-linux/psplash/0.1+git999-r0/temp/run.do_configure.1967375',
> 1, None, None)
> >> > > ERROR: Logfile of failure stored in:
> /home/jenkins/yocto-poky-master/poky/build-st/tmp/work/core2-64-poky-linu=
x/psplash/0.1+git999-r0/temp/log.do_configure.1967375
> >> > > NOTE: recipe psplash-0.1+git999-r0: task do_configure: Failed
> >> > > ERROR: Task
> (/tmp/devtoolqacvbsfqx2/core-copy/meta/recipes-core/psplash/psplash_git.b=
b:do_configure)
> failed with exit code '1'
> >> > > NOTE: Tasks Summary: Attempted 910 tasks of which 904 didn't need
> to be rerun and 1 failed.
> >> > >
> >> > > Full test log joined (I would like to join also the log of
> do_configure step but it seems that the test do a cleanall of the recipe
> during its tear down method)
> >> > >
> >> > > I'm kind of stuck here since I cannot develop more oe-selftest
> tests if I didn't even manage to make the existing ones succeed.
> >> > > Can someone give me the setup of this autobuilder where Alexander
> talked about ?
> >> > >
> >> > > I could try to get as close as possible to the autobuilder setup i=
f
> the oe-selftest is ok there.
> >> > >
> >> > > On Tue, 28 Mar 2023 at 17:36, Fr=C3=A9d=C3=A9ric Martinsons <
> frederic.martinsons@gmail.com> wrote:
> >> > >>
> >> > >> Note that I managed to build libtirpc-native and shadow-native
> with bitbake (and the same setup).
> >> > >>
> >> > >> I currently try the build on another machine and under /home.
> >> > >>
> >> > >> I'll tell you the results soon
> >> > >>
> >> > >> Le mar. 28 mars 2023, 15:13, Richard Purdie <
> richard.purdie@linuxfoundation.org> a =C3=A9crit :
> >> > >>>
> >> > >>> On Tue, 2023-03-28 at 14:40 +0200, Fr=C3=A9d=C3=A9ric Martinsons=
 wrote:
> >> > >>> > I just finished a pristine build of core-image-sato on poky
> master,
> >> > >>> > and set up SSTATE_DIR in my local.conf.
> >> > >>> > Tests are now ok, I can start to write some now.
> >> > >>> >
> >> > >>> > If anyone is interested , please find attached the full log of
> the
> >> > >>> > two first failures.
> >> > >>>
> >> > >>> Having the errors helps, thanks.
> >> > >>>
> >> > >>> The short summary is these two lines:
> >> > >>>
> >> > >>> libtirpc-native
> >> > >>> | chown: changing ownership of
> '/var/lib/jenkins/YOCTO_POKY_MASTER_TEST/poky/build-st/tmp/work/x86_64-li=
nux/libtirpc-native/1.3.3-r0/image/var/lib/jenkins/YOCTO_POKY_MASTER_TEST/p=
oky/build-st/tmp/work/x86_64-linux/libtirpc-native/1.3.3-r0/recipe-sysroot-=
native/etc/netconfig':
> Invalid argument
> >> > >>>
> >> > >>> shadow-native
> >> > >>> | chown: changing ownership of
> '/var/lib/jenkins/YOCTO_POKY_MASTER_TEST/poky/build-st/tmp/work/x86_64-li=
nux/shadow-native/4.13-r0/image/var/lib/jenkins/YOCTO_POKY_MASTER_TEST/poky=
/build-st/tmp/work/x86_64-linux/shadow-native/4.13-r0/recipe-sysroot-native=
/var/spool/mail':
> Invalid argument
> >> > >>>
> >> > >>>
> >> > >>> I'm wondering if the fact the build is under /var might be
> triggering
> >> > >>> something somehow...
> >> > >>>
> >> > >>> Cheers,
> >> > >>>
> >> > >>> Richard
> >> >
> >> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >> > Links: You receive all messages sent to this group.
> >> > View/Reply Online (#179243):
> https://lists.openembedded.org/g/openembedded-core/message/179243
> >> > Mute This Topic: https://lists.openembedded.org/mt/97900549/1686489
> >> > Group Owner: openembedded-core+owner@lists.openembedded.org
> >> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsu=
b
> [alex.kanavin@gmail.com]
> >> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >> >
>

--000000000000dde37205f804a4a4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Thanks, after having &quot;fixed&quot; /tmp, I managed to=
 play test_devtool_modify_git successfully.=C2=A0</div><br><div class=3D"gm=
ail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Le mar. 28 mars 2023, 22:0=
4, Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com">alex.kan=
avin@gmail.com</a>&gt; a =C3=A9crit=C2=A0:<br></div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-le=
ft:1ex">Not devtool&#39;s fault. The selftest is written so that devtool is=
<br>
instructed to use /tmp/... to extract sources, and not a workspace in<br>
a build: &#39;devtool modify -x /tmp/...&#39;.<br>
<br>
Having /tmp with noexec is not common, that&#39;s why it isn&#39;t mentione=
d.<br>
If the admin is not cooperative, you can hack the selftest definition<br>
to use some other place.<br>
<br>
Alex<br>
<br>
On Tue, 28 Mar 2023 at 21:02, Fr=C3=A9d=C3=A9ric Martinsons<br>
&lt;<a href=3D"mailto:frederic.martinsons@gmail.com" target=3D"_blank" rel=
=3D"noreferrer">frederic.martinsons@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Oh my, your assumption is surely correct, my build host /tmp is mounte=
d with noexec so no chance to execute<br>
&gt; anything there:<br>
&gt;<br>
&gt; [ (8) ] jenkins@cibuilder2:~$ mount | grep &quot;/tmp&quot;<br>
&gt; tmpfs on /tmp type tmpfs (rw,nosuid,nodev,noexec,noatime,inode64)<br>
&gt;<br>
&gt; Tomorrow, I&#39;ll try with another machine (or talk to the admin of t=
he build hosts) with a /tmp capable of executing things.<br>
&gt;<br>
&gt; But the requirement to have /tmp directory capable of executing script=
s was not mentioned in the oe-selftest<br>
&gt; page (<a href=3D"https://wiki.yoctoproject.org/wiki/Oe-selftest" rel=
=3D"noreferrer noreferrer" target=3D"_blank">https://wiki.yoctoproject.org/=
wiki/Oe-selftest</a>) or the quick start one (<a href=3D"https://docs.yocto=
project.org/brief-yoctoprojectqs/index.html" rel=3D"noreferrer noreferrer" =
target=3D"_blank">https://docs.yoctoproject.org/brief-yoctoprojectqs/index.=
html</a>)<br>
&gt;<br>
&gt; I would have thought that devtool, if it needs to execute some scripts=
, will execute them in its working directory and not<br>
&gt; in /tmp of build hosts.... Is this something really expected ?<br>
&gt;<br>
&gt;<br>
&gt; On Tue, 28 Mar 2023 at 20:28, Alexander Kanavin &lt;<a href=3D"mailto:=
alex.kanavin@gmail.com" target=3D"_blank" rel=3D"noreferrer">alex.kanavin@g=
mail.com</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; Btw, I&#39;m beginning to suspect something isn&#39;t right about =
/tmp on your<br>
&gt;&gt; build host. The test requires being able to write executable scrip=
ts<br>
&gt;&gt; into that, and then run them. I just ran the<br>
&gt;&gt; devtool.DevtoolModifyTests.test_devtool_modify_git here, and it<br=
>
&gt;&gt; succeeded.<br>
&gt;&gt;<br>
&gt;&gt; Alex<br>
&gt;&gt;<br>
&gt;&gt; On Tue, 28 Mar 2023 at 20:14, Alexander Kanavin via<br>
&gt;&gt; <a href=3D"http://lists.openembedded.org" rel=3D"noreferrer norefe=
rrer" target=3D"_blank">lists.openembedded.org</a> &lt;alex.kanavin=3D<a hr=
ef=3D"mailto:gmail.com@lists.openembedded.org" target=3D"_blank" rel=3D"nor=
eferrer">gmail.com@lists.openembedded.org</a>&gt;<br>
&gt;&gt; wrote:<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Would you be able to read the failing test, and replicate the=
 steps it<br>
&gt;&gt; &gt; does by hand? If we can narrow down the precise point where i=
t fails,<br>
&gt;&gt; &gt; that would already help.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Alex<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; On Tue, 28 Mar 2023 at 20:01, Fr=C3=A9d=C3=A9ric Martinsons<b=
r>
&gt;&gt; &gt; &lt;<a href=3D"mailto:frederic.martinsons@gmail.com" target=
=3D"_blank" rel=3D"noreferrer">frederic.martinsons@gmail.com</a>&gt; wrote:=
<br>
&gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt; &gt; I rebuilt a poky master from scratch on another machine =
(Ubuntu 22.04 , 16 Xeon, 124 Gb RAM), it took<br>
&gt;&gt; &gt; &gt;=C2=A0 2h30mn to finish (note that rust-llvm-native and l=
lvm-native both took around 1h each to be built).<br>
&gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt; &gt; I have two questions for my curiosity:<br>
&gt;&gt; &gt; &gt;=C2=A0 =C2=A0 - why rust things (cargo-native, librsvg)=
=C2=A0 are the last artifacts built on core-image-sato ? it seems strange a=
t first look<br>
&gt;&gt; &gt; &gt; (but may be explained by packages embedded by this image=
, I didn&#39;t look on what are the dependencies of this image)<br>
&gt;&gt; &gt; &gt;=C2=A0 =C2=A0 - my pristine BDIR took around 90 GB , mayb=
e the page <a href=3D"https://docs.yoctoproject.org/dev/brief-yoctoprojectq=
s/index.html" rel=3D"noreferrer noreferrer" target=3D"_blank">https://docs.=
yoctoproject.org/dev/brief-yoctoprojectqs/index.html</a> stating<br>
&gt;&gt; &gt; &gt; that we need 50 GB of free space needs to be reviewed (u=
nless it was written with another image than core-image-sato in mind) ?<br>
&gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt; &gt; Apart from that,=C2=A0 I have the exact same error on te=
st_devtool_modify_git that I had on the other machine under /var build dir:=
<br>
&gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt; &gt; NOTE: Running setscene task 210 of 213 (virtual:native:/=
tmp/devtoolqacvbsfqx2/core-copy/meta/recipes-devtools/gnu-config/gnu-config=
_git.bb:do_populate_sysroot_setscene)<br>
&gt;&gt; &gt; &gt; NOTE: recipe gnu-config-native-20230216+gitAUTOINC+63acb=
96f92-r0: task do_populate_sysroot_setscene: Started<br>
&gt;&gt; &gt; &gt; NOTE: recipe gnu-config-native-20230216+gitAUTOINC+63acb=
96f92-r0: task do_populate_sysroot_setscene: Succeeded<br>
&gt;&gt; &gt; &gt; NOTE: Running task 896 of 918 (/tmp/devtoolqacvbsfqx2/co=
re-copy/meta/recipes-core/psplash/psplash_git.bb:do_prepare_recipe_sysroot)=
<br>
&gt;&gt; &gt; &gt; NOTE: recipe psplash-0.1+git999-r0: task do_prepare_reci=
pe_sysroot: Started<br>
&gt;&gt; &gt; &gt; NOTE: recipe psplash-0.1+git999-r0: task do_prepare_reci=
pe_sysroot: Succeeded<br>
&gt;&gt; &gt; &gt; NOTE: Running task 910 of 918 (/tmp/devtoolqacvbsfqx2/co=
re-copy/meta/recipes-core/psplash/psplash_git.bb:do_configure)<br>
&gt;&gt; &gt; &gt; NOTE: recipe psplash-0.1+git999-r0: task do_configure: S=
tarted<br>
&gt;&gt; &gt; &gt; ERROR: psplash-0.1+git999-r0 do_configure: no configure =
script found at ../../../../../../../../../../../tmp/devtoolqamf2smwsy/conf=
igure<br>
&gt;&gt; &gt; &gt; ERROR: psplash-0.1+git999-r0 do_configure: ExecutionErro=
r(&#39;/home/jenkins/yocto-poky-master/poky/build-st/tmp/work/core2-64-poky=
-linux/psplash/0.1+git999-r0/temp/run.do_configure.1967375&#39;, 1, None, N=
one)<br>
&gt;&gt; &gt; &gt; ERROR: Logfile of failure stored in: /home/jenkins/yocto=
-poky-master/poky/build-st/tmp/work/core2-64-poky-linux/psplash/0.1+git999-=
r0/temp/log.do_configure.1967375<br>
&gt;&gt; &gt; &gt; NOTE: recipe psplash-0.1+git999-r0: task do_configure: F=
ailed<br>
&gt;&gt; &gt; &gt; ERROR: Task (/tmp/devtoolqacvbsfqx2/core-copy/meta/recip=
es-core/psplash/psplash_git.bb:do_configure) failed with exit code &#39;1&#=
39;<br>
&gt;&gt; &gt; &gt; NOTE: Tasks Summary: Attempted 910 tasks of which 904 di=
dn&#39;t need to be rerun and 1 failed.<br>
&gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt; &gt; Full test log joined (I would like to join also the log =
of do_configure step but it seems that the test do a cleanall of the recipe=
 during its tear down method)<br>
&gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt; &gt; I&#39;m kind of stuck here since I cannot develop more o=
e-selftest tests if I didn&#39;t even manage to make the existing ones succ=
eed.<br>
&gt;&gt; &gt; &gt; Can someone give me the setup of this autobuilder where =
Alexander talked about ?<br>
&gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt; &gt; I could try to get as close as possible to the autobuild=
er setup if the oe-selftest is ok there.<br>
&gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt; &gt; On Tue, 28 Mar 2023 at 17:36, Fr=C3=A9d=C3=A9ric Martins=
ons &lt;<a href=3D"mailto:frederic.martinsons@gmail.com" target=3D"_blank" =
rel=3D"noreferrer">frederic.martinsons@gmail.com</a>&gt; wrote:<br>
&gt;&gt; &gt; &gt;&gt;<br>
&gt;&gt; &gt; &gt;&gt; Note that I managed to build libtirpc-native and sha=
dow-native with bitbake (and the same setup).<br>
&gt;&gt; &gt; &gt;&gt;<br>
&gt;&gt; &gt; &gt;&gt; I currently try the build on another machine and und=
er /home.<br>
&gt;&gt; &gt; &gt;&gt;<br>
&gt;&gt; &gt; &gt;&gt; I&#39;ll tell you the results soon<br>
&gt;&gt; &gt; &gt;&gt;<br>
&gt;&gt; &gt; &gt;&gt; Le mar. 28 mars 2023, 15:13, Richard Purdie &lt;<a h=
ref=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_blank" rel=3D"=
noreferrer">richard.purdie@linuxfoundation.org</a>&gt; a =C3=A9crit :<br>
&gt;&gt; &gt; &gt;&gt;&gt;<br>
&gt;&gt; &gt; &gt;&gt;&gt; On Tue, 2023-03-28 at 14:40 +0200, Fr=C3=A9d=C3=
=A9ric Martinsons wrote:<br>
&gt;&gt; &gt; &gt;&gt;&gt; &gt; I just finished a pristine build of core-im=
age-sato on poky master,<br>
&gt;&gt; &gt; &gt;&gt;&gt; &gt; and set up SSTATE_DIR in my local.conf.<br>
&gt;&gt; &gt; &gt;&gt;&gt; &gt; Tests are now ok, I can start to write some=
 now.<br>
&gt;&gt; &gt; &gt;&gt;&gt; &gt;<br>
&gt;&gt; &gt; &gt;&gt;&gt; &gt; If anyone is interested , please find attac=
hed the full log of the<br>
&gt;&gt; &gt; &gt;&gt;&gt; &gt; two first failures.<br>
&gt;&gt; &gt; &gt;&gt;&gt;<br>
&gt;&gt; &gt; &gt;&gt;&gt; Having the errors helps, thanks.<br>
&gt;&gt; &gt; &gt;&gt;&gt;<br>
&gt;&gt; &gt; &gt;&gt;&gt; The short summary is these two lines:<br>
&gt;&gt; &gt; &gt;&gt;&gt;<br>
&gt;&gt; &gt; &gt;&gt;&gt; libtirpc-native<br>
&gt;&gt; &gt; &gt;&gt;&gt; | chown: changing ownership of &#39;/var/lib/jen=
kins/YOCTO_POKY_MASTER_TEST/poky/build-st/tmp/work/x86_64-linux/libtirpc-na=
tive/1.3.3-r0/image/var/lib/jenkins/YOCTO_POKY_MASTER_TEST/poky/build-st/tm=
p/work/x86_64-linux/libtirpc-native/1.3.3-r0/recipe-sysroot-native/etc/netc=
onfig&#39;: Invalid argument<br>
&gt;&gt; &gt; &gt;&gt;&gt;<br>
&gt;&gt; &gt; &gt;&gt;&gt; shadow-native<br>
&gt;&gt; &gt; &gt;&gt;&gt; | chown: changing ownership of &#39;/var/lib/jen=
kins/YOCTO_POKY_MASTER_TEST/poky/build-st/tmp/work/x86_64-linux/shadow-nati=
ve/4.13-r0/image/var/lib/jenkins/YOCTO_POKY_MASTER_TEST/poky/build-st/tmp/w=
ork/x86_64-linux/shadow-native/4.13-r0/recipe-sysroot-native/var/spool/mail=
&#39;: Invalid argument<br>
&gt;&gt; &gt; &gt;&gt;&gt;<br>
&gt;&gt; &gt; &gt;&gt;&gt;<br>
&gt;&gt; &gt; &gt;&gt;&gt; I&#39;m wondering if the fact the build is under=
 /var might be triggering<br>
&gt;&gt; &gt; &gt;&gt;&gt; something somehow...<br>
&gt;&gt; &gt; &gt;&gt;&gt;<br>
&gt;&gt; &gt; &gt;&gt;&gt; Cheers,<br>
&gt;&gt; &gt; &gt;&gt;&gt;<br>
&gt;&gt; &gt; &gt;&gt;&gt; Richard<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;&gt; &gt; Links: You receive all messages sent to this group.<br>
&gt;&gt; &gt; View/Reply Online (#179243): <a href=3D"https://lists.openemb=
edded.org/g/openembedded-core/message/179243" rel=3D"noreferrer noreferrer"=
 target=3D"_blank">https://lists.openembedded.org/g/openembedded-core/messa=
ge/179243</a><br>
&gt;&gt; &gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt=
/97900549/1686489" rel=3D"noreferrer noreferrer" target=3D"_blank">https://=
lists.openembedded.org/mt/97900549/1686489</a><br>
&gt;&gt; &gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@list=
s.openembedded.org" target=3D"_blank" rel=3D"noreferrer">openembedded-core+=
owner@lists.openembedded.org</a><br>
&gt;&gt; &gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/open=
embedded-core/unsub" rel=3D"noreferrer noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:a=
lex.kanavin@gmail.com" target=3D"_blank" rel=3D"noreferrer">alex.kanavin@gm=
ail.com</a>]<br>
&gt;&gt; &gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;&gt; &gt;<br>
</blockquote></div>

--000000000000dde37205f804a4a4--

