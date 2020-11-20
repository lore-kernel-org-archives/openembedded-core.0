Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
 by mx.groups.io with SMTP id smtpd.web10.585.1605893074784987563
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Nov 2020 09:24:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=QS8RgVWI;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.66, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f66.google.com with SMTP id s13so10481357wmh.4
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Nov 2020 09:24:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=l6yQoxeYNYQH7SRkybN/ZAZcDqEURa8HHn6b47r7AVs=;
        b=QS8RgVWIZKpMhBLBnbftVIV4WqFDvVThDWD5IOEL31wlo1nKVdibhJqy7ODijceAUW
         U7N7J0Kyw0lJyoQtvlBxdWjLXz2Qcm60TlkV4RM3XnKFdE7VXWAStjNT8czYgi7zFbTF
         OWGi8QadR13RAKDSHkTuo2+crGDSi8kuyM/FM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=l6yQoxeYNYQH7SRkybN/ZAZcDqEURa8HHn6b47r7AVs=;
        b=bz4Q3yGrtpVeaKFhbmaxN9KwdvilCXWzUbp9Rmpnv2DVW8FDMCFungb7TeaVceSMJC
         iI06eeqnMkpkxveYRIZipJQ3kGcU5YMQmbNl2wMqoqIsvpR99+s5/xN6Xld35WmKdTKO
         0/AbFC+Ht5x6IoNUvcCfSci354z6FBW5GJpnX0EfhMXjepW27a3mD1sfe8mDye1gGq2v
         kcHMY26MvDvQhFip6RqBwjcvZ9GFCp0+MPON5mw/aqlu3iV+g8X7THrnv5NDFIVXTZnH
         sFXxH0ZDyUCFdz/X0/jPZPrciRHK3jkwUXsENzkZFPxSgThPiOQ3qczghO/faeafPXl5
         bP4w==
X-Gm-Message-State: AOAM533v786xoQkSWJ6D0G2+lTjw11NIb2Ib/PI0l9P/KXimtJmIqcM6
	Nujc2fPXnK4dizUwFMXmirgWbw==
X-Google-Smtp-Source: ABdhPJztoZwY9GzmP0sW1GRsBty+8mBakoPLlYRrXwhRMwxHYokPa3GVHzwvrIWBb6RbH0vxSu5/Vg==
X-Received: by 2002:a1c:4d0a:: with SMTP id o10mr10640289wmh.107.1605893073228;
        Fri, 20 Nov 2020 09:24:33 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from c.8.b.3.0.6.d.4.9.0.2.b.0.0.0.6.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (c.8.b.3.0.6.d.4.9.0.2.b.0.0.0.6.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:6000:b209:4d60:3b8c])
        by smtp.gmail.com with ESMTPSA id t13sm5735533wru.67.2020.11.20.09.24.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2020 09:24:32 -0800 (PST)
Message-ID: <d042ad2eb586ce7e546386462c3a63d6b62463c7.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH pseudo] Fix build with gcc 10
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Vincent =?ISO-8859-1?Q?Stehl=E9?= <vincent.stehle@arm.com>, 
	openembedded-core@lists.openembedded.org
Date: Fri, 20 Nov 2020 17:24:31 +0000
In-Reply-To: <20201120163853.13737-1-vincent.stehle@arm.com>
References: <20201120163853.13737-1-vincent.stehle@arm.com>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Fri, 2020-11-20 at 17:38 +0100, Vincent Stehlé wrote:
> Add a missing typedef in front of the pseudo_access_t definition.
> Otherwise
> pseudo_access_t ends up being a global enum, defined each time
> pseudo_ipc.h
> is included.
> 
> This fixes the following link time error with gcc 10:
> 
>   multiple definition of `pseudo_access_t'
> 
> Signed-off-by: Vincent Stehlé <vincent.stehle@arm.com>
> ---
>  pseudo_ipc.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/pseudo_ipc.h b/pseudo_ipc.h
> index caeae5c..d945257 100644
> --- a/pseudo_ipc.h
> +++ b/pseudo_ipc.h
> @@ -29,7 +29,7 @@ typedef struct {
>  	char path[];
>  } pseudo_msg_t;
>  
> -enum {
> +typedef enum {
>  	PSA_EXEC = 1,
>  	PSA_WRITE = (PSA_EXEC << 1),
>  	PSA_READ = (PSA_WRITE << 1),

I think we already have this in the pseudo branch we use for OE?

http://git.yoctoproject.org/cgit.cgi/pseudo/commit/pseudo_ipc.h?h=oe-core&id=a44361b8d3fbf5fc40cd87b599caeb380454efbe

Cheers,

Richard

