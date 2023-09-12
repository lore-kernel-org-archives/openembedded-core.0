Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EE69CA0ECA
	for <webhook@archiver.kernel.org>; Tue, 12 Sep 2023 11:54:07 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.web10.22910.1694519644779166989
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Sep 2023 04:54:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=OFXdqMCM;
 spf=pass (domain: linaro.org, ip: 209.85.167.53, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-50098cc8967so8881491e87.1
        for <openembedded-core@lists.openembedded.org>; Tue, 12 Sep 2023 04:54:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694519643; x=1695124443; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=l4P6fsOEDTHDbtSCjccUOkIprrk7n8xmDXpCSC4a8vI=;
        b=OFXdqMCM0hu/u/Rega+T84qBxKMrXs4ABFhykj+e0fnWdk2IuvZvRGlQB/RK+OqSnB
         +2nld8IoKj2dJWDcYRixHfMK2/7TTtJqiGp9K4a0FXtfZIJixuTxTNprgnrI9EKqKdNu
         8NyWuYFb3Wqe6xOpUsF9wjvNEt2fXsEh0jWGxHBD9wsk5XfBUNbwOeCcMdIAxQk6vDTT
         LRUZTKrYSG9YMXVN9pTJE4/QHruzUz6cGZNUfDKDITqjH33hCPvYbp6uoVtZkWCok1g0
         zD9KSW7R7gjeh9Js7X3X9yiAsK3JkPyTzdqF2mABBOc6o0Wjnt4R9ofU8s8BOLTsoi7F
         cC0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694519643; x=1695124443;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l4P6fsOEDTHDbtSCjccUOkIprrk7n8xmDXpCSC4a8vI=;
        b=ijbMwheTxEMPK9V5FRwQE+8viFOdhyFITln3ETrodW61c8S5BI9sTEIP1zkJmWUWHI
         TRnp1KjdXbXPROuq6S+TjN84pLcdz2Mh4Kizryq3hwHCenL14IRXhqDgaoSwip+Y5nIW
         /zygbqZ7ElVWm6hRKTB4Qv9Kah+QK6TosNy3xq8/ju/n3mDvvFktLKxFwHFYvZu8Z6pb
         G4gh0osVxJIt0/n5q5e6RQ7ZmzFLsLN6eKf+QI8EF5GB5Y5Wyefuzag77F/VafKs1QY3
         ryierKu1Ite3PHwCyW4AdocmoYw7OXINtq/oucYso7LBqBc8XqUr2mdEA5jMqxRqelDa
         QIdQ==
X-Gm-Message-State: AOJu0YyU7VcGcGeZn8PpkhrdcHsFw3HC5CslaI6D1EnNO9ZGPPC3E8GN
	jl9L/YTSGt6X6ew1D4m+KdaOy9efLN4wsWw7LjA=
X-Google-Smtp-Source: AGHT+IG42Y1hPqpCsdiHaGWTe1tGmctIs6nyOSSNAark7ukmpId3GSW6zo2PIsVIqM/nGOFzCIomDA==
X-Received: by 2002:a05:6512:6cb:b0:500:ba39:f0c1 with SMTP id u11-20020a05651206cb00b00500ba39f0c1mr12637684lff.20.1694519642875;
        Tue, 12 Sep 2023 04:54:02 -0700 (PDT)
Received: from nuoska (dc7g6tyjby-d304c4945t-3.rev.dnainternet.fi. [2001:14ba:16cb:a800:e107:c77f:6058:ee33])
        by smtp.gmail.com with ESMTPSA id f13-20020ac2532d000000b004fe1e7f98c2sm1721965lfh.146.2023.09.12.04.54.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Sep 2023 04:54:02 -0700 (PDT)
Date: Tue, 12 Sep 2023 14:54:00 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] oeqa/selftest/runtime_test: No need to use
 append with TEST_RUNQEMUPARAMS
Message-ID: <ZQBRWI5A+6q0RLrn@nuoska>
References: <20230912113242.3994352-1-richard.purdie@linuxfoundation.org>
 <ZQBPnpWNx3iyWfnV@nuoska>
 <c33d61dd74726e6f11b2ad78f43f1d0d439b6615.camel@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c33d61dd74726e6f11b2ad78f43f1d0d439b6615.camel@linuxfoundation.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Sep 2023 11:54:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187511

Hi,

On Tue, Sep 12, 2023 at 12:50:26PM +0100, Richard Purdie wrote:
> On Tue, 2023-09-12 at 14:46 +0300, Mikko Rapeli wrote:
> > Hi,
> > 
> > On Tue, Sep 12, 2023 at 12:32:42PM +0100, Richard Purdie wrote:
> > > A simple += operation is fine for working with TEST_RUNQEMUPARAMS so remove
> > > the heavier append override usage.
> > 
> > Ok, but I was being consistent with the other variables in the tests.
> 
> Fair enough, I did kind of guess that. In general we want to try and
> reduce the amount of :append use over time though so where we have a
> choice, we should just use +=.

I fully agree to this but I wasn't sure what kind of local.conf is used together
with the test so an :append made sure that the needed content was added, always.

Cheers,

-Mikko

