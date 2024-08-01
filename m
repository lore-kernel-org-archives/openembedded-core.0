Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C714C3DA64
	for <webhook@archiver.kernel.org>; Thu,  1 Aug 2024 13:44:57 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
 by mx.groups.io with SMTP id smtpd.web11.68545.1722519886724968340
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Aug 2024 06:44:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Kjr/JM7f;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.167.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-52f025bc147so9814299e87.3
        for <openembedded-core@lists.openembedded.org>; Thu, 01 Aug 2024 06:44:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1722519885; x=1723124685; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=2gldc+MRfjGJfFmn2YBQkSr59v72OFMzXkQKCrIKYK4=;
        b=Kjr/JM7fDsz1LixPXtVi1iQy2cezI8dPazUViekHW2BWYDqz1Qettc7+KADKtFftOx
         IjYW0LgMgJ4FWOMb6B86KiMdga7TbxfAb3lXCn8T+cyexjb0Djr6tJNgkMd28J0cuIvZ
         aqQHaGwrxsFfcbSE0D1K6n8uexcoh7MvIIIdw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722519885; x=1723124685;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2gldc+MRfjGJfFmn2YBQkSr59v72OFMzXkQKCrIKYK4=;
        b=nXdLCAQoWDB9hctgTRYo/pTEz2OQw2+dfyfEYq71Zah9bzboypQfJHygC5y2bPapmN
         sdc7ph8r1SzBEeWivJR0KFPQnJDE0BY62t3+AHmQSOwfVetCtDO7i5j737F4mXRkpPST
         /y5d3GP0OKYmCrDrTb16NikzwZq7sIS1FZBZzfvxcaR9P08wTfsHsjyivyL0+Bzhv+fS
         FoDNRt4TF1RTGiSSI7m8irRJ2VyA3pcvYAz4HaPpwIKTwWFGSOTnBZ0n1mHMFQHovtMF
         5EztzjBWgkQlg/Ls+VJdBXDu4NiZN1p7xsLNuDJUYrrYNemGlleTSkRt2Ey3lQaPkcnf
         56zQ==
X-Forwarded-Encrypted: i=1; AJvYcCVAYv5ZvN9Nwqvg5eaTdiRdbWmpfZkefLHEio+i9MnDwins4MBPx5dNpASpsDD3RmvMFQGbNU5bMoXjB8g8bPIyZQHy+117izFldlip02Y9LPNzKCQgHLJt
X-Gm-Message-State: AOJu0YwA4yChJX0D8WKosK5qf1x1yxXJw8sSJsJs7Jgky4PC78CnC1QR
	5i2AkN/QIVp8esjwXaOwO/kQqeVWec16Qw8Jle/fl7GVFkBMDAoorl/qWM8jvNY=
X-Google-Smtp-Source: AGHT+IG7z4rvoMSmsLSbM7jDQqnxjyF+/0cRrFmYMZPlskW+9aDUn4MMOg3Ar20u4YXdbO0PdP4M2A==
X-Received: by 2002:a05:6512:3408:b0:52c:c9ce:be8d with SMTP id 2adb3069b0e04-530b61f7823mr1833803e87.57.1722519884534;
        Thu, 01 Aug 2024 06:44:44 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:6f1c:86e8:7d42:8e2f? ([2001:8b0:aba:5f3c:6f1c:86e8:7d42:8e2f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36b367c0320sm19503908f8f.19.2024.08.01.06.44.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Aug 2024 06:44:44 -0700 (PDT)
Message-ID: <63e1661173a1ee8e65538cd330f614a91719b2bf.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH v3 1/5] cve-check: annotate CVEs during analysis
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: rybczynska@gmail.com, openembedded-core@lists.openembedded.org
Cc: Marta Rybczynska <marta.rybczynska@syslinbit.com>, Samantha Jalabert
	 <samantha.jalabert@syslinbit.com>
Date: Thu, 01 Aug 2024 14:44:43 +0100
In-Reply-To: <20240724152530.25856-1-marta.rybczynska@syslinbit.com>
References: <20240724152530.25856-1-marta.rybczynska@syslinbit.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.0-1build2 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Aug 2024 13:44:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202734

On Wed, 2024-07-24 at 17:25 +0200, Marta Rybczynska via lists.openembedded.=
org wrote:
> Add status information for each CVE under analysis.
>=20
> Previously the information passed between different function of the
> cve-check class included only tables of patched, unpatched, ignored
> vulnerabilities and the general status of the recipe.
>=20
> The VEX work requires more information, and we need to pass them
> between different functions, so that it can be enriched as the
> analysis progresses. Instead of multiple tables, use a single one
> with annotations for each CVE encountered. For example, a patched
> CVE will have:
>=20
> {"abbrev-status": "Patched", "status": "version-not-in-range"}
>=20
> abbrev-status contains the general status (Patched, Unpatched,
> Ignored and Unknown that will be added in the VEX code)
> status contains more detailed information that can come from
> CVE_STATUS and the analysis.
>=20
> Additional fields of the annotation include for example the name
> of the patch file fixing a given CVE.
>=20
> The side-effect of this change is that all entries from CVE_STATUS
> are available in the result file. That includes entries from
> the optional file cve-extra-exclusions.inc even if they might have
> no link with the recipe (apply to a different package). This will
> be fixed by moving all entries from that file to appropriate recipes.
>=20
> From now on, CVE_STATUS should be added directly in the recipe file
> or in include files added only to affected recipes.

Sorry about the delay in getting to this. Initially I thought things
were ok but now I understand what is happening here, I'm afraid I have
concerns.

A fundamental property of what we're offering that we can use a common
include file to inject CVE_STATUS entries for recipes. Whilst I can
understand some of the concerns about the existing .inc file, we are
never going to be in a position where all users agree on exactly what
we should do with all CVEs.

The alternative is requiring a bbappend per recipe every time some
distro/company wants to add an entry and this is clearly not a good
solution.

I'm afraid I'm therefore very much against mandating that CVE_STATUS
entries should be against individual recipes. We need to find a
different solution rather than requiring that. We can likely sort the
file in core but not in other people's layers.

Cheers,

Richard


