Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
 by mx.groups.io with SMTP id smtpd.web12.30273.1588536009824088855
 for <openembedded-core@lists.openembedded.org>;
 Sun, 03 May 2020 13:00:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@stusta.de header.s=default header.b=MLwJZZED;
 spf=pass (domain: stusta.mhn.de, ip: 141.84.69.5, mailfrom: srs0=pmcc=6r=stusta.de=bunk@stusta.mhn.de)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 49FcKK3M9Mz3t;
	Sun,  3 May 2020 22:00:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1588536006;
	bh=YR7OMLonkzA5macNQAI2P8z103A1muFP8jau0QptLNk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MLwJZZEDptEQ430TssOvKU2QKXhwdHtv8pZeWP5SzPFe53CL9DCh8u5UPV4LXtRBm
	 93rRR2fka5BMS0FvOT1+EPUBPBZj+Xd8qGHNgDHbaJvuraG9BwI2KtnnZh+11u3Wjc
	 QW7WlH+DIJIgC2dDQA3zHof39YvYuswoYhhxYpg3QM0E8Afa67qL53eana3XRvF3lD
	 hplwi4YbfpEtLZJ6EycZxKck5s42PQQkDMmuFOdlAgAMVOXdFEJfERPDtjysvsY9au
	 cnB8alQ304Oa2BSRlJZqoV2fiJD2wT42SDZYjndTYWfsVHayV9/MUdrCE+4jE6RcuD
	 WXl4gl3LbcvzLfWsLXBzNdRYP9cH4VJ9twKd8mAv1E6znvsrNmjHyZGz11WpVpuC2q
	 tOcLixvLsKSjcxXl7WgzEaovHK0mhLoWwH2XjlpioQjjyhu3aueAqmfSz3Vh0yOxf6
	 5dlXntRje/YUTClhmv1sSJgUZZBR4nxThoVitXEvorH333+2gJuchilPCO8H5KSzUE
	 maV2QcSME6UBOa+vNG/2WNNlEiNlfjA45eJ4uypnkUC72FYxkCeagOcanzuRWg+5Zu
	 2linay1QiwbEoNQTieAQf913jCVAOlZZ1mHs9Pbj7JGhwBEplWKRH30o9TEyhT6GN9
	 lo7w+AEs9UW1DKyoED7+1yeM=
Date: Sun, 3 May 2020 23:00:00 +0300
From: "Adrian Bunk" <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Cc: Daniel Mack <daniel@zonque.org>
Subject: Re: [OE-core] [PATCH] Add -fcommon to BUILD_CFLAGS to a number of recipes
Message-ID: <20200503200000.GC25055@localhost>
References: <20200503082640.3686916-1-daniel@zonque.org>
MIME-Version: 1.0
In-Reply-To: <20200503082640.3686916-1-daniel@zonque.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Sun, May 03, 2020 at 10:26:40AM +0200, Daniel Mack wrote:
> When building on a gcc 10 enabled host distribution (such as Fedora 32),
> a number of recipies need explicit treatment to enable '-fcommon' in
> BUILD_CFLAGS. There might be more of those fixes needed.
>...

These are not fixes, just workarounds.
Adding upstream fixes would be preferable to adding workarounds. 

> --- a/meta/recipes-devtools/pseudo/pseudo.inc
> +++ b/meta/recipes-devtools/pseudo/pseudo.inc
> @@ -15,6 +15,8 @@ INSANE_SKIP_${PN}-dbg += "libdir"
>  
>  PROVIDES += "virtual/fakeroot"
>  
> +BUILD_CFLAGS += "-fcommon"
> +
>...

Yocto is upstream for pseudo, is there anything non-trivial required
for a proper fix?

> --- a/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb
> +++ b/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb
> @@ -12,6 +12,7 @@ SRC_URI = "git://github.com/plougher/squashfs-tools.git;protocol=https \
>  
>  S = "${WORKDIR}/git/squashfs-tools"
>  
> +BUILD_CFLAGS += "-fcommon"
>...

The upstream fix is a trivial one-liner that should be backported instead:
https://github.com/plougher/squashfs-tools/commit/fe2f5da4b0f8994169c53e84b7cb8a0feefc97b5

cu
Adrian
