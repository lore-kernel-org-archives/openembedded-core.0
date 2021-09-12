Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web11.17447.1631462340114098303
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Sep 2021 08:59:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=MSE3rLjM;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f54.google.com with SMTP id g128so406863wma.5
        for <openembedded-core@lists.openembedded.org>; Sun, 12 Sep 2021 08:58:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=PsjwM98GS3Ht4pwooIFn7oT1W/pklm2camkBpbbG6nM=;
        b=MSE3rLjMD3BS2Wshpz5P3LCEkqFcWHkfy0tB9PE1D3EZXBDGD4zIuO4u4+Wwfbs+Q8
         VIC60eWaegab8aCZ5Ek9qQE+hArjbx6Mmc2YBcY5dnViqsvtD+QGzFKG/IYo/Uieb+ng
         DXT4bAi2ZPjAr4J75jjU9mh0JhrLaahj+M94g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=PsjwM98GS3Ht4pwooIFn7oT1W/pklm2camkBpbbG6nM=;
        b=C56kRDUVyDAvIqktAT3HKt9wyUK+kYIwR+8cH2Rr/wNwTmCijoazi2m/sFe2mrwGB9
         ot7O0k1TO0OripeYf0w0CTPOej+HYMuadXgZDcm/Rh3b6BC6ATIOly676fuBFq3rgIc5
         8n7dXoaOOuIlIUPbHhRP0kns1FfQaz8MCbqL1l1jU5KWbjC+H+X3bKVnRaaSKDloZMMr
         M3p8/CwRVGOX4+1OdcHJCropAZRXZUezjTL8wkU4dC1nbuBvc7VNgA1sCMh45CmLGNzX
         /iCVMMAv7kmAQh6ZlbyBTQrNPlYuHo0JOSaoNYE5eWZef3uBSs/19ho9ZoHgAcclxCbk
         7DdQ==
X-Gm-Message-State: AOAM530DAALbwqntNJ1Ita6pjOvxnlSV5KocioNDsniSCEJAGqCYxo+9
	lmafuDW1CGfd1udtLLqXaM3hnw==
X-Google-Smtp-Source: ABdhPJwaitpO0XngA7sL8E5SDvvJlOM+c98mYVKOthXbLRGGuj6MgjbhpaGDXUylDoiDk31/Rwluzg==
X-Received: by 2002:a7b:ce06:: with SMTP id m6mr6756111wmc.85.1631462338745;
        Sun, 12 Sep 2021 08:58:58 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:65df:1d9c:d97e:b357? ([2001:8b0:aba:5f3c:65df:1d9c:d97e:b357])
        by smtp.gmail.com with ESMTPSA id u8sm4738707wmq.45.2021.09.12.08.58.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Sep 2021 08:58:58 -0700 (PDT)
Message-ID: <2f7b629ba49f76ad80461d00a3322a3fa1dc1b19.camel@linuxfoundation.org>
Subject: Re: [OE-core] Public project sstate/hash equivalence mirror now live
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: akuster808 <akuster808@gmail.com>, openembedded-core
	 <openembedded-core@lists.openembedded.org>
Cc: Joshua Watt <JPEWhacker@gmail.com>, Michael Halstead
	 <mhalstead@linuxfoundation.org>
Date: Sun, 12 Sep 2021 16:58:57 +0100
In-Reply-To: <95bf1261-eb40-cafa-3153-0c472142fb98@gmail.com>
References: 
	<0b6111c1d71f1665cacafafaea972e609a77a0cd.camel@linuxfoundation.org>
	 <95bf1261-eb40-cafa-3153-0c472142fb98@gmail.com>
User-Agent: Evolution 3.40.2-1build1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Sun, 2021-09-12 at 07:55 -0700, akuster808 wrote:
> 
> On 9/12/21 4:46 AM, Richard Purdie wrote:
> > We made the autobuilder sstate public a while ago but it wasn't useful after we
> > switched to hash equivalence by default. I'm pleased to be able to report that
> > we now have a read-only public server for the hash equivalence. We did have to
> > fix a small API omission and a couple of sstate related bugs but I'm pleased to
> > be able to report it is now operational and usable. An example config would be:
> > 
> > SSTATE_MIRRORS ?= "file://.* http://sstate.yoctoproject.org/dev/PATH;downloadfilename=PATH"
> > BB_HASHSERVE_UPSTREAM = "typhoon.yocto.io:8687"
> > 
> > I've included an example image build below where it took 11 minutes for a 
> > core-image-minimal image build. Obviously this is only of benefit if you're
> > building configurations that match the project autobuilder although hash
> > equivalence could be useful alone in reducing some build times.
> 
> What branches that support hash equivalence will be available other than
> Master?

The question doesn't make sense as hash equivalence doesn't have a "branch".
We're sharing any hash equivalence data generated from builds on the
autobuilder.

> > I have updated the local.conf sample file in poky to match the new release.
> > We're not widely highlighting that information as yet as it remains to be seen
> > how well it scales and what the hosting impacts for it will look like but it is
> > there to experiment with to a wider audience such as this list.
> 
> The should improve the out-of-the-box experience.

Ultimately that is the hope.

Cheers,

Richard

