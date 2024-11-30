Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B38F8D735F9
	for <webhook@archiver.kernel.org>; Sat, 30 Nov 2024 08:15:20 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web10.130149.1732954509451483849
 for <openembedded-core@lists.openembedded.org>;
 Sat, 30 Nov 2024 00:15:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=C8riLyqr;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3823e45339bso1957721f8f.0
        for <openembedded-core@lists.openembedded.org>; Sat, 30 Nov 2024 00:15:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1732954508; x=1733559308; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=9gZnZHBm+5XGmun7FrEcQ89nZNcGvGQYANph+KSqdJA=;
        b=C8riLyqrWBFpXr1Ze2iy9YTJosiJw7Zuv4xpPpjAdw6rzVySSgDPNaAbPl2ej+oQFK
         /Oltol9t28hjRbBxhu5uwOMLovHVWsef/SFw+OK28iUw63JuXLGEItVZUwtx1hH4DyCO
         LJgbkITgYzvmVRdaXgncKvvJ1tsOhKjFyiyG0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732954508; x=1733559308;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9gZnZHBm+5XGmun7FrEcQ89nZNcGvGQYANph+KSqdJA=;
        b=Bq/124lWRLhlb/vMWZdmkOqfgtWo6P0myFpUBKvayjHxfcjl/tgFTKBDzFZ9cIcNuG
         CDZXfpHFpXRU3ExnbCviyk2MuxXBGtSoi54J6QtzKNwJYQudCH2npYDWyjdZnpExijH2
         fLDn6VUXfrAjEwWbUQ2SvDXyjw6rW8K/y2CvTKOXrZ1ezKQb0qLdhleDUlg+WlplLU1b
         hJ6fCLvWs/D2Wu95xQnXvO+SM+n5NxHD1aaYICJuRd27Bbcg9ULcBgyVFUMTwgQ72nk1
         UHi4f7UaurYaoE90B3KfkOjmEGunxPXLyIvzgTDkpRQDnzmtXqqGwOfxUUB0AxyiGpZI
         zFgA==
X-Forwarded-Encrypted: i=1; AJvYcCUGhZLHD8djO1XMEwiOMFL+LtlPJvHhxFvVXLJI7nm7a/aLOUyMsR32Pgjm7c+vRi1yLpha0L9aMhF1OdEoiiqwVg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyUbmOoRckVhp8DMxoiI1BFcpNU3iktTLHoIn7noxiMU6IPnGB1
	k+1GoIdhGw8ppjFwOohBVaxAEu56qmACfM5ZG7J5JYmyrPxXW7Fi9JjSRy6Yh5Y=
X-Gm-Gg: ASbGncum9Lhg5HgOLxlFhzybFV9DbuYr8rIV3+x2meW2lQ6n6iYjyBAXOS8hnxKlYn8
	dWjkwv08pMPfek9AGq9yOaAqVmwkpJkmkVHVfnUxPDIa4937MBuOB0l5e6YXQKjjO6JyHneXLBc
	xG2VKqOKCcRxkkym4f93HfcOTXmss0h/kO99odZbU51BSIXY/mLvEytL+9oExqbISPXkiVD2j/9
	4konQ9rI6f8+ufMEqGgpbHcbfaKEkAyTLkNfma/+GUmtDjcGuJLVWcY2J3hA+k5SVVhUyC3t9aV
	odVxi2MENiuDQGmG85w4yzviOqR0TPxm+w==
X-Google-Smtp-Source: AGHT+IGLCIoELOlhQs+81MZ1oX1zIeeLg1f84tWSC75wAE/5yvKd0uGQEnq5QFZuNGex//mPlTeXNw==
X-Received: by 2002:a05:6000:1aca:b0:382:397f:3df5 with SMTP id ffacd0b85a97d-385c6edd4fcmr11617876f8f.38.1732954507572;
        Sat, 30 Nov 2024 00:15:07 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:1b9:609c:bea3:27d? ([2001:8b0:aba:5f3c:1b9:609c:bea3:27d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385dea1e4ebsm4017949f8f.1.2024.11.30.00.15.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Nov 2024 00:15:05 -0800 (PST)
Message-ID: <cc9a8836aad0b8f3ed4c8488a905048ae0bdd6c4.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2 2/3] package_rpm: use zstd's default
 compression level
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: alex.kanavin@gmail.com, openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Date: Sat, 30 Nov 2024 08:15:05 +0000
In-Reply-To: <20241120153205.2525735-2-alex.kanavin@gmail.com>
References: <20241120153205.2525735-1-alex.kanavin@gmail.com>
	 <20241120153205.2525735-2-alex.kanavin@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 30 Nov 2024 08:15:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208039

On Wed, 2024-11-20 at 16:32 +0100, Alexander Kanavin via lists.openembedded=
.org wrote:
> From: Alexander Kanavin <alex@linutronix.de>
>=20
> zstd uses 3 by default (and ZSTD_COMPRESSION_LEVEL is set to that),
> while 19 is the highest and slowest.
>=20
> It's not clear why 19 was picked to begin with, possibly
> I copy-pasted it from rpm's examples without thinking:
> https://git.yoctoproject.org/poky/commit/?h=3Dmaster-next&id=3D4a4d5f78a6=
962dda5f63e9891825c80a8a87bf66
>=20
> This brings significant speedups in rpm's compression step:
> for example compressing webkitgtk takes 11s instead of 36s.
>=20
> The rpm size increases from 175648k to 234860k. I think it's
> a worthy default tradeoff.
>=20
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
>=20
> zstd fixup
>=20
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
> =C2=A0meta/classes-global/package_rpm.bbclass | 2 +-
> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/classes-global/package_rpm.bbclass b/meta/classes-globa=
l/package_rpm.bbclass
> index ddc4bf3a6a5..fab8f568781 100644
> --- a/meta/classes-global/package_rpm.bbclass
> +++ b/meta/classes-global/package_rpm.bbclass
> @@ -10,7 +10,7 @@ IMAGE_PKGTYPE ?=3D "rpm"
> =C2=A0
> =C2=A0RPM =3D "rpm"
> =C2=A0RPMBUILD =3D "rpmbuild"
> -RPMBUILD_COMPMODE ?=3D "${@'w19T%d.zstdio' % int(d.getVar('ZSTD_THREADS'=
))}"
> +RPMBUILD_COMPMODE ?=3D "${@'w%dT%d.zstdio' % (int(d.getVar('ZSTD_COMPRES=
SION_LEVEL')), int(d.getVar('ZSTD_THREADS')))}"
> =C2=A0
> =C2=A0PKGWRITEDIRRPM =3D "${WORKDIR}/deploy-rpms"

There are some nice steps on the performance charts:

https://valkyrie.yocto.io/pub/non-release/20241130-20/testresults/buildperf=
-alma8/perf-alma8-vk_master_20241130030029_2a163834b0.html
https://valkyrie.yocto.io/pub/non-release/20241130-17/testresults/buildperf=
-debian11/perf-debian12-vk_master_20241130040023_2a163834b0.html

I'm trying to trigger some specific builds so we can more precisely
point to the change but this is the most likely candidate in that range
:)

Nice to see things speed up for a change, thanks!

Cheers,

Richard



