Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65B9DC433F5
	for <webhook@archiver.kernel.org>; Fri,  1 Apr 2022 09:49:41 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web11.8592.1648806580296272588
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Apr 2022 02:49:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=a3EJ2Cel;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.47,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f47.google.com with SMTP id q20so1343047wmq.1
        for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Apr 2022 02:49:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=CNd2j9z6D/KFwIoY/xs3p5AFbVLej5wrKgEkqvWmiq4=;
        b=a3EJ2Celkkbdw4RFcroaTu3uGuTNZ7+K1IfFJ0TXo9+PJIqD8d5XGbm2VVvOGFf2Pk
         5RVEp4xOg5ZG3BPi4zIm185Bw6WQBuD5XKZFvGnQdbqF4cubNFIcvB32wU2z/PymkbeQ
         FPyODSsV6XMX4ixfhph0Jzdsovf9kYVKjhRfY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=CNd2j9z6D/KFwIoY/xs3p5AFbVLej5wrKgEkqvWmiq4=;
        b=GD6BBfM6xyE37fxDiliek6e3qbqZZqO3bai94Myc5mLvCn9uvowzob3o7HW4ptusWA
         YwM5SMfib1ooV5QIOqhM1klM/HWoGW+8j1L7afynBCVeZl/FXDTyrUikCWzp+FH2K8Te
         rmNf4EmPDnx7TGsEat7fQaU6sGAxYMLlLMDkz52fZ0eqULN9egcVEQx2CxAGBQ4SMep5
         ZLH0QNz8tJmhm359WwGfBDcMh5GzQTWGROWDn+VaKmnoQzYW5ysQ8srhLznoCS0TzSxR
         Faw/Bmf6BPH/CyAsXdl1AXa4dfz0g1rziM/mQrf2P87BfuKQciJVHhjHuVdKHWpzeAY8
         Fyiw==
X-Gm-Message-State: AOAM5309JseRa8NEap5DPaVJoFkRWO1WCQMMDNtoH4YZI6DUDLMtj0lY
	HW49vVDAwcrQIBtvd7rxqe68wA==
X-Google-Smtp-Source: 
 ABdhPJzPKX+1ST6eFza4hfe8z14AHHAO/Qh3ShRUepjeq6b4DZ3DMgB+RU0TYJe3gCGroqCdS79lag==
X-Received: by 2002:a05:600c:3505:b0:38c:a3a8:8479 with SMTP id
 h5-20020a05600c350500b0038ca3a88479mr8289574wmq.4.1648806578800;
        Fri, 01 Apr 2022 02:49:38 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:a160:31eb:e235:3dfd?
 ([2001:8b0:aba:5f3c:a160:31eb:e235:3dfd])
        by smtp.gmail.com with ESMTPSA id
 l10-20020a05600002aa00b0020414b4e75fsm1836094wry.85.2022.04.01.02.49.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Apr 2022 02:49:38 -0700 (PDT)
Message-ID: 
 <20442eb12ce2cf12e9fb83e3600a290a07bc0997.camel@linuxfoundation.org>
Subject: Re: [OE-core] [master] meta: scripts - relocation script adapted to
 support big-endian machines
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Sundeep KOKKONDA <sundeep.kokkonda@gmail.com>,
	openembedded-core@lists.openembedded.org
Cc: rwmacleod@gmail.com, umesh.kalappa0@gmail.com
Date: Fri, 01 Apr 2022 10:49:33 +0100
In-Reply-To: <20220401042007.2949717-1-sundeep.kokkonda@gmail.com>
References: <20220401042007.2949717-1-sundeep.kokkonda@gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Apr 2022 09:49:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163883

On Fri, 2022-04-01 at 09:50 +0530, Sundeep KOKKONDA wrote:
> relocate_sdk.py was developed for little-endian architures and when tries
> to install SDK for big-endian machines errors like below will be shown.
> 
> The changes made in the script to support big-endian architecture.
> 
> Signed-off-by: Sundeep KOKKONDA <sundeep.kokkonda@gmail.com>
> ---
>  scripts/relocate_sdk.py | 45 ++++++++++++++++++++++++++++++++---------
>  1 file changed, 35 insertions(+), 10 deletions(-)
>  mode change 100755 => 100644 scripts/relocate_sdk.py
> 
> diff --git a/scripts/relocate_sdk.py b/scripts/relocate_sdk.py
> old mode 100755
> new mode 100644
> index 8c0fdb986a..513b9343d3
> --- a/scripts/relocate_sdk.py
> +++ b/scripts/relocate_sdk.py
> @@ -30,9 +30,10 @@ else:
>  old_prefix = re.compile(b("##DEFAULT_INSTALL_DIR##"))
>  
>  def get_arch():
> +    global ei_data
>      f.seek(0)
>      e_ident =f.read(16)
> -    ei_mag0,ei_mag1_3,ei_class = struct.unpack("<B3sB11x", e_ident)
> +    ei_mag0,ei_mag1_3,ei_class,ei_data,ei_version = struct.unpack("<B3sBBB9x", e_ident)
>  
>      if (ei_mag0 != 0x7f and ei_mag1_3 != "ELF") or ei_class == 0:
>          return 0
> @@ -51,11 +52,17 @@ def parse_elf_header():
>  
>      if arch == 32:
>          # 32bit
> -        hdr_fmt = "<HHILLLIHHHHHH"
> +        if ei_data == 1: # ei_data = 1, little endian
> +            hdr_fmt = "<HHILLLIHHHHHH"
> +        else:   # ei_data = 0, big endian
> +            hdr_fmt = ">HHILLLIHHHHHH"
>          hdr_size = 52
>      else:
>          # 64bit
> -        hdr_fmt = "<HHIQQQIHHHHHH"
> +        if ei_data == 1:
> +            hdr_fmt = "<HHIQQQIHHHHHH"
> +        else:
> +            hdr_fmt = ">HHIQQQIHHHHHH"
>          hdr_size = 64

I think we can make the change a bit neater, maybe putting ">" or "<" into the
global variable and then doing something like:

hdr_fmt = endian_prefix + "HHIQQQIHHHHHH"

?

Cheers,

Richard


