Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com [209.85.216.66])
 by mx.groups.io with SMTP id smtpd.web10.1868.1591320524932262092
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Jun 2020 18:28:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=hJUJ8GvS;
 spf=pass (domain: gmail.com, ip: 209.85.216.66, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f66.google.com with SMTP id jz3so1909448pjb.0
        for <openembedded-core@lists.openembedded.org>; Thu, 04 Jun 2020 18:28:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=v0Sl0+Rpo+UMFKROQ5QkLCY0YxwFKqqKuJKPxCycuUs=;
        b=hJUJ8GvSzcnxiQCsCmj1LZmecOIdvqdtip0ufAAQIBF08Uq66Q04Wz0iO568o8T0yp
         oXp6WoTzOxuuI34o2oHHoJffMV1yE9Clw96OlL3m4U/3N4/IrocyAScbVANRGjmkmrIi
         HW5QB7YXQ3KZ5dHFteqK2yJN7Q/8LAGTT6O6pi/Azxk8I27z/baqQfyoKguaY+1YYvMa
         EpGO8ZndydGdTesj4YIL82KrwCm4gro8VrIc1PcgNsG3YHodpjR3n1gmP7bYrWwV+hiN
         lYTMfKwbcr+BYWwMBU9qzP3sEoZcS0qnS8KWbSAhozWmN3E9x+ndFg6idUDfbU5qg4dO
         iwqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=v0Sl0+Rpo+UMFKROQ5QkLCY0YxwFKqqKuJKPxCycuUs=;
        b=Ai7JaFzu5h36oBD81bD8F0TCrUtJKaMraiSnRn3erMvYsgtadm9Yf3Kk9TU9xSDaXv
         OnUa2kVDGhCSc20fidKg4TlFISkVg789F06ht20hujruHvPyCks5/iM5gnAGKCXnxmm1
         s+sMD78dPdbutJLlD4z8syxeDoZnH3B8jDCNUq7Wb9EHPCOwp6aqrLQ0nQ6evNgVU8rd
         0qUvYYCWLQvbUYDAiQDENQn654g7LqDlVnF5mSeJa0rJ+Q7yTzTfUbZ3+0z6zukXkVky
         k6kcm1zJtbQ8WnWskwTaHe3KaLGznUXjO7QtOaquRvEWpJ0nEqj3is8EJONsXmdv6alq
         23qw==
X-Gm-Message-State: AOAM531FEC6PvmvlbOMKW0bV4oh1gEuBgfS/VievGOzTfLiT2GkOWeJi
	/qS8bhI2ORrAYYehCtPfSfJUEHhFEHE=
X-Google-Smtp-Source: ABdhPJyduA30qtbefmrrGWc5iOiK65jKqOH3x6LiwHER7j3NJqICBVEIC2SU3wNx6iIsB/YJhhZeWQ==
X-Received: by 2002:a17:90b:46ca:: with SMTP id jx10mr175862pjb.3.1591320523814;
        Thu, 04 Jun 2020 18:28:43 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:4e0:392e:a386:560f:8a74? ([2601:646:9200:4e0:392e:a386:560f:8a74])
        by smtp.gmail.com with ESMTPSA id u5sm6237436pjv.54.2020.06.04.18.28.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Jun 2020 18:28:43 -0700 (PDT)
Subject: Re: [OE-core] [PATCH] cairo: Do not try to remove nonexistent directories
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
 openembedded-core@lists.openembedded.org
References: <20200602090605.8897-1-pkj@axis.com>
From: "Khem Raj" <raj.khem@gmail.com>
Message-ID: <e97961b7-0724-4625-84f7-21399b185a21@gmail.com>
Date: Thu, 4 Jun 2020 18:28:42 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200602090605.8897-1-pkj@axis.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 6/2/20 2:06 AM, Peter Kjellerstedt wrote:
> Commit 0e1f8fa0 (bitbake.conf: propagate 'opengl' DISTRO_FEATURE to
> native/nativesdk from target) changed the default PACKAGECONFIG for
> native and nativesdk so that it becomes empty unless "x11" is in
> DISTRO_FEATURES since "trace" was also removed (propbably
> unintentionally). This highlighted than an empty PACKAGECONFIG would
> lead to a build failure since /usr/bin is never created under these
> conditions, but the recipe still tried to remove it.
> 

looking at above commit, its doing
PACKAGECONFIG_class-native = "${@bb.utils.filter('DISTRO_FEATURES', 
'x11', d)}"
PACKAGECONFIG_class-nativesdk = "${@bb.utils.filter('DISTRO_FEATURES', 
'x11', d

there are cases where we build firmware's with and without x11 in distro
features, now we have another set of native and nativesdk packages to 
build. Scratch builds from release to release are getting longer and 
longer, using shared state hides the problem, but first build experience 
is quite not as good.

> Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> ---
>   meta/recipes-graphics/cairo/cairo_1.16.0.bb | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/recipes-graphics/cairo/cairo_1.16.0.bb b/meta/recipes-graphics/cairo/cairo_1.16.0.bb
> index 092c77b826..195a66b37d 100644
> --- a/meta/recipes-graphics/cairo/cairo_1.16.0.bb
> +++ b/meta/recipes-graphics/cairo/cairo_1.16.0.bb
> @@ -70,8 +70,10 @@ do_install_append () {
>   	rm -rf ${D}${libdir}/cairo/cairo-sphinx*
>   	rm -rf ${D}${libdir}/cairo/.debug/cairo-fdr*
>   	rm -rf ${D}${libdir}/cairo/.debug/cairo-sphinx*
> -	rmdir -p --ignore-fail-on-non-empty ${D}${bindir}
> -	rmdir -p --ignore-fail-on-non-empty ${D}${libdir}/cairo
> +	[ ! -d ${D}${bindir} ] ||
> +		rmdir -p --ignore-fail-on-non-empty ${D}${bindir}
> +	[ ! -d ${D}${libdir}/cairo ] ||
> +		rmdir -p --ignore-fail-on-non-empty ${D}${libdir}/cairo
>   }
>   
>   PACKAGES =+ "cairo-gobject cairo-script-interpreter cairo-perf-utils"
> 
> 
> 
> 
