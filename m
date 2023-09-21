Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AB35E7D0AE
	for <webhook@archiver.kernel.org>; Thu, 21 Sep 2023 21:38:24 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web11.8112.1695332301517837067
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Sep 2023 14:38:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=YTRcVDvm;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-405361bba99so10034395e9.2
        for <openembedded-core@lists.openembedded.org>; Thu, 21 Sep 2023 14:38:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1695332300; x=1695937100; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=lYEtRwFr4+EbMXW43M/JylBl7NX+lA9okUTP2Wgg90w=;
        b=YTRcVDvmDSFZgfgOrzj2/DzaPmftS2Y/+yZXih8b6dlH4r40GpRn9/y+38/uZ+3KfY
         nhtYwEVzrwarLtNqGs6UxPuhSYYAKeCZZ9v3NMRLfMznh5GWsLdugdgqbZnmDh4WhvjC
         LimRt0Q6qW1oepfdhNhQoyV2VwVhpHJ2023iM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695332300; x=1695937100;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lYEtRwFr4+EbMXW43M/JylBl7NX+lA9okUTP2Wgg90w=;
        b=p1wKSfBt8EuXsI/eyLE8Ei45+tGaXACsP4zMlLmirpVbnOAVhz4fd30Fenge9yUtt0
         /FDIAkiukeWO/Adn9ggxl13PrA32gFwkzZai5g4dDhEQgvy0a9pEzVpytcGX8bem3MGR
         nHiV38y7ybw7v7j0O7h/meApR/OgfKZDyQRhdchy8Nas/DD/OyDgXDa2eLVt6uCiMyI7
         AxeYq6A6I7KUN7/2kbeODenJplcew9NvfmakNpXxPP4iGWI0Dgzj35rfBmj8NArgLVFz
         kXlY6xPPhpySYEsHi9O6O3DcxF0aJDg2JE7p2AzhStnEQCXBvMulX7JQD3VY850WR88B
         Ifcw==
X-Gm-Message-State: AOJu0Yye+pmBmyCqF2UKWYxglckSadvGdXMqBUb5q1nQIcnb7yxC1bHf
	84IVpjBKIm1VCS8sVWyJiwLZLQ==
X-Google-Smtp-Source: AGHT+IFAH0jBxKcu2Ebrx68CcqBuvALAptMG68ErKlzH13B1dtHV/8l1a1QT2KAn/+edKJBOE38k3Q==
X-Received: by 2002:a7b:cd9a:0:b0:3fe:5053:1a0b with SMTP id y26-20020a7bcd9a000000b003fe50531a0bmr5883823wmj.11.1695332299642;
        Thu, 21 Sep 2023 14:38:19 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:f6e4:1bee:736d:f9fd? ([2001:8b0:aba:5f3c:f6e4:1bee:736d:f9fd])
        by smtp.gmail.com with ESMTPSA id n6-20020a05600c294600b0040472ad9a3dsm2845344wmd.14.2023.09.21.14.38.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Sep 2023 14:38:19 -0700 (PDT)
Message-ID: <8877130f9509c293256341f999e15ea40dc588c7.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 0/8] oeqa/runtime/parselogs improvements
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Ross Burton <ross.burton@arm.com>, 
	openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Date: Thu, 21 Sep 2023 22:38:18 +0100
In-Reply-To: <20230921134833.582827-1-ross.burton@arm.com>
References: <20230921134833.582827-1-ross.burton@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Sep 2023 21:38:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188027

On Thu, 2023-09-21 at 14:48 +0100, Ross Burton wrote:
> From: Ross Burton <ross.burton@arm.com>
>=20
> This is part one of my parselogs series, which clean up the code
> and refactor slightly in preparation for a more exciting part two
> which I shall send shortly.
>=20
> Ross Burton (8):
>   oeqa/runtime/parselogs: remove unused imports
>   oeqa/runtime/parselogs: don't bother to show target hardware
>     information
>   oeqa/runtime/parselogs: remove obsolete LSB testing support
>   oeqa/runtime/parselogs: inline single-caller functions
>   oeqa/runtime/parselogs: improve find call
>   oeqa/runtime/parselogs: don't pass around members
>   oeqa/runtime/parselogs: move some variables out of global scope
>   oeqa/runtime/parselogs: select the correct machine-specific ignores
>     early
>=20
>  meta/lib/oeqa/runtime/cases/parselogs.py | 109 +++++++----------------
>  1 file changed, 33 insertions(+), 76 deletions(-)

This might be too exciting already!

https://autobuilder.yoctoproject.org/typhoon/#/builders/47/builds/7818
https://autobuilder.yoctoproject.org/typhoon/#/builders/110/builds/6710

I've noted the helpful error messages, presumably from setupClass :(

Cheers,

Richard

