Return-Path: <erik.schilling@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 322CACDB474
	for <webhook@archiver.kernel.org>; Tue, 17 Oct 2023 05:51:16 +0000 (UTC)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
 by mx.groups.io with SMTP id smtpd.web11.200838.1697521873277129281
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Oct 2023 22:51:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=oG0q9fGs;
 spf=pass (domain: linaro.org, ip: 209.85.208.180, mailfrom: erik.schilling@linaro.org)
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2c50fbc218bso41491461fa.3
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Oct 2023 22:51:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697521871; x=1698126671; darn=lists.openembedded.org;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OIDB3jdf7HHYA5+q5g3iJof+iAQ7epeVZ5VRJtVx9+g=;
        b=oG0q9fGsTvdxkqkQpwjWZvkJj8dhY6OP2cvgxKXmUcrsAFQfIoqVnd2510omn4YTH3
         eISBGhXFfcDkXoWQ6M6fp7BT448kxiPg+zBXEPUlh02fL8d757naptew5rqYd6+zClR6
         36YFaViWet4XN2vw4ssm7rhJ8IzXnw5MqAQ8HJ92VZTnkokmL0o9zFqWHPrmmLrPQYSu
         MPZUIt5MHSef0YswtCuNIFSSfTNfLNTmbOcA7e55KHsCj8Srxw7pgNHy48y25KWHMuFR
         561IzOEtU1JJD9OljeEHCEyMq4OTw3yYML7ouBmSK4l4chc0cfaNUJxzzfI5P0x6IDLu
         V+KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697521871; x=1698126671;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OIDB3jdf7HHYA5+q5g3iJof+iAQ7epeVZ5VRJtVx9+g=;
        b=D/NVKVjlKMO0G8mq5FbDh3iEZKEv5PGK7dEWYNXBk6Wt13Qki3cgjeJELzqvLwyTYz
         AaYOwpHTS6XJAm/odi+MOzSdqR+zd5DFmcUCu0wzo6YlGYrfTPqzDtBWuPCOgQpdfk0y
         e1CTLHIi2XhezDwFYawYzWlJmw/NKrgbxHBq1BjgWNSNfAFFXC3GnyUKDkD/cRGI8bJn
         HOUF2cUsrmVJQ25YPlcnllciEKEefIMMEWjMg3lYsW1jnP9+iRxNIvnKWq27YEpvJ0bw
         rU4MbHaepHa06dR/+OhXN4rpiNUy55kwYYwVcpwDze/67Ff9VSe+SfmII+l4JHzEjvXS
         4uaQ==
X-Gm-Message-State: AOJu0Yxa+ptSPw2zQU6XGP1b4dH/HeQZ47g5RPmPVWcFcnucMxEnx/H4
	EXEOkwBhDtWmxbN5rq5d6m/duA==
X-Google-Smtp-Source: AGHT+IELoVTxges5CPACE+H5qvLlRQ3d8ge3J6YD6gyQobgXHLIxUnnIWJFisPn2xaGgYZR9HKDa3A==
X-Received: by 2002:a19:f70f:0:b0:4f8:75cf:fdd7 with SMTP id z15-20020a19f70f000000b004f875cffdd7mr1033658lfe.22.1697521871140;
        Mon, 16 Oct 2023 22:51:11 -0700 (PDT)
Received: from localhost (i538788F1.versanet.de. [83.135.136.241])
        by smtp.gmail.com with ESMTPSA id m11-20020a05600c4f4b00b004068def185asm902906wmq.28.2023.10.16.22.51.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Oct 2023 22:51:10 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 17 Oct 2023 07:51:10 +0200
Message-Id: <CWAHA5EQL45Z.3HPZNQBIRGUUL@ablu-work>
Subject: Re: [OE-core] [PATCH] systemd: fix packaging tpm2 plugin for
 cryptsetup
Cc: <openembedded-core@lists.openembedded.org>, "Kristian Klausen"
 <kristian@klausen.dk>, "Mikko Rapeli" <mikko.rapeli@linaro.org>, "Javier
 Tia" <javier.tia@linaro.org>
To: "Jose Quaresma" <quaresma.jose@gmail.com>
From: "Erik Schilling" <erik.schilling@linaro.org>
X-Mailer: aerc 0.15.2
References: <20231016-b4-systemd-tpm2-crypt-plugin-v1-1-21fef10601ff@linaro.org> <CANPvuRk9GopD1yCbmSPk_pS1M=bC8drdAefYSpJ95cEQBq6Wdw@mail.gmail.com>
In-Reply-To: <CANPvuRk9GopD1yCbmSPk_pS1M=bC8drdAefYSpJ95cEQBq6Wdw@mail.gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Oct 2023 05:51:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189315

On Mon Oct 16, 2023 at 6:31 PM CEST, Jose Quaresma wrote:
> Erik Schilling <erik.schilling@linaro.org> escreveu no dia segunda,
> 16/10/2023 =C3=A0(s) 13:02:
>
> > When building with `cryptsetup` and `tpm2` in the
> > PACKAGECONFIG, this plugin will be emitted.
> >
> > Cc: Kristian Klausen <kristian@klausen.dk>
> > Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
> > Cc: Javier Tia <javier.tia@linaro.org>
> > Fixes: 7b7dfbfaed ("systemd: Add tpm2 PACKAGECONFIG")
> > Signed-off-by: Erik Schilling <erik.schilling@linaro.org>
> > ---
> >  meta/recipes-core/systemd/systemd_254.4.bb | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/meta/recipes-core/systemd/systemd_254.4.bb
> > b/meta/recipes-core/systemd/systemd_254.4.bb
> > index 77724eb822..6ecfbaf293 100644
> > --- a/meta/recipes-core/systemd/systemd_254.4.bb
> > +++ b/meta/recipes-core/systemd/systemd_254.4.bb
> > @@ -645,6 +645,7 @@ FILES:${PN} =3D " ${base_bindir}/* \
> >                  ${sysconfdir}/X11/xinit/xinitrc.d/* \
> >                  ${rootlibexecdir}/systemd/* \
> >                  ${rootlibdir}/systemd/libsystemd-core* \
> > +
> > ${rootlibdir}/cryptsetup/libcryptsetup-token-systemd-tpm2* \
> >
>
> The systemd-cryptenroll was packed in the systemd-extra-utils so packing
> the plugin
> on the main systemd package is a bit weird.
> I wonder if a new package like systemd-crypt is better appropriate for th=
is
> where we
> going to put the systemd-cryptenroll and all the plugins available in
> ${rootlibdir}/cryptsetup

Ah, did not realize that... I agree that breaking up systemd into
smaller packages would probably be a good thing. Currently building an
image with systemd in the initramfs and main image gives little choice
over which components go where... I will try a systemd-crypt variant.
Will also take a look at how other distros solve this.

- Erik

>
> Jose
>
>                  ${libdir}/pam.d \
> >                  ${nonarch_libdir}/pam.d \
> >                  ${systemd_unitdir}/* \
> >
> > ---
> > base-commit: 97f0a73c0a9db5506310328cd29f165eab3c509d
> > change-id: 20231016-b4-systemd-tpm2-crypt-plugin-5064c458e726
> >
> > Best regards,
> > --
> > Erik Schilling <erik.schilling@linaro.org>
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#189288):
> > https://lists.openembedded.org/g/openembedded-core/message/189288
> > Mute This Topic: https://lists.openembedded.org/mt/101993740/5052612
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> > quaresma.jose@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
> >


