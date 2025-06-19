Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96B74C7115B
	for <webhook@archiver.kernel.org>; Thu, 19 Jun 2025 12:45:54 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web10.13997.1750337151898598473
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Jun 2025 05:45:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Ndu6LF17;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-442fda876a6so6407115e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 19 Jun 2025 05:45:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1750337150; x=1750941950; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=zOMYtg+pcknF+jBEZ/mRTPreDFvn1IuPF2eLZWmGwr8=;
        b=Ndu6LF174QrpVKchxqKRJs6N72/eN42fn8zu18Z9EENXzkFXXgy5t6/ifEuqp3jK5D
         zPCv83S9vfdzfLD8K3fn/8U6YazjHeOiSQuePXpMlF8eUpbPf+Go6R04RQHomKNtPvfN
         LIMBTCTmo0Ft+Exb+Bx8vvE/cIxEYMB+gBBc0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750337150; x=1750941950;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zOMYtg+pcknF+jBEZ/mRTPreDFvn1IuPF2eLZWmGwr8=;
        b=mopVQe/lRWfclNbvQw8A5dHbtaHJSCcH1iAi3RpcihzjHsXshmBYaWliPHQSma5uYs
         zuIhJ1W9iWGACzU9wCeIcplxNn7VcpSS1ySdx8/dYePJ9jaTFJmuxTEDx52NOscfr8Bo
         dMGvWV43KPIW7zGs74eqzO5zH22d2saoq/sCsPnta+i25mSzkXo0WrOQ/VvD29/yKDtW
         AX2+Hc7AuK9g453jWVb8g/28RKbz3K0sr9yMtHVGZBPWR3qHwQCqsDY5vzJFNbaUIxHH
         0xzMr04MII9CEFee5YxAOJLYuIruw3B/Kys/cB95i7WqnhMLGCOvp1dkdCPTnTKo+F0q
         jo+Q==
X-Gm-Message-State: AOJu0YwZJl4OlsZyjc5oal1llpNiuPuILmqEJipxaIMHFGr4EY7beDRX
	X5yJkY8+KmNKebi0NyC9GDJtpEfS91ieMH9THp003OXYkEu85EhvMo3GxMJphWctR/U=
X-Gm-Gg: ASbGncvfRhesRb1VOJrK3/9y14S04RtjwtmSBlVvp6oNpLMezaIlrlxp8qfGd0D7aRK
	wTplj5U+jVKgAXfDTC8vP8MIieZ9Vpj7wPH7UMa4NBnavysDzc23xQNQSfxfCPBrGvh3ATvchoy
	YvyI8pWlQwrDN+VH7MOKsRnY8BEPZfEJLMDs385+G1Ul8SjADTE65PN1MCMjubtTI5IwfPWpubd
	sSFtTK3obS2xEpPyedlo7I8uQf3XpMmonljfBghGyzCpW4hGORl54a4mK0GpBPmuoRGmRbA91E5
	Qj1FqBhDtpI/vdenwr2SXsVew6EnyXcTLYy2ZQV2X18VTWo/P9ipDHfyC29hoEvMmtU2uSBVXr3
	J6YG8ZJVDpDDn0zYpQzKGVfF6nhOn4nFIOePjQk5MDJ0lNwA5iho=
X-Google-Smtp-Source: AGHT+IEeNbp7vAI4jyiNASD6Wu7ODHeh7hmt9A+uVE06C+auZfUGYvpb6BRjQfsO28qpdDczrG/VSw==
X-Received: by 2002:a05:600c:1d06:b0:450:c20d:64c3 with SMTP id 5b1f17b1804b1-4533caad17fmr207503955e9.18.1750337149891;
        Thu, 19 Jun 2025 05:45:49 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:3cd0:8416:eb6b:7b5e? ([2001:8b0:aba:5f3c:3cd0:8416:eb6b:7b5e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4535e993b72sm28450005e9.27.2025.06.19.05.45.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 05:45:49 -0700 (PDT)
Message-ID: <97a02d26042945f79cdc8a4a7099afbf93079d6b.camel@linuxfoundation.org>
Subject: Re: [OE-core] perf: nativesdk
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Andrej Valek <andrej.v@skyrain.eu>
Cc: "openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Date: Thu, 19 Jun 2025 13:45:48 +0100
In-Reply-To: <3647d65b-e79b-46e4-83e9-46b17762934b@skyrain.eu>
References: <7dee70c7-d0a8-44ea-94a1-2c4be581208e@skyrain.eu>
	 <dcf64e281e9fd6a81d3e3ec9fc7088c1cd09d06c.camel@linuxfoundation.org>
	 <3647d65b-e79b-46e4-83e9-46b17762934b@skyrain.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Jun 2025 12:45:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219073

On Thu, 2025-06-19 at 13:44 +0200, Andrej Valek wrote:
> Yes I know, that is bad, but I solved it already with other way.
>=20
> On the other hand, maybe the lines in kernel-yocto.bbclass should be=20
> target specific.
>=20
> do_kernel_configme[depends] +=3D=20
> "virtual/${TARGET_PREFIX}binutils:do_populate_sysroot"
> do_kernel_configme[depends] +=3D=20
> "virtual/${TARGET_PREFIX}gcc:do_populate_sysroot"
>=20
> I think, that dependency to gcc-cross was done like:
>=20
> linux[do_kernel_configme] -> gcc-cross-aarch64 -> linux-libc-headers.

It won't be those. kernel.bbclass does:

DEPENDS +=3D "virtual/cross-binutils virtual/cross-cc kmod-native bc-native=
 bison-native"
[...]
# we include gcc above, we dont need virtual/libc
INHIBIT_DEFAULT_DEPS =3D "1"

and virtual/cross-cc will expand to gcc-cross-aarch64.

There is an assumption that nobody uses nativesdk with kernel.bbclass
in multiple places.

Cheers,

Richard

