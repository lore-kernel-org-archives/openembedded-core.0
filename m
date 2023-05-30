Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7C75C7EE2C
	for <webhook@archiver.kernel.org>; Tue, 30 May 2023 12:24:01 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web11.8333.1685449441068307074
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 May 2023 05:24:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=M+dK6WcZ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-3f6077660c6so29595755e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 30 May 2023 05:24:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1685449439; x=1688041439;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=6+ZUBlXXEGLpMLikoBKunBCOvxHUlEQbRlPhJYz1or8=;
        b=M+dK6WcZWTeyp2g4domTZTuZNNlWH2gH3oOYO9qbnDwi8VeQaG16FCYL5ww9ldbk4e
         lDdEP+ilrK+/kEShMRySBvLEGgsUX+icUfCBwhMGOFejxWXGIVWzy1DL4ttajo4U2Uig
         AA8Aq6OAiioddVZ2I6HSFz3a3/bRJy2FF2Dec=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685449439; x=1688041439;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6+ZUBlXXEGLpMLikoBKunBCOvxHUlEQbRlPhJYz1or8=;
        b=hgHe8uhc3XX3H76e96+MwRp9GkMQTTT3QpnciAEMcixrw56BDceoZwoHXmHO6IarAS
         pGAlFnW9X+kGH287osE7u52PiXuzUiBNDDipZI5eBjQsF9+Vjn1pb9JCC25goyAlrQ08
         tFM2vUaNvkiFt1OM1dVltK2QAsestPfDKWwAb3Gkb0w/Fpun7gQ6Zdm2OBOH1k4jKWDG
         eTivhpNmgmMFxdDaGftLRpaLtmHqWcNMw6ewpo/eFXunU7cJECXMO81b3JL0kc5JiGDG
         uDWDuKACJcDKVvt5obnHZiuQEG/EgPJ+Tz8puXC8+28PXUcHtvpu3NdN0oPNAv6lzga2
         ZGWQ==
X-Gm-Message-State: AC+VfDzBG39/CzIqnmgMoIRG5KT8psCcU4LkWNr/f1bUgkbbkeT07uY3
	5Ket402X2ZnLKxAlqggob9bkHg==
X-Google-Smtp-Source: ACHHUZ5vyVSQy99Ep1LU9bT5DiVA4Hqt2oFG2iC9NKAQwv7RdM9LHrZZkyrtrVu+MKfQX0MgKo1uOQ==
X-Received: by 2002:a05:600c:b49:b0:3f4:2452:966a with SMTP id k9-20020a05600c0b4900b003f42452966amr1492559wmr.27.1685449439182;
        Tue, 30 May 2023 05:23:59 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:f1a1:bff7:58e4:eab3? ([2001:8b0:aba:5f3c:f1a1:bff7:58e4:eab3])
        by smtp.gmail.com with ESMTPSA id f8-20020a1c6a08000000b003f41bb52834sm21049696wmc.38.2023.05.30.05.23.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 May 2023 05:23:58 -0700 (PDT)
Message-ID: <0570392a611b9b31ba3cf34300462849e4b37b88.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v4] Fixes pseudo build in loongarch64
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: zhangjialing@loongson.cn, openembedded-core@lists.openembedded.org
Cc: Mark Hatle <mark.hatle@kernel.crashing.org>
Date: Tue, 30 May 2023 13:23:58 +0100
In-Reply-To: <20230530113302.1473632-1-zhangjialing@loongson.cn>
References: <20230530113302.1473632-1-zhangjialing@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 May 2023 12:24:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181918

On Tue, 2023-05-30 at 19:33 +0800, zhangjialing@loongson.cn wrote:
> From: JiaLing Zhang <zhangjialing@loongson.cn>
>=20
> Fixes [YOCTO #15110]
>=20
> Some functions used in the project have been removed from glibc. After th=
e removal of these functions,
> the architecture in glibc will not include the removed functions.
> This patch resolves the usage and compilation issues on the loongarch64 a=
rchitecture

Whilst this might make things compile, I'm not convinced this is right.
I suspect that with this patch applied, you'd miss intercepting some
function calls that need intercepting.

As far as I can tell, the __fxstat64() function and friends should
exist even on a new architecture like loongarch64. Are you sure these
don't exist in a loongarch64 glibc?

Cheers,

Richard

