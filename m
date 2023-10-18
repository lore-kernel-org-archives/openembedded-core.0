Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84744CDB47E
	for <webhook@archiver.kernel.org>; Wed, 18 Oct 2023 09:26:25 +0000 (UTC)
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com [209.85.217.43])
 by mx.groups.io with SMTP id smtpd.web10.277857.1697621184672665492
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Oct 2023 02:26:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gOqCs8X5;
 spf=pass (domain: gmail.com, ip: 209.85.217.43, mailfrom: quaresma.jose@gmail.com)
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-457c057bdb5so2204130137.0
        for <openembedded-core@lists.openembedded.org>; Wed, 18 Oct 2023 02:26:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697621184; x=1698225984; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=c/T6DsY338X3cmWFUbO+ZlSxLy8JIKA/QRhQI0+9ujY=;
        b=gOqCs8X5tt8cyKS0cVb6CtDzy8Xe1euMqsrjUlKSbxOY6aFR6bYjr1wKg8U28DJlqR
         FiiJzmhPcg1CdAIVSzXFlA1sgl0/RoPKM9ORw6pEN7Es5hosvHiU1i79u6ztI4Da4IMU
         uP68rh0vWA5y6HXIbiQruFpRHQHH7C1MAYKqHcNi7gcLNhurB8t/OYda3PO3w0zQ5Ylq
         sxqCQ27CQUUyT+12q3s1yGhs9bavWjVCR1fu0Z1Qo0Va8oA+TsFnvZSVVw/uLw6CP6Lv
         Aw83PxUSvDkGkyl9ONBMXWOTdl9pKHck1KPUzOqZvbg1kXEkQH/FjeZrmUXQVxn7A4Id
         rlTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697621184; x=1698225984;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c/T6DsY338X3cmWFUbO+ZlSxLy8JIKA/QRhQI0+9ujY=;
        b=kMmTmK3Vz+LPE5KMK7QNCZBE5AXonfQ4uaO8jOl8M7042aRKtNh0tpNE0Wt3RH0qOw
         q6zJa0o4xFTnTWMxTpV4gHw/ryJQNIGCakKInsu4hANOE1lUsYnfblSBEYXnpiLIWCcn
         2jlyauIeysZ/s/mBgFkQ7wN2np2r+tkICgfGIDB7Otoa4qIMFQEtlBeOjVXpg1NzyLgI
         R6qUu3ZIWiYlVoGO18KE5zU906KPF7L4o9jlgLZaAR7AhHmwHMMSBx/YVjF0QCmyCCYB
         5qrIguEUNoN295+xLHxn6BJfxDCmfb4gdWQ500rELAdUJuDNSDaZybBt3a33F04lef7u
         RBnQ==
X-Gm-Message-State: AOJu0YyHg7XUHIi/LjRY5wXeUEPZA2tldaNXMtNbti35ycDjaKaVYLV7
	TC9sHE64uzYl76eFVQ8edyn5J/Yt51Lnx6mlGwM=
X-Google-Smtp-Source: AGHT+IGVBQaExTNAlrQj4H0TvqLAtoqgnNdR0jzFE+wvzvPIJNAiuFWhVLXXY0wEm7S6yRtC6qB3yYtoKnqPCXzzeeE=
X-Received: by 2002:a05:6102:1143:b0:452:6b50:1e7e with SMTP id
 j3-20020a056102114300b004526b501e7emr4008557vsg.35.1697621183614; Wed, 18 Oct
 2023 02:26:23 -0700 (PDT)
MIME-Version: 1.0
References: <20231016-b4-systemd-tpm2-crypt-plugin-v1-1-21fef10601ff@linaro.org>
 <CANPvuRk9GopD1yCbmSPk_pS1M=bC8drdAefYSpJ95cEQBq6Wdw@mail.gmail.com>
 <CWAHA5EQL45Z.3HPZNQBIRGUUL@ablu-work> <CANPvuRnyvniBMEhWU2Jzrd4scx=1K4PkMy8w2VG3y8MSB4Bv8w@mail.gmail.com>
 <CWBCTF54QUSS.3DJVMJ9KMORGK@ablu-work>
In-Reply-To: <CWBCTF54QUSS.3DJVMJ9KMORGK@ablu-work>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Wed, 18 Oct 2023 10:26:12 +0100
Message-ID: <CANPvuR=KEWP1Mqw1q+co7hRTP61QNphj48N7mVNPjXFBHqZZqw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] systemd: fix packaging tpm2 plugin for cryptsetup
To: Erik Schilling <erik.schilling@linaro.org>
Cc: openembedded-core@lists.openembedded.org, 
	Kristian Klausen <kristian@klausen.dk>, Mikko Rapeli <mikko.rapeli@linaro.org>, 
	Javier Tia <javier.tia@linaro.org>
Content-Type: multipart/alternative; boundary="0000000000009cd6c20607fa3b12"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Oct 2023 09:26:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189372

--0000000000009cd6c20607fa3b12
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Erik Schilling <erik.schilling@linaro.org> escreveu no dia quarta,
18/10/2023 =C3=A0(s) 07:33:

> On Tue Oct 17, 2023 at 10:51 AM CEST, Jose Quaresma wrote:
> > Hi Erik,
> >
> > Erik Schilling <erik.schilling@linaro.org> escreveu no dia ter=C3=A7a,
> > 17/10/2023 =C3=A0(s) 06:51:
> >
> > > On Mon Oct 16, 2023 at 6:31 PM CEST, Jose Quaresma wrote:
> > > > Erik Schilling <erik.schilling@linaro.org> escreveu no dia segunda,
> > > > 16/10/2023 =C3=A0(s) 13:02:
> > > >
> > > > > When building with `cryptsetup` and `tpm2` in the
> > > > > PACKAGECONFIG, this plugin will be emitted.
> > > > >
> > > > > Cc: Kristian Klausen <kristian@klausen.dk>
> > > > > Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
> > > > > Cc: Javier Tia <javier.tia@linaro.org>
> > > > > Fixes: 7b7dfbfaed ("systemd: Add tpm2 PACKAGECONFIG")
> > > > > Signed-off-by: Erik Schilling <erik.schilling@linaro.org>
> > > > > ---
> > > > >  meta/recipes-core/systemd/systemd_254.4.bb | 1 +
> > > > >  1 file changed, 1 insertion(+)
> > > > >
> > > > > diff --git a/meta/recipes-core/systemd/systemd_254.4.bb
> > > > > b/meta/recipes-core/systemd/systemd_254.4.bb
> > > > > index 77724eb822..6ecfbaf293 100644
> > > > > --- a/meta/recipes-core/systemd/systemd_254.4.bb
> > > > > +++ b/meta/recipes-core/systemd/systemd_254.4.bb
> > > > > @@ -645,6 +645,7 @@ FILES:${PN} =3D " ${base_bindir}/* \
> > > > >                  ${sysconfdir}/X11/xinit/xinitrc.d/* \
> > > > >                  ${rootlibexecdir}/systemd/* \
> > > > >                  ${rootlibdir}/systemd/libsystemd-core* \
> > > > > +
> > > > > ${rootlibdir}/cryptsetup/libcryptsetup-token-systemd-tpm2* \
> > > > >
> > > >
> > > > The systemd-cryptenroll was packed in the systemd-extra-utils so
> packing
> > > > the plugin
> > > > on the main systemd package is a bit weird.
> > > > I wonder if a new package like systemd-crypt is better appropriate
> for
> > > this
> > > > where we
> > > > going to put the systemd-cryptenroll and all the plugins available =
in
> > > > ${rootlibdir}/cryptsetup
> > >
> > > Ah, did not realize that... I agree that breaking up systemd into
> > > smaller packages would probably be a good thing. Currently building a=
n
> > > image with systemd in the initramfs and main image gives little choic=
e
> > > over which components go where... I will try a systemd-crypt variant.
> > > Will also take a look at how other distros solve this.
> > >
> >
> > I've been using this systemd-crypt package on my distro for some time n=
ow
> > but I've forgotten to send it.
> > In this package additionally to the TPM plugin I also have another for
> the
> > PKVS#11.
> > I have all of these in a bbappend and I can easily extract.
>
>
> Ah that sounds great!
>
>
> > So you don't have to worry, I still do it today.
>
> Sorry, I do not understand what you mean here. Did you mean that you
> plan to send a patch?
>

I apologize for not being clear. I sent the patch serie yesterday
[1] https://patchwork.yoctoproject.org/project/oe-core/list/?series=3D17834


>
> - Erik
>
> > > >
> > > >                  ${libdir}/pam.d \
> > > > >                  ${nonarch_libdir}/pam.d \
> > > > >                  ${systemd_unitdir}/* \
> > > > >
> > > > > ---
> > > > > base-commit: 97f0a73c0a9db5506310328cd29f165eab3c509d
> > > > > change-id: 20231016-b4-systemd-tpm2-crypt-plugin-5064c458e726
> > > > >
> > > > > Best regards,
> > > > > --
> > > > > Erik Schilling <erik.schilling@linaro.org>
> > > > >
> > > > >
> > > > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > > > > Links: You receive all messages sent to this group.
> > > > > View/Reply Online (#189288):
> > > > > https://lists.openembedded.org/g/openembedded-core/message/189288
> > > > > Mute This Topic:
> https://lists.openembedded.org/mt/101993740/5052612
> > > > > Group Owner: openembedded-core+owner@lists.openembedded.org
> > > > > Unsubscribe:
> https://lists.openembedded.org/g/openembedded-core/unsub
> > > [
> > > > > quaresma.jose@gmail.com]
> > > > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > > > >
> > > > >
> > >
> > >
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--0000000000009cd6c20607fa3b12
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Erik Schilling &lt;<a href=3D"mailto:=
erik.schilling@linaro.org" target=3D"_blank">erik.schilling@linaro.org</a>&=
gt; escreveu no dia quarta, 18/10/2023 =C3=A0(s) 07:33:<br></div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex">On Tue Oct 17, 2023 at 10:51 AM CES=
T, Jose Quaresma wrote:<br>
&gt; Hi Erik,<br>
&gt;<br>
&gt; Erik Schilling &lt;<a href=3D"mailto:erik.schilling@linaro.org" target=
=3D"_blank">erik.schilling@linaro.org</a>&gt; escreveu no dia ter=C3=A7a,<b=
r>
&gt; 17/10/2023 =C3=A0(s) 06:51:<br>
&gt;<br>
&gt; &gt; On Mon Oct 16, 2023 at 6:31 PM CEST, Jose Quaresma wrote:<br>
&gt; &gt; &gt; Erik Schilling &lt;<a href=3D"mailto:erik.schilling@linaro.o=
rg" target=3D"_blank">erik.schilling@linaro.org</a>&gt; escreveu no dia seg=
unda,<br>
&gt; &gt; &gt; 16/10/2023 =C3=A0(s) 13:02:<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; When building with `cryptsetup` and `tpm2` in the<br>
&gt; &gt; &gt; &gt; PACKAGECONFIG, this plugin will be emitted.<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; Cc: Kristian Klausen &lt;<a href=3D"mailto:kristian@kla=
usen.dk" target=3D"_blank">kristian@klausen.dk</a>&gt;<br>
&gt; &gt; &gt; &gt; Cc: Mikko Rapeli &lt;<a href=3D"mailto:mikko.rapeli@lin=
aro.org" target=3D"_blank">mikko.rapeli@linaro.org</a>&gt;<br>
&gt; &gt; &gt; &gt; Cc: Javier Tia &lt;<a href=3D"mailto:javier.tia@linaro.=
org" target=3D"_blank">javier.tia@linaro.org</a>&gt;<br>
&gt; &gt; &gt; &gt; Fixes: 7b7dfbfaed (&quot;systemd: Add tpm2 PACKAGECONFI=
G&quot;)<br>
&gt; &gt; &gt; &gt; Signed-off-by: Erik Schilling &lt;<a href=3D"mailto:eri=
k.schilling@linaro.org" target=3D"_blank">erik.schilling@linaro.org</a>&gt;=
<br>
&gt; &gt; &gt; &gt; ---<br>
&gt; &gt; &gt; &gt;=C2=A0 meta/recipes-core/systemd/<a href=3D"http://syste=
md_254.4.bb" rel=3D"noreferrer" target=3D"_blank">systemd_254.4.bb</a> | 1 =
+<br>
&gt; &gt; &gt; &gt;=C2=A0 1 file changed, 1 insertion(+)<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; diff --git a/meta/recipes-core/systemd/<a href=3D"http:=
//systemd_254.4.bb" rel=3D"noreferrer" target=3D"_blank">systemd_254.4.bb</=
a><br>
&gt; &gt; &gt; &gt; b/meta/recipes-core/systemd/<a href=3D"http://systemd_2=
54.4.bb" rel=3D"noreferrer" target=3D"_blank">systemd_254.4.bb</a><br>
&gt; &gt; &gt; &gt; index 77724eb822..6ecfbaf293 100644<br>
&gt; &gt; &gt; &gt; --- a/meta/recipes-core/systemd/<a href=3D"http://syste=
md_254.4.bb" rel=3D"noreferrer" target=3D"_blank">systemd_254.4.bb</a><br>
&gt; &gt; &gt; &gt; +++ b/meta/recipes-core/systemd/<a href=3D"http://syste=
md_254.4.bb" rel=3D"noreferrer" target=3D"_blank">systemd_254.4.bb</a><br>
&gt; &gt; &gt; &gt; @@ -645,6 +645,7 @@ FILES:${PN} =3D &quot; ${base_bindi=
r}/* \<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 ${sysconfdir}/X11/xinit/xinitrc.d/* \<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 ${rootlibexecdir}/systemd/* \<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 ${rootlibdir}/systemd/libsystemd-core* \<br>
&gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; ${rootlibdir}/cryptsetup/libcryptsetup-token-systemd-tp=
m2* \<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; The systemd-cryptenroll was packed in the systemd-extra-util=
s so packing<br>
&gt; &gt; &gt; the plugin<br>
&gt; &gt; &gt; on the main systemd package is a bit weird.<br>
&gt; &gt; &gt; I wonder if a new package like systemd-crypt is better appro=
priate for<br>
&gt; &gt; this<br>
&gt; &gt; &gt; where we<br>
&gt; &gt; &gt; going to put the systemd-cryptenroll and all the plugins ava=
ilable in<br>
&gt; &gt; &gt; ${rootlibdir}/cryptsetup<br>
&gt; &gt;<br>
&gt; &gt; Ah, did not realize that... I agree that breaking up systemd into=
<br>
&gt; &gt; smaller packages would probably be a good thing. Currently buildi=
ng an<br>
&gt; &gt; image with systemd in the initramfs and main image gives little c=
hoice<br>
&gt; &gt; over which components go where... I will try a systemd-crypt vari=
ant.<br>
&gt; &gt; Will also take a look at how other distros solve this.<br>
&gt; &gt;<br>
&gt;<br>
&gt; I&#39;ve been using this systemd-crypt package on my distro for some t=
ime now<br>
&gt; but I&#39;ve forgotten to send it.<br>
&gt; In this package additionally to the TPM plugin I also have another for=
 the<br>
&gt; PKVS#11.<br>
&gt; I have all of these in a bbappend and I can easily extract.<br>
<br>
<br>
Ah that sounds great!<br>
<br>
<br>
&gt; So you don&#39;t have to worry, I still do it today.<br>
<br>
Sorry, I do not understand what you mean here. Did you mean that you<br>
plan to send a patch?<br></blockquote><div><br></div><div>I apologize for n=
ot being clear. I sent the patch serie yesterday=C2=A0</div><div>[1] <a hre=
f=3D"https://patchwork.yoctoproject.org/project/oe-core/list/?series=3D1783=
4">https://patchwork.yoctoproject.org/project/oe-core/list/?series=3D17834<=
/a><br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">
<br>
- Erik<br>
<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 ${libdir}/pam.d \<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 ${nonarch_libdir}/pam.d \<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 ${systemd_unitdir}/* \<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; ---<br>
&gt; &gt; &gt; &gt; base-commit: 97f0a73c0a9db5506310328cd29f165eab3c509d<b=
r>
&gt; &gt; &gt; &gt; change-id: 20231016-b4-systemd-tpm2-crypt-plugin-5064c4=
58e726<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; Best regards,<br>
&gt; &gt; &gt; &gt; --<br>
&gt; &gt; &gt; &gt; Erik Schilling &lt;<a href=3D"mailto:erik.schilling@lin=
aro.org" target=3D"_blank">erik.schilling@linaro.org</a>&gt;<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; &gt; &gt; &gt; Links: You receive all messages sent to this group.<br>
&gt; &gt; &gt; &gt; View/Reply Online (#189288):<br>
&gt; &gt; &gt; &gt; <a href=3D"https://lists.openembedded.org/g/openembedde=
d-core/message/189288" rel=3D"noreferrer" target=3D"_blank">https://lists.o=
penembedded.org/g/openembedded-core/message/189288</a><br>
&gt; &gt; &gt; &gt; Mute This Topic: <a href=3D"https://lists.openembedded.=
org/mt/101993740/5052612" rel=3D"noreferrer" target=3D"_blank">https://list=
s.openembedded.org/mt/101993740/5052612</a><br>
&gt; &gt; &gt; &gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowne=
r@lists.openembedded.org" target=3D"_blank">openembedded-core+owner@lists.o=
penembedded.org</a><br>
&gt; &gt; &gt; &gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/=
g/openembedded-core/unsub" rel=3D"noreferrer" target=3D"_blank">https://lis=
ts.openembedded.org/g/openembedded-core/unsub</a><br>
&gt; &gt; [<br>
&gt; &gt; &gt; &gt; <a href=3D"mailto:quaresma.jose@gmail.com" target=3D"_b=
lank">quaresma.jose@gmail.com</a>]<br>
&gt; &gt; &gt; &gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt;<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr">Best regards,<div><br>Jos=C3=A9 Quaresma</div></div></div></=
div>

--0000000000009cd6c20607fa3b12--

