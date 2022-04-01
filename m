Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DEB3C433F5
	for <webhook@archiver.kernel.org>; Fri,  1 Apr 2022 11:11:52 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web11.9174.1648811510794354257
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Apr 2022 04:11:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=DGX4ciqi;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.53,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f53.google.com with SMTP id
 l62-20020a1c2541000000b0038e4570af2fso1258226wml.5
        for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Apr 2022 04:11:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=D+v0mPLnq7XNpURg+6kf+1wZ+rC+jhsd3d7cAPUUr2Q=;
        b=DGX4ciqiSPaypYFQYVTPWAr7Bn2Uqao7W5TLC4Q0S9KQmdQ9VKY7X+ECyXPxX/JjuU
         s9aZNZ3WGx5f41jWq1d4LBT9921fS0KAC2Za12FKTHa4LnGQlOe5p5TtoqzJo/6UyGyZ
         aLFkGP0vymfpCRCSx1wCn9wyMBl3LnMBalRj8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=D+v0mPLnq7XNpURg+6kf+1wZ+rC+jhsd3d7cAPUUr2Q=;
        b=2KXe0gePX9ptF3PW6rf3RDqneqKWa+S4mT1iKzLxpucx8/MoG0/PkzH5r8kXrvkJ+f
         r+knyAFdQSZA1mremUYH4Bqs/QWioksyp9fdyZVjud1oWVAuIb4t382oue1iBNZj1lLd
         Dz3xDe11xQKQhcmTs3fkfS2m4akSPpNnvoTdDPS2RKYtCi4Rbi7NGKSyNd7HqiBFcYT9
         5SU8rpETiwQVT4PHKsTTJNtXKPZPggbdgJlRwTMmVQ9ps0jnBE9t9vx5jQsaVVQKhSU4
         nbmLm/qTQ4EtUWxjUrvslyGJHxoSJgaf1ZSRZ9Df2oAu9Fz8h2uEdprQ9ygQzQ1Vel8h
         eK5A==
X-Gm-Message-State: AOAM533SOO7jrnW3hKwKUaO21hGKRigKY9d4buAvePu/twH+2NNSGurO
	BeKRpYC2deljnUCXdg4MQZhtiQ==
X-Google-Smtp-Source: 
 ABdhPJwMWlrRHro16gB1m1BwRwjzFjJmfZkQnycz1Maxxx0kIoQECrd3LNJoIpNWPCm38YJzAW7nVQ==
X-Received: by 2002:a05:600c:3b98:b0:38c:b19d:59f2 with SMTP id
 n24-20020a05600c3b9800b0038cb19d59f2mr8335880wms.205.1648811509208;
        Fri, 01 Apr 2022 04:11:49 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:a160:31eb:e235:3dfd?
 ([2001:8b0:aba:5f3c:a160:31eb:e235:3dfd])
        by smtp.gmail.com with ESMTPSA id
 i9-20020a5d5849000000b002058631cfacsm1927196wrf.61.2022.04.01.04.11.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Apr 2022 04:11:48 -0700 (PDT)
Message-ID: 
 <26d7155b1477eebde96ac003a62adeca55900c7d.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2 3/3] depmodwrapper: Use nonarch_base_libdir
 for depmod.d
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Saul Wold <Saul.Wold@windriver.com>,
	openembedded-core@lists.openembedded.org
Date: Fri, 01 Apr 2022 12:11:45 +0100
In-Reply-To: <20220331222153.76037-3-saul.wold@windriver.com>
References: <20220331222153.76037-1-saul.wold@windriver.com>
	 <20220331222153.76037-3-saul.wold@windriver.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Apr 2022 11:11:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163884

On Thu, 2022-03-31 at 15:21 -0700, Saul Wold wrote:
> This ensure that when depmod-native runs we can find the correct
> exclude.conf information, in this case adding .debug to ignore
> the .debug kernell modules. The kmod utilities like depmod can use
> either /etc/depmod.d or /lib/depmod.d. The kmod recipe is installing
> the existing search.conf to /lib/depmod.d (nonarch_base_lib)
> 
> When the busybox modutils are used, /lib/depmod.d is not used, so
> it's safe add the exclude.conf file to /lib/depmod.d.
> 
> Signed-off-by: Saul Wold <saul.wold@windriver.com>
> ---
>  meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb b/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb
> index 04fc14a6d21..65068f02df8 100644
> --- a/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb
> +++ b/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb
> @@ -30,11 +30,16 @@ if [ -r "${PKGDATA_DIR}/kernel-depmod/kernel-abiversion" ]; then
>      kernelabi=\$(cat "${PKGDATA_DIR}/kernel-depmod/kernel-abiversion")
>  fi
>  
> +if [ ! -e "\3${nonarch_base_libdir}/depmod.d/exclude.conf" ]; then
> +    mkdir -p "\$3${nonarch_base_libdir}/depmod.d"
> +    echo "exclude .debug" > "\$3${nonarch_base_libdir}/depmod.d/exclude.conf"
> +fi

Shouldn't the above go into the kmod recipe? We need this on target as well as
in our rootfs build, right? I'm worried about the case where someone calls
depmod on target.

> +
>  if [ ! -r ${PKGDATA_DIR}/kernel-depmod/System.map-\$4 ] || [ "\$kernelabi" != "\$4" ]; then
>      echo "Unable to read: ${PKGDATA_DIR}/kernel-depmod/System.map-\$4" >&2
> -    exec env depmod -C "\$3${sysconfdir}/depmod.d" "\$1" "\$2" "\$3" "\$4"
> +    exec env depmod -C "\$3${nonarch_base_libdir}/depmod.d" "\$1" "\$2" "\$3" "\$4"
>  else
> -    exec env depmod -C "\$3${sysconfdir}/depmod.d" "\$1" "\$2" "\$3" -F "${PKGDATA_DIR}/kernel-depmod/System.map-\$4" "\$4"
> +    exec env depmod -C "\$3${nonarch_base_libdir}/depmod.d" "\$1" "\$2" "\$3" -F "${PKGDATA_DIR}/kernel-depmod/System.map-\$4" "\$4"
>  fi
>  EOF
>  	chmod +x ${D}${bindir_crossscripts}/depmodwrapper

Does anything in the build install to $sysconfdir/depmod.d ?

Cheers,

Richard



