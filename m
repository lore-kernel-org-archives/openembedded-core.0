Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web09.2909.1626986770830452449
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Jul 2021 13:46:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=SiwqGsjL;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f49.google.com with SMTP id k5so30562wrq.12
        for <openembedded-core@lists.openembedded.org>; Thu, 22 Jul 2021 13:46:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=IAxh1Em/QMJrqWtaJ/+RbjsXAFffTaKRv4E2zNnxPMc=;
        b=SiwqGsjL3RNC7zI9whp9cAKZGTr+2M8Jq1P+dsjD/yA8muoC4C3V+3Yy+sVtDKnk2U
         xlHpHceIuUnhdCNgEcgdiTM0OahYBhjr0jBFxSl3+/RZN9tUD597lTrKp9X4KGsstWFU
         I/9OIRspc9xXc7NE5w14QpdFZ1QzTWC4BeSXw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=IAxh1Em/QMJrqWtaJ/+RbjsXAFffTaKRv4E2zNnxPMc=;
        b=RFpZA42iARWSuefy2fKpaC+NSswE75UymU68fuqwozUQPGMPPTSHuBJi0m4JGR77Ij
         gEfWLEk+/+FcD44BANjMtEJdbiRWa8s0nYGzU1yhXI3NhnkQgHMfSo6bECQptS0WwZXw
         WTKY/hOcJG1CmOAWOyHnDEqpXs5XUuINXoLy1wwoSAQhVar1foejo1JBWan7VgZCSNYz
         lxUiPeX40tJ9R5/l8QLe5c3NTR2OnE7+h3WwexHf0pYN8cVVaqeWYtNY5n79JHvydhey
         M4/iOF7VNVKfh9V8VRYGcxPH7MgtZ2kT66fxehB3FN2T4JpDPh+QUFq4wQn8I8KjWft9
         Q5SA==
X-Gm-Message-State: AOAM530L56jHsLZCrmlSdjDieXtbLcFTFYdqucmdZpCsQppCyxCe006Z
	RXyq3x2QiL3mxqLsjHMBbd0cHw==
X-Google-Smtp-Source: ABdhPJzGR1CRnsh8hdZdLIIps0kE887RNQ1JGux/P3PoyfcuC+hSSCsRuiT1EicQmL/k9f6jLfyQnw==
X-Received: by 2002:adf:a31d:: with SMTP id c29mr1807878wrb.344.1626986769318;
        Thu, 22 Jul 2021 13:46:09 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:e1dd:b42c:9243:6ba8? ([2001:8b0:aba:5f3c:e1dd:b42c:9243:6ba8])
        by smtp.gmail.com with ESMTPSA id l24sm3430433wmi.30.2021.07.22.13.46.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jul 2021 13:46:09 -0700 (PDT)
Message-ID: <7c8a96980bdc7d6d3d6a81e07b8ba8e1328afcff.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 4/4] yocto-check-layer: ensure that all layer dependencies are tested too
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Bruce Ashfield <bruce.ashfield@gmail.com>, Nicolas Dechesne
	 <nicolas.dechesne@linaro.org>
Cc: Patches and discussions about the oe-core layer
	 <openembedded-core@lists.openembedded.org>
Date: Thu, 22 Jul 2021 21:46:08 +0100
In-Reply-To: <CADkTA4MfOnbxF5c9MyfD79r_pmN0Yw4KH6Gx5mjSR1nYkA9Wgg@mail.gmail.com>
References: <20210722124644.19962-1-nicolas.dechesne@linaro.org>
	 <20210722124644.19962-5-nicolas.dechesne@linaro.org>
	 <CADkTA4MfOnbxF5c9MyfD79r_pmN0Yw4KH6Gx5mjSR1nYkA9Wgg@mail.gmail.com>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2021-07-22 at 09:16 -0400, Bruce Ashfield wrote:
> 
> 
> On Thu, Jul 22, 2021 at 8:47 AM Nicolas Dechesne <nicolas.dechesne@linaro.org> wrote:
> > In order to be compliant with the YP compatible status, a layer also
> > needs to ensure that all its dependencies are compatible
> > too. Currently yocto-check-layer only checks the requested layer,
> > without testing any dependencies.
> > 
> 
> 
> Is that actually written into our compliance statements ? (that dependency 
> layers must also be compliant)
> 
> I had never heard that before, and in my opinion, that will actively encourage 
> people to copy recipes if they want to be compliant but a dependent layer is 
> problematic.

It has been the case as it logically doesn't make sense otherwise but the 
YP Compat pieces need better documentation. The TSC did work on fixing this
up but we're blocked on a lack of advocacy people to help with the other 
side of the programme.

Thinking the above though, the reasoning is that if we don't require that, 
it lets anyone just push their non-compliant bits into meta-non-compatible 
and then have meta-compatible depend on meta-non-compatible. It also meant
nobody had much interest in having meta-oe or meta-virt being YP Compat.

The hope is that it causes "bad" layers to get fixed. We've put pieces in place
to try and at least ensure the core layers pass and stay passing.

>  With this change, all dependencies are also checked by default, so the
> > summary printed at the end will give a clear picture whether all
> > dependencies pass the script or not. 
> > 
> > Using --no-auto-dependency can be used to skip that.
> > 
> 
> 
> I'd actually prefer the opposite, to make the compliance runs faster by 
> default, versus someone having to find out about this option later. We 
> already get complaints about check layer speed, and doing more by default 
> won't help on that front.

I can see the arguments both ways on this. "The script says it is compatible
so I can use the badge" :/

Cheers,

Richard



