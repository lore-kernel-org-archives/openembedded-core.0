Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
 by mx.groups.io with SMTP id smtpd.web10.38968.1597650200659303269
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Aug 2020 00:43:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=OcG52bKz;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.68, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f68.google.com with SMTP id p14so12425852wmg.1
        for <openembedded-core@lists.openembedded.org>; Mon, 17 Aug 2020 00:43:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=KJvgH3fvX7vOFIn+BoawGIs+oXUDgjhLb9E4qZl/C+0=;
        b=OcG52bKzBBEKb5nrd4WP+dCbQktCizJj+saszTdHybalsTJ3pJYVvQMOPanHH4y716
         768BuQk4o3CsGvIyzsZVDfjUX9plIcqXIKAzecie9eTQTx3ZKKSI7UFTQ7kGBLy2pLP5
         gb23SRHF5AP8h3/uRaWqf37tBRDV7TgbZsgeA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=KJvgH3fvX7vOFIn+BoawGIs+oXUDgjhLb9E4qZl/C+0=;
        b=n8pMnQSIbKkSthG3lrZJJiEMGDeUc4pB2Z6jXdwVmn/68eOpEfpRo8leG5kQPGespO
         3Q3W5+dG68IP/q2oEee9wMOek5UBHhV9jSHl8seBdwv45/qdD1dpaTtweE7n5YoB5gvQ
         alBBtG9M0rS4wr11uC4yBtJc6rdg9U8YrH+aRUAbhnJSP3j11R/Eeqcg2t2qTTZEcLLv
         8JHafJFzEEN12dZyE/HeOXAoJxisWkvvhgn+Fpd71WBlqPoVX2Z5d1Q2t8e8+1Ixx4jF
         EiUvxP8zx2PcTGaKILAWV+PPw/ZGV3mrp2evqOLWAWhhNeOFSP6H3GrniMktCrtWfpQv
         a+dA==
X-Gm-Message-State: AOAM5331/SyFvkUZIL6Gc3iRwzC3BnbtItLoKfgZF80gjrUhDW+mYdYp
	syEeOITA0baaUMkSiMv+2+Laqg==
X-Google-Smtp-Source: ABdhPJzpPNLj6Lkh1Ngb8NxwwOvAzLjveEu0QzJu1gSABNYyBE45oB+d33tq4kFqX7ploejMqgOChQ==
X-Received: by 2002:a7b:cd09:: with SMTP id f9mr12818367wmj.184.1597650199045;
        Mon, 17 Aug 2020 00:43:19 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from 7.e.3.0.f.1.f.7.3.a.7.d.2.4.9.b.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (7.e.3.0.f.1.f.7.3.a.7.d.2.4.9.b.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:b942:d7a3:7f1f:3e7])
        by smtp.gmail.com with ESMTPSA id p14sm31999331wrx.90.2020.08.17.00.43.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2020 00:43:18 -0700 (PDT)
Message-ID: <c1580e5f02bf8b9adfe03934bc80a7954694f125.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v5 2/2] image_types: add Zstandard conversion support
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Adrian Bunk <bunk@stusta.de>, Ross Burton <ross.burton@arm.com>
Cc: Stefan Agner <stefan@agner.ch>,
 openembedded-core@lists.openembedded.org,  Stefan Agner
 <stefan.agner@toradex.com>
Date: Mon, 17 Aug 2020 08:43:17 +0100
In-Reply-To: <20200815161031.GA7593@localhost>
References: <20191120124146.21245-1-stefan@agner.ch>
	 <20191120124146.21245-2-stefan@agner.ch>
	 <7eb71f58ebc85c734109a6635b620b66@agner.ch>
	 <8ba354cf-b531-a386-32bf-fef3a33d0ef7@intel.com>
	 <20200815161031.GA7593@localhost>
User-Agent: Evolution 3.36.3-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2020-08-15 at 19:10 +0300, Adrian Bunk wrote:
> On Fri, Dec 06, 2019 at 12:00:54PM +0000, Ross Burton wrote:
> > ...
> > Personally I'm leaning towards keeping zstd out of core *for now*
> > but I
> > struggle to have a strong opinion either way.
> > ...
> 
> Is there a chance the "for now" is over?
> 
> zstd is becoming more and more popular on the target side,
> and right now cmake is already building an own copy also
> on the native side.

Ross is away, I'm leaning towards adding it...

Cheers,

Richard

