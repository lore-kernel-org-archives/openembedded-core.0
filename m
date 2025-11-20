Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B782FCF884D
	for <webhook@archiver.kernel.org>; Thu, 20 Nov 2025 12:17:25 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.32949.1763641040849091798
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Nov 2025 04:17:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=hnQTjKkt;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-477b5e0323bso10034255e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 20 Nov 2025 04:17:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1763641039; x=1764245839; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C+/wfJqEkCRUHXcmhqBTiZ/OGUcUKPByhUNiaRG+Pt4=;
        b=hnQTjKkt0e0/7pAmhmwq1+82x7LIvUDIYpgcFKMTrbmzr+shTwGysjerqhXkVbQcFU
         UAVAIrsfTPQo9JOal3fCVAdS2bMAKBkyUJcCaRNdX3LQpbAN6lmbnss90SX0WDu5YE1p
         dtVKKotH7/H2qVt7+E32YD8EJemP+Ps6vkdw4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763641039; x=1764245839;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=C+/wfJqEkCRUHXcmhqBTiZ/OGUcUKPByhUNiaRG+Pt4=;
        b=xLWeVALv8gqDitOugWGD59Flm7nQw7RZtWq1/BAFVJamNLHrWEG0NvFHHHGXOTIH/x
         Hcr68KDWsDAEgGCSuWLR9yFL6OkcxFvhQue3vtn9wrvOMNvz1usBCbvLHFUEEnTTrfhX
         uXEKyLsnYxQIszNLY6BqnTRADf/e8HbPxL2ZjI26Go4abv9fTCiSh0+R1G+BuwNvvLrV
         JBHH0MlS92kC4ixU0I7nrrhBZt8h0In948PLb6OP/gHsNYZ0N8HIW0p2D8l08JS2SdhR
         8Jz50aEhI96kXGPZcK9AfPZ+FD9n0jYOvZyhvasFPvPPnNE6PY2FUesdrGi6tWbffoKg
         X3IQ==
X-Forwarded-Encrypted: i=1; AJvYcCXuAmPz7T6CC1pDK1ara/tWKhYcloUeGxj8lsMJqIZjGgC1YcLUC1CeVUXlupl4AMFxWJv/kenx/Gq8Y9Jw+8gtXw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzO0JUzWSgnMXsL804qkckxH2yuPHawu8IVTkTbi3bqhs7Bio39
	VeDzAO0z9TpEXvBS+5goM/8RvBQsQzVF5jeo05FFXJ+dv/trGArGSboO+oPZ2jpM+qc=
X-Gm-Gg: ASbGncs7hLbVX5z8pxVCyokHY+PRLrun/0bRj0ipRjxMOd0taAhA+sJ+ikA37MWlybP
	EXS/c52T0Fj2cknwHIk7gjdD5pmY0E76ZCAR4LumjPNMwISLYYgFOvZOMFyzwdraKzcFr5NHRnz
	aWnPHXf5gE+4OKcd8T5+cdtu76LaCPFP9dyCh6c63955IsBUpMRmc79+kVKaiwFq0j8VQRTd5sM
	MkC1HogzMR8QRGI/exwfN8UdYF9E7fiTl0tPXXLtaCs38rC3HxOPqQPDEljw1Qi+YgvmmBIlgKo
	VkkgC8XULZapWz0Zs1J9x3yJts4b5Fyffjjk8gNmzKhBmQFyKFsKPBCsWMyar5qD8M6JA8esRos
	w5jxDmaJgrEMbCuOpQJjJzj4ezHObWosfwgE+58OTuHsR9m0iz6kKB0P+9Adiwr61RbNdKREml7
	97fINoeYbQkwDlcGlWbIrCJ3tDONL+PPOJQk+VrLXwE4Moa84vU1BuLZ86iEx1HMmvXLcfQnIKq
	pE=
X-Google-Smtp-Source: AGHT+IFgN8lUq0tQf2s3DUYhqZ0O9zLdM/MNNnIrU0KdDodnJeIw/i2g8FeCdLds0iGTjzYHa0gRsQ==
X-Received: by 2002:a05:600c:3515:b0:477:7a5c:6a8e with SMTP id 5b1f17b1804b1-477b9eb69e3mr21845335e9.9.1763641038987;
        Thu, 20 Nov 2025 04:17:18 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:8d15:c0ee:cc9b:c363? ([2001:8b0:aba:5f3c:8d15:c0ee:cc9b:c363])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477b0ffe377sm103698345e9.1.2025.11.20.04.17.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Nov 2025 04:17:18 -0800 (PST)
Message-ID: <d214308179d1520df0c4523b5d18d2613849e3bf.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] bitbake.conf: add new variable
 FIXED_SOURCE_DATE_EPOCH
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: changqing.li@windriver.com, openembedded-core@lists.openembedded.org
Date: Thu, 20 Nov 2025 12:17:17 +0000
In-Reply-To: <20251120114041.193806-1-changqing.li@windriver.com>
References: <20251120114041.193806-1-changqing.li@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Nov 2025 12:17:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226616

On Thu, 2025-11-20 at 19:40 +0800, Changqing Li via lists.openembedded.org =
wrote:
> From: Changqing Li <changqing.li@windriver.com>
>=20
> Here is SRC_URI of jquery:
> SRC_URI =3D "\
> =C2=A0=C2=A0=C2=A0 https://code.jquery.com/${BP}.js;name=3Djs;subdir=3D${=
BP}=C2=A0\
> =C2=A0=C2=A0=C2=A0 https://code.jquery.com/${BP}.min.js;name=3Dmin;subdir=
=3D${BP}=C2=A0\
> =C2=A0=C2=A0=C2=A0 https://code.jquery.com/${BP}.min.map;name=3Dmap;subdi=
r=3D${BP}=C2=A0\
> =C2=A0=C2=A0=C2=A0 "
> When ${BP}.js/${BP}.min.js/${BP}.min.map are downloaded in a git repo,
> and this git repo is cloned locally as a PREMIRRORS. In this case, mtime
> of these files will be current time when checking out. For this recipe,
> source_date_epoch will get by function
> get_source_date_epoch_from_youngest_file, mtime of
> ${BP}.js/${BP}.min.js/${BP}.min.map are not stable, so cause the
> generated package not reproducible.
>=20
> A new variable FIXED_SOURCE_DATE_EPOCH is added to support this case.
> By default, FIXED_SOURCE_DATE_EPOCH is 0,=C2=A0 and source_date_epoch wor=
ks
> as before. If user build in above case, FIXED_SOURCE_DATE_EPOCH set to 1
> in recipe jquery can ensure fixed source date epoch used by this recipe
> to support reproducible build.
>=20
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
> =C2=A0meta/conf/bitbake.conf=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 1 +
> =C2=A0meta/lib/oe/reproducible.py | 13 ++++++++-----
> =C2=A02 files changed, 9 insertions(+), 5 deletions(-)

We need to take a step back here and think about what is going on.

The current design is that mtimes of files are clamped at an upper
value which is determined by the the logic you're changing.

There is an assumption that the mtimes don't affect the build, the
build process will create files and therefore we will always have to
have some kind of ignore threshold as the creation times of built
components will vary.

As you've pointed out, git can under some circumstances mean that files
don't have the correct mtime ordering which causes components to
rebuild, particularly around flex/bison. We need to find those cases
and ensure the right mtime ordering as you've done in some patches.

What I don't think is reasonable is changing the git fetcher to try and
have stable mtimes, or adding new variables without a really strong
explanation of why the existing code can't work.

Cheers,

Richard


