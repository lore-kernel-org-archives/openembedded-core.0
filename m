Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D293CFB424
	for <webhook@archiver.kernel.org>; Tue,  8 Oct 2024 09:17:50 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
 by mx.groups.io with SMTP id smtpd.web11.4837.1728379060100070451
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Oct 2024 02:17:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WIvq/P12;
 spf=pass (domain: gmail.com, ip: 209.85.167.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-53994aadb66so4833067e87.2
        for <openembedded-core@lists.openembedded.org>; Tue, 08 Oct 2024 02:17:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728379058; x=1728983858; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=lE2sAitnoMs3HYbuanSfGbFlwnHbKwVhwZ8JAn25/xs=;
        b=WIvq/P12eVV3Xq/bXjdbrhdHKL3dUNQgMsX4nhJHjdEo6vLPJ3MS01VBaHbV+Z2MVC
         Pc2egahbRt25w3uYD1mk78z9Zscw8d27SCH/GkwwVEWVUdu+diYGlZqmlQg+h5a05qvb
         +bRp78f0CdfpUYaucGOarUPJE76Yo6DLr2NNSyASK1jKI3VBTjaF1RFeqlDjhRjqSXWH
         FdnLAMyJtJDRkqyg88WBo6CZ+W37T9DuUxNISDhUt8TKkpwrDav+6RVyReDFmGQREnE/
         i82r1POHBvds4uBzWt+SjM30BaXqKOMhRwRo1q/E5sGPBp+6ipCCk7Z2QRuVu+1q37zJ
         VWrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728379058; x=1728983858;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lE2sAitnoMs3HYbuanSfGbFlwnHbKwVhwZ8JAn25/xs=;
        b=UAx3rItfcIkO5S7zD47gNJmmRsJn6ETYcMNgGUL1WntNcjv+bVOzKJhIWUu5AA6TPf
         PXhfAHQe4ieqgf2zMkdlV6fxdmv/CLE9TXBaDbhmo5g71zhHNw8HXCk7WBOKbBMy0y+3
         Wntmq0KNlyCC68U/FKWVhykTWIwBSEGqVrrmoHGYR5AJKdGf5/9SQNMz0pTeHtZ/MXhF
         C/Gulah26zwnPZpcFicJzDFOI02uhH2RfRgcSYaWECrKNUYSDVny84ldC+vZUI9NSFrW
         td+3qIRBlxH7JV1EkipSRaXKZHApc2K6ObHP7QNH2biyJRBQpWvuMmrQfJNd0kP+PKDE
         gFEQ==
X-Forwarded-Encrypted: i=1; AJvYcCXhDcxDzU6JbWHRLoX1qEdpslEqoxNQjhPxgK2btKU/uF7+NH4sTJHBO0yb3ksQtGER/DMyB+PnOAOzv9NxdzAgXw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzOPfceiVbPEe9So1Y6ncYeKCnblvRmIh2UJrdZHrXcEGXsoObf
	tN93q/VPBGP0dd89Jr1OMLgR1KOQe3tUVg8ZpMmT1j8U+CT2izBs/T5oqzTiKVwqoDV2uW5fHD/
	Hs1JTWwvKmWMtlnYOhuWwy1OZm+U=
X-Google-Smtp-Source: AGHT+IFyIrtNRIt4pKbu+e27oDS0mgWilU0YGS7ortHHlNU4EUKXTvMg0+BdRm9ZEb/upJTTzuifjrTfkTfr5+Uz6+8=
X-Received: by 2002:a05:6512:3085:b0:539:8a9a:4e56 with SMTP id
 2adb3069b0e04-539ab8c6fb8mr7763789e87.53.1728379057727; Tue, 08 Oct 2024
 02:17:37 -0700 (PDT)
MIME-Version: 1.0
References: <20240927132040.200122-1-claus.stovgaard@gmail.com>
 <c3155a29aa855283f3396582c989263d93ded4f3.camel@linuxfoundation.org> <2456863182484d2b15f75fe0f67a3473240a3fe6.camel@gmail.com>
In-Reply-To: <2456863182484d2b15f75fe0f67a3473240a3fe6.camel@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 8 Oct 2024 11:17:26 +0200
Message-ID: <CANNYZj-Wna0xVjvoX0hJwd9Kg_=yaVB+dNLecBDsjpSayo1zVg@mail.gmail.com>
Subject: Re: [OE-core] [RFC][master][PATCH] populate_sdk_base: Add SDKIMAGE_INSTALL_COMPLEMENTARY_HARD_DEPENDS_ONLY
To: claus.stovgaard@gmail.com
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org, Ross.Burton@arm.com
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Oct 2024 09:17:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205284

On Mon, 7 Oct 2024 at 23:08, Claus Stovgaard via
lists.openembedded.org
<claus.stovgaard=gmail.com@lists.openembedded.org> wrote:
> A prime example for where we need the installation of packages in
> RRECOMMENDS, and not ignore it is for generating a SDK with all
> dependencies for an application.
>
> E.g. if we have a dummy recipe with packages in DEPENDS, the packages
> listed in DEPENDS will end in RRECOMMENDS. See process_depchains in
> package.py for the pkg_adddeprrecs method, and not be installed in the
> SDK. Using the variable introduced with this patch, will install
> packages from RRECOMMENDS in the SDK, and we have a classic SDK with
> all the packages from DEPENDS and ready to be used for the application.

But DEPENDS isn't meant to generate SDK dependencies. It's purpose is
to pull things into sysroots in a plain yocto build.

You need RDEPENDS for that if I'm not mistaken.

Alex

