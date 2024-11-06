Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D14CD29FB6
	for <webhook@archiver.kernel.org>; Wed,  6 Nov 2024 07:54:55 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web10.41002.1730879691844461721
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Nov 2024 23:54:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=gH8Ni3lW;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43161c0068bso53818705e9.1
        for <openembedded-core@lists.openembedded.org>; Tue, 05 Nov 2024 23:54:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1730879690; x=1731484490; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DKGcOSDZvRzdv8PKc3dAwdh8pl+OWAmem7ZPihG9PhM=;
        b=gH8Ni3lW6PJmQenp0jyA16UVvjgP74fvvxyfzMtULx9aqVmvNLRT7E9Kr+uXeE5Ch8
         b3tMKxHEgMAMQd9nRZIMe+ni5TPxBlkA8Uduq74BCj/Gh6udYLTvbonjhq53Os4MJPgi
         qqWSSsS3N+lntYWfwN3M3wPE4NaMZJwg1RGnE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730879690; x=1731484490;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DKGcOSDZvRzdv8PKc3dAwdh8pl+OWAmem7ZPihG9PhM=;
        b=ChhHWHPKO1oCe70tu0I68T6nhBmYaZG9DfLYKdpSZw2gXOT2rmUSxmRyh7fGWubcJz
         L63p3AL7rOcED1oKNqpHzZSZcJa7eYQPccsR1iVEQnKAEj81EUFuJeEfHgRj+uNvS8wz
         56bJYG00QvL+ix6omg8FyjGd02WgbAWHPLpT1msKgHMG3lj1NPSB3FZmx2KdH46NH7lG
         AMDf20eAAqejVdUitcNdeT8WNRWiZpqbVCT1fo468Eek5Pxb0brwbeB1uiTboSG6An17
         SRVhbTls79clF5HOqFHiqHvJsg+18R+VkMDF54YUItDSMdoM1+imzOOHk+vqqOedCXMl
         X3Hw==
X-Forwarded-Encrypted: i=1; AJvYcCWuMprn6+Uj3aq7qecGdeyUfFDtysiJVzFjrhzYKOdpoQUW/SGP4KRoD20Vijp0Hq9WmTJkB1/0nqM07hLIJ/9GKQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yw+aZX6wRC/rpZLz4SUHZ6UZ6OscIZ1ZNUpEI2ZuB4+32Kyu7eZ
	rMk76Cn/sO67rm2CmN/POC8L61h3PO9j7//vI7mLXon3r9YCBk7ieu+xXq7H52s=
X-Google-Smtp-Source: AGHT+IF29Rh/xFkSj7ihOfXTrUTlVR8OL4uY4pJC3HPsoRtvh+3RKuM7pRXTWq8RxcJKbcJ1XidtqA==
X-Received: by 2002:a05:600c:1d14:b0:431:52cc:877e with SMTP id 5b1f17b1804b1-43283251d6cmr148656945e9.20.1730879690215;
        Tue, 05 Nov 2024 23:54:50 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:de00:615d:c4fc:749b? ([2001:8b0:aba:5f3c:de00:615d:c4fc:749b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381c113e8a8sm18436932f8f.72.2024.11.05.23.54.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 23:54:49 -0800 (PST)
Message-ID: <0d404a55f4e64567d181560aae6cb28473ddd6ac.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 1/5] python3-cython: add patch to prefix map
 source paths in generated files
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: ross.burton@arm.com, openembedded-core@lists.openembedded.org
Date: Wed, 06 Nov 2024 07:54:49 +0000
In-Reply-To: <20241105161227.2324296-1-ross.burton@arm.com>
References: <20241105161227.2324296-1-ross.burton@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Nov 2024 07:54:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206761

On Tue, 2024-11-05 at 16:12 +0000, Ross Burton via lists.openembedded.org w=
rote:
> Cython generates C source code that contains mentions to the original
> .py files, which results in build paths being embedded inside the
> binaries.
>=20
> Implement prefix remapping to change these build paths to point at the
> target debug directory, so that we don't leak build paths and have
> reproducible builds.
>=20
> This patch is currently not submitted upstream, but will be shortly and
> I expect it to evolve before being merged.
>=20
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
> =C2=A0.../python3-cython/0001-WIP-prefix-map.patch=C2=A0 | 148 ++++++++++=
++++++++
> =C2=A0.../python/python3-cython_3.0.11.bb=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 1 +
> =C2=A02 files changed, 149 insertions(+)
> =C2=A0create mode 100644 meta/recipes-devtools/python/python3-cython/0001=
-WIP-prefix-map.patch

I put this series in for testing and it created some issues. The
original build has piglit failures:

https://valkyrie.yoctoproject.org/#/builders/6/builds/388
https://valkyrie.yoctoproject.org/#/builders/3/builds/396/steps/11/logs/std=
io
https://valkyrie.yoctoproject.org/#/builders/59/builds/381/steps/12/logs/st=
dio

I took this set of patches out (except 5/5) and rebuilt and this time,
there was a reproducibility failure in numpy:

https://valkyrie.yoctoproject.org/#/builders/37/builds/407/steps/13/logs/st=
dio

but worryingly, one of the piglit failures survived:

https://valkyrie.yoctoproject.org/#/builders/6/builds/390

the others did not. This means we probably have some issue with the
task checksums too and something these patches change isn't surviving
into them :(

Cheers,

Richard



