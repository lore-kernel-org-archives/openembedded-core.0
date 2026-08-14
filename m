Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58AEBC5B572
	for <webhook@archiver.kernel.org>; Fri, 14 Aug 2026 11:14:26 +0000 (UTC)
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10612.1786706060124384264
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Aug 2026 04:14:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=WrgTGphB;
 spf=pass (domain: gmail.com, ip: 209.85.219.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-8f29ec73064so4507746d6.1
        for <openembedded-core@lists.openembedded.org>; Fri, 14 Aug 2026 04:14:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786706059; cv=none;
        d=google.com; s=arc-20260327;
        b=QXl5dH8/acwrAXMgDlVXmVYZpYpzPw7AV49dMnW8uf0L5iqscttC9ecCjfsbhIznzn
         qcB4gWtml+prPPYE4ilL3pAItl24uLgOjlMRHovT7QThV9LWW/Z0arzp4dxMLRfbHGIz
         4MW+vdwhzPkyVWGPzCwJylUYNEGn/iwmthYoZKLl47+YP9nIeTvwHaf0XO1yttm6uJJq
         D+btbLc8jytlSrBzvQ7oeA4+gVr23PvYasL9yA6fe9MA1voSxh0JwrbSIEVSIEBIlkQe
         lapLAVyABn8KZHE1Gz7ObYJ4EbO0jVsFRnhGwFWp/7TFDfjs6tW7oktRA2mSaB3+s8Ag
         opww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=zstoTNKKuHAEDUiYierp69aHTiCea04yRpYC02hhowg=;
        fh=6Z4xUuTqkcxNv6cvnn0HdSGcZYvnhz2BRm++iEwx924=;
        b=Tqpg30x2jriUQT/cz4AhUy9zu+J7s6hKTWzp7SWlez0aDD5ITws2gkJPPQe0FlCRG5
         LAeSWm/R6+3E1h30iXwphTjB4nXE5PoKXUQcQ5EWlmHOZva6KoJpPwogY3mMhA/74en5
         +rdoiN6+muKyFsUcI5wTQ4RV9ohkBvWzpHytwd164ni6V/9pXC8QBIqnO1eH2vC4fbEW
         rUqmeVrbDhZRGmFlK3/7d6iSbxQ/C4PCFwmXJ4FIL50GjloW5JNmmraAMwhh6fUwVlOl
         bb1NnKUpJAYcCozgv8FuiEGbg0MhdzBvT0yL/+xDQ37MCY8JbNb3JdotyX9O5Fzq0k6U
         pQcA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786706059; x=1787310859; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zstoTNKKuHAEDUiYierp69aHTiCea04yRpYC02hhowg=;
        b=WrgTGphBF4Mp86pg7qtTYSg0wgQJxnleHpr/NUC64auLQzWyoJ03sIg6rg0DPGkrup
         dgtGYepT871QQJQOIwSixdEXx1BEwErPMDNFh7BpXmW0/Ko+V+effLMaI5Sv3dA/2pZn
         gA2jz2FsQCQ5gjaw/FaAyB3hOnzAHRs2Zusgg0ATviIglO4jTyK920afJrCn2XQLUXZm
         VSnrPa9j31m2qNj2TmwVwZ0xMig5g3P23AoDYvrXdQu+AHcoF0ybAas7Hv0yAUPu8bpJ
         QsJyexD7G5zosWz9nSkJ5MFfEXTSXhAM2k9q8foYOCftMNpOX3/OUJmeCEOXKdubECaj
         2H2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786706059; x=1787310859;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=zstoTNKKuHAEDUiYierp69aHTiCea04yRpYC02hhowg=;
        b=p+lVjecD3w2KfVLABcurpTypgBEiKD102APzayqI2hx8ZXZZkUgchZhuT0fzc4grWN
         dm4s3FzswAFziTFzHwM6aNV8Day6Zh4UgYPVZq9wxdA0Y3UTIx636nJ8164iqJBtGC1+
         VytJ2xWSvaakgf6rZam8ms5FpLwWgt1yNR0ldiUklcLWiXxmHCzHg74Nj7jrnmwmP7o8
         bEmElSWM3SqwLFmPxokN1MW6351uNipLNPZWYZrjFxJ0LYsYHxDSSWvckxpLABVY4Xgu
         BgT9O+l4IagWZILZ9MwzXUcW9DeKFFWSBOLGT0obqqipBgAeeQ6OvLg+g+JACG0JNH4i
         sIUw==
X-Gm-Message-State: AOJu0YwlLPzB+HMgvWoypyQsf5uIB7UnNrc0nTL/IfiH33VeYwSBWxdp
	Mm1ud+X4AJQJ6DmYCQfgySYEc2O2cCQbI0mpaos6Ffh5ALGZrVY0T+yDhr4PvDHPMC7BIjAromz
	1vOj651/M0SO+n8pXzdJUjmePPz2bw8c=
X-Gm-Gg: AR+sD10Gr8ifpoAJwVHjQR652OiA3I2ZUf3QNBUKUTxKQEOnMxL1Zrqo+1mmO1Xgbuz
	xO+1ujCR1SHUwKZcCW1xcRN7XYGSS/IBOL91MXWwbbjo4D2NgV/a2mwyfup3pqqCU3YyAYbM3yR
	37FD2IDSDkHQM2Ftx/dkc8JlfTHxsWX8FJBBMRWGdxOB1mMZJCe+a6XWVrcgIbC94O5E18VpEOT
	sm4GIhcUtXnp2XiWutOrE7GSxUECXZV0WZnRwVvf2//0nglVzP59HIacGAs9Xgwx97hy/BKbIAy
	FGPpshZruRo6gOg1PEfbTR7zpbALGBORAQENSkMTJOHZAlun2Cek6HCxLltpxl92u8C70ZAF6W/
	ceHA=
X-Received: by 2002:ad4:594d:0:b0:8f0:3b2c:a9c8 with SMTP id
 6a1803df08f44-90a91d401a0mr50697166d6.12.1786706059019; Fri, 14 Aug 2026
 04:14:19 -0700 (PDT)
MIME-Version: 1.0
References: <20260814051829.35088-1-jaipaul.cheernam@est.tech> <20260814051829.35088-8-jaipaul.cheernam@est.tech>
In-Reply-To: <20260814051829.35088-8-jaipaul.cheernam@est.tech>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 14 Aug 2026 13:14:06 +0200
X-Gm-Features: AUfX_mzSO5sc-E4WNHOgK3DUQItFiUF1aWzyE2iJpIc8c5xAHJIf_mk3Klu4byI
Message-ID: <CANNYZj8NXz-_evdSb1M52BQ-vO4BDX9gPMjKvK4dvOzZDkruaw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 7/7] kea: fix build with OpenSSL 4.0
To: jaipaul.cheernam@est.tech
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Aug 2026 11:14:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243444

On Fri, 14 Aug 2026 at 07:18, Jaipaul Cheernam via
lists.openembedded.org
<jaipaul.cheernam=est.tech@lists.openembedded.org> wrote:
> +Upstream-Status: Backport [https://gitlab.isc.org/isc-projects/kea/-/issues/4673]

Same: ticket with a patch is not a backport.

Alex

