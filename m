Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 451061099B26
	for <webhook@archiver.kernel.org>; Fri, 20 Mar 2026 17:13:27 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18307.1774026805464188296
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Mar 2026 10:13:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=VClnu/Be;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-43b40fb7f95so2198603f8f.3
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Mar 2026 10:13:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1774026804; x=1774631604; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=YZcwaRqtZ+bVO6hBuwivV15DLUqwxHa6tqD+x8GiNxU=;
        b=VClnu/Beza6EFlmXi87f7r5Y8QXdr9NJLPErKyj+1WYlnqofO9FaXytyyZnYlfD0N3
         IescuRulnVSZsdUrI70ktdcSDTkv6jXCu+3fCkkONi4/LaiJgc2daeI9+cjE1j+arB0G
         PZOiQmknv8TqTXyUd6fHOXwCCG7+SkK53M4l4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774026804; x=1774631604;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YZcwaRqtZ+bVO6hBuwivV15DLUqwxHa6tqD+x8GiNxU=;
        b=otCwb24o+PNJT9/KAsrMbA7QDe0B7KMpVJ6Nm0NMaxsGxV3CLCttL/hhxUnBQF3gCj
         Dp2w8GSTzjchjypRaj2oZzVd/TrMgZ1yWRzK122GTtGEOrIxL+O0ELVi9/QJ22YyPylG
         iyIwKHv8A/ilQJfTGyvkKMvEXmiu433bUl+syUunZQL6HLcAznAQSBEHIhht1T0hMbIJ
         z9qVL00Pv6815Y8dZ8ABOoNfQJUY/k0haPtD894PCes3fnfxrV19+YgNYscY2dgsjNqu
         NPc3FQFh3MVR+5GS/xL/GmuDp8lvl5MfZFx3sT64Nr9NED9aASqzDMicdcjt2dim5OYS
         GQCg==
X-Forwarded-Encrypted: i=1; AJvYcCVVALH0Ua/ng21oYizxp2V5IK7Fz0+0KzBI1RPNTKP133k3SJ2eGZXXMxlcP8MuXFsc8ZFb0pd6KNTz5G93AKUe/Q==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyIV2GWJgEu/d0KchMSZZWfZjYs6JLX4VnEemzg3qYbta/GCHPT
	P+C3qD+Tpa8Hd6VpzQULK/rnInlsstiEcSskhsK6X5nHHXvGmLLd2sq0hPEtxRbmO+I=
X-Gm-Gg: ATEYQzwXomO2IAHqo/QJcL+dYnePA+tyDk/JLQ0NLsnN/oJzZSORDc/H5AldomKHqGQ
	iX+7x7P2De+xEAaxR5RenlOWGQ+91vtt0kWK1qdf0qPSmKf98g9pxc9dQhe7+C/oG9ZvLBYPmO+
	IBMzynNN5lpMLBmmH2V9dKkDz0HVfEaR/WP23lr5Ni2dctBCzEBDP+DTfFxas69cW2XkP8/NMHY
	6LbbTSSMySpjBN4d1LIFV+hdjVNBmQVU4uQQxTr7TZ9HZv8gz6ZfWHvpJ+5Gu35OFzfzzSsol+l
	HQLVujZqUmRZ339AYX/kQI78TTZFXp5cWMYEMJzXrnt/HDOPCuovAxyfPxpsjbhs6Sn6z876DR4
	RTaGOCEGZkMDNJXBmIIwPJGIfghU109+Ck992FRzogMsGgdPMA11DhIFf7Dbn9kpN9j8oqpfB/k
	kNrN7aHE61jZsxF3oUmTox7jB4hsuz6XOXRCHwE14k6YhZiKeysWgMfZCou4HfVCG6diEA2dP+Q
	BukHKqlqWiOkWASMABvrvmt3lY=
X-Received: by 2002:a05:6000:40ce:b0:439:ac6b:dd64 with SMTP id ffacd0b85a97d-43b64271cadmr6838342f8f.45.1774026803760;
        Fri, 20 Mar 2026 10:13:23 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:6135:7333:cb53:f29d? ([2001:8b0:aba:5f3c:6135:7333:cb53:f29d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b644bd923sm9073770f8f.12.2026.03.20.10.13.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 10:13:23 -0700 (PDT)
Message-ID: <23653a4bf70deb09aa66868ab18dac50b50d6960.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH v10 0/7] SPDX 3.0 SBOM enrichment and
 compliance improvements
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: stondo@gmail.com, openembedded-core@lists.openembedded.org
Cc: JPEWhacker@gmail.com, stefano.tondo.ext@siemens.com, 
	Peter.Marko@siemens.com, adrian.freihofer@siemens.com
Date: Fri, 20 Mar 2026 17:13:22 +0000
In-Reply-To: <20260320164951.128572-1-stondo@gmail.com>
References: <20260312153845.164369-1-stondo@gmail.com>
	 <20260320164951.128572-1-stondo@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Mar 2026 17:13:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233628

On Fri, 2026-03-20 at 17:49 +0100, stondo@gmail.com wrote:
> From: Stefano Tondo <stefano.tondo.ext@siemens.com>
>=20
> This series enhances SPDX 3.0 SBOM generation with enriched
> metadata, ecosystem-specific Package URLs, and compliance
> improvements.
>=20
> Changes since v9 (addressing Richard Purdie's review):
>=20
> =C2=A0 3/7: Use =3D+ instead of :prepend when extending
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 SPDX_PACKAGE_URLS from recipe classe=
s.
>=20
> Stefano Tondo (7):
> =C2=A0 spdx30: Add configurable file exclusion pattern support
> =C2=A0 spdx30: Add supplier support for image and SDK SBOMs
> =C2=A0 spdx30: Add ecosystem-specific PURL generation via bbclasses
> =C2=A0 spdx30: Enrich source downloads with version and PURL
> =C2=A0 oeqa/selftest: Add tests for source download enrichment
> =C2=A0 cve_check: Escape special characters in CPE 2.3 strings
> =C2=A0 spdx-common: Add documentation for undocumented SPDX variables

Thanks for this. I did notice that a couple of these have merged into
master. We also merged Joshua's patches which these ones depend upon in
order for the tests to pass. Could you rebase and resend and hopefully
we can finish getting these merged?

Thanks,

Richard

