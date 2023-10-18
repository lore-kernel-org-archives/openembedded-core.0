Return-Path: <erik.schilling@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97741CDB482
	for <webhook@archiver.kernel.org>; Wed, 18 Oct 2023 06:34:04 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web10.276253.1697610837310513544
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Oct 2023 23:33:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=g4rSZ+Lk;
 spf=pass (domain: linaro.org, ip: 209.85.221.49, mailfrom: erik.schilling@linaro.org)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-32d9b507b00so4331206f8f.1
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Oct 2023 23:33:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697610836; x=1698215636; darn=lists.openembedded.org;
        h=in-reply-to:references:cc:subject:from:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=miFzA+x5dAQz+Mo59+EGs9QAYiOd4NdUUoah7vC710U=;
        b=g4rSZ+Lk0HbafrEDzjI0dyXGfc6Wl+FsHdrYZmPyJSKeUEGmafRmiidDVEUOR8MlEz
         TYvNs3SEfZo6vU3tVm2n9ZsHclnPuiZ5eBn9QqHyDoXsa3++UkgQQfcBasTWio11++0T
         V+Bl4WcXgjSPs1ELU6YmiYaOyyULoQs5H6JR9iMPbgquoh42pKf1y8voWa3qVu7zh6yj
         xijGYyJxdCF3gPmqezEfvYMQNlTZWdWwNUerYoRyDAvCvif9wYsPKkfUGYUsbkzAzN7E
         7/xrz0d1+S0GIbJWRkMMdK/48xHVbRjTUfOmSe5azm/wwhZC2sHPxXoA3YA7WJigRnbc
         IU3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697610836; x=1698215636;
        h=in-reply-to:references:cc:subject:from:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=miFzA+x5dAQz+Mo59+EGs9QAYiOd4NdUUoah7vC710U=;
        b=U3wT52kAAz52pWLNQo8QCSRgaUI5EymGI1RHeilzazSaL7hVZelIV2bZpfaKKM1QDY
         wRAesranzo8xCtk+uGjbxIowW7Oi8izlOM50SiF4NqaSvE9CGroQosV43WLT+W5yNbkr
         qnvFQ24dphzU87U2Dc/uvZ+iPgs1dLRalGmiZRZEck7WlmYN89rLdfUopPiLWh9nhpla
         DKHageLJb+2Dx3PlDdecAg6yTxqTgmaAAkX9MqQj/SAbv5TphEIY9ynzRQRb1ziROW4y
         bTZq6bWZRqUaAszrgCuCKPM+hNjhZ5Wb1tBN4wZ3r4R1u/jWVz27Q8H6NuUEDxtnd0Rc
         cKVw==
X-Gm-Message-State: AOJu0Yx+gm3fIzemsXablGeFcUqydQUlMRCY7sHtopAtWr57DrH9fypb
	CyAqoQQ+ExHqs0UE2n48znJemg==
X-Google-Smtp-Source: AGHT+IFUYuTd5CyqqL9YdWMjOmDsD/GN18ZVKME6ZNxtYNczbDLHBD+bfhVF4mcn0hMnwmH1enGzNA==
X-Received: by 2002:a5d:58da:0:b0:32d:b1d7:419f with SMTP id o26-20020a5d58da000000b0032db1d7419fmr3516539wrf.32.1697610835541;
        Tue, 17 Oct 2023 23:33:55 -0700 (PDT)
Received: from localhost (i5387884E.versanet.de. [83.135.136.78])
        by smtp.gmail.com with ESMTPSA id i7-20020adffc07000000b0032d8354fb43sm1337777wrr.76.2023.10.17.23.33.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Oct 2023 23:33:55 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 18 Oct 2023 08:33:54 +0200
Message-Id: <CWBCTF54QUSS.3DJVMJ9KMORGK@ablu-work>
To: "Jose Quaresma" <quaresma.jose@gmail.com>
From: "Erik Schilling" <erik.schilling@linaro.org>
Subject: Re: [OE-core] [PATCH] systemd: fix packaging tpm2 plugin for
 cryptsetup
Cc: <openembedded-core@lists.openembedded.org>, "Kristian Klausen"
 <kristian@klausen.dk>, "Mikko Rapeli" <mikko.rapeli@linaro.org>, "Javier
 Tia" <javier.tia@linaro.org>
X-Mailer: aerc 0.15.2
References: <20231016-b4-systemd-tpm2-crypt-plugin-v1-1-21fef10601ff@linaro.org> <CANPvuRk9GopD1yCbmSPk_pS1M=bC8drdAefYSpJ95cEQBq6Wdw@mail.gmail.com> <CWAHA5EQL45Z.3HPZNQBIRGUUL@ablu-work> <CANPvuRnyvniBMEhWU2Jzrd4scx=1K4PkMy8w2VG3y8MSB4Bv8w@mail.gmail.com>
In-Reply-To: <CANPvuRnyvniBMEhWU2Jzrd4scx=1K4PkMy8w2VG3y8MSB4Bv8w@mail.gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Oct 2023 06:34:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189368

On Tue Oct 17, 2023 at 10:51 AM CEST, Jose Quaresma wrote:
> Hi Erik,
>
> Erik Schilling <erik.schilling@linaro.org> escreveu no dia ter=C3=A7a,
> 17/10/2023 =C3=A0(s) 06:51:
>
> > On Mon Oct 16, 2023 at 6:31 PM CEST, Jose Quaresma wrote:
> > > Erik Schilling <erik.schilling@linaro.org> escreveu no dia segunda,
> > > 16/10/2023 =C3=A0(s) 13:02:
> > >
> > > > When building with `cryptsetup` and `tpm2` in the
> > > > PACKAGECONFIG, this plugin will be emitted.
> > > >
> > > > Cc: Kristian Klausen <kristian@klausen.dk>
> > > > Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
> > > > Cc: Javier Tia <javier.tia@linaro.org>
> > > > Fixes: 7b7dfbfaed ("systemd: Add tpm2 PACKAGECONFIG")
> > > > Signed-off-by: Erik Schilling <erik.schilling@linaro.org>
> > > > ---
> > > >  meta/recipes-core/systemd/systemd_254.4.bb | 1 +
> > > >  1 file changed, 1 insertion(+)
> > > >
> > > > diff --git a/meta/recipes-core/systemd/systemd_254.4.bb
> > > > b/meta/recipes-core/systemd/systemd_254.4.bb
> > > > index 77724eb822..6ecfbaf293 100644
> > > > --- a/meta/recipes-core/systemd/systemd_254.4.bb
> > > > +++ b/meta/recipes-core/systemd/systemd_254.4.bb
> > > > @@ -645,6 +645,7 @@ FILES:${PN} =3D " ${base_bindir}/* \
> > > >                  ${sysconfdir}/X11/xinit/xinitrc.d/* \
> > > >                  ${rootlibexecdir}/systemd/* \
> > > >                  ${rootlibdir}/systemd/libsystemd-core* \
> > > > +
> > > > ${rootlibdir}/cryptsetup/libcryptsetup-token-systemd-tpm2* \
> > > >
> > >
> > > The systemd-cryptenroll was packed in the systemd-extra-utils so pack=
ing
> > > the plugin
> > > on the main systemd package is a bit weird.
> > > I wonder if a new package like systemd-crypt is better appropriate fo=
r
> > this
> > > where we
> > > going to put the systemd-cryptenroll and all the plugins available in
> > > ${rootlibdir}/cryptsetup
> >
> > Ah, did not realize that... I agree that breaking up systemd into
> > smaller packages would probably be a good thing. Currently building an
> > image with systemd in the initramfs and main image gives little choice
> > over which components go where... I will try a systemd-crypt variant.
> > Will also take a look at how other distros solve this.
> >
>
> I've been using this systemd-crypt package on my distro for some time now
> but I've forgotten to send it.
> In this package additionally to the TPM plugin I also have another for th=
e
> PKVS#11.
> I have all of these in a bbappend and I can easily extract.


Ah that sounds great!


> So you don't have to worry, I still do it today.

Sorry, I do not understand what you mean here. Did you mean that you
plan to send a patch?

- Erik

> > >
> > >                  ${libdir}/pam.d \
> > > >                  ${nonarch_libdir}/pam.d \
> > > >                  ${systemd_unitdir}/* \
> > > >
> > > > ---
> > > > base-commit: 97f0a73c0a9db5506310328cd29f165eab3c509d
> > > > change-id: 20231016-b4-systemd-tpm2-crypt-plugin-5064c458e726
> > > >
> > > > Best regards,
> > > > --
> > > > Erik Schilling <erik.schilling@linaro.org>
> > > >
> > > >
> > > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > > > Links: You receive all messages sent to this group.
> > > > View/Reply Online (#189288):
> > > > https://lists.openembedded.org/g/openembedded-core/message/189288
> > > > Mute This Topic: https://lists.openembedded.org/mt/101993740/505261=
2
> > > > Group Owner: openembedded-core+owner@lists.openembedded.org
> > > > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/uns=
ub
> > [
> > > > quaresma.jose@gmail.com]
> > > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > > >
> > > >
> >
> >


