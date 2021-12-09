Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA1AFC433EF
	for <webhook@archiver.kernel.org>; Thu,  9 Dec 2021 17:01:33 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web08.14233.1639069292647857894
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Dec 2021 09:01:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=dfyGhYU9;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.51,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f51.google.com with SMTP id u1so10752964wru.13
        for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Dec 2021 09:01:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=KtJaVeFp/MukWU3DRcO7TnsiQbQt2To3pbbwixVK5pY=;
        b=dfyGhYU9zgNogWeuSHUsxrO1Bh3jtE9Q8HlR0QyEe+psKkXChREIwkNDKEoAeNbMfk
         jeMc8I3YOjGlmd4/PJ9dEQMw51svGM22pd9TDBqQ5VV70ZdHy1fsZ2xXeEntiOR+im94
         pMYBC1ZSXtDBz7XPgX2pmt1isSLo5qX6hIyRg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=KtJaVeFp/MukWU3DRcO7TnsiQbQt2To3pbbwixVK5pY=;
        b=qKmDznW/s37AebYikJqsGiiI7gzunxFP7ElPh6ZKc2+IMX42t+HsVPsTR7DBbsW9Bg
         oj20VBv5zw3UhA0WCS+MX2CsRBJvk74hdXu2AkM69cFMmrgBechYPAlkiOw7DI6u9Quz
         GnBM/MNNdu9mR0wxOh9aRevUVZqjbUYt3Xr8Hkn8PYRVH4gYzOP7C7sijXiOtw/U6JTi
         QBNlpdZ1P1WFxfpo+waQtkh9acaqi5BjgsYc6tRngg1nHng/epTP78XBu2csKGJ3hjAA
         F2Nr3755QH95nvNH7FGgUZM+v2fdsVuAyRaqoLo/WEl4ctKM5bt/DOY6LI4jh6SaGEol
         u1AQ==
X-Gm-Message-State: AOAM532JNF2WOXMU4sJ9auPq2AoPT3LkrPSnZnOEWwonFmW1ubadoltc
	k/GAg4OggJrthyLdL6TzQONA/Q==
X-Google-Smtp-Source: 
 ABdhPJxdvXgbZ5NJz33YV8C0F7wi0uUAGrpBWaXW8uoTHz8XejYDVvWZRs1r20UWgaMXg+DgH0CohA==
X-Received: by 2002:a5d:4411:: with SMTP id z17mr7756632wrq.59.1639069290742;
        Thu, 09 Dec 2021 09:01:30 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:cb2b:2e37:1385:897e?
 ([2001:8b0:aba:5f3c:cb2b:2e37:1385:897e])
        by smtp.gmail.com with ESMTPSA id
 p12sm357143wrr.10.2021.12.09.09.01.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Dec 2021 09:01:30 -0800 (PST)
Message-ID: 
 <baae4f22b36ae868d5ced75068fad3319757837c.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 1/6] overlayfs-etc: mount etc as overlayfs
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Vyacheslav Yurkov <uvv.mail@gmail.com>,
	openembedded-core@lists.openembedded.org
Date: Thu, 09 Dec 2021 17:01:28 +0000
In-Reply-To: <0f6f7f5f-313c-2f03-5eb0-67f7a8d90836@gmail.com>
References: <cover.1637301667.git.uvv.mail@gmail.com>
	 <83e41a0b7b5e1dc41fa89ffb4d3a8105299f7b1c.1637301667.git.uvv.mail@gmail.com>
	 <26ede260f595ddb3d8cdda552d74ac478c1e529f.camel@linuxfoundation.org>
	 <0f6f7f5f-313c-2f03-5eb0-67f7a8d90836@gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Dec 2021 17:01:33 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159462

On Thu, 2021-12-09 at 16:19 +0100, Vyacheslav Yurkov wrote:
> On 09.12.2021 12:08, Richard Purdie wrote:
> > The second thing which I don't really like is this mix of shell and python, it
> > is very confusing to read. I'd much rather we put template files into
> > meta/lib/files/ and then read them from there for the variable substitutions. We
> > do this for other scripts. I appreciate the overlayfs class merged without that
> > but I think we need to fix this there as well.
> 
> Thanks for the feedback, Richard.
> I see only meta/files. I guess you meant this directory.

I did, yes. Not sure where the lib came from! :)

> Will do the same for overlayfs.bbclass too.

Thanks!

Cheers,

Richard


