Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D7B7C0219B
	for <webhook@archiver.kernel.org>; Mon, 10 Feb 2025 00:32:23 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web11.40692.1739147537265887012
 for <openembedded-core@lists.openembedded.org>;
 Sun, 09 Feb 2025 16:32:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=eqBsMj9C;
 spf=pass (domain: smile.fr, ip: 209.85.221.54, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-38dd0dc21b2so995547f8f.2
        for <openembedded-core@lists.openembedded.org>; Sun, 09 Feb 2025 16:32:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1739147536; x=1739752336; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:organization:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ECzcvmdXzhdjR36NiW+boJBSOsv9mAYlJG6yj1eVJaw=;
        b=eqBsMj9CpbnJSwGlBqhJD1VVH+SExSovHUlpPt00wTNiNuYLNIzCZoRhvnDw2d8h2Z
         tnO80k90pdLwPjzep4uBHvj6eJ03eSntgubagkQijikuGW3bDTe70yC7CGiARAjzQ7J+
         CP7AXPvLDQu7qx5cKbiwTnRsfNI1c7ydlGNRA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739147536; x=1739752336;
        h=content-transfer-encoding:in-reply-to:organization:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ECzcvmdXzhdjR36NiW+boJBSOsv9mAYlJG6yj1eVJaw=;
        b=PxrhKOPIOu4C0UokY3MPMc/KKXIfb5ddbtM99kXIymYdPgBskGM2sv5r0e+bhTBOcc
         xso4DWfX1FW71ffuPLnjvA/52PPDcQ3CsaL6cuwNbWOlTL01NhvWsvKuSttmZYjXHdiK
         Lc5M83hW8tPbNjmMQ8shJ7MZDt5QOAh4Z/cOQ9WVP6va7glk2HW7yOU1/ZS84o93hD+f
         wBoo32EYNsu5qL6pdPJFL/BhpWlT9bjPmwv5itCLaalgJ7PSrPdukaNOE9UBrQAjoO0E
         FHlXSHMGMb+/tPXYZ6D+njcCeBDGHCMtDDACeHtG41HW8GbOihImJgHvEePGcc0B7IFo
         RbUg==
X-Gm-Message-State: AOJu0Yxrh7KDdmEgIhEmwHEeITcj4jveFQLiYyqP3vtQ2evkQil5Ne4k
	D3zOnL95tieqDVN1Dda7b1GULTxSPnZqSoSijRsUym+rgHhajVvMW/doqzT3b2s=
X-Gm-Gg: ASbGncvYbOP1fdAtLWRHJBXY1HYFvNi1gn69GWTwyyqcc4bn76QLSruBBvtmct/nc83
	4H/lL/+ZILWGtWtguC0MUUtej/h8InXKbUM56YfeZccdD1SkdL2+ofPM9WwdkPfafCEZZ/bOpXU
	ZjjLdz0A+P36traKxXoB6mSnM5gxSmgpv3CnBuKaI1R05aIIyBf01HxQuFgYxcTaCfahihNqCW6
	lnN/sz5GEt4nP8rJmhdSxOwtlLoIUUjvoxiRP8VpAW6t3KGGu0PX7kDaNvm16wzjaC2H0wLhu6p
	k/yQBJWTCJoq3uWHer1alJUo/suOyCyQ1ThZjHyP0fqLd9P2VbvXkYyU6yUF4YAIbr0KpZeOAQ+
	bGH9FcW8Tc6WQSjtoGx7MXFJg3dyLld6C/X1pxButrLHLi6sPgPxO
X-Google-Smtp-Source: AGHT+IF7/0aPluyzM++1FVEFgWx4lSxJISpxZslZsjCboD/M8CyHcu/v8jCRTAGJeuMaAtZMEnZ14Q==
X-Received: by 2002:a5d:5f83:0:b0:38b:ed1c:a70d with SMTP id ffacd0b85a97d-38dc891fbdcmr6725664f8f.0.1739147535633;
        Sun, 09 Feb 2025 16:32:15 -0800 (PST)
Received: from ?IPV6:2a01:cb00:dee:f000:367a:1a7f:22ad:d27b? (2a01cb000deef000367a1a7f22add27b.ipv6.abo.wanadoo.fr. [2a01:cb00:dee:f000:367a:1a7f:22ad:d27b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dc9ce31e8sm8212493f8f.5.2025.02.09.16.32.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 09 Feb 2025 16:32:15 -0800 (PST)
Message-ID: <3a2b8b2b-c198-46a3-962d-073c5cf30057@smile.fr>
Date: Mon, 10 Feb 2025 01:32:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 4/5] poky-alt: switch preferred kernel to 6.12
To: bruce.ashfield@gmail.com, richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
References: <cover.1739145061.git.bruce.ashfield@gmail.com>
 <dbc453ced8c538af94f7ab658b64dc071e1173a2.1739145061.git.bruce.ashfield@gmail.com>
Content-Language: en-US
From: Yoann Congal <yoann.congal@smile.fr>
Organization: Smile ECS
In-Reply-To: <dbc453ced8c538af94f7ab658b64dc071e1173a2.1739145061.git.bruce.ashfield@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Feb 2025 00:32:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211071

Hi Bruce,

Le 10/02/2025 à 00:56, Bruce Ashfield via lists.openembedded.org a écrit :
> From: Bruce Ashfield <bruce.ashfield@gmail.com>
> 
> 6.6 is being removed from the upcoming LTS release, so we
> adjust the alt config to use the 6.12 reference.
> 
> Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> ---
>  meta-poky/conf/distro/include/poky-distro-alt-test-config.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta-poky/conf/distro/include/poky-distro-alt-test-config.inc b/meta-poky/conf/distro/include/poky-distro-alt-test-config.inc
> index 3e10251e8b..a24d5e15ab 100644
> --- a/meta-poky/conf/distro/include/poky-distro-alt-test-config.inc
> +++ b/meta-poky/conf/distro/include/poky-distro-alt-test-config.inc
> @@ -2,7 +2,7 @@
>  DISTRO_FEATURES:append = " pam usrmerge"
>  
>  # Use our alternate kernel version
> -PREFERRED_VERSION_linux-yocto = "6.6%"
> +PREFERRED_VERSION_linux-yocto = "6.1%"

Shouldn't this read
PREFERRED_VERSION_linux-yocto = "6.12%"
(a missing "2") ?

>  
>  # Ensure the kernel nfs server is enabled
>  KERNEL_FEATURES:append:pn-linux-yocto = " features/nfsd/nfsd-enable.scc"
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#211061): https://lists.openembedded.org/g/openembedded-core/message/211061
> Mute This Topic: https://lists.openembedded.org/mt/111094343/4316185
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [yoann.congal@smile.fr]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

-- 
Yoann Congal
Smile ECS - Tech Expert


