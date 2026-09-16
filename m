Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14271C88E5C
	for <webhook@archiver.kernel.org>; Wed, 16 Sep 2026 06:34:59 +0000 (UTC)
Received: from mail-lf2-f12.google.com (mail-lf2-f12.google.com [74.125.229.204])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8906.1789540490175437281
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Sep 2026 23:34:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=dZKRxRhX;
 spf=pass (domain: linaro.org, ip: 74.125.229.204, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b5e4f1651cso530020e87.0
        for <openembedded-core@lists.openembedded.org>; Tue, 15 Sep 2026 23:34:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789540488; x=1790145288; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Zof7dnqxZ7XNHDgneKbvwP73QLeF3k7gt8XmRv9268o=;
        b=dZKRxRhXXe1KCm7I+KsUVde5cB86QqQW8cPElhekArxDVZmnjlTSHLqOCP/O8PtcqN
         WjGZlFC8esHVgyLkMzjaE6y49JnuUqi313rB3f2odcVzzIX3vu1HQRsaFvBXN/+U1oCJ
         6amctp/0OIlZaOO/YBZOrQlqidhR8zcd0UYrETA2oO6QvgfYwdIabH2AvEdEn1ySFKy6
         UJBfsM2FUxPGOD3QNzTnyo9hxRis4Na54Jgl9U2UgMqDzlNwDnMDjTIzERhVUWdawaZr
         8WpngX6PH9M6wavyDttPeXKSVuF3cTPInst6fLcX/rY/tcikv+4u+N8vqXGiigSI2Hcr
         S5Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789540488; x=1790145288;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Zof7dnqxZ7XNHDgneKbvwP73QLeF3k7gt8XmRv9268o=;
        b=SLMHFjV81Wt6iGWMm8psKxQq3idkOgoOsrveAeIt93BujnVyZzJAZ1Py4BU3eOYqdJ
         O0+CMWdjKl48SjWInZC6bd3PogBFDIH+3QwHXARh3jZwF1Qpxgeyyw63NYbPmqeCsSsX
         Uwzb1gjSJLQaE2PBqFE+ilp5U7Jol3NsBfrs5Z91P3c+TaLegFKl9lIO8lFeHyojB1gi
         yTAQeAxDifRbMSYYTzGFy8Ct8SUmyLWX18egDCDOSBINNfr6y+x93pVbAodgrlGyoPbB
         ww3z9MpZmyeb58EXUzm2pjPLEBr0CoomrkBaxrDVKtlXloNpp1Dler+KpS/wGXTwzO2R
         j5/Q==
X-Forwarded-Encrypted: i=1; AKwUvBwybbLRR6adAlXrff/Nn+dTEU+4bemX0Q1SFwgrkoFfrE0hYmxRFy36luZjRnOajq2xxG4rFs6sOp4ZMoE5qIIimA==@lists.openembedded.org
X-Gm-Message-State: AFuF++menP85ud0epElHUIL3UgsVhlJ6mRsVAMPYuu079yl+TBJdwPWh
	l9ezIDfzS+mXEiDddiVlAukn9gUTwbbd6wgprGwXYNQ49eHdGTYMoZ8Gx63K7mWf5Oc=
X-Gm-Gg: AYBFou2OAQ3+GHevGav29wU7hraAlLqhWfjDXnGLx0VnpojSLhim61Cd0GffVQHWkZr
	PcCttgHwrnOBf421sSvojskoTcpukXGeLMKY4sRmkollzejohnGjZTAqvpRc8x82qiC6e+HJtAZ
	i1c62v5J3EUpVvKUSfOJg7iL7rH89FZAMsfFTK628R/KVRojlNg/TB+6KfwN1i4F8pVUpgTOMns
	PSMAw6KxBWvXTyTmw/4kpnVHxl6v4plgQobB8wC/0HFMaPEOTn3qo/+46tGp2XVbi/P1MPUB/lW
	GWN7IyU0h4r0+FnZBEnuKERXrPFkCDcx7X4lXmocOdQ2qoV882CjpuLpBZBcMM/1zMTJWCQU+v3
	1aSR62AsDYLRUFz2z7tY2RMfIx3vkHcuwqIeN3ITjW7FAR5i1Dftw4Pg0Lz5wd1GtLbGZbAsvGB
	OW5rlVHc0A+eTuohFw7LkPjFS1L9GttWRSr67a6PUh9+TNn/B/XRkBoplaaanyKBhnPYG4c11kN
	dn2UxWTSvoaxN6TlFHvzhF76g==
X-Received: by 2002:a05:6512:3b1e:b0:5ae:b2b0:4c0e with SMTP id 2adb3069b0e04-5b8b661230amr346242e87.1.1789540487905;
        Tue, 15 Sep 2026 23:34:47 -0700 (PDT)
Received: from nuoska (78-27-71-225.bb.dnainternet.fi. [78.27.71.225])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8b57ee959sm573236e87.84.2026.09.15.23.34.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 23:34:47 -0700 (PDT)
Date: Wed, 16 Sep 2026 09:34:45 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: bruce.ashfield@gmail.com
Cc: richard.purdie@linuxfoundation.org,
	openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [meta][PATCH 01/02] linux-yocto/6.18: update to
 v6.18.50
Message-ID: <aqo4hfLnicviWL3O@nuoska>
References: <18D59CE1160E5503.1924412@lists.openembedded.org>
 <CADkTA4PK+tZuCHuBR4ZPahYUYy4QmYEoz85Vv1q34AT70c8mMg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CADkTA4PK+tZuCHuBR4ZPahYUYy4QmYEoz85Vv1q34AT70c8mMg@mail.gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Sep 2026 06:34:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245926

Hi Bruce,

On Tue, Sep 15, 2026 at 05:50:36PM -0400, Bruce Ashfield via lists.openembedded.org wrote:
> There's no second patch coming, it went to the yocto list for BSPs!

I don't see the yocto-bsp side patch in https://lists.yoctoproject.org/g/poky/messages list
archives. Same was with previous kernel update series.

Maybe they just went to Richard directly?

Cheers,

-Mikko

