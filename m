Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50536C433F5
	for <webhook@archiver.kernel.org>; Tue,  1 Mar 2022 07:59:14 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web10.5909.1646121552788370984
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Feb 2022 23:59:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=iaAnOXMF;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.43,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f43.google.com with SMTP id
 k29-20020a05600c1c9d00b003817fdc0f00so835888wms.4
        for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Feb 2022 23:59:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=qrCXNX9w9l/J9toiwevIwc/OmmKoWovjLpK3hGhOTjU=;
        b=iaAnOXMF6Rwh9j3rt7U21U/Ad9CbXtqH5SyV1a26mdL/d7Gj/wYoxuHgtOysqdOB6x
         e58SlDQvJ5DzVxF+Bmt0tTqFmRLAro+7O73y8qA7EqUWkqZSp65gzPXJVLQhuhPN5pNx
         q7IQCJ4n7mL+rxMrvf1egeTyGRGATRz5x3YE8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=qrCXNX9w9l/J9toiwevIwc/OmmKoWovjLpK3hGhOTjU=;
        b=tP4TbeXWDgx4SWOqei7llsps7OioDaNzUnnDdpiEzZgzXRiuiSOCVRSrNm4bv9kdNk
         LDeki5qKOXwrycvmsGHC3hrLxRsNyw2rpBbcHrBjXuyVr2AQAXdhr8k4TqFC7ndaXu+W
         6udACz90v50KDXyKvkWbZtrVXgSt+nkDvtX3cmOEljpRefbqy11sMm2CPvB//3aaVUDa
         fuAQYFxsSPWXzs/jJJnszPwj+w3dsiJdZqVCa3ykSnkuV3EEQVw2bWGaTqOECMfjEkUB
         D4Sp3x2v+XBtpgI5vboWleoRQDqXTlb4bi/vsE5HXERtx6nFC0Pe3EhfpzDP49lIfIFC
         AIQA==
X-Gm-Message-State: AOAM533GCZDGineI3PNBk48IEj5hRwzhhKI/8GBgzuYYDJLJ+P/kDmpC
	VHN76R5CoIuRcZVoNpFtYGJNDaNU+ti4AjJu
X-Google-Smtp-Source: 
 ABdhPJxm8Q1G/Z7D1KY/2mRBDiWgZUDx0l4Q0g9Q+ag6YSFdCnE7UPWfSftIMj1Tim8nsBtZCaC4yQ==
X-Received: by 2002:a05:600c:a03:b0:37b:daff:6146 with SMTP id
 z3-20020a05600c0a0300b0037bdaff6146mr16201661wmp.85.1646121551032;
        Mon, 28 Feb 2022 23:59:11 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:5f88:ec89:14b:c380?
 ([2001:8b0:aba:5f3c:5f88:ec89:14b:c380])
        by smtp.gmail.com with ESMTPSA id
 m5-20020a05600c3b0500b00380da3ac789sm1875224wms.1.2022.02.28.23.59.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Feb 2022 23:59:10 -0800 (PST)
Message-ID: 
 <6e3a32402d372d518e6c4bce86f54f4791aa5081.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 1/1] coreutils: fix statx failure on native
 builds
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Robert Yang <liezhi.yang@windriver.com>,
	openembedded-core@lists.openembedded.org
Date: Tue, 01 Mar 2022 07:59:09 +0000
In-Reply-To: 
 <373dcd3613b74ba10dba54f5116576bc172c222f.1646119426.git.liezhi.yang@windriver.com>
References: <cover.1646119426.git.liezhi.yang@windriver.com>
	 <373dcd3613b74ba10dba54f5116576bc172c222f.1646119426.git.liezhi.yang@windriver.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Mar 2022 07:59:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162530

On Mon, 2022-02-28 at 23:24 -0800, Robert Yang wrote:
> From: Davi Poyastro <davi.poyastro@nokia.com>
> 
> Coreutils configure only checks glibc compatibility for statx
> syscall but fail to check kernel support.
> 
> Fixed on RedHat Enterprise Linux Server 7.6 (Maipo)
> Host kernel: 3.10.0-1127.8.2.el7.x86_64
> Docker distro: Ubuntu 20.04.1 LTS
> 
> $ bitbake coreutils-native
> find the binary ls and run it as "ls -l ."
> The result is something like: "?????????. ? ? ? ? ? foo"
> 
> Signed-off-by: Davi Poyastro <davi.poyastro@nokia.com>
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>  meta/recipes-core/coreutils/coreutils_9.0.bb | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/meta/recipes-core/coreutils/coreutils_9.0.bb b/meta/recipes-core/coreutils/coreutils_9.0.bb
> index e4633949f42..40fad72bbf4 100644
> --- a/meta/recipes-core/coreutils/coreutils_9.0.bb
> +++ b/meta/recipes-core/coreutils/coreutils_9.0.bb
> @@ -152,6 +152,11 @@ ALTERNATIVE_LINK_NAME[kill.1] = "${mandir}/man1/kill.1"
>  ALTERNATIVE_LINK_NAME[stat.1] = "${mandir}/man1/stat.1"
>  
>  python __anonymous() {
> +    from distutils.version import LooseVersion
> +    # statx syscall require glibc >= 2.28 and linux kernel >= 4.11
> +    if LooseVersion(os.uname().release) < LooseVersion('4.11'):
> +        d.appendVar("EXTRA_OECONF_class-native", " ac_cv_func_statx=0")
> +

Shouldn't that be EXTRA_OECONF:class-native?

Which makes me worry about where this was tested/needed?

I'm then a bit worried we have two different signatures for coreutils-native
depending upon which host this runs on, which will cause a number of other
issues. I don't think we can do this.

Cheers,

Richard


