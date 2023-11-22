Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E4AEC61D97
	for <webhook@archiver.kernel.org>; Wed, 22 Nov 2023 12:26:08 +0000 (UTC)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
 by mx.groups.io with SMTP id smtpd.web10.18178.1700655961244919751
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Nov 2023 04:26:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=nXPh7udi;
 spf=pass (domain: gmail.com, ip: 209.85.208.172, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2c8880f14eeso32882621fa.3
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Nov 2023 04:26:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700655959; x=1701260759; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1qxKvL4Cy0QdXgd8xcgcDU4is2JavS4lEGKS4ryHN7E=;
        b=nXPh7udiOz5P6ii9e4FMZ2KjJpNjSpIb0tBoXDTKUE1bsPuzZkqfhz7TPdQXhDJ7AX
         heFn4TcaL/yD8Rwiv8QihxphvzfUijspx2lNnvTTUgN7ByNDF8PmePI6wA/+OyKZq33m
         uCp3t3zQyAR2HT/q0HVlWjxCTv69IxCd6xKV/Zi69e/Zv8nWTSmCxDNpGRkQ1iFExtrQ
         giHCRP2PVNkbqriexqp6goPDshAn8cam4LVcUthMJn19DtMYcuka/3mybH0tIGUMdsy4
         kyZGYfVRWEdR73EcdYmr0oPk1ZbYmRCjbFIHfbvcDjzdJLs5cJkED8s3B5CBlk0bd+Mn
         9yqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700655959; x=1701260759;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1qxKvL4Cy0QdXgd8xcgcDU4is2JavS4lEGKS4ryHN7E=;
        b=YTH7Tndoyc31YGfRDZUP+pBr6VMUox0myO0F/vpYrySPPJ4xbsa/vFKrbs30E2FNxU
         uHJ0B2M9ccZrAYfu1sZ04OxodjYJ4FqN8uSqLmSxMpO0Xi9ryj0nSUlKp3xeo1QF2SN5
         qGkAJ4Ifiw1hPlz2PZlkL9Nobv/sZHNhnU36TLLs8OIHtXHTDcSAHXfQTkYzBOELl6FH
         zyRDsV8HMoQmWai97zt+1hZ59Z4mUwFuCpzm16O4vS7hGDbmDJXebEmqY7U5YOwptdSZ
         4/UyJbKnnClefr6+PQLGAMPWX/PM6kKN46f/bIy4XQ4Ph9pfRUTCtqiR4ts6mHLbQ7i5
         4JDA==
X-Gm-Message-State: AOJu0Yza0SiUDpTv87OU9H/3IpnaevO+TwknATWG+bhjgirusIaEJWNm
	GFwxegQS5W/EpEKUkRnGZynCfok/4jrzQ/phei0=
X-Google-Smtp-Source: AGHT+IHvxLXhT/ldNiK/dJ8glXxelpx6nVk2te6a1Fp1dCJlTOYP3etuljdwAV7b295vJwtMCh/i4WCHQaJV6Ku0Nbw=
X-Received: by 2002:a2e:9645:0:b0:2b6:da88:a2d0 with SMTP id
 z5-20020a2e9645000000b002b6da88a2d0mr1653557ljh.47.1700655959323; Wed, 22 Nov
 2023 04:25:59 -0800 (PST)
MIME-Version: 1.0
References: <20231101110129.647878-1-adrian.freihofer@siemens.com>
 <20231101110129.647878-4-adrian.freihofer@siemens.com> <41e4a23f7b8fcbc1da06d9414646aed6d9a33f1a.camel@linuxfoundation.org>
 <1952881b121248aaae11df8b884caba82d567bec.camel@gmail.com>
 <b98adc29-7e18-4c68-b94c-4b9b5b2a38db@Spark> <b38107c74191ff9a5fa6fb0a9cf8a42cfed32225.camel@gmail.com>
 <DB5PR02MB10213E5FE440BEAB46DA58849EFB4A@DB5PR02MB10213.eurprd02.prod.outlook.com>
 <b3871a691e147ff70ac2145cc5af36a4c4c26837.camel@gmail.com>
In-Reply-To: <b3871a691e147ff70ac2145cc5af36a4c4c26837.camel@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 22 Nov 2023 13:25:47 +0100
Message-ID: <CANNYZj9rKV2dYb1PYoQ=Zb+C2A8w7TVi+w6he=oxJHdWueE-eg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v8 3/8] image-combined-dbg: make this the default
To: Adrian Freihofer <adrian.freihofer@gmail.com>
Cc: Peter Kjellerstedt <peter.kjellerstedt@axis.com>, Christopher Larson <kergoth@gmail.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Nov 2023 12:26:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191075

On Wed, 22 Nov 2023 at 13:23, Adrian Freihofer
<adrian.freihofer@gmail.com> wrote:

> But I also have to say that recent documentation points out that the
> rootfs.tar must be extracted into the extracted rootfs-dbg which is a
> working solution. The issue which I have is with the SDK which tries to
> avoid building the tars and extracting them again just for providing
> the debug symbols on the host. This use case is probably new.

Sorry for barging in without fully understanding the issue, but I've
added debuginfod support to yocto precisely to avoid having to deal
with large, awkward, slow debug filesystems. It's a lot leaner and
slimmer approach.

Alex

