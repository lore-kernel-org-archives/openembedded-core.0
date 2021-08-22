Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web09.9924.1629637589555150161
 for <openembedded-core@lists.openembedded.org>;
 Sun, 22 Aug 2021 06:06:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=TXyCWqpa;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f45.google.com with SMTP id e5so5266005wrp.8
        for <openembedded-core@lists.openembedded.org>; Sun, 22 Aug 2021 06:06:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=oMnGZljjttBfGzbo5VLdwZdW8LcQpvIq6zjHXs7RiB8=;
        b=TXyCWqpaH9yuMapQczcBL8QcURjIwfxq8Y0lMO09oF1XkekaYcfYfJi+bQrhKcHU1G
         u3B+u3NRl63IdomcG6x/g/cRofIuTLQ1Nk8WN+pICpKo78d1sSvl3hneMFS8gyUFvGOY
         jI1ru977m7knb4xwD5FuiJ2f4q6iuTjmM4TYI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=oMnGZljjttBfGzbo5VLdwZdW8LcQpvIq6zjHXs7RiB8=;
        b=Ov2gXzV9Ux0QhYkZo7rvtUbOqSLLtuFPFnZ2izxeFkBzwWKWy3Z7F9gVZk2wwKFGrF
         KximMUwWaQ0IaSuQuCJl73kEvfChRXVBCmx7YnZu2PXGYclTXVx+hIFyDmmX0khW+NMV
         azdZyTRDsXsnzF1oimVI6/ZuT8CkmbbaLBZcv2GT4kZvVhmL5QNG9BqVAlZE4aNtdY+I
         eoLP4rKBeeKxbUkmnq0lmgvJb/VJ6xML/IgLdAUHUkkwfbJ7878wyJb51IGhGsH7+ECt
         4qb91mb1yMyACDh2Dg6+IwcfpUz9LdoNn8LuBw6cNgFnq8RHS3W8XA+GzEF0VflhIaeI
         iDmw==
X-Gm-Message-State: AOAM531mnZbA++Q2bgIruN8XBa7wwHHpQHoCRKoRK8tm5xwcZGWc3K8K
	M5mKCu0xfPmQVmZIo7JWy9NFAQ==
X-Google-Smtp-Source: ABdhPJzQ/eqoyZ487SvjQE2z+f4eMMxXXuCY4ZUpORYrN4rc5skckUQoCCtmEkHuIsTQ5i3LWEV/dQ==
X-Received: by 2002:a5d:6108:: with SMTP id v8mr8584478wrt.96.1629637588033;
        Sun, 22 Aug 2021 06:06:28 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:9821:d2f9:6401:2f3c? ([2001:8b0:aba:5f3c:9821:d2f9:6401:2f3c])
        by smtp.gmail.com with ESMTPSA id v1sm11622311wrt.93.2021.08.22.06.06.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Aug 2021 06:06:27 -0700 (PDT)
Message-ID: <c053b701b5a7d88cfc871cd461a8482349f0c809.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 02/55] binutils: do not build-depend on target flex/bison/zlib.
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Sun, 22 Aug 2021 14:06:26 +0100
In-Reply-To: <20210822125103.310416-2-alex.kanavin@gmail.com>
References: <20210822125103.310416-1-alex.kanavin@gmail.com>
	 <20210822125103.310416-2-alex.kanavin@gmail.com>
User-Agent: Evolution 3.40.2-1build1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2021-08-22 at 14:50 +0200, Alexander Kanavin wrote:
> This lengthens dependency chains unnecessarily, and -native
> versions are already included in DEPENDS.
> 
> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ---
>  meta/recipes-devtools/binutils/binutils_2.37.bb | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/meta/recipes-devtools/binutils/binutils_2.37.bb b/meta/recipes-devtools/binutils/binutils_2.37.bb
> index ff9377049b..e0fea913a3 100644
> --- a/meta/recipes-devtools/binutils/binutils_2.37.bb
> +++ b/meta/recipes-devtools/binutils/binutils_2.37.bb
> @@ -1,8 +1,6 @@
>  require binutils.inc
>  require binutils-${PV}.inc
>  
> -DEPENDS += "flex bison zlib"
> -

This is something which has caused a lot of problems in the past. In particular,
if something touches (patches( one of the pre-generated files or we use a git
version of binutils this breaks. It also seemed to depend on the host version of
patch used.

For zlib, is the recipe using the binary only or the library? If the latter,
that also proves problematic.

I appreciate it may have passed autobuilder testing but I suspect that isn't
enough for real work use.

Also, the target version would still need these?

I like the idea of streamlining dependencies but this one needs some further
checks...

Cheers,

Richard

