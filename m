Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
 by mx.groups.io with SMTP id smtpd.web11.6717.1594675799734247796
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Jul 2020 14:30:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Qrw+rmQx;
 spf=pass (domain: gmail.com, ip: 209.85.208.46, mailfrom: max.oss.09@gmail.com)
Received: by mail-ed1-f46.google.com with SMTP id dm19so15021160edb.13
        for <openembedded-core@lists.openembedded.org>; Mon, 13 Jul 2020 14:29:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=P78Jg79bWO8o9lXVoKq+/ycrEfv6JUGMEvtHMND3550=;
        b=Qrw+rmQxL3OTjW7AYGIuLfswRIoIUpIBLjlsQxZ1/RsIIcrsd1nEFL6bxZCV/BYMWi
         fz0SNLGlM08lso8+ptUWE//2g/2e9BGP3hbvmnW/QTN75RKiouS06gl3ZVB97N36FUvl
         pCXkco/3iNzMfFnfb/D4rPt21TRWUcXPH1dzoBP0g1dzY5NRN/lzC4y8EgQCRAbqUpQP
         D2wtwogmAQNHZHGIJrq6TlO1raZ9Ga2qZYQpxhs8vJnYOJtydJ8Il3kyRv4lKHcBCwF4
         U1muhN6gk6I9R4j5gWyx5zTr5vDQ/hn8hgkW990rKSlZXQQQhqOu4vYGIu/eoaa1tJRF
         Tt6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=P78Jg79bWO8o9lXVoKq+/ycrEfv6JUGMEvtHMND3550=;
        b=PNYXlaUQfokf/441HM1unxPUk9vSgpYjGTWxcFlRsY0vH8HAizN7vUCx9sS+O2br6K
         3h5vsFd1LZPdr3CzCzN9qPjTRzr6Yc+ZECX1sFOjrra5BWjvcOCsphXuPIA100ztzDdb
         AHPeoulWdX7jxvjf3ThEakarXfIi9wqXopb9yHza3apUYSyAqWcKUbhQ9Xuy0N2jrWft
         COxYdvjqAAv9A7x0y7qU4BMzVFW1AUErfxay5OlbW6nFeVV0VXb+aBM1Sc1FqHr8zsvv
         PW3v2YtLt5KgxGnKZo8E93VtEOoxkrQAUhP/dmVekJo4HqdZuwlkSLNvz5YA+uRDeatD
         4fSw==
X-Gm-Message-State: AOAM531rYWNSfQfc7JeOBLIB3do2jtjW2hLcwCpgotHkxfziMjvKJM77
	8e64DT4O20pfFbfCKMJy52Q=
X-Google-Smtp-Source: ABdhPJzcK/XP+qY5Dp9HiiFGcJ3m9ab5bK6rsDGIk0UDveYJIGtD7d72Um8sGfsqvJ+A+y4fJmSXKQ==
X-Received: by 2002:a50:9f8c:: with SMTP id c12mr1311412edf.149.1594675798215;
        Mon, 13 Jul 2020 14:29:58 -0700 (PDT)
Return-Path: <max.oss.09@gmail.com>
Received: from Saturn.fritz.box ([81.221.228.86])
        by smtp.gmail.com with ESMTPSA id o14sm10771095eja.121.2020.07.13.14.29.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2020 14:29:57 -0700 (PDT)
Message-ID: <92cf9c7e6eaec95059019b461becd588b2b93dbf.camel@gmail.com>
Subject: Re: [OE-core][dunfell 08/15] kernel.bbclass: make dependency on lzop-native conditional
From: "Max Krummenacher" <max.oss.09@gmail.com>
To: Steve Sakoman <steve@sakoman.com>, 
	openembedded-core@lists.openembedded.org
Date: Mon, 13 Jul 2020 23:29:56 +0200
In-Reply-To: <ad44aab08c0c204923d44aa37c39559a7bd843c0.1594649587.git.steve@sakoman.com>
References: <cover.1594649587.git.steve@sakoman.com>
	 <ad44aab08c0c204923d44aa37c39559a7bd843c0.1594649587.git.steve@sakoman.com>
User-Agent: Evolution 3.34.4 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi

Can we drop this one from the backports?

The patch possibly reduces a bit of build time if lzop-native is not used
by any other recipe, but does not fix anything.

One can build a zImage which is compressed with lzo. For a kernel recipe which
does use a zImage with lzo and relies on the kernel.bbclass to add a depend on
lzop-native the build breaks.

Cheers
Max

Am Montag, den 13.07.2020, 04:16 -1000 schrieb Steve Sakoman:
> From: Timon Ulrich <t.ulrich@anapur.de>
> 
> a native lzop is only needed when an lzo compressed initramfs is actually present
> 
> Signed-off-by: Timon Ulrich <t.ulrich@anapur.de>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> (cherry picked from commit 1217ddf070261c5fe523729b2a833bd38f1e4ccd)
> Signed-off-by: Steve Sakoman <steve@sakoman.com>
> ---
>  meta/classes/kernel.bbclass | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index 9e3c34ad48..af7e88b380 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -4,7 +4,8 @@ KERNEL_PACKAGE_NAME ??= "kernel"
>  KERNEL_DEPLOYSUBDIR ??= "${@ "" if (d.getVar("KERNEL_PACKAGE_NAME") == "kernel") else
> d.getVar("KERNEL_PACKAGE_NAME") }"
>  
>  PROVIDES += "${@ "virtual/kernel" if (d.getVar("KERNEL_PACKAGE_NAME") == "kernel") else "" }"
> -DEPENDS += "virtual/${TARGET_PREFIX}binutils virtual/${TARGET_PREFIX}gcc kmod-native bc-native
> lzop-native bison-native"
> +DEPENDS += "virtual/${TARGET_PREFIX}binutils virtual/${TARGET_PREFIX}gcc kmod-native bc-native
> bison-native"
> +DEPENDS += "${@bb.utils.contains("INITRAMFS_FSTYPES", "cpio.lzo", "lzop-native", "", d)}"
>  DEPENDS += "${@bb.utils.contains("INITRAMFS_FSTYPES", "cpio.lz4", "lz4-native", "", d)}"
>  PACKAGE_WRITE_DEPS += "depmodwrapper-cross"
>  
> 

