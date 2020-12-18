Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.web08.7738.1608285109852324847
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Dec 2020 01:51:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=dIvDyxcf;
 spf=pass (domain: gmail.com, ip: 209.85.208.49, mailfrom: max.oss.09@gmail.com)
Received: by mail-ed1-f49.google.com with SMTP id g24so1695721edw.9
        for <openembedded-core@lists.openembedded.org>; Fri, 18 Dec 2020 01:51:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=gFl9RAZZz2Qi7p62Gc7TV3aswhyDO5ynnsK4CTqBmP8=;
        b=dIvDyxcfmyfF7fk2naqJr1oSQ2pUlzw445pPf9jfuel0BLkOQgmWB4L7gEfob1aQ2f
         QGMxd31qh6H3euKpny/rTjWE2ue7yiFUZ6LwVmR2gEXKwNzwVpB3Xazwveh8SVrWO0ow
         R2HqMsTrLwMvAMNkMbQcWxsV3ozffq9kFj4x3EWvhEMG7uQAaMle7Kk0/a1rphAYXbiR
         AGZTISo59BHWWzzk701Q2j9a4M5QACOBgaycy+sfEOvAqGypfH36ONP45Ea5YRhi14uS
         uAdOMg2booTHXfGQTzwIt6/wCAJrB0VzsYRaeDeKytx5MyUdWUqD6B5mDhxkRCdUDRzp
         42hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=gFl9RAZZz2Qi7p62Gc7TV3aswhyDO5ynnsK4CTqBmP8=;
        b=MhIpuq+SHbj6tjbzGhsu/x82FrWrs4XDCToB+detZ6j0iP624E/5HALjPCDxdkiMGn
         xQM5wWDFmt9rNiltgzG8pMMNvjuW9q+XTfjwhczSrZLa3Y1kYO1Xpc0Kbz57wviWQLTy
         ZKXx2u2LibXtyAZBXOtmpuywCJOZmZWSnZZS3i2EngYnMhbTAXS/UHVZqLN9veZDYpDP
         U5t9K3sZUJGev0K4c2FuJs5KRtotDKL3detZBOi3mQDSoRzCVfqRnXUCPzyWVdFbgJMd
         KQYlNhHbGbqN2scrJVCavbnemaip3UKKIJPCSnhA4HNQHLRNyUSM5HDjRroEYptf2ApN
         bsDg==
X-Gm-Message-State: AOAM530bS5TvW1tnTMlA0KhIC7u0KoQJrM/198H7+PCzXas+/055mrni
	+X4pN7C9a/rTQpLyT54zANw=
X-Google-Smtp-Source: ABdhPJwTtAlQGrAnPZF4pYEe8K7ND4p5YT/7VWZswJSNls6nrYfpZgrb6ODSdYXdwK1ei9Li+9nYWA==
X-Received: by 2002:a50:8b66:: with SMTP id l93mr3497034edl.384.1608285108365;
        Fri, 18 Dec 2020 01:51:48 -0800 (PST)
Return-Path: <max.oss.09@gmail.com>
Received: from Saturn.fritz.box ([81.221.211.103])
        by smtp.googlemail.com with ESMTPSA id o10sm5298748eju.89.2020.12.18.01.51.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Dec 2020 01:51:47 -0800 (PST)
Message-ID: <64c6a1da3b14ede2c4001a3d2e485bc54e702512.camel@gmail.com>
Subject: Re: [OE-core] [PATCH] u-boot: set SYSROOT_DIRS to /boot and ${sysconfdir}
From: "Max Krummenacher" <max.oss.09@gmail.com>
To: Diego Sueiro <diego.sueiro@arm.com>, 
	openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Date: Fri, 18 Dec 2020 10:51:47 +0100
In-Reply-To: <51459a27f768a62cab37aabf5a5253e2756a0644.1608204009.git.diego.sueiro@arm.com>
References: 
	<51459a27f768a62cab37aabf5a5253e2756a0644.1608204009.git.diego.sueiro@arm.com>
User-Agent: Evolution 3.34.4 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi

Am Donnerstag, den 17.12.2020, 11:23 +0000 schrieb Diego Sueiro:
> Since do_install is shipping files to /boot and ${sysconfdir}, we can set
> SYSROOT_DIRS to these dirs and allow recipes which depend on u-boot to use its
> installed artifacts from RECIPE_SYSROOT instead of DEPLOY_DIR_IMAGE.
> 
> Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
> ---
>  meta/recipes-bsp/u-boot/u-boot.inc | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-bsp/u-boot/u-boot.inc
> index 251178db33..6af0766571 100644
> --- a/meta/recipes-bsp/u-boot/u-boot.inc
> +++ b/meta/recipes-bsp/u-boot/u-boot.inc
> @@ -266,6 +266,8 @@ FILES_${PN}-env = " \
>  "
>  
>  FILES_${PN} = "/boot ${datadir}"
> +SYSROOT_DIRS = "/boot ${sysconfdir}"

Wouldn't a += be more future proof. I.e. not dropping the directories which are staged by default.

Max

> +
>  RDEPENDS_${PN} += "${PN}-env"
>  
>  do_deploy () {
> 
> 

