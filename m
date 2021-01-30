Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web08.1653.1611997092122729713
 for <openembedded-core@lists.openembedded.org>;
 Sat, 30 Jan 2021 00:58:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=BXIxsTIE;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f49.google.com with SMTP id c127so8907669wmf.5
        for <openembedded-core@lists.openembedded.org>; Sat, 30 Jan 2021 00:58:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=WMli2cNcbrDt4a2EAKCrKx315ynJeh/0nXPAmPt4cA0=;
        b=BXIxsTIELFi8WRxaoMUfoUPuwZvrAwPkmxqXMkA3i0VvHMcowHSrfpooDBTkBeay+C
         kWN4JDCejFjAUjHBoMc5BnrvsJgKLRDEmCBWhj3yEqTLPrJJrcWFcFtivPY4MlgZeSXj
         jmdgVZBo+N6YlDtzCkSIBlNNNF+U0BUrpYkmw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=WMli2cNcbrDt4a2EAKCrKx315ynJeh/0nXPAmPt4cA0=;
        b=gKSPPec9smhzRZBB7mnPeA1qY4dnbTaKEI/rEOgQWRgSUJYMTcK4h8Ii8fDe/H5n96
         gg7g0qVL3mnljpF1Y6Xc/wmT+m9xNQ1LVRiUlABPLgi4UnOv4LRHCt0vIMrjlHcBTI6A
         /NDUrj07EFM0mp84UQWjV1TtzEuVoypVOlrK77u6DwxnXkv+6agkxpWA5S+8p37m5gvi
         O9hdrFxdbA7sv+A5PTnVupmPqwS8PepsQoFkO/4BheAfvhq7We9jnSQIrP0doYeOuWm8
         QVZ5OYHF5CLIM4X8fKAhFLMI1+ze9n0NcNwLFONGN/igvDfS0/p0/lUDzwG9K471Oryp
         rPqg==
X-Gm-Message-State: AOAM531bVjCT1pWNhtDP6G+hgtt0x7CT1aUpXas1aD+n/HJwLkjQy6mL
	VQKM48PJvwob7Vhu4SXOxxZX6A==
X-Google-Smtp-Source: ABdhPJxA1jBzhMFU0qetwzykHie6aQSRo0OgPAp/bCEotfKOWGRTJ6g4q3/fbhUmF8OiCUHaeN9iFA==
X-Received: by 2002:a1c:149:: with SMTP id 70mr7079433wmb.165.1611997090564;
        Sat, 30 Jan 2021 00:58:10 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:1e22:34f6:7a80:adbb? ([2001:8b0:aba:5f3c:1e22:34f6:7a80:adbb])
        by smtp.gmail.com with ESMTPSA id g9sm21127494wmh.3.2021.01.30.00.58.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Jan 2021 00:58:10 -0800 (PST)
Message-ID: <70cd3945856eb783c7239fd716eeea39b127e773.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2] bitbake: Don't treat mc recipe (Midnight Commander) as a multiconfig target
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Tomasz Dziendzielski <tomasz.dziendzielski@gmail.com>, 
	openembedded-core@lists.openembedded.org
Cc: Jon Mason <Jon.Mason@arm.com>
Date: Sat, 30 Jan 2021 08:58:07 +0000
In-Reply-To: <20210128172313.7681-1-tomasz.dziendzielski@gmail.com>
References: <20210128172313.7681-1-tomasz.dziendzielski@gmail.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2021-01-28 at 18:23 +0100, Tomasz Dziendzielski wrote:
> When we run `devtool build mc` recipe's task dependencies are expanded
> to "mc:do_populate_sysroot" where "mc" name is treated as multiconfig
> and "do_package_sysroot" as multiconfigname.
> 
> > ERROR: Multiconfig dependency mc:do_populate_sysroot depends on
> > nonexistent multiconfig configuration named do_populate_sysroot
> 
> Signed-off-by: Tomasz Dziendzielski <tomasz.dziendzielski@gmail.com>
> 
> --- skipped change in showEnvironment() to keep "bitbake -e" working
> ---

bitbake patches need to go to the bitbake-devel list. 

I did put this into testing anyway and it triggered errors in several
selftests:

bitbake-selftest:
https://autobuilder.yoctoproject.org/typhoon/#/builders/87/builds/1792/steps/11/logs/stdio

and oe-selftest:
https://autobuilder.yoctoproject.org/typhoon/#/builders/87/builds/1792/steps/14/logs/stdio

(these occurred in all the selftest builds but I've just linked to one).

Cheers,

Richard



