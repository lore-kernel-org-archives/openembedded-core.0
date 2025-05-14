Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D31C0C3ABDA
	for <webhook@archiver.kernel.org>; Wed, 14 May 2025 22:33:14 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web11.446.1747261993691842231
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 May 2025 15:33:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=TKg4JryH;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3a0b9625735so148199f8f.2
        for <openembedded-core@lists.openembedded.org>; Wed, 14 May 2025 15:33:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1747261992; x=1747866792; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=SevNKBs/pC9TvY5EwdyDzuju7FsFkHbG3zVNZz0094Q=;
        b=TKg4JryHg+Qpk6EP9KZ2UCnC7SqpjAvnoF6TfZuAmf2waB6owYNRRHg0X4MqPXVz3I
         3fJshcqlzop9UtLHCR2g4bMBtu6CRqTQrr6Gofxw1xEHuGW/Ni0z6tZ8fSGrP6lUF6bt
         RPZRDYVjdSIQ0l+s/w5c5FEcWKZmt9gOdSVDo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747261992; x=1747866792;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SevNKBs/pC9TvY5EwdyDzuju7FsFkHbG3zVNZz0094Q=;
        b=P/ECzRVz4rpOenrxeVKHxtqIWI0VxXW0X8RcgHM1Jd+OhiJbi8H4qLSDwRno27R67/
         i9G1nOHW2t+rHEVuzpfkHYW6yyvhtExVwcxeGMFTe9zwMJbCmOVNyhkRmZfdfWZRBOE8
         2AhTQ6sIzv9SvkH2AvUsLyE5u5oUz8//+egj/h8n+/JOFs/rVtQ1bns5meGc4YlGZDxP
         flnJqzoa4bQTA94eyC4tC35hgB1GUk9a4wEPcTYKBs0cW2bV9X1VW89RaPo/qmqqfnl5
         ggr97JIx1FTlgNnqmnsT+iq/eLvieBkwMRnhG6nUw5VyoxrRvYikl3vak2zJrRW9W0Zf
         GOpg==
X-Forwarded-Encrypted: i=1; AJvYcCWFT8fyw0vebou+cLTrZ+raOnL5oaxyha0Rl31y9WJlfzn4mNuUhTt1EskUXE7uAuiCkw44OZoEv1pzPVJlaHFYxQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwyrvahjRm4rMky08zU6ka3E1nQu9ZJN22dFon/SAARiOf2IpXO
	xb5nSBRgWHxGieJpzjuG9RU8Jhe8XaLgin+zX7nwAtP0tzoOMtOxAFKMpGL2BxI=
X-Gm-Gg: ASbGncsWM6YyoKfTX4fO64GQZ3XkDyDYp1lrwwQya5kdwkteHVhIT2suO8dc1YfYHnQ
	bbPVEYhUXG+8ElI2wyaWQ/Hfr8Z8+3PTNmHyAkZ9OHgbMQ5kkK8P7Q3p5D1ZHVpwhhOPll7EAO1
	RKAve3e8XsUD8AMvrajPFM9Ps26tVVvcMJj0RqEluEhSSnPF+l1NNJ7bzumha5w6033+o9pnYLA
	Qrc40NVseiH/nlfQLh1NneXE8TFTy1ipdsRt58/rafQI94lkOwijPdlvD0pTb40A+R2yXhF4KNK
	p2QM+QF+vu6vm7367u5CaTR2mJZMRIq7tttDhkp3kawzywu21pjIR5Bc4aUfvRJYNayNpP3ePMp
	IJvZYRBlZRKve/wmSw/3pQT0na0PYKK0OrEi1RN5A
X-Google-Smtp-Source: AGHT+IGEXXWwAgIVctkAfhH9hqhxdC6IRMRtDXNzUVZF/mhyc61FDbcyla52PWbapZiOGjZaQE7mgg==
X-Received: by 2002:a05:6000:2481:b0:390:f738:246b with SMTP id ffacd0b85a97d-3a3496a4f84mr4452406f8f.15.1747261991589;
        Wed, 14 May 2025 15:33:11 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:ac80:8bbf:3444:fa34? ([2001:8b0:aba:5f3c:ac80:8bbf:3444:fa34])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f5a2cf43sm20935399f8f.70.2025.05.14.15.33.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 15:33:09 -0700 (PDT)
Message-ID: <f16212440c46a2075d1342def0677e81f9ffedf2.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v3 00/22] FIT image improvements
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: adrian.freihofer@siemens.com, openembedded-core@lists.openembedded.org
Cc: marex@denx.de
Date: Wed, 14 May 2025 23:33:08 +0100
In-Reply-To: <20250514185225.162998-1-adrian.freihofer@siemens.com>
References: <20250514185225.162998-1-adrian.freihofer@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 May 2025 22:33:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216553

On Wed, 2025-05-14 at 20:50 +0200, Adrian Freihofer via
lists.openembedded.org wrote:
> From: Adrian Freihofer <adrian.freihofer@siemens.com>
>=20
> This patch series re-writes the FIT image related code. The goal is
> to
> fix [YOCTO #12912] which is a long standing issue.
>=20
> Changes in comparison to v2
> ---------------------------
>=20
> * Fix the multilib exclusion check linux-fit-image -> kernel-fit-
> image
> =C2=A0 This should solve the issue with bitbake world and multilib builds
>=20
> Changes in comparison to v1
> ---------------------------
>=20
> * Exclude recipes which inherit the kernel-fit-image.bbclass from
> =C2=A0 multilib builds. This fixes an issue discovered by the AB when
> =C2=A0 running bitbake world with a multilib configuraton enabled.
> * Remove some new tests which expected openssl from the host.
> * Rebase the patches on the new bug-fix commit
> =C2=A0 "u-boot: ensure keys are generated before assembling U-Boot FIT
> image"
> =C2=A0 from Rogerio Guerra Borin <rogerio.borin@toradex.com>
> =C2=A0 This fix required splitting the key generation into a separate
> recipe.
> =C2=A0 Note: These patches depend on this commit, which is included in
> this
> =C2=A0 series. As of today, the patch is already present on master-next.
> * Add a cover letter with correct subject for the patch series
>=20
> What gets fixed
> ---------------
>=20
> * sstate does not work well if a FIT image contains an initramfs.
> =C2=A0 The kernel gets re-built from scratch if the build runs from an
> =C2=A0 empty TMPDIR:
> =C2=A0 https://lists.openembedded.org/g/openembedded-core/message/203510.
> =C2=A0 This is also problematic for SDK use cases since working with the
> =C2=A0 SDK is annoying if the kernel gets re-built from scratch for no
> =C2=A0 good reason.
> * A FIT image kernel is not available as a package, but all other
> =C2=A0 kernel image types are.
> * The its-file is generated by complicated shell code with lots of
> =C2=A0 code duplications. Switching to Python simplifies the maintenance
> =C2=A0 (also because of the indentation with spaces and tabs in the shell
> =C2=A0 code).
> * Separating the FIT image related complexity from the kernel build
> =C2=A0 complexity simplifies the maintenance of the kernel but also of
> =C2=A0 the FIT image related code.
> * There is already a new (but unfortunately completely unaligned)
> =C2=A0 implementation for creating FIT images in meta-openembedded:
> =C2=A0
> https://github.com/openembedded/meta-openembedded/blob/master/meta-oe/
> =C2=A0 classes/fitimage.bbclass. Let's hope this patch series will lay a
> =C2=A0 solid foundation for a future merge of the two implementations.
> * The new implementation in Python is also a preparation for
> additional
> =C2=A0 features, such as adding different types of artifacts or generatin=
g
> =C2=A0 the configuration nodes with greater flexibility. Currently,
> exactly
> =C2=A0 one configuration per device node is supported.

I'm wondering if this series resulted in:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/56/builds/2/steps/=
11/logs/stdio

(qemuriscv64 issues)

The python3 failure is my own change but the uboot one is something
else.

Cheers,

Richard

