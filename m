Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web09.7170.1612528734792449553
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Feb 2021 04:38:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=CmbyDjlQ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f47.google.com with SMTP id c4so7483396wru.9
        for <openembedded-core@lists.openembedded.org>; Fri, 05 Feb 2021 04:38:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=JqQ1ep1XK0oZ20Qk17LD/pA0PlmCYwva7gNmeLZH5xU=;
        b=CmbyDjlQBj/C0d8kyETQBMDUAYLN0V57ZJ45ztPhAaOZ18ULKlTYptTsdgPgY1u4Xd
         OJGBPjDKkbYcHlQpfo/v5nKAwfPdraB+fNJOXeA6ktJIu/S9QwfEo3EEHor1hArGy0TF
         kB5EFmS4QZTFsHIEzuamxqnAleyoeMOpM9Qm0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=JqQ1ep1XK0oZ20Qk17LD/pA0PlmCYwva7gNmeLZH5xU=;
        b=EjhVvHJgyu3Lnygxx6+OgwFZIkZTjYV9h1zqXR9ersHYCG8rcUjbYXo2g+NPOOQxM5
         +k08pNYt1/76rRau/jOg+/2o07+2JzRBEjeoFRMdN9nWzoJ0QHmIfVeYaFEbqhsCXMT2
         li3eROFkb/KGt3l7oqUzWF75nT4NHHAHwJ404QOwrJmZBy3NEJmof0OdyUD07VuLnXZ1
         nNuIOkK8lYs5QxFIIG/GcM5EtZQV48lGvDuFZCzbxdylo01oxR1pgXfQDdPk5I+4V2Oe
         YfEB3OOIVeoFwfOKDWahZEIuVqs9aio5opQDge0rt+hvVhqjdN3+oRl2hqlalmd/l75o
         QCRw==
X-Gm-Message-State: AOAM533LuGnkdsE1qrKOchJ/bAuqXFrqsTRFftj11maUR4PHYBu8VDSs
	KlPX44uXwnSUf6YeJ6OrGAk9bg==
X-Google-Smtp-Source: ABdhPJzwhQktLkcFkaOlRMLrwj2eBa3GH8Ilp5SagTdSqG/vVQQVu6jLR7YIeoInrvul7NY2fZyJ2A==
X-Received: by 2002:a5d:4402:: with SMTP id z2mr4782953wrq.265.1612528733224;
        Fri, 05 Feb 2021 04:38:53 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:d1b2:8778:591e:ef47? ([2001:8b0:aba:5f3c:d1b2:8778:591e:ef47])
        by smtp.gmail.com with ESMTPSA id d16sm11940103wrr.59.2021.02.05.04.38.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Feb 2021 04:38:52 -0800 (PST)
Message-ID: <9da0171adf6cc76fed112f7df9210f4deb49fff6.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 1/2] image_types: Ensure tar archives are reproducible
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Patches and discussions about the oe-core layer
	 <openembedded-core@lists.openembedded.org>
Date: Fri, 05 Feb 2021 12:38:52 +0000
In-Reply-To: <CA+chaQcpgeCdunqKrPJkkqjRw-dY68pHM_zdj5u3zMOjh5cG7g@mail.gmail.com>
References: <20210130180240.1417810-1-richard.purdie@linuxfoundation.org>
	 <CA+chaQcpgeCdunqKrPJkkqjRw-dY68pHM_zdj5u3zMOjh5cG7g@mail.gmail.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2021-02-05 at 13:14 +0100, Martin Jansa wrote:
> On Sat, Jan 30, 2021 at 7:02 PM Richard Purdie <
> richard.purdie@linuxfoundation.org> wrote:
> > The tar output seems to vary depending on the version of tar used
> > and distro
> > configuration. Be explict about the output format to avoid this and
> > be
> > determinstic.
> > 
> 
> Is it the tar format selection which isn't deterministic or something
> else when the format isn't set to gnu?

Different versions of tar seemed to be picking different output
formats, I therefore picked one. I looked at which output format
reproducible builds were recommending.

> I'm asking because gnu format isn't compatible with --xattrs used
> e.g. here:
>  
> https://github.com/advancedtelematic/meta-updater/blob/d3a832f66e8802cb45536ff278d5c77f946d341d/classes/image_types_ostree.bbclass#L16
> causing do_image_tar failing with:
> 
> | tar: --xattrs can be used only on POSIX archives
> | Try 'tar --help' or 'tar --usage' for more information.
> 
> I've already tested that --format=posix here would fix meta-updater,
> but not sure if it's still as deterministic as --format=gnu. Do you
> remember which distros were producing different output?

I think it was centos7 differing to ubuntu 18.04

Cheers,

Richard

