Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79F41C48BEB
	for <webhook@archiver.kernel.org>; Thu, 15 Feb 2024 10:58:16 +0000 (UTC)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
 by mx.groups.io with SMTP id smtpd.web11.11507.1707994688095936234
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Feb 2024 02:58:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PL8g3+X6;
 spf=pass (domain: gmail.com, ip: 209.85.208.170, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2d11c55d7f2so9963921fa.2
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Feb 2024 02:58:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707994686; x=1708599486; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=aNuMUgWAu8ULX5aSyNoiNz6b/8QUtv/A4mLGTEw5fGM=;
        b=PL8g3+X6eDcpjo9HJhteuqKcXgpJ97MEZ3aeVZX1D7jDo+uVyeKF1fHDvZ3bcvnLD/
         1AvpjpmoMyuSnr6ZoCc9XNvvYFhZdUJtUPo/tIUsXpSG0cMgihAMcA+DwnwVVQY7i6G4
         uoxiIsww/nDsZPMDtHpsJMKNq+0VbE5iPSFcmobNQoAQxTsy9IjbpJOi9mXS7b6QfhVm
         kmorDGCbcrkMOTdrNoN4TSKaJq702Zc6yDZQp/ANDLw6JnFzUGgbUPcDqKf9zdyc8LH+
         DBKavuFNLDTWTDZBVo2jaT06d8a2zP0TMuv340v557AcYCjva7lsjyzIARrPWBiOJCC1
         qCoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707994686; x=1708599486;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aNuMUgWAu8ULX5aSyNoiNz6b/8QUtv/A4mLGTEw5fGM=;
        b=TaahRiofF5YCj6n5dgJPAooXD9dYTz+trjyP1T5AlDDy9b8fM6bZoeFXGT2VN1HACT
         ieXTdXQliMOfSSQu8ploc+nW5J0LhM9J0cb9r+qsXufz/ldT21HI1crnWeNb758c46ha
         5KexwcZ8mlehOWfJgi6/BYZr6uDfmEwh1mohvPu+MqN6PlK3xGkt0nelD5Si18Ry4Q1A
         nILvDx2AUNnCRKwraUAfAWCZDB/PzSYQO6tJRk7I4Jo0Ip3g4zRj4G28bH0X8ZbGNQuS
         SSP0es2jPWkuNEhP4lxm1wWwq1FnO+JGbiauhTp4/QdaiIentOUzRRVBToOfOpHwPHFT
         rdTQ==
X-Gm-Message-State: AOJu0YxI1PZ/xN423J1kYT37sFPHt6EHTREThEpLgD78q+rpjnpM+z7K
	1+bI3bt774otDnkwtCbe8qWYcqYH4DTz5xzSH0gDyWSp6s/uXQ6XApjV1mXPuMxxt74OLjkMGO6
	XB7XfR/HYJU67Ff08tSpYhEZB9UY=
X-Google-Smtp-Source: AGHT+IGjMEPrpynzeV+na5HKHamCUz1LOlwQj5BNXGXTVODAwJb1V/Jzd4oc03xySaFpORIyBhOIIy8O3/lLMDQgCGI=
X-Received: by 2002:a05:651c:95:b0:2d0:b423:3800 with SMTP id
 21-20020a05651c009500b002d0b4233800mr1054035ljq.29.1707994686027; Thu, 15 Feb
 2024 02:58:06 -0800 (PST)
MIME-Version: 1.0
References: <20240206184941.748116-1-raj.khem@gmail.com> <20240206184941.748116-2-raj.khem@gmail.com>
In-Reply-To: <20240206184941.748116-2-raj.khem@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 15 Feb 2024 11:57:54 +0100
Message-ID: <CANNYZj_c7+6kd2yWTBD5WmkqM_hp9PK-y6a0DYCkJASeB+d8qw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/3] rust/cargo: Build fixes to rust for rv32 target
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Feb 2024 10:58:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195508

On Tue, 6 Feb 2024 at 19:49, Khem Raj <raj.khem@gmail.com> wrote:
> diff --git a/meta/recipes-devtools/rust/files/rv32-rustix-libc-backend.patch b/meta/recipes-devtools/rust/files/rv32-rustix-libc-backend.patch
> new file mode 100644
> index 00000000000..462a651428f
> --- /dev/null
> +++ b/meta/recipes-devtools/rust/files/rv32-rustix-libc-backend.patch
> @@ -0,0 +1,32 @@
> +Use FICLONE from linux_raw_sys module
> +
> +Upstream-Status: Pending
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +--- a/vendor/rustix/src/backend/libc/c.rs
> ++++ b/vendor/rustix/src/backend/libc/c.rs

Please do send this upstream, weekly pending stats increased because
of it, and I'm obsessed with not letting that happen :)

Alex

