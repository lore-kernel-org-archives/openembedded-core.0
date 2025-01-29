Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39D29C0218D
	for <webhook@archiver.kernel.org>; Wed, 29 Jan 2025 09:36:35 +0000 (UTC)
Received: from mail-lf1-f65.google.com (mail-lf1-f65.google.com [209.85.167.65])
 by mx.groups.io with SMTP id smtpd.web11.8974.1738143390051367049
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Jan 2025 01:36:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=RCIHVS9k;
 spf=pass (domain: smile.fr, ip: 209.85.167.65, mailfrom: yoann.congal@smile.fr)
Received: by mail-lf1-f65.google.com with SMTP id 2adb3069b0e04-5439a6179a7so571952e87.1
        for <openembedded-core@lists.openembedded.org>; Wed, 29 Jan 2025 01:36:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1738143388; x=1738748188; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:organization:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ULNzKct1xlqmU1O5IMmPXT8YvIRiqk6Sr4mdTH3hJ4I=;
        b=RCIHVS9kwtYj01wggEByO1aJ1bB3TsjNo1XwjUG+fR2Aqdyp5mD4vyCJAd9Fz9uSrv
         TGJEwZXMuHFxcbkm7PCQSmGo3FwI/DpFK32EOtkblgJyXaPvBD2nd8j8NitcoSXh5Zvn
         JWICDbSnV4OPKyE34rA5jTnya7xhGEUbmLW9w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738143388; x=1738748188;
        h=content-transfer-encoding:in-reply-to:organization:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ULNzKct1xlqmU1O5IMmPXT8YvIRiqk6Sr4mdTH3hJ4I=;
        b=fL9iUAG7QccDnmtUxxDOA39MTNBRlM+DDu6KgViz8jH9ZrVhHSwK0+LFRQGaaWYcKN
         ocN1R43eSUxGs56OiaWT27p+ECqaZhbETnP/XwoIwtFfP2zTmYU15XGsFHMNffXeaHMw
         gfy9f10/C8EazHoNez8rjRWfGL3LHlzrf5TwYOqx7aJoW6l0ihHqHmfhEzfxm9/YPa7u
         pDdjrDej3dIly/Kix6toBWuDy2ZDIsKfZhryOAmoIpeDNRoGCe7Sb8eBPTugk6nXOZDA
         n83XMOwos8jY8bZxmHfk0rQ2MZg9e2Hu7YPD4I/EZXpJ08NFvASZOIzvxmA4kb2AJ42B
         YJgw==
X-Forwarded-Encrypted: i=1; AJvYcCXhCc71t21JR2nECP+1VXY5kVIpBW+NRrNvd6fkwLL5pyO3XA5GoNpsa3T4C+vqW4q6nuP1w9FZuRJs9FjUhPSW6A==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwSFPX5okloZc9r266hwhuElfNbyVYGuau1uEih9Cu5jLJiJzA7
	imtKXpMPI4w+BVh3ggTrbzk9IwDywXPSG+p+s/59LZMH5Q3pUqM+Kfy4wIVziXQ=
X-Gm-Gg: ASbGncud5Wqm9/GP+HUyDklGolvStceET0lYs59NvHeO3uh2p8eD2lv46Z3fMdMmAtW
	O8qquY7BAnpAX5M/COPW03gDO8fhYPUu/7Kd94i9NihzGJGjjoxCWHFZU1opQutym4xDXbLFGwU
	hPrtjZLGZeTpUlDoQXSBbzMO6bE0EVtF37AKmgIBA0XXuiZjt10LVCczC1PwN8WbTHbhK3QIrb2
	r6YErng64nmT0o8DMkGqfvHFF/AKLrul04A5tD5ynxNXLdbIy26LTLgnJWnpFtVUHAr+YAbUcl+
	60GWE4l8eMj5Vf+Bex2Ualy3RW9YHXmcKxbv4MLxBhwBi3KL69+EBDaiQripud82hgI2V1ISvod
	2XXZsyrNS3y8cJYCSTdI5y2wMRRL/g10Rl60+ddie0jtH0m32fn+F
X-Google-Smtp-Source: AGHT+IE0MHypVhP7MIUuvJHf5CMgURoV6OXIVqIT4hVmq02YisZUMu9u8GiC5PfmGZK6FBaSfUMI5w==
X-Received: by 2002:ac2:4298:0:b0:542:91f3:1514 with SMTP id 2adb3069b0e04-543e4a6a5a1mr742809e87.1.1738143388081;
        Wed, 29 Jan 2025 01:36:28 -0800 (PST)
Received: from ?IPV6:2a01:cb00:dee:f000:367a:1a7f:22ad:d27b? (2a01cb000deef000367a1a7f22add27b.ipv6.abo.wanadoo.fr. [2a01:cb00:dee:f000:367a:1a7f:22ad:d27b])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-543c822fa12sm1894681e87.81.2025.01.29.01.36.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jan 2025 01:36:27 -0800 (PST)
Message-ID: <2932fc48-8cc5-41de-a155-e4d23272d802@smile.fr>
Date: Wed, 29 Jan 2025 10:36:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][PATCH 1/3] cargo.bbclass: Allow using --offline instead
 of --frozen
To: zboszor@gmail.com, openembedded-core@lists.openembedded.org
References: <20250129080902.1863054-1-zboszor@gmail.com>
Content-Language: en-US
From: Yoann Congal <yoann.congal@smile.fr>
Organization: Smile ECS
In-Reply-To: <20250129080902.1863054-1-zboszor@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Jan 2025 09:36:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210359



Le 29/01/2025 à 09:09, Zoltan Boszormenyi via lists.openembedded.org a
écrit :
> Some rust packages complain about the --frozen flag:
> 
> | error: the lock file .../Cargo.lock needs to be updated but --frozen was passed to prevent this
> | If you want to try to generate the lock file without accessing the network, remove the --frozen flag and use --offline instead.
> 
> Add a CARGO_USE_OFFLINE_FLAG = 0/1 flag to allow using --offline
> instead of --frozen for such cases.
> 
> Use 0 by default to keep using --frozen as the default flag.
> 
> Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
> ---
>  meta/classes-recipe/cargo.bbclass | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/classes-recipe/cargo.bbclass b/meta/classes-recipe/cargo.bbclass
> index b583f84bdf..fe5ce9b023 100644
> --- a/meta/classes-recipe/cargo.bbclass
> +++ b/meta/classes-recipe/cargo.bbclass
> @@ -37,7 +37,10 @@ BUILD_MODE = "${@['--release', ''][d.getVar('DEBUG_BUILD') == '1']}"
>  # and will require an up to date Cargo.lock file.
>  # This force the package being built to already ship a Cargo.lock, in the end
>  # this is what we want, at least, for reproducibility of the build.
> -CARGO_BUILD_FLAGS = "-v --frozen --target ${RUST_HOST_SYS} ${BUILD_MODE} --manifest-path=${CARGO_MANIFEST_PATH}"
> +# Sometimes --freeze fails because Cargo.lock needs to be modified
> +# without version changes. --offline can be used instead.
> +CARGO_USE_OFFLINE_FLAG ??= "0"
> +CARGO_BUILD_FLAGS = "-v ${@ '--frozen' if d.getVar('CARGO_USE_OFFLINE_FLAG') == '0' else '--offline'} --target ${RUST_HOST_SYS} ${BUILD_MODE} --manifest-path=${CARGO_MANIFEST_PATH}"

Maybe use
bb.utils.to_boolean(d.getVar("CARGO_USE_OFFLINE_FLAG"))
instead of
d.getVar('CARGO_USE_OFFLINE_FLAG') == '0'
?

  >  # This is based on the content of CARGO_BUILD_FLAGS and generally
will need to
>  # change if CARGO_BUILD_FLAGS changes.
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#210347): https://lists.openembedded.org/g/openembedded-core/message/210347
> Mute This Topic: https://lists.openembedded.org/mt/110874793/4316185
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [yoann.congal@smile.fr]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

-- 
Yoann Congal
Smile ECS - Tech Expert


