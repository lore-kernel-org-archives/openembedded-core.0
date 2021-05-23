Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web08.8835.1621766291830963085
 for <openembedded-core@lists.openembedded.org>;
 Sun, 23 May 2021 03:38:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ZyoMPUb9;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f43.google.com with SMTP id i17so25424164wrq.11
        for <openembedded-core@lists.openembedded.org>; Sun, 23 May 2021 03:38:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=M9EcZEdV53Ra+m2XMXKGtLm7PWSuhvjIDdHl/KHjI9g=;
        b=ZyoMPUb9D9Fx+FwEmdSysDDmDtsyWiPIPJkrUuWTAAPMYwtkc5fDshSBGl0Hh9mnpk
         hOWnkhT975V8ARnLxYr4Xxd/290derYjcct9j4HuuJb+Wy+wGucYF7fKDVJ2WubR0xOG
         qhQLYSV7HRutF4r7h3xd4bQT7QfxJhC6pmzms=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=M9EcZEdV53Ra+m2XMXKGtLm7PWSuhvjIDdHl/KHjI9g=;
        b=HIJIsjebwjyCdwpW7VKnNsP+HoKSzFT7RJjiF7XDElMLOGUP0WvVkLA6VUxFKA2iSZ
         Vu1jf57H1M6tlV9kxfE/7BftWQXWuKcEpkNcFeHtuvy+r7iXOED7JLAIf3FreqUCdlI8
         z/JZ07g01EHKVjoPh9K3w2IFCg0mGeHC7Q7+0oLhjt4oP8+VHmdUfXrikhqFX49242pO
         fcZf43X6rLGMCinWQIaCgNxgK6w0R8dTa+RaQT+Zjn+ZLh/yeStMiFhtfGVsVcq34fAN
         y4PFKi+Lk4QjPX1hjXmCBA2ckDzIX2hrAhhky9k+wA833W5dx51o2bYWxntGIuHx5x9w
         VTZA==
X-Gm-Message-State: AOAM5326qFEs/JP/wwvOgzEBI/ocuItmBGpxeX9mxlq19qOHOFJSt42z
	hh/IDaJUl92tQKjEXFBVoNITjA==
X-Google-Smtp-Source: ABdhPJxMaQow0BckQ1PHM1/FFgLehmDrNi/D99i4Ja9cib6B8QxVZ9gITubKIC8kza8ytCLa7ce2CQ==
X-Received: by 2002:a05:6000:1001:: with SMTP id a1mr17005548wrx.59.1621766290061;
        Sun, 23 May 2021 03:38:10 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:1075:d183:bd61:df76? ([2001:8b0:aba:5f3c:1075:d183:bd61:df76])
        by smtp.gmail.com with ESMTPSA id n129sm4743872wma.19.2021.05.23.03.38.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 May 2021 03:38:09 -0700 (PDT)
Message-ID: <8a1dc1e96b491d0da3a8062a7941a63435eaffdf.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] glibc: Enable memory tagging for aarch64
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
Date: Sun, 23 May 2021 11:38:09 +0100
In-Reply-To: <20210523043047.2398841-1-raj.khem@gmail.com>
References: <20210523043047.2398841-1-raj.khem@gmail.com>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Sat, 2021-05-22 at 21:30 -0700, Khem Raj wrote:
> Glibc on aarch64 has a memory tagging option that can be enabled
> via GLIBC_TUNABLES="glibc.mem.tagging=$SOMETHING" when glibc
> is built with memory tagging support and the kernel/HW supports
> MTE. There should be no side effects unless the user turns it
> on with approprate HW support
> 
> Linux 5.4 headers and binutils 2.33.1 or newer is needed.
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/recipes-core/glibc/glibc_2.34.bb | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/meta/recipes-core/glibc/glibc_2.34.bb b/meta/recipes-core/glibc/glibc_2.34.bb
> index 0deb727ae4..37cf8ed85f 100644
> --- a/meta/recipes-core/glibc/glibc_2.34.bb
> +++ b/meta/recipes-core/glibc/glibc_2.34.bb
> @@ -91,6 +91,7 @@ EXTRA_OECONF += "${@get_libc_fpu_setting(bb, d)}"
>  
> 
> 
> 
>  EXTRA_OECONF_append_x86 = " --enable-cet"
>  EXTRA_OECONF_append_x86-64 = " --enable-cet"
> +EXTRA_OECONF_append_aarch64 = " --enable-memory-tagging"
>  
> 
> 
> 
>  PACKAGECONFIG ??= "nscd"
>  PACKAGECONFIG[nscd] = "--enable-nscd,--disable-nscd"

glibc 2.34 doesn't exist in master? :)

Cheers,

Richard

