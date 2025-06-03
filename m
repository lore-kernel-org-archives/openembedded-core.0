Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 311FBC5AD49
	for <webhook@archiver.kernel.org>; Tue,  3 Jun 2025 14:02:09 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web10.12418.1748959326356877741
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Jun 2025 07:02:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=WNPTVJlO;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3a4fdc27c4aso1862083f8f.3
        for <openembedded-core@lists.openembedded.org>; Tue, 03 Jun 2025 07:02:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1748959325; x=1749564125; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KgvepQSO7zy2R9gr/Gm+dH1GhYvVWLM0XrDUmUddi54=;
        b=WNPTVJlOanwycmb+/DX/E73J3amP74GgSeUx+PkS+neDolXIvUBewBDFbvNc7c04Gu
         vo6cLw6Xc7zo+ZfdylhrqCSGA0NSdKcqOzA6ZPzLFZxgRtp42TCacfYGc/PumwxW95d8
         Sbxm0q3+6BHn96heBxehILZeE6z3bGOJPWeV0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748959325; x=1749564125;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KgvepQSO7zy2R9gr/Gm+dH1GhYvVWLM0XrDUmUddi54=;
        b=w1/lyHAPlgZXV3G3Xfi55QtmLXrlVSD4/pMcZGUToqoIFTfip4R1EKtcKUgFHmv33A
         cQ77tnKagztyPHG6rZoEv8ZzOdXAnYhcwCmMNQdEsB5yKRi0qR5+CkvNOj6Gu2Vj8N4z
         S1eWAm3Ebgw8TxEsZkpO84RkTD/WRDjNxb2ZbnM3JRWiij0RQ/mjMtW8tkEGU/fzqIV1
         0CXbsoLlsQdf/JCmqxRnHjEgz9NrFRUe6nVe+rRn6wAkF3lNAL9Fd49VxSsmTr5qChXf
         sMQRLrKI0j/8Z78fTQ8hk1IXZMXwm+PglGO9Mpfo4ppbGoUaXKGt4bYrSjDYRlnfJo6/
         bPzw==
X-Forwarded-Encrypted: i=1; AJvYcCWvGBhWBG7ncwa+KCQktL9bOWriARJagOpbK1Yrgkv/3QN3kmIOeLwCUzdW47GCiCimCLCg5AzCKiJ7jc3RxTI3Xg==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yw3JGQPcjxCefDHnLMo5ahznJrsdHyJZK+0XDlTrI1wU2J/hPZ3
	LfA+u3s4gDBWApPtORVOd8qyyDxjS1V4oxzGp7hHSmmKYPThO+ar0Gr22VyLPpmNGXnFf5wJgeV
	fH0jsbmU=
X-Gm-Gg: ASbGncv1B7Z6QnfaMqtOx8xBpTdaGW+P5CWiac2SKK6D3alJsJl2PNg6MZHtOjXrdpi
	wG8BwycYFpU37mwGaEGYWacjwJKrctMPGRoCaNuGdqMj4JrYT1+Cqb0/L+GOYf/cytR9n4p9nb5
	nf9fITUXqzP7nFnfqi6YDVHZ3/+p+/i9uj0P1UyVAMDXCKR8+dgEu4OZq3NQQKDFenBoXGIqSiU
	QK9lrR77G3bUxK+f/yNz40C7Yj6ajfhWJJf1wU2VH3KrGe1EGsJ60Eu7c0+GMbR6nZ3TuAY9tAe
	j6kI/toiGIxQ3hAGeWRVwqtDPuUP7YLD6HpnG5v/jpGU5zQKXNL3orYt66mpzIvMOtUDW00M47H
	HjmSa35LO7PNkIV2fiSiXBpvrM/45mDdsIS2J8jOw
X-Google-Smtp-Source: AGHT+IHoDoUR57/H0u9rfMB2Y0gAOSn46rDKZ0JJwT45aMXGo1xsRFoZg9Tjom1VSe/hxLhS4jsBWQ==
X-Received: by 2002:adf:a152:0:b0:3a4:f8fa:9116 with SMTP id ffacd0b85a97d-3a4f8fa9122mr9579311f8f.8.1748959324252;
        Tue, 03 Jun 2025 07:02:04 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:3864:8101:3606:8242? ([2001:8b0:aba:5f3c:3864:8101:3606:8242])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4efe2b35dsm18276060f8f.0.2025.06.03.07.02.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 07:02:03 -0700 (PDT)
Message-ID: <5c8a9461c90a28845cdcafd8dadcce8ec807b306.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v7 00/20] FIT image improvements
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: adrian.freihofer@siemens.com, openembedded-core@lists.openembedded.org
Date: Tue, 03 Jun 2025 15:02:02 +0100
In-Reply-To: <184582AE5B84DD18.18429@lists.openembedded.org>
References: <20250603082419.409564-1-adrian.freihofer@siemens.com>
	 <184582AE5B84DD18.18429@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Jun 2025 14:02:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217815

On Tue, 2025-06-03 at 11:48 +0100, Richard Purdie via
lists.openembedded.org wrote:
> On Tue, 2025-06-03 at 10:23 +0200, Adrian Freihofer via
> lists.openembedded.org wrote:
> > From: Adrian Freihofer <adrian.freihofer@siemens.com>
> >=20
> > This patch series re-writes the FIT image related code. The goal is
> > to
> > fix [YOCTO #12912] which is a long standing issue.
> >=20
> > Changes in comparison to v6
> > ---------------------------
> >=20
> > * Move the code for exporting the FIT image specific kernel
> > artifacts
> > in a new,
> > =C2=A0 separate kernel-fit-extra-artifacts.bbclass rather than adding i=
t
> > to the
> > =C2=A0 existing kernel-uimage.bbclass.
> > * Improve the devicetree.bbclass to skip error messages of shell
> > globs
> > * Improve the error message in the kernel.bbclass to: "fitImage is
> > no
> > longer
> > =C2=A0 supported as a KERNEL_IMAGETYPE(S). FIT images are built by the
> > =C2=A0 linux-yocto-fitimage recipe."
> >=20
> > Revert a non essential refactoring in the kernel.bbclass
>=20
> v7 seems to have some new failures:
>=20
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/111/builds/497
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/3/builds/1810
>=20
> both in musl.

Build is continuing and this showed up in the world build:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/59/builds/1748

Cheers,

Richard

