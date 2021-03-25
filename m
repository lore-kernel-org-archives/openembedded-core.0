Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web11.4702.1616711014375150722
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Mar 2021 15:23:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=fkTxER2T;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f48.google.com with SMTP id d191so2008090wmd.2
        for <openembedded-core@lists.openembedded.org>; Thu, 25 Mar 2021 15:23:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=at83X2A57Shd/nO/taizhKVx5h/c9z3i7BiOQPFZKVw=;
        b=fkTxER2THMwbh7SBGaUkfBY9lx6zbu0xz+wGGzvDIqJKJBAsgPosvxNgZsmqC8YT75
         RNiDXmCkhqv6Qh3CEcbULaJJ4o3xz7nN8uM0iZKHEAgkULCgdi8pLgBXmwUSst/kPCci
         RTBanV48oSdCoPESRSEoOlWmLZHU1qn43v6WE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=at83X2A57Shd/nO/taizhKVx5h/c9z3i7BiOQPFZKVw=;
        b=K7zV/pwWf56ITZ/ic443nxwi1VeQINj15QufloJXF4mpVSwJ43dZAoZ1RJgDKkUNUY
         FrRcTUyIkrQqZwu2ZBVcclAu5jSatNT+n4jWRG9alEjGmGTsPrgrMGcLk8QWMDxU4zB5
         oTQ8asSEeK48RnZXl5WG0Vst7WZLGdGWiLIKMwEX0t/npyfZ0LzJNqGee9Fa+mZHVGKX
         DAeWW3c1QQbzkaUS27quXVNErQwwBzrc+WCOFw5FChh9kbpem9zmAShyB5TsuFycUwEK
         m4A8qX1QguF7gCcWHHeaVj/aMUH8fy6y8pOFnQcJwYlFqJtxJIYhaE06TgOpQOq7vpN0
         zlaw==
X-Gm-Message-State: AOAM531OiEeU2RaYLtlxu4Q08SHYf21n2UgZQWZiatSZAj4wZssH76+a
	u9eS/CgJD4lA4pKPmENLetiSUg==
X-Google-Smtp-Source: ABdhPJwEVbqu2FeoAkSaPFnGgcVvZavxpUZL7vTycoAX20gGLSc9XDROOJ6afknqusxK6+shxiGbdQ==
X-Received: by 2002:a1c:e383:: with SMTP id a125mr10074426wmh.125.1616711012860;
        Thu, 25 Mar 2021 15:23:32 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:2f59:1239:417b:1a83? ([2001:8b0:aba:5f3c:2f59:1239:417b:1a83])
        by smtp.gmail.com with ESMTPSA id a14sm9415643wrn.5.2021.03.25.15.23.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Mar 2021 15:23:32 -0700 (PDT)
Message-ID: <e2a237d0cc34d56882de9d064287b81858a48a56.camel@linuxfoundation.org>
Subject: Re: Autobuilder data collection for intermittent bugs
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Sakib Sajal <sakib.sajal@windriver.com>
Cc: Randy MacLeod <randy.macleod@windriver.com>, Trevor Gamblin
	 <trevor.gamblin@windriver.com>, Steve Sakoman <steve@sakoman.com>, OE-core
	 <openembedded-core@lists.openembedded.org>
Date: Thu, 25 Mar 2021 22:23:29 +0000
In-Reply-To: <768fd8d6-09bb-3e87-fd37-267ac9352866@windriver.com>
References: <768fd8d6-09bb-3e87-fd37-267ac9352866@windriver.com>
User-Agent: Evolution 3.39.2-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Hi Sakib,

On Thu, 2021-03-25 at 18:11 -0400, Sakib Sajal wrote:
> I have been trying, with help from Randy, Trevor and Steve, to run some 
> experiments on an internal autobuilder instance to collect host data 
> during builds for signs of io latency.
> 
> Initially i modified yocto-autobuilder-helper/config.json and added the 
> following 3 lines to existing templates (and created a commit) that were 
> being used so that the builds would start collecting the data.
> 
> 
> +                "BB_HEARTBEAT_EVENT = '5'",
> +                "BB_LOG_HOST_STAT_ON_INTERVAL = '1'",
> +                "BB_LOG_HOST_STAT_CMDS = 'pwd; ls'"
> 
> I also created a template in yocto-autobuilder-helper/config.json
> 
> +        "data-collect" : {
> +            "BUILDINFO" : true,
> +            "BBTARGETS" : "core-image-minimal",
> +            "extravars" : [
> +                "BB_HEARTBEAT_EVENT = '5'",
> +                "BB_LOG_HOST_STAT_ON_INTERVAL = '1'",
> +                "BB_LOG_HOST_STAT_CMDS = 'pwd; ls'"
> +            ]
> +        },
> 
> and modified a builder to use the template:
> 
>          "beaglebone-alt" : {
> -            "MACHINE" : "beaglebone-yocto",
> -            "TEMPLATE" : "altcfg-hw"
> +            "MACHINE" : "qemux86-64",
> +            "TEMPLATE" : "data-collect"
>           },
> 
> Restarted both the controller and the worker, and started the 
> beaglebone-alt build. Once the build started, i checked the conf file in 
> the build directory but those lines were not appended to the local.conf 
> file and hence no log files.

You shouldn't need to restart the controller, the worker should pull and 
use the configuration from the helper branch specified.

I'd note that it writes the config to auto.conf, not local.conf.

It should also give output in the logs about what its doing. For example:

https://autobuilder.yoctoproject.org/typhoon/#/builders/106/builds/2144/steps/10/logs/stdio

is the "Write config" step of beaglebone-alt on the autobuilder where it
clearly says:

Writing /home/pokybuild/yocto-worker/beaglebone-alt/build/build/conf/auto.conf with contents:

What do your logs say?

> In summary, I have been trying to get the 3 lines from the "extravars" 
> above to appear in one of the local.conf files. However none of the 
> builds seems to have been altered.
> 
> I am wondering if the changes that I've made are even being picked up by 
> the controller. Am I missing something?
> 
> Is there an easier way to update the conf files?
> 
> Initially I'd like collect data on a single node and scale it to all the 
> nodes. Any ideas/suggestions are welcome!

What you're doing should work. Its hard to comment more without seeing to logs
but check you're looking at auto.conf.

Cheers,

Richard


