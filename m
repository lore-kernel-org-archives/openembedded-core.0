Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web10.13327.1609766555494499145
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Jan 2021 05:22:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=YOXIP0RB;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f45.google.com with SMTP id a6so18418153wmc.2
        for <openembedded-core@lists.openembedded.org>; Mon, 04 Jan 2021 05:22:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=rk27zrhUT2TJv0a5z6h+cOu0hnEliI3PZs/4Up9/qcI=;
        b=YOXIP0RBuiehbQpQO7Kg3C6oVNWQvi3shXIYDBwbrnURIDOFDkMpbIGougnKMOx7Gq
         d6sirzZmqXnr7JSrlfI4K/3CJ92NyG3u11tV1Ie8Oa/eeVpYkuWqekpG0LGiANLeb8ST
         7b3zTDWspLveA6KflwEM2DLW2Blg1Q3AYmIFU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=rk27zrhUT2TJv0a5z6h+cOu0hnEliI3PZs/4Up9/qcI=;
        b=UDHZEUiTQQ8a0fvsyZcpLZTFx1+rWmdzXwOWAhK/5aWtw6eR5BYAtas57EIwUGI37x
         P58WNKbAx0Wvqhu5ONAzt709sU+h1cuaxk7/hXQ782ZPghtzSWfzpz6EMwSMEducXh7m
         sm7VGBmR3UuzHoM5a553V9L1nrs6hXqOAkPo2k4CE8l1FtUa8dI8r1msNgTR1Swo9WKF
         I12flllacTpI5tf1uzBKzA8nTa9D76HDcNrzUxRYNVH3mWTUyHlIOF055IAm65yhKjZS
         oU6nd7fgPVWva8jnWpMJ3+uj8dlcpI3c1/XxGXKv3nCe00IF7/9jae7K+BRP3tG9LuNp
         4UCQ==
X-Gm-Message-State: AOAM531uKHqZ9sTyjCNJF5kx+1ScM3Lctm8rt+NFTShzrKr0mzS+Rvpp
	tM4G6I6kx2gbTBn2kvXgm1Sicw==
X-Google-Smtp-Source: ABdhPJxdytw9Z4No2+Gy5KVZCC+Sf4+xWn3qHIG1rvsQsNaQYsbwwnUFKgWKO3T4Mbl0qftvYzrffw==
X-Received: by 2002:a7b:cbcc:: with SMTP id n12mr26550803wmi.23.1609766554027;
        Mon, 04 Jan 2021 05:22:34 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:4767:d28d:f91a:aa32? ([2001:8b0:aba:5f3c:4767:d28d:f91a:aa32])
        by smtp.gmail.com with ESMTPSA id h4sm88851367wrt.65.2021.01.04.05.22.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Jan 2021 05:22:33 -0800 (PST)
Message-ID: <3b18da8aa5741857c6a0d93d8ec77c7854fa1695.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2] u-boot: add /boot and ${sysconfdir} to SYSROOT_DIRS
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Diego Sueiro <Diego.Sueiro@arm.com>, 
	"openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Cc: nd <nd@arm.com>
Date: Mon, 04 Jan 2021 13:22:32 +0000
In-Reply-To: <AM6PR08MB3461DD31D010E15507D15B0892D20@AM6PR08MB3461.eurprd08.prod.outlook.com>
References: 
	<9c29138b53742ac268b54768773f72a2279f3f49.1609748975.git.diego.sueiro@arm.com>
	 <56b88a5513085b38781e02327537289d2fdd8203.camel@linuxfoundation.org>
	 <AM6PR08MB346196292FFCAE3C6499D55D92D20@AM6PR08MB3461.eurprd08.prod.outlook.com>
	 <688508925922a91f009ed5fdb25814d3cbd1cfee.camel@linuxfoundation.org>
	 <AM6PR08MB3461DD31D010E15507D15B0892D20@AM6PR08MB3461.eurprd08.prod.outlook.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2021-01-04 at 13:07 +0000, Diego Sueiro wrote:
> For some arm based machines we end up generating loads of
> intermediate binaries
> which will be further processed and combined as standalone images,
> for example.
> I think doesn't make sense to have them in the deploy dir since it
> will make it
> polluted and I do much prefer to have a tidy deploy dir with only
> artifacts for
> flashing/update the target, rather than a list of useless artifacts
> that can't be used
> directly.
> 
> And I do agree with you that using the SYSROOT_DIRS for this purpose
> might lead
> to  confusion. Is it plausible to come up with a new variable and
> do_populate related
> tasks to address use cases like the one I described

Just thinking out loud, maybe we can use SYSROOT_DIRS if we use
something which is named clearly such that its obvious it will never be
on the target rootfs? 

"/boot" is confusing as some systems do have/use that but there is
nothing stopping us creating something specific to this purpose. We'd
have to clearly document it should never be used for anything also
shared using do_deploy and was for intermediate files only?

Cheers,

Richard


