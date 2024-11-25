Return-Path: <hiagofranco@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D335FD59D80
	for <webhook@archiver.kernel.org>; Mon, 25 Nov 2024 23:57:07 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web11.34162.1732579025785026665
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Nov 2024 15:57:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=j2G5kqC2;
 spf=pass (domain: gmail.com, ip: 209.85.214.170, mailfrom: hiagofranco@gmail.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-212581a0b33so49590885ad.0
        for <openembedded-core@lists.openembedded.org>; Mon, 25 Nov 2024 15:57:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732579025; x=1733183825; darn=lists.openembedded.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WMVdkdzrEruImSMBhx6zXFslkZXB/RtlpIppyTiOt5M=;
        b=j2G5kqC2RWyRCjC1OsQGgJc7WoXhUHK2LMoKWspU3QvE2GJlTOlkD9iU0gQ69jToXD
         1NfPNIM3mFgn/zfwiP1bQF3nzsS8qFQClkr+YP9hIZEl6j2mqPHARt1B5TEeJjqh29OI
         2SyxMHj2tyiEcvcpxbSOaggieuslZa5FydGa3hmV2ljhRqJF9NzDxmfP+lFPwPE8aVH+
         ISI6gTdq8N8ZgCFHocn/NrsSNjVp/G3iS0BHq5zliAkOPdC2LSOT4LdUB/fHfvmKrYeB
         9ytDZLh4l+EUUkoTYis/grUGE7+ZBDwS8pf6xCwXF7nS/Q0Akaic2VU8mBpaKnG1qQYs
         v0zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732579025; x=1733183825;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WMVdkdzrEruImSMBhx6zXFslkZXB/RtlpIppyTiOt5M=;
        b=XBue6eFfc08Rvl4QDK1wywEhpO+hbEgzxmd7XUZaXbvcAb1V24v6WSxgN/id+h3T/8
         AGWjzpNwRMT+qwcJUrjv/gBtc8D0SJLzxMHK3ZA/s8JPQJY927vkVHnEVmfk54RY8+Vz
         T3WHhmpWgczNlVqvmV2UMyXGMLEkWYCwxsVx09lcau/mRVbaioXdndchPkX9oW2NW6wT
         x/nqqoZ6MErwValfXmn4vXBDQX3oI9aOo3+8CU2W6EBngOvt6NDKGRB6OioBJq1QlrYq
         w4jmtf3i7sxIi60EXDaDwtA/5x/Q3PYDM14OrYELq7dH19G88lzuyR/VPUenYrCnBpkN
         FQcw==
X-Gm-Message-State: AOJu0YwY8JYJL42OZYQXFeI8QD6BLfoD6ANRh92nEGMghbJ2WcJt09JP
	SbVv6Bt2vb5PFtjYtJkb0uXSs+sNbVkJ0Feli0fjexzHjy/ULYWs
X-Gm-Gg: ASbGncvrzOHWHnAuCBjOuS5qV7DF0aRdlnTyYwgi5Rpv6w5AgHot4J982psAXNEDOBz
	g1JmE7w/eMLRsOcHEB0phhtlKgB/EUJs+z2zav1jw911AijwyK/mJtq6naJRGftoyRJikSLjAZR
	C+Z1ldnTNh5mubKoMqdgUPvAZBTODEiuzGSUvMFtjPdXthDga1iVdfvxvy46f0rdlCRH2VMx2KK
	bhDea2tMyobbNMNegrjtpLn8sM++1HrGDcW788b+j9k29Q=
X-Google-Smtp-Source: AGHT+IHArcipk1lywf8e+bvgQC8PfxXAJhrFtxoVo6HYEn7TMEU9/20u5a4gsfO03CnmqpA1xuaIDA==
X-Received: by 2002:a17:903:94c:b0:20c:e262:2560 with SMTP id d9443c01a7336-2129f2a486emr190906735ad.50.1732579024974;
        Mon, 25 Nov 2024 15:57:04 -0800 (PST)
Received: from hiago-nb ([2804:1b3:a7c1:5c7a:1bbe:c924:2a5:636])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2129db8c7aesm71060565ad.55.2024.11.25.15.57.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Nov 2024 15:57:04 -0800 (PST)
Date: Mon, 25 Nov 2024 20:57:00 -0300
From: Hiago De Franco <hiagofranco@gmail.com>
To: Ross Burton <Ross.Burton@arm.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>,
	Denys Dmytriyenko <denis@denix.org>,
	Hiago De Franco <hiago.franco@toradex.com>
Subject: Re: [OE-core] [PATCH v2 2/3] libdisplay-info: add recipe
Message-ID: <20241125235700.xxxdhlau7vdafp5l@hiago-nb>
References: <20241123193527.1435268-1-hiagofranco@gmail.com>
 <20241123193527.1435268-3-hiagofranco@gmail.com>
 <6783A2B0-15E8-4D42-BA44-902DCE78C86B@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6783A2B0-15E8-4D42-BA44-902DCE78C86B@arm.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 25 Nov 2024 23:57:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207802

On Mon, Nov 25, 2024 at 02:18:09PM +0000, Ross Burton wrote:
> On 23 Nov 2024, at 19:35, Hiago De Franco via lists.openembedded.org <hiagofranco=gmail.com@lists.openembedded.org> wrote:
> > 
> > From: Hiago De Franco <hiago.franco@toradex.com>
> > 
> > libdisplay-info is a EDID and DisplayID library. Goals:
> > 
> > - Provide a set of high-level, easy-to-use, opinionated functions as
> >  well as low-level functions to access detailed information.
> > - Simplicity and correctness over performance and resource usage.
> > - Well-tested and fuzzed.
> > 
> > Since commit a16598b038b2 ("backend-drm: make libdisplay-info
> > mandatory") from Weston, this library is now mandatory in order to
> > build weston 14.0.1 and newer.
> > 
> > Signed-off-by: Hiago De Franco <hiago.franco@toradex.com>
> 
> This puts a small tool into the same package as the library, so library package renaming doesn’t happen.  Can you inherit lib_package so the small tool (di-edid-decode) goes into libdisplay-info-bin?

Sure, thanks. I will prepare a v3.

> 
> Thanks,
> Ross
> 

Cheers,

Hiago.

