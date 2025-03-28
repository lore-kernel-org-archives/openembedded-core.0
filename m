Return-Path: <hiagofranco@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F5BEC28B20
	for <webhook@archiver.kernel.org>; Fri, 28 Mar 2025 20:36:21 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web10.3931.1743194173576151998
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Mar 2025 13:36:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=A3UiM+aa;
 spf=pass (domain: gmail.com, ip: 209.85.214.169, mailfrom: hiagofranco@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-227c7e57da2so44653135ad.0
        for <openembedded-core@lists.openembedded.org>; Fri, 28 Mar 2025 13:36:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743194173; x=1743798973; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=f6qefvb2eENdcf68AZo0sMV6KLcDYU/NkYjtg58TBNw=;
        b=A3UiM+aakkxf9e4D1G4N2yaGeq25iDx1VC5bqN3WcoqBNfpcujmmgv2R8k6BU8bDYT
         Z6zRJOT3+ZSvgJoBFHNGOeBho95HPG2M4+htMwDRiFnlUMPHaxozZQJajaFTMhlNVnAr
         MqTum3RBzLnN02ELuzS8v9GxcJmmiNlGOUvq1965SWd617bWfN4Y/cWxqH57gcItoBoD
         ACobCoeW9yfhay7scf1xWTH/ngey+vCZsZM+nKvRp4agWiogz26Qs82ajQFfYftJ14EI
         jkoccs0ubxdXdBwBOwVG3aE3IpALZ0PHwOLVLZz5Q86e+XlzEz9g8bCLAT4bxgH1c5ij
         klSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743194173; x=1743798973;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f6qefvb2eENdcf68AZo0sMV6KLcDYU/NkYjtg58TBNw=;
        b=qQt4Hb3NR0WRrgyxZbJzq9V0OzMm3sAbAZJvbz8/ZN+PozqIK7TZFJtvGNj441SVGt
         DB/J5vH9UB8NZ4tNLEhHqIXWNpOzv5sTu45qRXmN0S6UShMe8o+ZnrIx7L8aWfToIY32
         7vczp0Y/i2058mB2sNyBJVYppXbZVmC6smIl6qXHtCbegRZmkvo5CC4da/AnH+b2cC0u
         h2KPS+7xsRI5l/obKLyuNyFtUnXyoBD5JDSo/4xcA2FmCsL5YrGY0f20p96POnfjJvxf
         XQifIXI9JGiitWKK2CZFEsCYlk5r5t+uOBaf807d0a8rRgKcMwajacFvRrQzf8utNITd
         JRWg==
X-Forwarded-Encrypted: i=1; AJvYcCVwUalHt8vgi4UhV9ZYdEPobO3h9alG0BlAteFiGxfrWTnK4w1DhMimpA033ubEHsRzkDCmlt+IU2b+NQZJ9Mr+1w==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yz9xlRUp1CoXaGz/QFRRKjrSHAJiqoRBDX3LtyzFgY3fiAeZglX
	GoliowjPvV/7x41JJMxaqJJsjaj4Z79qWJ52u2tMkVHSXK74R79g
X-Gm-Gg: ASbGncurquQ78m+w3mjBU13Ug7/r3ZOQtKC0lAotft0UJYvkXt2sllo8683xNqZ4t5k
	PbRMuOCUd1gDV9FalP0wcwWAfDiLRVVYEN+knkrXHKkLZwVzL/7vBguInin3U8kEw0HRrV1jqVF
	a4NmirgOdv/dObzcvog5HdLdX6IIUNsYQJrxFdXqMuBS/Y1jHRtlLSr+aRE80Qg48Jcp6JO3JLd
	RGwN3qJ2ekcOxscPKwjyRFL+/0xYx7OyqKi/1zzCHGdCSLUiAuSRGaZlHYlG4L9nx4CIrD4/nS0
	sopZ6yZxdZ9rA15kJqgTx19R3Fc7n8PXa6ZiqR1NzahC
X-Google-Smtp-Source: AGHT+IGKwGYmRwOY7RH1/+FIziD8eqOj2fKOaNmUojSJfMKJVO36ApMrprG/qYOWVHUNRJY+VIRK2g==
X-Received: by 2002:a05:6a00:21c9:b0:736:34ca:deee with SMTP id d2e1a72fcca58-739803531famr797038b3a.7.1743194172509;
        Fri, 28 Mar 2025 13:36:12 -0700 (PDT)
Received: from hiago-nb ([2804:1b3:a7c2:7498:d7e2:8528:c56a:4f23])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7397109d241sm2233522b3a.129.2025.03.28.13.36.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Mar 2025 13:36:11 -0700 (PDT)
Date: Fri, 28 Mar 2025 17:36:07 -0300
From: Hiago De Franco <hiagofranco@gmail.com>
To: Quentin Schulz <quentin.schulz@cherry.de>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>,
	Steve Sakoman <steve@sakoman.com>,
	openembedded-core@lists.openembedded.org,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Hiago De Franco <hiago.franco@toradex.com>
Subject: Re: [OE-core] [styhead][PATCH v2 00/31] linux-firmware: upgrade
 20240909 -> 20250311
Message-ID: <20250328203607.tz4q2qaegmgnvwm4@hiago-nb>
References: <5a7b5f6c-1be9-4c5d-bf2e-59e115762d6a@cherry.de>
 <CAOSpxdajP0E0uVMR3QmRCqqmmRMAMnXiZM3bPmOXHGyRrVTfDw@mail.gmail.com>
 <20250327171239.kvs4jtetjkcs3i2u@hiago-nb>
 <CANNYZj-+2ESLmCUjGR9ZXK62=wJno85DgFdU3tjsu1O7G5DPGA@mail.gmail.com>
 <20250327190137.sfgisyjocd3ktje6@hiago-nb>
 <eb57a2a6-6413-4f72-bbdf-783918c21afd@cherry.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <eb57a2a6-6413-4f72-bbdf-783918c21afd@cherry.de>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Mar 2025 20:36:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213871

On Fri, Mar 28, 2025 at 10:26:49AM +0100, Quentin Schulz wrote:
> https://wiki.yoctoproject.org/wiki/Stable_Release_and_LTS#Stable/LTS_Patch_Acceptance_Policies
> 
> In any case, it needs to go through TSC
> (https://wiki.yoctoproject.org/wiki/TSC) before being accepted I believe. To
> reach TSC, it needs to be suggested by the release maintainer as far as I
> understood. That would be Steve Sakoman at the moment, c.f.
> https://wiki.yoctoproject.org/wiki/Releases. Steve said no for styhead (no
> further release) and no for scarthgap (not comfortable with the amount of
> changes and potential breakage). I personally believe a simple no on the
> mailing list can still be appealed by trying to convince the other person
> until a full stop no is given or consensus is reached, so you may try to
> find ways to limit the possibility of breakage, especially unforeseen ones
> so Steve would be more comfortable with the changes, essentially figuring
> out what would make the release maintainer more comfortable with the
> patches. But the current situation is, no desire to accept the patches into
> scarthgap via the main branch.

Got it, thanks Quentin! Thanks for sharing the links as well. I will try
a v3 in the next days, see if I can make something that makes everybody
comfortable with, otherwise I also might consider the other layer
suggested by Alexander.

> 
> Cheers,
> Quentin

Cheers,
Hiago.

