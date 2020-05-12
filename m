Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com [209.85.221.65])
 by mx.groups.io with SMTP id smtpd.web11.6739.1589293351250464648
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 May 2020 07:22:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=girdtlt/;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.65, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f65.google.com with SMTP id e16so15651918wra.7
        for <openembedded-core@lists.openembedded.org>; Tue, 12 May 2020 07:22:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=S8uTfynuwnUOQwMn9wJU+Xj+JSiSptow6fY3tIqr0f0=;
        b=girdtlt/L8bHttVQokKBdtZ9dt4tlzbDMx9xvUkzpvuNXSW6Yq2/m+mT9tnrtBZQfT
         aAyDGDaWhVZZcCezrw77y7tHuMXaqSm6nlVta75YrGCEXH5VdGpj3H2rQVtMqZuKOEFL
         6bINNlPnZoqxoFo4Ka6nB61qn1mX35Oq3/M/M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=S8uTfynuwnUOQwMn9wJU+Xj+JSiSptow6fY3tIqr0f0=;
        b=aijoG5R9RAtGsQKzLcRZ0we4L2CSrL1wJBlQNn9eteuPD2TvpRpEIuhTOsxBZXjaFZ
         AqTTC840Ug2ojg5cBsxf/yw1+sgljPQOjGLs1Bq+dHl9CgWZt9j0Z/Tj/IFR0+FJLGgr
         dBkP7hABiL4M06Y40cmO8LknipwrOlV1J4CIHpBA9/M+nejB6t2MEXNybiWBoUpzFzqr
         YPiZx3Qnl/Zdw4jpN0GoeF3I9HhcziYpa58I8TccmF1N1yE/n9dnSt9v4GYTX6O1lWoL
         uBCIPNU2LRHYhK0uPz6lMeiEbkWIzlNbc7wz1IUzYCYkKnwek+5GwE/gPHGocA0X+3JA
         UMdA==
X-Gm-Message-State: AOAM532AU9CRPekKXTdhXyXOB2GsZX1ZSkPfBpIIX/nNoNGwsbk+gAus
	myViZ+i75bxtTldn4+r+vE2Qog==
X-Google-Smtp-Source: ABdhPJy2vljW7xcJXIDtt/Do1xudnu5yLkSueYcpRsXUviFvCKVNHRpefjfNB/s7ChaptgIUEd5KZg==
X-Received: by 2002:a5d:5011:: with SMTP id e17mr2388126wrt.347.1589293349707;
        Tue, 12 May 2020 07:22:29 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id s17sm30832126wmc.48.2020.05.12.07.22.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2020 07:22:29 -0700 (PDT)
Message-ID: <3f5f200c47a92bc0a417300d0d0efa73d423d9ba.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH] classes/kernel: Generate reproducible kernel module tarball
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Joshua Watt <JPEWhacker@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Tue, 12 May 2020 15:22:28 +0100
In-Reply-To: <20200512134013.25080-1-JPEWhacker@gmail.com>
References: <20200512134013.25080-1-JPEWhacker@gmail.com>
User-Agent: Evolution 3.36.1-2 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2020-05-12 at 08:40 -0500, Joshua Watt wrote:
> If reproducible binaries are requested, generate the kernel modules
> tarball in a reproducible way. Namely, sort the tarball contents, clamp
> the mtime to the source date epoch, compress the archive with a
> consistent compression level (9), and don't include the name and
> timestamp in the compressed file.
> 
> [YOCTO #12719]
> 
> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> ---
>  meta/classes/kernel.bbclass | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index a724645466..c124645643 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -691,7 +691,15 @@ kernel_do_deploy() {
>  
>  	if [ ${MODULE_TARBALL_DEPLOY} = "1" ] && (grep -q -i -e '^CONFIG_MODULES=y$' .config); then
>  		mkdir -p ${D}${root_prefix}/lib
> -		tar -cvzf $deployDir/modules-${MODULE_TARBALL_NAME}.tgz -C ${D}${root_prefix} lib
> +		if [ "${BUILD_REPRODUCIBLE_BINARIES}" = "1" ]; then
> +			TAR_ARGS="--sort=name --clamp-mtime --mtime=@${SOURCE_DATE_EPOCH}"
> +			GZIP_ARGS="-9n"
> +		else
> +			TAR_ARGS=""
> +			GZIP_ARGS=""
> +		fi
> +		tar $TAR_ARGS -cv -C ${D}${root_prefix} lib | gzip $GZIP_ARGS > $deployDir/modules-${MODULE_TARBALL_NAME}.tgz
> +
>  		ln -sf modules-${MODULE_TARBALL_NAME}.tgz $deployDir/modules-${MODULE_TARBALL_LINK_NAME}.tgz
>  	fi

Do we need to make this conditional or could we just do it by default?

Cheers,

Richard

