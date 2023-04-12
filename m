Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21723C7619A
	for <webhook@archiver.kernel.org>; Wed, 12 Apr 2023 11:36:58 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web11.40630.1681299409830367374
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Apr 2023 04:36:50 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@smile-fr.20210112.gappssmtp.com header.s=20210112 header.b=xRG+WniN;
 spf=pass (domain: smile.fr, ip: 209.85.128.52, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f52.google.com with SMTP id gw11-20020a05600c850b00b003f07d305b32so7086811wmb.4
        for <openembedded-core@lists.openembedded.org>; Wed, 12 Apr 2023 04:36:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20210112.gappssmtp.com; s=20210112; t=1681299408; x=1683891408;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wEY34orm/Hg9OKGQHypveP/HoVoWcDrmuH0rReAa0vw=;
        b=xRG+WniNNSRr86fJMbGNZb35tYPhV2jbeF+dIR/euonCUCCDcVcAGg9fxqVVeuS9hL
         WHqKCUEu+XAHyv/IBtShRN9v71Pu0jZF2WShfhAfo4l1YmY4Ja60FYxM/+kNmwyZTRY+
         OVBHXI3rQv4XAZpt6ziWg0q/NzpxF0x8cBy9o05Oc7hs0wH+DvV7p5j7k3ZfpzTsAS9+
         c8QiD7D5IqpqsB+/tSjU2Y5hqwt7hr3roiLu5aCoHQKVP+EBl9g7Lvwt0O9FynsBuQR9
         xvNsdC/2vFKkElVbTbngwdwW/zZshbTrf0n6ivEb9h1lv4a3W9ApWjdDPCD5wsnkczXr
         rhew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681299408; x=1683891408;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wEY34orm/Hg9OKGQHypveP/HoVoWcDrmuH0rReAa0vw=;
        b=JmZ0Hhw1EmeDJPtJWuwQqjVTklCo6CxIb1X+0+VvYjklBTzYSR5yG5kVJ8McCYMOaA
         3dF6gPyIArrO73P54hGjPvAzvnkq+IPLzcYqiAxvfGsecLJoXkEoU5GNw1dGoLC7Q1zj
         un2mOJ1tG3TQCYTK9xxfClN7r82XpAHSrOkp5QBIm2CgkYXH1bERXPGgIf6nBrzptVDm
         lVYa7WkIlF7OQGIKPwyPxrhjFl27Q93Ue2pLNTMTO/UQKyEbJjTrp0NICY0gHAmlqok7
         c3OYaZKEEOJwiQKZCepGw3l/eo23bFG6qBZUyJibee5eIau5ixy24F48BLxfqbIQPKkt
         xn2g==
X-Gm-Message-State: AAQBX9eRmHeyV/pcUVrNHuhVNkX9yFNmKmWEaMlclc6F4IKqbwRthp97
	HJtMRlwI48v1CMUByF3tPhxXhXIdi5bzi/KRHdSzKQ==
X-Google-Smtp-Source: AKy350bpyn//MYddplwHQSXBoc2tfvAjmZboH/ehLwwFUHX1GQafl/FhxfOkdBFVhOW+qOO+oJN0XA==
X-Received: by 2002:a7b:c004:0:b0:3f0:9f2d:164d with SMTP id c4-20020a7bc004000000b003f09f2d164dmr999325wmb.20.1681299407576;
        Wed, 12 Apr 2023 04:36:47 -0700 (PDT)
Received: from [10.1.75.108] (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id t16-20020a5d42d0000000b002f00793bd7asm9591419wrr.27.2023.04.12.04.36.47
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Apr 2023 04:36:47 -0700 (PDT)
Message-ID: <9b8d0c0c-3893-d5d5-18af-8ffe2561e498@smile.fr>
Date: Wed, 12 Apr 2023 13:36:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [OE-core] [PATCH] cve-update-nvd2-native: added the missing http
 import
Content-Language: en-US
To: openembedded-core@lists.openembedded.org
References: <20230412101926.1135184-1-jan.vermaete@gmail.com>
From: Yoann Congal <yoann.congal@smile.fr>
Organization: Smile ECS
In-Reply-To: <20230412101926.1135184-1-jan.vermaete@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Apr 2023 11:36:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179946

Hi,

On 4/12/23 12:19, Jan Vermaete wrote:
> Signed-off-by: Jan Vermaete <jan.vermaete@gmail.com>
> ---
>  meta/recipes-core/meta/cve-update-nvd2-native.bb | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/meta/recipes-core/meta/cve-update-nvd2-native.bb b/meta/recipes-core/meta/cve-update-nvd2-native.bb
> index 1c14481c21..2b585983ac 100644
> --- a/meta/recipes-core/meta/cve-update-nvd2-native.bb
> +++ b/meta/recipes-core/meta/cve-update-nvd2-native.bb
> @@ -118,6 +118,7 @@ def nvd_request_next(url, api_key, args):
>      import urllib.request
>      import urllib.parse
>      import gzip
> +    import http

If this is only for the "except http.client.IncompleteRead:" line 146[1], wouldn't it be better to fix the catched exception to match what urllib can
 throw or to remove the except block entirely?

I've triggered the same error as you but chose to remove the except block to get my code running.

[1]: https://git.yoctoproject.org/poky/tree/meta/recipes-core/meta/cve-update-nvd2-native.bb#n146

>  
>      headers = {}
>      if api_key:

Regards,
-- 
Yoann Congal
Smile ECS - Tech Expert

