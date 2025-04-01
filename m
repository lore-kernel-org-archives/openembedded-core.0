Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93E7BC36017
	for <webhook@archiver.kernel.org>; Tue,  1 Apr 2025 22:54:50 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web10.472.1743548088443729780
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Apr 2025 15:54:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=iJLo/KNu;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-39c1ee0fd43so1596555f8f.0
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Apr 2025 15:54:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1743548087; x=1744152887; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VanSzhAGNUC4sCsvFMsf36UCZ4HxuF6I2+PwhYG5SE0=;
        b=iJLo/KNuy5F8UINsJHwea5OsReAWk7OuWIgPBhgvgbY+/f7pWHrAsWvW4zHro11VM5
         4dd4cEHmSFf967mJ1ebjW2iy9xCrtO1DR4cC+A7BRJhr4h6dGnnbC6uAsy5f8z2I54gc
         2lQeEerFu0bywjHr9/9lhhSz9EG331KPe14Sw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743548087; x=1744152887;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VanSzhAGNUC4sCsvFMsf36UCZ4HxuF6I2+PwhYG5SE0=;
        b=w4/ydbQBjLW1+riPGH3DuoWMzlRBeqbXHWpKmTJtpr7dBrntJAlNphz4lokXqRSE58
         NHkr4vLhzKY8adrOxd8QmGBdFsdO8YA31OANrVmbryRBKi424wWXg1J3A+uzELK4QIwV
         0wqovCbabH648iK0uolzIyeVEIm2uCIcA3pbRNC9JAR0FYULC9ls++kIRriD0NKVqXlz
         zCX4mLZOaE270D09XA68ofCqfyG+jq0DMt3+tFD7IbN8/1YtyZviDCxSTC9YEX3b16xf
         0VbzLIR+w8qH4CZvGVsyqdz+R3upDyVtUg5F5RBHKuf2iXnL6tfbbGB0ceOVcYZSAVEB
         p93g==
X-Forwarded-Encrypted: i=1; AJvYcCVZ/Wnthvlto3bTbswmhSeN1AhQTcgEShNQN1wp5KNzVhw5Yc4KHmgUcNl0L7/gnSvQ8WxSYKtHPHhK0m+DmzVhFQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yz3P0UuU2r9elYaNyetURvKa4L8YazzIbkIgXs34WprYyPEcp8h
	L0FhlgntjL5qXwzAnCe/fUmrwKpP1fO+UkR0MrGwuBZKh+YJDe0TZJZyO5epUFHz2zUMH9ztI8g
	f
X-Gm-Gg: ASbGncvju2VC6QMtGZ87hhkobLnAJsiAYiT5hYWKAPzfC2lappf6ex3QUHKjwjihNAy
	9c1+LQ0/0Z5M6AWuSYcKerRHFhP/KXBTBAnqYmCXV/CQqSxfiQpqc0B/QYuPbtJuWpL/ti44bMv
	VEH0p7xfYS7fSSIsjNsHgy75EiFMK/AuIcnnD4lM/HP2L5sMSUGnH5aPWoHPaLE/v3E3VkkS8yq
	ECWSlB5gIcOC98RKSXgxcozdVV//pNSYWwsJThh8NiX3keHPuJvbY54lU6uemm1rgeia5stWF9m
	wf8kDSL/lS6O6iuX2yZbvRaZrjnLBUzxKalbcl3ROrLB+iG/JuraRzzu+rAdZIaw/8pDNMlrRAE
	CnFhJOrLC7CtRYQUJeGqEq02LmMYkLzQ=
X-Google-Smtp-Source: AGHT+IGhJq8S2zzVg14Y1hSqOMJC7QR5O+/5zL7EHQmGZEEzubqdM5oAadnr96nlLqifyMc/nFLSJg==
X-Received: by 2002:a05:6000:1786:b0:39a:c9b3:e1d7 with SMTP id ffacd0b85a97d-39c120e3b71mr9450664f8f.29.1743548086716;
        Tue, 01 Apr 2025 15:54:46 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:581:377b:c52a:dfb7? ([2001:8b0:aba:5f3c:581:377b:c52a:dfb7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c0b66ab6dsm14953629f8f.48.2025.04.01.15.54.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 15:54:44 -0700 (PDT)
Message-ID: <972bb15e0607b86d5532172c5885d7e11e544b25.camel@linuxfoundation.org>
Subject: Re: [OE-core][kirkstone 8/8] glibc: Add single-threaded fast path
 to rand()
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: steve@sakoman.com, openembedded-core@lists.openembedded.org
Date: Tue, 01 Apr 2025 23:54:42 +0100
In-Reply-To: <0c99e9e0d1c848d10abe0527e5aa98f2a0750b2a.1743546795.git.steve@sakoman.com>
References: <cover.1743546795.git.steve@sakoman.com>
	 <0c99e9e0d1c848d10abe0527e5aa98f2a0750b2a.1743546795.git.steve@sakoman.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Apr 2025 22:54:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214161

On Tue, 2025-04-01 at 15:36 -0700, Steve Sakoman via lists.openembedded.org=
 wrote:
> From: Haixiao Yan <haixiao.yan.cn@windriver.com>
>=20
> Backport a patch [1] to improve performance of rand() and __random()[2]
> by adding a single-threaded fast path.
>=20
> [1] https://sourceware.org/git/?p=3Dglibc.git;a=3Dcommit;h=3Dbe0cfd848d9a=
d7378800d6302bc11467cf2b514f
> [2] https://sourceware.org/bugzilla/show_bug.cgi?id=3D32777
> Signed-off-by: Haixiao Yan <haixiao.yan.cn@windriver.com>
> Signed-off-by: Steve Sakoman <steve@sakoman.com>
> ---
> =C2=A0...dd-single-threaded-fast-path-to-rand.patch | 47 ++++++++++++++++=
+++
> =C2=A0meta/recipes-core/glibc/glibc_2.35.bb=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0 1 +
> =C2=A02 files changed, 48 insertions(+)
> =C2=A0create mode 100644 meta/recipes-core/glibc/glibc/0001-stdlib-Add-si=
ngle-threaded-fast-path-to-rand.patch

Not sure this has made master yet!

Cheers,

Richard

