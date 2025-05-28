Return-Path: <trini@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CC47C5AD49
	for <webhook@archiver.kernel.org>; Wed, 28 May 2025 00:52:54 +0000 (UTC)
Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
 by mx.groups.io with SMTP id smtpd.web11.5321.1748393571115627924
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 May 2025 17:52:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=H0l2n6xn;
 spf=pass (domain: konsulko.com, ip: 209.85.161.45, mailfrom: trini@konsulko.com)
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-60638c07cabso1744155eaf.3
        for <openembedded-core@lists.openembedded.org>; Tue, 27 May 2025 17:52:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1748393570; x=1748998370; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YctIufqT4hBiTWwFCLIbziKvTbSrkNl8DxJ3elHZjVg=;
        b=H0l2n6xn+I0HLV4TlfVjYMPFkkux9O2joPDts6T7vHXPM0/t/6ToYzeb+1qKdEZaJ6
         Jxpuq3jabjnMwT+TSPQ/ekGJsbZBRtTodV96V2U7oYPD+EY4tbqNPqNAGfdgIJo6N5GN
         WsP4XWHR0O0QW5/KhCI2DuD9U7kRHVMGS51PY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748393570; x=1748998370;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YctIufqT4hBiTWwFCLIbziKvTbSrkNl8DxJ3elHZjVg=;
        b=C5ZfDoGQm02HlGWINV08/eDTA4daMDj2HsBN9QYzLmrfZaPM7SaroWj+emjQS8lkmQ
         5Qreh/ag7fEyJclYcLS+ZPYVu2C/BNtSyRdV3jrmU+sMCnWAXSHPsGtjnvAtba6hep6M
         47UzZgYNaeI+veh4rzhol5myO+opGIn+ynOM9vE1yh62dKQWWLd/HTIWWRRt7Cz+IzDY
         Jjkoyvb4tuvgwgnMaWrC1xVn6EkduZhmw+PalH1MZkCqpalwl9WdEkpH5O6fFpTjx68x
         5gU20akerBwD5yj6wPtx/V6VTG8QSu3AGUdDqNXk+tTK/e0QJYctETsU3IYvRimBun17
         i5zQ==
X-Gm-Message-State: AOJu0Yx9iZJgSCumFwcTaeIkmqnAjrVLCH5+ltJWcH+2v/CBg6zUr/Dw
	uUg/Q02QdjDZyD9B+z/t2HOjNd+Lb5yVn/FZyoqNAcHiWKApNBf2u67WkhjubIkSD4k=
X-Gm-Gg: ASbGncum6yQwAsgm9jtazwpFe2RNNv1TLQfc5FqkmjTPjHcCCcYT9uiPkj8ZdQQyrab
	uMm5JVXGunqrvf4Ky1zKcOfw2Xy5ecnt8rnTxZy3pvv4FvkF/vo9Poeh0s8H0YHqYWp0anfFdoz
	FhTXryNQNJwp9GLDFpUD0mj19AB75sqGWwd6VpmvoxGUhVMgtyAziIM4O7qMIRIBVMEKVrsbujl
	78Qzuh96+0m/er5lByeJ6UcK0tyI8R1JdsgGPNdW1/NOqb2KjUmDafB0cX96NmkkG1IAe6Inlm3
	7nF2pb1HaEH76+fssLBhwW2mwWvtSTDGfej218xwPPZYadpyxXjrHl0Eo+dkP/IgwU8yRsdkwrK
	g/RGTnvXBgZRr
X-Google-Smtp-Source: AGHT+IFF4b6qpp0hrfOzFu+h0ltqvKFwuPf+fpoBLl2rM9avT0NIvFxlbsVI/0fr9IxBhnoIEQpzyg==
X-Received: by 2002:a05:6820:1804:b0:60b:a06a:2f4d with SMTP id 006d021491bc7-60bd9b36e38mr212979eaf.3.1748393570366;
        Tue, 27 May 2025 17:52:50 -0700 (PDT)
Received: from bill-the-cat (fixed-189-203-100-42.totalplay.net. [189.203.100.42])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-60bd9d11451sm28645eaf.32.2025.05.27.17.52.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 17:52:49 -0700 (PDT)
Date: Tue, 27 May 2025 18:52:47 -0600
From: Tom Rini <trini@konsulko.com>
To: Mikko Rapeli <mikko.rapeli@linaro.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v4 2/4] qemuarm64.conf: allow overriding QB_OPT_APPEND
Message-ID: <20250528005247.GQ100073@bill-the-cat>
References: <20250526083548.413834-1-mikko.rapeli@linaro.org>
 <20250526083548.413834-2-mikko.rapeli@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250526083548.413834-2-mikko.rapeli@linaro.org>
X-Clacks-Overhead: GNU Terry Pratchett
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 May 2025 00:52:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217326

On Mon, May 26, 2025 at 11:35:45AM +0300, Mikko Rapeli wrote:

> It enables qemu USB support which causes a reset
> loop currently with u-boot.
> 
> Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> ---
>  meta/conf/machine/qemuarm64.conf | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

This too feel like something that should be brought up on the U-Boot
side.

-- 
Tom

