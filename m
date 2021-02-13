Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web11.1640.1613210530461634458
 for <openembedded-core@lists.openembedded.org>;
 Sat, 13 Feb 2021 02:02:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=O2wOWuVZ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f53.google.com with SMTP id g10so2490239wrx.1
        for <openembedded-core@lists.openembedded.org>; Sat, 13 Feb 2021 02:02:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=/XLJOKCkEgfSEx+iNRS+57pwH+rkyFZYtgQrDC6+x7Q=;
        b=O2wOWuVZzJr7SiZVVhEDy1JjNRusPN5kIqvsixGyLPNcgxYJVtPYwJhWY7yKxZUXuT
         QFWxl+Kqm+vlw9vkMIHloOE2M0uoOCCKKBrAh5WImLuADXUaY8kz2sMY0G9/QAemqvkH
         OGnJI6jznBYXe6a2QRDMaWhJ/SfXZ7UyiJFmA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=/XLJOKCkEgfSEx+iNRS+57pwH+rkyFZYtgQrDC6+x7Q=;
        b=jUuHko91o9xX9S116mEx3mMdsfum0WYn7Y0AdlsJeJErIc+kACd8sVQCOQLsqdPISw
         9t7zoEzcfMViE9MRNCLn3T/AWXLXlTNYp/XEw7Sc2l+n8XE2ZFrY0nLokXpEtVfdX5JR
         sDnWacs3XA8PTsduNcbhXbkfi4OBJdFzIm/VLk1MAL8NWYagefTwJxIkAfnW/1BaUJwy
         L3M9WW/nZ/NR0QjYjxGuxTGnyxxzVvUEajuZtvpqbC8gVSXpAmeawRPXk2k3DTuHucK5
         LosjZ6+gLR4aMZIsbwL9MXtUXs6w07mlqui4aC99gVvfudGeiGujbmpannp+Ydot6iYb
         8d0Q==
X-Gm-Message-State: AOAM532PfIRhGqbKt4KZjFYDZYOS711hLmZh9096rgz7gEYI1ekg74Af
	j8VvGms2tyTAwQpWpVQao+CrhA==
X-Google-Smtp-Source: ABdhPJy2uei5BqrlOBfRb7V1Rm4KP+lH2s0OTwEq3XVR0NaklsQ6LbXdAzl/qT8K7wcewcv/ZD3WkQ==
X-Received: by 2002:adf:f7c5:: with SMTP id a5mr8174064wrq.243.1613210528937;
        Sat, 13 Feb 2021 02:02:08 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:91a5:e7fd:31d5:331? ([2001:8b0:aba:5f3c:91a5:e7fd:31d5:331])
        by smtp.gmail.com with ESMTPSA id q2sm8417390wrx.79.2021.02.13.02.02.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Feb 2021 02:02:08 -0800 (PST)
Message-ID: <fb179fd9d774c95c5a5529b024a9cd8b9b30d1e2.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] autoconf: Add missing perl modules to rdeps
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
Date: Sat, 13 Feb 2021 10:02:05 +0000
In-Reply-To: <20210212075952.1032920-1-raj.khem@gmail.com>
References: <20210212075952.1032920-1-raj.khem@gmail.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2021-02-11 at 23:59 -0800, Khem Raj wrote:
> Calling autoreconf with on-device sdk fails due to missing perl modules
> which are required for it to work with autoconf 2.71+
> 
> Fixes
> Can't locate File/Temp.pm in @INC (you may need to install the File::Temp module) (@INC contains: /usr/share/autoconf /usr/lib/perl5/site_perl/5.32.0/riscv32-linux /usr/lib/perl5/site_perl/5.32.0 /usr/lib/per
> l5/vendor_perl/5.32.0/riscv32-linux /usr/lib/perl5/vendor_perl/5.32.0 /usr/lib/perl5/5.32.0/riscv32-linux /usr/lib/perl5/5.32.0 .) at /usr/bin/autoreconf line 50.
> BEGIN failed--compilation aborted at /usr/bin/autoreconf line 50.
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/recipes-devtools/autoconf/autoconf_2.71.bb | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/meta/recipes-devtools/autoconf/autoconf_2.71.bb b/meta/recipes-devtools/autoconf/autoconf_2.71.bb
> index e5098106f8..8526067201 100644
> --- a/meta/recipes-devtools/autoconf/autoconf_2.71.bb
> +++ b/meta/recipes-devtools/autoconf/autoconf_2.71.bb
> @@ -40,10 +40,13 @@ RDEPENDS_${PN} = "m4 gnu-config \
>  		  perl-module-file-spec \
>  		  perl-module-file-spec-unix \
>  		  perl-module-file-stat \
> +                  perl-module-file-temp \
>  		  perl-module-getopt-long \
>  		  perl-module-io-file \
> +                  perl-module-list-util \
>  		  perl-module-overloading \
>  		  perl-module-posix \
> +                  perl-module-scalar-util \
>  		  perl-module-symbol \
>  		  perl-module-thread-queue \
>  		  perl-module-threads \

This breaks builds of SDKs. I'll send a patch to fix it.

Cheers,

Richard

