Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5ACDCCAC592
	for <webhook@archiver.kernel.org>; Fri, 19 Sep 2025 10:25:36 +0000 (UTC)
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
 by mx.groups.io with SMTP id smtpd.web10.13137.1758277529696606133
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Sep 2025 03:25:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OsQHh4VT;
 spf=pass (domain: gmail.com, ip: 209.85.219.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-795be3a3644so8569066d6.0
        for <openembedded-core@lists.openembedded.org>; Fri, 19 Sep 2025 03:25:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758277529; x=1758882329; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=FPHiAq7lXSpEKWFKlau5KYEhV7mdoHNZD8uzjcugIrc=;
        b=OsQHh4VTRbDVN4tcpfiQWwNtfpgKlAKPKjbyiCpliyyxGSsv5ACflxo/dYNxECpTQ1
         OMa0BLcY/AbnvgMjj1Pn8XymoKKKx4sfs0NgSRs54se2JN3UU5kt3egh/A2xjC3749hB
         T0ASKVTsmIu7wSudP5hnvj9YdyNcQGQxPWop9CacGFJZopnEy64FYRe7MzBe2wPdwYCZ
         VpG15hnoxqJtnssY7c5XNxbMyAhcBMfr0YgENPdFZmOYSQOnUeDHbNMWAjhYT8ubzxdS
         jDa4ljPlH41ewoFqZ8V+WylxLhN1jBynoTzSVptqt01vAQBx/pQPaFbM33zoYFRziIle
         O3BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758277529; x=1758882329;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FPHiAq7lXSpEKWFKlau5KYEhV7mdoHNZD8uzjcugIrc=;
        b=cmgMTnIdBTllksNxvvgFBhQz+VREt8zT9+AiK5Rz5dwT0pXABOqk2ymf3ZZsUs3p8P
         6DY/xOSz84lQXMScV6Ltuo0rBzUWw1i61Tu5hRE0tYdcP3FkhBcai97s2R6x8hlE5/49
         jDQBT8er/VJl5KDCcQUay9vQunFgnE1O2zqJAA3/7JM4gQAPC4IelUfhsHGq1tpWtmOv
         sUhyxkeVomkTk1SINATrwNihbi9EM5PEgZj7aUVDEMyqlxKFr1ayi8y6T5nDcJC2/ymA
         iOkIaKncnS6hZgNihMmF1hPmYpssotY2h4oFLtyYgQwk9T064xiTvGLGWyw5UrbICOCD
         j85g==
X-Gm-Message-State: AOJu0Yxkl3nxzrp+GRicCpKQnv8+ROveMIMGPfNYRdwOC1vxYEoAxpZ4
	AyOtDZ5Llle+E/NHjRxh4X3/Weq47CKIT3R68jbgZ+/e6ILjYBNIqge8WbBrvOtQ7TSQizoXIJL
	CNTWT5zkImaT5U+xh1AM3Gs1gV0JAzIYC+Q==
X-Gm-Gg: ASbGncs0koF4WJb8bW/aIxAr+sDWuHG2WaKU91gWhKiMtdTtXI2MipO/GE1dvI2s6dj
	vArLMM1p4gaYO5OU1z44ND68M4QhPzPlcDIjzy1iS43WUvIzzkjhNxyg97obAysLr4N4hZFxOmM
	e3p8nD0zcdriaBjE3afblus3vSEChRyjojGzVhsD26ajBmhWiIuHxHhK3jgWxe4E+JaAtBAU7di
	cXMHyZDu1fwQ7CCh1+I9/iABVtTTLJM/2eH+OBfXPSore+czX3QdQJSRVHIkqGbPkhgtAcoMfwv
	Azsh
X-Google-Smtp-Source: AGHT+IE1WS24lYuXPkuFISgAWtkcshFRDwgTN16UNTzU60gZZVnb23iMDkD+8D7FctU7Mn987niE6CprRWOKCkU6WKA=
X-Received: by 2002:a05:6214:21ce:b0:771:2e74:854b with SMTP id
 6a1803df08f44-7992179fca0mr27493786d6.66.1758277528611; Fri, 19 Sep 2025
 03:25:28 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1758264088.git.liezhi.yang@windriver.com> <d619772b36cee9470e7ea8bcb245e98cd8033556.1758264088.git.liezhi.yang@windriver.com>
In-Reply-To: <d619772b36cee9470e7ea8bcb245e98cd8033556.1758264088.git.liezhi.yang@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 19 Sep 2025 12:25:17 +0200
X-Gm-Features: AS18NWBTW9YcahpENDbML5nljG_jDrIJ6S8cezvxfQlRpBM2aAqU2j7z80fmJxg
Message-ID: <CANNYZj_=ovyCMXfrNAqcwJ17iraVRJJQnSVFugH3EVeKPs+6=A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/1] gawk: Append AGPL-3.0-or-later to LICENSE
 when pma is enabled
To: liezhi.yang@windriver.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Sep 2025 10:25:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223738

On Fri, 19 Sept 2025 at 08:48, Robert Yang via lists.openembedded.org
<liezhi.yang=windriver.com@lists.openembedded.org> wrote:
>  PACKAGECONFIG ??= "readline mpfr"
>  PACKAGECONFIG[readline] = "--with-readline,--without-readline,readline"
>  PACKAGECONFIG[mpfr] = "--with-mpfr,--without-mpfr, mpfr"
> +PACKAGECONFIG[pma] = ",--disable-pma"

This needs --enable-pma too, to avoid a floating feature enablement/disablement.

> +python() {
> +    packageconfig = (d.getVar('PACKAGECONFIG') or '').split()
> +    # The support/pma.c and support/pma.h's license is AGPL-3.0-or-later
> +    if 'pma' in packageconfig:
> +        bb.warn("Appending AGPL-3.0-or-later to LICENSE since pma is enabled")
> +        d.appendVar('LICENSE', ' & AGPL-3.0-or-later')
> +        d.appendVar('LIC_FILES_CHKSUM', ' file://support/pma.h;endline=21;md5=32bd750ee5aa5cbcf7978c1be6462b8a \
> +                    file://support/pma.c;endline=28;md5=a3f33ec236ab96537cdfd1dcda270c75')

This should be set unconditionally, as it is specifying source code
licenses that apply regardless of build time choices. Then you can set
licenses for a particular package(s) to include AGPL or not depending
on packageconfig, but I believe that too can be done without resorting
to anonymous python.

Alex

