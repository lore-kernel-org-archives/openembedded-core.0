Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com [209.85.221.68])
 by mx.groups.io with SMTP id smtpd.web10.38953.1597650117386093470
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Aug 2020 00:41:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Xi/o2NXb;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.68, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f68.google.com with SMTP id c15so13898148wrs.11
        for <openembedded-core@lists.openembedded.org>; Mon, 17 Aug 2020 00:41:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=FU9sv+4N3Kch1lr6T1WP2FUNARKTCSJ9kQtMF4DcKrE=;
        b=Xi/o2NXbilOITYm1HJhnoll/mLJnv86B41DeEMxVTF+qtoFAAJLRqWwkcAbYIlmWW0
         nhgHmY2xDa0qj70rNZp++k6QFm46xfxAOldZ+FlPzlGgzuBOtU42KVsHXMPr2PEkKlm9
         y5LIQwL5giFlpdUlSoNem3Fn+zgBB6klC45hA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=FU9sv+4N3Kch1lr6T1WP2FUNARKTCSJ9kQtMF4DcKrE=;
        b=phVX75U5nLYdB0ykmXMEbE3Qgds2+riIQ6FDAvkdYQMABjh6B5fbqV6Q/eFv5IOn/4
         6KaSVAhBKvwVsGMG92etxVklyWFR4dZYy+LbSAV3Ylw+JfmUzuXQ4s3Tqv1nqhBsFoL2
         oI2BQoj9U/eO3VQuyVPZ7zEQ6jp6yuLU7eBxHRzRWvYjTRwvoztiN4TFqSLWh2xv6SX7
         d4wUWBzdQA3yg7enA8+RgqxIzz7RSPL0bDToIaDzAUu0T7P3lzKPifGFTfs8WEg1K2HW
         oXKAtD1nWgfj6UKkq8YKS0/FIxjySCu4UDfiVktTwip6bWEvdvyflKXSb7D3kMhEpeg5
         l9ZQ==
X-Gm-Message-State: AOAM530e/tln7jzBntzbXKvHFPh14fHNDjQnTYfLUZ2K577X2SXBugDE
	CUVis8R7YOhZqPraDDPdw1Sc4A==
X-Google-Smtp-Source: ABdhPJxi8Bb1hcK/CwY4w7/UT8d0xfG2jr9wrg6IB70fKIwxk1+X6b8o18EEVS9bumOqpLd190yVnw==
X-Received: by 2002:a5d:414e:: with SMTP id c14mr15093126wrq.57.1597650115865;
        Mon, 17 Aug 2020 00:41:55 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from 7.e.3.0.f.1.f.7.3.a.7.d.2.4.9.b.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (7.e.3.0.f.1.f.7.3.a.7.d.2.4.9.b.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:b942:d7a3:7f1f:3e7])
        by smtp.gmail.com with ESMTPSA id a10sm29432823wro.35.2020.08.17.00.41.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2020 00:41:55 -0700 (PDT)
Message-ID: <500487f787b56af2e2b3f4fe33769d33a5e31fd7.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH V3] gpgme: fix multilib header conflict
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Changqing Li <changqing.li@windriver.com>, 
	openembedded-core@lists.openembedded.org
Date: Mon, 17 Aug 2020 08:41:51 +0100
In-Reply-To: <20200817025713.832019-1-changqing.li@windriver.com>
References: 
	<a6acd2d8a5d7389363d3e45b230c253ccbdc5e91.camel@linuxfoundation.org>
	 <20200817025713.832019-1-changqing.li@windriver.com>
User-Agent: Evolution 3.36.3-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2020-08-17 at 10:57 +0800, Changqing Li wrote:
> From: Changqing Li <changqing.li@windriver.com>
> 
> fix error:
> file /usr/include/gpgme.h conflicts between attempted installs of
> gpgme-dev-1.13.1-r0.core2_64 and lib32-gpgme-dev-1.13.1-r0.core2_32
> 
> diff of gpgme-32.h and gpgme-64.h
> 21c21
> <  * Generated from gpgme.h.in for i686-pokymllib32-linux-gnu.
> ---
> >  * Generated from gpgme.h.in for x86_64-poky-linux-gnu.
> 109c109
> < #if 64
> ---
> > #if 0
> 111c111
> < #error GPGME was compiled with _FILE_OFFSET_BITS = 64, please see
> the section "Largefile support (LFS)" in the GPGME manual.
> ---
> > #error GPGME was compiled with _FILE_OFFSET_BITS = 0, please see
> > the section "Largefile support (LFS)" in the GPGME manual.
> 113,114c113,114
> < #if (_FILE_OFFSET_BITS) != (64)
> < #error GPGME was compiled with a different value for
> _FILE_OFFSET_BITS, namely 64, please see the section "Largefile
> support (LFS)" in the GPGME manual.
> ---
> > #if (_FILE_OFFSET_BITS) != (0)
> > #error GPGME was compiled with a different value for
> > _FILE_OFFSET_BITS, namely 0, please see the section "Largefile
> > support (LFS)" in the GPGME manual.

Please use unifed diff format as we use in patches as its much more
readable.

This one raises interesting questions, perhaps we should be enabling
large file support everywhere within gpgme instead of this patch?

The other patch (libffi) looks necessary but I'd much prefer if it diff
-u.

Cheers,

Richard

