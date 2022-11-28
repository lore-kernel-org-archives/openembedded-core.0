Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75C01C43217
	for <webhook@archiver.kernel.org>; Mon, 28 Nov 2022 10:35:29 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web10.114639.1669631718989414686
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Nov 2022 02:35:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Pc2OAJcs;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f45.google.com with SMTP id t1so8115792wmi.4
        for <openembedded-core@lists.openembedded.org>; Mon, 28 Nov 2022 02:35:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h6mfAkRxTDXCumYm4BsE1sbSAo/ci6sCpkEMmpds1XU=;
        b=Pc2OAJcsmDub5xbCvOFCPfQrPJm3KRyLirfhhgPfInCY0iMnRHtAoLnPYaiRqpjxMt
         ZTqzGYOi2EvgZSJur+toVbEGONgQR3i/tusHIuTw+Qbzkiea/d42tnWaRRuHzu9LE3p/
         v+mhJH5ORYOqYsQShqi3Hl2G6eGvxiJr8nAo4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=h6mfAkRxTDXCumYm4BsE1sbSAo/ci6sCpkEMmpds1XU=;
        b=XPxIWhXC+2nxF5KrxU40TvYiF8kzx5IEGh5d+YG1jWBWRFsvNW9kXFKC7GC8bAqgTS
         2UF2qNuYY9cndrIErr2q086TOS8cGh5pjiUVCtrq4yGWS5m8Of6dOekoErwMV9ROwiCh
         ZYwPAL2MJ2vw/BILr4+ez0toE/nCF5npdNBTGqBZA1e7gPOJjdmnR/N92j74Tp8/7lg4
         jmP5RjR3JDMygCHSiZ7htDFn2DudGg/LJZ+w4HbBrHIITi40QVINY4n0jBcMMdTKxM73
         WwMteDKxo5MepMMXj9jrK5FsU5N2gsCNcU/hGHfW8OclNY90FHj5MWKW5UuYwKOmXdzP
         oPRg==
X-Gm-Message-State: ANoB5pkVEQSr0NbtwAuIwXj8QB6BO7lc0mgUdfnW1gXO50ksH/sOIs7f
	3qZNQuKI3XiaE7gsQVViem5wYrBdNOiBZQ==
X-Google-Smtp-Source: AA0mqf6D7+wAtAsnWq6LwLHKLtjntnx5ugJPRZ7h1ZUE5/tkjcnREl4H//l/Hi9IEE3Tw9Cjz5ppaQ==
X-Received: by 2002:a05:600c:1c04:b0:3cf:ecdb:bcb7 with SMTP id j4-20020a05600c1c0400b003cfecdbbcb7mr35431378wms.180.1669631717316;
        Mon, 28 Nov 2022 02:35:17 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:1da4:7286:b644:a924? ([2001:8b0:aba:5f3c:1da4:7286:b644:a924])
        by smtp.gmail.com with ESMTPSA id r6-20020a05600c458600b003cfd4a50d5asm19082010wmo.34.2022.11.28.02.35.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Nov 2022 02:35:16 -0800 (PST)
Message-ID: <1c87c2ccf74cdb762a671303eae6c3d71ab58a23.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] yocto-check-layer: add option to skip sublayer
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Yu, Mingli" <mingli.yu@eng.windriver.com>, 
	openembedded-core@lists.openembedded.org
Date: Mon, 28 Nov 2022 10:35:16 +0000
In-Reply-To: <20221128081645.3010581-1-mingli.yu@eng.windriver.com>
References: <20221128081645.3010581-1-mingli.yu@eng.windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Nov 2022 10:35:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173901

On Mon, 2022-11-28 at 16:16 +0800, Yu, Mingli wrote:
> From: Mingli Yu <mingli.yu@windriver.com>
>=20
> When do yocto compliance for a layer which contains many sublayers,
> we may just want to check the top-level layer, so add one option to
> achieve this.
>=20
> Before the patch:
>   $ yocto-check-layer-wrapper ../layers/meta-cloud-services  --dependency=
 ../layers/meta-openembedded ../layers/meta-virtualization --no-auto-depend=
ency
>   [snip]
>   INFO: meta-cloud-services ... PASS
>   INFO: meta-openstack-controller-deploy ... PASS
>   INFO: meta-openstack-aio-deploy ... PASS
>   INFO: meta-openstack-compute-test-config ... PASS
>   INFO: meta-openstack-controller-test-config ... PASS
>   INFO: meta-openstack-compute-deploy ... PASS
>   INFO: meta-openstack-swift-deploy ... PASS
>   INFO: meta-openstack ... PASS
>   INFO: meta-openstack-qemu ... PASS
>=20
> After the patch:
>  $ yocto-check-layer-wrapper ../layers/meta-cloud-services  --dependency =
../layers/meta-openembedded ../layers/meta-virtualization --no-auto-depende=
ncy --no-sub
>   [snip]
>   INFO: meta-cloud-services ... PASS
>=20
> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> ---
>  scripts/lib/checklayer/__init__.py | 9 ++++++++-
>  scripts/yocto-check-layer          | 4 +++-
>  2 files changed, 11 insertions(+), 2 deletions(-)

I'm not sure this is a good idea as it may lead to people claiming a
layer is compatible when a sublayer within that isn't?

Cheers,

Richard


