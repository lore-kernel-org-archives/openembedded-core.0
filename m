Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web09.7036.1612527903094176617
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Feb 2021 04:25:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=IzECX/fB;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f42.google.com with SMTP id t142so3700921wmt.1
        for <openembedded-core@lists.openembedded.org>; Fri, 05 Feb 2021 04:25:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=vLIF0AY2KqomiDcMgBK/UtUwgUnlyrGQpy35sizAWQI=;
        b=IzECX/fBQ4IpO+W7eV5s1sdE0YjqZVj/KI7lk1jTyVCTceafe7NEur3le4sGrhfKuh
         tUNaCjteWujTqEgGIeyeArjTlIKlTcV4AAKcm3bWun/LyayWu5Ig2xtIWMfX/H+/VU8L
         dQEd82dbZGS9Rht/IOugBjpqd6/l+nIZCJu2g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=vLIF0AY2KqomiDcMgBK/UtUwgUnlyrGQpy35sizAWQI=;
        b=gwXRxgIeXbYDdb6yIfNYfYnAVYNiEPIIjFcHY00dQQgz4A7aucW5RGhK6PvPmPzvtL
         jv7iBY+1NoTDIKr+8vVIimkt9pCQduK12gjq80rfwAt68D2QSjQsWUvbbrQ81poTvzwb
         b0dP52kO6IVdxvuWjPKSs7tx3/eAqFPRRslhi+3O++Zf98d9npDugKUj5Un/heJCZYET
         A1IUeMekwJgo2NpX99o9Rghnb7Kco9SRLbiv/DJLHNkk5i9ALU/BZhtb3Tj3ZinLy0CK
         Sh3N1az72raGaZCftC8sRZEodEyA2NxtkwJ4EmhNkKWDtopQg8C/m6mPYp5op6yx4052
         Zr3g==
X-Gm-Message-State: AOAM532eT9caLV6q2FyDDfZfjgVD1WjnWpsWKEolCIt3+M+c84Fzy/8V
	HBgH1XPOMxB/pVPMEDOJ3bIOKQ==
X-Google-Smtp-Source: ABdhPJxbKzB88DU4l/rNFjaiqAMayhs/VmWiA1fOL7Fksrl3wjX1B3Nv1M1ueXfkZpAaEY425eK6vA==
X-Received: by 2002:a1c:2d0f:: with SMTP id t15mr3441493wmt.181.1612527901292;
        Fri, 05 Feb 2021 04:25:01 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:d1b2:8778:591e:ef47? ([2001:8b0:aba:5f3c:d1b2:8778:591e:ef47])
        by smtp.gmail.com with ESMTPSA id w12sm388353wmi.4.2021.02.05.04.25.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Feb 2021 04:25:00 -0800 (PST)
Message-ID: <4e3dc6e986011a1ebc58f9d74351d32390037748.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] kernel.bbclass: fix deployment for initramfs images
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Awais Belal <Awais_Belal@mentor.com>, 
	"openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Date: Fri, 05 Feb 2021 12:24:59 +0000
In-Reply-To: <931232d223874e60aef228ad4c77f8d7@SVR-IES-MBX-03.mgc.mentorg.com>
References: <165EB485E3CC1C7F.12832@lists.openembedded.org>
	 <931232d223874e60aef228ad4c77f8d7@SVR-IES-MBX-03.mgc.mentorg.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2021-02-04 at 08:25 +0000, Awais Belal wrote:
> The do_bundle_initramfs() only processes kernel image
> types that are found in KERNEL_IMAGETYPE_FOR_MAKE whereas
> the build system can generate other types that are not
> directly supported by the kernel build system. In which
> case when we come to the deploy phase not all the images
> mentioned in KERNEL_IMAGETYPES would have a respective
> initramfs bundled image. An example is using vmlinux.gz
> in KERNEL_IMAGETYPES and enabling initramfs and then we
> see
> 
> install: cannot stat 'arch/arm64/boot/vmlinux.gz.initramfs': No such file or directory
> 
> So we align the deploy phase with bundle initramfs phase
> and pick up relevant initramfs bundled images using
> KERNEL_IMAGETYPE_FOR_MAKE instead of KERNEL_IMAGETYPES.
> 
> Signed-off-by: Awais Belal <awais_belal@mentor.com>
> ---
>  meta/classes/kernel.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index ddff2ddcd2..8693ab86be 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -759,7 +759,7 @@ kernel_do_deploy() {
>         fi
> 
>         if [ ! -z "${INITRAMFS_IMAGE}" -a x"${INITRAMFS_IMAGE_BUNDLE}" = x1 ]; then
> -               for imageType in ${KERNEL_IMAGETYPES} ; do
> +               for imageType in ${KERNEL_IMAGETYPE_FOR_MAKE} ; do
>                         if [ "$imageType" = "fitImage" ] ; then
>                                 continue
>                         fi
> --
> 2.17.1
> 
> 
> Ping!

Merged six days ago?

http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=44ecc935b2ba919ed5bf026c02cdb814e207d996

Cheers,

Richard

