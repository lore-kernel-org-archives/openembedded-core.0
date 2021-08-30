Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web09.2774.1630355447258938569
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Aug 2021 13:30:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=TjJ+FdRP;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f51.google.com with SMTP id d26so24287697wrc.0
        for <openembedded-core@lists.openembedded.org>; Mon, 30 Aug 2021 13:30:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=IxsjloAT5veB9SLUm/Z71Vp03w8MBbeoP8F63fR1cw8=;
        b=TjJ+FdRPSIrv/sJ+mIjseFfJgn53hobRMSdBv1aXXfRRIunMOuEqTXulI4Vc1mDqlN
         J8mQ2DySqHke7CSutqZQKQFX6xdobdOTZ8dfm4k3XqGl1LFK7Xc54ac1/7Qp0275BQ72
         uGvazJVITaXXPPFiQnkWiLPbVAJLSWajUyPAI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=IxsjloAT5veB9SLUm/Z71Vp03w8MBbeoP8F63fR1cw8=;
        b=jwMDHc+ZbJULVLr35ka01zqm9kA1Tz3sWQ9ITcFKzh9ot4FlCdvsQWtmK1vrpxoXo4
         FRYfuOWvjSigRrOK8RuOx4auXvCH+myeMGBezMos79z1ZYmrPut6Dzlq/q+/bNIzMCoN
         R/fpAZXr/G9rcucuChvsuCKYTWQ+j9QP584UbUi+s+5Kth2Z7ih2DLsUyW6DGMXts+VH
         B5oOWTdiN3YKSA0u89NZg3+geHNyThXC5ufU9xwKRX8d4Km064kfISkS9Ef0B8U6JRAS
         3FlB6i+inJ0uDL+2/KN/vMJJnnL6w/h4qEmgkexTxigTk4Q+CsbYPsV1N7PvOt7aDsu8
         9Ztw==
X-Gm-Message-State: AOAM530FKqgMdDxhJ7so2OiZH/67XXauIwNeWPFWemcAZmISPyu6xEiW
	hnkObwX185WZaGG0A9vSjZtJcw==
X-Google-Smtp-Source: ABdhPJzfy84Fm6oxCl9Qp15H1ELxjOPLOOOlUACF+lNWdFHzD8uhupXFSAAREdzqePAs2fKYMzcszA==
X-Received: by 2002:adf:c405:: with SMTP id v5mr27544421wrf.183.1630355445646;
        Mon, 30 Aug 2021 13:30:45 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:e840:dd4f:b947:28bf? ([2001:8b0:aba:5f3c:e840:dd4f:b947:28bf])
        by smtp.gmail.com with ESMTPSA id y15sm544628wmi.18.2021.08.30.13.30.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Aug 2021 13:30:45 -0700 (PDT)
Message-ID: <27aadf4835874e5117ea57ddcb26c07f73d2a7f4.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH] perl: add integer module required for kernel >= 5.14
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Andrey Zhizhikin <andrey.z@gmail.com>, 
	openembedded-core@lists.openembedded.org
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>, Alexander Kanavin
	 <alex.kanavin@gmail.com>
Date: Mon, 30 Aug 2021 21:30:44 +0100
In-Reply-To: <20210830200540.9888-1-andrey.z@gmail.com>
References: <20210830200540.9888-1-andrey.z@gmail.com>
User-Agent: Evolution 3.40.2-1build1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2021-08-30 at 20:05 +0000, Andrey Zhizhikin wrote:
> Kernel commit 12dd461ebd19 ("crypto: arm64 - generate *.S by Perl at
> build time instead of shipping them") uses perl to generate assembler
> files for crypto functionality, which relies on the integer.pm module to
> be provided.
> 
> Add this module to FILES and export it for build system.
> 
> Signed-off-by: Andrey Zhizhikin <andrey.z@gmail.com>
> Cc: Bruce Ashfield <bruce.ashfield@gmail.com>
> Cc: Alexander Kanavin <alex.kanavin@gmail.com>
> ---
>  meta/recipes-devtools/perl/perl_5.34.0.bb | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/meta/recipes-devtools/perl/perl_5.34.0.bb b/meta/recipes-devtools/perl/perl_5.34.0.bb
> index ab19a8d0be0..7a07b3f4911 100644
> --- a/meta/recipes-devtools/perl/perl_5.34.0.bb
> +++ b/meta/recipes-devtools/perl/perl_5.34.0.bb
> @@ -248,6 +248,7 @@ FILES:${PN} = "${bindir}/perl ${bindir}/perl.real ${bindir}/perl${PV} ${libdir}/
>                 ${libdir}/perl5/${PV}/strict.pm \
>                 ${libdir}/perl5/${PV}/warnings.pm \
>                 ${libdir}/perl5/${PV}/warnings \
> +               ${libdir}/perl5/${PV}/integer.pm \
>                 ${libdir}/perl5/${PV}/vars.pm \
>                 ${libdir}/perl5/site_perl \
>                 ${libdir}/perl5/${PV}/ExtUtils/MANIFEST.SKIP \

Doesn't that mean something is missing an RDEPENDS on perl-module-integer rather
than adding to the main perl package?

Cheers,

Richard

