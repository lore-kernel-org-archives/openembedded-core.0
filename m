Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 670B2D3ABEB
	for <webhook@archiver.kernel.org>; Mon, 11 Nov 2024 18:30:21 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
 by mx.groups.io with SMTP id smtpd.web11.66932.1731349812268073552
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Nov 2024 10:30:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=Al1HhNy5;
 spf=pass (domain: linaro.org, ip: 209.85.167.49, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-539f4d8ef66so7264356e87.1
        for <openembedded-core@lists.openembedded.org>; Mon, 11 Nov 2024 10:30:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731349810; x=1731954610; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=S7zQDw6p3lI8SAvR/DuEBa9t8DRdzg2klVC6v1Bthnw=;
        b=Al1HhNy5Zns/233eLmGGrywN7q0A21+1RwxK8Lfk7rOciVXIv6uijeqgAVrJuFzd1f
         /8a8XOpIOKSjj2QNDjv9Uu7af2Mhv6ACpPe9UEqfH5bRGAnyfzbx5f66MjFW6m5LouGO
         YugsyeaAuND7biZ4zHYuPxtTCjcboh2+K9Zkv2uVYY3l7huotGdypB+CHj2L1NAyz6+R
         wG+zIoKCQnPYMq1j64DAKTTvk1o4E0DgQ/vCWo2+kDhlL8a7wnWWe7kz8ggjlCJPft6t
         7E0f1EkfQNTm8x7lAZOG5JeuelSxhX/1JH273cUTBX0QK4ytejQXc3+h335KEWZpZIKa
         DSlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731349810; x=1731954610;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S7zQDw6p3lI8SAvR/DuEBa9t8DRdzg2klVC6v1Bthnw=;
        b=jYsRkp3DYHZYAdPJyJoq68bHYEIWZ1AxM5VDAsdINaUrnjMSvgDgm574DTMKTkg77X
         btSrHUcTsXIVToUCW8MeWLvlOY80VMiY1n65c4uu5bTxBUcbgqUmCEaAhIpvsFSRpKdf
         PfxsB+z9tURLJwhZh26o23IF3vK01qx1YYASiySwP1gxZ508xMMfm1/FmnyqbvSiFD7T
         WlCvy5m3QOJJ0DtJOlyTbcHdBiDTn8OZDXSXjfc4YZt2/r1eaVyTClFvvlfYSsLsWm5t
         seYFPVF3J0RU+ukP4l5HAVeZ0aE+Ak8De70fdTtMJSx907TX8okKUWPiT3KvV1N7uG4J
         8x3g==
X-Gm-Message-State: AOJu0YylX3ZM3qRB4UNNPRBDSdSbAnIKdo+chUNxYRI610fR362qCf35
	/csV9SWSX6Hrn8ve4+aFPbBG0JoEbGlbif7JQvDXk5F1J3i7EySa1XVDwt1bJAM=
X-Google-Smtp-Source: AGHT+IG/Rd/Eqh1M+zfEOrLYz3QFFBFBLXeGRDsnFdHPzR9+/6JnfnU4cD/sUaJMfoG8Yok5MqEjKg==
X-Received: by 2002:a05:651c:1602:b0:2fb:5ac6:90ef with SMTP id 38308e7fff4ca-2ff2016213fmr73549461fa.11.1731349810162;
        Mon, 11 Nov 2024 10:30:10 -0800 (PST)
Received: from nuoska (78-27-76-97.bb.dnainternet.fi. [78.27.76.97])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ff179d7e4esm17726501fa.111.2024.11.11.10.30.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Nov 2024 10:30:08 -0800 (PST)
Date: Mon, 11 Nov 2024 20:30:04 +0200
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: ross.burton@arm.com
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH 9/9] systemd: don't use deprecated meson option
 values
Message-ID: <ZzJNLFKLeUVGKDoQ@nuoska>
References: <20241111181341.3296523-1-ross.burton@arm.com>
 <20241111181341.3296523-9-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241111181341.3296523-9-ross.burton@arm.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Nov 2024 18:30:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206977

Hi,

Do you have a test to catch these cases? Would be nice to see
that too.

I saw these systemd warnings in the past but they changed
from one version to another and they are not systematically and correctly
used in upstream systemd so I decided not to bother with this change.

It would take a lot of work to test all combinations so that nothing breaks.

Cheers,

-Mikko

