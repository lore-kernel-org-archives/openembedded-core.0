Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web09.4329.1623102200271924462
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Jun 2021 14:43:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=RF2K5Jk0;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f45.google.com with SMTP id c9so10540054wrt.5
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Jun 2021 14:43:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=hcduuQU4za3gydfB1FYFmKBOOwvLK8TLjtH4PVuk9p0=;
        b=RF2K5Jk0veTrj2vUT8Ux1PS0gDcnJbTivcZSfJ6H/r45XzIYJpoL2kLeOMCfFc2WYa
         xpZVesJbJtPmAKPMiPQZHY/cgu815oUhkOe5bmR57kmc4BPk785foAvHE2x2wSZAle0z
         f1v+OpHF5EHRW+JsH6as+m8kIKPVKQWR8huMY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=hcduuQU4za3gydfB1FYFmKBOOwvLK8TLjtH4PVuk9p0=;
        b=LZ2Qq3ExqsC5/yQ9uCWdWIiAS+QOax0JC5nJphibdvqObhtxJtQozgiem6e9wDeSjs
         ssoI+D0pVADnFZrbP6piSjFHjlnPYD7YqHR4lUU4ERL4ZY2xNqkEw5/s56/E59awoxGq
         g5SOULBlGhoJ4AONx7sxDtZjRfMgBhumcp20fMdn8/robliZDTkXGMy55KxUVr7JdpI2
         bESagDVt5YsfOrYoUl9sDRywpuCY8svDv9qDjYKPaQliZMDhwZ3gJ26MI11jBDLiqF+U
         kLnO2T2HJaqrj2/BwN0ACoOdzjaCGhaS4cbO0ZCukhZkyLbjLAHNtMAMofPUhLvxAGwL
         1ehA==
X-Gm-Message-State: AOAM533MlJAxrTaqWi/a/Br+vXjx8K8/Bk24XECzaOwdh6vV4hBkURWx
	/Zjo3gssrjQ2gPOTNfBSAH5f8Q==
X-Google-Smtp-Source: ABdhPJxNJM3nY8b/advTayx1EDOU0KqO164pE6PUjwqjuY1UvR1NRfiVpdn3/Kz/7rQV1p97MS8bBg==
X-Received: by 2002:a5d:6584:: with SMTP id q4mr19008320wru.230.1623102198554;
        Mon, 07 Jun 2021 14:43:18 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:119e:2d1:fea4:6669? ([2001:8b0:aba:5f3c:119e:2d1:fea4:6669])
        by smtp.gmail.com with ESMTPSA id j7sm15254431wrm.93.2021.06.07.14.43.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jun 2021 14:43:18 -0700 (PDT)
Message-ID: <dccbc4111daf453cec3f7fe60e4da15d1c3e5306.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] lib: oe: utils: always append host gcc version to NATIVELSBSTRING
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: bkylerussell@gmail.com, openembedded-core@lists.openembedded.org
Cc: wesley.lindauer@gmail.com
Date: Mon, 07 Jun 2021 22:43:16 +0100
In-Reply-To: <20210607212558.86624-1-bkylerussell@gmail.com>
References: <20210607212558.86624-1-bkylerussell@gmail.com>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2021-06-07 at 17:25 -0400, bkylerussell@gmail.com wrote:
> By having multiple uninative feeds based on host gcc version (rather than a
> single uninative feed for all possible host gcc versions), we avoid a general
> class of problems (as first observed in the bug below) where changes in native
> gcc don't cause native sstate to regenerate.  Below is another example where
> this problem is encountered across multiple supported host distros for a given
> poky version.
> 
> gcc 6 supports default generation of PIE, which gets enabled between Ubuntu
> 16.04 (default gcc 5.4) and 18.04 (default gcc 7.5), both supported distros
> of warrior.  Consider a native package dependency chain as follows:
> 
>      A
>    / | \
>   B  C  D
> 
> If a complete set of native sstate for the above packages is built prior
> to the default PIE change, but a workstation upgrades its distro to a version
> that natively compiles PIE by default, the sstate hash is not currently tainted,
> so the newer compiler version will pull from sstate not compiled for PIE.
> 
> For example, if a source change to C causes part of the above chain to rebuild
> (C -> A), then this may result in non-PIE sstate (B and D) giving link errors
> with A.
> 
> ld: relocation R_X86_64_32 against `.rodata.str1.8' can not be used when making a PIE object; recompile with -fPIC
> ld: final link failed: Nonrepresentable section on output
> 
> This appears to have been considered previously as an option to address
> the following bug, but appears to have been set aside only because of
> proximity to the end of a release cycle.
> 
> [YOCTO #10441]

https://bugzilla.yoctoproject.org/show_bug.cgi?id=10441

This doesn't look quite right?

> Signed-off-by: Kyle Russell <bkylerussell@gmail.com>
> ---
>  meta/lib/oe/utils.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/lib/oe/utils.py b/meta/lib/oe/utils.py
> index a84039f585..8afe19fd99 100644
> --- a/meta/lib/oe/utils.py
> +++ b/meta/lib/oe/utils.py
> @@ -426,7 +426,7 @@ def host_gcc_version(d, taskcontextonly=False):
>          bb.fatal("Can't get compiler version from %s --version output" % compiler)
>  
> 
> 
> 
> 
> 
> 
> 
>      version = match.group(1)
> -    return "-%s" % version if version in ("4.8", "4.9") else ""
> +    return "-%s" % version

This is a huge performance penalty to put onto the build unfortunately and I really
don't want to do that by default on the autobuilder. We haven't seen many of these
errors on the autobuilder and I'm reluctant to take the performance hit on our testing.

There were specific issues with gcc 4.8 and 4.9 which required separate sstate. Do we
know which gcc version switched the default and can we force older gcc's to use the 
same default or does it not work? I'm wondering if we could split off a "nopic" verison
of sstate for example for the older gccs?

Cheers,

Richard



