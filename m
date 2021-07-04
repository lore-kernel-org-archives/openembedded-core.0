Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web10.7529.1625390513273494952
 for <openembedded-core@lists.openembedded.org>;
 Sun, 04 Jul 2021 02:21:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=UBN1sVNp;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f43.google.com with SMTP id l18-20020a1ced120000b029014c1adff1edso11951170wmh.4
        for <openembedded-core@lists.openembedded.org>; Sun, 04 Jul 2021 02:21:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=+v1FN81bPLd58eJ2+aCl04dJ9xCpzHPY6ObJ+lD/WVk=;
        b=UBN1sVNpiOQ+JirgKN7sMPLbP+aBNkRQRjrpwyXEVBSJtFKPvem90WalgmtqrvrTFZ
         h9NEKHsIEKzcqUOof+Bpjf6hlDifViZbrlwQRf7THDT5H9KiF4YkTJ8Xb5KkGFNvohC6
         uk4sFOawe0imfSR4J64JnmuwrrhceYmUsX7Y8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=+v1FN81bPLd58eJ2+aCl04dJ9xCpzHPY6ObJ+lD/WVk=;
        b=rF3p0y8RuJL5R857ibONMUhjUdXEFvRIphhUlw8lJz2wNqIy2ibt0oU0vF1hNBqqMI
         jHLbzT+iGSTNqOGk8uPXD2izvAY9iMdG4A2M2who9eqb0GgCljwKX0+MIrCm1+U0Nldh
         oynUjUP99rfhV6J2BW5X8xy/oi+iKYDsPx/krj+bS1rPh31qjMujBN5ytnCIPRnKHMLK
         MMstJAGtZtvC2p3ZTirFJ8YzFOgiKS3V+yexdracaDQ0Gt02Zt7Xf7RTFkNqNDsn1rBs
         dfc3TiOAwluJeNVEScOtS6JEybr+e8cR4AfwDYdJpkZeVSpshvCTTRx4/QQ8SK6+LZM1
         3PPA==
X-Gm-Message-State: AOAM5323fv5kMSMBlnqARwG1ZX/clXD/JkrFxcoNkkIe8ZhA353xcEkk
	qbzete+SyqbXetEKO9kENwCeWw==
X-Google-Smtp-Source: ABdhPJzqOtHNcDVvMR7v6GorRMkzUJBZldRQuu6YJOAwxBxJ/eXhpcjNKkjQI4R+n4VeWnH2ziYpGw==
X-Received: by 2002:a7b:c76b:: with SMTP id x11mr9085940wmk.66.1625390511688;
        Sun, 04 Jul 2021 02:21:51 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:f8cb:97a3:103a:4a52? ([2001:8b0:aba:5f3c:f8cb:97a3:103a:4a52])
        by smtp.gmail.com with ESMTPSA id d186sm18968580wmd.14.2021.07.04.02.21.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Jul 2021 02:21:51 -0700 (PDT)
Message-ID: <a3f45eab0d82dea6f34936d821d902b79c43abbd.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] Revert "libubootenv: inherit uboot-config"
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Peter Bergin <peter@berginkonsult.se>, "Mittal, Anuj"
	 <anuj.mittal@intel.com>, "openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Cc: "otavio@ossystems.com.br" <otavio@ossystems.com.br>, 
	"liu.ming50@gmail.com"
	 <liu.ming50@gmail.com>
Date: Sun, 04 Jul 2021 10:21:48 +0100
In-Reply-To: <775af313-1b19-146e-b0f3-113d5af0a992@berginkonsult.se>
References: <20210702115900.19417-1-peter@berginkonsult.se>
	 <bc5cdd46cfb003f45c1ed7762ee140c0f4f5cca5.camel@intel.com>
	 <775af313-1b19-146e-b0f3-113d5af0a992@berginkonsult.se>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2021-07-04 at 10:59 +0200, Peter Bergin wrote:
> On 2021-07-03 16:55, Mittal, Anuj wrote:
> > On Fri, 2021-07-02 at 13:59 +0200, Peter Bergin wrote:
> > > This reverts commit 10aa1291979fb90bed1beb49be4d406ed0e1e4d5.
> > > 
> > > As there is no build dependency between libubootenv and the
> > > configuration
> > > of u-boot there is no reason to check for UBOOT_CONFIG or UBOOT_MACHINE
> > > by adding the class uboot-config. Revert this in order to remove
> > > useless
> > > workaround in bsp layer (meta-freescale).
> > This was added to address failures in world builds:
> > 
> > https://lists.openembedded.org/g/openembedded-core/message/141757
> > 
> > If this is not required, then I think we'd need to address those
> > failures.
> 
> Thanks for the pointer about the reason for this patch. I searched a bit 
> but could not find it.
> 
> Can you please help me define 'world builds'?

"bitbake world"

i.e. build everything

> By reading the mail thread my thoughts are that the obvious thing is 
> that the build has a bad configuration as u-boot is skipped. This should 
> be the thing to solve.

Not every MACHINE will support u-boot or have a configuration for it.

> Do we have other examples in oe-core where we have a RRECOMMENDS and a 
> requirement that another package is built. Isn't RDEPENDS used for that 
> case?

RDEPENDS is a hard requirement, RRECOMMENDS is a "soft" one. Bitbake
treats them the same in the sense it will always follow them, the destinction
is left to the package manager at the root filesystem creation time.

Cheers,

Richard

