Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web08.3519.1610726722666947822
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Jan 2021 08:05:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=HyyRWXPv;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f47.google.com with SMTP id y17so9784842wrr.10
        for <openembedded-core@lists.openembedded.org>; Fri, 15 Jan 2021 08:05:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=7FATem6GLh1Fx4+O84rlJLAQ1yAIkjegfBq91ptndvs=;
        b=HyyRWXPvMGn0WDQJcLkUTW8e/jbirVU15xPkYJWDKFVN010yJSCdhI7uBLl5A8y7DX
         Vcyn4H9uGflsD5H1JW8kBOheCsDZivESwDQqd0ifolAYj+RkjKyRnswsgT5zhEgo2eHW
         ldGvK8jIEll+VhERAN7/9aXwJ+N1MqusAaZ2Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=7FATem6GLh1Fx4+O84rlJLAQ1yAIkjegfBq91ptndvs=;
        b=CqDxrF8h7XVV1ljgdUXk3amMgFJFXDixOPrWFeCAiv1GUoKvplUs0ubSOWej8ziZsd
         ps37iWnTR7RSReuEtFfyjNo456OXkyCnKiOWpa2gHuu95HR6BjRSFaDGUw9D0Vjy3xZE
         GNXtXJ15mkp5iGvrMX9bZfGm74sdLGcy1JOp8ZEBbcEaM244hgtaY1fS3vG1CAgN0BIB
         tJg8FJjo3+IATXbK+kmdl7R8xPeeVpd/BmhmCQUtNzFCFbPOC1iQZdHN75SSWRBwTcXV
         2dRpqLhKHQWGnko8Y00CyKAeQE1GXJ8KFAca9Xc5KqSV/OOfHen2f/V0r1KAGMUlpKUm
         8qUg==
X-Gm-Message-State: AOAM530N5igbn9isy1eNBOlZWfH6n1WQARF8M4qiM+sbf9bfhFZypdtF
	s1o/RSat5x/ihfOhy/3+GIg6GQ==
X-Google-Smtp-Source: ABdhPJwbMwUiPRqbhmek5DG7vZyDDgQgNxKUhylh4cYYZEylp8s0eNU7wk02iEaT291THLZUo84Ymw==
X-Received: by 2002:a5d:4e8c:: with SMTP id e12mr13480165wru.321.1610726720938;
        Fri, 15 Jan 2021 08:05:20 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:974a:2423:c71:b423? ([2001:8b0:aba:5f3c:974a:2423:c71:b423])
        by smtp.gmail.com with ESMTPSA id r16sm15176981wrx.36.2021.01.15.08.05.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Jan 2021 08:05:20 -0800 (PST)
Message-ID: <ee564b97e176be05739442e9c271bbce565da4d5.camel@linuxfoundation.org>
Subject: Re: [OE-core] Question about security_flags.inc and CC_ARCH
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Michael Ho <Michael.Ho@bmw.de>, openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Date: Fri, 15 Jan 2021 16:05:15 +0000
In-Reply-To: <CBE0B95A-C2E7-4FAF-AD1D-E0EEBCB177C2@bmw.de>
References: <CBE0B95A-C2E7-4FAF-AD1D-E0EEBCB177C2@bmw.de>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Fri, 2021-01-15 at 13:46 +0000, Michael Ho wrote:
> I wanted to get a bit more understanding of why security_flags.inc
> tweaks CC_ARCH instead of CFLAGS.
>  
> Some developers who consume an SDK we produce using Yocto noticed
> that CC and
> CXX has FORTIFY_SOURCE embedded in the variables. These developers
> sometimes
> want to compile software in the SDK with compiler optimisations
> turned off in order
> to run code coverage tools like gcov. Typically they drop
> CFLAGS/CXXFLAGS in order
> to do this but they noted that with the SDK they also have to
> manually tweak CC/CXX
> to remove the FORTIFY_SOURCE references (because compilation fails
> without
> optimisation flags when using FORTIFY_SOURCE).
>  
> This comes from:
> https://patchwork.openembedded.org/patch/167198/ and
> http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=6733a7873ca121295a2e309a6915b9816e1ae36b
>  
> I would’ve expected actually that FORTIFY_SOURCE bundles itself with
> CFLAGS/CXXFLAGS as it is dependent on being with the compiler
> optimisations. This is also how the Debian hardening wiki seems to
> describe it used [1].
>  
> I am guessing that this is moved to CC_ARCH to ensure FORTIFY_SOURCE
> is being enforced around the build system in case components are
> skipping out on CFLAGS and CXXFLAGS. Is that right?

In theory we should be giving an error if CFLAGS or LDFLAGS aren't
being used to compile our output. You're right that we probably don't
detect every case though and that was probably why we did that. I don't
really remember though. Khem might remember more, I suspect he'd have
done that for a reason.
 
> Would there be some objection to moving the security flags to
> CFLAGS/CXXFLAGS for the cross-canadian target (sdk)?

Yes, I'm fairly against people getting a different view of the flags in
the SDK compared to the main build environment, that just creates a
different set of problems unfortunately.

Cheers,

Richard



