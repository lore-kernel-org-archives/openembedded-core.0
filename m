Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com [209.85.221.66])
 by mx.groups.io with SMTP id smtpd.web11.3265.1594408280932069317
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Jul 2020 12:11:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=MGDPli+8;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.66, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f66.google.com with SMTP id j4so6985453wrp.10
        for <openembedded-core@lists.openembedded.org>; Fri, 10 Jul 2020 12:11:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=T+7xbTHYpPX/lNJA98dffCbHDxwOajSABGSRiYnxp0M=;
        b=MGDPli+8Ky5tOWMLoqLhrrSx/EpRuI739BqU09znlxvzimT6V7oYHVli9/ifW5eleP
         17VD171tz5tSouIjReYemuAKeXpaKE9gUN3Yx0SQZrdqIP11rYUcGuMoKCXOo1sYUrNL
         RwG09aLsvxN/VUUjPKD2gCiVJ60iuT20toLNY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=T+7xbTHYpPX/lNJA98dffCbHDxwOajSABGSRiYnxp0M=;
        b=f0/pbbaZmHeoOBYlYbvPAtjGzw4+2eg+6eJGlV0boJ28+AmhSsnjFmDMppNxkHkTsR
         /64dZc0pfAflK8xdg7Jb3NowJJw7fyrITxCgLdlqaEYopsZKPTYm1bN1gdA2xTHhXRsZ
         nMWfwb0F8Leacsz9a0RK93os6zKHcVID0EgAyvjZyWVORrXC6P709w0icIBFhUorWEnr
         8n784uZpZzjVP13xJY9iIcJTlijmt2jWROHCm404PVpi5sc7aL2lRJ2gk5i+FcfdsPQK
         9U11UODzmy9/4A8x3LAHNvUyZZiBiYxsaek/WwBX+jSwbrP7/E4U9LM4Q5fxI77ilQGW
         V88A==
X-Gm-Message-State: AOAM533M3Q6O2qtY2OED22x2AuFtfWdOIsPypH0GBSNLxBLlD6VJKq42
	HCUf2mOrJQKBfdYFBSgkc+o1Bw==
X-Google-Smtp-Source: ABdhPJwjijS5YZHgu5dTE37NU8SmDbUxSqmSz7pXP5mF+IFoGF6m9+aLQO7Z50BfvCn/cXkSc9+udw==
X-Received: by 2002:adf:9286:: with SMTP id 6mr69590478wrn.361.1594408279611;
        Fri, 10 Jul 2020 12:11:19 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id k11sm12809509wrd.23.2020.07.10.12.11.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2020 12:11:19 -0700 (PDT)
Message-ID: <95953e8828dc1c46448d6c880228cf0b3b91c5e8.camel@linuxfoundation.org>
Subject: Re: [PATCH] qemu: access host pkg-config via HOSTTOOLS
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: "Taras Kondratiuk (takondra)" <takondra@cisco.com>
Cc: "openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>, "cristian.iorga@intel.com"
	 <cristian.iorga@intel.com>, "xe-linux-external(mailer list)"
	 <xe-linux-external@cisco.com>
Date: Fri, 10 Jul 2020 20:11:17 +0100
In-Reply-To: <3a687673e39fd52a6314e5e0036b0f55a3498c39.camel@cisco.com>
References: <20200710174813.1963559-1-takondra@cisco.com>
	 <39c5bc9fcf056d93a42833d113521f524f063d33.camel@linuxfoundation.org>
	 <3a687673e39fd52a6314e5e0036b0f55a3498c39.camel@cisco.com>
User-Agent: Evolution 3.36.2-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2020-07-10 at 18:18 +0000, Taras Kondratiuk (takondra) wrote:
> On Fri, 2020-07-10 at 18:56 +0100, Richard Purdie wrote:
> > qemu is a little special, its about the only thing we let look into
> > the
> > system for things like this. We really don't want pkg-config
> > available
> > generally in HOSTTOOLS.
> > 
> > I'm not 100% sure I understand how this is fixing things either. Is
> > this using the pkg-config from your buildtools tarball instead?
> > 
> 
> Yes, it is using pkg-config from buildtools tarball.
> 
> As per my understanding other parts of the build will still use
> pkgconfig-native and should not be affected. Or the concern is that
> packages without proper pkgconfig-native dependency will find this
> pkg-config in HOSTTOOLS?

Yes, that is one concern.

Another is that if its using nativesdk-pkgconfig from buildtools, does
this break the reason we have this code in the first place (to allow
qemu to use the host GL for virtgl)? Presumably that is not in
buildtools...

Cheers,

Richard

