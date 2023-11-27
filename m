Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 562E0C07CB1
	for <webhook@archiver.kernel.org>; Mon, 27 Nov 2023 10:59:50 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web10.92445.1701082778839069349
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Nov 2023 02:59:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=JOPcDnx6;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-40b397793aaso16346625e9.0
        for <openembedded-core@lists.openembedded.org>; Mon, 27 Nov 2023 02:59:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1701082777; x=1701687577; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=5BulCjqO3TYG2nacTt1S/5VatW6pkR3oUg5OuU1VG3M=;
        b=JOPcDnx6xndoetkL61lKzP2xMEWrqzDKFqU9EQcgZ0mDIL8lG0gNGXNFjs62BLBxjh
         b6P5Pf45d7BSyqGW06FZk17qO/VPpqdFqsL/8yb8v54o2i6W+4ezNSr3vErGmqfZOJ+Z
         ssoLEVpEjAn6/jOOZ/3088016kkrpnNvhgxgI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701082777; x=1701687577;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5BulCjqO3TYG2nacTt1S/5VatW6pkR3oUg5OuU1VG3M=;
        b=vRS4xmfTROIVV6gyJOx8uMBemZCmc32uiqY8+nQiYTcBmiJY4zzMB6Lib7grK2TfRR
         OvAKQB05HIJFv/hogLOge0kmUxIRYwBdwH456796U0Md+LxHgHk2qPlEZYoafnQnMpwa
         ryBXsHnMfUBVfJLFFCuS97bkgKniLlIBo4FcSOCmjS0QE6Aml2xs9iRbV1LYFxqL9FIu
         YGk2wdjL2F1zQEbHRjT8191X0BMYHy9xd6nHJ4bbnQ4pgp1F8PIMxqF4UX2/3ESk4l3A
         YCS4Bt5n4FFYq3OtdWn4tVfw3xGDPTmcbFCx/b3LqK9wGdgPfh2nXcVNeuY9HbekI/1Q
         YuZg==
X-Gm-Message-State: AOJu0Yx7FcRrOs9Ouhv6LhpuiTsycdBNk2Az3C12dR4x0VqsCfmMNl+g
	h0J32yAti3MLuDoiwkQr0DZqTw==
X-Google-Smtp-Source: AGHT+IEO3mzY3XD3VX81Th+YciAM0GpwcRRc/+pwyjwFg4yiFgyvRUGJFiPUMrITcuLOMyXeSww5NQ==
X-Received: by 2002:a05:600c:474b:b0:40b:3bf4:36c6 with SMTP id w11-20020a05600c474b00b0040b3bf436c6mr8573680wmo.12.1701082777007;
        Mon, 27 Nov 2023 02:59:37 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:430c:b470:8466:3e0? ([2001:8b0:aba:5f3c:430c:b470:8466:3e0])
        by smtp.gmail.com with ESMTPSA id hg15-20020a05600c538f00b0040849ce7116sm14103059wmb.43.2023.11.27.02.59.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Nov 2023 02:59:36 -0800 (PST)
Message-ID: <9b0ccf15dab54023fba15e4c4568191130c932cc.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 02/19] useradd.bbclass: list all needed items
 for package_setscene task
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>, 
	openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Date: Mon, 27 Nov 2023 10:59:35 +0000
In-Reply-To: <20231127101751.3187950-2-alex@linutronix.de>
References: <20231127101751.3187950-1-alex@linutronix.de>
	 <20231127101751.3187950-2-alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Nov 2023 10:59:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191292

On Mon, 2023-11-27 at 11:17 +0100, Alexander Kanavin wrote:
> Latest shadow-native links with additional libraries;
> I was unable to find a way to resolve those in setscene context
> where tasks do not contain such dependencies.
>=20
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
>  meta/classes/useradd.bbclass | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta/classes/useradd.bbclass b/meta/classes/useradd.bbclass
> index 4d3bd9a5f56..a35785c9c23 100644
> --- a/meta/classes/useradd.bbclass
> +++ b/meta/classes/useradd.bbclass
> @@ -179,7 +179,13 @@ SSTATEPREINSTFUNCS:append:class-target =3D " useradd=
_sysroot_sstate"
> =20
>  do_package_setscene[depends] +=3D "${USERADDSETSCENEDEPS}"
>  do_populate_sysroot_setscene[depends] +=3D "${USERADDSETSCENEDEPS}"
> -USERADDSETSCENEDEPS:class-target =3D "${MLPREFIX}base-passwd:do_populate=
_sysroot_setscene pseudo-native:do_populate_sysroot_setscene shadow-native:=
do_populate_sysroot_setscene ${MLPREFIX}shadow-sysroot:do_populate_sysroot_=
setscene"
> +USERADDSETSCENEDEPS:class-target =3D "${MLPREFIX}base-passwd:do_populate=
_sysroot_setscene \
> +                                    pseudo-native:do_populate_sysroot_se=
tscene \
> +                                    shadow-native:do_populate_sysroot_se=
tscene \
> +                                    attr-native:do_populate_sysroot_sets=
cene \
> +                                    libbsd-native:do_populate_sysroot_se=
tscene \
> +                                    libmd-native:do_populate_sysroot_set=
scene \
> +                                    ${MLPREFIX}shadow-sysroot:do_populat=
e_sysroot_setscene"
>  USERADDSETSCENEDEPS =3D ""
> =20
>  # Recipe parse-time sanity checks


FWIW I'm still leaning towards static linking for this. The setscence
dependencies are playing with fire and we *really* don't want to do
this :(

Cheers,

Richard

