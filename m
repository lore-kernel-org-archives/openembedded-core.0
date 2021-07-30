Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web10.21180.1627632184756097014
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Jul 2021 01:03:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=VsK4NgJ9;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f51.google.com with SMTP id h24-20020a1ccc180000b029022e0571d1a0so5779608wmb.5
        for <openembedded-core@lists.openembedded.org>; Fri, 30 Jul 2021 01:03:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=ilHA4pURpVG5SpiiwsheVkwF/CfUzsqzOYMIHJze9UM=;
        b=VsK4NgJ9fPl3N82XcmcaRl7dBcxwbuLNF0Kv05TMvXsFscI8qjtLWwAnQJoKxv2FIm
         POfDaKmK12luex4OWO8DJ1TmHsE/W13t5TYBbOOOQysu1MDW4XvgPyB9CSJj1/fdMkbm
         LwEPps52TwgcOAcoUTrxmyYzqJh3+75rBKBks=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=ilHA4pURpVG5SpiiwsheVkwF/CfUzsqzOYMIHJze9UM=;
        b=R9oSMhGdh4YRhmC9hXn3gfl0XNsHstsi55dIf9iFE1zxEYjYk2poK2C4QzGS04QH9x
         K0rdD9He+TLEHDkOidCK2G1tFYA/8ZGlHzUsz6ocVfQ7uA6o17hFWrCXcm7Ux1Z1oxok
         W2lljjESUQ2ujt+kBBaz7mu0AjLKfEkNp7GX6DjtMMm/zLaAjLlPkVaJmchqTzZde/0F
         +m2ILFWuFBYLfWWny9hCVdSh8czo6TJVLOYrYUYOzMONimFkjR9XajP1nKYHjEdhpdsU
         IeCodMhoBmlxEabl/0xotjMlojBUJ4f4+e5g0/H/WRTTAwdmD1ewxXwWGhcWjZ2bs36L
         j8XA==
X-Gm-Message-State: AOAM531sybepZvIt4Q3sOf3A2aDtipaVoMwJdXLfkf3MrnZkAcPqpa1m
	GjcDSF53QCaaPjIEFj8Zi9ot9g==
X-Google-Smtp-Source: ABdhPJyiKCTgODHT+w1okZ9KNEicWYdK+QrD3Ml8oT5htq791CPMEgw9aR+R20y0C2QFJmUL4dIyOA==
X-Received: by 2002:a05:600c:4f4d:: with SMTP id m13mr1648340wmq.31.1627632183042;
        Fri, 30 Jul 2021 01:03:03 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:47e7:2d3d:e4c2:218b? ([2001:8b0:aba:5f3c:47e7:2d3d:e4c2:218b])
        by smtp.gmail.com with ESMTPSA id a8sm823419wmj.8.2021.07.30.01.03.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jul 2021 01:03:02 -0700 (PDT)
Message-ID: <33b5d60e01b3995046709b17b8014fd45b0c48e5.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 0/4] yocto-check-layer: add support to check for dependencies
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>, 
	openembedded-core@lists.openembedded.org
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
Date: Fri, 30 Jul 2021 09:02:59 +0100
In-Reply-To: <20210722124644.19962-1-nicolas.dechesne@linaro.org>
References: <20210722124644.19962-1-nicolas.dechesne@linaro.org>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2021-07-22 at 14:46 +0200, Nicolas Dechesne wrote:
> It has been recentely mentioned to me by the YP TSC that a layer must
> not only pass the yocto-check-layer script, but also all its
> dependencies. These patches add support for testing dependencies
> automatically.
> 
> Patch #1 and #3 are not much related, but improvements I made along
> the lines. 
> 
> Patch #2 split the internal function into 2 parts, so that we can get
> the list of dependencies from the main script. 
> 
> Patch #4 is where the processing of the dependencies is done. I chose
> to enable checking the dependencies by default, and use
> '--no-auto-dependency' to disable it, we could decide the other way
> around. For any dependency of the 'layers under test' we will simply
> add them to the list of layers to test unless they are already there.
> 
> Here is a sample output with these changes:
> 
> $ yocto-check-layer /work/oe/sources/meta-aws \ 
>                     --dependency /work/oe/sources/meta-openembedded/ 
> 
> INFO: Summary of results:
> INFO:
> INFO: meta-aws ... PASS
> INFO: meta-python ... PASS
> INFO: meta-oe ... PASS
> INFO: meta-networking ... PASS

We merged this but have started seeing:

https://autobuilder.yoctoproject.org/typhoon/#/builders/121/builds/166

which seems a little strange and is probably related to this series.

Cheers,

Richard


