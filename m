Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DA66C0218D
	for <webhook@archiver.kernel.org>; Sun, 26 Jan 2025 11:25:33 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web11.28340.1737890732033494395
 for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Jan 2025 03:25:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=TWPFh2wz;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-385ef8b64b3so3043434f8f.0
        for <openembedded-core@lists.openembedded.org>; Sun, 26 Jan 2025 03:25:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1737890730; x=1738495530; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=j7a/CJjl903Iw4NGI4FjS84yOFlBoZKlpOhT5mkx8uk=;
        b=TWPFh2wz5T78dne7n/dlSwzNcK8++l0OL4hm5uGwnRFUBMK5lNLWwUCBEhLLjA9tU9
         el1Ni/vVFl1E1Tci6Uv5gk92D3VAQwJ68Za5OEaHzSgMAHuHR3hzzQURdMJbMiLR8mAI
         618Fk3+l0WfhooX23lsArZ7UFgxgJapWcuQT8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737890730; x=1738495530;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=j7a/CJjl903Iw4NGI4FjS84yOFlBoZKlpOhT5mkx8uk=;
        b=xVILD8EO+snLIQE2El+eDbiIew3j3N9laYd4C2fm21IA/gct9OGbH5pfScXE6REgJb
         vOxEjcEhgeSrDexc93K+FJ8mNWx2sdrFYNWyU5/kbFoqHY+sqD3iylZfORZHYHwD79aB
         imGd4FMHqwO+Dk7aalH+IAmZISgGSmrcqAN5v4h6BCOZ9HSyMVcuVde+ecJl8JX/pujf
         Tnk3C7iUKxJI44KBu/AwdzIKrYPXCrRCYKC/oj8u++Mt0U1TBvHepxYB252ta8Wh5JNv
         aHwzGu1JrG722JwPI3owQ2pfU7RzFPqmmqOeStsTJNVrNBBgULCAglE7GVQpqB/ToErB
         zLIg==
X-Forwarded-Encrypted: i=1; AJvYcCV3aQhSsAX6gnnG90GjfRjLYM3uzB7rN7Orith33t1QOw0cTamw8Xb3pzgJ/AMRJX5T5m19d2gg+GGPABUcHWoyCA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxGSOIfJvUEP3fDVc7xNyq63N//XHlihSqk7VG15h6e7RQ4bmWr
	M97W7aMQWVwJMh0QGXcDCPpfs6AxQmYUy6Xs3SddJWVjYf2aNP++cc6/easmgt8=
X-Gm-Gg: ASbGncuXvcaKbkGreti91DHf00OvvKZXR6ZUlgXk5OIMlj7z+e8kAwdpoEGazZkdlUG
	whcyazwKJiBO5p26A1gSda0cJyYKN04Vh0ZLCo9tJUOrOKCwlkxFk0N51fyQePdOBbzgbkhNP/C
	xzO4woJbKm4Tt1N3BzBYvYM7VsCA7BsqCijJlI64hhWi99viL1vgTth/7lKdWadFisAYIq5WtIH
	Obvd0FyXw/ZX82ISJLflQIdusQhnfLvmFvlc2tr60BQguZZoUQSu9k8hFp2yEuFdNGNrpfQZ0QT
	FtXXEi5iKIRwkvy8XvKefHg1rne7P3lITWvtd0Uf0lpVlAEQW+jMA0dMLHbF+xT4BLP7pDTyetR
	ONA==
X-Google-Smtp-Source: AGHT+IGS/HTTWt5VbJYPn9Inmoo9KzCPP7PMoFOA7116x9SBIwjO+H1v09UW1ALbxm2Kku6TP0uFKQ==
X-Received: by 2002:a05:6000:1f85:b0:385:e374:be1 with SMTP id ffacd0b85a97d-38bf5662b18mr35049541f8f.13.1737890730374;
        Sun, 26 Jan 2025 03:25:30 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:6905:4568:b67b:291? ([2001:8b0:aba:5f3c:6905:4568:b67b:291])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438bd5732edsm90225325e9.36.2025.01.26.03.25.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jan 2025 03:25:29 -0800 (PST)
Message-ID: <a282345831eaa176310242c5784aaff11e030ce5.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] barebox: upgrade 2024.12.0 -> 2025.01.0
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: ejo@pengutronix.de, openembedded-core@lists.openembedded.org
Cc: yocto@pengutronix.de
Date: Sun, 26 Jan 2025 11:25:28 +0000
In-Reply-To: <20250125213518.294656-1-ejo@pengutronix.de>
References: <20250125213518.294656-1-ejo@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 26 Jan 2025 11:25:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210274

On Sat, 2025-01-25 at 22:35 +0100, Enrico J=C3=B6rns via lists.openembedded=
.org wrote:
> Changes:
>=20
> * Added LLVM/Clang support for the sandbox architecture.
> * Enabled command execution from the sandbox command line.
> * Improved TFTP with dentry caching and default window size set to 1.
> * Introduced hardening features: register zeroing, stack variable
> =C2=A0 initialization, and malloc buffer zeroing.
> * Enhanced AM625 support with network support, watchdog driver, and
> =C2=A0 bootsource detection.
>=20
> Changelog: https://lore.barebox.org/barebox/Z4oUYdHXEAtnkySC@pengutronix.=
de/T/#u
>=20
> Signed-off-by: Enrico J=C3=B6rns <ejo@pengutronix.de>
> ---
> =C2=A0meta/recipes-bsp/barebox/barebox-common.inc | 4 ++--
> =C2=A01 file changed, 2 insertions(+), 2 deletions(-)

Thanks for the upgrade. Unfortunately it ran into issues with musl:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/6/builds/897/steps=
/11/logs/stdio
https://autobuilder.yoctoproject.org/valkyrie/#/builders/3/builds/913/steps=
/11/logs/stdio


Cheers,

Richard

