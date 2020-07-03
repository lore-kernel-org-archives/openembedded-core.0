Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com [209.85.208.194])
 by mx.groups.io with SMTP id smtpd.web11.9298.1593780424422065111
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Jul 2020 05:47:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=MyvEDY5i;
 spf=pass (domain: gmail.com, ip: 209.85.208.194, mailfrom: jacob.kroon@gmail.com)
Received: by mail-lj1-f194.google.com with SMTP id 9so36762639ljv.5
        for <openembedded-core@lists.openembedded.org>; Fri, 03 Jul 2020 05:47:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=lJRQzhCQGD4ySGgcJ2cHV+aoyHwIEiaIHJAdfG39Nq8=;
        b=MyvEDY5im2xEiSt3Oz2lxbGqJn+LGUAT3FMJbCkWZeH9Vbl0iqlvEI7zne6z3lbf8P
         xCWR92GvsLTtkBJMCUF4YJr0FaGVfrQhOJ27sLpwN7HGXIdA3pS1VEfn1sGCYdPgSBbq
         7viTqKpKBKC0Nn9bfn+CbtoYWi1lVr7yAWxTFVE7PoNyAl56oh0MlQwQqEnivPDVe6Kl
         oEn49kjWqBQbVD0+GKhY9oCBLJPqddEuRsR+0jQzWdA/lT/xNIIhpYh2iDzy6VTljKT+
         RtCe7s/Q/BuL6HVDFW+LDDbIO+BXkmdFsUAwCF5u8fA+LrIpfGl9aUSHBK2dy4fEQMkZ
         wXcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=lJRQzhCQGD4ySGgcJ2cHV+aoyHwIEiaIHJAdfG39Nq8=;
        b=XUWldpp8bhAp2lS/Z1wK27p9harY/R10YAW8MEGWQQPM4y1t1mYAnnAk7WyVx41ofK
         sJaTSUBSr4fFFlX/UQ9FmK8cxuZBqGA3Dc8BaFsfcyFq/Jrk2agUedfDVbBOwT05aY+t
         9BfRw556XdbDjSRsb6uWriefz1Hz3/cR6TAIY+xW1x2OvhadHOvET6M3rAFjfh01OT0M
         CsufA79VnHXCGebm0s8FI2WSpdwu4IENqtWV0hv7SFjr9EDqAJt5jd0l7biP+ueh0g4l
         22M7eN9/W4MFQnwiElNzsmKmvW3ocdP6y+CfZqI0ZMoAlaziGEUEGgYe0oZMzDrvqHR8
         fTCQ==
X-Gm-Message-State: AOAM532+pEBHi0LkA5nGVNpHlkhjbUFcR5QMh3d4h/4fTKV0naQvHWi8
	aNK4kfaYcaJpTyPtF4F4ztkaiTco
X-Google-Smtp-Source: ABdhPJwAEKvZT8dbzaeCOfTgbukdsEySOxji1t4F4OMrNb80za698ak9usPB5UVmhMpDTHOpeXYVkA==
X-Received: by 2002:a2e:9ed0:: with SMTP id h16mr20861497ljk.366.1593780421999;
        Fri, 03 Jul 2020 05:47:01 -0700 (PDT)
Return-Path: <jacob.kroon@gmail.com>
Received: from localhost.localdomain ([213.185.29.22])
        by smtp.gmail.com with ESMTPSA id v10sm1764555ljg.113.2020.07.03.05.47.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jul 2020 05:47:01 -0700 (PDT)
Subject: Re: [OE-core] [PATCH v2] kernel.bbclass: add lz4 dependency and fix the call to lz4
To: "T. Ulrich" <timon.ulrich@kabelmail.de>,
 openembedded-core@lists.openembedded.org
References: <140262> <20200703123940.24779-1-timon.ulrich@kabelmail.de>
From: "Jacob Kroon" <jacob.kroon@gmail.com>
Message-ID: <ba256db6-8174-c98d-e145-0ee358afef63@gmail.com>
Date: Fri, 3 Jul 2020 14:46:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200703123940.24779-1-timon.ulrich@kabelmail.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 7/3/20 2:39 PM, T. Ulrich wrote:
> From: Timon Ulrich <t.ulrich@anapur.de>
> 
> If the initramfs image is type lz4, then a native lz4 is needed.
> 
> Additionally an output filename needs to be specified when calling lz4,
> otherwise STDOUT will be used implicitly.
> 
> Signed-off-by: Timon Ulrich <t.ulrich@anapur.de>
> ---
>   meta/classes/kernel.bbclass | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index 6d07b29e2d..9e3c34ad48 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -5,6 +5,7 @@ KERNEL_DEPLOYSUBDIR ??= "${@ "" if (d.getVar("KERNEL_PACKAGE_NAME") == "kernel")
>   
>   PROVIDES += "${@ "virtual/kernel" if (d.getVar("KERNEL_PACKAGE_NAME") == "kernel") else "" }"
>   DEPENDS += "virtual/${TARGET_PREFIX}binutils virtual/${TARGET_PREFIX}gcc kmod-native bc-native lzop-native bison-native"
> +DEPENDS += "${@bb.utils.contains("INITRAMFS_FSTYPES", "cpio.lz4", "lz4-native", "", d)}"

Should/Could we do a similar thing for "lzop-native" above ? To me it 
looks like that would be possible, assuming I interpreted my taskexp 
correctly.

Jacob

>   PACKAGE_WRITE_DEPS += "depmodwrapper-cross"
>   
>   do_deploy[depends] += "depmodwrapper-cross:do_populate_sysroot"
> @@ -210,7 +211,7 @@ copy_initramfs() {
>   				;;
>   			*lz4)
>   				echo "lz4 decompressing image"
> -				lz4 -df ${B}/usr/${INITRAMFS_IMAGE_NAME}.$img
> +				lz4 -df ${B}/usr/${INITRAMFS_IMAGE_NAME}.$img ${B}/usr/${INITRAMFS_IMAGE_NAME}.cpio
>   				break
>   				;;
>   			*lzo)
> 
> 
