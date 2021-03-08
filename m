Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web12.1718.1615231763356719367
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Mar 2021 11:29:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=YLhUIzfp;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f52.google.com with SMTP id y124-20020a1c32820000b029010c93864955so4505224wmy.5
        for <openembedded-core@lists.openembedded.org>; Mon, 08 Mar 2021 11:29:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=RcVx6cTR1CQqAk9RATHlG5wd0tkbNJImwWHknTiBrUw=;
        b=YLhUIzfpw+4cGRB33if6olc0dOusQRrRTpHOlQxNPU9CpaopmQEMU8YkHePaSonwhU
         OxYkO6XI9aWJHNCE54CpBVpPvGsJogvUHG4oMhWtZXDV/lNbMH6aWV+Esh7W2tFnP7M0
         vlj3H0Oo3WvhCp1WKhODo+QNabA41XTbNMoFQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=RcVx6cTR1CQqAk9RATHlG5wd0tkbNJImwWHknTiBrUw=;
        b=SHEFfo94uYACPEylCpzTt+N8ZxoeLHp0tAIUqimxqnULRHyy2a9kdUJC7gjVY9DsTL
         4MuyuGmraCPjhXZgBUsg/T8gDAhqId6Si3jVxPOpnvN2exceco68kKXM+nP9g+6UaG+e
         iVLAzmszhM6qq4Jfe+6ETlZatI5KJ/fDwPIRu9QyybTJQ9eMeEmcBiJ+xRBYK3ol+I7N
         F9gIRPyfrcGtLlk9fG1ShPb7eCxoQEDyOCo12h4PN4P69DDG3OMV+dUFEJUANCTOn6Es
         Eazm0VZSMu+IlRuJ5HtvcNVrnnwy7Vp2IE1OWou9+fq8mk+Jbz4Oq9gIIYCX3YoAl13Z
         WhGg==
X-Gm-Message-State: AOAM533YJei+7v+mWPIsDIFBdPAN1p9XVCrw5oPOrzfXiOrOSldja/CQ
	n09Wq9zBbve8A1LMHugFWTHkOg==
X-Google-Smtp-Source: ABdhPJxD4s7OCvlm8uJ5YTxoofB1FeQ5NF7E5mG+84iUoiQZfvTPvgl7h/MbPIxGYQ/Thr5e1rlVkg==
X-Received: by 2002:a7b:c5cc:: with SMTP id n12mr303263wmk.123.1615231761790;
        Mon, 08 Mar 2021 11:29:21 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:eedb:fc13:9637:3816? ([2001:8b0:aba:5f3c:eedb:fc13:9637:3816])
        by smtp.gmail.com with ESMTPSA id 4sm533275wma.0.2021.03.08.11.29.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Mar 2021 11:29:21 -0800 (PST)
Message-ID: <58bcb66c9e15d4121defef93cb6b34266fd89037.camel@linuxfoundation.org>
Subject: Re: [PATCH v7] util-linux: split uuid in separate recipe to allow bootstrapping
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: luca.boccassi@gmail.com, openembedded-core@lists.openembedded.org
Cc: bluelightning@bluelightning.org, Kory Maincent
 <kory.maincent@bootlin.com>,  Alexandre Belloni
 <alexandre.belloni@bootlin.com>
Date: Mon, 08 Mar 2021 19:29:20 +0000
In-Reply-To: <20210305110218.24635-1-luca.boccassi@gmail.com>
References: <20201210184632.3448265-1-luca.boccassi@gmail.com>
	 <20210305110218.24635-1-luca.boccassi@gmail.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Fri, 2021-03-05 at 11:02 +0000, luca.boccassi@gmail.com wrote:
> From: Luca Boccassi <luca.boccassi@microsoft.com>
> 
> Recently util-linux gained an (optional) build dependency on libcryptsetup.
> But libcryptsetup build-depends on util-linux for blkid (optional, can be disabled)
> and uuid (mandatory).
> Split out util-linux-uuid in a different recipe to break the cycle.
> 
> https://github.com/karelzak/util-linux/pull/898
> 
> Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
> ---
> v1: util-linux 2.35 is not out yet, but I'd like to get the preparatory work
>     underway as I'm not sure if this is the best approach or if there are
>     alternatives. Suggestions and comments very welcome. Thanks!
> v2: changed packages names to reflect old ones (eg: libuuid1 -> util-linux-libuuid)
>     and leave uuid build enable in main recipe to allow for uuidgen build to happen,
>     as it does not have its own autoconf switch. Delete the library manualy from
>     the main recipe after build instead, and add dependency.
>     Might help to break loop python3 -> util-linux -> libselinux -> python3, as it's
>     only libuuid that is needed, see https://lists.yoctoproject.org/g/yocto/message/47570
> v3: rebased and refactored to have a common util-linux.inc file
> v4: added RDEPENDS on util-linux-libuuid on various packages to fix QA warnings
> v5: remove RDEPENDS and instead have util-linux RDEPEND on util-linux-uuid.
>     Removed PACKAGES_remove and instead filter out libuuid via the package generation
>     regex.
>     Rebased on util-linux 2.36.2.
> v6: install libuuid.a in libuuid-dev
>     change rdepends on uuid to use binary package rather than source
>     add rdepends on uuid-dev to libuuid-dev
>     remove rprovides of libuuid-dev from uuid-dev
> v7: do not use '_append' for RDEPENDS, as it is not supported by BBCLASSEXTEND, use
>     simply '+='

This is looking closer but not there yet I'm afraid. Testing showed:

https://autobuilder.yoctoproject.org/typhoon/#/builders/57/builds/3152
https://autobuilder.yoctoproject.org/typhoon/#/builders/47/builds/3188

so far.

Cheers,

Richard

