Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 235DBC433F5
	for <webhook@archiver.kernel.org>; Thu, 13 Jan 2022 15:26:16 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web08.10280.1642087575307672393
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Jan 2022 07:26:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=THNMJsdQ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.42,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f42.google.com with SMTP id o3so10732589wrh.10
        for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Jan 2022 07:26:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=N3/i+K2mN1sAjlscQ97oj0uAq/Ry/Q59DeGZUD4mWVA=;
        b=THNMJsdQc5CD6blnmmTd85abC8QNC6lO5BljYju37s31e2GQaszWbPkddiIrq9GITP
         2DdnQZOGD2+ijZPei+ZY+YalhUJCuwEnGU82W1IEkm1XWv558wTaCHncypp4/q844zVv
         1gcEQb4R9nfbhlpUK+W0YMFEXjmSRYAVDlYjU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=N3/i+K2mN1sAjlscQ97oj0uAq/Ry/Q59DeGZUD4mWVA=;
        b=t/tAGcRcUrqFQjxtt8YK6fHrZsRfe0W5Bifs2qstQHDSzvV2Zb8Bw3zgo40V1gWh2y
         fPf3mjKAkVmgfAETeJyE+/Tz7o73w8HB6oM3wgoOxT+AVLEfn3V7iPh8e81029J+nVab
         8iOJU7q/KqcO4WJ9JboOoJrxV+iyklt6Z7EcdO9353/0BN0mymKT+Ff6Xz3Z/8GfhJE7
         f7eJt9trneqgxVczy7si8M0oaMfKUqmYzuHb5nJ1M4gcydn2NSsbEg74GzV/NMn8f3f2
         3AWP0ueDes9DxE4DQDhkJSusC3M/gWw3THRRzK4l/pncDqJuDjvKR5xK7pmEzvXxGkVL
         vOXQ==
X-Gm-Message-State: AOAM5335VB7F6XxDoBUgtq77xJC2y62znXRVyL7tyqxcBlhIPhrpD6Gy
	48wtA0+QNYdVHKwplVTsTxDf5A==
X-Google-Smtp-Source: 
 ABdhPJwroIgGT9qbwuNhY8ap//bep/bgwcT/ZOsTCkzlRbzIqsLg8Tw4aTTw3bX3e1b1WvG3WCqNiA==
X-Received: by 2002:a5d:59af:: with SMTP id p15mr4414274wrr.237.1642087573576;
        Thu, 13 Jan 2022 07:26:13 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:5c73:f637:3634:b28d?
 ([2001:8b0:aba:5f3c:5c73:f637:3634:b28d])
        by smtp.gmail.com with ESMTPSA id
 u16sm2771162wrn.24.2022.01.13.07.26.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jan 2022 07:26:13 -0800 (PST)
Message-ID: 
 <ba495e2870d62f9445d0c5f43da51cc2aba41527.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] nghttp2: fix for multilib support
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Changqing Li <changqing.li@windriver.com>,
	openembedded-core@lists.openembedded.org
Date: Thu, 13 Jan 2022 15:26:12 +0000
In-Reply-To: <20220113034439.19018-1-changqing.li@windriver.com>
References: <20220113034439.19018-1-changqing.li@windriver.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Jan 2022 15:26:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160524

On Thu, 2022-01-13 at 11:44 +0800, Changqing Li wrote:
> From: Changqing Li <changqing.li@windriver.com>
> 
> correct the package name
> 
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
>  meta/recipes-support/nghttp2/nghttp2_1.46.0.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/recipes-support/nghttp2/nghttp2_1.46.0.bb b/meta/recipes-support/nghttp2/nghttp2_1.46.0.bb
> index 972ff2d60a..a5f0be856f 100644
> --- a/meta/recipes-support/nghttp2/nghttp2_1.46.0.bb
> +++ b/meta/recipes-support/nghttp2/nghttp2_1.46.0.bb
> @@ -19,7 +19,7 @@ PACKAGECONFIG[manpages] = ""
>  # first place
>  EXTRA_OECMAKE = "-DENABLE_EXAMPLES=OFF -DENABLE_APP=OFF -DENABLE_HPACK_TOOLS=OFF"
>  
> -PACKAGES =+ "lib${PN} ${PN}-client ${PN}-proxy ${PN}-server"
> +PACKAGES =+ "lib${BPN} ${PN}-client ${PN}-proxy ${PN}-server"
>  
>  RDEPENDS:${PN} = "${PN}-client (>= ${PV}) ${PN}-proxy (>= ${PV}) ${PN}-server (>= ${PV})"
>  RDEPENDS:${PN}:class-native = ""
> @@ -27,7 +27,7 @@ RDEPENDS:${PN}-proxy = "openssl python3-core python3-io python3-shell"
>  
>  ALLOW_EMPTY:${PN} = "1"
>  FILES:${PN} = ""
> -FILES:lib${PN} = "${libdir}/*${SOLIBS}"
> +FILES:${MLPREFIX}lib${BPN} = "${libdir}/*${SOLIBS}"
>  FILES:${PN}-client = "${bindir}/h2load ${bindir}/nghttp"
>  FILES:${PN}-proxy = "${bindir}/nghttpx ${datadir}/${BPN}/fetch-ocsp-response"
>  FILES:${PN}-server = "${bindir}/nghttpd"

This doesn't look correct, particularly using with MLPREFIX in one location and
not in the other...

Cheers,

Richard


