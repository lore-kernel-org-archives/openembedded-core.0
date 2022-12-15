Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DB47C4332F
	for <webhook@archiver.kernel.org>; Thu, 15 Dec 2022 18:03:13 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
 by mx.groups.io with SMTP id smtpd.web10.140521.1671127392562188138
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Dec 2022 10:03:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=UH40TtsG;
 spf=pass (domain: gmail.com, ip: 209.85.167.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f43.google.com with SMTP id j4so16958657lfk.0
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Dec 2022 10:03:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7pPJiSjag3oIoSWvBqgXxQIlXvfazGfFBZfCp6Tc/xM=;
        b=UH40TtsGxzjRV2WytMMMUD47BWEOjiMKGOSiRjVTmvTRQ7XKYznDoD5NdwMuW3PeYP
         NxbR8lKuIYAprSFwRdDYMuaE4x67szb1vMDfwE8v9c4HSg0aYomH3hImdlqpLxM6dgzn
         +JbYM0XTyK+PRtqKE/P/NO2swhSY0oka/0Hx8vpfJm11LklAUxHwYYmL2tybfJ5nyfHj
         4tmb2t/T8HyxwefInrKJsIyEKWQcnJfV2DApfLpmOgffyvbCTLIgfFgiiUWJLlWd5V78
         S1aXGgrBBMGpEFmPr2CLXmkMfbWoEEdd8O/JrEf2aYozLB2kWm/zEv8PV6FIbjk49ROv
         sGpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7pPJiSjag3oIoSWvBqgXxQIlXvfazGfFBZfCp6Tc/xM=;
        b=sENmU/i6vNN1w5XSWj6VUV1Lt3rrfpz2rbf0OCIKkzn8Nd829STkHaJ1vlwnWVZYjd
         uUj7TLy+T11eEtxSR9MNMKt9fegxnRYUSZ9RK6Z8JXdQzpTaEw1c6KX3Pk14IEYXMF4/
         qE7IKVyu9i1exlY7i6ksBARDRWCv4MiL6UJHnHy1F8ubo7okvQJIqUQA3eWh2Kx7jBXv
         q+emC3HUz6PLWfWVUMdC+IQl+5cdp03WHBXXxyJ2SAs//eD8chdYCgdtucVMT899Vtnl
         DXjcBjWQrkH6CEZQQ185rbzaVrfTxBOTDJWXIo7e2N51h/Do12/aFmNido+v7l85Tajp
         0H4w==
X-Gm-Message-State: ANoB5pmp4I4av/BtPTSCNgb+J1901cHP3T0+5Mp9F8WJbB9sVg78hWYF
	4fCUCo6a/dIPAvdwRAxsjXb4SHFliAPOZlMZf+0=
X-Google-Smtp-Source: AA0mqf7pVF4Y2t3LeZnbknSSdWf2eQ0AsOWPVfFZRSm0Vcb3MEglSlolxw5zSXEp4dH2lVfHHA6d+ezzvKTKV5ICC4E=
X-Received: by 2002:a05:6512:259f:b0:4b5:a6ba:b1e4 with SMTP id
 bf31-20020a056512259f00b004b5a6bab1e4mr2806218lfb.393.1671127390669; Thu, 15
 Dec 2022 10:03:10 -0800 (PST)
MIME-Version: 1.0
References: <20221215073224.3061128-1-alejandro@enedino.org>
 <CANNYZj9qbT+fGQ=18hjLkzR4D=eyr1amX2qxpwM5u_XQTqLo3g@mail.gmail.com>
 <CAHMutrae2sCtGqa-aXVYz1_kDkCtnY2qjKLhGunA-U3-ZxthnA@mail.gmail.com>
 <CAO5Uq5S2reaaVJe7hZwL2okWjKBbVhU_=g6bMjguQ7T9UNC-Vw@mail.gmail.com>
 <CAHMutrZnL2e4_7AuPkacEb-Rgyw0cb7eaErjWRuXZYXu_fUZgw@mail.gmail.com> <1731096B411C6A99.9432@lists.openembedded.org>
In-Reply-To: <1731096B411C6A99.9432@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 15 Dec 2022 19:02:59 +0100
Message-ID: <CANNYZj9BmxffYxhd1gWy6dUBcsjHi6kXgswC=4LVXUnePSOo1w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] rust: Enable building rust from stable,
 beta and nightly channels
To: alex.kanavin@gmail.com
Cc: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.org>, Alex Kiernan <alex.kiernan@gmail.com>, 
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Dec 2022 18:03:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174588

On Thu, 15 Dec 2022 at 19:01, Alexander Kanavin via
lists.openembedded.org <alex.kanavin=gmail.com@lists.openembedded.org>
wrote:
> Ok, I think what we should do first is to actually drop the version
> from all of the .bb file names, and set it once, inside some .inc, and
> probably next to SRC_URI and tarball checksum. Then this should allow
> a convenient scheme for including and overriding things.
>
> rust_1.65.0.bb - > rust.bb, and so on.

Oh, and upstream version checks must be kept functional. It needs to
both correctly report a newer version, and match the recipe version
with upstream if it is already the latest.

Alex

