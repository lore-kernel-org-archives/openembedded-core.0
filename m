Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF668D6ACC3
	for <webhook@archiver.kernel.org>; Wed, 27 Nov 2024 11:45:19 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web11.70291.1732707917511257180
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Nov 2024 03:45:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=J5pWdlxU;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4349fb56260so26925395e9.3
        for <openembedded-core@lists.openembedded.org>; Wed, 27 Nov 2024 03:45:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1732707916; x=1733312716; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JFFqn15kK0k4yMZc7o9N2snh6uY63PPCHZJsb/S0SzQ=;
        b=J5pWdlxUo1peUU08pWsIHLwWH4ftHmyuy1Qy61Tsik/QCigjiuMloHhyBwU1Hq/VUi
         vJTptxDNHUd472nS9OoCSJCn97stsmDJt/jtL8v1vAW1/6rnVr8XQIpMKrfkOgOFM9ox
         VD5kTKkDwXYEAvMHwtNkOAw+0Xy9MAMji6UKI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732707916; x=1733312716;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JFFqn15kK0k4yMZc7o9N2snh6uY63PPCHZJsb/S0SzQ=;
        b=SMec75RZ7kIX3fGIxdy1oLV8UUlRoBO+91MlGrRIZ6q8LCWlDOvhCU4vnw92ngsEYr
         1AM9eyBScAQ+gzCWib6oBjzRnuu643aKcD24iA4/n0TrcaDz16GnePJ5URldRm5sPcRc
         vK0rNaTiBPWwQR6+YEGWULzVDdCuoAktq4bzR/YG6HkKyyGEsDyZT5QwNiNuSWENVpMe
         3ayJpphzf7CX/0UyubV+Y0A7QCQk4CUjay4bK9tiIhzInNak+G/o7JMFYBK1OBs9zCb2
         tNSrn5dyeqle4Ed6ygJZpR6MoRsqNfK1Fhl76qzkcarsJnaw2BkYGItvPUMFT+7O3wqN
         2iHg==
X-Forwarded-Encrypted: i=1; AJvYcCXyLj0WPBhuY+JBdfusWYHrSAqwQ3xalWW5IlIWFPS6mKnfYdwB0TX7cngGirLyOC/w/9Ab94Y30Cr7I5H36TE75g==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yw79c2uH8VsQoK72r1LPROQADmBPSw8+a9rhe0W+hqVqxhpJ5lo
	fZObUsxVxSS8IJFSJpj02MX4Ty6l8tUaS3lnJLkKYUB3lEeAARytZ3xguDRnotA=
X-Gm-Gg: ASbGncsh5kUFZstDKwZUuMBEo3TA4C0g+/C0x7DRvOp7QFOM+7iqsw91nEC6PBe2OVq
	hB/5QAnRwRp5qVtq96QH1GBRrwEAn5Z3qNikUfmwgNzUlY5FJCZuEPNDoR/KDHNZ1Ps5VABA71E
	Q+rgOa3MMy9OMsHnneFJyoilWxjEsTTPr/ovE978Oq+h8azlGSROWdlJY6/7U2VoNNhpfOXAeFm
	Bin2RBNd6EaMxy7FVTkdB4tZsfI9TZM5dJsTmCLPImEh7w34wI1HeT6mHgEkJwNLKdVGZDKijAL
	UZmh5On5rmVGlOcygrUv601iBVqz3+CtAv4a
X-Google-Smtp-Source: AGHT+IFQLnftDxVV3M+mDAhQS0wsMITgYARRS6VhYdYt/UMBvjM2sb8veh93+AXu8qEYLjAbCldTDw==
X-Received: by 2002:a05:600c:3146:b0:434:a169:6ff8 with SMTP id 5b1f17b1804b1-434a9db8423mr26752095e9.3.1732707915931;
        Wed, 27 Nov 2024 03:45:15 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:d8f2:574:7ade:5a68? ([2001:8b0:aba:5f3c:d8f2:574:7ade:5a68])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434aa7cd343sm18404135e9.22.2024.11.27.03.45.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Nov 2024 03:45:15 -0800 (PST)
Message-ID: <6251c0723200d0c0a3f3d49a6477a10c4de9a9f1.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 2/2] weston-init: Make weston user member of
 seat group
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: raj.khem@gmail.com, openembedded-core@lists.openembedded.org
Date: Wed, 27 Nov 2024 11:45:14 +0000
In-Reply-To: <20241127005121.683644-2-raj.khem@gmail.com>
References: <20241127005121.683644-1-raj.khem@gmail.com>
	 <20241127005121.683644-2-raj.khem@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Nov 2024 11:45:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207925

On Tue, 2024-11-26 at 16:51 -0800, Khem Raj via lists.openembedded.org wrot=
e:
> This enables weston launch to access the seatd socket
> /run/seatd.sock to communicate properly to acquire seat
>=20
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
> =C2=A0meta/recipes-graphics/wayland/weston-init.bb | 3 +--
> =C2=A01 file changed, 1 insertion(+), 2 deletions(-)
>=20
> diff --git a/meta/recipes-graphics/wayland/weston-init.bb b/meta/recipes-=
graphics/wayland/weston-init.bb
> index 3de697ec34e..52ffba336aa 100644
> --- a/meta/recipes-graphics/wayland/weston-init.bb
> +++ b/meta/recipes-graphics/wayland/weston-init.bb
> @@ -102,6 +102,5 @@ FILES:${PN} +=3D "\
> =C2=A0CONFFILES:${PN} +=3D "${sysconfdir}/xdg/weston/weston.ini ${sysconf=
dir}/default/weston"
> =C2=A0
> =C2=A0SYSTEMD_SERVICE:${PN} =3D "weston.service weston.socket"
> -USERADD_PARAM:${PN} =3D "--home /home/weston --shell /bin/sh --user-grou=
p -G video,input,render,wayland weston"
> +USERADD_PARAM:${PN} =3D "--home /home/weston --shell /bin/sh --user-grou=
p -G video,input,render,seat,wayland weston"
> =C2=A0GROUPADD_PARAM:${PN} =3D "-r wayland; -r render"
> -
>=20


https://valkyrie.yoctoproject.org/#/builders/3/builds/558/steps/11/logs/std=
io

Cheers,

Richard


