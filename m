Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com [209.85.221.67])
 by mx.groups.io with SMTP id smtpd.web10.11195.1598352998732621276
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Aug 2020 03:56:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=B3R+gWtb;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.67, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f67.google.com with SMTP id b17so11458866wru.2
        for <openembedded-core@lists.openembedded.org>; Tue, 25 Aug 2020 03:56:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=XepiJzNbb3xXTw9N2Q7Vfu8xdj9oz1PvvoYldmvYMUI=;
        b=B3R+gWtbvY2Ni7QN3iFrQMHONPFm93nGpkY1igt4eguq/ctBvbhhXsIPqNRRfgVAM0
         wEzomtcqpjKQQPb5os2PJvsaud3DbWi+PPxy8/zeg4wmr0LntIjHj/TaF88jw1xvkscj
         GMEJcqohLBOCdeQQ00TTb0T/7EYLkVq0V5+94=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=XepiJzNbb3xXTw9N2Q7Vfu8xdj9oz1PvvoYldmvYMUI=;
        b=RWRILvKwoxGxFSjrblt2pwLzoEHb0EjSCy2Q1SlnYwwlimiE6FLV5mNaTDLMU8GPtq
         /F9kLtV6dt9Ekwe+HYWd0CeNXnza7ZVNBwenAhYpclYZCg7e0tPEt3rsTAT6S+9jCcgQ
         QbS+Ve4MG8YeYQ4Od0m/BMtmbHQ9piBG32XYZyqbAKFB5QTXJtf5i1oWberLc1onsxLm
         jkSWWwh+dBUCqnK5DKCTbW8hNq3ByNN7nrn1LYjzVbWQH0ObTEcCjatR3jvFm3oBIjLf
         C/SII02Vz9i6ae+6vv6zEX0o82/tJ7Y28Pfb11M2HAM3NNN4iuSyVRAIM+3V4HIndG+d
         QS5w==
X-Gm-Message-State: AOAM532dUQw98NKzxIwzRt0dT/8b/cVKsiYeEuHtdfbedVYzzn/kq4E8
	OVkQyvRJGbk518FaesOAnwwQ0A==
X-Google-Smtp-Source: ABdhPJy977KnfDXeSMiOo9qINKzpPH5Oib/ScYJX3Mb+zqwR77TQKG/eqyFmH15GaZLYTjDQZqSnDQ==
X-Received: by 2002:adf:9125:: with SMTP id j34mr11149857wrj.157.1598352997032;
        Tue, 25 Aug 2020 03:56:37 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from d.9.b.8.7.0.d.0.8.3.5.0.7.0.4.c.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (d.9.b.8.7.0.d.0.8.3.5.0.7.0.4.c.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:c407:538:d07:8b9d])
        by smtp.gmail.com with ESMTPSA id p6sm5205744wmg.0.2020.08.25.03.56.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2020 03:56:35 -0700 (PDT)
Message-ID: <f80beeb723c0f891dd5727ba09ab28de79836ed5.camel@linuxfoundation.org>
Subject: Re: [OE-core] [master][PATCH 4/5] package / packagedata bbclass: Change the way PRAUTO and AUTOINC are handled
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Mark Hatle <mark.hatle@kernel.crashing.org>, 
	openembedded-core@lists.openembedded.org
Date: Tue, 25 Aug 2020 11:56:34 +0100
In-Reply-To: <20200824232930.150388-5-mark.hatle@kernel.crashing.org>
References: <20200824232930.150388-1-mark.hatle@kernel.crashing.org>
	 <20200824232930.150388-5-mark.hatle@kernel.crashing.org>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2020-08-24 at 18:29 -0500, Mark Hatle wrote:
> A related change was also needed for the kernel.bbclass.  The kernel
> 
> needs to get the AUTOINC values used by the various PV/PKGV, but with
> this new system we don't want to call auto_pr each time -- instead
> call the read_subpackage_metadata to ensure a consistent result.
> 
> This also fixes an issue in the old version where the kernel
> sometimes
> caused the PR to be incremented twice, as the auto_pr was called
> multiple times from different tasks.

[...]

> 
> diff --git a/meta/classes/kernel.bbclass
> b/meta/classes/kernel.bbclass
> index e2ceb6a333..4449452065 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -416,7 +416,7 @@ kernel_do_install() {
>  	install -d ${D}${sysconfdir}/modules-load.d
>  	install -d ${D}${sysconfdir}/modprobe.d
>  }
> -do_install[prefuncs] += "package_get_auto_pr"
> +do_install[prefuncs] += "read_subpackage_metadata"
>  
>  # Must be ran no earlier than after do_kernel_checkout or else
> Makefile won't be in ${S}/Makefile
>  do_kernel_version_sanity_check() {
> @@ -749,7 +749,7 @@ kernel_do_deploy() {
>  		done
>  	fi
>  }
> -do_deploy[prefuncs] += "package_get_auto_pr"
> +do_deploy[prefuncs] += "read_subpackage_metadata"
>  
>  addtask deploy after do_populate_sysroot do_packagedata

I don't think this can be right. I understand why the kernel was
expanding these early but at this point do_package hasn't happened so
reading the subpackage metadata is a null op at best and potentially
changes a lot more in the data store.

I suspect this is not doing the right thing and will be something that
comes back to bite us so we need something more careful here and I'd
like to better understand exactly what change to the variables
do_install and do_deploy need.

Cheers,

Richard

