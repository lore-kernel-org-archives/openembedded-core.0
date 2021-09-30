Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9187C433F5
	for <webhook@archiver.kernel.org>; Thu, 30 Sep 2021 09:47:56 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web11.10261.1632995275944541907
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Sep 2021 02:47:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=a5Ljh8eb;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.43,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f43.google.com with SMTP id
 d207-20020a1c1dd8000000b00307e2d1ec1aso3838679wmd.5
        for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Sep 2021 02:47:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=6SRD2ECX1YYPfV0FeoYnsIyw4TKD9wkLExuSTO1MQdc=;
        b=a5Ljh8ebgHUyLiyqlfZ3nIs2CSgJMrakFVmLM3IoXdrJ1rHITUGIt0lU2TzE0PHU6u
         7Nl3PViVdo2IXXF6bTcLjagNGujL2l4X4leJoJ5wUqqroFqC0YZyI711nFY2ZEe3XDkD
         vV0x7XX92nTkXGayFp6SjKYK610DwJx3NzKZE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=6SRD2ECX1YYPfV0FeoYnsIyw4TKD9wkLExuSTO1MQdc=;
        b=SBFXVEXLTsyvc+tqXYhGdyFC96Wg70sDqr9PCG5CS4IiYCzOSoviGG0ZjHON241LYF
         r5jtBNPYOo2D/zPOyuz53Ew6e6e1gNS6K3Q0sUU6SpXQkJUyYmBCGhD1u0orPNJjfBOi
         5fRiTFUGtFv8MqA5vPh/fCTWG2xpJkRa0FR+fE7OIGj81H64AXjckcVqFNdJS+WMXacm
         o11ZonY1ncmiAjWvUqGoIu6pK+3QKhZ1Vu9xdkS+pCfc3NrTrv93fWkZomHMfBEXv1UM
         LCDhMWvQRoscp9wrjOyRNpsSkDbPKV1PceM+qEJMeicyExRIiQLn/u0+AEjgiZvTgbpp
         X4bw==
X-Gm-Message-State: AOAM532DN4ZjeB46RvYI6r8iHII7/nNuZufN7LEn5jQmLYG2HVTVHzES
	4BX6nTLMBiGbld54eTijoW8MXw==
X-Google-Smtp-Source: 
 ABdhPJybVNrDhNjrmoNVK9eURIhrGceulh2jNXXWlcLmvg5rMgDC3cvW179wQbtlhvvSqtCwrJWFmA==
X-Received: by 2002:a1c:e906:: with SMTP id q6mr15525715wmc.126.1632995274076;
        Thu, 30 Sep 2021 02:47:54 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:920b:2709:912f:a3ff?
 ([2001:8b0:aba:5f3c:920b:2709:912f:a3ff])
        by smtp.gmail.com with ESMTPSA id
 f17sm2691333wru.69.2021.09.30.02.47.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Sep 2021 02:47:53 -0700 (PDT)
Message-ID: 
 <38f7a46fd43f411aedcf622891cab8985f9f9130.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 1/2] bitbake.conf: Ensure XZ_THREADS doesn't
 change sstate checksums
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Mike Looijmans <mike.looijmans@topic.nl>,
	openembedded-core@lists.openembedded.org
Date: Thu, 30 Sep 2021 10:47:52 +0100
In-Reply-To: <9b55887d-d2ce-5443-5e4d-be7f4133d5f7@topic.nl>
References: <20210911100454.1285040-1-richard.purdie@linuxfoundation.org>
	 <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.949ef384-8293-46b8-903f-40a477c056ae.d232f846-51ae-43c0-85e8-be1b07245956@emailsignatures365.codetwo.com>
	 <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.0d2bd5fa-15cc-4b27-b94e-83614f9e5b38.5a416b0f-56e3-45c8-b87b-0760607e2824@emailsignatures365.codetwo.com>
	 <9b55887d-d2ce-5443-5e4d-be7f4133d5f7@topic.nl>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Sep 2021 09:47:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156489

On Thu, 2021-09-30 at 08:50 +0200, Mike Looijmans wrote:
> Wouldn't "0" be a better default? Setting threads to "0" will make xz use the 
> CPU count anyway, so it'd be honest too.

On some systems we have this set to a specific value rather than auto so any
value is potentially dishonest. I think I went for "1" as it was clearly the
least likely and more obvious when looking at the sig files to see if it was
working.

At the end of the day it doesn't really matter as long as it is a specific
value.

Cheers,

Richard


