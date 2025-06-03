Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45C22C5AE59
	for <webhook@archiver.kernel.org>; Tue,  3 Jun 2025 10:48:38 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web11.8311.1748947715236451867
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Jun 2025 03:48:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ieZl4uwP;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-450cf0025c0so38553235e9.3
        for <openembedded-core@lists.openembedded.org>; Tue, 03 Jun 2025 03:48:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1748947713; x=1749552513; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l0kV3BtGNC2eDG7pHThtm+oEnVgojOcmpsQ+WxowCnk=;
        b=ieZl4uwPCa15clOAIOoBHHSKr6EVJUA5QdzQxGRvmtnxUj6iBl5WWfq0a3MHvLTq7O
         nI1Zyr6LXzJAdAkuisZlnYnRIrT7rjdMGdeNSdyx6KInmDfAEvqZ7DuXW4o0XmxDrk8v
         JPSve8J5jYRSmGvBvI7QlDYjYp042TvyDykrM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748947713; x=1749552513;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=l0kV3BtGNC2eDG7pHThtm+oEnVgojOcmpsQ+WxowCnk=;
        b=cjUFUihT/z5StfBGm0+lJpXACpD5tgorkqKUQ2+hVDS5SRUijFSRp+JK8jklbRoVbV
         OtFTOY10K/6eWI7CZLHAbpwW4AsoGjez+sQzQpic7F8TT9T44QF+kyh9e2i6WIH6L6pl
         iknXT0ZHYSwLV364KoZoMyolswkJ1/bCLoPSNNdgNrcK+XCjjyMQs/DQ+71Ph0pvCclM
         gvt+HQpAgMNGgUnNRURKr3roAlOadS3zb/dZZozz3ZSGtCEbWYFc3ORfadyNKcbURCUz
         IqvHPMfYId+zXFlaURAWTJMwFztQUl/Ogce2ZjMLr5KhLSgZW7S/j5bfOe/TD2+mVfdf
         xTfQ==
X-Forwarded-Encrypted: i=1; AJvYcCWU2q9c/3akupGX3xo40Y++FsjS7/eFJlbG47zXjwRvKEZ1y7a9NOQ8oUmhDQiBAY5rAg3b1YEu4J3t9qebLGwc4A==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yx9Ti9DVc8EW05tdqSBY72bOt4KnNjD5qCNGabjiyF70w8speE7
	QLlG4G4RTYnBtg/0HEHGSOANlwA0NXQQMMErGHrAyHEXQmKfZLgSQ8e+jNH8qRxEO8c=
X-Gm-Gg: ASbGncvvDR8BjWxKbqlWdKnlh6n341eC9FnyFapzb6SNocDT3VXOXHwg16iQgjZ3Kwk
	/3EntUFc+ff/U8dmzum9k6Zd6RzgGbnn9aDmOZpA+02GucJfw1Nc/7SNs3jTzYBfKKyy82xdsdA
	tQjUDxW+lOSzCDv3pPnRnoNUw4tlXuXs+Ae9uenxzKyRbyTQvcgvwlk5uOoUnNkI3TiOTyY23uX
	N6hnZOg86HSnBbq5k8txPezlf9Z6Z9p1YFGOSloC+ku5+qRLcj4T26KrpKSOoktIDMrX2KXPtNk
	NZqlyruZuRdjFhJeEzWWCdUAh7L5fcMIkza4rMIG/uo1D+WsfieEjeHZ8HclTyC4IzZvtbMsvWy
	FcblJ5XrAsAv/KlR7mHysNk6IBbxatHsFlMKDMlzbj0DhBcLfTQc=
X-Google-Smtp-Source: AGHT+IF8wXpJDYT4pvkbmKfgmGkZRi/WLoybJaP/u/50YRls1k4pyH4z+fNQFKjwei0KHUaFig7/dQ==
X-Received: by 2002:a05:600c:3f16:b0:440:6a1a:d89f with SMTP id 5b1f17b1804b1-4511ecb9dc2mr109749965e9.4.1748947713392;
        Tue, 03 Jun 2025 03:48:33 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:3864:8101:3606:8242? ([2001:8b0:aba:5f3c:3864:8101:3606:8242])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450d7f1b0a4sm157364275e9.0.2025.06.03.03.48.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 03:48:32 -0700 (PDT)
Message-ID: <dd27e615bd3ea965dee284352c90794d77854cf0.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v7 00/20] FIT image improvements
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: adrian.freihofer@siemens.com, openembedded-core@lists.openembedded.org
Date: Tue, 03 Jun 2025 11:48:31 +0100
In-Reply-To: <20250603082419.409564-1-adrian.freihofer@siemens.com>
References: <20250603082419.409564-1-adrian.freihofer@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Jun 2025 10:48:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217802

On Tue, 2025-06-03 at 10:23 +0200, Adrian Freihofer via
lists.openembedded.org wrote:
> From: Adrian Freihofer <adrian.freihofer@siemens.com>
>=20
> This patch series re-writes the FIT image related code. The goal is
> to
> fix [YOCTO #12912] which is a long standing issue.
>=20
> Changes in comparison to v6
> ---------------------------
>=20
> * Move the code for exporting the FIT image specific kernel artifacts
> in a new,
> =C2=A0 separate kernel-fit-extra-artifacts.bbclass rather than adding it
> to the
> =C2=A0 existing kernel-uimage.bbclass.
> * Improve the devicetree.bbclass to skip error messages of shell
> globs
> * Improve the error message in the kernel.bbclass to: "fitImage is no
> longer
> =C2=A0 supported as a KERNEL_IMAGETYPE(S). FIT images are built by the
> =C2=A0 linux-yocto-fitimage recipe."
>=20
> Revert a non essential refactoring in the kernel.bbclass

v7 seems to have some new failures:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/111/builds/497
https://autobuilder.yoctoproject.org/valkyrie/#/builders/3/builds/1810

both in musl.

Cheers,

Richard

