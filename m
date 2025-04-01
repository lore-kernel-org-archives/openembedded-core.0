Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1086FC36014
	for <webhook@archiver.kernel.org>; Tue,  1 Apr 2025 08:41:51 +0000 (UTC)
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
 by mx.groups.io with SMTP id smtpd.web11.14306.1743496901142289336
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Apr 2025 01:41:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Uf5fU8DI;
 spf=pass (domain: gmail.com, ip: 209.85.219.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-6e8f4c50a8fso47303966d6.1
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Apr 2025 01:41:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743496900; x=1744101700; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=xYeu4VRniynZydn8LxW7FjZ98j9umWAgEWSVK4ELhCM=;
        b=Uf5fU8DItGdznepcRJZV4+uAzTA4satf87f3uj4PQR9SrqWwtY8qEGVwXanp2P0T+G
         ijvTGsH62tlWc71e0jwcRNTGgf9RfsSB6NKKEd4hGBXxbqpktq3hhWLmM2UrE/Z2JEip
         jmpDxiCgVS+Mo8MZwVP6HjPNaQCw16lOWE5ljGElpfMJRfyXd7QMvFOQlZCNLXeY79Yr
         AbyfKoMy+5KkT42Y3R8XvSQN37HAQNIdNAx06dWtudeqP1mPIFBwe/BP4E46Y4PZM9hG
         8DBo6wxMDL1peVdEL4hM5FIqBXjo4+w14h/62UFjKwCicKWki23DVqC0vTdkO0QLEBrP
         pvcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743496900; x=1744101700;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xYeu4VRniynZydn8LxW7FjZ98j9umWAgEWSVK4ELhCM=;
        b=gs6Sl9ius9NpFtRRknDSgOUPHG/cIXmZ8J1z0tl9wc4hEgR9q0FoBxQCRV+W0N0WJB
         dM1HZjBkQjQGv8V5mUuDT3CU7wFlI4GCuA9vkDpqZ4/DluggCcXg7LM6yOsOnF6NLZ/9
         UFEpxX51UUGay3mRQ/mU7/CQvK+tyGo6EGoSwo/O0aLBkLiq80ebZ5rkPVw+x1YpMXC2
         2xBKCKNVEENZNvUKcKWmf8+OpyRzkdIXLNcbsRkZ5/6yV3J8mF86b1XK4J98A6wEzzIR
         tWoJZT9zAgK78gY7UKA7ngtCLDEZqVqRMgjQLJLvC/oc5Dlhr8k8MZHd8C0+1vHA0dmF
         EbbQ==
X-Forwarded-Encrypted: i=1; AJvYcCW01Gt/nen1ZNQEmJfpCb3nAthPeUgviV/3cXr3nFOiaV5O69I2Vf8Cl5JOe1yD2q5+16nnKK0WohbNprHrH/hKAg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwJnSd5T0NNFBxVNNCmnA6OvEl2k/WtHpVxDSFmJvjW8F1zsGA+
	dUfWRPnmfmJP/cFaVpiJ/ImJjVWI525g91XmtXy/VuNxi5AQbj1Q+fsKSQo4a1dx6Mv267v1kVS
	anPA6DtvFQfB41ma3oQJxXbjCjIo=
X-Gm-Gg: ASbGncvmssLaWC9cbGUprjF7d2N2JPrGAWzjXDUwHh5+XoLgXBsi+dxbjJqr6UJnj3O
	JuEJpdWSdvq6a5bsKc7VNMbbESA9F4ccd45s8sH8sGUOjN7XRJEfihgMAbIjcZDPIdILEvM0Alq
	dyhQmLY02hDL48GdBNTki042i1zXFwZsihsSaibivHYMGJgQH3e+IHO6ZiE2aeF4+1ICvQBVI=
X-Google-Smtp-Source: AGHT+IEdpurE5tOcaza1+KNQoBQu4jZoH2loSKZgyvsEI+P/N/VVLXAYGXo4ljNGu+7CvkkMjHGuUS8NY+jz/kjqZI4=
X-Received: by 2002:a05:6214:1c0e:b0:6d8:a39e:32a4 with SMTP id
 6a1803df08f44-6eed61d1a5fmr215844706d6.25.1743496900125; Tue, 01 Apr 2025
 01:41:40 -0700 (PDT)
MIME-Version: 1.0
References: <20250331-mesa-25-v4-0-e62fc54a6efc@oss.qualcomm.com>
 <D8V4RQR2X3EF.46ET3A2PKUAL@bootlin.com> <D8V5ROOK16KM.1VZ0YWBBB0JMW@bootlin.com>
In-Reply-To: <D8V5ROOK16KM.1VZ0YWBBB0JMW@bootlin.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 1 Apr 2025 10:41:29 +0200
X-Gm-Features: AQ5f1JrzfKPymPtJ1hfSwxYmaI4-OAOTvcICNUbXhil09rnFdeTsqeo5rQTfllQ
Message-ID: <CANNYZj_NrSXtEKaBroVUTKjyeo5Zp=ukU9nffYasVmUK5Dt+4g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v4 0/9] mesa: upgrade to 25.0.2
To: mathieu.dubois-briand@bootlin.com
Cc: dmitry.baryshkov@oss.qualcomm.com, 
	openembedded-core@lists.openembedded.org, Khem Raj <raj.khem@gmail.com>, 
	=?UTF-8?B?Wm9sdMOhbiBCw7ZzesO2cm3DqW55aQ==?= <zboszor@gmail.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Apr 2025 08:41:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214010

On Tue, 1 Apr 2025 at 10:27, Mathieu Dubois-Briand via
lists.openembedded.org
<mathieu.dubois-briand=bootlin.com@lists.openembedded.org> wrote:
> Also, I suspect this series is linked with this Xorg segfault in
> parselogs.ParseLogsTest.test_parselogs:
>
> Central error: Fatal server error:
> ***********************
> [     1.468]    compiled for 1.21.1.16, module version = 1.0.1
> [     1.468]    ABI class: X.Org ANSI C Emulation, version 0.4
> [     1.512] (EE)
> [     1.512] (EE) Backtrace:
> [     1.512] (EE) 0: /usr/bin/Xorg (xorg_backtrace+0x52) [0x566b2522]
> [     1.512] (EE) 1: /usr/bin/Xorg (0x56583000+0x1332b5) [0x566b62b5]
> [     1.512] (EE) 2: /lib/libc.so.6 (0xf75e8000+0x34060) [0xf761c060]
> [     1.512] (EE) 3: /usr/lib/libgallium-25.0.2.so (0xf5140000+0x512634) [0xf5652634]
> [     1.512] (EE)
> [     1.512] (EE) Segmentation fault at address 0x0
> [     1.512] (EE)
> Fatal server error:
> [     1.512] (EE) Caught signal 11 (Segmentation fault). Server aborting
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/11/builds/1274

This one is specific to x86-x32. We've had to do this previously,
maybe it's not enough, or there's some other issue:
https://web.git.yoctoproject.org/poky/commit/?id=f32128bda2a035b01d2dbf7bc73738a310eb955c

I'd say we drop testing anything graphical from that platform, as the
only way to get it started is with fbdev. No one's using it.

Alex

