Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com [209.85.221.65])
 by mx.groups.io with SMTP id smtpd.web11.10765.1602070136219592407
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Oct 2020 04:28:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=DlbY+IJY;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.65, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f65.google.com with SMTP id n18so1735128wrs.5
        for <openembedded-core@lists.openembedded.org>; Wed, 07 Oct 2020 04:28:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=MtLJ7onnPNw/ii/3slL+aaJykDYwTnfsxSYSM3219a0=;
        b=DlbY+IJYynhBPwbgLhSXjS1SPdLCNtM5j//XVB2aACGWXjVYJR2YdHKSyjE1lFyWpo
         gGTIoOyj3WNv51TjrF7zYg3C3jDPfxEeTpsX9UaclRlsWCVAf+WcobrWNyJp7Lvkj8in
         RDnvjB4PoD8+P6j/WALk4EUmBa7vCxF9gDp08=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=MtLJ7onnPNw/ii/3slL+aaJykDYwTnfsxSYSM3219a0=;
        b=UM8eEdb3pymsWDZuFFRletZd5QIg6byJdmGCqjTHUCPRHaOoTFqErA0SpuxuuTufxY
         sDBaeWA/N4k/9sY8pgCUNtNyX3ExVjZ3imh0QoEWQF87t9F6sIL9xiPGgW3Cs8WdqGk6
         PgX5/PGSqPeSKECzRcIf18iA/62w+w1la1+EpRwwpSyUYIsGWz3YXJlfuqxeyvRVY3oQ
         Oq+jTaBTGPNaNBbqnqFgWKtRiBuZw/IalIxXL7ClyLiUbL1Lwkzmk83QnFLzrPJ23/+p
         LR6ZVO6Ogr6ZhInr5AYlC2YVyYNwHTJoJB0HGT9su4VwqS/1mhb3yMu1Wb9UT/udixxC
         btNA==
X-Gm-Message-State: AOAM532bMMs0fU3dp5XB++X7RTDLTQKHqiyocOTIxU/Mon4pBEbk1O0K
	FMaDYdgfG1aj2klZZtxb2T3tNg==
X-Google-Smtp-Source: ABdhPJzv5R6D/+rNwzMQg2xipg7xNszEMUqVhb2VYPba6r8jjbEg1gYTD5TmwCBFzsV9sYBq4HDXbA==
X-Received: by 2002:adf:9043:: with SMTP id h61mr3111552wrh.237.1602070134516;
        Wed, 07 Oct 2020 04:28:54 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from f.c.8.7.1.0.8.4.a.6.c.a.3.f.8.f.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (f.c.8.7.1.0.8.4.a.6.c.a.3.f.8.f.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:f8f3:ac6a:4801:78cf])
        by smtp.gmail.com with ESMTPSA id 63sm2656226wrh.71.2020.10.07.04.28.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2020 04:28:54 -0700 (PDT)
Message-ID: <d9657b20703921b770f72ffc337420ff34ad8171.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] Revert "kernel.bbclass: make dependency on lzop-native conditional"
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Marco Felsch <m.felsch@pengutronix.de>, 
	openembedded-core@lists.openembedded.org
Cc: mfe@pengutronix.de, Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 07 Oct 2020 12:28:53 +0100
In-Reply-To: <20201005141838.8559-1-m.felsch@pengutronix.de>
References: <20201005141838.8559-1-m.felsch@pengutronix.de>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2020-10-05 at 16:18 +0200, Marco Felsch wrote:
> This reverts commit 1217ddf070261c5fe523729b2a833bd38f1e4ccd.
> 
> This commit breaks compiling if no initramfs is used because the kernel
> image can be compressed too using lzo.
> 
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> ---
>  meta/classes/kernel.bbclass | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index 78def5bbc1..06150e8072 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -4,8 +4,7 @@ KERNEL_PACKAGE_NAME ??= "kernel"
>  KERNEL_DEPLOYSUBDIR ??= "${@ "" if (d.getVar("KERNEL_PACKAGE_NAME") == "kernel") else d.getVar("KERNEL_PACKAGE_NAME") }"
>  
>  PROVIDES += "${@ "virtual/kernel" if (d.getVar("KERNEL_PACKAGE_NAME") == "kernel") else "" }"
> -DEPENDS += "virtual/${TARGET_PREFIX}binutils virtual/${TARGET_PREFIX}gcc kmod-native bc-native bison-native"
> -DEPENDS += "${@bb.utils.contains("INITRAMFS_FSTYPES", "cpio.lzo", "lzop-native", "", d)}"
> +DEPENDS += "virtual/${TARGET_PREFIX}binutils virtual/${TARGET_PREFIX}gcc kmod-native bc-native lzop-native bison-native"
>  DEPENDS += "${@bb.utils.contains("INITRAMFS_FSTYPES", "cpio.lz4", "lz4-native", "", d)}"
>  PACKAGE_WRITE_DEPS += "depmodwrapper-cross"

I've been giving this more thought, we can't simply add every possible
DEPENDS in kernel.bbclass.

In this case if a recipe is enabling lzo compression on the kernel,
perhaps it should just add DEPENDS += "lzop-native" itself?

Cheers,

Richard 

