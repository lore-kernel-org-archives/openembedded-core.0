Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 350F1C88E50
	for <webhook@archiver.kernel.org>; Fri, 11 Sep 2026 14:48:07 +0000 (UTC)
Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.41230.1789138083856135134
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Sep 2026 07:48:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Aw7WIKaI;
 spf=pass (domain: linuxfoundation.org, ip: 74.125.228.140, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c29703cb796so82151766b.2
        for <openembedded-core@lists.openembedded.org>; Fri, 11 Sep 2026 07:48:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1789138082; x=1789742882; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=5kKRsDzgsqlyja4PYYf+BCx/1uMCIWqA37EzEtfQG+8=;
        b=Aw7WIKaIOrsnWBdqwsMLmFpKtMTohMGbUKUewSpDvw4SDRrNtajlLt2FXIxEKp5Ffi
         Jm8/Cp8d5EcmfMrfkwLrPxEQlwKXowKe3Cgs0bz/ATmqv8XZDY6VnTgLM7NuwAAEBv9k
         ufrWDpNvVU5sOA2TsPGj8LJmQeBYaGOmkWobk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789138082; x=1789742882;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5kKRsDzgsqlyja4PYYf+BCx/1uMCIWqA37EzEtfQG+8=;
        b=tZ0RZRTqOpy8jFoT4EQK+wk2clLri/GB7tUgd8lWO+a1wDuGX9897Gh+4uIuMKtfbo
         3sOk9GifhP9afM/lXj/KczIGkzP8xoAEjnGmE+OrqhnoUYxJAj2Lx+qWCU+KW5k0hJ25
         hEG9gGEYuzZcGieIo0xDj+lj7tgnsb3HmDmishb0ZJoY4e661qLcHU4HfaslnWISDUeV
         DH5yS2GgYYDz1T13TdpgUK5Jovl950mcRyF4HkzMOf7+XczSitZPFV8pio8GxPZutPG1
         LNQL6P3vCUoF3Qf7dlRSEJf+nS3wURYfS1asUUGbn+PaHrfPCKIJ9BW+g1mnxn7K8ZPz
         PQmg==
X-Forwarded-Encrypted: i=1; AKwUvBw3NWzQ+MRbhecHawJa/0ueBRa+ERcJiMmzAPsGp3r6ypQ3XdKW/SxwJHZmOVY1LH4/UzeholivHirnSYdwTvFHbQ==@lists.openembedded.org
X-Gm-Message-State: AFuF++kmo4jSQVUyLgmMqGivqPxwn3OSBQsivRoLyyeY11i69SRG7T7s
	34VHYTp6HOndaw0HLk4kxPXhFzxPcpHZn9gshMGISzD4jDsKed+bjLI8QGOFK52WO1wFdSKz9I/
	hgJsGGbU=
X-Gm-Gg: AYBFou2fISi0PG5tGNILeIAP+ztLCNzYifd/piinKTgswFzjBefsL/wI0WRsvqZHhcJ
	zKjppsXHJnYxlXvF7KU3yagRCMyDIgDPvfRDS2vq0cSV/LhB6cWo8jAJuwtbXee5Zu1X5S7ONQy
	YjKDyBhzuZ1AT+KwofkzXlgv9LPK3Bm7ubfQUFa5NiYHyrTRKiqsqi90KCrSY1a+EVbCOTzNqqn
	2E5CIpR99zGKX4o/ufLaxNeuhNrBl24s1etvTIIgqtEoo8zDIDRRmLSGWIw1SBGIgQhMCTtuKkD
	XQbDaWSxcIRBySMHDCVUNcyAaqlcc8FRSEKV/DGT5KsyX+QGP1LIyVQc42rPGpbwSXtHAEXc69E
	BYEw3TasbY50E2rno2wGWMQv0YlPeK0y/BaF7/1k9umiKz3QHUX6ykW9kamz+OTiOF2ggDmSIXK
	Ox5oiMyHG7XOaXBSwq6qq/V/eJxOfN/dsAFKtOrT6NLWba32c1HvdK9fcN5DnxvPnYKJ/ixcEjo
	468skkGu7H78aGdyF/wszJH+iUK0Ec0KpTUCAF96sBok62moXY64v9OU8EWQLpY
X-Received: by 2002:a17:907:3cd4:b0:c26:1648:a062 with SMTP id a640c23a62f3a-c2966671768mr193550666b.29.1789137675724;
        Fri, 11 Sep 2026 07:41:15 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:c0d0:78c1:8753:128b? ([2001:8b0:aba:5f3c:c0d0:78c1:8753:128b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2966147b46sm85008766b.60.2026.09.11.07.41.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 07:41:14 -0700 (PDT)
Message-ID: <57b22a197440f052d86c5199f694d008e811db2c.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] clang/llvm: Upgrade to 23.1.1 release
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: SunilKumar.Dora@windriver.com, openembedded-core@lists.openembedded.org
Cc: raj.khem@gmail.com, sundeep.kokkonda@windriver.com
Date: Fri, 11 Sep 2026 15:41:14 +0100
In-Reply-To: <20260911115237.1538030-1-sunilkumar.dora@windriver.com>
References: <20260911115237.1538030-1-sunilkumar.dora@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Sep 2026 14:48:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245657

On Fri, 2026-09-11 at 17:22 +0530, Dora, Sunil Kumar via lists.openembedded=
.org wrote:
> From: Sunil Dora <sunilkumar.dora@windriver.com>
>=20
> https://discourse.llvm.org/t/llvm-23-1-1-released/91760
>=20
> Drop 0035-libc-Disable-float16-on-32-bit-x86-without-SSE2.patch and
> mark the musl ssp_nonshared driver patch as a backport: both fixes
> are included in this release.

Sorry, I don't quite follow. Why are we marking it as a backport if it
is included in the release?

Cheers,

Richard

