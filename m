Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
 by mx.groups.io with SMTP id smtpd.web10.3520.1588848190431099346
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 May 2020 03:43:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=IlLwcmj2;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.67, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f67.google.com with SMTP id g12so6241853wmh.3
        for <openembedded-core@lists.openembedded.org>; Thu, 07 May 2020 03:43:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=LY8nN1UBVTIRdxW0NHtIwfT4ZlQRaOQzISRbm8cffyg=;
        b=IlLwcmj2yQxf0ZNirlZ4G22cwmGmrE00bajXDuJnw3AHG92KJ3AhoaD6ZBDZyS/Xqx
         l2fbSvrfVRlnqipTBevcJYZhaDQirCj1nsZQx3QDA5DHosDJki8yJxn9ko07baPDTpan
         83J25DG6TmFp5vZPJwmweF4GUrP/IOOiK0zXA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=LY8nN1UBVTIRdxW0NHtIwfT4ZlQRaOQzISRbm8cffyg=;
        b=QAc7Kxh9S/cmGQBrEGw331dVfmz9mpBU4X6jcjXq6XBaV9nJBKGCBDCg1D+20N2Pli
         06qb4JDNOMoZ2lKc7L0SEZbVepObAzZe0j6k2AQ2Zyyk5KMUXyXTJNbJCoNpk2/o8HhI
         h1H0oNrQGMeqj/PqKl9RRAo1b2L7kNNcYkc//73z2I6M2LiPeEsxVYEHOtZMuvdXRgSv
         Qb9Vcc8IYxaKgTpUl+yABmCIbJqxEJJTwVKz1K9tlPCv32I4b1E77zrcU1l4A71Pn+RT
         MkW5Ey+5kbjlbaWEltnko62MJ6dk4eC6tt+YZ1hVLQrZ42H0WNiR4pEZWCwkyY2l3qiF
         UDtA==
X-Gm-Message-State: AGi0PuZOBLS69EQgLVuAqnuYXgUiKDzKHxtzua2jsCNSdqgzuRQBVXwQ
	34UmW5zOYtI3q1zcKxOaUC5oTg==
X-Google-Smtp-Source: APiQypKwTP0MoaSsXmlcJAUXdSDzAxsqsOm3/77IiixIwBmMMFqGUyko1FM/fH32BrBJJ11hXAgcxA==
X-Received: by 2002:a7b:ce89:: with SMTP id q9mr10301801wmj.185.1588848188840;
        Thu, 07 May 2020 03:43:08 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id s14sm7014293wmh.18.2020.05.07.03.43.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2020 03:43:08 -0700 (PDT)
Message-ID: <ed0808536320e40836ab5c90b842e32d97a0199f.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 2/2] encodings: RDEPEND on mkfontdir mkfontscale
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Yi Zhao <yi.zhao@windriver.com>, openembedded-core@lists.openembedded.org
Date: Thu, 07 May 2020 11:43:07 +0100
In-Reply-To: <20200507074536.10631-2-yi.zhao@windriver.com>
References: <20200507074536.10631-1-yi.zhao@windriver.com>
	 <20200507074536.10631-2-yi.zhao@windriver.com>
User-Agent: Evolution 3.36.1-2 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2020-05-07 at 15:45 +0800, Yi Zhao wrote:
> Fix pkg_postinst error when install encodings via online repo:
> 
> $ opkg install encodings
> Installing encodings (1.0.5) on root
> Configuring encodings.
> /var/lib/opkg/info/encodings.postinst: line 7: mkfontdir: not found
> Collected errors:
> * pkg_run_script: package "encodings" postinst script returned status 127.
> * opkg_configure: encodings.postinst returned 127.
> 
> Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
> ---
>  meta/recipes-graphics/xorg-font/encodings_1.0.5.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-graphics/xorg-font/encodings_1.0.5.bb b/meta/recipes-graphics/xorg-font/encodings_1.0.5.bb
> index a39609b5da..b161a46982 100644
> --- a/meta/recipes-graphics/xorg-font/encodings_1.0.5.bb
> +++ b/meta/recipes-graphics/xorg-font/encodings_1.0.5.bb
> @@ -10,7 +10,7 @@ PE = "1"
>  PR = "${INC_PR}.1"
>  
>  DEPENDS = "mkfontscale-native mkfontdir-native font-util-native"
> -RDEPENDS_${PN} = ""
> +RDEPENDS_${PN} = "mkfontdir mkfontscale"
>  
>  SRC_URI += "file://nocompiler.patch"
>  SRC_URI[md5sum] = "bbae4f247b88ccde0e85ed6a403da22a"

I don't think these two patches are correct. encodings doesn't install
these things so perhaps it shouldn't be running these postinst at all?

I thought I remembered something about this change:

http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=b8f089512f65a4a131c8096c281c4f3d9cf23718

from 2013! Sadly the commit log is a bit sparse.

Cheers,

Richard

