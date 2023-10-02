Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E8F7E784B6
	for <webhook@archiver.kernel.org>; Mon,  2 Oct 2023 14:21:33 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
 by mx.groups.io with SMTP id smtpd.web11.83059.1696256491057114582
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Oct 2023 07:21:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=EzA1T6Uk;
 spf=pass (domain: linaro.org, ip: 209.85.167.54, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5044dd5b561so19979025e87.1
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Oct 2023 07:21:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696256489; x=1696861289; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Pa7TW3r7Wa8Xe/Ee5GmlQAYMq3wRRaQoQEQUveZNGwA=;
        b=EzA1T6UkoModHUYcIiwCX7s+BhHEZWwEE3zA7coMFh8xWP8PE0gaKSOZIlpAutuqh6
         xLraHWnXwayNUhysV7zcVMd7VPDjxeWxNvPfhpulTLD9nSX6eWVziW3W+guSf/ZUmf1Y
         DC3C8sR6f+8/rQwlyhnVHBqFPPilxHDS3XjksxIadIM0qW8UiLgHAreqzmSc4oCp0wgV
         2IK5lwCT2stxtWWtDhsoZVs1TU+w34eAwTMNmpk/3Kuj4H/yoyM/qU+vhgqxA/jZcdvE
         O7wNCsgwNAbwV+EfuIdLYcWPpaMTeoyZTI1BZPrrM3zxeZ7pbtgyfLBsGJyTFIWilRir
         QjCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696256489; x=1696861289;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pa7TW3r7Wa8Xe/Ee5GmlQAYMq3wRRaQoQEQUveZNGwA=;
        b=fe3floSnILfdJFe3HHHBHJYg1NO5UrRtmAHbsXUiZcZaMNh5nhJMgOnezDiLvkxPPH
         kzzEWzpJYAw067g94b6CLPn5OlJowlX49TnxMXrT1rGcxRanGPb3fzLbCcXXdbIAEQ1S
         Jx2fOjfEBiaMnbffNvzOCZGFpF/DlHZGGChoEAoD6dTwW6vdBFQ8tVNQkQcYghK/B1TW
         Yy0QHQvvdWKFKAt+W7//8jhfQmg47Wa3TmPOUnGnBzUhz78CIx27HBVl5Gz8SBdMK3DJ
         NV5IZf/U8Qw3iB00nY1gwgf2DNMkdzE/JqsC3OeO17c7wjLXmTZQ9X9FixzIMPi69V+L
         1AjQ==
X-Gm-Message-State: AOJu0Yz/yUMCuWKCDmB609HX0KEgtLLTzvbHscDfizlYtwq3PbxBvFrQ
	zqO9RLorsy82ekIxF4xFIOolHPTGfJZYgTLf5xo=
X-Google-Smtp-Source: AGHT+IGE4G//hUIlMyEinRnXVF7OVfAzhJAYJptYV5dVdQsIHbiTNoMf2xgheru2vGgnG+rGZJqpAg==
X-Received: by 2002:a19:6d13:0:b0:504:2d54:b4d0 with SMTP id i19-20020a196d13000000b005042d54b4d0mr7527271lfc.19.1696256489240;
        Mon, 02 Oct 2023 07:21:29 -0700 (PDT)
Received: from nuoska (dc7g6tyjby-d304c4945t-3.rev.dnainternet.fi. [2001:14ba:16cb:a800:e107:c77f:6058:ee33])
        by smtp.gmail.com with ESMTPSA id o12-20020a056512050c00b0050420791528sm1577327lfb.293.2023.10.02.07.21.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Oct 2023 07:21:28 -0700 (PDT)
Date: Mon, 2 Oct 2023 17:21:26 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] oeqa qemurunner.py: switch utf8 error handling
 from ignore to replace
Message-ID: <ZRrR5qG7tqvxHl52@nuoska>
References: <178A500DB7E63B14.9230@lists.openembedded.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <178A500DB7E63B14.9230@lists.openembedded.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 Oct 2023 14:21:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188613

Hi,

This is actually for the issues seen by Richard on master-next with 6.5 kernel.
Somehow login prompt detection is failing but raw log data shows it correctly.

Cheers,

-Mikko

