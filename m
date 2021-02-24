Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web12.6293.1614169942007104498
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Feb 2021 04:32:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=cawCk9ZF;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f51.google.com with SMTP id n4so231419wmq.3
        for <openembedded-core@lists.openembedded.org>; Wed, 24 Feb 2021 04:32:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=iFuYiWk/ezA+TAgXGn1MOslwWPhO5y0BNI7fNTmb6So=;
        b=cawCk9ZF/eVbrf8zkmEyvDY6YlaKo3sAFfZDUbDd7KJxyIsq5263bPjsBIrcZEMQkP
         JMo0bqGu9i10JPRdsWjrtD9XEkA3KMZRnEV44W0okng8BEuOlFyT+SqBhu16MgfzQU66
         lHe9PiGjc1ZFAi2we7kQTMlzUGwMVUSj7PVPQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=iFuYiWk/ezA+TAgXGn1MOslwWPhO5y0BNI7fNTmb6So=;
        b=tMgtSBnLFJ6uXmzwh7P/04x6PVmffItWdHu+F4noeSVw0jd2rvqph9St4TWpOEt1Lj
         HMuqQLiCmRJh+e9kh1So2LVlZJrAz7WU0DPMjJ1jUksMclhGED6ayUThcer/VFNivarF
         Ca1SGcmABQqBYptKCwnZ//azfb/3dn+T3sWtDR2UwSWUMQJ58LcvFmit73bDHcuViCd7
         m1lt6L8YpkEVwi1eair1C0ZU/lfYPSZP/RlS09Y+6IQ9s3imBfsdWfMcBtjq5mNcXkeU
         lvCpoFYlbagnHu2HJu27CSeUaW2v6evrVYwP6RrZYrmKZCmAVQJn3ySX8T90mvQ008y7
         nfFA==
X-Gm-Message-State: AOAM532kMRWcGNdsEVN9lh/LYuO2D2pXlN4l1itrEL9vN7E2B/oa95a5
	WnDWN/aTC6xueRpvyWJ2V2PT6A==
X-Google-Smtp-Source: ABdhPJxRyP4GWpktAHUK5OgLJImz/gU2v1PETfR16Tb2z0sAwDo3nkfaHLRtvWOLc7THL99U4PQVgw==
X-Received: by 2002:a1c:4603:: with SMTP id t3mr3590001wma.135.1614169940198;
        Wed, 24 Feb 2021 04:32:20 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:4476:47d0:b128:f21a? ([2001:8b0:aba:5f3c:4476:47d0:b128:f21a])
        by smtp.gmail.com with ESMTPSA id p6sm2832318wmg.37.2021.02.24.04.32.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Feb 2021 04:32:19 -0800 (PST)
Message-ID: <1a309c4181d7de1b38497b4db6f4e1d664f18398.camel@linuxfoundation.org>
Subject: Re: [OE-core] Current native SDK glibc compat
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Anatol Belski <anbelski@linux.microsoft.com>, openembedded-core
	 <openembedded-core@lists.openembedded.org>
Cc: randy.macleod@windriver.com
Date: Wed, 24 Feb 2021 12:32:16 +0000
In-Reply-To: <4ec292a9-3723-34f2-51a5-01dd6652f651@linux.microsoft.com>
References: <4ec292a9-3723-34f2-51a5-01dd6652f651@linux.microsoft.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi,

On Wed, 2021-02-24 at 12:40 +0100, Anatol Belski wrote:
> the current master build seems to be broken with symbols unavailable 
> from the host glibc. The following is to see on the SDK built and 
> installed on the same host Ubuntu 18.04.5 having glibc 2.27:
> 
> $ . /tmp/poky-sdk-master-00/environment-setup-core2-64-poky-linux
> 
> $ ldd $(which $CC)
> /tmp/poky-sdk-master-00/sysroots/x86_64-pokysdk-linux/usr/bin/x86_64-poky-linux/x86_64-poky-linux-gcc: 
> /lib/x86_64-linux-gnu/libc.so.6: version `GLIBC_2.33' not found 

We change the loader path inside our SDK binaries so you can't trust the
output from ldd, it will find a different result to what you'd see
when you run the binary.

What issue are you seeing trying to run these?

Cheers,

Richard

