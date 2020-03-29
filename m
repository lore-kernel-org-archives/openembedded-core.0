Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com [209.85.221.67])
 by mx.groups.io with SMTP id smtpd.web12.36436.1585514287468262675
 for <openembedded-core@lists.openembedded.org>;
 Sun, 29 Mar 2020 13:38:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=fL37a8tQ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.67, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f67.google.com with SMTP id 31so18653553wrs.3
        for <openembedded-core@lists.openembedded.org>; Sun, 29 Mar 2020 13:38:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=sGOtSIfdARalC2dm/e+URosM3gGOlvXSGD/UCM0S8SU=;
        b=fL37a8tQYIC6QDA0PLWcS4xzK6aIrLeGAYrxrOi8RIS7whAhzimRFY1e3bnKgdoowP
         B8kgNFm6B45ju3RSDtoorD+SKNUFzXL6cfXLJG5t1+l2fvfXw1FPqxgoBTrBP/6MSg35
         UIwm9hN3B3WOUO0YAJ4mXZsecu3fb4q6r5Rws=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=sGOtSIfdARalC2dm/e+URosM3gGOlvXSGD/UCM0S8SU=;
        b=pQO1gTfQAA3ke+rMuU+zpBycxaEYEkjlR+dRlBSN1r7qHFAg2Zr5uFBAvRPFDfQ2mG
         obQf5cDvoLNQjotRgghyXX7LzLVNHMObxc3vzI84i/bNyD65D70ukaro0kvbtAMSulEJ
         2E3zUKSFg+ev/BYsD76RU4WeZf7k74d5lZBLCr9ZRZtGwI3sZ6i331xUphdwKcy7Tizb
         f8nDHIq9kY+u6gRWaS08jqaGnOfVaw8BFFXnbjHoeJbtmSa+1g8mze84d4KjBwMXjP5u
         LV01OFj8FiCgxj9Od3vZNPUx+9KDPeNI/UB+P9Fcb9CFxLouWrYwaLxET0j3/lMh6As4
         5YwA==
X-Gm-Message-State: ANhLgQ2uaLTIYmfi7YRIf04Fyro+O1wV3ENvQcJbsp+7mT4vJx5raWU7
	JAaOI1pSX4/JtwgSCYJyO2cZUg==
X-Google-Smtp-Source: ADFU+vsLEEcX8g4eRkEsA3bxSaTH++lOHjJxffoQX9G2moSVc37qtZOzs9Ye1CV+H5S0MP61xwU8Og==
X-Received: by 2002:adf:dd8f:: with SMTP id x15mr12022044wrl.201.1585514285905;
        Sun, 29 Mar 2020 13:38:05 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id v129sm15419226wmg.1.2020.03.29.13.38.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2020 13:38:04 -0700 (PDT)
Message-ID: <e1863defc13c09b072ffbca84ff5c23274d0057a.camel@linuxfoundation.org>
Subject: Re: [PATCH] lttng-modules: update to 2.10.14
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Marek Vasut <marex@denx.de>, openembedded-core@lists.openembedded.org
Cc: Armin Kuster <akuster808@gmail.com>, Daniel Dragomir
	 <Daniel.Dragomir@windriver.com>
Date: Sun, 29 Mar 2020 21:37:58 +0100
In-Reply-To: <20200329172752.285451-1-marex@denx.de>
References: <20200329172752.285451-1-marex@denx.de>
User-Agent: Evolution 3.36.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2020-03-29 at 19:27 +0200, Marek Vasut wrote:
> Upgrade to version 2.10.14 in order to fix some build errors
> with latest 5.4 kernel.
> 
> - conflicting types for 'trace_rcu_dyntick'
>   Reproductible on kernel greater than v5.4.22, starting with commit
>   6cf539a87a ("rcu: Fix data-race due to atomic_t copy-by-value")
> 
> Also drop patches which are no longer required.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Armin Kuster <akuster808@gmail.com>
> Cc: Daniel Dragomir <Daniel.Dragomir@windriver.com>
> Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
> NOTE: Roughly matches OE-Core rev: 8fcc33aea08fc1e82818893feb7b01c7cc1e6416
> ---
>  ...ops-when-trace-sunrpc_task-events-in.patch |  94 -------------
>  ...rpc_clnt-dereference-in-rpc_task_que.patch |  44 ------
>  ...rpc-use-signed-integer-for-client-id.patch | 105 --------------
>  ...nrpc-introduce-lttng_get_clid-helper.patch | 130 ------------------
>  ...es_2.10.11.bb => lttng-modules_2.10.14.bb} |  12 +-
>  5 files changed, 4 insertions(+), 381 deletions(-)
>  delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0001-Fix-SUNRPC-Fix-oops-when-trace-sunrpc_task-events-in.patch
>  delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0002-Fix-sunrpc-null-rpc_clnt-dereference-in-rpc_task_que.patch
>  delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0003-Fix-sunrpc-use-signed-integer-for-client-id.patch
>  delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0004-sunrpc-introduce-lttng_get_clid-helper.patch
>  rename meta/recipes-kernel/lttng/{lttng-modules_2.10.11.bb => lttng-modules_2.10.14.bb} (75%)

This patch doesn't apply to master as lttng-modules is 2.11.2 there?

Cheers,

Richard

