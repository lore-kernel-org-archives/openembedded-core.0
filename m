Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web11.3541.1616621583559757553
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Mar 2021 14:33:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=g5qk+T6a;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f43.google.com with SMTP id d191so67858wmd.2
        for <openembedded-core@lists.openembedded.org>; Wed, 24 Mar 2021 14:33:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=AlQRiaUpSN2SrWiEwtfr+K6zwVFF8vMwffZ4TOgUuDg=;
        b=g5qk+T6auo5XuqoHnrxUKUcFktD9tUXtIbo36g4bLAQHt6KVyMTvNjS7kfWqHyMLWX
         5q/Wuzw8buA3pw2itiZFqJbpRWSC9D7oYiJX9ZBFaiUOFz3KX7FjtQYmZnjgtV9sITjZ
         XPgp6d+GOvNAeHySiSRmZGxHArvgAhTQx/J18=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=AlQRiaUpSN2SrWiEwtfr+K6zwVFF8vMwffZ4TOgUuDg=;
        b=OapabhyrqKNpD8TkxAhjOnczkIRadu0vzBQVWkcpqfX8Hjbqh6VNgmbyruAFFuzmVZ
         MGgyUA1Bs+r8MdM9uZ8ndi4UnVme35cslWZ1r07neysI5ax/irc/BgYlPQSUYQ10nQd3
         +sdEXXYYnDmQzGmUcobHdyrUFtj40yGE0IhRRGNPLilfxxDQa2IN8RvDOls4n8we6gNy
         KAm+is1d3vL9hDQI0HNvsPwwuGyVLsKRNuvZY3mJKpJFngTOtQG9J4wt7uGfOqT4Vqaz
         VHDowFZgvHU0svbFiVp4cOZbOz37KnbhJRAwMWA2UVubcBLhJSOchecSo680GPYPNzxi
         6KMw==
X-Gm-Message-State: AOAM5324DoimBsNBi7CIsoLG/o2AkXsJSahnVRExo+3xWb8zCzn+RrU7
	K7XNLieY6RoKZ5ueRwMGzKVgIw==
X-Google-Smtp-Source: ABdhPJyxtlf8mwKmkXYLCKaFo3XABBJ1pvw16GqXzuCsFjqEzAZIui7U2WcbJze29zIUL3JsUfIdNg==
X-Received: by 2002:a1c:67d6:: with SMTP id b205mr4877045wmc.118.1616621581965;
        Wed, 24 Mar 2021 14:33:01 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:6a6e:24cd:b165:9075? ([2001:8b0:aba:5f3c:6a6e:24cd:b165:9075])
        by smtp.gmail.com with ESMTPSA id o7sm4874851wrs.16.2021.03.24.14.33.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Mar 2021 14:33:01 -0700 (PDT)
Message-ID: <9cd549c815b3700e4f1e63f570ba82d720925ab3.camel@linuxfoundation.org>
Subject: Re: [oe-core][PATCH 1/2] valgrind: update 3.16.1 -> 3.17.0
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Yi Fan Yu <yifan.yu@windriver.com>, 
	openembedded-core@lists.openembedded.org
Cc: oobitots <oobitots@cisco.com>
Date: Wed, 24 Mar 2021 21:33:00 +0000
In-Reply-To: <20210323205029.87251-1-yifan.yu@windriver.com>
References: <20210323205029.87251-1-yifan.yu@windriver.com>
User-Agent: Evolution 3.39.2-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2021-03-23 at 13:50 -0700, Yi Fan Yu wrote:
> Notable changes:
> * libdir is now libexecdir
> 
> Added patches:
> Add musl.supp: missing musl.supp in 3.17.0
> 
> Dropped backport patches:
> * nlcontrolc: found in c79180a3afcf65902e578646c3b716cc749db406
> * drd Fedora33: found in 15330adf7c2471fbaa6a0818db07078d81dbff97
> 
> Other dropped patches
> * helgrind intercept: found in d2d54dbcc74244adfc0c80b40862edf2b82f53b9
> * drd musl fix: found in d2d54dbcc74244adfc0c80b40862edf2b82f53b9
> 
> TESTING RESULTS:
> qemux86-64:
> FAIL: drd/tests/swapcontext
> 
>       3.17.0  3.16.1
> ===================
> TOTAL:  736    726
> PASSED: 694    688
> FAILED:   1      0
> SKIPPED: 41     38
> 
> Signed-off-by: Yi Fan Yu <yifan.yu@windriver.com>

This seems to break valgrind's reproducibility:

https://autobuilder.yoctoproject.org/typhoon/#/builders/115/builds/125
https://autobuilder.yoctoproject.org/typhoon/#/builders/116/builds/126
(some issue in the ptest package)

Cheers,

Richard


