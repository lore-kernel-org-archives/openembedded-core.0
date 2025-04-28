Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 618BCC36005
	for <webhook@archiver.kernel.org>; Mon, 28 Apr 2025 09:57:48 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web11.44456.1745834259460375339
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Apr 2025 02:57:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=TSbbIqW5;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43ed8d32a95so40181905e9.3
        for <openembedded-core@lists.openembedded.org>; Mon, 28 Apr 2025 02:57:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1745834257; x=1746439057; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6D43/dIdj9CNJbz+eBqWCJTdzoRwzPev2G0sa9O0Oww=;
        b=TSbbIqW5uCJRvW3VnxI4ZuDnBifsLSaOPRQQKiGNMbn4dJsL17geG3p20Nlm9yOJql
         MsbOaLhV1gka/C6cWUhRsTolxuxrEHF77TD1FqwbdPXzqTlMmybT4rkpCW9eE5O//cqA
         TnqWEbzUz1F7fJay42MIOY+tpBKdKeFX9gqdI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745834257; x=1746439057;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6D43/dIdj9CNJbz+eBqWCJTdzoRwzPev2G0sa9O0Oww=;
        b=sDD78d9VDW7OUrKN2umT84i3JmXVLQpOQ6xbWPvZYg9a14ECHvCIc+OfWqGAWfCq2U
         XrmlS8uI+Fvo78C4AtxDneRtz0VIB0cbvjnpCr/Dj6tLvNU7znje1QqI1PgV2KbUsgpK
         c35I4Txaw979hBLxqt07Yf+LJaIhBogWkI45SSwc6w50DegWdeuChDzkr1XsC0NISJ3g
         RIBoeqcnNkPEynKaZqWI6jL7MiNVaH22uDe3In7qmiLb1sjyxXom9RLKq6fC4dBA8qHF
         1a462u2oqh4ddA79lrsVD47mOXK46bHo4AoxSfP2V0j0s1Kx6Rrts2EUVIdU1vGdVMhw
         t5Sg==
X-Forwarded-Encrypted: i=1; AJvYcCVDAa4t58+eg9CdYR5S2ZTRBWFtonCdlJLKI58HYjxMv9IEh4qCJOMnlaW7iGcXgBOcuwapM3Ii+Wce2bLVjRU86w==@lists.openembedded.org
X-Gm-Message-State: AOJu0Ywrg6I6b7QViB/8dtEwfTa5KACaTQBHHK77hatnuDiKCbmQ7vRx
	yQqGlwXv6x+jjsc0Or4IVAu9AK+f8bwqn9/+YH7qLjsYCdhIOB9sXNMNbV0M9Ds=
X-Gm-Gg: ASbGncuyYuOXgMx29pmz5X4iB5JaXZYXfG2O9Lb0AAhQq0Gnt8sAD0ju2cqraIoqutu
	0TjbIQaSbAaVnZEBHsJKPb2slLZY7ok8sKtxVRsud5l4MhRLRlf3DMYE3cWVG9cfYfkuxiCO9JP
	Ivlp3QtFNHd1Je/YRZLDgnjpllfIrHPaZ+/piwHNRGvjdOvSDLcewxPTnzINhWF3bIgetdTp5v2
	7io8XfAjloo+vXga3oywq7rs9LWm3dWi1UxLJgFshKInhhnem8AJh+FRzmz2zNB+nDUeAVmlvg6
	Q1VWXEKglwt9dQPOkWZAr3fC7s9/OmZCAHxOZ4ucsBEUkMpkDDoUn8ehXHIIgT/ImI6FMRZ2okF
	NjByTifJyp3lWVigeX4Ms7lywC5lALg==
X-Google-Smtp-Source: AGHT+IGbvMLfdU8a+goltWV3yVQudQDzc1IjWjETlr9kxX7PmyMAEObgvlROLeLFB7yq5BwagSaC8Q==
X-Received: by 2002:a05:600c:1ca0:b0:43d:fa58:81d4 with SMTP id 5b1f17b1804b1-440a66b0748mr77575425e9.33.1745834257359;
        Mon, 28 Apr 2025 02:57:37 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:9969:e6a6:49a5:9ef1? ([2001:8b0:aba:5f3c:9969:e6a6:49a5:9ef1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-440a538f4aasm117317855e9.38.2025.04.28.02.57.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 02:57:36 -0700 (PDT)
Message-ID: <ba587b9e48b80f20369dc16613b01b6de9836302.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH V5] lib/classes/conf: refactor qemu.bbclass
 functions into library functions
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Qi.Chen@windriver.com, openembedded-core@lists.openembedded.org
Date: Mon, 28 Apr 2025 10:57:36 +0100
In-Reply-To: <20250428020852.3949557-1-Qi.Chen@windriver.com>
References: <20250428020852.3949557-1-Qi.Chen@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Apr 2025 09:57:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215590

On Mon, 2025-04-28 at 10:08 +0800, Chen Qi via lists.openembedded.org wrote=
:
> From: Chen Qi <Qi.Chen@windriver.com>
>=20
> Move the functions in qemu.bbclass to meta/lib/oe/qemu.py as they are
> generally useful.
>=20
> Now the QEMU_OPTIONS settings are moved to bitbake.conf as they are neede=
d
> for qemu.py functions to work well.

This is the bit I disagree with, I'm not sure these should move.

I want it to be difficult/obvious for people to be using user mode
qemu, it is not something we want to encourage or make too easy.

The reason is that we target many platforms with aren't supported by
user mode qemu. I don't want the project to gain a dependency on qemu
user mode support by stealth.

Cheers,

Richard

