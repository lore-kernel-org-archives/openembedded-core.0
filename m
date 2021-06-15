Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web10.1210.1623779837273914878
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Jun 2021 10:57:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=YdCoE6e5;
 spf=pass (domain: gmail.com, ip: 209.85.216.50, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f50.google.com with SMTP id h12-20020a17090aa88cb029016400fd8ad8so122043pjq.3
        for <openembedded-core@lists.openembedded.org>; Tue, 15 Jun 2021 10:57:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:organization:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=/tT2Dc0oPrV3X1aQvurFlFGelc0SH/0bS+D+fuPy9K0=;
        b=YdCoE6e56IFre6pojMH6WMGfnG5dOOa6FqZ+vm6Np9x/3ZwQg+cDDaru8Nh7ATJ6nV
         nirXsOUTwJP8WjLejr8LigyU9Hz7/ZoCOmZ4+FJ+R1zyAVIubE/7VxbMIO0QGDaqvAiP
         8ftiWtqEvPwobyKBV/3YuOcrh+AZ6Ixd6/yJfTOEDCMw9D4NkopDXDKPaKGWpn97Hu2G
         /5xXtUCP5Ev8TXu0BY1VrE6l8/0rErE5kGDpamg17JMX/j2weZHI2J4nH/IPmF1WxllU
         mRIW17g3PbGJL47Q/pJh/mkkI6Kv+5eaqHxCloezn6gtoa9SDXRYDE31tRFr+P5F+TrP
         6X+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=/tT2Dc0oPrV3X1aQvurFlFGelc0SH/0bS+D+fuPy9K0=;
        b=XgjMhcRwSPUhMk6XRpz/zFqDmA21vwrL+1C5WiY46N9AVCLOj3JlIZZrAJuw6DoA1M
         67lXDyd/08AoPReYnYcBzTgpzHFbJI7K/uHSctNmXczzI74Pu+ROd3Hk1SS1TcF1EE++
         WXLYdCh3dAp8Om/l5cnl1uwCuOkj28P54grrYoZddYrDwFpIld80ZB1qo/nR8mA3Jxy/
         HoLsXX9OtFvAn1Gc/uMBRni5zNN7jJVFrcy+EeA50UxAUWq+6oZFHktX4/Vzi5tPHFXU
         o4Qx1Aqp4O5EBffU0vpF86Ehx/IF2KLQYI0CbRXPUePoAPOd7pZK9T+psaywEinXNjcm
         JwfA==
X-Gm-Message-State: AOAM533oE2D2KhpXroA1sMVZdxWohdXooFjLeC/+Jd6MHUVTB8SGISdu
	AR8+7BnkcaIPqSeny66f1bi0qpOd8wO+XQ==
X-Google-Smtp-Source: ABdhPJx9OWxVVYTxTlfjV3UXX4gSk+4RfYrV6+w72p1+yaNiUEOymn5dy5GgB6Vxftw4ke2YMdsebA==
X-Received: by 2002:a17:90a:f48c:: with SMTP id bx12mr6197694pjb.200.1623779836274;
        Tue, 15 Jun 2021 10:57:16 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:a0f0:d088:fa89:ac40:a9cc? ([2601:646:9200:a0f0:d088:fa89:ac40:a9cc])
        by smtp.gmail.com with ESMTPSA id z3sm7939590pgl.77.2021.06.15.10.57.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Jun 2021 10:57:15 -0700 (PDT)
Subject: Re: [OE-core] [PATCH] systemd-conf: Prevent systemd-network from managing veth interfaces
To: Ross Burton <ross@burtonini.com>, openembedded-core@lists.openembedded.org
References: <20210615100200.3325303-1-ross.burton@arm.com>
From: "Khem Raj" <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <e1183c78-db40-3b35-66d9-4364d605eecf@gmail.com>
Date: Tue, 15 Jun 2021 10:57:14 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210615100200.3325303-1-ross.burton@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 6/15/21 3:02 AM, Ross Burton wrote:
> From: Matt Spencer <matt.spencer@arm.com>
> 
> We need to prevent systemd-network from managing veth interface when
> using platforms like k3s as they control creation and management of the
> interfaces.

perhaps it may be an option to override wired.network or  use a fragment 
to drop-in just this change via own layer

> 
> Signed-off-by: Matt Spencer <matt.spencer@arm.com>
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>   meta/recipes-core/systemd/systemd-conf/wired.network | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/meta/recipes-core/systemd/systemd-conf/wired.network b/meta/recipes-core/systemd/systemd-conf/wired.network
> index e7b69970d6..7406287248 100644
> --- a/meta/recipes-core/systemd/systemd-conf/wired.network
> +++ b/meta/recipes-core/systemd/systemd-conf/wired.network
> @@ -1,5 +1,6 @@
>   [Match]
>   Type=ether
> +Name=!veth*
>   KernelCommandLine=!nfsroot
>   KernelCommandLine=!ip
>   
> 
> 
> 
> 
> 
