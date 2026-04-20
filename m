Return-Path: <mhalstead@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 724F3F5A8CE
	for <webhook@archiver.kernel.org>; Mon, 20 Apr 2026 23:11:54 +0000 (UTC)
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6314.1776723787305092789
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Apr 2026 15:23:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20251104.gappssmtp.com header.s=20251104 header.b=rmkrDYNk;
 spf=pass (domain: baylibre.com, ip: 209.85.160.170, mailfrom: dlechner@baylibre.com)
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-50d7c12e48eso38049571cf.1
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Apr 2026 15:23:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1776723786; x=1777328586; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=en4sgSQAk+py8v0pNMYgluj7M8GwojkdYx+UQVSMgBQ=;
        b=rmkrDYNkx8pvRtwgwa85HQc8+Dd9aTKbiHVd+EIfH8bnMLBX631F3vH1Ct3XPQozmP
         AXF5QmIEMAFNEEwcLZQVJSvEjR4UpuU+B9M1jCpfnSbFp3Av8nOtYQtipa/S2g64cbUN
         M7wsq+2HIQS1UDy5wzp2dmC8C1B6jJG1R2+AL1D73T82vC8C16ETlGb68AV3kjVodYB1
         7u/K4igq3ATj7a4zQTXfwdjl3BejXNyVE1/FyW4arQ0ZNaQT4PNH2mV7q4n8+SLr7hFC
         CmldklnB8feCE2dbKYLAPQSPvklcUKCXQTlGkpRvZafdVlswkW8gaZKzJSR1fZ/6CAfI
         7qeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776723786; x=1777328586;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=en4sgSQAk+py8v0pNMYgluj7M8GwojkdYx+UQVSMgBQ=;
        b=nJJQ1xxoKoF8NRgYGc33I0ONAf0woganlCM09rDbiXEDLip6djw34//LTkYH8z+lya
         8M+AX8YbTB4bCzKb2GMifnh16wXgRhLYG6nJYM2xSAm5UixztZXgiDimYJi8ZSnjTWga
         w8+HDv6ziIQkDxl0F+Yg/w652K5U3uvhWN7/kFiYl3oiaoaj3dFeHxBUkj08s7onVX4b
         yQnsCZfKSeUe7DBR8RWxVQ0UyfLicLA+FOWQEjwe89KX6jz9FWAXs9RhyyJN3ZN5b3Fi
         mSrBMPn0nmXhX6WyQg9tKHu9Zbsb4mdXQtCLQUaFAeV04tlmOhb8UUgiPVdWMwTCp8Lp
         bj9w==
X-Forwarded-Encrypted: i=1; AFNElJ8f88vJytC1bwlTnZR850nmYKJT0odPr10lFDALrHg1Z+ZNZQzWRexrZesG/z5nqqUNeyu02ULeJ/uprLZqVlU6EA==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yz8dCcou3hc3vY9rJngeVRZ0yZWetu3Tn/vWjyKB3KO477B+dBM
	STzc1dk1q3hHZ2NyEKyTau9hGB3SKTN7KdbUPkL0t5XYtBK5AIjG/R8MAJGOcYln0PORHMOh1hV
	69pmU
X-Gm-Gg: AeBDiessDNB3dyb4cXiIery5Hr3tb3ZUiz17RFq7PhDLcwUTXeNXMjE1HbqOZSyxcvg
	LCIGVd/Aob8kI1tuvbBTVH1OBGZx3++Hjaxl74l9RhvFtPgQXrJOspDvd43LvLHniHUhbmUFm2b
	hFIefqPZhipyB/VDTPBixGpYGr5NG9o6sNYgm+I14iFstxhj8QyO9GdakpnarUATDjxgxAfsTE5
	ljeBJc1Ob5r5qPovF+K8UNZfzJlkxrzAMVI1p7aZvN+BNGgcV19vZpslGb0O+MHPWk/YZ+jCL18
	nf4IiydpkEELDaOUnlCJdZpEfFK4vb44g4yqU7omEhZOgvcJlkrYeKsA02HABfNBbq+oUPhqdQd
	WErXoiIo08ucym53gPHY2ZOUc1tRamR+fqTSnrAXWCXcZ8i7MEcbPWS2X8i48CeLjH3NlfzuKzg
	iV0LjVQzCIgF4vNgRjYYT7WozNDN7dHOyaDOfNbaReBF8//KIsC5XFrK2nyeteksT1XQRhaUb0E
	V4Z7Z4AiM4+
X-Received: by 2002:a05:6820:f09:b0:67c:28d6:430e with SMTP id 006d021491bc7-6946385f12emr7168804eaf.28.1776723302710;
        Mon, 20 Apr 2026 15:15:02 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:49fb:b337:a968:94e7? ([2600:8803:e7e4:500:49fb:b337:a968:94e7])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-694984114f5sm33315eaf.7.2026.04.20.15.15.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Apr 2026 15:15:02 -0700 (PDT)
Message-ID: <61daa047-74f0-4a76-a61f-de54ca4b716e@baylibre.com>
Date: Mon, 20 Apr 2026 17:15:01 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] tools: mkeficapsule: Add disable pkcs11 menu option
To: Wojciech Dubowik <Wojciech.Dubowik@mt.com>, u-boot@lists.denx.de
Cc: Simon Glass <sjg@chromium.org>, Franz Schnyder <fra.schnyder@gmail.com>,
 trini@konsulko.com,
 "openembedded-core @ lists . openembedded . org"
 <openembedded-core@lists.openembedded.org>,
 Francesco Dolcini <francesco@dolcini.it>
References: <20260420083850.8504-1-Wojciech.Dubowik@mt.com>
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20260420083850.8504-1-Wojciech.Dubowik@mt.com>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Apr 2026 23:11:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235589

On 4/20/26 3:38 AM, Wojciech Dubowik wrote:
> Some distros are using gnutls library without pkcs11 support
> and linking of mkeficapsule will fail. Add disable pkcs11
> option with default set to no so distros can control this
> feature with config option.
> 
> Suggested-by: Tom Rini <trini@konsulko.com>
> Cc: Franz Schnyder <fra.schnyder@gmail.com>
> Signed-off-by: Wojciech Dubowik <Wojciech.Dubowik@mt.com>
> ---
> Changes in v2:
> - make use of stderr more consistent
> - add missing ifndef around pkcs11 deinit functions
> ---
>  tools/Kconfig        |  8 ++++++++
>  tools/Makefile       |  3 +++
>  tools/mkeficapsule.c | 17 ++++++++++++++++-
>  3 files changed, 27 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/Kconfig b/tools/Kconfig
> index ef33295b8ecd..ccc878595d3b 100644
> --- a/tools/Kconfig
> +++ b/tools/Kconfig
> @@ -114,6 +114,14 @@ config TOOLS_MKEFICAPSULE
>  	  optionally sign that file. If you want to enable UEFI capsule
>  	  update feature on your target, you certainly need this.
>  
> +config MKEFICAPSULE_DISABLE_PKCS11

Options that disable something instead of enabling it are confusing.
Can we make this MKEFICAPSULE_PKCS11 instead and invert the logic?

> +	bool "Disable pkcs11 support"
> +	depends on TOOLS_MKEFICAPSULE
> +	default n

I think it would be more convenient if we did not require PKS11 by
default. Otherwise, everyone using Open Embedded that doesn't have
the "p11-kit" PACKAGECONFIG option set for GnuTLS set (which is the
default) is going to get a build failure and have to research this
and find the option and modify their config to fix the build.

It seems like it would be better to make people who actually need
PKCS11 possibly get an error by default instead and enable the
option. This is pure speculation on my part, but it seems like
this would be the smaller group.

> +	help
> +	  Disable pkcs11 support. Can be used in cases when host GnuTLS
> +	  library doesn't support it.
> +
>  menuconfig FSPI_CONF_HEADER
>  	bool "FlexSPI Header Configuration"
>  	help

