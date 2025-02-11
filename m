Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6D02C0219B
	for <webhook@archiver.kernel.org>; Tue, 11 Feb 2025 22:27:41 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web10.1338.1739312858536163611
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Feb 2025 14:27:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=fdUaanka;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-439307d83f0so23829955e9.3
        for <openembedded-core@lists.openembedded.org>; Tue, 11 Feb 2025 14:27:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1739312857; x=1739917657; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=JKYz4k0vJ6K6AA2c/D+xTkdxEjZUGhci5TjrJVJKoh4=;
        b=fdUaanka7Do2nv2kIOcxBattxDl1qVtlQWyqdg1AtOh7a/woGqcVBO9WblbBMX3UQR
         3e2Q6ke50TP9MuDJm2W0dlRPCNo5o/7wayoowRnJbgOHel6u9PuS5AbqOckP8I/hqQxi
         EbXnyi3jw6yDIlfTqblXWC2ZoovbSbMBcnPGY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739312857; x=1739917657;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JKYz4k0vJ6K6AA2c/D+xTkdxEjZUGhci5TjrJVJKoh4=;
        b=PRVIlqDoEs51SSRAEFGv7rVpEuJSCdxPkGFV+/Dm/3Wa/tUVA8Z5+4TRDbCbW+nK4W
         LjZOyt/U/WvKfF0tpYZGqcJm643JvLIvOwTlynD3BGEcQq4Ru1oH47npiAmA0NEB5ADR
         uQVmGWImiM1e8RH6zXNkm1zQNwCGQ+uy+1gnNCI3wqLYrzi7TYmns5E8swX+wwhYcv1N
         2NMDC3OGxtheqgDTJcsygKeMt3cHH0X3rvjE3vuarYC5rGR1h/TlkIoqfAwnF49B7hKt
         njf8xGm+syyygiDLCpAnN3m0bfYFYccbDdjcz+1vscyR38Iu/6hsqX8UkmPdZI2gHBPd
         jSig==
X-Forwarded-Encrypted: i=1; AJvYcCVYpXSxLmoHPlv4DKFO1PU9+eSA+9gaMuo6KYHpbA/GEIDUqxLqKtC4y8uLwrLL63aalZS6g6+iAM7rc/N/WccxjA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxLRi2Zuqsb3YB5LLVen5cgvuZFpsNoIo6TWnYjtx4pHqLDFpZ5
	9SVn5hqbmQWyKYfac/frLeLZHFGFgOYjGuI4aBqWMDOtvhAyfddGaJzSNYp6/aw=
X-Gm-Gg: ASbGncvToF+v/PNyUsiLfACpiCCVXESpzu2AL+EszGyMviFjDjrHgJUrdPFh/BdpnOe
	1JsUnmrZn1LVMVOKaRoa4KZYRuf+tZIz8Y/V4wp7hvaLND8yLayHkF4aFU/TzoMOuivQim+l++8
	YB42B8K5k6KHot+Os3anZSCozuoDuxt2YlJ+58RuSLheI4Gp0pY/4acDPNP5PiOIffyQ6BVQ/n8
	BP/QY813ZyzpRsYNqz95rwBSoohkRJqtF1AKE49KZ25scTJ1CThPXuz3cYCaLXZWZfbJCzzPVuY
	4saQH3bJZ53qfy+iRjYfGwo6TgVACb9lFN4ayk3k95oj6SfyRawHMWQHAzSK9opXpqnsVnjFtHp
	UIiMe
X-Google-Smtp-Source: AGHT+IHDmgEV3bv3ckIKBu3DXZPJE9TNvZmdtCJvVMr6r7M5cjInWLIuVSOt+VJeWOWDqFLWrPZc1g==
X-Received: by 2002:a05:600c:444d:b0:434:feb1:adcf with SMTP id 5b1f17b1804b1-439581bf6cdmr6498945e9.25.1739312856688;
        Tue, 11 Feb 2025 14:27:36 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:679f:b1ce:de17:3648? ([2001:8b0:aba:5f3c:679f:b1ce:de17:3648])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4395a1b8397sm898615e9.36.2025.02.11.14.27.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 14:27:36 -0800 (PST)
Message-ID: <a1aed8bd862e921605dfa2762918b18fcba73ced.camel@linuxfoundation.org>
Subject: Re: [OE-core] [RFC PATCH 15/30] classes: add early fetch, unpack
 and patch support
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: stefan.herbrechtsmeier-oss@weidmueller.com, 
	openembedded-core@lists.openembedded.org
Cc: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
Date: Tue, 11 Feb 2025 22:27:34 +0000
In-Reply-To: <20250211150034.18696-16-stefan.herbrechtsmeier-oss@weidmueller.com>
References: 
	<20250211150034.18696-1-stefan.herbrechtsmeier-oss@weidmueller.com>
	 <20250211150034.18696-16-stefan.herbrechtsmeier-oss@weidmueller.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Feb 2025 22:27:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211195

On Tue, 2025-02-11 at 16:00 +0100, Stefan Herbrechtsmeier via lists.openemb=
edded.org wrote:
> From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
>=20
> Add support for early fetch, unpack and patches task which run before
> normal patch task. This feature is useful to fetch additional
> dependencies based on a patched source before the normal unpack and
> patch tasks. The patch are marked as early via an early=3D1 parameter. An
> example use case is a patch for a package manager lock file (Cargo.lock,
> go.sum, package-lock.json).
>=20
> Signed-off-by: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller=
.com>
> ---
>=20
> =C2=A0meta/classes-global/patch.bbclass | 17 +++++----
> =C2=A0meta/classes-recipe/early.bbclass | 61 ++++++++++++++++++++++++++++=
+++
> =C2=A0meta/lib/oe/patch.py=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 10 +++--
> =C2=A03 files changed, 77 insertions(+), 11 deletions(-)
> =C2=A0create mode 100644 meta/classes-recipe/early.bbclass

This level of complexity is going to cause massive headaches in future.
Having two fetch, two unpack and two patch tasks will ultimately just
cause a lot of confusion and make things like the SPDX code and
archiver code more complex too.

Rather than patching a cargo lock file, I'd probably prefer the correct
version be added in a later SRC_URI entry and used to overwrite the
earlier one at unpack time.

I appreciate the challenge there is then that fetcher isn't going to
know what it is fetching at fetch time though as it would potentially
be fetching with the unpatched lock file.

This is partly why we end up with the .inc files the way we do, then it
is explicit.  I'm not sure the fetcher can know deterministically what
it is fetching in advance without the .inc data though, which is one of
the concerns that have been expressed previously.

Cheers,

Richard



