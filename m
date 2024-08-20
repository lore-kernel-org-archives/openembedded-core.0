Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75609C5320E
	for <webhook@archiver.kernel.org>; Tue, 20 Aug 2024 07:34:49 +0000 (UTC)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
 by mx.groups.io with SMTP id smtpd.web10.13184.1724139286012709389
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Aug 2024 00:34:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=uqnji+hb;
 spf=pass (domain: linaro.org, ip: 209.85.208.181, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2f136e23229so53347281fa.1
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Aug 2024 00:34:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724139284; x=1724744084; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tgKZpqBXrjf1OES7gEycEmUgEmghEc0kbK4oGu2c7pg=;
        b=uqnji+hbHp1wIg39grv/MjSo3ALCmRH8IocpaAIO2LOWSyAHzkZ5Pp0YxDbI3l0IBg
         f7lyuMCfUIBnQcYWkMHddm+XxFv+N+SVWR/RCsctyxrpJ00hDpCiKFkDPg1ZEKtiPa03
         aultyOPt5ZtbnX2AyOT9azru2Ra5sBeHfQCkwO0UzWxGnJf8PNjjijtJj9S6X+ZpKU5U
         6GzCMCti/fVKJRhcR9LSmm5MZC2CSU0gzKDGlCRcVXxDQIvf6QVhwGz+n+X16jNgtasm
         YX62Km0jE8xv29OvrTvoLSzR5+P7V3z7xEdTLepYlyK396jZmjlr6YrOg25RkCaY2SYZ
         ynVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724139284; x=1724744084;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tgKZpqBXrjf1OES7gEycEmUgEmghEc0kbK4oGu2c7pg=;
        b=FnwuydO1DRE6jxbtaXlrGn6ZzM9UPkqRXIczPO7U1oIgv77MCbNaCV+460UVVd5oR0
         2Fma9x/iw7sgSIM/Ig5rvdGA1UpNFumCX04Pq3vFxdOTpzLnd0GJwo5qXpD0iUJBho6u
         QR6eAILmMzthr1Q1sjodfRuYHiGsZ2dhP0rvEQPOkV/BE7QmRZuSzdDItiLse88gga2u
         3GOaz10UJ7GThf5NNq2sAz/emWcOIGe3I9xS13xJMbyXFVWVycKktc0u1rnC/4c3PQhx
         UHzMQ9zpR+jKGnB8o10zlaE79SY54xDF27XBjKEwGHGLuILgf65wj0Bn691GueR+wifH
         984g==
X-Gm-Message-State: AOJu0YwufXhtSnDxkPmIlgbQSXqI34esIJRlRxcF1gOaxxtoJcCo2sCr
	FPRpNvc25J+sFCfYt6TqmdHmlzmID0iWbpa57Q4jM7iFjvybU6m2YZ/hS7wrWZI=
X-Google-Smtp-Source: AGHT+IFO3xBqxE/bb3SOWRv6lzHeqKPCsQj+SKol7WPtrcNpbD/Y96+fSg/y1O99pZAmXuXRzbx8xQ==
X-Received: by 2002:a2e:a58d:0:b0:2f3:ee44:c6d3 with SMTP id 38308e7fff4ca-2f3ee44c8b4mr7639751fa.12.1724139283435;
        Tue, 20 Aug 2024 00:34:43 -0700 (PDT)
Received: from nuoska (87-100-245-199.bb.dnainternet.fi. [87.100.245.199])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2f3b746cc49sm17425391fa.12.2024.08.20.00.34.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Aug 2024 00:34:43 -0700 (PDT)
Date: Tue, 20 Aug 2024 10:34:41 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: wangmy@fujitsu.com
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH 22/24] systemd-boot: upgrade 256.4 -> 256.5
Message-ID: <ZsRHESGsxYyOkv5Y@nuoska>
References: <1724136703-20023-1-git-send-email-wangmy@fujitsu.com>
 <1724136703-20023-22-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1724136703-20023-22-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Aug 2024 07:34:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203549

Hi,

Only systemd-boot? Surely all systemd recipes need the update.

Cheers,

-Mikko

