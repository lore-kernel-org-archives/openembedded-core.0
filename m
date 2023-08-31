Return-Path: <bbara93@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62392C83F10
	for <webhook@archiver.kernel.org>; Thu, 31 Aug 2023 10:22:55 +0000 (UTC)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
 by mx.groups.io with SMTP id smtpd.web11.13620.1693477372304968381
 for <openembedded-core@lists.openembedded.org>;
 Thu, 31 Aug 2023 03:22:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=pcLi5NXv;
 spf=pass (domain: gmail.com, ip: 209.85.208.175, mailfrom: bbara93@gmail.com)
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2bcc14ea414so12317991fa.0
        for <openembedded-core@lists.openembedded.org>; Thu, 31 Aug 2023 03:22:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693477370; x=1694082170; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Kxzq6ezTfLdDZyL1FNnBKITFbzU8tZtMOaTMdseKSzQ=;
        b=pcLi5NXvGPWrhRu9vx5f21qgLzcgwfI+MamuOeam5Dc/Lu6HBdqLEru9guW/HFkBan
         edlrgPFVxwISM5CDCT5hH8MGkx1nKNJvZEqC/QUI4TwNIcrzOZnHjcEOOCMEechzCdAD
         qydSCfCqh7gCJyHHS+00kbjwLCOReMQCx3ZFRSLvNUXC3MoZA5H5i+sx7yCxsgvRN0LT
         bpx9zDw4HdYfkN9rA6BXJNNUli2XEWTu1UGoNAvcaWzT1cmvWRRQbn7u80XPVbfHGD1L
         4lPsVFsvdv1ct5hxRG9bhkqTujsIoQ4lbzz4rJNHfdAgT5Hiyw8yCsAq0pTZE+kgMtg0
         3b3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693477370; x=1694082170;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Kxzq6ezTfLdDZyL1FNnBKITFbzU8tZtMOaTMdseKSzQ=;
        b=Dcbo8vm2zGlquqqdCm5mGgv+eAx05dNawZvsyu9C0ARQ4vl+olCjDEn/oCT4bax2Xy
         DPrFCQ5wu7jsQRxYgzVOnLPbCUvFOXxVXJ5JqE5oHHffmrsrGCsTUITPVjiu+OTLv+Rq
         9EJ0IlqNvcrvrcYCwJMl6Jh4EWR4Q0JDKtkkpkAWuPnOqvieLwV7q7LvQwzRp7cPZudq
         HKJ4Bv2mGgvZPcEt4u+zAynqHXR4X/Dm+ryrGTsjuCLnksYfcaCy9OAdnE9wYFSOpfcW
         mZxC8DiMla84DO23ASUA0VA8kxi+R0r9tNPqQ63SgoMxt2fe9ZNMUnW6Bt3vCLJqnOkU
         Fm8A==
X-Gm-Message-State: AOJu0Yz99JvI1yjTxhvbEimIqdAMyhQU8/Q0XzyP3qzmixtI9/Xek5sZ
	Wve/X6GaFawt+Y9ElI8avAw=
X-Google-Smtp-Source: AGHT+IFZ97vtmoV3RE7iYqu9B+K55V+nqn/mbB38hGLKY8EeAK7dtPDOpqSGpPemRenwA2pZHDxD8A==
X-Received: by 2002:a05:6512:3f18:b0:4fb:8585:eefe with SMTP id y24-20020a0565123f1800b004fb8585eefemr3589180lfa.57.1693477370122;
        Thu, 31 Aug 2023 03:22:50 -0700 (PDT)
Received: from PCBABN.skidata.net ([91.230.2.244])
        by smtp.gmail.com with ESMTPSA id n18-20020a5d4012000000b0031c79de4d8bsm1719658wrp.106.2023.08.31.03.22.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Aug 2023 03:22:49 -0700 (PDT)
From: Benjamin Bara <bbara93@gmail.com>
To: alex.kanavin@gmail.com
Cc: bbara93@gmail.com,
	benjamin.bara@skidata.com,
	openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] insane.bbclass: introduce SIGILL finder
Date: Thu, 31 Aug 2023 12:22:42 +0200
Message-Id: <20230831102242.3716483-1-bbara93@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <CANNYZj_J3kHWJZyFU-w7-gBg60G6PoHNAqOAN5=Crh2kTPkNNg@mail.gmail.com>
References: <CANNYZj_J3kHWJZyFU-w7-gBg60G6PoHNAqOAN5=Crh2kTPkNNg@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 31 Aug 2023 10:22:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186969

Hi Alex,

thanks for the feedback!

On Thu, 31 Aug 2023 at 11:24, Alexander Kanavin <alex.kanavin@gmail.com> wrote:
> objdump -d is a heavy operation, and the problem is both arm-specific
> and rare. Also SIGILL is a very clear indicator of what the problem
> is, even if it's annoying to see it at runtime.

As the grep is part of the call, at least the processing is quite fast. It
could also be extended to other architectures which might not support the
latest and greatest SIMD extensions.

> I don't think this should happen across all builds and components.

It will just be executed if the "filters" apply to your machine, currently:
- "vfpv3d16" in features
- "armv7a" in features and "neon" not in features

But I understand that this probably doesn't make sense for a "everyday build".

Regards,
Benjamin

