Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EC79C6FA99
	for <webhook@archiver.kernel.org>; Sun, 12 Mar 2023 14:07:43 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web10.67043.1678630060700119783
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Mar 2023 07:07:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ig8swzjm;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f44.google.com with SMTP id o38-20020a05600c512600b003e8320d1c11so6286920wms.1
        for <openembedded-core@lists.openembedded.org>; Sun, 12 Mar 2023 07:07:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1678630059;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=EdkFzeh2ojrYhfUfYN0mji0fhtnfqAmyNUAQEbLjRVU=;
        b=ig8swzjmeBzRSlfyhX+YkdfrQX0NW87c47pJcF9cx6WdkJip5AaG27CBW/yGPPDyiY
         ULWA+EqGLXcpSFyI0JvbpQNBf2jkKwthJx4M4qYjHr9cNOGoeS920owS913EQFwJVuWb
         tPvshQ5MYocwlQF4m7IfFzxzC0bDXs2DWdqIk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678630059;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EdkFzeh2ojrYhfUfYN0mji0fhtnfqAmyNUAQEbLjRVU=;
        b=1VbvSHIwa+JFAKE9t/WcWjecMpchKfvIZFEgSGHYoM3kiqcJVuFbwFPNVpjzph3j9Z
         piNw+ICK7nfcmE0z2S+0/3bLisD6vUj9FFxcMseb9g/RsFiAKnC4VKpFeFjmjLcfScho
         LCtwL6iMr6snRN/5PgmuyPlHmm4p8Jixz2JpkkGoSaXVE3wWsASIIij9TPmHMXbls2xZ
         g+iK05Dg915ilTw2H8GxFC01FJZkjQ6Gna6kgB7zmHIo0Sjl+gRf27dLNmE2x9/+irvI
         My8H3ewkG+wAhEhb8ugkWMyOK+AOfSneRtTWX/OPOQbWcP5svA2MF/7qzQ8PmPCefrEH
         Jdig==
X-Gm-Message-State: AO0yUKWQKCFl8PQGQrisRN7n/J7tY1QU9B+tHIfmcGbVVU4EFHx3Bfcm
	S3WSuWSQg5hqIjrxogUUTi7xOTngeSvNPhPQ6Xk=
X-Google-Smtp-Source: AK7set97s/ObqN5JEPYxIT+VwraxaRJAJGF85OW2atRMuoj9657sftMnsAraktvJIJKz8xJXfh6TSg==
X-Received: by 2002:a05:600c:3151:b0:3dd:af7a:53db with SMTP id h17-20020a05600c315100b003ddaf7a53dbmr8213957wmo.11.1678630059052;
        Sun, 12 Mar 2023 07:07:39 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:ee:6264:1be3:a6af? ([2001:8b0:aba:5f3c:ee:6264:1be3:a6af])
        by smtp.gmail.com with ESMTPSA id hg14-20020a05600c538e00b003ebf9e36cd6sm6027532wmb.26.2023.03.12.07.07.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Mar 2023 07:07:38 -0700 (PDT)
Message-ID: <5646b59df6ae24ca3e15710e86084a556d1d5b88.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 1/3] oeqa/selftest/sstate: Merge sstate test
 class with tests themselves
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sun, 12 Mar 2023 14:07:37 +0000
In-Reply-To: <174BB0E170CBB178.32367@lists.openembedded.org>
References: <174BB0E170CBB178.32367@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 12 Mar 2023 14:07:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178391

On Sun, 2023-03-12 at 14:02 +0000, Richard Purdie via
lists.openembedded.org wrote:
> Having this base class as a separate file is just confusing. Merge with
> the rest of the test code.
>=20
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

Whilst I stand by this series as a set of patches and think it is a
good idea, it seems to cause failures in the wic tests:

https://autobuilder.yoctoproject.org/typhoon/#/builders/87/builds/4948

That is somewhat worrying. We'll need to work out what is going on
before it can merge :(

Cheers,

Richard

