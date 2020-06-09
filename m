Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com [209.85.221.65])
 by mx.groups.io with SMTP id smtpd.web10.1431.1591717447064722202
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Jun 2020 08:44:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=LxWe5elZ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.65, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f65.google.com with SMTP id l11so21870426wru.0
        for <openembedded-core@lists.openembedded.org>; Tue, 09 Jun 2020 08:44:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=xNXnJggJ4ry0o+VM2xpGAXoccYqN+tY+mpBhd4+Ard4=;
        b=LxWe5elZ9sZ++ZJh9GepTp4luqiNHzCngPWOeLOd4AypXV+3lZcOIjmMoPUCCJPZNK
         /6b1wynlJb4giOFkgnp98hxk3ecyRcaKw2Vo3rKQPV2JErWL7RscdibN0h7WefvIf5d2
         +/N2yg176t4LcAf8WvpYe9bbQ9lSA2xlMvWhI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=xNXnJggJ4ry0o+VM2xpGAXoccYqN+tY+mpBhd4+Ard4=;
        b=Z2jP0KFG67RZUxy9B5zxHw0oMxbIDSj6t6a/vYFRYbepgrAMKizUOJlSSlmIalrlGP
         66Gm/zd71Sx/FtvdzlygFWsIqn016P6HD3pnSPOUKpR/WX4kizGGZuc1CtP/MfUFWRNH
         V+5qxWY9LmLq4EY2MQ1415+uHpSJa5WjifF+dgV1YtmStn9G+tFQ5M1Y1dTVOFtudsN9
         s+uG7w6mWsraSHq2cSx9fjpAZRwwKM9tCO7iK3umN4Hq+QW6Q0Uq93Nq+fJegCq6tNmy
         YicRWbGWOhgagbXZREYAMlfUXAW+QeKHXuILRXwAPUAcNNZJerI/jErWPbmCUujaYfed
         FGwg==
X-Gm-Message-State: AOAM530fIgV9yUbfvR1LFJNExw8+z17NNUg8z9udtp84VvdFBjOjKfM5
	VCOlLB9oR8aX0Ld0x2r62neiLg==
X-Google-Smtp-Source: ABdhPJzEut5TtG7nZSuG3xovtyJyzGT4Ux0hJZHHsd6RyJOhzH3x54bS1BSmEIGAvAcqVCArFMCmEw==
X-Received: by 2002:a5d:6601:: with SMTP id n1mr4961236wru.23.1591717445503;
        Tue, 09 Jun 2020 08:44:05 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id w3sm3511776wmg.44.2020.06.09.08.44.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2020 08:44:04 -0700 (PDT)
Message-ID: <ac946facf19b1d2b6c39d23a84c6eb1c5fbaca0e.camel@linuxfoundation.org>
Subject: Re: [OE-core] [RFC][PATCH 1/2] features_check: Warn if not used
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Jacob Kroon <jacob.kroon@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Tue, 09 Jun 2020 16:44:03 +0100
In-Reply-To: <20200609141114.1751767-1-jacob.kroon@gmail.com>
References: <20200609141114.1751767-1-jacob.kroon@gmail.com>
User-Agent: Evolution 3.36.2-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2020-06-09 at 16:11 +0200, Jacob Kroon wrote:
> Signed-off-by: Jacob Kroon <jacob.kroon@gmail.com>
> ---
>  meta/classes/features_check.bbclass | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 
> diff --git a/meta/classes/features_check.bbclass
> b/meta/classes/features_check.bbclass
> index 4ba827d4ab..31ce600374 100644
> --- a/meta/classes/features_check.bbclass
> +++ b/meta/classes/features_check.bbclass
> @@ -12,11 +12,25 @@
>  # Copyright 2019 (C) Texas Instruments Inc.
>  # Copyright 2013 (C) O.S. Systems Software LTDA.
>  
> +FEATURES_CHECK_INCLUDE_STACK := "${BBINCLUDESTACK}"

This looks like a rather heavy hit to want to take on every recipe
being parsed everywhere (I also really don't like seeing := needing to
be used).

I'd much rather this were some kind of test we could run periodically,
maybe on the infrastructure rather than the hit being taken all the
time.

Could we add something which just ran these tests? Maybe a class which
the autobuilder could inherit to enable these kinds of tests?

Cheers,

Richard

