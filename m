Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA8ABC5321E
	for <webhook@archiver.kernel.org>; Mon, 26 Aug 2024 10:57:31 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web11.49852.1724669843375408506
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Aug 2024 03:57:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=IRpSjeHM;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-428e3129851so37198605e9.3
        for <openembedded-core@lists.openembedded.org>; Mon, 26 Aug 2024 03:57:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1724669842; x=1725274642; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yzRZ+3k8TDRg2DajXRUqimbS3Mz0fuswmqvKsuHeLe4=;
        b=IRpSjeHMnogZYiQp7llKf1PTElq7QmE8mcY+os2Qa5IkepG1APb44opE/TIzSCoc1L
         QaA1MDdzEmlGlrz1NlcMtlOHErumA8D5C3sORdt7PDT36iYQuhvcKdmr2qgC2ZIHIGUd
         rGtl+b+tj9mvdJnhR8nio9wZZ/gfKKkbGPqI4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724669842; x=1725274642;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yzRZ+3k8TDRg2DajXRUqimbS3Mz0fuswmqvKsuHeLe4=;
        b=oJ1qplttDvKeu4+yljTUzbmKKILwWAbxHCJCQ8Vq6dtdm2YZdrDk2Foysz8jPFYzTY
         /oDZzT/nkLKy+NkKfUgqFxQ5iq17s+s9Z4luUpNIrIeZ1896vbQaoZIZMj2trTcs42gM
         gMoO1d1eHdBgta++2z69xzwL/fbXyI5Oq/3d+yFmX+Jb0R9s379UakGrWBbwOJNNT0Lw
         XwGUSp6F/FO5NXstngYHeT/aYBmwU5ikQu6oJSyl/uMNixl3oK4xURCiSA+enKudQ00e
         1ubuWQabjXNJ61R6UdNv4NcrZGqZ95idk6prSpJK3wqokEkyzq+6Qtm0+HOGpm/8rnTB
         G1dQ==
X-Forwarded-Encrypted: i=1; AJvYcCXR4eFvicZYV/3EZRi1oJkb3YOs4129HVjPrHjYR397oJKCCbmtu0JuUh6D0BBVi6izb8paygxxc0d8fQzTSoEdGw==@lists.openembedded.org
X-Gm-Message-State: AOJu0Ywn6XeThRMJSCdPvv5vIuBhgVg4BxAO18CJFhPMEce6S4wcRRVs
	sJ+wNaWcJShWzyD1PAUfHIHhuohSBvjlBI5vNCs2Tt46BixV01gETIRrgEE5xmJCln0GnMXax/C
	N
X-Google-Smtp-Source: AGHT+IECb4ELt2yK9o/dQvWnKDiOvaUAJUhr02cZAdda1W7jXSkd5w0nR5jamU/4FE87CS1sUVeSVA==
X-Received: by 2002:a05:600c:468e:b0:427:9922:4526 with SMTP id 5b1f17b1804b1-42acc8d3629mr57769145e9.7.1724669841628;
        Mon, 26 Aug 2024 03:57:21 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:152e:7c20:baa0:ecce? ([2001:8b0:aba:5f3c:152e:7c20:baa0:ecce])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42abefc627asm188782505e9.34.2024.08.26.03.57.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Aug 2024 03:57:21 -0700 (PDT)
Message-ID: <638fcf654276d1ccbf67a8d8881404a78f3b7cb6.camel@linuxfoundation.org>
Subject: Re: [OE-core] [master][PATCH] webkitgtk: fix do_configure error on
 beaglebone-yocto
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: changqing.li@windriver.com, openembedded-core@lists.openembedded.org
Date: Mon, 26 Aug 2024 11:57:20 +0100
In-Reply-To: <20240826085148.3492132-1-changqing.li@windriver.com>
References: <20240826085148.3492132-1-changqing.li@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 26 Aug 2024 10:57:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203748

On Mon, 2024-08-26 at 16:51 +0800, Changqing Li via
lists.openembedded.org wrote:
> From: Changqing Li <changqing.li@windriver.com>
>=20
> * According to latest comment [1] and the mentioned pull request
> [2], build an ENABLE(WEBASSEMBLY) && !ENABLE(JIT) configuration is
> supported, so original issue already fixed in current version, the
> EXTRA_OECMAKE setting is not needed anymore.
>=20
> * This EXTRA_OECMAKE setting causes following configure error on
> beaglebone-yocto, remove the setting to let the configure process
> decide
> the configuration:
> CMake Error at Source/cmake/WebKitFeatures.cmake:312 (message):
> =C2=A0 ENABLE_JIT conflicts with ENABLE_C_LOOP.=C2=A0 You must disable on=
e or
> the
> =C2=A0 other.
>=20
> [YOCTO #15254]
>=20
> [1] https://github.com/WebKit/WebKit/pull/17447
> [2] https://github.com/WebKit/WebKit/pull/17688
>=20
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
> =C2=A0meta/recipes-sato/webkit/webkitgtk_2.44.3.bb | 12 ------------
> =C2=A01 file changed, 12 deletions(-)

Why aren't we seeing that error on the autobuilder?

Cheers,

Richard

