Return-Path: <max.oss.09@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B65DC30658
	for <webhook@archiver.kernel.org>; Tue,  2 Jul 2024 13:05:29 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web11.24129.1719925528673360557
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Jul 2024 06:05:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=E01bk6ZZ;
 spf=pass (domain: gmail.com, ip: 209.85.218.54, mailfrom: max.oss.09@gmail.com)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a7523f0870cso289484566b.3
        for <openembedded-core@lists.openembedded.org>; Tue, 02 Jul 2024 06:05:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719925527; x=1720530327; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CQdFi3mCZFH1U5d64ogVY9azQ54+DePsEHrbRzCTBxg=;
        b=E01bk6ZZSFEYG3TpJedsjcpOJ/uerjHFUp3LZZeeGGlV3dlMkdUa9OAzfSqs3Xv9n/
         +MkG0PKIlSg8Hwpz77LUSfax5TnAyMZyeLP7Sk+zjAOrIf7qmcDggn+vQIw1TmDOw4HR
         S9opP/EC2itBM2DANqmIHzTX5BM0X8Fs1kXw4JwzDLRkRvaymozAHtIGWFKS/6gTRZ91
         5EUqPWYlRjYXhrW+T9NkGDXKbV+x1/dQaPfpPaw7kPXlM8Oo6vLBwTzRnIBotNY5o+Ex
         GJpLCLDSxlecExSR6nN83nhuv9730QbJ2xT1ZyCkTCA2a4WvIzr7zdDFH3Y9IOURZOVR
         bKaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719925527; x=1720530327;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CQdFi3mCZFH1U5d64ogVY9azQ54+DePsEHrbRzCTBxg=;
        b=woTEAqsnzdheJLRAM1vm1CfOfTX2UEKMU1famgbIte8Gp51fI8kMu//yQQY1rAwEob
         h0ij8D0+49qTYWrKbmFXrQITcdJWEjQtXYy5S+DvjX5G2a8NSvmXHmUd3LTgmybBPun0
         OQ5OLT6JjFgDs/+lXxI63+UFZd0M2gnH+oIjAMNeQf29stXi6Yc1xH8yeIpsioa98ted
         AxL9D6OSJtlHCfvuGJ393BYWP54v2EVMIBhXlmcnd+8RzDe31dPYK4GFBTYOFIx2I9L+
         gy73/HLdd6W82zoW+AEnaj027v7xI6Wpu7zcBsac5dWKOIPczXp5aC7bwRttIstu82Ug
         knhA==
X-Gm-Message-State: AOJu0YxhRda/M5CqLX84hPi0Mt6nDednUgfuAmZQCDDddV8NgLU12N3S
	2k+j0MscFyrP+tHmpwwjtiOkiwwiCzOB7JUBSgkPQS0w+IMKbJHshnv/Yg==
X-Google-Smtp-Source: AGHT+IEWQopshw3coHejL0sLPK2csu6MY4UfcK292AbC7uDil2WVE4bfekowvTIIIW7VoWnZPuIy1g==
X-Received: by 2002:a17:906:160a:b0:a6f:6b6a:e8d0 with SMTP id a640c23a62f3a-a75144023d8mr547511866b.7.1719925526728;
        Tue, 02 Jul 2024 06:05:26 -0700 (PDT)
Received: from toolbox (31-10-206-125.static.upc.ch. [31.10.206.125])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a72ab0657b1sm415508466b.133.2024.07.02.06.05.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jul 2024 06:05:26 -0700 (PDT)
Date: Tue, 2 Jul 2024 15:05:23 +0200
From: Max Krummenacher <max.oss.09@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Andrey Zhizhikin <andrey.z@gmail.com>,
	Max Krummenacher <max.krummenacher@toradex.com>
Subject: Re: [OE-core][Patch v1] devicetree.bbclass: fix setting S
Message-ID: <ZoP7Ez0awwIpSYbT@toolbox>
References: <20240625183047.240309-1-max.oss.09@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240625183047.240309-1-max.oss.09@gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Jul 2024 13:05:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201422

Hello

On Tue, Jun 25, 2024 at 08:30:46PM +0200, max.oss.09@gmail.com wrote:
> From: Max Krummenacher <max.krummenacher@toradex.com>
> 
> When a user of devicetree.bbclass overrides setting S, e.g. to
> git/overlays then having UNPACKDIR set to S results in that
> git repo unpacked inside UNPACKDIR. Thus the sources are actually
> in git/overlays/git/overlays rather than the expected git/overlays.
> 
> Change the logic, so that S by default is set to UNPACKDIR,
> but a user can change S to point to were the sources actually
> will be.
> 
> Fixes: 7a06069a041a ("devicetree.bbclass: switch away from S = WORKDIR")

Gentle ping.

Any comments on this commit?
For me the referenced commit causes a regression. If I understand it
correctly it will do so for any user which uses the devicetree.bbclass
and did set S to anything other than WORKDIR.

I think this should be fixed here rather than any recipe which sets S
also setting UNPACKDIR.

Thanks.
Max
> Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
> ---
>  meta/classes-recipe/devicetree.bbclass | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/classes-recipe/devicetree.bbclass b/meta/classes-recipe/devicetree.bbclass
> index 1806cb62cbf7..e5dbd9a85714 100644
> --- a/meta/classes-recipe/devicetree.bbclass
> +++ b/meta/classes-recipe/devicetree.bbclass
> @@ -40,8 +40,8 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
>  SYSROOT_DIRS += "/boot/devicetree"
>  FILES:${PN} = "/boot/devicetree/*.dtb /boot/devicetree/*.dtbo"
>  
> -S = "${WORKDIR}/sources"
> -UNPACKDIR = "${S}"
> +UNPACKDIR = "${WORKDIR}/sources"
> +S = "${UNPACKDIR}"
>  B = "${WORKDIR}/build"
>  
>  # Default kernel includes, these represent what are normally used for in-kernel
> -- 
> 2.42.0
> 
> 

