Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EBBCC5AD49
	for <webhook@archiver.kernel.org>; Fri, 30 May 2025 13:33:46 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web11.6306.1748612018953799311
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 May 2025 06:33:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=J3D5HrSk;
 spf=pass (domain: gmail.com, ip: 209.85.221.41, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3a4c9024117so1453685f8f.0
        for <openembedded-core@lists.openembedded.org>; Fri, 30 May 2025 06:33:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748612017; x=1749216817; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IdpR4PqzHh7o4H4KCN1uzp04h3F/eDK+GjKg5p1x5mg=;
        b=J3D5HrSkaCX/2nNwLD9Fhtjl5alFLUJrMorSoJAsHhdotogf23zopWtQa8LkG4lxCJ
         HYdz8HMxiD81SXWapQn/pY1XbjM2348Mm1BiKgJBIWqokVD2J4aVBXCUfD8KZzwlvxvZ
         M4OJF7GlFSlUFJtlJoDuN+4CyYT79XqbuBUj/1aCYzvuEk3KN3E8sWHhqu9EXHIqARYD
         J8x6aAf/eBhOgxYr0MNCc/skozAdHxet7L3Q0YsLthwT4rwkZN6GJ5Pq0xWlYvGO+ayw
         c+eqhJGXHbNeAzSgNXey7EjUN6cdSiTqNsJs/2749djTry/U0pQU/LfV2eIDreZmytKQ
         9/Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748612017; x=1749216817;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IdpR4PqzHh7o4H4KCN1uzp04h3F/eDK+GjKg5p1x5mg=;
        b=nZTG91ZNoE3LbFgBPEs9Ojcy6nc3GTmo3LbDtqsA1t1P4oduGDUWYqmZN0mSZl1y1r
         c1JdSPbK1vP2q284NKGDhdhjYgvQ13gltiqUkf0njC7BFqppIx3jqFy59q5OVcPtsZ5R
         FAv2nSkRUuYsIkUxTmEZ0uEb8d5LZ5TiQ6hmaRuHcwIrLF+h6P+hSPWSMIcoBBE2IQBA
         L/+gOnbNy4f0Lj8Sj1OlbnT/TaO6kfgnjKwAlJXGve8WWQNJ5R9V28+9ygWpP/B8MFOI
         UUvp949rkZFBZu8I4CA5ELNEoYkUHurA+wCZv+TImYTxb7SLIzSHRI2L+kLNxojB2p+M
         /4vg==
X-Forwarded-Encrypted: i=1; AJvYcCXoq6BkYbdkEHpilf3a/gSJBuLgPQ8nEbcTcBShvJjmT5eiDZyXiNTs92up2BdK+YxlZYx+Tv9mds5kt478vgH7XQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxcV0EFiaHtK9zR0EZo+yHVKVIcQNQqrXFlPJ8zjSoumjPUsoWU
	2kDGg8cTjf4vFDrsB9qSBOIjciXaRE+SyjVt3fin9s5VxI8hxSNKXzzc
X-Gm-Gg: ASbGncvLHnWKJQ4Bwyso1RPIu3FpmU08qDswGDIYj7KJ7xVkU7nJxvHhDQrqyt+Z1NN
	tZSVNopm2ZrbbJXTXc0a1NPJAj48HluLLu7BxFw+vIpgnZI4gMXkmAhfTrImJNn6TkzVMH3Zujm
	wwm4lsq+3MwkIWcb4ZRKk6ZG62XVTuUwQzUnN6ATorEyc6jZj/wCwjGyRHBAQSvoCLojGa4b8Wv
	RfvSORfKU6X/7jGTQOEMCDc6Mb5sP/AzU20cKO1QiQUQ5GERFCoYOz/ZPSbvyaBY1io8pNtHK59
	ehSAbxC+1OyLg+LiL2D/kEDlLct4Ev1uuCy1H50kiTKwMwr/nELYqDcYS/Y=
X-Google-Smtp-Source: AGHT+IFkl922yDrUYBSNZVQJkaUc+5HLw7xdBZZzyVQtkYuiO+cm/+yLzOX20QI2IVDiqbAY3apL0w==
X-Received: by 2002:a05:6000:2dc5:b0:3a4:db4a:3004 with SMTP id ffacd0b85a97d-3a4eedb8ab6mr6372505f8f.22.1748612017023;
        Fri, 30 May 2025 06:33:37 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450d7fc281csm18626735e9.40.2025.05.30.06.33.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 May 2025 06:33:36 -0700 (PDT)
Message-ID: <92dabbd1-7e87-47d1-b23c-6ff2adecfca6@gmail.com>
Date: Fri, 30 May 2025 15:33:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [meta-oe][PATCH] signing: export rule specific
 environment variables with Digicert infrastructure
To: marcin.bajer@salwatorska.pl, openembedded-core@lists.openembedded.org
References: <20250530090019.668412-1-marcin.bajer@salwatorska.pl>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <20250530090019.668412-1-marcin.bajer@salwatorska.pl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 30 May 2025 13:33:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217507

On 5/30/25 11:00, Marcin Bajer via lists.openembedded.org wrote:
> Digicert cloud HSM requires more variables to be exported i.e. `SM_HOST`, `SM_API_KEY`, `SM_CLIENT_CERT_FILE`. The signing provides might inject needed configuration to `meta-signing.env.d` directory in form of *.env files. In exisiting code in `signing_prepare` call source all *.env files from `meta-signing.env.d` this allows to export only variables common for all signing rules. In case, unique settings per signing rule are needed those are overwritten (sourcing next file will overwrite previously defined variables). Proposed patch allows to export signing `rule` specific variables. For example to set SM_API_KEY for rauc rule it is needed to defined in env file as `export SIGNING_PKCS11_SM_API_KEY_rauc_=abcde` . Added logic remove prefix SIGNING_PKCS11_ and surfix _rauc_ end export the variable.

1. The Signed-off-by line is missing. Please make sure to use "git
commit --signoff" when committing.
2. This should be sent to meta-oe mailing list, not to this one:
openembedded-devel@lists.openembedded.org - could you please resend it
there?
3. While at it, could you please also add some line-breaks in the commit
message, and fix some typos? (end->and, surfix->suffix, to defined->to
be defined...)

> ---
>  meta-oe/classes/signing.bbclass | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/meta-oe/classes/signing.bbclass b/meta-oe/classes/signing.bbclass
> index f52d861b76..cefd115355 100644
> --- a/meta-oe/classes/signing.bbclass
> +++ b/meta-oe/classes/signing.bbclass
> @@ -263,6 +263,12 @@ signing_prepare() {
>  signing_prepare[vardeps] += "signing_get_uri signing_get_module"
>  
>  signing_use_role() {
> +
> +    #import all variables dedicated to this signing rule    
> +    for env in $(ls "${STAGING_DIR_NATIVE}/var/lib/meta-signing.env.d"); do
> +        eval $(cat ${STAGING_DIR_NATIVE}/var/lib/meta-signing.env.d/$env | grep "^export SIGNING_PKCS11_.*_${1}_" | sed -e "s/SIGNING_PKCS11_//" -e "s/_${1}_//" )
> +    done
> +    
>      local role="${1}"
>  
>      export PKCS11_MODULE_PATH="$(signing_get_module $role)"
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#217505): https://lists.openembedded.org/g/openembedded-core/message/217505
> Mute This Topic: https://lists.openembedded.org/mt/113378796/6084445
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [skandigraun@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


