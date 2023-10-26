Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECF10C25B48
	for <webhook@archiver.kernel.org>; Thu, 26 Oct 2023 07:24:44 +0000 (UTC)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
 by mx.groups.io with SMTP id smtpd.web11.65117.1698305075182115818
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Oct 2023 00:24:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=KdeetJJr;
 spf=pass (domain: linaro.org, ip: 209.85.208.180, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2c5071165d5so2166791fa.0
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Oct 2023 00:24:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698305073; x=1698909873; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6L4I1b7PKw7eJSias3qEfKbTE4Id6cnLYcVDor4uyyg=;
        b=KdeetJJrQl2Wd1FyXKqjD0PBl6JEaJ6niJlYE2fvjNZOVi8ECzT7c380f7eHoUT7yY
         kcZ000wMGmOj0n353Q8BaPrKT1kz6PCQoBfpPdlJupsenA1WhN3phtmx8yYs+jqJQwuW
         VuzQ3KilwMyi4UBXbocQpi/jm7mLKx7r9BH60KjPYCRYaCWc1xeZ5owkvNSuZvTS/fW9
         itZoYyqi2bmfbsOfKK/Ft0mXYT7MICldiid6B05H+syOKnTC5fK0Hm1UAiqHpTOHZnJ4
         WkRZ5nN+0KKXItDih4NznsnO/hvMaoSm4P1hB96OaM9jbNV0W+F8HjxjZLmB2TlOrFuJ
         KLuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698305073; x=1698909873;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6L4I1b7PKw7eJSias3qEfKbTE4Id6cnLYcVDor4uyyg=;
        b=o+/Ug0nlj1UgM1/aO+SS//BJeIvzqLpHFN7nrVlAzGLZZEzQNSA5Uuu3UQFJVRZvdO
         4Hv4YQFyG96lzwL39OTuWnApBrUD8m2eEh9OsDrXBTQKpl7uCF0yV1/I3js103EwnIMc
         RMxZ9hsjXTkZrcDxujG8WEIoP0npSGNkHAGw+7yx1WTdJ1XVPIsd5yCF+V466+GokTSh
         PGOQqlUfNqdGdZtuyRLmnd9PNumfEFHCSMiI8FzLL8txlP4vcTa2m7/686QhGjD/W7me
         pn1PkAWHBSFWTXePRVWLcp0LEAw9BLwF/ZGF0vSNSVarTf4Cck1i+6Jom5IAIiVn4BUu
         WYcg==
X-Gm-Message-State: AOJu0YyYz0+CPpdCzh6oOCZ1CB9FjAtxGaR6hvr12palJ22rAtf3sswy
	opnuNTvL/8S2KZLfiK0HTSNQVg==
X-Google-Smtp-Source: AGHT+IHB6C+wYuOvX6Ao9s5mEFfoz4S1PNviH4Gbppx96sTM2lzJUjWZzDzRvkkVqWm0wfw6RXSFpw==
X-Received: by 2002:a05:651c:a06:b0:2c5:1483:fae0 with SMTP id k6-20020a05651c0a0600b002c51483fae0mr15712202ljq.4.1698305073047;
        Thu, 26 Oct 2023 00:24:33 -0700 (PDT)
Received: from nuoska (dc7g6tyyyyyyyyyyyyhlt-3.rev.dnainternet.fi. [2001:14ba:16cb:a800::193])
        by smtp.gmail.com with ESMTPSA id z23-20020a05651c023700b002c5762dcde4sm1826108ljn.102.2023.10.26.00.24.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Oct 2023 00:24:32 -0700 (PDT)
Date: Thu, 26 Oct 2023 10:24:30 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH v2] cve-check.bbclass: support embedded SW
 components with different version number
Message-ID: <ZToULixe0QlAqWFb@nuoska>
References: <20231020074926.230734-1-mikko.rapeli@linaro.org>
 <473e1fb5-60a3-40fb-859d-e8d5e7011b81@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <473e1fb5-60a3-40fb-859d-e8d5e7011b81@gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Oct 2023 07:24:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189700

Hi,

On Fri, Oct 20, 2023 at 08:54:14AM -0700, Khem Raj wrote:
> On 10/20/23 12:49 AM, Mikko Rapeli wrote:
> > Many recipes embed other SW components. The name and version of the
> > embedded SW component differs from the main recipe. To detect CVEs in the
> > embedded SW component, it needs to be added to CVE_PRODUCT list using
> > name of the SW product in CVE database or with "vendor:product" syntax.
> > Then the version of the embedded SW component can be set using
> > CVE_VERSION_product variable.
> > 
> > For example in meta-arm, trusted-firmware-a embeds mbed_tls SW component.
> > Thus trusted-firmware-a can add CVE_PRODUCT for it since CVE database
> > uses product name "mbed_tls":
> > 
> > CVE_PRODUCT += "mbed_tls"
> > 
> > and set the version of mbed_tls:
> > 
> > CVE_VERSION_mbed_tls = "2.28.4"
> > 
> > (Real patches for both are a bit more complex due to conditional build
> > enabling mbed_tls support and due to mbed_tls version being set in an
> > .inc file.)
> > 
> > Now trusted-firmware-a CVE check output shows:
> > 
> > NOTE: recipe trusted-firmware-a-2.9.0+gitd3e71ead6ea5bc3555ac90a446efec84ef6c6122-r0: task do_cve_check: Started
> > WARNING: trusted-firmware-a-2.9.0+gitd3e71ead6ea5bc3555ac90a446efec84ef6c6122-r0 do_cve_check: Found unpatched CVE (CVE-2021-36647 CVE-2021-43666 CVE-2021-45451 CVE-2023-43615), for more information check /home/builder/src/base/build/tmp/work/arm64-poky-linux/trusted-firmware-a/2.9.0+gitd3e71ead6ea5bc3555ac90a446efec84ef6c6122/temp/cve.log
> > NOTE: recipe trusted-firmware-a-2.9.0+gitd3e71ead6ea5bc3555ac90a446efec84ef6c6122-r0: task do_cve_check: Succeeded
> > 
> > Here CVE-2023-43615 is a newly added and fixed CVE in version 2.28.5 and the CVEs
> > from 2021 need to be checked but are likely fixed in 2.28.3 and newer 2.28.y releases.
> > 
> > Note that CVE-2023-43615 does not impact trusted-firmware-a since it doesn't use
> > TLS or null or RC4 ciphers, but I think it's a good idea to extend
> > CVE checker for this use case. I hope the "CVE_VERSION_vendor:product"
> > does not cause odd breakages.
> > 
> 
> This is a good improvement. There is one more kink to it, where the vendored
> subpackage might be there in source but we might have configured the recipe
> to use the system version of the package instead, so how do we cater to such
> situation ?

Very good point. I think yocto project maintainer should recommend recipe maintainers
what to do in these cases. I think safest option is to remove/delete such code paths from
upstream sources in do_patch(). Debian does something similar also due to license compliance
with their pristine/dfsg source package format
https://www.debian.org/doc/manuals/developers-reference/best-pkging-practices.html#repackaged-upstream-source
when they can't distributed certain files inside the source package.

This issue goes way beyond CVE related data though. LICENSE, PN and PV are affected.
AFAIK, currently recipe maintainers decide on what goes into LICENSE for example,
based on how they have configured the SW component build and dependencies. These may
not be correct though and for complex SW components this really is an issue where
users who create real products need to check a lot of details. High level SW components
like javascript engines and browser are very eager to build their own versions SW components
which are already available as recipes in the build environment.

At least for CVE scanning, this patch enables telling the tooling "this recipe
embeds a custom version of tool/lib xyz" so recipe maintainers can fill in the data
if they know and care about the details. For license compliance, I hope LICENSE is up to date :)
though I know that the deeper on looks the more problems will pop up...

Cheers,

-Mikko

