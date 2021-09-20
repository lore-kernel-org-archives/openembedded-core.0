Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web10.10056.1632135436556813423
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Sep 2021 03:57:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=eA0r83vd;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f42.google.com with SMTP id d21so28332404wra.12
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Sep 2021 03:57:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=8mD9VXQUk4ly5moDFVxoN/mrm6MohWI4caWiwH2PakU=;
        b=eA0r83vdW8DYdNmGVbbs7bo6QZxoPQUU3Jfk5tWqkWMPJfwr5iZDvZqiQBvWMKao1b
         Zpu9YtrGYlJPlIA7VxAhsIyMKsnA69JobDCPhTjiIZ9J6CEr0hCmtxrj/ziAF2cLnI60
         5xOXocxk18vPTEUcFrnXkhSbgZvEq3AnNNGqI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=8mD9VXQUk4ly5moDFVxoN/mrm6MohWI4caWiwH2PakU=;
        b=z3dhplTPtRq7EnFjpdlygwDRv7r9HGIVAsiqIHA/xPCsijs+gpl6fBkhrkXbbH+Byd
         uZwa7jDnZDzQLOwQQuyJIONcg8VdcS0N9nmqjoopfzwDdeSMIfqd01WFgJF0vzQIkwQY
         Nu6rYb+q2iWq7BSHpoEfTnv3Qt3aO8BRuIuxBZ/4CNfPGEL0tPp5r9cVGr8g3nMSHpbY
         jDPFmK0LYQzdGASxFJzxrGqsjW2YCEKbkOZJCbLxcQ9R6BmF8yzzh48NyFk9+0V6VKgd
         Yg7hoaCOOVQNF3LVXR/N84cwuJgy5jTxJFrmWpTFSqF5Zz5InqKEbK3GJE6B+0oaHVuG
         t88w==
X-Gm-Message-State: AOAM532vPVl4Ynx8+GcH410TETaoaZk+ZxBm5FMkFKGttFPX81pzgQQX
	0GM8L9rIqIW1gp8K56M5AX6TKQ==
X-Google-Smtp-Source: ABdhPJzr6kcvW4OA2Ui+JOsEnO8w15/OftoJGCzXkVlI6X4L8Bhn3lfW7RwSwLhMOllsE2WDDzin+A==
X-Received: by 2002:a5d:69cb:: with SMTP id s11mr27486967wrw.228.1632135434776;
        Mon, 20 Sep 2021 03:57:14 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:7173:466e:b128:3e8b? ([2001:8b0:aba:5f3c:7173:466e:b128:3e8b])
        by smtp.gmail.com with ESMTPSA id a25sm18955606wmj.34.2021.09.20.03.57.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Sep 2021 03:57:14 -0700 (PDT)
Message-ID: <b38d915afcb3ddae8f582e106e880f960cc71f95.camel@linuxfoundation.org>
Subject: Re: [OE-core] [dunfell][PATCH] poky: fixes backwards compatible for the SDKPATHINSTALL
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Jose Quaresma <quaresma.jose@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Mon, 20 Sep 2021 11:57:12 +0100
In-Reply-To: <20210920100704.312573-1-quaresma.jose@gmail.com>
References: <20210920100704.312573-1-quaresma.jose@gmail.com>
User-Agent: Evolution 3.40.4-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2021-09-20 at 11:07 +0100, Jose Quaresma wrote:
> Previously the SDKPATH can be used to custumize the path
> of the SDK installation. Drop the SDKPATH and use SDKPATHINSTALL
> without that brokes backwards compatible for any distro with
> SDKPATH customized.
> 
> Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
> ---
>  meta-poky/conf/distro/poky.conf | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta-poky/conf/distro/poky.conf b/meta-poky/conf/distro/poky.conf
> index 5b54df874e..7dad7012ba 100644
> --- a/meta-poky/conf/distro/poky.conf
> +++ b/meta-poky/conf/distro/poky.conf
> @@ -24,7 +24,7 @@ DISTRO_FEATURES ?= "${DISTRO_FEATURES_DEFAULT} ${POKY_DEFAULT_DISTRO_FEATURES}"
>  PREFERRED_VERSION_linux-yocto ?= "5.4%"
>  
>  SDK_NAME = "${DISTRO}-${TCLIBC}-${SDKMACHINE}-${IMAGE_BASENAME}-${TUNE_PKGARCH}-${MACHINE}"
> -SDKPATHINSTALL = "/opt/${DISTRO}/${SDK_VERSION}"
> +SDKPATHINSTALL = "${SDKPATH}"
>  
>  DISTRO_EXTRA_RDEPENDS += " ${POKY_DEFAULT_EXTRA_RDEPENDS}"
>  DISTRO_EXTRA_RRECOMMENDS += " ${POKY_DEFAULT_EXTRA_RRECOMMENDS}"

Distros need to switch to use SDKPATHINSTALL. 

This change breaks the poky default value instead of any distro that has
customised and disables the SDK hard coded path fix which was the original point
of the change.

Cheers,

Richard




