Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com [209.85.221.67])
 by mx.groups.io with SMTP id smtpd.web12.9061.1603365707834464808
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Oct 2020 04:21:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=QG/bpGix;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.67, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f67.google.com with SMTP id n18so1863368wrs.5
        for <openembedded-core@lists.openembedded.org>; Thu, 22 Oct 2020 04:21:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=01cJu3+PjEkXSlchYlBSI4H81tLUWuLDZMcxSdFnWZ4=;
        b=QG/bpGix3jkxVblppvnaf/GB3S7tYinwKXbARTSITO6CuV8JycRRWO40Ga4X23NgCv
         c1YSxiIr7kAU8S8iYuLeeXpaYzDCPRIgQb3dzqHvuOMh2meVCbX2RDEuPGm0YTjKJ7ej
         xuYV8nIhdLdcXYj18WwapQ3xl8o/m/bB/mP9Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=01cJu3+PjEkXSlchYlBSI4H81tLUWuLDZMcxSdFnWZ4=;
        b=Hyqj2wk8QoGM1C8r8Z+UPK4OR7YBLoR5BONY5ToKSqdNKPRTB1XePE1e/ngKETypkd
         FTrkqBQcEzd5L79jch/GmOL0EnL4fCvUgcKzUmYgVeKUOxBtsasAhFRYsZx0QDf70uVi
         PmmLg3HQLdeO4DKhn0PC1ahTWedFGleTpPAsR1mJ1w2XP8P08UIdfCyBEyUogYqYObeL
         kFzTznLaLRdb8dvkQGhSHMMDgU4ieMlXwwDsZ+53ZeL4YcICAue5R4v3Qg40R/5JoB0m
         +s1BKE8ZRPUqJuzN5MKHRa9zZszyV+XDcYOhLfjZcoYKK/L241r02wIJuquyGiy9h+4V
         lP5Q==
X-Gm-Message-State: AOAM532/DSbVghewrud6lF+EWEaYXhDSwm7Dc0NNXWXwuwI2d57dLl+A
	7SXpMgkdPX1tuXCCOJk2q4EIjQ==
X-Google-Smtp-Source: ABdhPJykkJkRVrNNUgJyyuYS4OfQjvmnNy9+fkYwOxLQVNC1ECttmh2spG/wrx2qKtPNkv9X5FoMgQ==
X-Received: by 2002:a5d:5092:: with SMTP id a18mr2050987wrt.323.1603365706242;
        Thu, 22 Oct 2020 04:21:46 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from a.6.3.d.1.f.b.7.5.5.7.b.f.2.d.5.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (a.6.3.d.1.f.b.7.5.5.7.b.f.2.d.5.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:5d2f:b755:7bf1:d36a])
        by smtp.gmail.com with ESMTPSA id d129sm2615431wmf.19.2020.10.22.04.21.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2020 04:21:45 -0700 (PDT)
Message-ID: <fc17d89c9c358f70c4b54eb2bc654f991d055890.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 1/1] meta-environment: fix site-config files identical for multilib
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: kai <kai.kang@windriver.com>, openembedded-core@lists.openembedded.org
Date: Thu, 22 Oct 2020 12:21:43 +0100
In-Reply-To: <20201021073233.40046-2-kai.kang@windriver.com>
References: <20201021073233.40046-1-kai.kang@windriver.com>
	 <20201021073233.40046-2-kai.kang@windriver.com>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2020-10-21 at 15:32 +0800, kai wrote:
> From: Kai Kang <kai.kang@windriver.com>
> 
> When multilib is enabled, such as:
> 
> require conf/multilib.conf
> MACHINE = "qemuarm64"
> MULTILIBS = "multilib:lib32"
> DEFAULTTUNE_virtclass-multilib-lib32 = "armv7vethf"
> 
> the site-config files created by meta-environment are identical but
> should not.
> 
> HOST_ARCH is overwritten when inherit cross-canadian, so it fails to get
> right site files for meta-environment. There is a Yocto defect #10255 to
> handle it. But multilib is not covered.
> 
> Save multilib related site files before inherit cross-canadian and
> construct site-config-* file for multilib correctly.
> 
> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ---
>  meta/classes/toolchain-scripts.bbclass     | 47 ++++++++++++++++++++--
>  meta/recipes-core/meta/meta-environment.bb |  2 +-
>  2 files changed, 45 insertions(+), 4 deletions(-)
> 
> diff --git a/meta/classes/toolchain-scripts.bbclass b/meta/classes/toolchain-scripts.bbclass
> index db1d3215ef..8ce6489d10 100644
> --- a/meta/classes/toolchain-scripts.bbclass
> +++ b/meta/classes/toolchain-scripts.bbclass
> @@ -163,16 +163,57 @@ TOOLCHAIN_CONFIGSITE_SYSROOTCACHE = "${STAGING_DIR}/${MLPREFIX}${MACHINE}/${targ
>  TOOLCHAIN_NEED_CONFIGSITE_CACHE ??= "virtual/${MLPREFIX}libc ncurses"
>  DEPENDS += "${TOOLCHAIN_NEED_CONFIGSITE_CACHE}"
>  
> +def get_siteinfo_files_ml(d):
> +    siteinfo_files_ml = ''
> +    variants = d.getVar("MULTILIB_VARIANTS") or ""
> +
> +    for item in variants.split():
> +        localdata = bb.data.createCopy(d)
> +        overrides = d.getVar("OVERRIDES", False) + ":virtclass-multilib-" + item
> +        localdata.setVar("OVERRIDES", overrides)
> +        site_files = siteinfo_get_files(localdata)
> +        siteinfo_files_ml += item + '-:' + site_files + ';'
> +
> +    return siteinfo_files_ml
> +
> +SAVED_SITEINFO_FILES_MULTILIBS := "${@get_siteinfo_files_ml(d)}"

I'm a bit worried that we're doing immediate expansion here which is
going to be very order dependent on how/where this class is used.

We also seem to be duplicating functionality into multilib and non
multilib functions which means one path could easily be updated and the
other missed.

I agree there is a bug here but I'm hoping there is some neater way to
fix this which isn't so order dependent and avoids the duplication. I'd
have to spend time looking at what is going on to provide better more
specific feedback though...

Cheers,

Richard

