Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65F76C41513
	for <webhook@archiver.kernel.org>; Wed, 11 Oct 2023 21:54:34 +0000 (UTC)
Received: from mail-io1-f45.google.com (mail-io1-f45.google.com [209.85.166.45])
 by mx.groups.io with SMTP id smtpd.web11.29348.1697061271567993170
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Oct 2023 14:54:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=N5AR7pEs;
 spf=pass (domain: gmail.com, ip: 209.85.166.45, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-io1-f45.google.com with SMTP id ca18e2360f4ac-79faf4210b2so13656039f.2
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Oct 2023 14:54:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697061271; x=1697666071; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=FeKflAcOpLMc/P7BtcFftJKz+PwAG0SIsSk9XOoHiFY=;
        b=N5AR7pEsm2MWNz2yNy8ycLdNN7vd0kLkHNEMgocdGMcCJvu8R32ElZXQQU0sp1XuGD
         I4DuQrZKF6f6hQhAO5X1Pt+oy3wi3t1FklTB1iR5SBJ2ofk+IbpXz2rvl98DSfIu6kTX
         XBW76a0NVelfhcvBCzG3WWLAies8NtJHicnqgm5r9xdL5Ufvyas6gE3MYDE5bHDqym6R
         ITQSw1C3FswchnulEsmy11/DZays+In4fdba/5KBC7ZCFd7uC04NVFmB5rmjoJUohrFI
         Hr18wv3Nm8fI8x+MvczEUa2A76sT2R3oMdWamul/WM7/cOcIeJ9avhyUQ26mPgPeeVOQ
         rErg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697061271; x=1697666071;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FeKflAcOpLMc/P7BtcFftJKz+PwAG0SIsSk9XOoHiFY=;
        b=MSzpvHE9dmpp8t1PhlNOEdh4tQMCqkysKX9SujqpQ6OYGkClifEPy4Tb2GE9MP/kk/
         S/t/k/caWcwmcMPKfimwmDk5swNVOrKKwXchJNu+SO7C1y5lbWZqvX4uFAt0bg7QJwFA
         yYQqg2tfh6ymZ151fkvs8Jw4d70vq5uoHHt/DJxDbQQPOE+RjQIhD/3Fe2Xo8V8/G+gA
         KocExNPqhhYXmWJfnhYYbdB85xFLqaITlsJ2PgT6X4FMbzxJv0GHbwghldOItvkDe1HA
         SS/G9qlzEetVEjseJbn5gXfE7EOv5Y3tVvp+v7yxoMH2LeeQnkhXSB3EWvzmH7ux917t
         WXmg==
X-Gm-Message-State: AOJu0Yx0b5emCLJTMyIvB901fCeci6cS082tl/gU+O5Ltvc1jm79rv4P
	xkctV8MAypVVLJrWj+nXLwnmQW8qGni8voU07hs=
X-Google-Smtp-Source: AGHT+IE6ruFRUv9KhSlmw4liNCOqVchIhcLr94HRure1jhMxdwyINuPRfOleNeZ7ckwkb8nW0Z2KmuvvHyoOOULaQ3Y=
X-Received: by 2002:a6b:d806:0:b0:795:1c40:a24e with SMTP id
 y6-20020a6bd806000000b007951c40a24emr26664561iob.12.1697061270696; Wed, 11
 Oct 2023 14:54:30 -0700 (PDT)
MIME-Version: 1.0
References: <20231006113641.3248432-1-richard.purdie@linuxfoundation.org>
 <20231006113641.3248432-2-richard.purdie@linuxfoundation.org>
 <8f92775b-e01e-4505-9fba-252ddd1a8315@linux.microsoft.com> <474cb08bfb46afd366961f474f7984a9f9836feb.camel@linuxfoundation.org>
In-Reply-To: <474cb08bfb46afd366961f474f7984a9f9836feb.camel@linuxfoundation.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 11 Oct 2023 17:54:22 -0400
Message-ID: <CADkTA4POKqowjUFMmqTRostqiu6kV0F07jy3oXZrc3YH=sxpaQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] qemux86/qemuarm: Drop kernel version overrides
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Alejandro Enedino Hernandez Samaniego <alhe@linux.microsoft.com>, openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000033b6ff060777de14"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Oct 2023 21:54:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188973

--00000000000033b6ff060777de14
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 11, 2023 at 5:39=E2=80=AFPM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Tue, 2023-10-10 at 19:11 -0600, Alejandro Enedino Hernandez
> Samaniego wrote:
> >
> >
> >
> >
> > On 10/6/23 05:36, Richard Purdie wrote:
> >
> >
> > >
> > > Drop the version overrides for the kernel for the x86 and arm
> > > machines
> > > so we can go back to following the distro versions. The reasons for
> > > these versions is mostly historical at this point as the issues
> > > were
> > > resolved.
> > >
> > > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > > ---
> > >  meta/conf/machine/include/x86/x86-base.inc | 1 -
> > >  meta/conf/machine/qemuarm.conf             | 4 ----
> > >  meta/conf/machine/qemuarmv5.conf           | 1 -
> > >  3 files changed, 6 deletions(-)
> > >
> > > diff --git a/meta/conf/machine/include/x86/x86-base.inc
> > > b/meta/conf/machine/include/x86/x86-base.inc
> > > index 050c20af70c..fc6c39148db 100644
> > > --- a/meta/conf/machine/include/x86/x86-base.inc
> > > +++ b/meta/conf/machine/include/x86/x86-base.inc
> > > @@ -18,7 +18,6 @@ SERIAL_CONSOLES ?=3D "115200;ttyS0"
> > >  # kernel-related variables
> > >  #
> > >  PREFERRED_PROVIDER_virtual/kernel ??=3D "linux-yocto"
> > > -PREFERRED_VERSION_linux-yocto ??=3D "6.4%"
> > >
> > >  #
> > >  # XSERVER subcomponents, used to build the XSERVER variable
> > > diff --git a/meta/conf/machine/qemuarm.conf
> > > b/meta/conf/machine/qemuarm.conf
> > > index 04216cdc2e0..881733eb2da 100644
> > > --- a/meta/conf/machine/qemuarm.conf
> > > +++ b/meta/conf/machine/qemuarm.conf
> > > @@ -28,8 +28,4 @@ QB_ROOTFS_OPT =3D "-drive
> > > id=3Ddisk0,file=3D@ROOTFS@,if=3Dnone,format=3Draw -device virtio
> > >  QB_SERIAL_OPT =3D "-device virtio-serial-device -chardev
> > > null,id=3Dvirtcon -device virtconsole,chardev=3Dvirtcon"
> > >  QB_TCPSERIAL_OPT =3D "-device virtio-serial-device -chardev
> > > socket,id=3Dvirtcon,port=3D@PORT@,host=3D127.0.0.1 -device
> > > virtconsole,chardev=3Dvirtcon"
> > >
> > > -# 6.4 causes Xorg to fail to read the virtio framebuffer so stick
> > > with 6.1 until
> > > -# that is resolved.
> > > -PREFERRED_VERSION_linux-yocto ??=3D "6.1%"
> > > -
> > >  KMACHINE:qemuarm =3D "qemuarma15"
> > > diff --git a/meta/conf/machine/qemuarmv5.conf
> > > b/meta/conf/machine/qemuarmv5.conf
> > > index deb4869c0aa..f0a86f1e4c7 100644
> > > --- a/meta/conf/machine/qemuarmv5.conf
> > > +++ b/meta/conf/machine/qemuarmv5.conf
> > > @@ -16,5 +16,4 @@ QB_GRAPHICS =3D "-device virtio-gpu-pci"
> > >  QB_OPT_APPEND =3D "-device qemu-xhci -device usb-tablet -device usb-
> > > kbd"
> > >  QB_DTB =3D
> > > "${@oe.utils.version_less_or_equal('PREFERRED_VERSION_linux-yocto',
> > > '4.7', '', 'zImage-versatile-pb.dtb', d)}"
> > >
> > >
> >
> > Removing this bit results in the above line causing an
> > ExpansionError, since
> > PREFERRED_VERSION_linux-yocto isnt defined anywhere anymore (if not
> > using poky.conf)
> >
> > What would be the right approach to solve this issue?, Should QB_DTB
> > be depending on such variable?
>
> 4.7 is old enough we can probably just drop the conditional now?
>

Yep, that should be safe. It hasn't changed name or format in quite some
time.

(Although there has been some re-organization in 6.5/6.6 around device
trees, but that shouldn't come into play here).

Bruce



>
> Cheers,
>
> Richard
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#188972):
> https://lists.openembedded.org/g/openembedded-core/message/188972
> Mute This Topic: https://lists.openembedded.org/mt/101795562/1050810
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> bruce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--00000000000033b6ff060777de14
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Wed, Oct 11, 2023 at 5:39=E2=80=AFPM Richard Pur=
die &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org">richard.purdi=
e@linuxfoundation.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">On Tue, 2023-10-10 at 19:11 -0600, Alejandro Enedino H=
ernandez<br>
Samaniego wrote:<br>
&gt; =C2=A0<br>
&gt; <br>
&gt; =C2=A0<br>
&gt; =C2=A0<br>
&gt; On 10/6/23 05:36, Richard Purdie wrote:<br>
&gt; =C2=A0<br>
&gt; =C2=A0<br>
&gt; &gt; =C2=A0<br>
&gt; &gt; Drop the version overrides for the kernel for the x86 and arm<br>
&gt; &gt; machines<br>
&gt; &gt; so we can go back to following the distro versions. The reasons f=
or<br>
&gt; &gt; these versions is mostly historical at this point as the issues<b=
r>
&gt; &gt; were<br>
&gt; &gt; resolved.<br>
&gt; &gt; <br>
&gt; &gt; Signed-off-by: Richard Purdie &lt;<a href=3D"mailto:richard.purdi=
e@linuxfoundation.org" target=3D"_blank">richard.purdie@linuxfoundation.org=
</a>&gt;<br>
&gt; &gt; ---<br>
&gt; &gt; =C2=A0meta/conf/machine/include/x86/x86-base.inc | 1 -<br>
&gt; &gt; =C2=A0meta/conf/machine/qemuarm.conf=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0| 4 ----<br>
&gt; &gt; =C2=A0meta/conf/machine/qemuarmv5.conf=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0| 1 -<br>
&gt; &gt; =C2=A03 files changed, 6 deletions(-)<br>
&gt; &gt; <br>
&gt; &gt; diff --git a/meta/conf/machine/include/x86/x86-base.inc<br>
&gt; &gt; b/meta/conf/machine/include/x86/x86-base.inc<br>
&gt; &gt; index 050c20af70c..fc6c39148db 100644<br>
&gt; &gt; --- a/meta/conf/machine/include/x86/x86-base.inc<br>
&gt; &gt; +++ b/meta/conf/machine/include/x86/x86-base.inc<br>
&gt; &gt; @@ -18,7 +18,6 @@ SERIAL_CONSOLES ?=3D &quot;115200;ttyS0&quot;<b=
r>
&gt; &gt; =C2=A0# kernel-related variables<br>
&gt; &gt; =C2=A0#<br>
&gt; &gt; =C2=A0PREFERRED_PROVIDER_virtual/kernel ??=3D &quot;linux-yocto&q=
uot;<br>
&gt; &gt; -PREFERRED_VERSION_linux-yocto ??=3D &quot;6.4%&quot;<br>
&gt; &gt; =C2=A0<br>
&gt; &gt; =C2=A0#<br>
&gt; &gt; =C2=A0# XSERVER subcomponents, used to build the XSERVER variable=
<br>
&gt; &gt; diff --git a/meta/conf/machine/qemuarm.conf<br>
&gt; &gt; b/meta/conf/machine/qemuarm.conf<br>
&gt; &gt; index 04216cdc2e0..881733eb2da 100644<br>
&gt; &gt; --- a/meta/conf/machine/qemuarm.conf<br>
&gt; &gt; +++ b/meta/conf/machine/qemuarm.conf<br>
&gt; &gt; @@ -28,8 +28,4 @@ QB_ROOTFS_OPT =3D &quot;-drive<br>
&gt; &gt; id=3Ddisk0,file=3D@ROOTFS@,if=3Dnone,format=3Draw -device virtio<=
br>
&gt; &gt; =C2=A0QB_SERIAL_OPT =3D &quot;-device virtio-serial-device -chard=
ev<br>
&gt; &gt; null,id=3Dvirtcon -device virtconsole,chardev=3Dvirtcon&quot;<br>
&gt; &gt; =C2=A0QB_TCPSERIAL_OPT =3D &quot;-device virtio-serial-device -ch=
ardev<br>
&gt; &gt; socket,id=3Dvirtcon,port=3D@PORT@,host=3D127.0.0.1 -device<br>
&gt; &gt; virtconsole,chardev=3Dvirtcon&quot;<br>
&gt; &gt; =C2=A0<br>
&gt; &gt; -# 6.4 causes Xorg to fail to read the virtio framebuffer so stic=
k<br>
&gt; &gt; with 6.1 until<br>
&gt; &gt; -# that is resolved.<br>
&gt; &gt; -PREFERRED_VERSION_linux-yocto ??=3D &quot;6.1%&quot;<br>
&gt; &gt; -<br>
&gt; &gt; =C2=A0KMACHINE:qemuarm =3D &quot;qemuarma15&quot;<br>
&gt; &gt; diff --git a/meta/conf/machine/qemuarmv5.conf<br>
&gt; &gt; b/meta/conf/machine/qemuarmv5.conf<br>
&gt; &gt; index deb4869c0aa..f0a86f1e4c7 100644<br>
&gt; &gt; --- a/meta/conf/machine/qemuarmv5.conf<br>
&gt; &gt; +++ b/meta/conf/machine/qemuarmv5.conf<br>
&gt; &gt; @@ -16,5 +16,4 @@ QB_GRAPHICS =3D &quot;-device virtio-gpu-pci&qu=
ot;<br>
&gt; &gt; =C2=A0QB_OPT_APPEND =3D &quot;-device qemu-xhci -device usb-table=
t -device usb-<br>
&gt; &gt; kbd&quot;<br>
&gt; &gt; =C2=A0QB_DTB =3D<br>
&gt; &gt; &quot;${@oe.utils.version_less_or_equal(&#39;PREFERRED_VERSION_li=
nux-yocto&#39;,<br>
&gt; &gt; &#39;4.7&#39;, &#39;&#39;, &#39;zImage-versatile-pb.dtb&#39;, d)}=
&quot;<br>
&gt; &gt; =C2=A0<br>
&gt; &gt; =C2=A0<br>
&gt; =C2=A0<br>
&gt; Removing this bit results in the above line causing an<br>
&gt; ExpansionError, since<br>
&gt; PREFERRED_VERSION_linux-yocto isnt defined anywhere anymore (if not<br=
>
&gt; using poky.conf)<br>
&gt; <br>
&gt; What would be the right approach to solve this issue?, Should QB_DTB<b=
r>
&gt; be depending on such variable?<br>
<br>
4.7 is old enough we can probably just drop the conditional now?<br></block=
quote><div><br></div><div><div class=3D"gmail_default" style=3D"font-size:s=
mall">Yep, that should be safe. It hasn&#39;t changed name or format in qui=
te some time.</div><div class=3D"gmail_default" style=3D"font-size:small"><=
br></div><div class=3D"gmail_default" style=3D"font-size:small">(Although t=
here has been some re-organization in 6.5/6.6 around device trees, but that=
 shouldn&#39;t come into play here).</div><div class=3D"gmail_default" styl=
e=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D"font-=
size:small">Bruce</div><br></div><div>=C2=A0</div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex">
<br>
Cheers,<br>
<br>
Richard<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#188972): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/188972" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/188972</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/101795562/105=
0810" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/101795562/1050810</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:bruce.ashfield@gmail.com" =
target=3D"_blank">bruce.ashfield@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature">- =
Thou shalt not follow the NULL pointer, for chaos and madness await thee at=
 its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star Trek II<br><b=
r></div></div>

--00000000000033b6ff060777de14--

