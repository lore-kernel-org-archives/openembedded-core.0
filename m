Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web10.3910.1627074612004407274
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Jul 2021 14:10:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=BvV8WTmu;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f41.google.com with SMTP id o3so1533246wms.1
        for <openembedded-core@lists.openembedded.org>; Fri, 23 Jul 2021 14:10:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=rfWLJtNsP9rTMp2zu2XwV4DFf6WhmpSpibk7l8OCKeo=;
        b=BvV8WTmu5BpAnCBUtTvj1Lu6QsNVo6cj4wwYjNCEP6lqtnvtC2IkRWaTLPcOaFeYcv
         nonwJEdVY3g0hpvIp3vbI92A5mZKQZY5L5wsLCWQ9XphAuQ1LG+m2lQKNfMVTrwalP7r
         VHTpzp0fM5iR+IJWjIxrqQxMXlTsD3PbZYt/E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=rfWLJtNsP9rTMp2zu2XwV4DFf6WhmpSpibk7l8OCKeo=;
        b=njSPQi+Izm0kbK6BLrEdkUnSwgtsH5bsbkx5lgdfg1DpXW8BhiQ0hcL9MHKxlIa/ew
         17ZAs1fjuUW5WD+tT/kOqF5/LW1poZZOD5G5tiTdlVKTbPgjNcwimep7k8QnzJqbX5wx
         8746uEfpanUn0DbMzfGnGJoqVjl5LlqJIF27BIQtE1c7jSgvsu7LbDABnzIfS8DJr7nk
         MUWsOH+2FyrihvYbulxQP1iBSIJSHbVWlLo/hZMaj9U1DmTjrCOl6HcWcQK4+wYoRcmw
         G/926V8Fq5uVmoGhgoHdKg10Y3ZxV7MeLrR95JtG9/38gTYQPWHCypiQldIG0EGAknUm
         EXNQ==
X-Gm-Message-State: AOAM5317F58gSWKkKR9etNNHruDrkUDl2LqKL8/jcDwMpkWVu3djhxVo
	hvws4wsYoXSbLdHLfEsKLRb3Mw==
X-Google-Smtp-Source: ABdhPJwwm7MdJNYBzktJeLXnIuEylJYuYkqem57XYHVGbfBbrG5nD8xneFVt8NRhla4UxV3YF07Pdw==
X-Received: by 2002:a7b:c762:: with SMTP id x2mr16067821wmk.21.1627074610401;
        Fri, 23 Jul 2021 14:10:10 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:c968:715a:4e06:3cc5? ([2001:8b0:aba:5f3c:c968:715a:4e06:3cc5])
        by smtp.gmail.com with ESMTPSA id m32sm5711480wms.23.2021.07.23.14.10.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jul 2021 14:10:10 -0700 (PDT)
Message-ID: <abec867fa70351470199343d00f511065db25778.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] Revert "Revert "libubootenv: inherit uboot-config""
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>, Anuj Mittal
	 <anuj.mittal@intel.com>
Cc: Patches and discussions about the oe-core layer
	 <openembedded-core@lists.openembedded.org>
Date: Fri, 23 Jul 2021 22:10:07 +0100
In-Reply-To: <CAP9ODKrhqfHAQHgJz-CvJWoObGmgB-Yp-7kOv3Bz3ZWwfEz74g@mail.gmail.com>
References: <20210723001927.42892-1-anuj.mittal@intel.com>
	 <CAP9ODKrhqfHAQHgJz-CvJWoObGmgB-Yp-7kOv3Bz3ZWwfEz74g@mail.gmail.com>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Fri, 2021-07-23 at 17:52 -0300, Otavio Salvador wrote:
> I am against reverting it again. We discussed alternatives, which
> could solve the problem.
> 
> Em qui., 22 de jul. de 2021 às 21:19, Anuj Mittal
> <anuj.mittal@intel.com> escreveu:
> > 
> > This reverts commit be1cf223bf9c514ee81820ded5b13318458c0daf.
> > 
> > The original change was added to resolve build errors [1] for MACHINE
> > values that don't have u-boot support. This recipe was, after that
> > change, skipped in world builds for those MACHINEs.
> > 
> > But we should be able to build libubootenv with or without u-boot
> > support [2] so the original solution to inherit uboot-config was not
> > perfect. But until we have a better solution, revert this so
> > builds don't fail for others.
> > 
> > [1] https://lists.openembedded.org/g/openembedded-core/message/153508
> > [2] https://lists.openembedded.org/g/openembedded-core/message/153614
> > 

Something needs to change. Perhaps the RRECOMMENDS should just be removed
as that seems to be the cause of the problems?

Cheers,

Richard

