Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web12.6649.1619443065093602442
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Apr 2021 06:17:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=BfjDPRrR;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f50.google.com with SMTP id n2so2696766wrm.0
        for <openembedded-core@lists.openembedded.org>; Mon, 26 Apr 2021 06:17:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=dXcMhYCMfeRSlJOwBqGlAXLCCKlBjN47p0xSldP6cc0=;
        b=BfjDPRrR0WlUmo1Z1LF9uYlQxJp63PdKQraC1znOPUwSbhS7iDJ+OI+9yfOdCfOiDs
         i9dZQpu5KkJT070RhJyA7szzRvGONq1tH9ugPlZPGpwK13AJdflHOZ/7zeEoBLsTh7LA
         NZbmLWCXUvfp2HNx2j28DuutF8FaNweprvhjs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=dXcMhYCMfeRSlJOwBqGlAXLCCKlBjN47p0xSldP6cc0=;
        b=EWRhZBCg44a1EojaYqwKu9vq/2AWvHUu/DYwDT4ozNpIu2mLF/784golwZcocRrbEr
         SLtWsv9oetGFLkmT5ePT7tXov+W/yBfnOPHOMiaOBKq5J+2KBxoowG+k2b1gRYLtS2He
         55Wo1iqT07vYGz05r9XRRvRu8Kym3Ws50wo0tDq686Q+dcipWvX/BoxENaBWbLi5PRXt
         bSfDDXBI0JZzBs5C5brB24hSzEDT938avc6y+cVL+knCbVo87HEOE4bBcO2VvFHRpN6g
         KyZ201G5MD1OKAx8zNxeb9sgACNLVssn7i2aMFvTjQ5o8oiCJvmqfZTt+nqT9tZIStIa
         Wswg==
X-Gm-Message-State: AOAM533SI3j+CGtDoJRbHC8TsL+S/CHVoMg4mLzfRES+wfElaN1yJVIY
	MJSHkC216VkbFnuK5XZuvP6W8g==
X-Google-Smtp-Source: ABdhPJzFgXQUf9jDGBg4+X4rYzyrReHuB0Wy6WQ6ZBc8F/6zTn7Vw5FWCM3Go351NHOsDzoUJDF8IA==
X-Received: by 2002:adf:e381:: with SMTP id e1mr22565776wrm.323.1619443063439;
        Mon, 26 Apr 2021 06:17:43 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:66bc:722b:970:1c6? ([2001:8b0:aba:5f3c:66bc:722b:970:1c6])
        by smtp.gmail.com with ESMTPSA id h5sm18665570wmq.23.2021.04.26.06.17.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Apr 2021 06:17:43 -0700 (PDT)
Message-ID: <9d7dae81ab99f8a157f178c19aa91dc770e818dd.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] ca-certificates: Fix openssl runtime cert dependencies
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Andrei Gherzan <andrei@gherzan.com>, openembedded
	 <openembedded-core@lists.openembedded.org>
Date: Mon, 26 Apr 2021 14:17:42 +0100
In-Reply-To: <c69e0205-fdcd-4fea-8751-83c198446ba2@www.fastmail.com>
References: <20210418225310.1624909-1-raj.khem@gmail.com>
	 <c69e0205-fdcd-4fea-8751-83c198446ba2@www.fastmail.com>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2021-04-23 at 20:56 +0100, Andrei Gherzan wrote:
> On Sun, 18 Apr 2021, at 23:53, Khem Raj wrote:
> > With commit dc778c70449ee5401b5a24ad18b22b88338c47c5, dependency was
> > moved to openssl-bin which in itself was a fine change, but dropping
> > dependency on openssl too should have been kept along, dropping this
> > meant that openssl binary wont be able to validate secure connections as
> > the CApath files wont be installed, which infact are required for
> > openssl bins to work, following call e.g. fails
> > 
> > $ openssl s_client -connect google.com:443
> > 
> > ....
> > New, TLSv1.3, Cipher is TLS_AES_256_GCM_SHA384
> > Server public key is 256 bit
> > Secure Renegotiation IS NOT supported
> > Compression: NONE
> > Expansion: NONE
> > No ALPN negotiated
> > Early data was not sent
> > Verify return code: 20 (unable to get local issuer certificate)
> > ....
> > 
> > The local issuer certs are not found in default location
> > /usr/lib/ssh-1.1/certs, this dir and its content is installed by openssl package
> > therefore re-add the dependency on openssl
> 
> Good idea for a ptest. Change looks good to me.

Might be worth a bug opening so we don't forget?

Cheers,

Richard

