Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49A41D2447C
	for <webhook@archiver.kernel.org>; Fri, 11 Oct 2024 05:54:18 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
 by mx.groups.io with SMTP id smtpd.web10.5228.1728626050339945231
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Oct 2024 22:54:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=ds7j6svB;
 spf=pass (domain: linaro.org, ip: 209.85.167.43, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-53992157528so1852475e87.2
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Oct 2024 22:54:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728626048; x=1729230848; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=H2cFWwHbY4l2xZxZqISMxz3gsPzJujs2pxHymcwY8SE=;
        b=ds7j6svB0Ie39qaJs0bI0twWBHhRDcgvNwtsbgq/YCOBYpENlJQodyn+bWy5SIB36e
         5U/n6/VFaqjoiZhI1WxUThBMquulJ716qkoRJ4q2c53JNDM4fQFMWP5Dw2WdQa5MRM9b
         0s9MdauVcPCr0brY7ZZ9Foz9pSnvirpjLSGqVsYzPTYNwyEonV8f2wsLAQYFmj5SLmqW
         Z9Po/mcv44MBM6InrcaP2/QObN4J+BrYxpvcScK54qCYciShU2gITNvJq/svBbbfS4S+
         SXfErH8B5oeSzmhOZup0jCdcMOU4V9HlfQd9L3Ylr7t8o/94ygI21LHoNxo33NP7sGiK
         KW5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728626048; x=1729230848;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H2cFWwHbY4l2xZxZqISMxz3gsPzJujs2pxHymcwY8SE=;
        b=cftOCeTxi+taOK7gnKvBqnRaztC4dgdgmxQnLWUSSlsArrLr6LhZN6rLG1saXItI00
         sR/EslPF4NmB3WxORIjDK5vJ/xDWSmKMdG3KJfj5ihMexFYFPWIXVDveREMSLGvw3Ljn
         0Dwrymkm1elEauUEfVQHtQCVhSi0R/zMR0VTgj+dR1/3DN1/Wb4rplRVo4KMTiCTSZC2
         oAt3NNuzq0tsZTj4rJNbtyIqiTysk3i9QQsvUrVKRlGBgzqmWj9MJZ6UAwUE879izfX4
         fblZjKK9oiAYniwW8siR9iMb1HGWa43BBM7A+7hl2YTL4vAgW9l5fQsknpqcdcVZfiGl
         Vasw==
X-Gm-Message-State: AOJu0YwYgYqSwiGaCm7Ec/7ha89BrS4VsjX9znyoKMNIurPi8dTiCZt1
	H+/8WzYwz9LpYmXrbGLzx8aWLD1WYb4H/q9lPtaAOz9hC9nieZjWpAfCME5Yvj4=
X-Google-Smtp-Source: AGHT+IFcdSGEr6NOrYekIDIVq+5EtpM/Ypap9nLxEMvR2mwH5hLgIjftMo/9efByR2o7F8gBhEIb6g==
X-Received: by 2002:a05:6512:2211:b0:536:7a88:616b with SMTP id 2adb3069b0e04-539da4e1156mr441667e87.26.1728626048389;
        Thu, 10 Oct 2024 22:54:08 -0700 (PDT)
Received: from nuoska (2001-14ba-7452-eb00--183.rev.dnainternet.fi. [2001:14ba:7452:eb00::183])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-539cb905208sm486166e87.249.2024.10.10.22.54.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Oct 2024 22:54:07 -0700 (PDT)
Date: Fri, 11 Oct 2024 08:54:04 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Ross Burton <Ross.Burton@arm.com>
Cc: ",openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>,
	Michelle Lin <michelle.linto91@gmail.com>,
	Erik Schilling <erik.schilling@linaro.org>
Subject: Re: [OE-core] [PATCH v7 1/8] uki.bbclass: add class for building
 Unified Kernel Images (UKI)
Message-ID: <Zwi9fMLhJzqPKidy@nuoska>
References: <20241010085647.439990-1-mikko.rapeli@linaro.org>
 <20241010085647.439990-2-mikko.rapeli@linaro.org>
 <4BA0FFC4-E427-4666-9413-83D794289816@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4BA0FFC4-E427-4666-9413-83D794289816@arm.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Oct 2024 05:54:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205657

On Thu, Oct 10, 2024 at 08:14:22PM +0000, Ross Burton wrote:
> On 10 Oct 2024, at 09:56, Mikko Rapeli via lists.openembedded.org <mikko.rapeli=linaro.org@lists.openembedded.org> wrote:
> > 
> > +    bb.warn("uki: running command: %s" % (ukify_cmd))
> 
> bb.debug, please.

Thanks, fixed.

Cheers,

-Mikkko

