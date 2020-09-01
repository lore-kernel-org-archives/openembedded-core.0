Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com [209.85.221.68])
 by mx.groups.io with SMTP id smtpd.web11.10453.1598958523770153135
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Sep 2020 04:08:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=P5rntSk3;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.68, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f68.google.com with SMTP id m6so1062873wrn.0
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Sep 2020 04:08:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=TfWfy6LavuT3cxoXwC7iF+raeZtsDoFKclZLci18qgk=;
        b=P5rntSk35SKa/cRhhgI+Y0nFpl5EgWTGdOyEECTZjOBZlZEpHAj1XpPWDaTJ3s53Js
         txFmYR2YGHj3a1jeoQ4knD+KZP1yiKthyyNS7ohkYd7ugEqAUTeT/maDCLJpdpDpDrfC
         yhpQcmJaZY6arOk5t43a1n4GBluTLkMTTMnvs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=TfWfy6LavuT3cxoXwC7iF+raeZtsDoFKclZLci18qgk=;
        b=TEXRfvHpjyQILx83KMMatzX8YWf73bM2m9Cd6LFt+CaO6SLzbt2P0f99804Uq64ZM5
         hzKYnlGspi687rAIjmQyxp3QluNxnFXar1anoEDmdaEhxNBH7kMvSD9nBK1H4a+uhd5E
         zZPAs/60HoF5fg5jma/3ezl4aA+EatgqcXHLseNkfMzis64iUdORK6UKaZR5NAVNfzVv
         vRxVOiE31ODrEJL7DeixfLMutHnxPwc9lTh2N3LpamyIQ6osDXFpxMOnuxXdAWta1q58
         6jWb0hPBTP/y2otQJ9W0qZ9f+1lxI/5QIV4WyndcJySH0KiEAfl2FCj1/tyPAaSOnl/Z
         oUnw==
X-Gm-Message-State: AOAM533u1ve+4uYE2lkGGpRzsZsXtCfQsTEepsqeTYBHkp/RtVGYBP3a
	Xt/FIBpChsiebr8CIoNn97r/aA==
X-Google-Smtp-Source: ABdhPJyXM4ugh7dYCcIl3RtFush0GSnHt7asq/8ntaJQoCxIzbqy8beKaVGuyfSyOPjd/3znJ66PjQ==
X-Received: by 2002:a05:6000:36d:: with SMTP id f13mr1221820wrf.425.1598958522020;
        Tue, 01 Sep 2020 04:08:42 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from f.d.2.7.a.9.f.9.6.8.f.0.2.a.5.d.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (f.d.2.7.a.9.f.9.6.8.f.0.2.a.5.d.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:d5a2:f86:9f9a:72df])
        by smtp.gmail.com with ESMTPSA id g8sm1309238wmd.12.2020.09.01.04.08.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2020 04:08:41 -0700 (PDT)
Message-ID: <389322665bc193ed7bace452717e02dd80aa675d.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] libpcre: fix occasionally do_package_write_rpm error
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Changqing Li <changqing.li@windriver.com>, 
	openembedded-core@lists.openembedded.org
Cc: "MacLeod, Randy (Wind River)" <randy.macleod@windriver.com>
Date: Tue, 01 Sep 2020 12:08:40 +0100
In-Reply-To: <20200828061434.2943665-1-changqing.li@windriver.com>
References: <20200828061434.2943665-1-changqing.li@windriver.com>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2020-08-28 at 14:14 +0800, Changqing Li wrote:
> From: Changqing Li <changqing.li@windriver.com>
> 
> Error info:
> ERROR: libpcre-8.44-r0 do_package_write_rpm: Failure expanding
> variable
> SUMMARY_libpcrecpp, expression was ${SUMMARY} - C++ wrapper functions
> which triggered exception RecursionError: maximum recursion depth
> exceeded while calling a Python object
> 
> this error is hard to reproduce, only met one time. Seems expand
> SUMMARY with reference to SUMMARY cause a dead loop.
> 
> Signed-off-by: Changqing Li <changqing.li@windriver.com>

What is worrying me is why we can't reproduce this. It should fail or
not fail, why do we only sometimes see this?

I'd like to understand the cause as it sounds like a determinism
problem somewhere.

Is there a sequence we can reproduce it with?

Cheers,

Richard

