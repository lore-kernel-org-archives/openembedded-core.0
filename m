Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4398BC61DF7
	for <webhook@archiver.kernel.org>; Thu, 23 Nov 2023 12:40:27 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web10.89662.1700743220126118657
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Nov 2023 04:40:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Km8UH3A+;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4094301d505so5091455e9.2
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Nov 2023 04:40:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1700743218; x=1701348018; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=09Pbiml3I0Z59/1f2FAOcxBeKQ8uNQIcphooJ5P+mAo=;
        b=Km8UH3A+5s1W0657XqnsjOdng1JH0ylfq2dBSjpS5gq5dn6Njs22cDlM/Hh+KrL9cw
         0kkE9xEMxontacH2mslhzJJdI9TFAM8hu1/lEw2hGdRTJQj/PSp7nvy9bXi7iwSVc5mX
         ywmivDi2hlVAKA7OZgmqU8G2BpVXnNumJGnrE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700743218; x=1701348018;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=09Pbiml3I0Z59/1f2FAOcxBeKQ8uNQIcphooJ5P+mAo=;
        b=tUodn1bTz6N7oBxFtnQObDjKWgLklNohsvhngLEBLQ3cIC77BhAL7rA5DV80MV7ERs
         65lNj/r+kfQ6F4ueORXBZZRxOSdW8tyQ070zpcb+/u+fR6JeN1E/nGntyPosBisU8oIA
         GeDHDAQPXLsMjv9K+vU8AOtwZe+gCFKZ+e3q/4iTBn4gldqFC4ktoTY4zfTg0NH8CBWp
         +pDfk81W6awIDhooLO0z9SYkktLzNSxy9Gc+QuQtf/q91RK4tNemmR67l9ksklsbxX37
         CRoq5qc47cn+SitMEYH0MH1B2OjN1LSvcNEIc9ROhC12rvMZhqKiqhqVpOc5lglCwAFB
         ObUA==
X-Gm-Message-State: AOJu0YyDNil4Rkp+0AUnJYM4rOCxPSUjimLcLv6eY7T20IAa3BSh8wTa
	gJcPvg7Lui7dqqR1P3K33blA3AfMkI1op0ppjtM=
X-Google-Smtp-Source: AGHT+IEIkL6DPlsXr27xqtCb6hpyE4dwMMbUdYZh6y7ZUBwi5LSTFugQEsrSVpFyeXDjHjrqByljgw==
X-Received: by 2002:a05:600c:4514:b0:409:787b:5ab5 with SMTP id t20-20020a05600c451400b00409787b5ab5mr4068137wmo.23.1700743218497;
        Thu, 23 Nov 2023 04:40:18 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:c511:4d31:367c:ab3c? ([2001:8b0:aba:5f3c:c511:4d31:367c:ab3c])
        by smtp.gmail.com with ESMTPSA id j14-20020a05600c190e00b0040b3525428bsm1909300wmq.2.2023.11.23.04.40.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Nov 2023 04:40:18 -0800 (PST)
Message-ID: <375cd11f8849681f65762a53db3716f5753f3e60.camel@linuxfoundation.org>
Subject: Re: [OE-core][kirkstone 15/16] goarch: Move Go architecture mapping
 to a library
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Steve Sakoman <steve@sakoman.com>, 
	openembedded-core@lists.openembedded.org
Date: Thu, 23 Nov 2023 12:40:17 +0000
In-Reply-To: <8726ae02d760270f9e7fe7ef5715d8f7553371ce.1700620126.git.steve@sakoman.com>
References: <cover.1700620126.git.steve@sakoman.com>
	 <8726ae02d760270f9e7fe7ef5715d8f7553371ce.1700620126.git.steve@sakoman.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Nov 2023 12:40:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191144

On Tue, 2023-11-21 at 16:31 -1000, Steve Sakoman wrote:
> From: Peter Marko <peter.marko@siemens.com>
>=20
> Other spaces uses the Go architecture definitions as their own (for
> example, container arches are defined to be Go arches). To make it
> easier for other places to use this mapping, move the code that does the
> translation of OpenEmbedded arches to Go arches to a library.
>=20
> (From oe-core rev: 3e86f72fc2e1cc2e5ea4b4499722d736941167ce)
>=20
> This commit together with meta-virtualization commit
> 115f6367f37095415f289fb6981cda9608ac72ff
> broke meta-virtualization master used with
> meta-lts-mixins kirkstone/go which is our primary
> usecase for having kirkstone/go mixin layer
>=20
> Manually crafted since cherry-pick had too many conflicts:
> * different path to classes
> * additional architecture loongarch64
> * different way how to import library
>=20
> Signed-off-by: Peter Marko <peter.marko@siemens.com>
> Cc: Joshua Watt <JPEWhacker@gmail.com>
> Cc: Bruce Ashfield <bruce.ashfield@gmail.com>
> Cc: Jose Quaresma <jose.quaresma@foundries.io>
> Signed-off-by: Steve Sakoman <steve@sakoman.com>
> ---
>  meta/classes/base.bbclass   |  2 +-
>  meta/classes/goarch.bbclass | 27 +++------------------------
>  meta/lib/oe/go.py           | 32 ++++++++++++++++++++++++++++++++
>  3 files changed, 36 insertions(+), 25 deletions(-)
>  create mode 100644 meta/lib/oe/go.py

This did cause problems for some layers such as meta-virtualization so
I'd want to check those layers are ok with this?

Cheers,

Richard

