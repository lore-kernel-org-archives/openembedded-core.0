Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
 by mx.groups.io with SMTP id smtpd.web10.631.1589387416830318183
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 May 2020 09:30:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=f7g3VEpf;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.68, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f68.google.com with SMTP id z72so19622435wmc.2
        for <openembedded-core@lists.openembedded.org>; Wed, 13 May 2020 09:30:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=kyQH2NMSUO4ie1TAk3j0ismD7WWdMKDD7kthRsjTOOU=;
        b=f7g3VEpfYkutaRRvGZhapg7pC8Y2RDaMmiY1zuOaqd0+ZOej7Hm1KZcD/SzjV8EbhU
         0SXVvJYCs6M72Se3h9AfX+f3WTurzPmzp0HOkQFYXPbJXhCgzHgErcEKXFshE660B6D2
         TUcfrsKqFqw3rWVPl3g9ZCVhItijxFKP3+tWI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=kyQH2NMSUO4ie1TAk3j0ismD7WWdMKDD7kthRsjTOOU=;
        b=TeId5Cz2xJirMSWqXOBZmkSq7EiNEkEFIN+eteWwWXXLEoFXazJ6Ozi2ZQQ+MHCAR8
         3402+cjqlP5KF6IlFosRGFp4s74PIN7VG9MhIb0M5Tcmvqy7jeWg5u1UJKU5uFL/W3it
         O+TPBIiXl3MwIos9xfJM9hA9Lthh+SiC9qCIzL7+Xcziz0mxkEgg7S6uQOmbOMmZqbG+
         kUpCzlLQaDRoS9cs/dWv7QO1NISsgpuwIIqsXGg2ir8/MXDEIptcGmrhBinJEChURGDS
         IfPkSnSiakWPSfwW/fZhQjO52Chj0OsI+ggrIjKFG42yHSw4L2mLFWHXUoHGhwy4qBBu
         qoCw==
X-Gm-Message-State: AGi0PuaQKhVINxbqGtZZIsQ9zZ6KqT/t8m20W/ALmCeOydQ9FbfZ351z
	VVbIchU+54rFTjDVrJCNSen7+w==
X-Google-Smtp-Source: APiQypLr4CYAouWI+qaIP8ETiD/jJ436dsZqZdw0A8l7kFgyWZ1yqQrDYb/k/mUXkDA6CEUF4KOgDQ==
X-Received: by 2002:a7b:cc0f:: with SMTP id f15mr46021804wmh.78.1589387415316;
        Wed, 13 May 2020 09:30:15 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id z11sm22694wrr.32.2020.05.13.09.30.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2020 09:30:14 -0700 (PDT)
Message-ID: <04996e180d1529bd6600396f20a38f53db2f6ffe.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH] apt: Remove workarounds for host gcc < 5
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Adrian Bunk <bunk@stusta.de>, openembedded-core@lists.openembedded.org
Date: Wed, 13 May 2020 17:30:13 +0100
In-Reply-To: <20200512203748.8779-2-bunk@stusta.de>
References: <20200512203748.8779-2-bunk@stusta.de>
User-Agent: Evolution 3.36.1-2 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2020-05-12 at 23:37 +0300, Adrian Bunk wrote:
> Signed-off-by: Adrian Bunk <bunk@stusta.de>
> ---
>  .../recipes-devtools/apt/apt-native_1.2.31.bb |  4 +-
>  ...nging-the-global-LC_TIME-for-Release.patch | 80 -------------------
>  ...caled-std-put_time-instead-rolling-o.patch | 46 -----------
>  ...ntrib-strutl.cc-Include-array-header.patch | 33 --------
>  4 files changed, 1 insertion(+), 162 deletions(-)
>  delete mode 100644 meta/recipes-devtools/apt/apt/gcc_4.x_Revert-avoid-changing-the-global-LC_TIME-for-Release.patch
>  delete mode 100644 meta/recipes-devtools/apt/apt/gcc_4.x_Revert-use-de-localed-std-put_time-instead-rolling-o.patch
>  delete mode 100644 meta/recipes-devtools/apt/apt/gcc_4.x_apt-pkg-contrib-strutl.cc-Include-array-header.patch
> 
> diff --git a/meta/recipes-devtools/apt/apt-native_1.2.31.bb b/meta/recipes-devtools/apt/apt-native_1.2.31.bb
> index 5b16b503d5..2952c21017 100644
> --- a/meta/recipes-devtools/apt/apt-native_1.2.31.bb
> +++ b/meta/recipes-devtools/apt/apt-native_1.2.31.bb
> @@ -2,6 +2,4 @@ require apt-native.inc
>  
>  SRC_URI += "file://noconfigure.patch \
>              file://no-curl.patch \
> -            file://gcc_4.x_apt-pkg-contrib-strutl.cc-Include-array-header.patch \
> -            file://gcc_4.x_Revert-avoid-changing-the-global-LC_TIME-for-Release.patch \
> -            file://gcc_4.x_Revert-use-de-localed-std-put_time-instead-rolling-o.patch"
> +"

I think part of this is causing:

https://autobuilder.yoctoproject.org/typhoon/#/builders/50/builds/1892

?

(the selftests in that build run also saw it)

Cheers,

Richard

