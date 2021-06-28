Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web08.178.1624920676481568228
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Jun 2021 15:51:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=dRhCNFVV;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f53.google.com with SMTP id o35-20020a05600c5123b02901e6a7a3266cso1064857wms.1
        for <openembedded-core@lists.openembedded.org>; Mon, 28 Jun 2021 15:51:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=Ian3YtKtiaxWQz4LikAdKFA5PuD+nAvYLkr42pNMbv0=;
        b=dRhCNFVVXx6mWcVssiT7BKwllhHllkWiSPDsqWCc+98UOMtygAqnMhtomsWR2xTDZW
         aR+cB46sZccxaH0fB/4BwG05HW1U3YUIAzS2ulNeMV+TuWQbyv8zsYN6slcXWeLA1ODA
         xjVaOykYu54XlqyCAlIbwoFPz2jRfQ5/vxVxM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=Ian3YtKtiaxWQz4LikAdKFA5PuD+nAvYLkr42pNMbv0=;
        b=Y/JOpSfsWMt6VTIG8o8kd+2Ra+eVhzTDPgRCdrPlnwtdyyNcnyxbpU2x1zl0e/jnx8
         j67OMS8GDdJNOTyaCQyIXYQEcKIlIDGy6nr+8ERm2AkY4M00/+UFF4hHep/fRYXVYwc8
         mVLNo/TqLc23YOpzb0kd7JuzB43P8Oxm4hBcbzzwT9dFNDa8K0E0SsNMnCezfvk4ToWI
         Qxbjbfnq/WwdWUtQ6aY3l8hjF6lzXBeHnMRwdmEsmhCL2J5IZY1G5C3B3fGebD7tTP+b
         0+Uc0itD/vk77CSUJehp1rSsrzC+RldpgzHyPfafi5ZBuVE0vCWdQzlnz7Symx0tLEeg
         64zQ==
X-Gm-Message-State: AOAM5309Ln/1KrBdpvGRrE1ZxrLejXs/z9gb3xQptzWtVibsAPagV2RC
	PyNZ82iuBcmZgQb1BPdJwMSUuA==
X-Google-Smtp-Source: ABdhPJyWTX2KT6mpygp5WwOGcRVdXmwA3xwjJBHN+eJoE2GbwkjFMkNLsG2AHMrb9IpiutZs/dkYIQ==
X-Received: by 2002:a1c:7d8d:: with SMTP id y135mr8482252wmc.61.1624920674831;
        Mon, 28 Jun 2021 15:51:14 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:e4cd:1977:5709:51f0? ([2001:8b0:aba:5f3c:e4cd:1977:5709:51f0])
        by smtp.gmail.com with ESMTPSA id h46sm17821094wrh.44.2021.06.28.15.51.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Jun 2021 15:51:14 -0700 (PDT)
Message-ID: <9e0cd3d79c36f2b061cf2d751c8b544efffc23b2.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] util-linux: use the system binaries when running ptest
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Ross Burton <ross@burtonini.com>, 
	openembedded-core@lists.openembedded.org
Date: Mon, 28 Jun 2021 23:51:13 +0100
In-Reply-To: <20210628130119.926307-1-ross.burton@arm.com>
References: <20210628130119.926307-1-ross.burton@arm.com>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2021-06-28 at 14:01 +0100, Ross Burton wrote:
> Unless told otherwise, the util-linux test suite assumes that it is
> running in a build tree and looks for binaries to run.
> 
> In ptest we're on the target, so it needs to run the system binaries
> instead.
> 
> This reduces ~180 skipped test cases down to tens, and should fix weird
> behaviour. There are some new failures that were previously skipped
> which will be investigated shortly.
> 
> Also pass --parsable to reduce the amount of noise in the log ouput.
> 
> [ YOCTO #14244 ]
> 
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  meta/recipes-core/util-linux/util-linux/run-ptest | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-core/util-linux/util-linux/run-ptest b/meta/recipes-core/util-linux/util-linux/run-ptest
> index e135ee583bd..86f9fef24bd 100644
> --- a/meta/recipes-core/util-linux/util-linux/run-ptest
> +++ b/meta/recipes-core/util-linux/util-linux/run-ptest
> @@ -29,7 +29,7 @@ res=0
>  count=0
>  for ts in $comps; 
>  do 
> -   $ts | sed -u '{        
> +   $ts --use-system-commands --parsable | sed -u '{
>        s/^\(.*\):\(.*\) \.\.\. OK$/PASS: \1:\2/                              
>        s/^\(.*\):\(.*\) \.\.\. FAILED \(.*\)$/FAIL: \1:\2 \3/                
>        s/^\(.*\):\(.*\) \.\.\. SKIPPED \(.*\)$/SKIP: \1:\2 \3/               

This is a good fix, thanks. Makes me worry about regression identification.
FWIW testing showed this on x86 (arm still going):

https://autobuilder.yoctoproject.org/typhoon/#/builders/81/builds/2227

Looks like a build from Alex did have results for arm:
https://autobuilder.yoctoproject.org/typhoon/#/builders/82/builds/1942/steps/12/logs/stdio

Cheers,

Richard




