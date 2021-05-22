Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web11.3650.1621662120901102932
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 May 2021 22:42:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=L/rvE5Ot;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f49.google.com with SMTP id f6-20020a1c1f060000b0290175ca89f698so8488721wmf.5
        for <openembedded-core@lists.openembedded.org>; Fri, 21 May 2021 22:42:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=S6WK3/B0lSvv83x+f248PU39fezS6Q4ElnPmkAyAIGI=;
        b=L/rvE5OtO0y6sIU1jdH4lM19SLrMVKP8RJgYY19njDU3WkKdZhj3Q4qnGP1zSAgMxS
         Qzer4FqDnM1Ndxgtp8emLE9XZNLAE34zNNc7JyJ/SMgedYHj5ZlivRhImSi/umpD5vua
         2sRDckFYvWKDLe+iysd6GE31ZMJxaWb3ewLug=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=S6WK3/B0lSvv83x+f248PU39fezS6Q4ElnPmkAyAIGI=;
        b=pPorr/fjA/IEIrZJODntKJOANZ8XnSDSAOHj7FVeS71QBXvHc68dzmUXhL75kpKRIW
         RQphaI8VY6nzGkLh3yKaRB9N112ew5ZDYbTDH6Hi/ZqE3gQYxs2akaohjocEe7BzLJ22
         IKUfYo5aiURvA3fpDKwYB6cDepwacNbDVHVlgAfJ9WjradX/5UgmFyZvQKLeOon615kh
         qzjBg5KcJIEdrdls72fFLCpuTOu0JBI72xh5F9w6+XJiFH/AoKJ0wu3SVw+T0Jze9zIP
         7CZCtcxkjG13+eB9uTCuLp9qhinAOeLy9zfkFhPLXEIA6ZdrczxPwopNutdhTWl1AnIa
         fRFQ==
X-Gm-Message-State: AOAM531RsuY2iLYlggxzQQHk4dZSn3mZMxwnhMpByrIsZXKJf+KpErzB
	eV/n0sTquDwdR6pLj8FhU2dPXA==
X-Google-Smtp-Source: ABdhPJzi0MFUvoSxXTHwWkslqPCAtLE0Qgp5uor6orOgedsrdN+L0nnB/pr/mVADrmXWleML1jvlJQ==
X-Received: by 2002:a1c:638b:: with SMTP id x133mr12077856wmb.182.1621662119288;
        Fri, 21 May 2021 22:41:59 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:39e6:11a6:599d:95f2? ([2001:8b0:aba:5f3c:39e6:11a6:599d:95f2])
        by smtp.gmail.com with ESMTPSA id f13sm4425515wrt.86.2021.05.21.22.41.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 May 2021 22:41:59 -0700 (PDT)
Message-ID: <ea6eee79c5a985e385579eda3786c515dbfdd5a1.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v3] Revert "gcc-cross-canadian: Add symlink to real-ld alongside other symlinks"
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Samuli Piippo <samuli.piippo@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Sat, 22 May 2021 06:41:58 +0100
In-Reply-To: <20210521143328.3368988-1-samuli.piippo@qt.io>
References: <20210521143328.3368988-1-samuli.piippo@qt.io>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Fri, 2021-05-21 at 17:33 +0300, Samuli Piippo wrote:
> This reverts commit cdd86896c8d29135f937968e9aa07f919cf543d3.
> 
> real-ld is always used if that is found, which means you cannot
> switch between bfd and gold linkers using -fuse-ld gcc option.
> 
> Signed-off-by: Samuli Piippo <samuli.piippo@qt.io>
> ---
>  meta/recipes-devtools/gcc/gcc-cross-canadian.inc | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/meta/recipes-devtools/gcc/gcc-cross-canadian.inc b/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
> index 878feaf810..e8fbb6186b 100644
> --- a/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
> +++ b/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
> @@ -131,8 +131,6 @@ do_install () {
>  
> 
> 
> 
>  		ln -sf ${BINRELPATH}/${TARGET_PREFIX}$t$suffix $dest$t$suffix
>  	done
> -	t=real-ld
> -	ln -sf ${BINRELPATH}/${TARGET_PREFIX}ld$suffix $dest$t$suffix
>  
> 
> 
> 
>  	# libquadmath headers need to  be available in the gcc libexec dir
>  	install -d ${D}${libdir}/gcc/${TARGET_SYS}/${BINV}/include/

It seems the issue that commit fixed back in 2015 is still there if 
we revert this:

https://autobuilder.yoctoproject.org/typhoon/#/builders/44/builds/3490/steps/26/logs/stdio

Cheers,

Richard

