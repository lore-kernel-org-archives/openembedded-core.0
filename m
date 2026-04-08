Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 187B810FC445
	for <webhook@archiver.kernel.org>; Wed,  8 Apr 2026 21:23:27 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.117505.1775683405983992761
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Apr 2026 14:23:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=FKpfpyq3;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-488b00ed86fso1760515e9.3
        for <openembedded-core@lists.openembedded.org>; Wed, 08 Apr 2026 14:23:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1775683404; x=1776288204; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=20mAM0/FVNuGK6Kt64jS3W+03yGpnyGQA9AVQ6T9S+o=;
        b=FKpfpyq3BN79BYdH4XIBMuShBW4s+zxo1dO6zU7oXYTqcbBEDMH6JKpYDR3OX+KD5a
         huTOmfcyVcPX9zJjD9ap/uQjqWuK02ZQ4WP9l14G5ydrFKBY/vCQrLKz9AGWGWFbEdVf
         mOTBHoBdSLSBDo5y8zR2UzJgcJ0IeiQuHO2no=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775683404; x=1776288204;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=20mAM0/FVNuGK6Kt64jS3W+03yGpnyGQA9AVQ6T9S+o=;
        b=hjeWaSE051nj/l9QVGardNySR34VyBSI/H4emGsZJSrYOmnB1X3/+A2K9s5GGJ3og2
         SXcMuftJgLohzIQgXznfJiVMrHfh5NLXhEIjhRixaEzYvijgdZguOq2M9UJHpCzYBWfE
         J6vgWsPDr+vbLSXV2BET8B1Y53FnKY/xfW7kQtum60idMNnlbIw1aqq/PPRrbxWRCh6r
         yJBFg+2EF1k9iv+q0P8jmU6sNZK6kFurPMTQm+dl/2yqGtLhrUzefPOFojYXy/Sbfayf
         LqwPgyYkEARPLeDz0rZnHwdthjezOs7/s9vUIcHClQAXdIdSfdxDSGYxncfsaC3J31r0
         YJBA==
X-Forwarded-Encrypted: i=1; AJvYcCXl0+7IyyerlTexa1rqDmc3l2wurwNrQQAeCRxgHf+G3DeiA85/lVqAc6xv8A/XQQ+4Ep5c+Vu+IxR99hY4dEm2SA==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yx4vHhO5UCOQRWTUvI7MhRYRP7beKzwIJ3UjlzXvYrB6YJg1jEG
	iOJ11Ti8T6JhtGmQM+Qi5yMfzO41x2ykw289F9Xtuqjk3tVtffVjVCQ2q/2LPi0D4I8=
X-Gm-Gg: AeBDietm3ZwoVV5UnwoS+dec1E7I4ey5A1vzNihZKLAdvi2Icc0oS8F9RXpMQ3TZLtB
	9Ogg7++jCdobzG6BCnmkLrASFhpNim2HWMAKH7z24kppJtdZ7XIJ0FS8WCTa4mOSjbYwFI0V2ky
	1lCkCO0jXsx01c7RNSGC1Yr1gjY/xmjFH1QcfCAwZp7dYN1P9L+y3K53edioDpQiME6AlYW6saz
	NmpuUPAy0QkSu9wmulR7i6aml1jwGntHpZE+ekhRwduNGUBxPfldZ42tda3suWrKpAg/ug561dK
	MEVe+AIbgS5eKPd9wtW0v1waM9o7ur8egs1wQx2k59bKNYcutazGQD9IARJ6stE8vbRjxEGwalF
	OmdY43bkkdQDCv7n7ogH1sNnX+rzWwzB5ttvznlbzTOWb5J9wZ5DiK+5VlT6TcPgYq8M79GhL6I
	3kVUng8QYe9vU6gL+FfNnxbRmFnp59a/gmCXCPYd8tE74s/bDI/vf+Jaocrp56Wm6EuohqhO8dh
	tmgCJyLT5+New==
X-Received: by 2002:a05:600c:c082:b0:488:c40b:c8b9 with SMTP id 5b1f17b1804b1-488ccf8cefcmr13525705e9.3.1775683404342;
        Wed, 08 Apr 2026 14:23:24 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:530:d4f8:22df:8c0d? ([2001:8b0:aba:5f3c:530:d4f8:22df:8c0d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488cd19b690sm6000855e9.33.2026.04.08.14.23.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2026 14:23:22 -0700 (PDT)
Message-ID: <f4bf51a0b26fcff35191bcedf8e51c09e27b856d.camel@linuxfoundation.org>
Subject: Re: [OE-core] [RFC] Adding PURL identifiers to SPDX 3.0.1 install
 package elements
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: martin.vonwillebrand@doubleopen.io, 
	openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Date: Wed, 08 Apr 2026 22:23:21 +0100
In-Reply-To: <e615740d-eff9-4125-a6e6-e6b58ee29225@doubleopen.io>
References: <e615740d-eff9-4125-a6e6-e6b58ee29225@doubleopen.io>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Apr 2026 21:23:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234859

On Wed, 2026-04-08 at 16:19 +0300, Martin von Willebrand via lists.openembe=
dded.org wrote:
> While working with ORT (OSS Review Toolkit) to analyse Yocto-generated=
=20
> SPDX 3.0.1 documents for ongoing vulnerability management and=20
> monitoring, I noticed that install package elements=20
> (`software_primaryPurpose: install`) carry only a wildcard CPE=20
> identifier, e.g.:
>=20
> cpe:2.3:*:*:busybox:1.36.1:*:*:*:*:*:*:*
>=20
> ORT recently released an SPDX analyzer (since ORT 83.0) targeting Yocto=
=20
> 5.0 generated SPDX 3.0.1 documents, which makes this gap more visible:=
=20
> the analyzer can consume the package graph, but the identifiers=20
> available are not sufficient to drive post-release CVE monitoring=20
> against external vulnerability databases such as NVD or VulnerableCode,=
=20
> since wildcard CPEs cannot be used directly as query keys.
>=20
> If I understand correctly, sbom-cve-check faces the same underlying=20
> limitation. In our understanding it would benefit from this change too,=
=20
> though the two approaches are complementary rather than overlapping.
>=20
> The upstream download URL for tarball-based packages is available at=20
> build time and is already derived from SRC_URI via `fetch_data_to_uri()`=
=20
> in `spdx30_tasks.py`. A PURL constructed from that URL and placed=20
> directly as an `externalIdentifier` on the install package element would=
=20
> give downstream consumers a durable, canonical identifier for=20
> post-release vulnerability monitoring.
>=20
> Before drafting a patch I wanted to ask:
>=20
> 1. Is there a specific reason PURL is not currently emitted on install=
=20
> package elements =E2=80=94 policy, technical constraint, or simply not ye=
t done?
> 2. Would a contribution adding PURL for example as an=20
> `externalIdentifier` on install packages (derived from SRC_URI fetch=20
> data) be welcome in OE-Core master?
>=20
> Happy to hear comments, and discuss scope and approach before writing cod=
e.

I'm not sure this is as simple as it first appears. We support the
notion of "premirrors" and "mirrors", which are searched before and
after the primary SRC_URI. We validate a checksum of the resulting
download to verify we did get what we expected but it doesn't always
come from that SRC_URI but can be cached. I guess we assume you use the
unmodified original SRC_URI?

What happens if there are two items in SRC_URI? If we patch the tarball
with other entries in SRC_URI, is the PURL still valid?

What happens in the cases where the recipe uses git to fetch the
sources instead of a tarball?

Can the external tooling not look at the url data already in the SPDX
output and work out the purls itself if it wants to?

I guess what I'm saying is we're trying to avoid too much "processing"
of the data we put into the SPDX so I'm cautious about duplicating
info. If the purl is always derived from the SRC_URI and we include
that, should we be adding the extra data?

I'm not trying to be negative, I'm just worried about where this might
lead and the corner cases that may be involved.

Coping Joshua who I suspect also may have thoughts on this.

Cheers,

Richard





