Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10B46CDB465
	for <webhook@archiver.kernel.org>; Thu, 19 Oct 2023 08:20:09 +0000 (UTC)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
 by mx.groups.io with SMTP id smtpd.web10.22928.1697703607756074877
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Oct 2023 01:20:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fYC6/w6b;
 spf=pass (domain: gmail.com, ip: 209.85.208.173, mailfrom: rybczynska@gmail.com)
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2c51682fddeso5464201fa.1
        for <openembedded-core@lists.openembedded.org>; Thu, 19 Oct 2023 01:20:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697703606; x=1698308406; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mcMUuZjM2g3rHMTrn6cnHzlYzDKJj7uiE0D4xNVgTUI=;
        b=fYC6/w6beEHgf8Ws8CqW/+LJn8RgaCcgZ411lhKCyE1bIBYdge5jXScZ/6ByMiDwmc
         +7IsvdMh4LjbN3AwslxbB+S59Mxga+7ySFGzepYr35Xoh6qdS5uXT2lPovU380dlrLvd
         mLvFK4/5+scThtgwR3rVSzUORh2WKX75i/0NBYsKsYoaaGipQ7HSkzzzI0AmWEZ4W1KK
         e8tqNgVWz1329jPH98+wd5kFQALx2WHnyDYg7nFkk6f40OwrOupTXB1rGHJTMXrD1S7k
         nQZbQeD6U2YDIsCXnpfh2JB8f8eaNH4Fwe3OW+/NWI6JYlfrP22TbpSnCSj2OXBPDu/+
         0Aqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697703606; x=1698308406;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mcMUuZjM2g3rHMTrn6cnHzlYzDKJj7uiE0D4xNVgTUI=;
        b=I0iPo3oK5YVaf4SNa66GGEamdNPyHhbjG78KoOX395N5VwXma3nDlUuP6uwZE1HSf7
         TN22DulPuTmzY9k2t8uXDZ9gSGdtFcScTKI/9eq3NWoOHWYzoXbZ+ewArLMus2a3rDxw
         esipEYEJW+Er6x+BKPRHCBy/PT4C80BkoDAkwqAcSJMRKCuh8JdNK+0sBngujuJUn3Sj
         /XtIlBUomsDuIUDYQN3kLD/wGQekrfx9eSUPadQuauej6gCGyLEzFfJZw8xIGriTJLoh
         CWlUMSltHKdh1GCROqXl3b9Qt65jxoWDcgEYiG3rLEXg0BQzpzlQbTLbf6WNUbi1ojpq
         TLyw==
X-Gm-Message-State: AOJu0YwMCUsRoJZHPGAtW9xSC3VujmRPXt1/GbDgJi5nV5IjPhuMRWgP
	osmfLK2hwTe49UR0sZ683OHREAYO5B7a9Av5wCU=
X-Google-Smtp-Source: AGHT+IHbopf1Tabk7wrSgNm8lFKCFRqZQv5pP+4avS8xMaPtJ6A8rhXVl3Fjyztb86GKUsgaVEpizcGamexueZ1V+dk=
X-Received: by 2002:a2e:a4c9:0:b0:2bf:fa16:3aa3 with SMTP id
 p9-20020a2ea4c9000000b002bffa163aa3mr317342ljm.25.1697703605628; Thu, 19 Oct
 2023 01:20:05 -0700 (PDT)
MIME-Version: 1.0
References: <20231016070106.2772303-1-mikko.rapeli@linaro.org>
In-Reply-To: <20231016070106.2772303-1-mikko.rapeli@linaro.org>
From: Marta Rybczynska <rybczynska@gmail.com>
Date: Thu, 19 Oct 2023 10:19:53 +0200
Message-ID: <CAApg2=SGxxCJ1yuXoMD6=ySRsL-Z2=rENw6xxn-dpQZ-Ta+4rA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] cve-check.bbclass: support embedded SW
 components with different version number
To: Mikko Rapeli <mikko.rapeli@linaro.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Oct 2023 08:20:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189434

On Mon, Oct 16, 2023 at 9:01=E2=80=AFAM Mikko Rapeli <mikko.rapeli@linaro.o=
rg> wrote:
>
> Many recipes embed other SW components. The name and version of the
> embedded SW component differs from the main recipe. To detect CVEs in the
> embedded SW component, it needs to be added to CVE_PRODUCT list using
> name of the SW product in CVE database or with "vendor:product" syntax.
> Then the version of the embedded SW component can be set using
> CVE_VERSION_product variable.
>
> For example in meta-arm, trusted-firmware-a embeds mbed_tls SW component.
> Thus trusted-firmware-a can add CVE_PRODUCT for it since CVE database
> uses product name "mbed_tls":
>
> CVE_PRODUCT +=3D "mbed_tls"
>
> and set the version of mbed_tls:
>
> CVE_VERSION_mbed_tls =3D "2.28.4"
>
> (Real patches for both are a bit more complex due to conditional build
> enabling mbed_tls support and due to mbed_tls version being set in an
> .inc file.)
>

I like the support for embedded software. In this approach, I'm wondering
how it would work for packages like curl that have multiple CPEs. Would we
need  to duplicate the list of CPEs?

There are layers/recipes where we have a very long list of embedded compone=
nts,
meta-zephyr is probably the best example.

Cheers,
Marta

