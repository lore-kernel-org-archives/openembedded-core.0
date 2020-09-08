Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com [209.85.221.65])
 by mx.groups.io with SMTP id smtpd.web12.18115.1599564309824888938
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Sep 2020 04:25:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=S6Tu0N+9;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.65, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f65.google.com with SMTP id j2so18703971wrx.7
        for <openembedded-core@lists.openembedded.org>; Tue, 08 Sep 2020 04:25:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=MLvPmUNagnj3bsXJNPwkOcJCNmsQx1FUH/25pCpFTMs=;
        b=S6Tu0N+9d/Pvj13Dc6bByhX/z56SG5RhZsheqFNhpwPMFb+2umi6Wuazsh6xT/OrF9
         jjGP6/eKcFVuNQHwwVWh+XCLmgIsErMP8Ohw0W7H/2SPhxqmQfZrSCiUDgjDg64WGYf9
         c22a28Q5/YY7QFmqmBpWc+hAyRaXJetgKYvac=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=MLvPmUNagnj3bsXJNPwkOcJCNmsQx1FUH/25pCpFTMs=;
        b=ixubiDGOyrYBR/MS26vbFxwJ+hC6taVSjq6Eax5zBT8NifqehJvj4AnQrcYSqa/f8F
         gJ7a5tzyCNo7gpDf8xUrf66HGrIt0mp+tYCoOFI+vOAVgc4AnmPiUoBGWJcrVlU2v+th
         Y6Vqho/VrpWp2lM/1XVJzb6ybUOnDBa3HzCtJPAyB1maMKSIYLLx7gqWb2a067Qp4dO9
         iAfobn2mf9ItYGc3w3Wj4ebvBWAqxBnZc18qsSaB6JRh+u6U1PziO2ybs1snBsZ7RbeA
         1ogFBJ88Lu332q3jCp6W3wj6yqRyGDyrhZKwNBdrKxyWj2A/DRBqzZFIvo6syC/nKfsJ
         vHLw==
X-Gm-Message-State: AOAM5332RIAgzisVjKkznZHTrWDYhEvUVTTU/UqFoCtmPzs2U6GrwDKK
	yx2dXx2hmc2zOifAAW+78GKGww==
X-Google-Smtp-Source: ABdhPJxHbUgulQkKhQx3wWgGGxK1/26el3MqLp7WiAn4efg74k+ZdRmkmL1CAKWU45zzuWHY+2h/dg==
X-Received: by 2002:adf:c981:: with SMTP id f1mr26241780wrh.14.1599564308191;
        Tue, 08 Sep 2020 04:25:08 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from e.4.4.b.0.8.f.4.f.c.f.0.9.0.5.8.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (e.4.4.b.0.8.f.4.f.c.f.0.9.0.5.8.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:8509:fcf:4f80:b44e])
        by smtp.gmail.com with ESMTPSA id f19sm31892362wmh.44.2020.09.08.04.25.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2020 04:25:07 -0700 (PDT)
Message-ID: <bd66a483ac0504535603012078f6c845175a3780.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] package management: Allow dynamic loading of PM
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Fredrik Gustafsson <fredrik.gustafsson@axis.com>, fredrigu@axis.com
Cc: openembedded-core@lists.openembedded.org, 
	tools-cfpbuild-internal@axis.com
Date: Tue, 08 Sep 2020 12:25:06 +0100
In-Reply-To: <20200908105307.5033-1-fredrigu@axis.com>
References: <20200908105307.5033-1-fredrigu@axis.com>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2020-09-08 at 12:53 +0200, Fredrik Gustafsson wrote:
> Dynamic loading of package managers will allow other layers to simply
> add their package manager code in package_manager/ and have bitbake
> find
> it according to the package manager configuration. This is useful for
> adding new (faster) package managers to Open Embedded while not
> increasing the
> test scope or require Open Embedded to support more package managers.
> 
> How this is tested:
> * Build core-image-minimal with all three package managers
> * Build the sdk with all three package managers. dpkg fails, but
>   it fails on master as well.
> * Run the complete test suite, all tests passed except 16
> * Run those 16 tests on master and verify that they fail there as
> well
> * Fix errors making tests works on master but not with this patch.

Did you test both the sdk and esdk? Which tests are failing? Are these
oe-selftests? They all should pass and do on the autobuilder?

We're over a week past feature freeze and this series has a troubled
history of testing so realistically this needs to be 3.3 material at
this point (just to ensure we have the same expectations).

Cheers,

Richard

