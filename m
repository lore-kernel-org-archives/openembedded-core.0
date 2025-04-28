Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38157C369D5
	for <webhook@archiver.kernel.org>; Mon, 28 Apr 2025 18:31:11 +0000 (UTC)
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
 by mx.groups.io with SMTP id smtpd.web11.55681.1745865063256580557
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Apr 2025 11:31:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SyYUmoyR;
 spf=pass (domain: gmail.com, ip: 209.85.219.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-6f0ad74483fso58546736d6.1
        for <openembedded-core@lists.openembedded.org>; Mon, 28 Apr 2025 11:31:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745865062; x=1746469862; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=F1lELEVXjVSUtaShVY4gsFSyN1j12cetW30rCsAExeg=;
        b=SyYUmoyRJGvcArbKA4sFpllq2IqbrWkrrKbs0dYKtJu/Olyk8F3h1eibvD7FGsLGDY
         aaq/SC2e+pZWJRdzI3jEy72hX+SAzbDw130ZbDH723LzkiHxtyP982OC0cWKshd2l1am
         +mIXIgKfU9MT5WPnIWXtM+/W+32Nu2a9IzKpWtmAwh+aWULyX4j8uhw8WfFMcCljfpKO
         h6xpDoQSWIEK8bD56mhGlvJD1/5e81tzq97o3JcwRVIvw/Bpd/Ne8B4LqMuwNYdmMCDr
         oPJW2WJAVj4Kao/BHzE0UwFxiRIqpzpgb+tEGyLECro95VcPJ5+YnfEl6+cQhtrT6LAI
         FcQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745865062; x=1746469862;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F1lELEVXjVSUtaShVY4gsFSyN1j12cetW30rCsAExeg=;
        b=JmAZnUpUNhRMWX67+QAr/hwQQLTs6Zktm9E3xT0C+zLFUGx0Dcbg9kYIMf/s99If62
         91vyu1Nm8WYZnC75Mm4838PqycODLyx3RhntgTjehLXhI9eogOQ8OM+UdHvwHeN9ypGM
         36bp2io1s1KqTFn2Qbbo6L41brVUYWRRbcfSlRWpeRqEzNVvP3GHGzZi++VrKT/yIxQo
         XZKrR8ksip9uahcN9ymlaDr8a7ugg2jkE4X9kP2gYZYjg50pzaaNWFOxMp5wtTxeN5pC
         ttas6pKvA2U+vwmp0TlUGq6PJuV4GTdc65twQOA+VW2tUChsFQbV2S6MCIbCrS5FyYQD
         oqlg==
X-Gm-Message-State: AOJu0YwWm4yvpXG2sVvPcjAioE8LLqwwR+cvnLHabpr7n/wPpvSMlCgp
	NeHltur1lrg/w5VewU9fLlM7v7NeOFwBYE+POR/lN9nm8gRTyKV+AnPPr0ViTzOu+wbc++hY6II
	+wcfbrdsSozsadS/mASUt7R6RGZ4=
X-Gm-Gg: ASbGncsSctpvl6Kxcg1e544ItwC/GykHoItJXGRf8TCT1itRNBEuYa7snwYn9wDn+Qw
	bomLfdG3Cn2CK1cT3KTxdFDY0fSXdVFxZKDgb6W8WSIwFpdq54mxu+hSldvagnBLPwiJECplceV
	GKLl3lrVCxCOKHy24CV9c/LXoMo2l/eGeefI2pjWjzEDtw9LZ647ToGVA0
X-Google-Smtp-Source: AGHT+IFcVxnwDWD35n5xwKm8j100Yd0rjAMpJkd9QIx3qpVbpO7YHhRCgL2aiJVqZK1tsYjvYpG6YoBvHCxx07NyZ6A=
X-Received: by 2002:a05:6214:29ca:b0:6f0:e2e1:50b4 with SMTP id
 6a1803df08f44-6f4cba51be4mr260887766d6.35.1745865062280; Mon, 28 Apr 2025
 11:31:02 -0700 (PDT)
MIME-Version: 1.0
References: <20250428154902.3084542-1-dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <20250428154902.3084542-1-dmitry.baryshkov@oss.qualcomm.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 28 Apr 2025 20:30:51 +0200
X-Gm-Features: ATxdqUGAY_ULJG-mhx9mmmRNCCmxBCowZ1j_hagUcpwzW1J4J2XiLMq5vIAVU08
Message-ID: <CANNYZj9W6wHnH6AhYQafnVA9cfmF1pcQYFammfLABLB-BLoH-g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] libxt: fix build error
To: dmitry.baryshkov@oss.qualcomm.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Apr 2025 18:31:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215631

On Mon, 28 Apr 2025 at 17:49, Dmitry Baryshkov via
lists.openembedded.org
<dmitry.baryshkov=oss.qualcomm.com@lists.openembedded.org> wrote:
> Building of libXt fails with:
>
> ../../libXt-1.3.1/src/ResConfig.c: In function '_get_part':
> ../../libXt-1.3.1/src/ResConfig.c:421:23: error: the comparison will always evaluate as 'true' for the address of 'buffer' will never be NULL [-Werror=address]
> ../../libXt-1.3.1/src/ResConfig.c:404:10: note: 'buffer' declared here
> -EXTRA_OECONF += "--disable-xkb"
> +EXTRA_OECONF += "--disable-xkb --disable-selective-werror"

Same questions as with the graphene patch: why isn't it failing in the
autobuilder and standard poky? Has upstream been notified? How can we
know when we can remove this flag?

Alex

