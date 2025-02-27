Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F012C19F2E
	for <webhook@archiver.kernel.org>; Thu, 27 Feb 2025 11:17:19 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web10.8362.1740655030003733813
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Feb 2025 03:17:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=QFGR9BOE;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4398738217aso7298855e9.3
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Feb 2025 03:17:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1740655028; x=1741259828; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=AXYcBlaXo8yvSKaHd87BDKr6lpObn7/kR19dNVMoVO4=;
        b=QFGR9BOEpz8YUfa4vCRx5eOKq24MaNSQc7k8CZQQTZv2TtIRbvowr7ZvYjzoOZGE0i
         jYOa/vVh87nw6Kbfz26L5JxyUWWcXnTH7szbOI3h4TkPMQuwMyiOaP1slQS6UXX6VoHz
         BqAignR6mxIWz7GsoqMOYbJY4Hjo119czdD8I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740655028; x=1741259828;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AXYcBlaXo8yvSKaHd87BDKr6lpObn7/kR19dNVMoVO4=;
        b=ZRhIaZNYX/1L1WZUkpguXoJiFi55cF1gdBv4rlPIIbQkAjBfzJHKa+oDhjWz94dUVh
         alNOPoDHAU0hsHAihSkQnzQDrPmPW6ayNgUiTMyxfP2G+ApgDmL4I8BglgeGwbcSunvf
         EjQhXCQn0BPJNylvRoIJtBjLwqpSzE83IJM2qcJre3Muv6orC/jimOPU7aEZX5BmDhjU
         F/ohIACBzac5G0pUZ7Hdd3rxuu+lOvJznhheEf0v77pCPwCamb7QPHIQP3n9YrJsBtyx
         fuL9Ak3eHRxMPFZ2pfuJ5i1EWozNkXcEj1I3+wlpSIQqo/zQaht5rKu/GG5JWk+Mfsyo
         6UKw==
X-Forwarded-Encrypted: i=1; AJvYcCXrrtpYLC9PBfEk8dbg51PDWUTY5TwwunrZxrQhQNMrmKYycpL63y2yODFSByCQDAuvZYc2/KhWn124afKHH6Xi5w==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yzk+FJ2m9WR0c11d7yWfxBlXCToNXeaz4iJg5OgHzxv7wKFQeyJ
	nWGT0NABfJ+Cx92jCCBTnh0gliqf008Yh16GAywLZNTGb6CHIkP1vsfpahch82E=
X-Gm-Gg: ASbGncsA98ibVqBXNMBOlmnR00T/RrQZ7vMV9/TvJQ6OtYTHME+geBUpfMWjyureqNa
	Pc8eBzyscKfGVIkLjlajDGCWUGg5y6YO4W7OZJvWfUSG5DrVK8adCZOlRgsFvhtTMA/IuXQSmUT
	VpkPkAMSQ3VTel23rwqobMTsrxNmwzeaM0PnuqUNDUt+HRDbFrG1zMt/pQMb61SKLBd+lU9O619
	68am3RxpA7NTMc5ONfM2J7xWQ9XFdKA9ZhZI74eJpPzqoWp+1BIQ1BM9SzBo6ME3CVt7zQ3Mbhq
	qxk2Xtzgk9A2R+WvQK1V76YWDt8KeDiXt61OrA3B5NskuCgh4eo4G4ozLtqhrm7UPOzirR4Gl1T
	NTLdRK4UmiKCV2QA=
X-Google-Smtp-Source: AGHT+IHzr/hid6WI6Mu+x8W8m2eEhT3EIN8PS1Xwwf123RfT2+m7ItczQBAuNgxdibBRU4pMTVF0aA==
X-Received: by 2002:a05:600c:3506:b0:439:91dd:cfaf with SMTP id 5b1f17b1804b1-43ab8fe936emr59321055e9.18.1740655028233;
        Thu, 27 Feb 2025 03:17:08 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:af40:c449:3dc9:d155? ([2001:8b0:aba:5f3c:af40:c449:3dc9:d155])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43aba52b97bsm51548405e9.8.2025.02.27.03.17.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 03:17:07 -0800 (PST)
Message-ID: <ce6258c66b0a7c5eeeb8cbcc6a38b5d39a8b3bd5.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] barebox.bbclass: use consistent make flags
 for menuconfig
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: ejo@pengutronix.de, openembedded-core@lists.openembedded.org
Cc: yocto@pengutronix.de, Ulrich =?ISO-8859-1?Q?=D6lmann?=
	 <u.oelmann@pengutronix.de>
Date: Thu, 27 Feb 2025 11:17:06 +0000
In-Reply-To: <20250227092821.2766396-1-ejo@pengutronix.de>
References: <20250227092821.2766396-1-ejo@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.2-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Feb 2025 11:17:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211988

On Thu, 2025-02-27 at 10:28 +0100, Enrico J=C3=B6rns via lists.openembedded=
.org wrote:
> This change is done similar to the change in the kernel.bbclass of
> commit 8c616bc0 ("kernel: Use consistent make flags for menuconfig").
>=20
> This was discovered since the new CONFIG_GCC_VERSION kconfig symbol
> reflected the host GCC version instead of the target ones after running
> do_menuconfig.
>=20
> Reported-by: Ulrich =C3=96lmann <u.oelmann@pengutronix.de>
> Signed-off-by: Enrico J=C3=B6rns <ejo@pengutronix.de>
> ---
> =C2=A0meta/classes-recipe/barebox.bbclass | 1 +
> =C2=A01 file changed, 1 insertion(+)
>=20
> diff --git a/meta/classes-recipe/barebox.bbclass b/meta/classes-recipe/ba=
rebox.bbclass
> index 200ba08326..baba0a2965 100644
> --- a/meta/classes-recipe/barebox.bbclass
> +++ b/meta/classes-recipe/barebox.bbclass
> @@ -53,6 +53,7 @@ EXTRA_OEMAKE =3D " \
> =C2=A0=C2=A0=C2=A0=C2=A0 PKG_CONFIG=3Dpkg-config-native \
> =C2=A0=C2=A0=C2=A0=C2=A0 CROSS_PKG_CONFIG=3Dpkg-config \
> =C2=A0"
> +KCONFIG_CONFIG_COMMAND:append =3D " ${EXTRA_OEMAKE}"
> =C2=A0

Can we use +=3D here rather than append?

Cheers,

Richard

