Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43519CDB474
	for <webhook@archiver.kernel.org>; Tue, 17 Oct 2023 08:51:37 +0000 (UTC)
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
 by mx.groups.io with SMTP id smtpd.web10.203100.1697532689453000134
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Oct 2023 01:51:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Lat5s0M2;
 spf=pass (domain: gmail.com, ip: 209.85.222.46, mailfrom: quaresma.jose@gmail.com)
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-7b64810aebdso1431277241.2
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Oct 2023 01:51:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697532688; x=1698137488; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9wvhKGzY214t4XO+mgfQmJQRwLlduUzN3s0KVbpKFq8=;
        b=Lat5s0M2eFmvskV1IFdt/+Au2dXNnSYvDckqFPYPJLze2w2WALnftLzI6PG7VIVyGJ
         WEGI/N0LY1DouuE+3VEJ/u0099c2P8fGXKDAzjjLyjMY25uC7j3bDNV/9xQLUONMGKkz
         MYnXp3KCUcquylYvf+rC2N1dTeZo1s2ZtHRuZft57fvdK9kGo3GH14tVQxHNpXMMM5tr
         W5xDvlnVQgFj5WGBO1WX3ozXVcD21PUhkqKIpn2EJ9vtt1N82q2H4ElvCsHU5JDQZHs3
         iYfFh0JmQG8dkXyJvPq9VjeF30d64Pf0O2fsJ7eP/OB9xbVzxs1X3DvlOqSdIEGiVhgT
         f67w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697532688; x=1698137488;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9wvhKGzY214t4XO+mgfQmJQRwLlduUzN3s0KVbpKFq8=;
        b=ah/aQuQL6H9a9p0ejV/lkE6NRBVjFm3IGQYLPvztmfPjx6uCCVP93GwIqKii4VvF3M
         ovMO0/2eTHUeQ+3YMsCcbnh4mIrN1pCKkvsw6zw19D95qcP/np9NVh8HNZA5ROlTPXWa
         VjfSjhAFN5TnJsBZLUkqFuqBhVEcZuZivwKiLK+yGjvPV2M+uNT0YrVmaiZtyd8AqEPL
         IiviZAiyDudg4EWJW2HZMKVw9jxEtztIKNYLRHM2fuI7lc3lN4awarOF9xPElLsSGeuo
         +p/i3bp48WFmiqmQKu8HCfMlsGXJZJTs/60umDtx01ttwYAFzzR9aEQl8z5g6NcQiOd+
         f1Zg==
X-Gm-Message-State: AOJu0Yy/HrAR4FUNrI046ro2rtDVOOzKy1ig9de/3t6jT57O7KZgUrdB
	dOMj4hoNHv5wC8ndJMibtOs5EEb+2T7PRIbEDI8=
X-Google-Smtp-Source: AGHT+IF4s/CnWbs2gkPxYHRruDcIAMuCbizLzUQ0NZJw7ffSMPf0rgk7VhNIK2OSwxHGHWRJzPTUl/KWJbpyfHkEWcg=
X-Received: by 2002:a67:c317:0:b0:457:dbe3:ef45 with SMTP id
 r23-20020a67c317000000b00457dbe3ef45mr1668863vsj.19.1697532687534; Tue, 17
 Oct 2023 01:51:27 -0700 (PDT)
MIME-Version: 1.0
References: <20231016-b4-systemd-tpm2-crypt-plugin-v1-1-21fef10601ff@linaro.org>
 <CANPvuRk9GopD1yCbmSPk_pS1M=bC8drdAefYSpJ95cEQBq6Wdw@mail.gmail.com> <CWAHA5EQL45Z.3HPZNQBIRGUUL@ablu-work>
In-Reply-To: <CWAHA5EQL45Z.3HPZNQBIRGUUL@ablu-work>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Tue, 17 Oct 2023 09:51:16 +0100
Message-ID: <CANPvuRnyvniBMEhWU2Jzrd4scx=1K4PkMy8w2VG3y8MSB4Bv8w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] systemd: fix packaging tpm2 plugin for cryptsetup
To: Erik Schilling <erik.schilling@linaro.org>
Cc: openembedded-core@lists.openembedded.org, 
	Kristian Klausen <kristian@klausen.dk>, Mikko Rapeli <mikko.rapeli@linaro.org>, 
	Javier Tia <javier.tia@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000d5d3ef0607e5a078"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Oct 2023 08:51:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189317

--000000000000d5d3ef0607e5a078
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Erik,

Erik Schilling <erik.schilling@linaro.org> escreveu no dia ter=C3=A7a,
17/10/2023 =C3=A0(s) 06:51:

> On Mon Oct 16, 2023 at 6:31 PM CEST, Jose Quaresma wrote:
> > Erik Schilling <erik.schilling@linaro.org> escreveu no dia segunda,
> > 16/10/2023 =C3=A0(s) 13:02:
> >
> > > When building with `cryptsetup` and `tpm2` in the
> > > PACKAGECONFIG, this plugin will be emitted.
> > >
> > > Cc: Kristian Klausen <kristian@klausen.dk>
> > > Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
> > > Cc: Javier Tia <javier.tia@linaro.org>
> > > Fixes: 7b7dfbfaed ("systemd: Add tpm2 PACKAGECONFIG")
> > > Signed-off-by: Erik Schilling <erik.schilling@linaro.org>
> > > ---
> > >  meta/recipes-core/systemd/systemd_254.4.bb | 1 +
> > >  1 file changed, 1 insertion(+)
> > >
> > > diff --git a/meta/recipes-core/systemd/systemd_254.4.bb
> > > b/meta/recipes-core/systemd/systemd_254.4.bb
> > > index 77724eb822..6ecfbaf293 100644
> > > --- a/meta/recipes-core/systemd/systemd_254.4.bb
> > > +++ b/meta/recipes-core/systemd/systemd_254.4.bb
> > > @@ -645,6 +645,7 @@ FILES:${PN} =3D " ${base_bindir}/* \
> > >                  ${sysconfdir}/X11/xinit/xinitrc.d/* \
> > >                  ${rootlibexecdir}/systemd/* \
> > >                  ${rootlibdir}/systemd/libsystemd-core* \
> > > +
> > > ${rootlibdir}/cryptsetup/libcryptsetup-token-systemd-tpm2* \
> > >
> >
> > The systemd-cryptenroll was packed in the systemd-extra-utils so packin=
g
> > the plugin
> > on the main systemd package is a bit weird.
> > I wonder if a new package like systemd-crypt is better appropriate for
> this
> > where we
> > going to put the systemd-cryptenroll and all the plugins available in
> > ${rootlibdir}/cryptsetup
>
> Ah, did not realize that... I agree that breaking up systemd into
> smaller packages would probably be a good thing. Currently building an
> image with systemd in the initramfs and main image gives little choice
> over which components go where... I will try a systemd-crypt variant.
> Will also take a look at how other distros solve this.
>

I've been using this systemd-crypt package on my distro for some time now
but I've forgotten to send it.
In this package additionally to the TPM plugin I also have another for the
PKVS#11.
I have all of these in a bbappend and I can easily extract.
So you don't have to worry, I still do it today.

Jose


> - Erik
>
> >
> > Jose
> >
> >                  ${libdir}/pam.d \
> > >                  ${nonarch_libdir}/pam.d \
> > >                  ${systemd_unitdir}/* \
> > >
> > > ---
> > > base-commit: 97f0a73c0a9db5506310328cd29f165eab3c509d
> > > change-id: 20231016-b4-systemd-tpm2-crypt-plugin-5064c458e726
> > >
> > > Best regards,
> > > --
> > > Erik Schilling <erik.schilling@linaro.org>
> > >
> > >
> > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > > Links: You receive all messages sent to this group.
> > > View/Reply Online (#189288):
> > > https://lists.openembedded.org/g/openembedded-core/message/189288
> > > Mute This Topic: https://lists.openembedded.org/mt/101993740/5052612
> > > Group Owner: openembedded-core+owner@lists.openembedded.org
> > > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub
> [
> > > quaresma.jose@gmail.com]
> > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > >
> > >
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--000000000000d5d3ef0607e5a078
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Erik,</div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">Erik Schilling &lt;<a href=3D"mailto:erik.sch=
illing@linaro.org">erik.schilling@linaro.org</a>&gt; escreveu no dia ter=C3=
=A7a, 17/10/2023 =C3=A0(s) 06:51:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">On Mon Oct 16, 2023 at 6:31 PM CEST, Jose Quaresma wrote:=
<br>
&gt; Erik Schilling &lt;<a href=3D"mailto:erik.schilling@linaro.org" target=
=3D"_blank">erik.schilling@linaro.org</a>&gt; escreveu no dia segunda,<br>
&gt; 16/10/2023 =C3=A0(s) 13:02:<br>
&gt;<br>
&gt; &gt; When building with `cryptsetup` and `tpm2` in the<br>
&gt; &gt; PACKAGECONFIG, this plugin will be emitted.<br>
&gt; &gt;<br>
&gt; &gt; Cc: Kristian Klausen &lt;<a href=3D"mailto:kristian@klausen.dk" t=
arget=3D"_blank">kristian@klausen.dk</a>&gt;<br>
&gt; &gt; Cc: Mikko Rapeli &lt;<a href=3D"mailto:mikko.rapeli@linaro.org" t=
arget=3D"_blank">mikko.rapeli@linaro.org</a>&gt;<br>
&gt; &gt; Cc: Javier Tia &lt;<a href=3D"mailto:javier.tia@linaro.org" targe=
t=3D"_blank">javier.tia@linaro.org</a>&gt;<br>
&gt; &gt; Fixes: 7b7dfbfaed (&quot;systemd: Add tpm2 PACKAGECONFIG&quot;)<b=
r>
&gt; &gt; Signed-off-by: Erik Schilling &lt;<a href=3D"mailto:erik.schillin=
g@linaro.org" target=3D"_blank">erik.schilling@linaro.org</a>&gt;<br>
&gt; &gt; ---<br>
&gt; &gt;=C2=A0 meta/recipes-core/systemd/<a href=3D"http://systemd_254.4.b=
b" rel=3D"noreferrer" target=3D"_blank">systemd_254.4.bb</a> | 1 +<br>
&gt; &gt;=C2=A0 1 file changed, 1 insertion(+)<br>
&gt; &gt;<br>
&gt; &gt; diff --git a/meta/recipes-core/systemd/<a href=3D"http://systemd_=
254.4.bb" rel=3D"noreferrer" target=3D"_blank">systemd_254.4.bb</a><br>
&gt; &gt; b/meta/recipes-core/systemd/<a href=3D"http://systemd_254.4.bb" r=
el=3D"noreferrer" target=3D"_blank">systemd_254.4.bb</a><br>
&gt; &gt; index 77724eb822..6ecfbaf293 100644<br>
&gt; &gt; --- a/meta/recipes-core/systemd/<a href=3D"http://systemd_254.4.b=
b" rel=3D"noreferrer" target=3D"_blank">systemd_254.4.bb</a><br>
&gt; &gt; +++ b/meta/recipes-core/systemd/<a href=3D"http://systemd_254.4.b=
b" rel=3D"noreferrer" target=3D"_blank">systemd_254.4.bb</a><br>
&gt; &gt; @@ -645,6 +645,7 @@ FILES:${PN} =3D &quot; ${base_bindir}/* \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${s=
ysconfdir}/X11/xinit/xinitrc.d/* \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${r=
ootlibexecdir}/systemd/* \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${r=
ootlibdir}/systemd/libsystemd-core* \<br>
&gt; &gt; +<br>
&gt; &gt; ${rootlibdir}/cryptsetup/libcryptsetup-token-systemd-tpm2* \<br>
&gt; &gt;<br>
&gt;<br>
&gt; The systemd-cryptenroll was packed in the systemd-extra-utils so packi=
ng<br>
&gt; the plugin<br>
&gt; on the main systemd package is a bit weird.<br>
&gt; I wonder if a new package like systemd-crypt is better appropriate for=
 this<br>
&gt; where we<br>
&gt; going to put the systemd-cryptenroll and all the plugins available in<=
br>
&gt; ${rootlibdir}/cryptsetup<br>
<br>
Ah, did not realize that... I agree that breaking up systemd into<br>
smaller packages would probably be a good thing. Currently building an<br>
image with systemd in the initramfs and main image gives little choice<br>
over which components go where... I will try a systemd-crypt variant.<br>
Will also take a look at how other distros solve this.<br></blockquote><div=
><br></div><div>I&#39;ve been using this systemd-crypt package on my distro=
 for some time now but I&#39;ve forgotten to send it.<br>In this package ad=
ditionally to the TPM plugin I also have another for the PKVS#11.<br></div>=
<div>I have all of these in a bbappend and I can easily extract.<br>So you =
don&#39;t have to worry, I still do it today.<br><br>Jose</div><div><br></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
- Erik<br>
<br>
&gt;<br>
&gt; Jose<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${libdir=
}/pam.d \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${n=
onarch_libdir}/pam.d \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${s=
ystemd_unitdir}/* \<br>
&gt; &gt;<br>
&gt; &gt; ---<br>
&gt; &gt; base-commit: 97f0a73c0a9db5506310328cd29f165eab3c509d<br>
&gt; &gt; change-id: 20231016-b4-systemd-tpm2-crypt-plugin-5064c458e726<br>
&gt; &gt;<br>
&gt; &gt; Best regards,<br>
&gt; &gt; --<br>
&gt; &gt; Erik Schilling &lt;<a href=3D"mailto:erik.schilling@linaro.org" t=
arget=3D"_blank">erik.schilling@linaro.org</a>&gt;<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; &gt; Links: You receive all messages sent to this group.<br>
&gt; &gt; View/Reply Online (#189288):<br>
&gt; &gt; <a href=3D"https://lists.openembedded.org/g/openembedded-core/mes=
sage/189288" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedde=
d.org/g/openembedded-core/message/189288</a><br>
&gt; &gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/101=
993740/5052612" rel=3D"noreferrer" target=3D"_blank">https://lists.openembe=
dded.org/mt/101993740/5052612</a><br>
&gt; &gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.op=
enembedded.org" target=3D"_blank">openembedded-core+owner@lists.openembedde=
d.org</a><br>
&gt; &gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembe=
dded-core/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openemb=
edded.org/g/openembedded-core/unsub</a> [<br>
&gt; &gt; <a href=3D"mailto:quaresma.jose@gmail.com" target=3D"_blank">quar=
esma.jose@gmail.com</a>]<br>
&gt; &gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; &gt;<br>
&gt; &gt;<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr">Best regards,<div><br>Jos=C3=A9 Quaresma</div></div></div></=
div>

--000000000000d5d3ef0607e5a078--

