Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web12.4907.1622787652268038700
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Jun 2021 23:20:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=aUAKrL/6;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f46.google.com with SMTP id l2so8102060wrw.6
        for <openembedded-core@lists.openembedded.org>; Thu, 03 Jun 2021 23:20:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=BxNw43D8o+yq3/pyDP8xue6ggpQ+++DvApR67KWBvYs=;
        b=aUAKrL/68dR5U8U0hUqY01aBBzgoXZpg5nw8Kd5r6dgsy7q+dLl/GCwvnLQ/f0iwR4
         QzMHO7Kp2cfmPpmUPPinLinfuNyXuEZvDam6bFqIcHjNf0SLWijWNWyl/RDUZl0Z4Kmz
         UTjvsSADPhhpVSAA7cwaeM2Me/bBmgPg0Z/BE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=BxNw43D8o+yq3/pyDP8xue6ggpQ+++DvApR67KWBvYs=;
        b=jdTOmZi12yVP0DhkhVIxi51wfYh84wHmkdrzP6zPpim1hQv1c0saqZvakSCXdfJECD
         aeH8V82ID+ulAuQZLbOoOuQmq8MlYofsmsZWVgpSSYighEWs3ghge6xlPRweJ1TLaI8Z
         my6d028SS6uV/ZtnEJkeY3j0Itri0nPQRHHj8XiXTUShj9c8xYnX46oS0puI0ug9jUwo
         ItelsmfQWWHrBzOFTpTetsQDw9PRe5a86f8rFJ7KcmvsqKpVfPE9JxTyqWibptGJT7CD
         ty0Cqrq81hPhuxSCG0nYD4ToseJ5Z5nV/4tKtCg0he+cYL3Ne5nXi8umFW/uA6HZW0Zs
         s5mg==
X-Gm-Message-State: AOAM530A+5FMY+VmEc+0JywSYW4fF1riosikE1BxYKFSWmM62anYOV2V
	IJBOUFFelr+Km0drxKevUW0J4Q==
X-Google-Smtp-Source: ABdhPJxu7PeI9x6A0apoYxrFULY31I01Yx+IHa6EO46LUQNY5ju9dzDawRtmdvztMBvYY3PxsnYhaw==
X-Received: by 2002:a5d:4346:: with SMTP id u6mr2039561wrr.304.1622787650915;
        Thu, 03 Jun 2021 23:20:50 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:1fce:265d:903f:2948? ([2001:8b0:aba:5f3c:1fce:265d:903f:2948])
        by smtp.gmail.com with ESMTPSA id f7sm4755763wmq.30.2021.06.03.23.20.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jun 2021 23:20:50 -0700 (PDT)
Message-ID: <96b9bce469e6cdcc86165ff9abb4ced53d4f8444.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 2/3] recipes-bsp/u-boot: Allow deploying the u-boot DTB
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Alistair Francis <alistair.francis@wdc.com>, 
	openembedded-core@lists.openembedded.org
Cc: raj.khem@gmail.com, alistair23@gmail.com
Date: Fri, 04 Jun 2021 07:20:47 +0100
In-Reply-To: <20210602232104.3490139-2-alistair.francis@wdc.com>
References: <20210602232104.3490139-1-alistair.francis@wdc.com>
	 <20210602232104.3490139-2-alistair.francis@wdc.com>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2021-06-03 at 09:21 +1000, Alistair Francis wrote:
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  meta/classes/uboot-config.bbclass  | 4 ++++
>  meta/recipes-bsp/u-boot/u-boot.inc | 7 ++++++-
>  2 files changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/classes/uboot-config.bbclass b/meta/classes/uboot-config.bbclass
> index 3bba02828b..6444f58437 100644
> --- a/meta/classes/uboot-config.bbclass
> +++ b/meta/classes/uboot-config.bbclass
> @@ -71,6 +71,10 @@ UBOOT_MKIMAGE_SIGN ?= "${UBOOT_MKIMAGE}"
>  UBOOT_MKIMAGE_SIGN_ARGS ?= ""
>  SPL_MKIMAGE_SIGN_ARGS ?= ""
>  
> 
> 
> 
> +# Options to deploy the u-boot device tree
> +UBOOT_DTB ?= ""
> +UBOOT_DTB_BINARY ?= ""
> +
>  python () {
>      ubootmachine = d.getVar("UBOOT_MACHINE")
>      ubootconfigflags = d.getVarFlags('UBOOT_CONFIG')

I think this breaks other fitimage workflows:

https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/2185/steps/14/logs/stdio

(other selftests fails similiarly)

Cheers,

Richard


