Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2EA2D2125F
	for <webhook@archiver.kernel.org>; Thu, 17 Oct 2024 08:52:23 +0000 (UTC)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
 by mx.groups.io with SMTP id smtpd.web10.43995.1729155135342924904
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Oct 2024 01:52:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=ijD6r9Pl;
 spf=pass (domain: linaro.org, ip: 209.85.208.170, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2fb5f647538so7202041fa.0
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Oct 2024 01:52:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729155133; x=1729759933; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Apk+4GpGgH6nEOBvgARzaXIGN6B++NRBZuP1RqMO5J8=;
        b=ijD6r9PlHjLtmXqE0MP+rjAsHumoVAXBxsFHaHCAz4mXrj/IZ7zMvQCSXlHtfJ7a8u
         E9XyvetdHNLTDmm+boLCE0e91CRad8SEcfBTj0ndqy2jw99DVvn5wR2/2zKR/Is1uVCP
         KToeGPum8C1vo4ic1UYVAwRQLiIcP5CknPeFDXJhaofLJ1f6y3Y8V4m0thB6Mx6+D92d
         OrPVP+uabBNYzCdXInE5Tof3zt9xoqIAAk3BogMNJ51WeFx5Vn9unAszYAW0GskY2GG5
         8d4iX7n2u5yBHdSVllSzkf+KFu59aAcWZsYFGCYPgfGg2ANErU1m5GnTW2PVcyAHIJ3k
         OTVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729155133; x=1729759933;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Apk+4GpGgH6nEOBvgARzaXIGN6B++NRBZuP1RqMO5J8=;
        b=vIdjPEoErP+nSyX9dad4g6618GX9TZ4aZ5jpuDKSjg9xvAQRkU9WF5TTTNmbLi2Ar/
         kPJ9O2Wog0bM0YYo8s2lNQrm2CqqpTPxDIDkYtcXmVGwE9UeVOlvEiPBpw64zkVFr/pb
         fpqP9k704Vv84ES6fW1Mfeax8XG/iEAlC5Xvxu77klfDWTBwsgDiMS5gu0SI3wSpVy2M
         YHEqCBW/hUWWgiAXZGNrjJYPlxychkNn4X1BZbzCg2Mr4z916oMwZi5IHWVSCdd6oBEl
         6aaaTd82z6zJxxzYklYdkiXi6cyGdjUdL6z+ozUlZd26jy7z6AnpTHGFZoS8x0lBdh6E
         EtlQ==
X-Forwarded-Encrypted: i=1; AJvYcCXPUGWCqM9Gv3hy4o5R5cFToSI3LgpIg4xVbdU0JDTQW+kgKpDXK68qmhfYkK0CVbdc0QhdIiEpVdz02fUQW/pi3g==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yyz+91KSFLOCFQ5JKS1eJSp5br8n02pk2BG+he9kLxLSves4rGJ
	7eeEY2MXruKKFzt3LFQIv9H853LOePKyfIH0PbIwP2xeYmffGsx4KA45aVcZQkk=
X-Google-Smtp-Source: AGHT+IHx45xzF4mt1NscAyaS8iT8te+xivDskBCR2HC/yu27k+O57HzulZgKIzgJ4Qb4vnWDqWvsdg==
X-Received: by 2002:a2e:bc88:0:b0:2fb:4fd4:668a with SMTP id 38308e7fff4ca-2fb6dc9d41amr7175251fa.22.1729155133380;
        Thu, 17 Oct 2024 01:52:13 -0700 (PDT)
Received: from nuoska (78-27-76-97.bb.dnainternet.fi. [78.27.76.97])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2fb5d193f7dsm6779161fa.76.2024.10.17.01.52.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Oct 2024 01:52:11 -0700 (PDT)
Date: Thu, 17 Oct 2024 11:52:08 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH v8 0/8] systemd uki support
Message-ID: <ZxDQOGCEpAt7wnnt@nuoska>
References: <20241011122044.12222-1-mikko.rapeli@linaro.org>
 <ebd022b240f4bb6b8e2e2fb8d93a4c9f2ba9492f.camel@linuxfoundation.org>
 <17FE4B15CF045259.4702@lists.openembedded.org>
 <Zw4PXRX28-qB8FjT@nuoska>
 <874585dde5c3fe6685e9c8b250cd02dc2404f26c.camel@linuxfoundation.org>
 <17FE9C82DB831F81.27606@lists.openembedded.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <17FE9C82DB831F81.27606@lists.openembedded.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Oct 2024 08:52:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206008

Hi,

On Tue, Oct 15, 2024 at 02:23:07PM +0300, Mikko Rapeli via lists.openembedded.org wrote:
> Hi,
> 
> On Tue, Oct 15, 2024 at 11:43:33AM +0100, Richard Purdie wrote:
> > The arm test still fails:
> > 
> > https://valkyrie.yoctoproject.org/#/builders/23/builds/267/steps/14/logs/stdio
> > 
> > The traceback is at least cleaner now I fixed the lock error. I did
> > test with KVM disabled.
> 
> Bugger. I had tested this on qemuarm64 and genericarm64 on an x86_64
> build host with Ubuntu 22.04. Is this an arm64 build host with Ubuntu 20.04?
> 
> I will remove the tests as it is clearly too hard to get these running.
> 
> It is a bit hard to figure out in which environments selftests are running.

I sent out a v9 which disables the test on non-x86_64 build hosts.
I hope that was the only failure seen from this series.

Cheers,

-Mikko

