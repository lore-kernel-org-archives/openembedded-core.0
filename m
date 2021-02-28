Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.web12.2048.1614539765008302180
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Feb 2021 11:16:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=s4RVwZLo;
 spf=pass (domain: gmail.com, ip: 209.85.215.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f172.google.com with SMTP id p21so10089515pgl.12
        for <openembedded-core@lists.openembedded.org>; Sun, 28 Feb 2021 11:16:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:organization:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Dx+mPGg1+sS/AChFzOH8F0hx8Pdhh75MG7uxpYWX3t8=;
        b=s4RVwZLo49YimZVo5B8pKV1dIS+/6uAZnCt1jo30jJRscVSGWbmtbnJd0BoUeDS94b
         TxX5XxvfbQcSPINIgR0njMjUXKSZqGDjqxW5aDWzO3pPVGDHjxO6aMN/Pa4alYtpWPIc
         M2mWpdHQ9rWOEDulkW3eJUvKvCnzkwYgOpxSntri0lgdSS4zJ1ey+AUn3JGtKi3qmqCf
         ctcE+aoJxyD6n3QVrsnitIx8bVz0lWEkSkfXXBPyvq8gsaWSAH1WXxp1sVabbkc597bi
         bMg7BAx/eBOllSe3E5F7sPZjqdyE+WV2fTgyUUn7yTRdnYmyYdF3hGasxfTYkfGCwUrN
         nKRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=Dx+mPGg1+sS/AChFzOH8F0hx8Pdhh75MG7uxpYWX3t8=;
        b=IdD1hh64Tl3JJC9LrXzEWx/V7LkhjUJ6zV59WvNuQcb4p/LhvXlGmgZqTumav7q5zT
         Ca3rLicpnbjhrFdXFCJ9q0jWz1fKCEj4MeTovWkKM8tb7qluDO0rnQ73UMkSaf4rlAnx
         0t+8YIdHy2MPLvHSvo2u32slurLRxKoczju6iC8bq7TDCPwUnuwrPvfFsfSnqcRifl1L
         RhuBAIEMD23/uVD1Bhiyi4AC2Wn98KC8lap8iSz6kiD3MltpPOdQuGHJv+5ONiEOlW5n
         YJJgByd5DK8MGvrhYiih9kceaLIPOXk9z7Dvqga4gbBV/+xujFHMxjRRX8N1K6p5B0oO
         t19g==
X-Gm-Message-State: AOAM5308UimHFX/72uFheQYtjPSUR5E/tFn+Q7KeAnOwRcU4hfMU9zW+
	dgOKx6vempCmDJ6BrRSmtyG/Jntn/BLfYA==
X-Google-Smtp-Source: ABdhPJwOl71J5f++wJAcB+FPG2EJxdtYl4LkbbfJca/TjcPa3JdPsTSVOmQk8Go5u1bem0XRplZQeQ==
X-Received: by 2002:aa7:8286:0:b029:1e2:70ef:c410 with SMTP id s6-20020aa782860000b02901e270efc410mr11460815pfm.45.1614539763815;
        Sun, 28 Feb 2021 11:16:03 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:a0f0::5d43? ([2601:646:9200:a0f0::5d43])
        by smtp.gmail.com with ESMTPSA id x11sm14620131pja.46.2021.02.28.11.16.03
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 28 Feb 2021 11:16:03 -0800 (PST)
Subject: Re: [OE-core] [PATCH 22/24] scripts/lib/wic/partition.py: do not set FAT size
To: openembedded-core@lists.openembedded.org
References: <20210228153702.498275-1-alex.kanavin@gmail.com>
 <20210228153702.498275-22-alex.kanavin@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <ec22836e-0dd1-1238-d49a-2871b507b697@gmail.com>
Date: Sun, 28 Feb 2021 11:16:02 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210228153702.498275-22-alex.kanavin@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 2/28/21 7:37 AM, Alexander Kanavin wrote:
> Modern dosfstools automatically determines the appropriate size
> and will error out if something that doesn't make sense is
> supplied on the command line.

leaving it to tool seem to make it non-deterministic, is there any 
disadvantage of using a manual fallback default

> 
> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ---
>   scripts/lib/wic/partition.py | 4 ----
>   1 file changed, 4 deletions(-)
> 
> diff --git a/scripts/lib/wic/partition.py b/scripts/lib/wic/partition.py
> index 85f9847047..76d144d12d 100644
> --- a/scripts/lib/wic/partition.py
> +++ b/scripts/lib/wic/partition.py
> @@ -339,8 +339,6 @@ class Partition():
>               label_str = "-n %s" % self.label
>   
>           size_str = ""
> -        if self.fstype == 'msdos':
> -            size_str = "-F 16" # FAT 16
>   
>           extraopts = self.mkfs_extraopts or '-S 512'
>   
> @@ -422,8 +420,6 @@ class Partition():
>               label_str = "-n %s" % self.label
>   
>           size_str = ""
> -        if self.fstype == 'msdos':
> -            size_str = "-F 16" # FAT 16
>   
>           extraopts = self.mkfs_extraopts or '-S 512'
>   
> 
> 
> 
> 
> 
