Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web11.367.1621534342402915158
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 May 2021 11:12:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=LK+khFYe;
 spf=pass (domain: gmail.com, ip: 209.85.216.46, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f46.google.com with SMTP id cu11-20020a17090afa8bb029015d5d5d2175so5885020pjb.3
        for <openembedded-core@lists.openembedded.org>; Thu, 20 May 2021 11:12:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:organization:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=LPPOGNPZdxRZgqagwGNc39K660xIO4yJnWHdxGVOsUY=;
        b=LK+khFYeN62PFlYTSPRBP8vTjqegmYjh3b8ZfURzNQu+q2eBl/snDhQ+669KdtRv4D
         gr9dz8V6g+jUaRyUe9yEM19BB1PgO7wRNflFbsqbpRRQBhGKCgH0VPaq/DZwgTRNIqRA
         fAFirxb2jNgl3rtpogRNuYJz7U4mziJx8s7M1VJ3or6olNxONHLhFFZ0c67W/Io+WSjE
         qGAwBmhpxmMDrClyAh/DLxFHnIYj2xXCq5RxiMh2KQR9edP1DK6HQ5XXya5mupVwbpDK
         PxCnYKrBtInIzG3jZ1H63cvaKmcWnxJ2/rWg08PpsGIgis+kOl5YjJvOQhspA/9bSwPT
         i5gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=LPPOGNPZdxRZgqagwGNc39K660xIO4yJnWHdxGVOsUY=;
        b=LkkI126jDA8UDooK7YLw2+kePAZjnoRKg0TGXHcD2FMoFkv4FBxQ42zBfymULytJXC
         s23+DWTKPEoB5kqRcrtvguM9yGKpAWWUUMkRPRYONqiy88itKxtiFP5k22wuC+pcy7fc
         2Q5l5jRrRNTgSX6qjrpCrq8+lGBCBOAaO/Q8JCdrAQ9E42g9jDrGpXsyfLu4iMQhd7tU
         QGI5eYWxJyrk3Tie3RoPAjgCs7WRR0QE/Q7jvHrW9iOw4wW1iXQ7VY4LpCNYsjiL1j06
         xa/OPtmRXAfdXwVKVOWPNc+mahsFS9f+LV6dEtkpFRVEKQrUmLRmOJW+lUDLBYIMKNo4
         J1lA==
X-Gm-Message-State: AOAM533IXtanm6WFMIn8f8wmYlkfxN6A3kVNdJ67J03zwvl5r0xzsa4T
	8Dj3t5sW1QWwHJBOodEQYvtRN4dCaJc3Zg==
X-Google-Smtp-Source: ABdhPJyoo2fp4pk1Z5pGTtFFXSa+HhXzj6Lat3aBaj9nfCcxj/gOwaCu1lRnzflLk7CoHtyr3gTYUg==
X-Received: by 2002:a17:90a:fb53:: with SMTP id iq19mr6097220pjb.11.1621534341418;
        Thu, 20 May 2021 11:12:21 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:a0f0:b889:2ea3:1899:5b86? ([2601:646:9200:a0f0:b889:2ea3:1899:5b86])
        by smtp.gmail.com with ESMTPSA id t22sm2141415pfg.119.2021.05.20.11.12.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 May 2021 11:12:20 -0700 (PDT)
Subject: Re: [OE-core] [PATCH] gcc: enable branch protection by standard
To: Ross Burton <ross@burtonini.com>, openembedded-core@lists.openembedded.org
References: <20210520171511.3177430-1-ross.burton@arm.com>
From: "Khem Raj" <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <295f3f9b-267d-3a74-ca14-91c7ad589394@gmail.com>
Date: Thu, 20 May 2021 11:12:19 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210520171511.3177430-1-ross.burton@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 5/20/21 10:15 AM, Ross Burton wrote:
> Pass --enable-standard-branch-protection.  This is an aarch64-specific
> option (currently) which does nothing on other targets.  On aarch64 this
> generates code uses BTI/PAC instructions to mitigate Return Orientated
> Programming attacks.  This approach is backwards compatible and the code
> size/performance impact is typically negliable.
> 
> More details can be found at
> https://events.static.linuxfound.org/sites/events/files/slides/slides_23.pdf
> 
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>   meta/recipes-devtools/gcc/gcc-configure-common.inc | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/meta/recipes-devtools/gcc/gcc-configure-common.inc b/meta/recipes-devtools/gcc/gcc-configure-common.inc
> index a64c4caf00..dc7f458b25 100644
> --- a/meta/recipes-devtools/gcc/gcc-configure-common.inc
> +++ b/meta/recipes-devtools/gcc/gcc-configure-common.inc
> @@ -40,6 +40,7 @@ EXTRA_OECONF = "\
>       ${@get_gcc_mips_plt_setting(bb, d)} \
>       ${@get_gcc_ppc_plt_settings(bb, d)} \
>       ${@get_gcc_multiarch_setting(bb, d)} \
> +	--enable-standard-branch-protection \
>   "
>  

lgtm


>   # glibc version is a minimum controlling whether features are enabled.
> 
> 
> 
> 
> 
