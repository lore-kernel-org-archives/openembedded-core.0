Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web08.6481.1628068451517937846
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Aug 2021 02:14:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=QWh4ujY5;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f44.google.com with SMTP id f9-20020a05600c1549b029025b0f5d8c6cso3413697wmg.4
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Aug 2021 02:14:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=C1rQ76u6LbvjM6SZuyQC4gKfddca8DPujyIGLwALkHE=;
        b=QWh4ujY5Y9/CcGUyRLQ5n/ito7S3/qGqXAbd+bUujrI6oXCfGFRKkyZ77tyHPnpvp0
         SBg2UIReq6L/YaMgexqPgP+uOMn1rXk1RikRoax/BE3LzveJk428XHimchlpFFCs7w6h
         Ai9mwD+DqIEfK50DWLku3q5sOZo2Qj2XA7568=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=C1rQ76u6LbvjM6SZuyQC4gKfddca8DPujyIGLwALkHE=;
        b=bmjL4y/igKcGVSKMWMfGlAE76UHrtJHJa/iwnayKR6M+7QpMzpZu6RR/L6lGU8+7ci
         EgJFrfEDIP7dpJIlDFzTB0veFT/fzldpDrU9Y6dfSmqbS+I/Nt7+pTnistfWqN7wMPDC
         EWvwZcm15dVHXOXaPlvaztDDf1W39uIlO3LQeMWXe2nfUX0hHht9PxYZkPGveXv1ERw4
         VRLXLcboG7jOA7P8bnQBzntgjVfvLjXCV/zKozFGzkGd3Ut1PPqBwnn1rAFtsMvdMYhF
         3DDfJGAX6sKFoYqH1bECIpmHsoTy5JXXcOhz28Z5jbR3vhoMp40FWwPnNuNabjIDwm+8
         giqQ==
X-Gm-Message-State: AOAM532SpMHCJIpYsJiwCtVpAQUVQCZ24Ti0kbwwhesx9EnnyXQH5A6C
	CBNX3XbMiiRd0mDtsmQbbrpBqA==
X-Google-Smtp-Source: ABdhPJzEFqkvOzhCXRLyIdHG7ax1S5ai4wcJ8yJAlpGCzwz4dFSHDgh6fE5wd43dIX5kPTa3zyTNow==
X-Received: by 2002:a7b:c204:: with SMTP id x4mr26198896wmi.70.1628068449732;
        Wed, 04 Aug 2021 02:14:09 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:895b:15d0:6c2e:72fa? ([2001:8b0:aba:5f3c:895b:15d0:6c2e:72fa])
        by smtp.gmail.com with ESMTPSA id y192sm5193766wmy.1.2021.08.04.02.14.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Aug 2021 02:14:09 -0700 (PDT)
Message-ID: <86428792d60b490da1569e53bf1356845e075b40.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] qemu: Fix DHCP broken in libslirp
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: qiang.zhang@windriver.com
Cc: openembedded-core@lists.openembedded.org
Date: Wed, 04 Aug 2021 10:14:07 +0100
In-Reply-To: <20210804062436.9313-1-qiang.zhang@windriver.com>
References: <20210804062436.9313-1-qiang.zhang@windriver.com>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2021-08-04 at 14:24 +0800, qiang.zhang@windriver.com wrote:
> From: Zqiang <qiang.zhang@windriver.com>
> 
> Fix issue 48
> Reference to upstream patch:
> https://gitlab.freedesktop.org/slirp/libslirp/-/commit/c9f314f6e315a5518432761fea864196a290f799
> 
> Signed-off-by: Zqiang <qiang.zhang@windriver.com>
> ---
>  meta/recipes-devtools/qemu/qemu.inc           |  1 +
>  ...1-Fix-DHCP-broken-in-libslirp-v4.6.0.patch | 32 +++++++++++++++++++
>  2 files changed, 33 insertions(+)
>  create mode 100644 meta/recipes-devtools/qemu/qemu/0001-Fix-DHCP-broken-in-libslirp-v4.6.0.patch
> 
> diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
> index 3921546df7..bed175e59d 100644
> --- a/meta/recipes-devtools/qemu/qemu.inc
> +++ b/meta/recipes-devtools/qemu/qemu.inc
> @@ -57,6 +57,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
>             file://CVE-2020-27821.patch \
>             file://CVE-2021-20263.patch \
>             file://CVE-2021-3392.patch \
> +           file://0001-Fix-DHCP-broken-in-libslirp-v4.6.0.patch \
>             "
>  UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
>  
> 
> 
> 
> 
> 
> 
> 
> diff --git a/meta/recipes-devtools/qemu/qemu/0001-Fix-DHCP-broken-in-libslirp-v4.6.0.patch b/meta/recipes-devtools/qemu/qemu/0001-Fix-DHCP-broken-in-libslirp-v4.6.0.patch
> new file mode 100644
> index 0000000000..480dcee05e
> --- /dev/null
> +++ b/meta/recipes-devtools/qemu/qemu/0001-Fix-DHCP-broken-in-libslirp-v4.6.0.patch
> @@ -0,0 +1,32 @@
> +From c9f314f6e315a5518432761fea864196a290f799 Mon Sep 17 00:00:00 2001
> +From: Akihiro Suda <akihiro.suda.cz@hco.ntt.co.jp>
> +Date: Thu, 17 Jun 2021 18:01:32 +0900
> +Subject: [PATCH] Fix "DHCP broken in libslirp v4.6.0"
> +
> +Fix issue 48
> +Reference to upstream patch:
> +https://gitlab.freedesktop.org/slirp/libslirp/-/commit/c9f314f6e315a5518432761fea864196a290f799

This needs to be in our standard form (Upstream-Status:).

Cheers,

Richard


