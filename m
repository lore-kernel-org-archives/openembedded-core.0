Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB6D9C4451B
	for <webhook@archiver.kernel.org>; Sun, 19 Jul 2026 20:43:15 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3167.1784493786127343806
 for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Jul 2026 13:43:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=WL4Fxsv7;
 spf=pass (domain: smile.fr, ip: 209.85.128.51, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-49558ce01afso5418745e9.1
        for <openembedded-core@lists.openembedded.org>; Sun, 19 Jul 2026 13:43:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1784493784; x=1785098584; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y13qhQuG76B36uY9CFXPzyuctwoKLuFF2YmnJyZR30Q=;
        b=WL4Fxsv79LQavPUSN31hWh+/rtWELIQcQ6PG+0+brDY5eROTIsO6TuHAVsi1wtmY7o
         VItzejLyxR3A3kMw856v0YRyrLgEuIRU4rt+9v5EpyFQBByeI1Q3mdEt1Oc9oxnk9g+b
         OdqB3giPdlPtx70X2tI+j7eZHtd59Nig0WvLM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784493784; x=1785098584;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=y13qhQuG76B36uY9CFXPzyuctwoKLuFF2YmnJyZR30Q=;
        b=poqYd7TvxVK0nfbPsL6jmvOiARfjiRuMBZAlJnBU/GQYBdDHRDM3kdz1qEBTQ6g7uq
         ZTy6E6vbN4/n6PW9Mu9Gsgxn9H6BE2oCV/yfR3R0Wf/snI2czXbup2ihOfBqRxZ3ogtY
         60AbTNM/IAxi/RTKSSSC/U47r3ZHwJHbdn2K7kQWiiruPUlbPDRRplkL+Ky/rIjdmH++
         V+rheBbh2ncFi4BA2oC4xSElEL/LmXugbVkfoxTXara3BIN1cNuyXdmoBGFpOz5ZPkZ/
         9RGhDn8g7d4qX6nkqWc0NzdUu78KaXB+obFjBi/iJ9v05+LTUoAsr9HlKiwSUHwDup2F
         ai0w==
X-Forwarded-Encrypted: i=1; AHgh+Rq5kcWa8qdlkEj3PfKJK7Pc2YkZOipvhJwvlCePOlhQfEvYkr2pDHg3olVG4cxaCIMLH+e4bP3CtKMvXw1berMEIw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyQhdBeFJ10QUr9tBjSgWUU18sJq15LbNnQGDGdKvCMiXBGbGMb
	6wccBwcubdmgsAiy4pz9MwD9rsubwEB7QKxmSjdGa+BydISArQoGB5YNPmT41OEeZys=
X-Gm-Gg: AfdE7cm221YakfsljSATgL+3YkL3e3rMMtOtz51eOxTzHc8cEu/+809+5NKeMdQCTmh
	Qnsy2UBELuqs9IrbbpaghVVeVCTGCZIq1YZ1sl4H+1qvTLawxarExlget/BovpzecvrFKhVJOhB
	BemVJm+lWa1yqvQthbnFuSL4TN0CHYeSxKT8GbuDxuw4eoTq5M7D8oVKsWE352fssXqZDPY4w3P
	FuJaUJpxVQvLSlso406FWcsPW2l0jKBSRN8EHo103GN20ZZPq2ATcAas03LVaRWK2d5RN7/e5VN
	awhM0mLyRJkfCCO7I6FhqOS+hInzKiSgttA07xZzuruzHNXrPc03iP36LnR8Ss5CqcU7t4vag65
	9Sowl1LZ+J+d/eY/1vrFpUy4FNlI1asn11OAU0Cegy11of456gxCwM7OV6ShHC7nZGrwGAF7pLz
	ccS7Z2jdMPWeNgVH2X1H1u0gcZPln3E5JjtGmhqXE17j0bRcX8xgWx64QwRHTBtfq2AYw=
X-Received: by 2002:a05:600c:3b01:b0:495:4fd4:144b with SMTP id 5b1f17b1804b1-4954fd419e8mr83239745e9.21.1784493784317;
        Sun, 19 Jul 2026 13:43:04 -0700 (PDT)
Received: from localhost (2a01cb001331aa00e37f7eb174d0a6c8.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:e37f:7eb1:74d0:a6c8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4955dfa4a97sm37569565e9.4.2026.07.19.13.43.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 19 Jul 2026 13:43:03 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 19 Jul 2026 22:43:03 +0200
Message-Id: <DK2U92VVUXKE.2HBXKS4ZWACG@smile.fr>
Subject: Re: [OE-core] [scarthgap][PATCH] binutils: fix CVE-2025-69645
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <roland.kovacs@est.tech>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260716095854.65840-1-roland.kovacs@est.tech>
In-Reply-To: <20260716095854.65840-1-roland.kovacs@est.tech>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 19 Jul 2026 20:43:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241300

Hello,

On Thu Jul 16, 2026 at 11:58 AM CEST, Roland Kov=C3=A1cs via lists.openembe=
dded.org wrote:
> Binutils objdump contains a denial-of-service vulnerability when processi=
ng
> a crafted binary with malformed DWARF debug information. A logic error in
> the handling of DWARF compilation units can result in an invalid offset_s=
ize
> value being used inside byte_get_little_endian, leading to an abort (SIGA=
BRT).
> A local attacker can trigger the crash by supplying a malicious input fil=
e.
>
> Signed-off-by: Roland Kovacs <roland.kovacs@est.tech>
> ---
>  .../binutils/binutils-2.42.inc                |   1 +
>  .../binutils/binutils/CVE-2025-69645.patch    | 135 ++++++++++++++++++
>  2 files changed, 136 insertions(+)
>  create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2025-6964=
5.patch

More than a description of the vulnerability, what we need in the commit
message is a justification for the patch: i.e. why this is the patch we
should take to fix this CVE? In this case, this is trivial, this is the
patch referenced from the NVD page, so I've added it.

Also, the NVD entry looks wrong: only the 2.44 version is said impacted
but the patches to fix apply way more than that. Can you reach them and
fix the NVD data?

Thanks!
--=20
Yoann Congal
Smile ECS


