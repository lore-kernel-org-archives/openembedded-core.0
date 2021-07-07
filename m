Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web10.19326.1625653424679510742
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Jul 2021 03:23:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=YZ8upjhJ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f48.google.com with SMTP id h18-20020a05600c3512b029020e4ceb9588so3822619wmq.5
        for <openembedded-core@lists.openembedded.org>; Wed, 07 Jul 2021 03:23:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=7fkGLeZtuNrKsSIGYrQVtwqPDk1x8HaUZVtBzy29TpA=;
        b=YZ8upjhJKPHuWynTsojpGRUw/ZTDPbSasstnw5PDCCbDs0oObkQIrYT5jMYXSknk3W
         LJwqIwkHKvM0uTIEV+2ApSZ+1tjCOofXOkXJ4xJ8VcoF3TipL3tCX7K09USaugmxTAyH
         FeFLJ6oLkMimswrPv04h8evTjUxNXZ6MpZ4Qc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=7fkGLeZtuNrKsSIGYrQVtwqPDk1x8HaUZVtBzy29TpA=;
        b=mH23fCcEqCwBJGYta2Pfz+IQU/IQJtre1mTJD2EJnZDKA+hY4kHLxWgdRDFTJNr3Ho
         8VFgldkQVtIBthWdKAAoiwoddN4/vCxXLqHf9T1Gx+MziJHL96zLQJ2YSvjypcSse4aQ
         clIYMmrpcRRu8O8OyHZd946Cp6mgJv+sVNSO99MFBPxDzM2KaI1L+tNVpNmnSroZJ27O
         46ybu+kHCY7zD6BpJ/93jpx50N3OhmyYRuEEj/ZaeJwE79bwi8TWwx1t9hk1/MotSQTk
         1jC9l5beSD+auWl3+K15GmO7n5bX4CEoPkoOx/9YFRZSCKEyCwpHogNZp9wsj4nTlOkI
         Z+yA==
X-Gm-Message-State: AOAM531vStWI0qRl4BfCSAEahfHSENUHtM3g6RbkIOeLTRtQtfXNtDXN
	i1fIIgJ3KONZyXfnu3cYvp1N1w==
X-Google-Smtp-Source: ABdhPJwS1diBOgzqg5aSkLqd1riaWiBs/VHywoo0fTEzYcos4/f+iZtGv2AQRAeJty0q8l3JGkrjxw==
X-Received: by 2002:a1c:f717:: with SMTP id v23mr5906348wmh.32.1625653423175;
        Wed, 07 Jul 2021 03:23:43 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:8f67:c2fd:32f6:7bc5? ([2001:8b0:aba:5f3c:8f67:c2fd:32f6:7bc5])
        by smtp.gmail.com with ESMTPSA id i2sm5817961wmq.43.2021.07.07.03.23.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jul 2021 03:23:42 -0700 (PDT)
Message-ID: <df63dbb62b4702110d8e74f5326a713640c99e7d.camel@linuxfoundation.org>
Subject: Re: [PATCH] glibc-package.inc: To fix build issue with glibc-testsuite.
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Vinay Kumar <vinay.m.engg@gmail.com>, 
	openembedded-core@lists.openembedded.org, Alexander Kanavin
	 <alex.kanavin@gmail.com>
Cc: rwmacleod@gmail.com, umesh.kalappa0@gmail.com,
 vinay.kumar@blackfigtech.com
Date: Wed, 07 Jul 2021 11:23:40 +0100
In-Reply-To: <20210704112159.150061-1-vinay.m.engg@gmail.com>
References: 
	<CANUMPcU0ibVFbf5x0OzEunTymSd8+_chCD3432xa3CTeL7QzjA@mail.gmail.com>
	 <20210704112159.150061-1-vinay.m.engg@gmail.com>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Sun, 2021-07-04 at 04:21 -0700, Vinay Kumar wrote:
> Added condition to check "$cleanupdir${datadir}" exists.
> 
> Signed-off-by: Vinay Kumar <vinay.m.engg@gmail.com>
> ---
>  meta/recipes-core/glibc/glibc-package.inc | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/meta/recipes-core/glibc/glibc-package.inc b/meta/recipes-core/glibc/glibc-package.inc
> index 92e5dbac61..df3f612192 100644
> --- a/meta/recipes-core/glibc/glibc-package.inc
> +++ b/meta/recipes-core/glibc/glibc-package.inc
> @@ -230,7 +230,9 @@ stash_locale_cleanup () {
>  	rm -rf $cleanupdir${libdir}/gconv
>  	rm -rf $cleanupdir${localedir}
>  	rm -rf $cleanupdir${datadir}/locale
> +  if [ -d $cleanupdir${datadir} ]; then
>  	rmdir --ignore-fail-on-non-empty $cleanupdir${datadir}
> +  fi;
>  
> 
> 
> 
>  	if [ "${libdir}" != "${exec_prefix}/lib" ] && [ "${root_prefix}/lib" != "${exec_prefix}/lib" ]; then
>  		if [ -d "$cleanupdir${exec_prefix}/lib" ]; then


I had a look into this issue in more detail and you're right, if you 
bitbake the recipe it does indeed fail. The reason it doesn't fail 
everywhere in testing is that it is excluded from world builds.
Since there is no do_install task, the do_populate_sysroot task
is also pointless. I've sent a patch just to delete the task.

Cheers,

Richard

