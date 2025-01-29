Return-Path: <dbaryshkov@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C9D5C0218A
	for <webhook@archiver.kernel.org>; Wed, 29 Jan 2025 02:44:33 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
 by mx.groups.io with SMTP id smtpd.web11.4621.1738118672583605079
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Jan 2025 18:44:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=b/ryyjoD;
 spf=pass (domain: linaro.org, ip: 209.85.167.47, mailfrom: dmitry.baryshkov@linaro.org)
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-53f22fd6832so7025326e87.1
        for <openembedded-core@lists.openembedded.org>; Tue, 28 Jan 2025 18:44:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738118671; x=1738723471; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AmcQKVpiLTtN34qGOz5pAqkO60E77V9nKjMbypDhcPI=;
        b=b/ryyjoDSSM8guwByIe0xDV3UfB38kQPK6nm/sdQVa8TobcHiu2apt1JSTRmcEQqfd
         oY4W9W5XirylO8BsLpOi2GHziudK+vdfv6cb6xLinw7W2V0k6JHGnxk1oVe5oj8V7dvd
         M2cq2nUK1eS82/ud6T6MYC0SuAki/tDj1Q0cvyVinyCO7v5HtrsvzE0fL2ZbCHPmAY0m
         AnC1f1cE/MNZKIj6S6k5/Cupyz6slKa7J/TiHs76oeuXldKUppbFVt+k6NucHNVfWRdD
         JLbFBe4xbNG04kajB2vqQsPuSZKDWDkqAegzVr1OQ5iBfehFgPs1T1IiNR10hMeCBJ21
         JHUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738118671; x=1738723471;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AmcQKVpiLTtN34qGOz5pAqkO60E77V9nKjMbypDhcPI=;
        b=LFdkgBlkfsdnwjvQTlx5vEmktMw2sINrKOLasiMD11bCIHCqtufIrmByRtYhsfUQ7H
         T4S0SBvdh5OmkBHqj+gNdrrh5hq0kDKypurzDmpSlQFxLPx1SgXc/ULAEXeseJ664rch
         4z2ZnePXG4M4pTZ0PLHXv6L003doWVzba5CzVhefrc3b9LNUAsSVVyur/uQKGWQM5HKg
         NIawXVTXcf+lZ148Jp2Nqj0WAEbK6iVuB1gGn6Usu2/fch/PMGtYQjbNNEvg6XJYZfJ+
         0iTRw8QV73tkfCY+zZQDq9Ndtq0ujmpfxV4EWCZKZkXVOF/IigeEXSD1qI5Jz0W42L9p
         4P4w==
X-Gm-Message-State: AOJu0Yx46/BUbsRW7fQa0gydRH5G/Dx8+MsGgYPjxIVwtwhhVquxsPwY
	F4zv5n/zsQWpqcejyg2r+jak0I/spPogbL+2rOpJyQJ0exnjTSPhEgyz1vqGxbKwI1lDXbNq2zF
	puhk=
X-Gm-Gg: ASbGncs1NNpMRQ52cKSBUWn4vHaqewXOhkn3QwCvlwkAGpH6PJ1KP3H2p0bAAkp+gYi
	9O9fa1v6WQNQNENM4zO7YxRc0TREZ8VcvFZF6FNqGU6KKfQgU+oDH4TfdGaEd+Z5OJkIDe/ZeG4
	W0aq0wPWHP/yyZXlwknChiYCXPGte2AU6kNA8l7OhszAG5irjqOmhVUuufyUlBtBYXProXEjrJv
	QvVZMrnluN4xiz1hFPu9FzOYPZFVf2KEBmARt8DN+WKsPq0edjg9Q2YxmFLUVMT4J0yS1/nvE8F
	dxS2+ydrWGKiGjwWX8xb5atduEswbaM476JD0y0EAqLMAZ0v9ULy53snfLkRUpgDm5NOZMI=
X-Google-Smtp-Source: AGHT+IFo91+XQvLmnkVkqEN8hR8hfYJO+JpLe9wnuJeyGMoF9TB0ur5GZXHU9+IjBNeNKr5daxJZ2w==
X-Received: by 2002:a05:6512:e93:b0:542:29b6:9c1a with SMTP id 2adb3069b0e04-543e4c3c9ddmr353119e87.51.1738118670648;
        Tue, 28 Jan 2025 18:44:30 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-543c8231287sm1849568e87.102.2025.01.28.18.44.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jan 2025 18:44:29 -0800 (PST)
Date: Wed, 29 Jan 2025 04:44:27 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: marc.ferland@gmail.com
Cc: openembedded-core@lists.openembedded.org, 
	Marc Ferland <marc.ferland@sonatest.com>
Subject: Re: [PATCH 1/2] linux-firmware: split ath12k firmwares in separate
 packages
Message-ID: <mvjvaru6y3jwbuq7cwutgd5mh3xsvyrmdpcfgyoabmwc6baa2d@bdc23q63tdcc>
References: <20250127162440.3869759-1-marc.ferland@sonatest.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250127162440.3869759-1-marc.ferland@sonatest.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Jan 2025 02:44:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210342

On Mon, Jan 27, 2025 at 11:24:39AM -0500, marc.ferland@gmail.com wrote:
> From: Marc Ferland <marc.ferland@sonatest.com>
> 
> This patch introduces the following packages for ath12k based chips:
> 
> - linux-firmware-ath12k-qcn9274
> - linux-firmware-ath12k-wcn7850
> - linux-firmware-ath12k-misc: catches all firmwares that are not
>   already included in the other -ath12k- packages (currently empty).
> 
> linux-firmware-ath12k is now a meta package that depends on all of the
> split-out ath11k packages.
> 
> Signed-off-by: Marc Ferland <marc.ferland@sonatest.com>
> ---
>  .../linux-firmware/linux-firmware_20241210.bb | 28 ++++++++++++++++---
>  1 file changed, 24 insertions(+), 4 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

