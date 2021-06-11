Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web09.8363.1623417576343962085
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Jun 2021 06:19:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=hmnYLb1X;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f53.google.com with SMTP id o3so6044537wri.8
        for <openembedded-core@lists.openembedded.org>; Fri, 11 Jun 2021 06:19:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=puiQZWO62jGpDGD7O+E0RAU6idzhDe5dZE0X2vXb5QE=;
        b=hmnYLb1X+fTiPPPyjFR/Sar2z/kb7k7b4ASe947sgTokPwnobF0sDCv4zJUalqvFLG
         a3gEbRJIR69LSCEFxpyohWX/yRxo4ct1Ydlx982MOR2TJ4P/SyjTRrSdL6QB6vAGVi4K
         HVU/f6WvuKogatHg1JKa3iMwfzOlnvSDtVDzs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=puiQZWO62jGpDGD7O+E0RAU6idzhDe5dZE0X2vXb5QE=;
        b=GpgmxQXpoatl+iRd8aN12dy+kw+FZiAUmGWiB1XQvpa9WT05EdwlSqzi39qznPq9m7
         C9QgaEdokbwuePtY5hWq0+94DJGLUnR6Juo8UiCY3iQAm2nnD2YeIp7bo/JeEm23WJkP
         leMVNvPfQQjYAQrL28JdjaLNpnwDHYa3QDXwHizWzV4+yLBx0rV8f+F/6IZ1vwgAySNr
         1UpoXtSy3Mp+hbBmDrbBU7ym6FGS3Y5shi4si2crOE3fEbHMSG3+21S2NwuIxCby48D3
         bPDCO4FzhqlfWR0oyne/dsCEjUCkA0mblF6HCjwU98zz4ByqEa7SDKSvkpZrJHCjP+Yv
         +NNw==
X-Gm-Message-State: AOAM532AtpXhHXXDa7SYxHeRV+OlPppB/W8lmBWt38Xqo05inOub/1Vs
	edYwpW58GIewr66yeGcbcdGVQw==
X-Google-Smtp-Source: ABdhPJwWa89Xalcl0zI/89mG/d85SOmrr59UPFSeo+89eD58ejh/nrt1CgoogqoF8pbycluMlLjecA==
X-Received: by 2002:a5d:4531:: with SMTP id j17mr3928484wra.303.1623417574477;
        Fri, 11 Jun 2021 06:19:34 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:d8f2:39cb:864f:fe5b? ([2001:8b0:aba:5f3c:d8f2:39cb:864f:fe5b])
        by smtp.gmail.com with ESMTPSA id p12sm11620194wme.43.2021.06.11.06.19.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Jun 2021 06:19:34 -0700 (PDT)
Message-ID: <4ad336c92233e088ddf898daf2afb4955ca43256.camel@linuxfoundation.org>
Subject: Re: [swat] ltp failures on autobuilder
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: swat@lists.yoctoproject.org, openembedded-core
	 <openembedded-core@lists.openembedded.org>, Bruce Ashfield
	 <bruce.ashfield@gmail.com>, Randy MacLeod <randy.macleod@windriver.com>, 
	Paul Gortmaker <paul.gortmaker@windriver.com>
Date: Fri, 11 Jun 2021 14:19:31 +0100
In-Reply-To: <168784123C10B53A.9125@lists.yoctoproject.org>
References: <1687473EDD63E45B.21776@lists.yoctoproject.org>
	 <168784123C10B53A.9125@lists.yoctoproject.org>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2021-06-11 at 12:36 +0100, Richard Purdie via lists.yoctoproject.org wrote:
> as a .cfg to the kernel and that still reproduced the crash. However:
> 
> CONFIG_DEBUG_KERNEL=y
> CONFIG_CGROUP_DEBUG=y
> CONFIG_SCHED_DEBUG=y
> CONFIG_DEBUG_PREEMPT=y
> # CONFIG_RCU_TRACE is not set
> # CONFIG_X86_DEBUG_FPU is not set
> # CONFIG_CONSOLE_POLL is not set
> # CONFIG_DEBUG_INFO is not set
> # CONFIG_KGDB is not set
> # CONFIG_KGDB_HONOUR_BLOCKLIST is not set
> # CONFIG_KGDB_SERIAL_CONSOLE is not set
> # CONFIG_KGDB_LOW_LEVEL_TRAP is not set
> # CONFIG_KGDB_KDB is not set
> # CONFIG_KDB_KEYBOARD is not set
> # CONFIG_DEBUG_MISC is not set
> 

Isolated down to CONFIG_SCHED_DEBUG=y being the line which somehow "fixes" 
the crash. I can enable all the above apart from that and we can reproduce
it.

Also, I changed gatesgarth to use qemu 5.2.0 copied in from hardknott and that
breaks it. Dropping the 27 CVE patches "fixes" it again. It is possible it
is one of the CVE fixes. Continuing to try and isolate.

Cheers,

Richard

