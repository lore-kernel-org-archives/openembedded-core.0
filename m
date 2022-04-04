Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DDD6C38A06
	for <webhook@archiver.kernel.org>; Mon,  4 Apr 2022 18:46:42 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web08.34289.1649073702183038927
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Apr 2022 05:01:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Hhcr1t5H;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.49,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f49.google.com with SMTP id
 l7-20020a05600c1d0700b0038c99618859so7582270wms.2
        for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Apr 2022 05:01:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=o6cCtfw1L2UGAsUGa9v40ZrxAkogyavRUlz2hPRm7s4=;
        b=Hhcr1t5HMz+5UBpULbcUGsHwtJ+FChJoUmcU2RmSf6B9YMF9Uv7opeKsRtHt+gT/uI
         UV0fb5uIL9oUVBFNKMkj7r45VicSfltyUblHuSNWwVf4Vtp4uyFPmoi/DPJ+RWIvBK4f
         JEWHKKZcqJf36iPKpEfOwoRkAQY9+4BGlWQPg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=o6cCtfw1L2UGAsUGa9v40ZrxAkogyavRUlz2hPRm7s4=;
        b=onsCSH25npPA+8rXyTBvprQ7/32bOWPFTm78DgG/hoyHW7rEj2rAJlgGQEM0jmrcQw
         xtnLx+w5bt1TSyzjvN8AFT9trvXKeKO8tDjI6CqxTitlx+MFxY/pg4/N6JFpET9epjs0
         +rRU+dzpO3RYtDZNf3NPqmmM1Dy6emfDKysLFTz+00KyQMn8D05ipprfNMyvazHTpBTU
         FeDHWT90tjYkluaqz2d9XlCdkU+CXhfbMqGTDjpklLiDaAtiNJC8YGPlgRIl9RL89v0v
         Ur+ZoM/M4cZBkIJY3ksVo6wFh+SdH5kuZ/Ye3O99mprVV80e8bDVb4VgrSpeKWpIQBqO
         X8Pg==
X-Gm-Message-State: AOAM533jMkCoWeaNLaC+ZcTcmmGq9ezvQ65OgCS7TBC1B77421mgsagM
	WJcOZbHw9Qhh0o9sZfLSujJIeQ==
X-Google-Smtp-Source: 
 ABdhPJym6gOzpvra1ZkgVFMOUtUCaEIxgKN+gYJe2aL7htd+KHr1tsEgy0yvOY41Rh+LFN5Xi5wJOg==
X-Received: by 2002:a05:600c:3ba5:b0:38c:b19e:253c with SMTP id
 n37-20020a05600c3ba500b0038cb19e253cmr19110860wms.35.1649073700420;
        Mon, 04 Apr 2022 05:01:40 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:4552:8cb0:e722:b501?
 ([2001:8b0:aba:5f3c:4552:8cb0:e722:b501])
        by smtp.gmail.com with ESMTPSA id
 v18-20020adfc5d2000000b0020589b76704sm9681328wrg.70.2022.04.04.05.01.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Apr 2022 05:01:39 -0700 (PDT)
Message-ID: 
 <c2ccedc825915c7caa176cfabdf23f9772a526ad.camel@linuxfoundation.org>
Subject: Re: [oe-core][PATCH 1/1] unzip: fix CVE-2021-4217
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>, Joe Slater
	 <joe.slater@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>, Randy MacLeod
	 <randy.macleod@windriver.com>
Date: Mon, 04 Apr 2022 13:01:36 +0100
In-Reply-To: 
 <CANNYZj9pna_YZiKeJjTDEGCzNmwWm5puO8fECYBN+mbANMyrfA@mail.gmail.com>
References: <20220331184230.27859-1-joe.slater@windriver.com>
	 <CANNYZj9pna_YZiKeJjTDEGCzNmwWm5puO8fECYBN+mbANMyrfA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Apr 2022 18:46:42 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163990

On Thu, 2022-03-31 at 20:47 +0200, Alexander Kanavin wrote:
> The origin of the patch needs to be better explained, right now it
> seems like a random thing off the internet. Upstream-Status is
> certainly not inappropriate, as it is a security fix.

I've tweaked the headers a bit on this to show the launchpad discussion where it
came from and marked it as Pending. The upstream in this case is long inactive
unfortunately :(.

Cheers,

Richard


