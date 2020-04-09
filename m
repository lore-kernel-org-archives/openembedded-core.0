Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com [209.85.221.66])
 by mx.groups.io with SMTP id smtpd.web11.6720.1586431026737759580
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Apr 2020 04:17:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=a3WFJG6V;
 spf=pass (domain: konsulko.com, ip: 209.85.221.66, mailfrom: pbarker@konsulko.com)
Received: by mail-wr1-f66.google.com with SMTP id 65so11506518wrl.1
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Apr 2020 04:17:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=date:from:to:cc:subject:message-id:in-reply-to:references
         :organization:mime-version:content-transfer-encoding;
        bh=B5ztM2PhZlOuN3MzM82aSgE9VchdJKb9cAhp2cxgBYU=;
        b=a3WFJG6VhZtwZbHQ/EbfR/Tl0L/l/hK3dVcFPVaPgSkpe7vehNyVqt68ofW7CDytDj
         lXNxXjFXpiFULgp8f7uOXELFHFPpfxintndML9sfXOOYXqk4nRiLnz5rrLtupzo8sVuX
         mG8icP6Ub75Z/Zee29I3fRW0qy4dFSNbJpwdM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
         :references:organization:mime-version:content-transfer-encoding;
        bh=B5ztM2PhZlOuN3MzM82aSgE9VchdJKb9cAhp2cxgBYU=;
        b=HvuflhOcdWeLawwf9pJ2R9aW2kRQb1RivVO5IKqeKrFFztWoefOCICHio7Gk7M0cko
         6FQRuVk5mSs60U/IpvYThCr3Bf5mvCrKqvwq2knScxbUGHIh0sVMCwF0erzN1wwQ3nXx
         sw5r6kl1sBSxtAFRmrfOIvYmQlDzZBHfKqJdFG4Ai/V6DYa3iE8yBCWMZ9ciDHX2OR8Y
         mUWk9oBLlkZkfrp28wW5QDFhVhT9Y7CXtyEjlNUJfbQPkS52i/Hj4o/jj2Lq9peR/8Og
         BoWcwwzf01OPkQJ5tP6kHe96bwJXrAya+fNXwn7JDhbqxW1Mb3wAfRgo1oeSiR0LiNY2
         pW/Q==
X-Gm-Message-State: AGi0PuZHCcITLwrrai5zLizXMME91Z+6bV51poNZoe1wD53OHjJqyweI
	o5A1xqH2F7BNkBnbrfzrmFrezQ==
X-Google-Smtp-Source: APiQypKKbY1eVMtFbRpLeCtMZNd/GzAbUskKsnLSdjud5xgtwdTwYj4+lndGp53rX3YqSeqxpPlmGQ==
X-Received: by 2002:adf:a1c3:: with SMTP id v3mr13675088wrv.19.1586431025158;
        Thu, 09 Apr 2020 04:17:05 -0700 (PDT)
Return-Path: <pbarker@konsulko.com>
Received: from ub1910 ([213.48.11.149])
        by smtp.gmail.com with ESMTPSA id a80sm3308458wme.37.2020.04.09.04.17.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2020 04:17:04 -0700 (PDT)
Date: Thu, 9 Apr 2020 12:17:00 +0100
From: "Paul Barker" <pbarker@konsulko.com>
To: "Quentin Schulz" <quentin.schulz@streamunlimited.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] cairo: work around multilib issue resulting in improper handling of licenses
Message-ID: <20200409121700.66bffc1c@ub1910>
In-Reply-To: <20200409110423.11841-1-quentin.schulz@streamunlimited.com>
References: <20200409110423.11841-1-quentin.schulz@streamunlimited.com>
Organization: Konsulko Group
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu,  9 Apr 2020 13:04:23 +0200
"Quentin Schulz" <quentin.schulz@streamunlimited.com> wrote:

> There is currently an issue when a LICENSE for a package is defined
> differently than how the package is defined in PACKAGES.
> 
> See bug tracker: http://bugzilla.yoctoproject.org/show_bug.cgi?id=13865
> 
> This results in LICENSE being taken instead of LICENSE_${PN}-gobject
> because the latter is expanded to LICENSE_lib32-cairo-gobject while the
> entry in PACKAGES is still cairo-object at the moment of setting
> LICENSE_EXCLUSION in base.bbclass.
> 
> This means that instead of the expected MPL-1.1 | LGPLv2.1 license for
> lib32-cairo-object, it is (MPL-1.1 | LGPLv2.1) & GPLv3+ which does not
> work when you have INCOMPATIBLE_LICENSE set to GPLv3.
> 
> Same applies to cairo-perf-utils and cairo-script-interpreter.
> 
> Let's use ${PN} instead of hardcoded cairo in PACKAGES so that we
> mitigate the multilib issue on this recipe level.
> 
> Signed-off-by: Quentin Schulz <quentin.schulz@streamunlimited.com>
> ---
>  meta/recipes-graphics/cairo/cairo_1.16.0.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-graphics/cairo/cairo_1.16.0.bb b/meta/recipes-graphics/cairo/cairo_1.16.0.bb
> index b772c2ece2..e18159e96c 100644
> --- a/meta/recipes-graphics/cairo/cairo_1.16.0.bb
> +++ b/meta/recipes-graphics/cairo/cairo_1.16.0.bb
> @@ -72,7 +72,7 @@ do_install_append () {
>  	rmdir -p --ignore-fail-on-non-empty ${D}${libdir}/cairo
>  }
>  
> -PACKAGES =+ "cairo-gobject cairo-script-interpreter cairo-perf-utils"
> +PACKAGES =+ "${PN}-gobject ${PN}-script-interpreter ${PN}-perf-utils"
>  
>  SUMMARY_cairo-gobject = "The Cairo library GObject wrapper library"
>  DESCRIPTION_cairo-gobject = "A GObject wrapper library for the Cairo API."

Should we also change these entries to `SUMMARY_${PN}-gobject` and
`DESCRIPTION_${PN}-gobject`? There may be others as well, I'm just looking at
the diff not the full recipe.

Thanks,

-- 
Paul Barker
Konsulko Group
