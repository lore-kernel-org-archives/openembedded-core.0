Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCC28C433F5
	for <webhook@archiver.kernel.org>; Wed, 30 Mar 2022 22:17:15 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web10.112.1648678634678264893
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Mar 2022 15:17:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Rrwls+mY;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.43,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f43.google.com with SMTP id n35so13141344wms.5
        for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Mar 2022 15:17:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=CCBJIQEhiylWQz5B8foTnG2b6Y0pjzsMhMV3CImlfHk=;
        b=Rrwls+mYdXfa4ALlRoncv2omUDdJGBC+ixh3OIjSI0LCGWRtKETv4Yq0wbkIpy4fLo
         TGDzF09E/Za1EphGE7+znyw5hqOJfmRHzkm+LBOSnPCnwivGqygO+OpntLL3jQJa/jyY
         yE6R8EFooIN5p/k+orUNVe6dUA+IBz+oPN1Bs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=CCBJIQEhiylWQz5B8foTnG2b6Y0pjzsMhMV3CImlfHk=;
        b=6VcV6vpD7rw3zbv8ZBiQdxtDNPUfr03YK+w87oMinj2bE3kQVpaRLSejU/k1pGGycn
         /sfoog0XFoeI7FQz/iHScYL3IdDdiOiwQ9qUcZLy9FHkrPhOccbMV6ZFT9+R/k1U/G2D
         BCB11sMio+n9US5HnG4II8m9p8wBxZXNxUvYYID1UjZMA7AsdQqn2b72KoPoLIez4FSt
         TOOh/meIvNMZbx3WOnFanFR0piQHRfJgJmbmrHVz05cPufnrIKEKlm0F1LwAW+3Ye22p
         +zaBMXr4WqlJRNeUrJKqC0XLMyCA2i85b+KpuuVD2CicKAuJ6LvWtxqCeVwdjntHsdoA
         rL7A==
X-Gm-Message-State: AOAM532ghKczA5fFj6+j8LRcDaueGsehKLL/fz9umctMKTdhZv6eln1M
	hdlKnGCUKkbQ4lawrtVuHdOwbQ==
X-Google-Smtp-Source: 
 ABdhPJxoYgeZnsofLyFDX8paeoEIH1014ss1hLb/Ox1w4It6kaUeT2mc1SF9Yeq551CGPdWoJB5Erw==
X-Received: by 2002:a05:600c:2d44:b0:38b:ff3b:e2f9 with SMTP id
 a4-20020a05600c2d4400b0038bff3be2f9mr1719247wmg.61.1648678632791;
        Wed, 30 Mar 2022 15:17:12 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:6605:7b3b:ef3e:a309?
 ([2001:8b0:aba:5f3c:6605:7b3b:ef3e:a309])
        by smtp.gmail.com with ESMTPSA id
 g10-20020adfe40a000000b00203eb3551f0sm25273109wrm.117.2022.03.30.15.17.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Mar 2022 15:17:12 -0700 (PDT)
Message-ID: 
 <a1177b99ee7d1d81fb2f3d1e7023992420ace7dc.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 2/2] depmodwrapper: Use native staging dir
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Saul Wold <Saul.Wold@windriver.com>,
	openembedded-core@lists.openembedded.org
Date: Wed, 30 Mar 2022 23:17:09 +0100
In-Reply-To: <20220330221139.54366-2-saul.wold@windriver.com>
References: <20220330221139.54366-1-saul.wold@windriver.com>
	 <20220330221139.54366-2-saul.wold@windriver.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Mar 2022 22:17:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163796

On Wed, 2022-03-30 at 15:11 -0700, Saul Wold wrote:
> Use the native staging dir so that we can get the correct depmod.d configuration
> files. When depmod runs we want to ensure that the newly supported exclude.conf
> is read so that .debug/<module>.ko files are excluded.
> 
> Signed-off-by: Saul Wold <saul.wold@windriver.com>
> ---
>  meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb b/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb
> index aa23ba41276..9921b7e8ad7 100644
> --- a/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb
> +++ b/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb
> @@ -35,9 +35,9 @@ fi
>  
>  if [ ! -r ${PKGDATA_DIR}/kernel-depmod/System.map-\$4 ] || [ "\$kernelabi" != "\$4" ]; then
>      echo "Unable to read: ${PKGDATA_DIR}/kernel-depmod/System.map-\$4" >&2
> -    exec env depmod -C "\$3${sysconfdir}/depmod.d" "\$1" "\$2" "\$3" "\$4"
> +    exec env depmod -C "\${STAGING_BASE_LIBDIR_NATIVE}/depmod.d" "\$1" "\$2" "\$3" "\$4"
>  else
> -    exec env depmod -C "\$3${sysconfdir}/depmod.d" "\$1" "\$2" "\$3" -F "${PKGDATA_DIR}/kernel-depmod/System.map-\$4" "\$4"
> +    exec env depmod -C "\${STAGING_BASE_LIBDIR_NATIVE}/depmod.d" "\$1" "\$2" "\$3" -F "${PKGDATA_DIR}/kernel-depmod/System.map-\$4" "\$4"
>  fi
>  EOF
>  	chmod +x ${D}${bindir_crossscripts}/depmodwrapper

This doesn't look/feel right to me. Shouldn't we be putting this configuration
into the target depmod.d directories and using it from there? What happens if
the depmod configuration is machine/target specific?

Cheers,

Richard


