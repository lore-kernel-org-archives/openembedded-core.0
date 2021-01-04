Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web10.11838.1609756108815277503
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Jan 2021 02:28:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=MXgxrzWS;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f44.google.com with SMTP id y17so31611843wrr.10
        for <openembedded-core@lists.openembedded.org>; Mon, 04 Jan 2021 02:28:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=TM/OhjaWT7QcKzyEbgGUsQIhC3g63mSx9W0IoWbheoQ=;
        b=MXgxrzWSRxFXXT8Z72rJ+1sf9q76rqjT/Ci0sQgosAOHMWrF+49d914O3fRisrprZ6
         vI+SbdaPxZa3lSjrJEmIrhEbw7TtAe3NhU6W19kRLhKtAO2OT9TwpO3b2czKTxcr2GqS
         SCikj1bIpPYCjaRe6IdVak8qS+w+qDUK50LDI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=TM/OhjaWT7QcKzyEbgGUsQIhC3g63mSx9W0IoWbheoQ=;
        b=ajK1I9TLy44osFlF94CcEi4vXq2i7DtPy9dhOsbLIsq8+t2g39m92cSb7Y/p+mpfW2
         gjgUkMZfxd1AyS3ZxcOLM5i485Qtid1kdlxItM2frBCpKdLYzuK7Baa8wlKRVnU/tRI0
         gL6iuOB4Qvksnm0cnTrX8ONzXohrcloEHfKUboGPchtRmbmfVKaWv1rRqOXwGCiKr5Aw
         2fpPvzo1bp29MnAX2dmOG9T+XqX/rn8UxNWdAGdu/+TLvBH4+BFGNeWVKpERJooWhq3f
         d05iWWr7eBiy/sgvt+6agU+To4p1GTvs6uDxILjpQeNsV8xjlfLdp7ze3IPYHmlSg4Lf
         ivKw==
X-Gm-Message-State: AOAM532wHV+3RjVE2X6VL4hN3xQSQpurszMEz3EKi5DtJNrAo7ofaYpd
	+9hx/PVlrsVYGxw25YNY6HJnlw==
X-Google-Smtp-Source: ABdhPJy7ZmWq7oAPTMgMJ2JoG23TqPfDxDGj/AIHSSMEXEz9SCKFDBuhPeIx4CNUvuua7FcV7eaLKQ==
X-Received: by 2002:adf:b359:: with SMTP id k25mr80440224wrd.98.1609756107255;
        Mon, 04 Jan 2021 02:28:27 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:4767:d28d:f91a:aa32? ([2001:8b0:aba:5f3c:4767:d28d:f91a:aa32])
        by smtp.gmail.com with ESMTPSA id h13sm87984307wrm.28.2021.01.04.02.28.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Jan 2021 02:28:26 -0800 (PST)
Message-ID: <56b88a5513085b38781e02327537289d2fdd8203.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2] u-boot: add /boot and ${sysconfdir} to SYSROOT_DIRS
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Diego Sueiro <diego.sueiro@arm.com>, 
	openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Date: Mon, 04 Jan 2021 10:28:26 +0000
In-Reply-To: <9c29138b53742ac268b54768773f72a2279f3f49.1609748975.git.diego.sueiro@arm.com>
References: 
	<9c29138b53742ac268b54768773f72a2279f3f49.1609748975.git.diego.sueiro@arm.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2021-01-04 at 08:30 +0000, Diego Sueiro wrote:
> Since do_install is shipping files to /boot and ${sysconfdir}, we can
> include
> these dirs to SYSROOT_DIRS and allow recipes which depend on u-boot
> to use its
> installed artifacts from RECIPE_SYSROOT instead of DEPLOY_DIR_IMAGE.
> 
> Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
> ---
>  meta/recipes-bsp/u-boot/u-boot.inc | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-bsp/u-
> boot/u-boot.inc
> index 251178db33..c53bcd05cc 100644
> --- a/meta/recipes-bsp/u-boot/u-boot.inc
> +++ b/meta/recipes-bsp/u-boot/u-boot.inc
> @@ -266,6 +266,8 @@ FILES_${PN}-env = " \
>  "
>  
>  FILES_${PN} = "/boot ${datadir}"
> +SYSROOT_DIRS += "/boot ${sysconfdir}"
> +
>  RDEPENDS_${PN} += "${PN}-env"
>  
>  do_deploy () {

I think I did ask about this on irc but we never managed to discuss.

I'm a bit worried about this creating confusion about where files are
placed (deploy or sysroot). I particularly want to avoid placing files
in both.

Are these files in /boot normally available in the rootfs at this
location? If so, the patch probably makes sense but if not, I think its
creating disparity between the target filesystem and the build one and
I'm a lot more reluctant to do that.

Cheers,

Richard

