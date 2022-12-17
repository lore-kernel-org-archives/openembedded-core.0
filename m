Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0222EC4332F
	for <webhook@archiver.kernel.org>; Sat, 17 Dec 2022 11:24:40 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web10.5480.1671276280211489639
 for <openembedded-core@lists.openembedded.org>;
 Sat, 17 Dec 2022 03:24:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=FaYi8x1C;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f51.google.com with SMTP id i187-20020a1c3bc4000000b003d1e906ca23so2805125wma.3
        for <openembedded-core@lists.openembedded.org>; Sat, 17 Dec 2022 03:24:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i+xJ+xHzK3uKCq/2cYvmEJVX3T80WGhSmu7suo6f2CM=;
        b=FaYi8x1C2sVfrNvzfaI5KY7IMGbmb0swGk6j1s/C6NBAtAK1mJuopqQfU5wrwMsoAC
         T5R14KGvgyIedcW5HZzr2i1u62O0DgvuA+wSIJdTiHgwD6qFiOdmy9iVP+HQVwfDrfa6
         A5HsYdlfxcuX05/TDaTVhArZbqhRsZ1C0++d8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=i+xJ+xHzK3uKCq/2cYvmEJVX3T80WGhSmu7suo6f2CM=;
        b=cmrFcDPA4t2A6qaTuTzUS84pYbyoeaTcC5MHAIK+rn3p90vBV93mpZJXHhtutWXSG/
         ChsK3TRGEwkxLF7JxTSsLcqMP71454b7vdSkwjpiwuV743Ais/8WH1S5hwcv3yZqFUA8
         cP1pXunQX6ey4EdvPrw5glns1of2EAYmimQKgppHRgOduXAnRC9cVlbF+imFhs6y4tRP
         t0mupg8ikGlheLFmUog7+gsw8axUTo6UlKxQs9R6hRJ+lbsi15vdcaV9AUkzemFLtF+h
         gFgbYAzVUuQHyq8HP//c8LplpeDfxvv3cUAa7VhRsCXQLBLOudwgSFb774Xt1ewj55ZN
         ECOQ==
X-Gm-Message-State: ANoB5pk9LZWVLM3GVDbtSyrNGvjXyJxSNIorFOZlMDguIR73XoFHftvD
	gNe02F7d7NNmJe5+eUSissyI+OWxyYwPjVw1
X-Google-Smtp-Source: AA0mqf735U3rJqGWTBTmMZ2VP7ffH2zcf+h4FDBlsFmR0xcVhrdWzzFiOwhfo+boGoTQI+6sK1Osow==
X-Received: by 2002:a05:600c:538f:b0:3d1:d396:1ade with SMTP id hg15-20020a05600c538f00b003d1d3961ademr27983048wmb.9.1671276278763;
        Sat, 17 Dec 2022 03:24:38 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:17b:a3fe:f7a:35a6? ([2001:8b0:aba:5f3c:17b:a3fe:f7a:35a6])
        by smtp.gmail.com with ESMTPSA id p12-20020a05600c468c00b003cf483ee8e0sm14925097wmo.24.2022.12.17.03.24.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Dec 2022 03:24:38 -0800 (PST)
Message-ID: <46df6fcf18a9a7d44d0f79ee4ecc245edc24dfe6.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] wic: implement bootloader --password
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Sergey Zhmylev <s.zhmylev@yadro.com>, 
	openembedded-core@lists.openembedded.org
Date: Sat, 17 Dec 2022 11:24:37 +0000
In-Reply-To: <20221115144031.89678-1-s.zhmylev@yadro.com>
References: <20221115144031.89678-1-s.zhmylev@yadro.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 17 Dec 2022 11:24:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174774

On Tue, 2022-11-15 at 17:40 +0300, Sergey Zhmylev wrote:
> From: Sergei Zhmylev <s.zhmylev@yadro.com>
>=20
> Currently the only way to specify a password for bootloader
> is to supply a complete user-defined bootloader config file
> to the build process.  This patch introduces a --password
> paramenter in order to simplify bootloaders hardening.
>=20
> Signed-off-by: Sergei Zhmylev <s.zhmylev@yadro.com>
> ---
>  scripts/lib/wic/ksparser.py                         |  1 +
>  scripts/lib/wic/plugins/source/bootimg-efi.py       |  6 +++++-
>  scripts/lib/wic/plugins/source/bootimg-pcbios.py    |  7 ++++++-
>  .../lib/wic/plugins/source/isoimage-isohybrid.py    | 13 +++++++++++--
>  4 files changed, 23 insertions(+), 4 deletions(-)

Sorry about the delay in reply on this one. Wic is one of the
components we have some nice tests for. Would you be able to add a test
for this new functionality to the testsuite please? You can run it with
"oe-selftest -r wic".

Also, do we need some documentation about this in the manuals?

Cheers,

Richard

