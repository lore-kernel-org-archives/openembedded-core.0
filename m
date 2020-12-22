Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web11.9616.1608630688218846788
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Dec 2020 01:51:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=OioPUVN5;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f43.google.com with SMTP id k10so1331863wmi.3
        for <openembedded-core@lists.openembedded.org>; Tue, 22 Dec 2020 01:51:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=w33mCN1jxtrEWERf7oY0vyhLMVA0Wx15futEUtNFi3o=;
        b=OioPUVN5PoLa7/Fy+LI60OOjK5Z9pywsjV/wugftjdk9gZo/cItc6mF/CTEtKaLS+h
         i+zFPuh2nZT4Jc8HB0/pDSoOjzrsf8Y/prbwMVi/0wAvC5K6WF7aHopRg0snlUXbQoa0
         HFeKs4qjLpLttdoDKNCdWsaePyOj2G3rh/YC8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=w33mCN1jxtrEWERf7oY0vyhLMVA0Wx15futEUtNFi3o=;
        b=KUFdL6Zjx349K9DuC38lhRgS1fP4bs3WvBmn9SG4sA9A0Ayc6NboNdzROr/Ov2hUyo
         EX+7Oo+sXGW4IirBCgOcHItvUQAFkqLV0JtjUZKol+sIjQO2dIfjA4k16DEWXTy+omCR
         gVFTxuJ8Hfm9S2OJgoZ+JjqBD9pKhje/A8+Tc92SgWhm+Z1zYTg31pkPmUbgU3O3mDIe
         tGkJcPin8svymP6u2OqyLaV23KFrB3qBQAwgpDSUAz/rcOft9G6a3R4FmqGkuV8PKpBl
         g5WQKZT5Wdoc2N2WpyqjCj0e99l0nbVQ0WWEFmPP6i+TvEnNk/+zKcFnb2Q9CE3bgXqj
         YACQ==
X-Gm-Message-State: AOAM532Fm3g4EMZkifTNzvPyUG+9BVFBy6jxdeY9HM1IJDSD1sSZ5fQv
	LncPA05x4MYA5JdenYZZEo/NOg==
X-Google-Smtp-Source: ABdhPJwGKOBeidv5YPaaMFZ/YNN8xLc/Cuzu0ckJ4gRalVs/nb5o88nmrEYWCRpqmNRyzHBz7hMXww==
X-Received: by 2002:a7b:cd91:: with SMTP id y17mr21081164wmj.5.1608630686733;
        Tue, 22 Dec 2020 01:51:26 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from b.b.4.9.2.e.e.0.9.c.7.7.e.d.7.6.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (b.b.4.9.2.e.e.0.9.c.7.7.e.d.7.6.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:67de:77c9:ee2:94bb])
        by smtp.gmail.com with ESMTPSA id h29sm33216152wrc.68.2020.12.22.01.51.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Dec 2020 01:51:26 -0800 (PST)
Message-ID: <036d635c9ab0f70b30df61bc65a53ce32de2f13e.camel@linuxfoundation.org>
Subject: Re: [OE-core] [meta-oe][PATCH v5] net-tools: split mii-tool into its own package
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Sinan Kaya <okaya@kernel.org>, openembedded-core@lists.openembedded.org
Date: Tue, 22 Dec 2020 09:51:25 +0000
In-Reply-To: <20201216224837.29524-1-okaya@kernel.org>
References: <20201216224837.29524-1-okaya@kernel.org>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2020-12-16 at 22:48 +0000, Sinan Kaya wrote:
> Move the mii-tool into its own package. Useful for size constrained
> systems that only want the mii-tool only.
> 
> Signed-off-by: Sinan Kaya <okaya@kernel.org>
> ---
>  .../net-tools/net-tools_1.60-20181103.bb          | 15 ++++++++++++++-
>  1 file changed, 14 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-extended/net-tools/net-tools_1.60-
> 20181103.bb b/meta/recipes-extended/net-tools/net-tools_1.60-
> 20181103.bb
> index e97731073e8..1784bf9ec24 100644
> --- a/meta/recipes-extended/net-tools/net-tools_1.60-20181103.bb
> +++ b/meta/recipes-extended/net-tools/net-tools_1.60-20181103.bb
> @@ -107,4 +107,17 @@ python __anonymous() {
>  }
>  ALTERNATIVE_PRIORITY = "100"
>  
> -BBCLASSEXTEND = "native nativesdk"
> +NETTOOLS_PACKAGES = "${PN}-mii-tool"
> +
> +PACKAGE_BEFORE_PN = "${NETTOOLS_PACKAGES}"
> +RDEPENDS_${PN} += "${NETTOOLS_PACKAGES}"
> +
> +FILES_${PN}-mii-tool = "${base_sbindir}/mii-tool"
> +
> +ALTERNATIVE_${PN}_remove = "mii-tool"
> +
> +ALTERNATIVE_${PN}-mii-tool = "mii-tool"
> +ALTERNATIVE_TARGET[mii-tool] = "${base_sbindir}/mii-tool"
> +ALTERNATIVE_LINK_NAME[mii-tool] = "${base_sbindir}/mii-tool"
> +
> +BBCLASSEXTEND = "native nativesdk"

I'm still trying to work through testing of these. This one seems to
result in:

https://autobuilder.yoctoproject.org/typhoon/#/builders/23/builds/3077/steps/11/logs/warnings

which is from net-tools-native.

NETTOOLS_PACKAGES_class-native = ""

may be the neatest fix for that I can think of offhand.

Cheers,

Richard





