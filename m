Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web10.63.1610710022402409313
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Jan 2021 03:27:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=NJmjrMgm;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f52.google.com with SMTP id w5so8888879wrm.11
        for <openembedded-core@lists.openembedded.org>; Fri, 15 Jan 2021 03:27:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=Wf/96r3BYAPw5XmPIHGfsSn1ju6QbHkZhAp9wnlfv6g=;
        b=NJmjrMgmmt+D0vHEFSau3ob4gdVMTfooBO87USt7Qr4WQi4mKblH0CwWdJv7OmPafx
         13CHTBPE3IJWoQm/2e4H7iPQgWY7pMP+14JhymtRsZlwreGgBn2Sgw29/O1yMHBIlujN
         h/jnEjpkEl5S0CkKWokYlRKeT8V4wMnAVaj7o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=Wf/96r3BYAPw5XmPIHGfsSn1ju6QbHkZhAp9wnlfv6g=;
        b=GbCtbix4/asXHd6JhElH/D0B8SSZqX0vZAN7/pxwlwRLIq48WjZ9rrEyuUMjIqmNm4
         ToWVs5qXN0x8i2EU7PDOrq6LUuVxiT0nPeCuUlN0u26Z5H/gziFynBo7BaZZvEpKwxni
         2QeQGGEIko1QVC+Z+v+DnlywjL4HZd3jECa8HOfj/hzU6N68TOK5v9OkDB9xyHCuYPbC
         QVhO7lJYdeKFJ42owbthlSUTkUmWNtimCuFBYtI5qTRQeS1Z9Bn1BeRWUGaBhyU1f8hT
         VN0LWgQ5ydwabO8iiUdoTuEANl5GVDvg7HKneT9Dd85FyHUXxoluOaoLtMwMzOiE07l3
         /6/w==
X-Gm-Message-State: AOAM5300ZEfCEfM76SGl42tzBsfQUuk3qqukcdBq6JnC8+qfaSKBSOha
	3vhlYGFzcLHwrqbNnMEQnNUXRQ==
X-Google-Smtp-Source: ABdhPJzyVQmuz0RgMKrtRa/s+ooyctT+y/8Ys12AruouQVY35MynOwjREBLw65cvluMfiRq0TG6U2w==
X-Received: by 2002:a5d:47ae:: with SMTP id 14mr12469571wrb.378.1610710021063;
        Fri, 15 Jan 2021 03:27:01 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:974a:2423:c71:b423? ([2001:8b0:aba:5f3c:974a:2423:c71:b423])
        by smtp.gmail.com with ESMTPSA id s13sm15368545wra.53.2021.01.15.03.27.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Jan 2021 03:27:00 -0800 (PST)
Message-ID: <adca85be61ff1fa0f2c4cb0d4a2093daa0d65b48.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 2/3] apt: add nativesdk support
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: hongxu <hongxu.jia@windriver.com>, 
	openembedded-core@lists.openembedded.org
Date: Fri, 15 Jan 2021 11:26:59 +0000
In-Reply-To: <20210115094536.18651-2-hongxu.jia@windriver.com>
References: <20210115094536.18651-1-hongxu.jia@windriver.com>
	 <20210115094536.18651-2-hongxu.jia@windriver.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Fri, 2021-01-15 at 17:45 +0800, hongxu wrote:
> 1. Add nativesdk support
> - Apply the same patches of native
> - Generate the same apt.conf.sample of native
> 
> 2. Create user '_apt' to fix apt runtime warning
> [snip]
> $ apt update
> ...
> W: No sandbox user '_apt' on the system, can not drop privileges
> [snip]
> 
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>  meta/recipes-devtools/apt/apt_1.8.2.1.bb | 24 +++++++++++++++++++++---
>  1 file changed, 21 insertions(+), 3 deletions(-)
> 
> diff --git a/meta/recipes-devtools/apt/apt_1.8.2.1.bb b/meta/recipes-devtools/apt/apt_1.8.2.1.bb
> index de0e150a2e..57bd7ca600 100644
> --- a/meta/recipes-devtools/apt/apt_1.8.2.1.bb
> +++ b/meta/recipes-devtools/apt/apt_1.8.2.1.bb
> @@ -17,6 +17,12 @@ SRC_URI_append_class-native = " \
>             file://0001-Do-not-configure-packages-on-installation.patch \
>             "
>  
> 
> 
> 
> 
> 
> 
> 
> +SRC_URI_append_class-nativesdk = " \
> +           file://0001-Do-not-init-tables-from-dpkg-configuration.patch \
> +           file://0001-Revert-always-run-dpkg-configure-a-at-the-end-of-our.patch \
> +           file://0001-Do-not-configure-packages-on-installation.patch \
> +           "
> +
>  SRC_URI[sha256sum] = "6d447f2e9437ec24e78350b63bb0592bee1f050811d51990b0c783183b0983f8"
>  LIC_FILES_CHKSUM = "file://COPYING.GPL;md5=b234ee4d69f5fce4486a80fdaf4a4263"
>  
> 
> 
> 
> 
> 
> 
> 
> @@ -24,9 +30,12 @@ LIC_FILES_CHKSUM = "file://COPYING.GPL;md5=b234ee4d69f5fce4486a80fdaf4a4263"
>  # so we check the latest upstream from a directory that does get updated
>  UPSTREAM_CHECK_URI = "${DEBIAN_MIRROR}/main/a/apt/"
>  
> 
> 
> 
> 
> 
> 
> 
> -inherit cmake perlnative bash-completion upstream-version-is-even
> +inherit cmake perlnative bash-completion upstream-version-is-even useradd
> +
> +USERADD_PACKAGES = "${PN}"
> +USERADD_PARAM_${PN} = "--system --home /nonexistent --no-create-home _apt"
> 

I think meta-selftest/files/static-passwd  will need this adding for
the selftests to pass?

Cheers,

Richard

