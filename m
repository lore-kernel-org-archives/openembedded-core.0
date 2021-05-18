Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web09.5882.1621328039612030745
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 May 2021 01:53:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Ac5F7hKk;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f54.google.com with SMTP id i17so9255071wrq.11
        for <openembedded-core@lists.openembedded.org>; Tue, 18 May 2021 01:53:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=I3UZM+PysQy+rHTcOxpKQl0zY8Lexn7Omcb1GMQmMEI=;
        b=Ac5F7hKkCaweIY0yjUfoXt8xwgoBA/5bPH0Qz2kNs9xsIvmWSPt34lGvyUDNXstXGM
         S/yIJAhVdyGhlCaJoFPAX1F058zGVg+mQYwqGmMXpobeul1YRrg9WkmXmW4bDo7N5aZ/
         jXg3zDcZJGT+6sgJOkUFvVNfP2LBMwrXw4g88=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=I3UZM+PysQy+rHTcOxpKQl0zY8Lexn7Omcb1GMQmMEI=;
        b=WGzhxSboHOpL5CMgL8MFYFtiaP4rY9mfaiJZoGd9X/eFZ9jSLI/VWed3yeyjZDsUiJ
         pPWh2CTu7Yc6vumpN3CVkY/qsCr3kETKE5Qlm78k55lSPS1ltUduWoDesoATxlWu5LJK
         w3Rz/qBmLNtM5ZliLsg2ebUx+jY8RcX2tEovuVXW07roVIBtlrYYMauXDEPDH4JJ087f
         7LHH4MoLFbO3gRoziYkzDVf4QqvFpcIgR+LLltiqqQGAe6ebAcftcVc2fnXWFL0T/DOf
         j/QQDOuFhHyExMDCv4mqDNy7KPLcLDjL63tFlMln70TWjXiZTpXvhKa/Xpi8aArJluCD
         Nv4A==
X-Gm-Message-State: AOAM532ttR2r9TjSFJofvUEDCn2DnN7slb+PbKLZNKzbZqvFGFqaYbIa
	zaH89YrMtYaAZnyuPMLJytRWbg==
X-Google-Smtp-Source: ABdhPJzSRjIMkYRY1colxTrS2ryiswm97+uWxdMXM7+Knd90lr7MSyoqDwN4yMd4fq9Pim2bJrVdeg==
X-Received: by 2002:a5d:6285:: with SMTP id k5mr5460729wru.50.1621328037904;
        Tue, 18 May 2021 01:53:57 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:c468:ba30:74bf:a356? ([2001:8b0:aba:5f3c:c468:ba30:74bf:a356])
        by smtp.gmail.com with ESMTPSA id g5sm7182181wmi.8.2021.05.18.01.53.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 May 2021 01:53:57 -0700 (PDT)
Message-ID: <a6d2e07f64e319e6750639a5d737ff0d5d4bfdaf.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH] sanity.bbclass: also check invalid char for SDKPATH
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Chen Qi <Qi.Chen@windriver.com>, openembedded-core@lists.openembedded.org
Date: Tue, 18 May 2021 09:53:56 +0100
In-Reply-To: <20210518070655.39921-1-Qi.Chen@windriver.com>
References: <20210518070655.39921-1-Qi.Chen@windriver.com>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2021-05-18 at 00:06 -0700, Chen Qi wrote:
> The invalid char check are now only for COREBASE and TMPDIR, however,
> the SDKPATH with special char could also cause problem.
> 
> e.g.
> bitbake nativesdk-xxhash
> And we get the following error message.
> Makefile:422: *** configured libdir (/opt/poky/3.3+snapshot/sysroots/x86_64-pokysdk-linux/usr/lib) 
> is outside of exec_prefix (/opt/poky/3.3+snapshot/sysroots/x86_64-pokysdk-linux/usr), can't generate pkg-config file.  Stop.
> 
> This is because we have '+' in SDKPATH.
> 
> FOR SDKPATH, the valid char requirement should be the same with TMPDIR.
> 
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  meta/classes/sanity.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Given that the + has been in many of our SDKs for years, should we not fix 
that individual recipe to handle this correctly, preferably upstream?

It doesn't sound like its a very common issue so may be worth fixing rather
than giving up upon...

Cheers,

Richard

