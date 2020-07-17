Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
 by mx.groups.io with SMTP id smtpd.web10.6042.1594966527488265519
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Jul 2020 23:15:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=B82bajSA;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.66, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f66.google.com with SMTP id f18so15600084wml.3
        for <openembedded-core@lists.openembedded.org>; Thu, 16 Jul 2020 23:15:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=/Gn2PPxC3PLAJQ11p8GYUdnKl+UA5Yk97IPQlKNAyzo=;
        b=B82bajSAdo2BTw6ZtyRCl0FG0WjGv6kQiANpKomHUJEnq/vJtzPoMRRtDfWp/7J8l5
         4vg9bF/gOvRstqeIu0HVFP6tp82jIvmcA1FOj6sDtEDk9wZmNiPBWcOe5Xh6UPpyfosx
         fFeDzdQDZI0lO8hANxreSS2c44DsoUW9wFXbE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=/Gn2PPxC3PLAJQ11p8GYUdnKl+UA5Yk97IPQlKNAyzo=;
        b=YmgjWAv40UmoqaDY+ObsVI3BiY3nKbRunCtyy9hqZEzHFSEMEVxTsBFyWfedcauc3Y
         zRoCCLqHpxR7iQ/qZppu8yZNDbVYi/qH+o1omYz5NWtBwYGEzn5wF0nSX5jnL1h2pNM6
         eAhTwEF3MLHoCMrDueGca71CigoSeNrIl7pHIf3xzjTfMk6+wAGoCITLuQxRKulmLVNi
         UIut95di2Yhaa4mhrx6/ui08ce5MrP9aNzs4pITrkXK86J40LSdt27F2SxGASGTHr0Fi
         KxVL0HyDN0f78XrlXAvHYs8UjnbyRd5W+p5XVJFNGr+lx1tcA35fJiQ1hrVxxgwdaa26
         sJfg==
X-Gm-Message-State: AOAM532AYpO9ccqTGlmTnoNL4UQkIMX2PaKFEooNx4r0jwDvVBeJp3aN
	2F/Z1admiUXxhvW0Dfe4yPfZFg==
X-Google-Smtp-Source: ABdhPJxdr4KTB6dY9csWOJy57NFx6dbQBeL3+REdhz37afy/trQBtPNvzier6FV3heorgnS0bgkUIA==
X-Received: by 2002:a05:600c:2295:: with SMTP id 21mr7397869wmf.87.1594966525876;
        Thu, 16 Jul 2020 23:15:25 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from f.2.4.2.d.8.4.b.f.c.c.1.d.5.4.b.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (f.2.4.2.d.8.4.b.f.c.c.1.d.5.4.b.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:b45d:1ccf:b48d:242f])
        by smtp.gmail.com with ESMTPSA id w7sm11711671wmc.32.2020.07.16.23.15.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2020 23:15:25 -0700 (PDT)
Message-ID: <2c7850417988102ce5945fcb206c4243e9bff543.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 2/4] help2man: rewrite recipe
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Ross Burton <ross@burtonini.com>, 
	openembedded-core@lists.openembedded.org
Date: Fri, 17 Jul 2020 07:15:24 +0100
In-Reply-To: <1622758F3BA9F568.2727@lists.openembedded.org>
References: <20200716115546.3724268-1-ross@burtonini.com>
	 <20200716115546.3724268-2-ross@burtonini.com>
	 <1622758F3BA9F568.2727@lists.openembedded.org>
User-Agent: Evolution 3.36.3-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2020-07-17 at 07:14 +0100, Richard Purdie via
lists.openembedded.org wrote:
> On Thu, 2020-07-16 at 12:55 +0100, Ross Burton wrote:
> > From: Ross Burton <ross.burton@arm.com>
> > 
> > Instead of being explicitly native, use BBCLASSEXTEND.
> > 
> > No need to explicitly depend on autoconf-native automake-native,
> > because
> > the autotools class does that.
> > 
> > Don't explicitly disable NLS, but use the gettext class.
> > 
> > As this recipe isn't needed in early build anymore there's no need
> > to
> > avoid reconfiguring.
> > 
> > Signed-off-by: Ross Burton <ross.burton@arm.com>
> > ---
> >  ...2man-native_1.47.15.bb => help2man_1.47.15.bb} | 15 ++++++-----
> > --
> > --
> >  1 file changed, 6 insertions(+), 9 deletions(-)
> >  rename meta/recipes-devtools/help2man/{help2man-native_1.47.15.bb
> > =>
> > help2man_1.47.15.bb} (66%)
> 
> https://autobuilder.yoctoproject.org/typhoon/#/builders/40/builds/2185
> 
> configure: error: perl module Locale::gettext required
> 
> (from no-x11 world build)

Also, maintainer entry is missing:

https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/1165/steps/8/logs/step2d

Cheers,

Richard

