Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web10.618.1616175689769219283
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Mar 2021 10:41:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=BrONcvac;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f53.google.com with SMTP id z6-20020a1c4c060000b029010f13694ba2so5659779wmf.5
        for <openembedded-core@lists.openembedded.org>; Fri, 19 Mar 2021 10:41:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=e5jWKsEk3hwdtQk/ZAFlaF6AnEhkU5CDN+82pOc7Lxo=;
        b=BrONcvacp6qsQCGj571+FZI7w0KRJK9TijHMarFurM5vLpQhbBvDbEcNAolSzD2yN7
         3sgc1ywQYQiVS2NwDEOPOI2rV9ILOEKKhxpp3JhNg1m1s5lxFhOI7URSbMu27W/qcdo0
         CUtAjunF9bf+SJJTRJX9QLTZptkWFqcvdCUv8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=e5jWKsEk3hwdtQk/ZAFlaF6AnEhkU5CDN+82pOc7Lxo=;
        b=bPRQG4n4hvpNfsstXLAiNLqqSdjD43J52Q9PqAF2NlkBKhANIuS5XYhTqm/iYxA12+
         zY6f+33ksaWSc8vjZkRGPI7KUya6HcsEMyba8j6vm1JjsqSLnybXgIyR1MJQHSbB+3lz
         zgBFs3QZ1ZSb3ktfnNk3rEHZ/QRyffotuy5QVx+eZty7OzcDQYnE3jgI7BmTTEcPO5aC
         d+ADTmiaEs0zVge9g3bplidjlh0ooKkVEaHt9IpldrcEfK+VjTzQmOLbosXBZYNG8dtM
         ZwB3KsFm43bxVfB0JEGNOd9Ujmx1OkUwYArk1GD7d7UVOW/cWvJJorQDWcjlmvmcgeLe
         J/ow==
X-Gm-Message-State: AOAM531hphl4XGHuKCayFZ8+JO/PR4OnUFFBaaDDgXN0R7/PNAN+7fwk
	eu+qgnQ429b54dl0yWv/hh3kNA==
X-Google-Smtp-Source: ABdhPJz8X4AyCvZ8iGVVBwZ2tBnAVZ6FJm9oQzLID9VAlK7d4mdXnFzpESh17qSIa86+wvBkj1CVyg==
X-Received: by 2002:a7b:c2fa:: with SMTP id e26mr4668689wmk.102.1616175688341;
        Fri, 19 Mar 2021 10:41:28 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:5808:8e52:d330:3893? ([2001:8b0:aba:5f3c:5808:8e52:d330:3893])
        by smtp.gmail.com with ESMTPSA id t14sm8927912wru.64.2021.03.19.10.41.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Mar 2021 10:41:28 -0700 (PDT)
Message-ID: <15e0d00c99c8eaa9746968b760dc86aebe0b32d4.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] sstate: Remove stale objects before the main build
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
Date: Fri, 19 Mar 2021 17:41:27 +0000
In-Reply-To: <5fa9324e-adbc-516e-009a-72485b81a60a@gmail.com>
References: <20210319172658.228940-1-richard.purdie@linuxfoundation.org>
	 <5fa9324e-adbc-516e-009a-72485b81a60a@gmail.com>
User-Agent: Evolution 3.39.2-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Fri, 2021-03-19 at 10:39 -0700, Khem Raj wrote:
> 
> On 3/19/21 10:26 AM, Richard Purdie wrote:
> > The split of util-linux-uuid out from util-linux caused some interesting
> > sstate file overlap errors on existing build directories. This is a
> > challenge to handle since util-linux depends on util-linux-uuid and has
> > overlapping files in package data and deploy/packages directories.
> > The util-linux build happens later and is what would clean up those files
> > but it happens too late for uuid.
> > 
> > Fixing this is hard as we don't know the taskhashes until the task
> > graph is calculated. Once that is ready, we can compare the hashes
> > with the existing hashes and know which sstate tasks are "stale".
> > 
> > This patch adds a handler which iterates the sstate manifests looking
> > for matching stamp paths and then removes the manifests along with the
> > associated stamp files.
> > 
> 
> whats the performance impact

I thought it was going to be a pain but seems amazingly fast in my local 
tests. I've put this in master-next and feedback on how people find it 
would be very welcome.

Cheers,

Richard

