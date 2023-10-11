Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3189E92FD2
	for <webhook@archiver.kernel.org>; Wed, 11 Oct 2023 08:45:29 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web11.12223.1697013920173372600
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Oct 2023 01:45:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=TnxL+uw7;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-31f71b25a99so6460684f8f.2
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Oct 2023 01:45:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1697013918; x=1697618718; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=UHb3iRsbuBRlPVsy3ciw4XNpioSK01cZLw+EwH4kqy0=;
        b=TnxL+uw7dx7hMpjBFiJiMR/4i7ZmMavHSIRVuEPFEPWsgIvoi/mENsYW/SqND5Bomt
         LrtieE2c6Rke1kCnHhndM5CFcfeKIJeOHkvHWVDEjzmf1xuUPEzbjgftjD6IMRcHipIS
         XqA6/Lz9MZDu69c93v4g8+ktfOlQDHrT3GxQE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697013918; x=1697618718;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UHb3iRsbuBRlPVsy3ciw4XNpioSK01cZLw+EwH4kqy0=;
        b=RCpAHeMcaR3GfCX43x6fqGGHjBIQ8gOJqBuERYfw4YnZmRpucvIOpfpUV48Zw6t8bG
         Fy1Hu4Rb3P9DW7DPSMO4x7umWOf8up0Yr10cIz3dr5lVZwA3A+Xe/hc0M/vgx+dCMA5J
         +15s4suik5CP2QSiZP1VqxJh5fabMISOREK7pOP3bqQ0wMBGIoVa1BoPcqOjP/QWY8l8
         5f2QcLzeq/V18hmT+yqS2JaPMLXG+LdVFf0PDX+Cfk+SwIp8LUz+NgLCE4TVQsgVIH8F
         enE9GEwGP3GZb97Ocyxgdr5Wlt+CLYbGPqCjMQ9l2GxILgyAgSeeShXHoTTSvlERaavf
         sd8Q==
X-Gm-Message-State: AOJu0YyfruaDkG6f2jTDXjaQjInAYeA4UoGsKUkbTOzTb5GHzSq2uY8f
	R07y/Tb48z15eF3YD4+c22EyF10e6H6t8PXr9U0=
X-Google-Smtp-Source: AGHT+IGf/mtl9WUkKc1gZbIe5+Uvl+jdjvhbfNzqcFw05cUgFq1w0JZMtGzRi1w84n9wlekjjgDufQ==
X-Received: by 2002:a05:6000:14e:b0:324:8700:6421 with SMTP id r14-20020a056000014e00b0032487006421mr17877336wrx.3.1697013918667;
        Wed, 11 Oct 2023 01:45:18 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:af0b:dd0f:66a6:9b90? ([2001:8b0:aba:5f3c:af0b:dd0f:66a6:9b90])
        by smtp.gmail.com with ESMTPSA id dh13-20020a0560000a8d00b00327cd5e5ac1sm232476wrb.1.2023.10.11.01.45.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Oct 2023 01:45:18 -0700 (PDT)
Message-ID: <d0152207a197cc6257f4395f23d222965f7207e6.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] rust: reproducibility issue fix
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: sundeep.kokkonda@windriver.com, openembedded-core@lists.openembedded.org
Cc: randy.macleod@windriver.com, naveen.gowda@windriver.com, 
	shivaprasad.moodalappa@windriver.com, yash.shinde@windriver.com, 
	deepthi.hemraj@windriver.com, umesh.kallapa@windriver.com
Date: Wed, 11 Oct 2023 09:45:17 +0100
In-Reply-To: <20231011040550.1392831-1-sundeep.kokkonda@windriver.com>
References: <20231011040550.1392831-1-sundeep.kokkonda@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Oct 2023 08:45:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188951

On Tue, 2023-10-10 at 21:05 -0700, Sundeep KOKKONDA via
lists.openembedded.org wrote:
> [Yocto#14875]
> The '--remap-path-prefix' option removes all references to build director=
y structure in the debug information within the compiled output for Cargo d=
ependencies and the project's binary.
> However, some references to build directories remains in the final binary=
 in .rustc section in the form of compressed metadata and this makes the bu=
ild output dependent on the folder structure of the computer it's compiled =
on.
> So, for reproducible builds, use the configuration option 'remap-debuginf=
o =3D true' along with the '--remap-path-prefix'.
>=20
> Signed-off-by: Sundeep KOKKONDA <sundeep.kokkonda@windriver.com>
> ---
>  meta/lib/oeqa/selftest/cases/reproducible.py | 2 --
>  meta/recipes-devtools/rust/rust_1.70.0.bb    | 1 +
>  2 files changed, 1 insertion(+), 2 deletions(-)

Thanks for that!

I know this has taken a lot of work to get to the bottom of. It is
great to have OE-Core at 100% reproducible again! :)

Cheers,

Richard

