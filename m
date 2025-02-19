Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9688C021B0
	for <webhook@archiver.kernel.org>; Wed, 19 Feb 2025 16:00:04 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web11.25835.1739980802621681697
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Feb 2025 08:00:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=EcO8tJuR;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-38f31f7732dso679243f8f.1
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Feb 2025 08:00:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1739980801; x=1740585601; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=tuBJ/TNR2vv7329Fz1mUa1Xlz/2iSXwbzjr46QR+Cno=;
        b=EcO8tJuRUtW53Mhhv0mXkZAs/HlS7nXSllYFGOuNEpYGvv3IuFcBZFwA6AfxvETNS2
         SmoJEW60TkwcQfDOYLF9lb6Fc48JI9uRmgpKcRZLGLRHSUPBmAParcoZaau0D5A92pOH
         nJrzm7yuJjvW6nTML1iqn4kQNay8ZyUoinsyo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739980801; x=1740585601;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tuBJ/TNR2vv7329Fz1mUa1Xlz/2iSXwbzjr46QR+Cno=;
        b=jpyZ2eMYZd7rD9iAkiU1zfbQR33yu58Vqc0WOEEe2qxzMWOsCdiTlM43BXzsfZBnni
         jjC8x0jy5SxsKqrUSzHLTXidxQiO0jKtUid9e8VpCVBBslLzlDBxAZe2qxYlDTtWKZ77
         pleULsGeP/9P+6nL1Dcb1wbplZLx+Ns5TDvDSNbo7CaNK4Vqv6H9LvjdNpT6iPO7e4ZD
         BiZWGa/ZdGH6Nrp/s82snOdI6hu6rU/e3SMbW8Y8ol/LVHXB1J9c0N8aogmwBePeQ7gr
         WgskXWngWLzGMs9aooLUhcfFFo7Q4bVoq4fZLx9jCqFdBaQSvKC9il/1uSLVi2Jlxend
         9A6g==
X-Forwarded-Encrypted: i=1; AJvYcCV01V8rkNo8uM8wB9g0Uj5GfgQjvhJWHE2OAA5zuJjodXzLXSEeHBS51fc6A1qCcyVltkVo0h3KZR1pxSNk73V9JA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxLWRoR1/m38bv5Ad9ME1O8nAkk7NO1WEd5Fmd9sXEriG7OfsEF
	3LBWg+yriPWjjwCj14FUaQG6V46o6C2+14NQGKCqZZ6IZqsC2C7OdaO9QgMCSh0=
X-Gm-Gg: ASbGnctFPE7Js+4DUcy9QjHKUc1hNrHKSgutlgBRBY/ZE9ilAGR5kootXSn+zw3gm+C
	TpWtVIwRUciRNM8Djk95w7LDB0MrxHyq2tLGSprexzEuFsRtDv9/MZzzHT1XhAKatne58/sP0Yo
	yaf4YsdA9kDGKes8k9s/4sVopJsqrQVNrgOt/XbZKsLHwE9RPlRFM29kE0d8q2VcQeJMYvb3E2I
	eReMX0CEO9oKOUlb2nDU3bUuXVOoxLNq/MDBMkBI+4v2ul7Izd3OLcRsLLqds0HTAKgBCoPsr8u
	FJUKiDRpUZ9Jbyp+sHspst/m81k2/PELSKTXAqMLnAzMKL7knAaipt6Q0xAItF+DFwfrN1Av+CW
	yue+J
X-Google-Smtp-Source: AGHT+IG3IzCkxJsKfgw4/HrxmRc4tIzjp7PEOyA05vWm+xAHQtRjisJBmMmtdNPJz1ytlq6KFN4Lvg==
X-Received: by 2002:a05:6000:401e:b0:38d:ba8e:7327 with SMTP id ffacd0b85a97d-38f57c086d3mr4251551f8f.8.1739980801031;
        Wed, 19 Feb 2025 08:00:01 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:4146:2030:963a:7035? ([2001:8b0:aba:5f3c:4146:2030:963a:7035])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f259f7979sm17943312f8f.83.2025.02.19.07.59.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2025 08:00:00 -0800 (PST)
Message-ID: <a7821314c57220b19a189530d48a64934c4b4820.camel@linuxfoundation.org>
Subject: Re: [poky] [PATCH 2/2] psplash: start via udev if framebuffer
 device detected
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: mikko.rapeli@linaro.org, openembedded-core@lists.openembedded.org
Cc: poky@lists.yoctoproject.org, Mathieu Dubois-Briand	
 <mathieu.dubois-briand@bootlin.com>, Jon Mason <Jon.Mason@arm.com>, Ross
 Burton	 <ross.burton@arm.com>
Date: Wed, 19 Feb 2025 15:59:59 +0000
In-Reply-To: <20250206144406.1328276-1-mikko.rapeli@linaro.org>
References: <20250206144406.1328276-1-mikko.rapeli@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Feb 2025 16:00:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211717

On Thu, 2025-02-06 at 16:44 +0200, Mikko Rapeli via lists.yoctoproject.org =
wrote:
> psplash-start.service expected to find /dev/fb0 and failed
> if device was not found. This failure breaks systemd
> oeqa runtime test with "runqemu nographic". Starting
> psplash based on detected framebuffer device fixes systemd
> boot status and systemd oeqa runtime tests for qemu
> boots with and without graphics support.
>=20
> Note that psplash-systemd.service still depends on /dev/fb0
> so startup with multiple framebuffer devices may not work
> correctly. I don't have devices with multiple framebuffer
> devices to test with.
>=20
> On qemu machine with graphics, psplash displays yocto
> logo correctly and boot progress bar as well. Once boot completes
> to systemd "running" state, the logo is replaced by login prompt.
> On qemu machine without graphics, boot completes without psplash
> or failures and login over serial console works normally.
> Tested with genericarm64 machine poky-altcfg distro and core-image-base
> image on qemu. AMD kv260 tested as well but graphics stack is not yet
> working there so boot is similar to qemu without graphics.
>=20
> Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> ---
> =C2=A0meta/recipes-core/psplash/files/fb.rules=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 1 +
> =C2=A0.../{psplash-start.service =3D> psplash-start@.service}=C2=A0=C2=A0=
=C2=A0 | 5 ++---
> =C2=A0meta/recipes-core/psplash/files/psplash-systemd.service=C2=A0 | 8 +=
++-----
> =C2=A0meta/recipes-core/psplash/psplash_git.bb=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 9 +=
+++++---
> =C2=A04 files changed, 12 insertions(+), 11 deletions(-)
> =C2=A0create mode 100644 meta/recipes-core/psplash/files/fb.rules
> =C2=A0rename meta/recipes-core/psplash/files/{psplash-start.service =3D> =
psplash-start@.service} (84%)

Unfortunately I think this has introduced an intermittent QA test
failure showing up in meta-arm in particular. Examples:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/75/builds/994/step=
s/22/logs/stdio
https://gitlab.com/jonmason00/meta-arm/-/jobs/9155263483

but it doesn't always fail. There were other failures if you look
through the meta-arm builds.

Cheers,

Richard

