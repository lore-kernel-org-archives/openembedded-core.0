Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 779FBC433F5
	for <webhook@archiver.kernel.org>; Mon, 27 Sep 2021 08:41:25 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web12.28529.1632732084065231239
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Sep 2021 01:41:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=BHMk4GRa;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.52,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f52.google.com with SMTP id r23so24773286wra.6
        for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Sep 2021 01:41:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=NALDwmt5nLQWdHdfbl/9ymEBVnpOYcDRLfXRcIgCrOw=;
        b=BHMk4GRafB65GGT9aAxXZ5Ae1yPMkrNcMkZM0Iubvly2tzyo7mTrWiCaZMFkuR2Sx8
         KMQmnnUdti+36GNdsxx00Ut5VR6OhyizywGRHMq+DTnxMkVrEZDBABo7LTQcl3QHjOUj
         m0WnFUd06rZHZhnM7JpXb9/iBgfWmByKzUpn0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=NALDwmt5nLQWdHdfbl/9ymEBVnpOYcDRLfXRcIgCrOw=;
        b=SWfSExjhJZROBXUgQ+nwdcQRDn2cczHB6pOQ8ZvepyXSMsiu/AA5yVLmQU1kx9kLHO
         iB1ZXodAI73OpBA+/t9tkMfBpbm9/+TkICU22j2wb4FFSKGl/8yug1BqSOaae4oi2k19
         K1mJpuwLi5b7eLekhpkBPktJw8ef6JELlOzkEEr7vrBHCRM7/dxcYF+vlNfEJg4GRKYq
         xptLmrm4efrIYCfxqajNqpUWSekaqXdf3Jxwfbx6sihJfocYVrXO6o/z+PNG0IMAq46K
         phAa6pesatfZkCfFIJ2dEcU6PrHkPtzA/aTZ+EVF9F/MGkYQIEJI/0TQVyqLYYfBdvlS
         9AKA==
X-Gm-Message-State: AOAM531PuBx01tA1fq6HZt0biyJT08v2P4fz0/9pKvGfql3zZiaQo5AU
	NXwiZJjRP4EU8BO0syIr/TILig==
X-Google-Smtp-Source: 
 ABdhPJzkb9FE6ywsUFDFKA9u7OuTt0JOf1dFvrpG0eFB9hi8Jj1Fm1QaEHfmz20DP0T5tJczOWek6g==
X-Received: by 2002:a5d:4579:: with SMTP id
 a25mr27015991wrc.222.1632732082559;
        Mon, 27 Sep 2021 01:41:22 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:8a1f:b4a1:54ce:d4b1?
 ([2001:8b0:aba:5f3c:8a1f:b4a1:54ce:d4b1])
        by smtp.gmail.com with ESMTPSA id
 h18sm15896357wrb.33.2021.09.27.01.41.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Sep 2021 01:41:22 -0700 (PDT)
Message-ID: 
 <6f627a9a4dcbca01b1016df791356802585a9f98.camel@linuxfoundation.org>
Subject: Re: [OE-core] [meta-skeleton][PATCH 2/2] hello-mod/hello.c: convert
 printk to pr_xxx
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Trevor Woerner <twoerner@gmail.com>, Quentin Schulz
	 <quentin.schulz@theobroma-systems.com>
Cc: Patches and discussions about the oe-core layer
	 <openembedded-core@lists.openembedded.org>
Date: Mon, 27 Sep 2021 09:41:21 +0100
In-Reply-To: 
 <CAHUNapRcmujnMuAKfX+PzGQ3ryLpKYTwre6xLBhUP-Pcx=u4Jg@mail.gmail.com>
References: <20210915003804.34746-1-twoerner@gmail.com>
	 <20210915003804.34746-2-twoerner@gmail.com>
	 <20210915105303.3x6gmiuaisqkxlvm@fedora>
	 <CAHUNapRcmujnMuAKfX+PzGQ3ryLpKYTwre6xLBhUP-Pcx=u4Jg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Sep 2021 08:41:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156375

On Mon, 2021-09-27 at 03:42 -0400, Trevor Woerner wrote:
> ping?
> 
> It seems 1/2 got applied, but I didn't see an NAKs for 2/2?

My intention was to apply both, not sure what happened, sorry. I've queued it.

Cheers,

Richard


