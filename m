Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A41B2C369DC
	for <webhook@archiver.kernel.org>; Sun,  4 May 2025 17:21:40 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web10.32705.1746379295501664693
 for <openembedded-core@lists.openembedded.org>;
 Sun, 04 May 2025 10:21:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=EHyLAY75;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-441c99459e9so2544035e9.3
        for <openembedded-core@lists.openembedded.org>; Sun, 04 May 2025 10:21:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1746379294; x=1746984094; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=2eI6p7VHI73MryObJiCDWXVXvh6wmGYwv9yo0uv5tpw=;
        b=EHyLAY75KMfybJTQRwHUdJCC5lL4Bk4le2ehWfmepMpKVb7nb3pClnGEXHxgF/0KHl
         nyF9e03NpAXz3jE8B8PggZbE5FMTAHNKEH8A57cfSMFqvqGbNg1qesZvXec2xDekeVYs
         jJYNC+DVCuGYb4heiEjrXsoNEkWS7zL/rasmo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746379294; x=1746984094;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2eI6p7VHI73MryObJiCDWXVXvh6wmGYwv9yo0uv5tpw=;
        b=DN7KjefYiLg+JH1wxM1tWR/dRMrPyRP2eL3gFUKBzW2v+ZjHN4V4y9WdUd8m22YcYe
         dMAKDWC9FlUDqze36aXn97z+Dcn/vDqcNy6M4tXbeEQWsS20b5QJiGlNqRKZEe0LzPPQ
         NeqwWFtv9ZFC7NBOqKz6zIjCZOwdFh7XHKjRE2dGb8qcSl+sRL9Y5+emoGYtLPrRtWEh
         0B+fVsy/eRco92ajcSu+0e76acmnnbUMxl09csiWlfYKmGRpzTnZ2cb7OzkkY4FUfrTo
         JEi8w02P3jtHb1ZWx9Snu7mKCNPqEmRabSku/dvbggcT6HWEG8WhUf83g/H2OQLd8k+A
         7Pbg==
X-Forwarded-Encrypted: i=1; AJvYcCUc59Z4jk3hJFEwvDBLF+LihAYltieTlsrnaII6tlQS6Spq5vVbjR11aFX0xt7g13f3jsObxef3FWX8yBpnXVE6Aw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwyhJOToZF6uOmuErYtB3Zi10igmhv3xCLU77DBNLc4WcZP3T1/
	KN7RtfPf6S318uWLFDqY3dwgWs5m+C3eUdwAYdMhhNtqTxDnRCwZgOp3tLpUKHM=
X-Gm-Gg: ASbGncu/DXg+A/kh29T8Iu02j1PtCjs6OxIKW5DmzT0BQ1kgJBlsscBdMeXqKSO7pyU
	EyscqiIpxAImysMReuRRiYtKkwjXOZL888awr+6vIgnJdccD3x8qscW1qZG4M2bPvLD8/RsI77S
	iLsh1/1hCa2mUVbP5TBSAI0vufgXhNz8DQK46sAmrtsSEjnDG55ahlRjZefo1F9cItg8OYQ5/kX
	Bg2kjvnR2irhpHynuFQHWIaSTUXuK519xAXiaJOWV2y/KuFWAKwNgAt02KsRwqx6hJzSk1Rfxs6
	PqZgv10lWJhQA2+iyjYb3p16WuH2PLZn8yPqC+pjkkQtFkyi1Vmu6mKx8ee59gaBpDZNJzVbbf/
	JsyVZyTBe4g3mRXSrhJPdfAoigPXb+Q==
X-Google-Smtp-Source: AGHT+IHDjLmO/qRpAQlGYZsyA1fh9WcPf1552OGswjZW8hYoVCASIPUs+VjYB0CUvcuBXgCB0ixtFw==
X-Received: by 2002:a05:600c:5304:b0:43c:fe15:41e1 with SMTP id 5b1f17b1804b1-441bbea0afbmr93557305e9.4.1746379293745;
        Sun, 04 May 2025 10:21:33 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:994e:224d:4a8f:bee7? ([2001:8b0:aba:5f3c:994e:224d:4a8f:bee7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441b89ee171sm106717975e9.17.2025.05.04.10.21.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 May 2025 10:21:33 -0700 (PDT)
Message-ID: <764880c5403b06cc31af471249e7131cc78ee9a3.camel@linuxfoundation.org>
Subject: Re: [PATCH 08/20] kernel-fit-image.bbclass: add a new FIT image
 implementation
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: AdrianF <adrian.freihofer@siemens.com>, 
	openembedded-core@lists.openembedded.org
Cc: marex@denx.de, l.anderweit@phytec.de, ross.burton@arm.com, 
	bruce.ashfield@gmail.com, rogerio.borin@toradex.com,
 sean.anderson@seco.com, 	m.felsch@pengutronix.de, ejo@pengutronix.de
Date: Sun, 04 May 2025 18:21:31 +0100
In-Reply-To: <20250504130507.717954-8-adrian.freihofer@siemens.com>
References: <20250504130507.717954-1-adrian.freihofer@siemens.com>
	 <20250504130507.717954-8-adrian.freihofer@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 04 May 2025 17:21:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215970

On Sun, 2025-05-04 at 15:04 +0200, AdrianF wrote:
> From: Adrian Freihofer <adrian.freihofer@siemens.com>
>=20
> This new recipe and the new kernel-fit-image.bbclass are intended to
> become the successor of the kernel-fitimage.bbclass.
>=20
> This recipe is an alternative implementation of what the
> kernel-fitimage.bbclass provides. Instead of injecting the FIT image
> related build steps into the kernel recipe, the new recipe takes the
> kernel artifacts from the kernel recipe and creates the FIT image as a
> independent task.
>=20
> This solves some basic problems:
> * sstate does not work well when a fitImage contains an initramfs. The
> =C2=A0 kernel is rebuilt from scratch if the build runs from an empty TMP=
DIR.
> * A fitImage kernel is not available as a package, but all other kernel
> =C2=A0 image types are.
> * The task dependencies in the kernel are very complex and difficult to
> =C2=A0 debug if something goes wrong. As a separate, downstream recipe, t=
his
> =C2=A0 is now much easier.
>=20
> The long storry about this issue is here:
> [YOCTO #12912]
>=20
> Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>

Since the autobuilder is quiet, I put this in for testing. Two failures
so far, both due to world builds:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/59/builds/1521

I suspect this should have an EXCLUDE_FROM_WORLD so it doesn't get
pulled in unless configured?

Cheers,

Richard

