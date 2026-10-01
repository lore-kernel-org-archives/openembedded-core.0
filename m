Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B95BFCA5FD2
	for <webhook@archiver.kernel.org>; Thu,  1 Oct 2026 12:51:19 +0000 (UTC)
Received: from mail-ej2-f43.google.com (mail-ej2-f43.google.com [74.125.228.171])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10392.1790859074620412428
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Oct 2026 05:51:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=aNr8vZNZ;
 spf=pass (domain: linuxfoundation.org, ip: 74.125.228.171, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-ej2-f43.google.com with SMTP id a640c23a62f3a-c2e23be09baso229126766b.1
        for <openembedded-core@lists.openembedded.org>; Thu, 01 Oct 2026 05:51:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1790859073; x=1791463873; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:to:from:subject:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=mzm15RxQdM0KTJWvtf5LMM25a42717SIZAk8O2J5qDg=;
        b=aNr8vZNZnuSiHVwF2mR1/XiK2bxtbX7X1x7/NwuSTDcm1cpHiQKUdmZYy2uOMgrO4g
         Tox5CExJnwSHkRGscOzNbc8TOvFTSC0Kbmg33KSpzEnZgq2H/p51twRLG2K3NpM+zpF6
         rQddIfPHe3K2sps3ZeZIwq/yCDdNr6+5UfKy0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790859073; x=1791463873;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mzm15RxQdM0KTJWvtf5LMM25a42717SIZAk8O2J5qDg=;
        b=yeMFM2XvF2X+MzbWqXgjARCLvffOkxeleY0QmXbSSWkdxrYCnqkeXo10/nBXDGRpyt
         v1chDD+jBhjusvJ7Ao/8w61ah6sv2I/+Pk0bw6B1tK79msxaiVXZ/3g6uiQ9ikcE0lhO
         qQ8+vIVuI1sy+k9ScC9L4HRhrXuFguNrox/jZlviNkksNY6GaH1NR9WWiWbfe4Hh77iq
         WnQwYgTDQVHBYlY2XVukFqXRPeewatdRnFqGBAYFoKeWcUhnXjDmWnvbGgWjTmwrI33x
         Wb83QJt1MTgToAO1Z4QtXsDX8IBs+tP59g0JNr0Z6F756KN7myR31rM4hbaHUguy44bM
         DoUw==
X-Forwarded-Encrypted: i=1; AKwUvBzVd7PxKop/sxi0FCdP+FYvHHLjh6jg0YKukfdvMEAoezeAy41OktOI3aXEIlfjSFr/yqZwzYcU1R8NMyPiRSHrMw==@lists.openembedded.org
X-Gm-Message-State: AFuF++n0sjB9wZP58GDJ1wiemJKvUe1KdJVD9kN8V0GgrjJU2PdkY/kj
	OoR0vzSHqu/3VN1jRDOTNcG/nUw84hWPriEFMeXSxOcvapDJ8AQUluMY69cMtaj5m7U=
X-Gm-Gg: AYBFou0pG6an2PzmQqNetr2hPLztbHixETuAsaihwbUvGDuqsseUB30fjc6uk6M5Loy
	govSGf71OjYk4qPxO66LrpLClfR+VmWQZ8P6Jdp9cyTgia6V08B5AUQroLfoeh218CEZUY7WYGY
	0cs5EgnxhEWXbjwnoUSydN4SksDcXin4Y0OO3zuj30mTSj95ejrhHosuV7VBnNrCF8ySM98vRNI
	MFGlKXTL67ikGOa/lkJF0wI/awY4wjDe06gvOZK2WP+k8+tdPng5qCqKx0gi38wGzjbNORazzYu
	aZLtgSEcww8/pP60bvX8HcrFREWDFGJv4xuQGnbxJzQ0wSk77TvjxYjYix85BDKi3t9khmLRbZ4
	dIKFojHvSz7+vCwfsmbYFRQsF8ECkcq4E1k0rNmaClWvQULlM/X/aPFeW45a8mq0hQdPJPCvvhH
	66U8+qNDZlwB/h5eaosnadT5ubykKP8ei1XSIvT6uwKY+1FmwaoieFffHF+ppUcfc01vFcE57Gc
	tjGd1+mvoc596kDf+y7JfLZXupZo1sP7La+zOykvdfGS62ERjEFhAQYgorgjAFkpzBQrqkXpA==
X-Received: by 2002:a17:907:7249:b0:c2d:d289:e9ed with SMTP id a640c23a62f3a-c2e23de31femr424512566b.44.1790859072645;
        Thu, 01 Oct 2026 05:51:12 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:97e5:70fa:8dd4:c479? ([2001:8b0:aba:5f3c:97e5:70fa:8dd4:c479])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2e31de168csm149014966b.72.2026.10.01.05.51.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 05:51:11 -0700 (PDT)
Message-ID: <2eadde72ab7e004277476db8e7867483795ac4cd.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] kea: Upgrade 3.2.0 -> 3.2.1
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: jaipaul.cheernam@est.tech, openembedded-core@lists.openembedded.org
Date: Thu, 01 Oct 2026 13:51:11 +0100
In-Reply-To: <20261001100444.9447-1-jaipaul.cheernam@est.tech>
References: <20261001100444.9447-1-jaipaul.cheernam@est.tech>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Oct 2026 12:51:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247031

Hi Jaipaul,

On Thu, 2026-10-01 at 12:04 +0200, Jaipaul Cheernam via lists.openembedded.=
org wrote:
> ReleaseNotes: https://gitlab.isc.org/isc-projects/kea/-/wikis/Release-Not=
es/release-notes-3.2.1
>=20
> The following summarizes the changes since the previous release:

One thing I've noticed is your emails keep having a locale encoding of
"y" instead of utf-8. I suspect this is a prompt when you run git send-
email and you're answering "y" instead of hitting enter to accept "utf-
8".

Could you try and fix that please! :)

Cheers,

Richard

