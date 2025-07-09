Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E719AC83F03
	for <webhook@archiver.kernel.org>; Wed,  9 Jul 2025 07:58:52 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web11.10284.1752047922969268275
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Jul 2025 00:58:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Cr5jEV60;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-451dbe494d6so60097135e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 09 Jul 2025 00:58:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1752047921; x=1752652721; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=pgTVACs51dSHlC6q61SZ+he0cXqs7QuztMqaJmA51fI=;
        b=Cr5jEV60RyJWGGx7AJg3uQ542nVkti0+UB0gMH9sZMsp2kYz7AgPf38Ny0+f4teos8
         nVvCaRZB/RhW8pGW74mo/sQv5oukOHeLuLQaAjusojMMouG1VErUIqfHJ0ZQez7cQU7g
         fOfV1rWwNlDTf8ylw9jwfZGA2p9zB32Hm5+Gw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752047921; x=1752652721;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pgTVACs51dSHlC6q61SZ+he0cXqs7QuztMqaJmA51fI=;
        b=j8t31TRilRQ21dMdWInYrgWY7q07+5zIR/DlKxF0vWWItZxONXuWVFgNzO7mPLeYC6
         37+GKhrSNFy3eGI/hqGGxHDtbLTslFj5uaidNp7UneAxAJBUtFxXKnKk//uC6l1u1fq0
         1L8xQk6WRhjjMEbPrDkgZxJCnlLY/My+ak22W+ykwOb6V3TnCPN87mEJ6Fq+tM4eCdm9
         Gn6a3cJUTxx3OPvapUJs8SoVlrqi1hZoWRGE4k4nAOT8/pqm4gOMqARolYmhc4gtLKXV
         2U085s3E/nlX2MkEKRMVgl+tJeJNIamd7caz9JQROy4qMjVT32snRcHQlgQrBT2gzM1j
         6h4w==
X-Gm-Message-State: AOJu0YzzEp1l77jSrUQeoUecaFcoxzCb6foc6aPB+SZD6HZn9gaSICs0
	yVfu2ldKtYGbtOyub+90lgrI1ODLpLGbTZJN65e3RjOX9oqcMC0MWamDagVPkTWENSg=
X-Gm-Gg: ASbGncsVIffSs7p79Z25H+mBkXbCj8Pl+LuMdjoXKaL4+N4agSe7IJNw/3TISFvPZ2v
	H3ghZU9MKhudNTXr2IYzoqgnkL/FKMkBu5K3DKo0N7Wso+x0NNtuDye7W5RgFnyM9abu8VeSQsS
	Kk/fNPwIFsMe1q4sgjsRzAb9OXJyKu/H2j/g237IPUoaEBISmnVyZFs3gh6Zf/Vr8b9w+tlqbiQ
	etQGYNa9F9le2+gFLI86nptUEdSkJKtHPECVMuiKh9KfdnTOKd6xBZJ6A5tzlbyx2Iov9qGtRZx
	nBBj2T1mqCjkw/lAiAzewAUOiS97D5arXtzYRSKgmVghY93r/1iWObCKQ7NkKFX7TMnFBFz/Q2K
	e4BLkv/CnuXcPhgeoKu+GofWo1Oikj09w3TGOMK0YeV0XOuVxPSunQ2H+5QQ=
X-Google-Smtp-Source: AGHT+IHulON9rU/S7dDBz5/D4OPgpdifZyZTxsredX3k7rh7utguddVwKn0VwoznA2QFANTnxf4EXA==
X-Received: by 2002:a05:600c:4fd1:b0:439:643a:c8d5 with SMTP id 5b1f17b1804b1-454d5246294mr12869135e9.0.1752047920905;
        Wed, 09 Jul 2025 00:58:40 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:8726:2b2e:9de:f840? ([2001:8b0:aba:5f3c:8726:2b2e:9de:f840])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454d5061a91sm14065555e9.17.2025.07.09.00.58.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 00:58:40 -0700 (PDT)
Message-ID: <196cdceb3c5f14f1d3b0a58ef9c7020e3a39049b.camel@linuxfoundation.org>
Subject: Re: [PATCH 0/6] kernel-yocto: consolidated pull request
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: bruce.ashfield@gmail.com
Cc: openembedded-core@lists.openembedded.org
Date: Wed, 09 Jul 2025 08:58:39 +0100
In-Reply-To: <cover.1751985223.git.bruce.ashfield@gmail.com>
References: <cover.1751985223.git.bruce.ashfield@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Jul 2025 07:58:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220079

On Tue, 2025-07-08 at 10:36 -0400, bruce.ashfield@gmail.com wrote:
> I'm clearing the kernel queue now that I'm back at the office.
>=20
> Following this will be libc-header updates and a bump to the new
> release/reference kernel version (v6.15 ... or possibly v6.16)
> depending
> on the timing of the upstream release.

Thanks, I tested these and things seem ok so they've merged.

You asked about updating the CVE list, we do need to do that. I looked
up the commands and those appear to be:

git clone https://github.com/CVEProject/cvelistV5
meta/recipes-kernel/linux/generate-cve-exclusions.py /my/checkout/cvelistV5=
/ 6.12.36 > meta/recipes-kernel/linux/cve-exclusion_6.12.inc

Cheers,

Richard

