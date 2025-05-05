Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BE5CC3ABAA
	for <webhook@archiver.kernel.org>; Mon,  5 May 2025 13:30:07 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web11.50375.1746451800490803736
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 May 2025 06:30:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=LlDqiLDr;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-39c1ef4acf2so3407324f8f.0
        for <openembedded-core@lists.openembedded.org>; Mon, 05 May 2025 06:30:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1746451799; x=1747056599; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=klwd0XZZldgzEK5Y/0SSWhaC+iJSyTyDeil2kTT3PoQ=;
        b=LlDqiLDrBg8mM38c4U9KgFtmcnmCBZEGM9Bu1QELt0CKLWuN/MNxS7xFnrYYKbQ3G6
         GA/Gv1QGEH68OP0qBbqNwnwZO4bY6zNfFJqBi8GrwXJP10WrtFUYcBWkm+tq+QDmb1v0
         3GLL0BKEZouJDB8j9pyNWMpdf1SgjOupXlvoU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746451799; x=1747056599;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=klwd0XZZldgzEK5Y/0SSWhaC+iJSyTyDeil2kTT3PoQ=;
        b=UwUU9WHQPVco4aW0xCYJGehYZiAwLvCMWCgQSdjD80i+EgEpgqAi3QkwGr6UcBb3+Y
         glvcOx3Tt4c9usC2+pFQls3NSZ22FXz/RgBClkBsSEji3Cp9Ep3LNDi47y8rfm0nEG63
         XUz5sRK89n2yLAalkDzJ7lZlljV3byNeQ5i/+SwcUpFNLwLmrFw20mfXgTV9KuVxg8Av
         n8Jw9S4oeUyivXSDAUMwQx8SJ0vj3e9+p2LgIckDB8VKFwLPXLcx5k8qFG7YtqvoTXhE
         ckj7X5Xb6CHaPO1j04fZ8tWVYVmBkeEt349hnf5qdAAHsizLEzcPEgnQuAalmnXDRGyj
         5pTQ==
X-Forwarded-Encrypted: i=1; AJvYcCXp9BIsx6qzTEiIH6aIHQAfUTHhf92FNGShK/hJww5qOsZ2OxjSZWtohvsuqjuuUIfJ9xA0biFSjAfbEKS+s7VKKA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxmG7oICyd3WMUH4toOlyd4mdcP4Xpk4Jm7asOi7Ih0Dty1ze89
	cZPGA+fnzfsqZ1ExTkchRgAyGrbigNpMnI5MpRoiwP4hEg6sosDQY+HNfD3L324=
X-Gm-Gg: ASbGncsFjPV5ufNcBuMKJA3xOO1QZ4h8Sb1+S9NzFM9YcGCyzlUkOpUwJ8eV9HbQqqC
	2h7zmDK8C4AAQQk+AqECJDfLAYl4JMYOnpYwVyJyEIm5seT7Dc+TKJ+sox0gjiOONxccxB4tXcZ
	eMWZrhxsJEi5oUMFZx//168HqwQvDshtWhNcDqtEI3164CZux/ywrF6OyX073Gxos6nbcU+/Fq2
	Dx+HqEcaqdp06UTUXPHrLqxK7OAwCbRdvRCNRzWzsHVMF82OPP8RlEzzmmTVgqLbSPBrtfjlhaT
	N/Uq2Ic3oxgbpIWCvmlDOCQW7pJIIrdb4sxPqTtWea09yQvZdKnxPfGaS79NwFL3oGt2riIVREx
	lPh7Lu65WbBEz7FBDv2ZlrFyaFjQl8Q==
X-Google-Smtp-Source: AGHT+IHStFvb5KqgfITxQYqOZNQyG96l4D/lbGkeNyadJSbHAJ2YfNuf/fWan6iMwN1MlgbO8Ti9CQ==
X-Received: by 2002:a05:6000:4312:b0:39c:1159:fe1f with SMTP id ffacd0b85a97d-3a09fd7db81mr5296184f8f.32.1746451798593;
        Mon, 05 May 2025 06:29:58 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:4146:97bc:575c:a2f9? ([2001:8b0:aba:5f3c:4146:97bc:575c:a2f9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a099b170e7sm10207679f8f.86.2025.05.05.06.29.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 06:29:58 -0700 (PDT)
Message-ID: <dddfbb46a17195fde3ff7cb5667c84a9b68235bc.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v3] bitbake.conf: pseudo to ignore vim and
 less config files
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: mikko.rapeli@linaro.org, openembedded-core@lists.openembedded.org
Date: Mon, 05 May 2025 14:29:57 +0100
In-Reply-To: <20250505130830.995042-1-mikko.rapeli@linaro.org>
References: <20250505130830.995042-1-mikko.rapeli@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 May 2025 13:30:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216012

On Mon, 2025-05-05 at 16:08 +0300, Mikko Rapeli via lists.openembedded.org =
wrote:
> vim and less always write to these files in users home directory.
> Using vim and less via pseudo in "bitbake -c devshell recipe" and
> outside of pseudo triggers pseudo aborts which makes interactive
> use of devshell difficult. Fixes vim and less crashes and related
> pseudo log entries:
>=20
> inode mismatch: '/home/builder/.viminfo' ino 33270730 in db, 33269736 in =
request.
> inode mismatch: '/home/builder/.lesshst' ino 33270625 in db, 33270730 in =
request.
>=20
> Ignoring all files with ${HOME}/. in path fails since tools seem
> to be using these paths, e.g. trusted-firmware-a from meta-arm.
>=20
> Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> ---
> =C2=A0meta/conf/bitbake.conf | 2 ++
> =C2=A01 file changed, 2 insertions(+)
>=20
> v3: back to .less and .vim paths due to failures from trusted-firmware-a =
in meta-arm,
> =C2=A0=C2=A0=C2=A0 added comment

What paths are they using exactly? That sounds odd...

Cheers,

Richard

