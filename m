Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web10.266.1623873183745321208
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Jun 2021 12:53:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=iBpLpe64;
 spf=pass (domain: gmail.com, ip: 209.85.214.174, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f174.google.com with SMTP id v13so1664936ple.9
        for <openembedded-core@lists.openembedded.org>; Wed, 16 Jun 2021 12:53:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:organization:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=NUvlv4Iv68PXyyE5Ek8yjp5OEvvIgk7ajeotQSuOdpU=;
        b=iBpLpe64nggbfZLvD9mesqIBC0EHtdGMU1IJnSbAA2g8tvmC8fFMLwPrjoya1Pkz3Q
         cq/tin+zO4pTWXmik18cgbOaVXZ0E3qUV2mW862X2foFc1pfoi7mzbhm6muG/roOI52t
         5s0ps1pvSvkg/u2exQji+X0v3lQpx78OzbOMGhZgLqThDIRrUbEr2ykrOy7WAFw4/bjN
         mONcQH2WF/1PVPSYZ2Ncp9sPt7RVhl9T5PWWlej5/hJuQ2ZoFwF5+LJAadkuzrv44Ofy
         9uhE5tVkbVBhtbqKSEhZDPTyIWY4kM1Ac+y/+9PZg+hsUt67Jowv+Oq+diHVPJBZdm/h
         7fJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=NUvlv4Iv68PXyyE5Ek8yjp5OEvvIgk7ajeotQSuOdpU=;
        b=sapKEp7qOzDTwKrAyQ5xoUBBh8yXXcG3H6+TCXnD07SpEExQ2RezdHPaZPrbRb1I40
         nhKD+TNj29ymwOT/QI4ve+NXtkqHtSkKUMyqGkp+550IMvN6E7XEJrfLw/Zof81hgHff
         MwrHOgQCgwaQVmE+KuROC+EO0uJLSwEPk4xmOmRrpbBS8F5OnkjxLw8hNFZ47YgSZHSg
         sMubXNnEKbFM+KP/XndzxuwKw9kFtep5IXdyZe3QsMK1EEDhOemXzgvGtlRexBXsqMpk
         i0PS/gBojmEePxfUIZBsKtwjLTyvMylTAnl0wqt41jKyjG86h86COILvXkyzJKU2SjJ/
         qNAQ==
X-Gm-Message-State: AOAM5332cbOt6EtqaOrELhfikdqksVYqSYUf/3O2B2legGbGW4x5cOvB
	Z3+7bMhdaCzDgu8JbTgI6MDMzMSmn3g4Zg==
X-Google-Smtp-Source: ABdhPJzB7zOb7Lo/lO+LOV5xvsFKce6n51r1n5Ep2V4YYLep6ZMcZoESZobusRAEXQ0h1+NIozQYJw==
X-Received: by 2002:a17:902:d50e:b029:11e:a837:7106 with SMTP id b14-20020a170902d50eb029011ea8377106mr1112326plg.70.1623873182674;
        Wed, 16 Jun 2021 12:53:02 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:a0f0:3db2:672f:771a:8c47? ([2601:646:9200:a0f0:3db2:672f:771a:8c47])
        by smtp.gmail.com with ESMTPSA id z185sm3159803pgb.4.2021.06.16.12.53.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Jun 2021 12:53:02 -0700 (PDT)
Subject: Re: [OE-core] [PATCH] Use the built-in options for removing pack tools
To: ed@tanous.net, openembedded-core@lists.openembedded.org
References: <20210616181956.2849161-1-ed@tanous.net>
From: "Khem Raj" <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <d5b39f48-faca-04f7-a9e7-d000f962703e@gmail.com>
Date: Wed, 16 Jun 2021 12:53:01 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210616181956.2849161-1-ed@tanous.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 6/16/21 11:19 AM, ed@tanous.net wrote:
> From: Ed Tanous <ed@tanous.net>
> 
> For distros that want to use the ENABLE_LIB_ONLY option, the rm call
> will fail, because ENABLE_HPACK_TOOLS (set implicitly as part of
> ENABLE_LIB_ONLY) removes those two binaries from the build, so they then
> can't be removed again.  This commit sets ENABLE_HPACK_TOOLS=OFF, which not
> only allows for the option to be overridden in other meta layers, also
> allows a simplified use of ENABLE_LIB_ONLY in meta layers that don't
> want to ship the binaries.
> 
> Signed-off-by: Ed Tanous <ed@tanous.net>
> ---
>   meta-networking/recipes-support/nghttp2/nghttp2_1.43.0.bb | 6 +-----
>   1 file changed, 1 insertion(+), 5 deletions(-)

Thanks for this patch, this is wrong list for meta-openembedded patches, 
please send meta-openembedded patches to 
openembedded-devel@lists.openembedded.org ml

> 
> diff --git a/meta-networking/recipes-support/nghttp2/nghttp2_1.43.0.bb b/meta-networking/recipes-support/nghttp2/nghttp2_1.43.0.bb
> index 959cccf35..08b855262 100644
> --- a/meta-networking/recipes-support/nghttp2/nghttp2_1.43.0.bb
> +++ b/meta-networking/recipes-support/nghttp2/nghttp2_1.43.0.bb
> @@ -18,11 +18,7 @@ PACKAGECONFIG[manpages] = ""
>   
>   # examples are never installed, and don't need to be built in the
>   # first place
> -EXTRA_OECMAKE = "-DENABLE_EXAMPLES=OFF -DENABLE_APP=ON"
> -
> -do_install_append() {
> -	rm ${D}${bindir}/deflatehd ${D}${bindir}/inflatehd
> -}
> +EXTRA_OECMAKE = "-DENABLE_EXAMPLES=OFF -DENABLE_APP=ON -DENABLE_HPACK_TOOLS=OFF"
>   
>   PACKAGES =+ "lib${PN} ${PN}-client ${PN}-proxy ${PN}-server"
>   
> 
> 
> 
> 
> 
