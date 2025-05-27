Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6EF9C54F30
	for <webhook@archiver.kernel.org>; Tue, 27 May 2025 16:26:23 +0000 (UTC)
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
 by mx.groups.io with SMTP id smtpd.web10.56508.1748363179975244676
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 May 2025 09:26:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lsvW+9Ln;
 spf=pass (domain: gmail.com, ip: 209.85.219.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-6fa956f0f16so34925436d6.3
        for <openembedded-core@lists.openembedded.org>; Tue, 27 May 2025 09:26:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748363179; x=1748967979; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=lfKFhxngD5N4+PkPCeh22P33FaOOFod3YRZfmIQXF1I=;
        b=lsvW+9Ln49CofEZAS6LerIjF18qdTVGgtvP+X9YxDxnSctPvVlbycYrRf4xAk4mJsn
         D9qDMDt36cSEjDO7mTbldzxTQuwYS5flSYcNSjQ5OEKbjlYcZqpKkb/sPbfnsuRtOUia
         RH4bZa1ss/o99OgZdVtBkVpA5b2bQAuPsY+yghhIKEKNwNYoJgCNDTuj1WWeUTldyptz
         j9Nc2we9dPBZoVXgTEnDZXDqD6ciWFhioYapNr+nqKaZyImfjYX6XpSIlaOiLcZSmcNr
         xNB9UESLBP7hKb/4j0L1NO0zbCEsy9J29J1qnJWhAPREjRK4aa3ceOJPVcvRRZkAeXmV
         YVQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748363179; x=1748967979;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lfKFhxngD5N4+PkPCeh22P33FaOOFod3YRZfmIQXF1I=;
        b=hVPEAWv7nSWEZnpHYwtmDvvku9OT0su7V8ueB4RYdxLxHAG/VId82EVu/lxj0ciNt+
         vl6/Qn7cEP4qovKgwzi4pIlxrmIiHQBrnUbwumx9FgE+1ceaUxcYiWOTOQvqa9Fme/5l
         O+jGN6jPCBxwLrS8fg02Kn8SwVRxCGtPmSaABlVlayBrulk2EwD+bYIqsE9tHQvA0I+z
         CDzDnxesZR9TDCZMOuiCXjPiSJ/0nkMd48hdbODSU98TpeWm1rT6lTvGXiYyDsu7rYv0
         wjJHeJhohEKKPQNDUtWPj9qJ2nDToPgQr64iZjjv/qsKnors5TZpXPgCE0xBXO/Sr6pu
         quCg==
X-Gm-Message-State: AOJu0YybymT731NQ2+4/Pj6n/PeQFShTkipqkI7Rg2uFZNfp2eex2Ovo
	mhcO8PFRZQg+follKzYCbdIk29t2yRrMkb6LvyyStgdq0GQ/+UDExItKMQRevZc08XQxsSmcGky
	I+R6uD8qn1nMQpukX/SMcf2EdPwbmDP4=
X-Gm-Gg: ASbGncuHgLIMqcf1D4quRDua6n0fwjZwIe+JMJcUQs6Pe16NH7AYrOhxkIeL4ygnDtq
	W7LAHDxJ9XonQaJyReA6WGE18BntrY7u2SKab0YOb1kCyWdncAaDV3ZJS8KvvxnZgrmc1sOa4rQ
	P6Y5KWxFwSQgpIAXvqVIgi2pIDjpmKtESI9k4GhclP2g==
X-Google-Smtp-Source: AGHT+IFIiQPI4Y2D6z11ZVhYEZ8GafxKKlxN5VJer220qm/n9K7fxulhBVkn5LpzIki6TCkf6KXwR+HyJwNxxyNQtWI=
X-Received: by 2002:ad4:5bc2:0:b0:6e6:668a:a27f with SMTP id
 6a1803df08f44-6fa9d13923cmr253670816d6.17.1748363178800; Tue, 27 May 2025
 09:26:18 -0700 (PDT)
MIME-Version: 1.0
References: <83e0d268-ec47-4f3a-bf05-2aee4e58e749@windriver.com>
 <CANNYZj-BmEXJVc1rdVPGu5wz87AW1RvbX+WhgicAfEby7kjUhw@mail.gmail.com> <47ba1f68-f67b-4c58-b788-63e06fdf4816@windriver.com>
In-Reply-To: <47ba1f68-f67b-4c58-b788-63e06fdf4816@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 27 May 2025 18:26:06 +0200
X-Gm-Features: AX0GCFsOFFmAH5yWPOzDVCF_Xz6C_sniAJIjrs9H2SFV2CswjCJxLCX2KBUc5HM
Message-ID: <CANNYZj-JtVtjk2e+Z=OmVF8RaygO5M1e+6tbQuTZYotbYetQrg@mail.gmail.com>
Subject: Re: [OE-core] [RFC] rust: Upgrade 1.85.1->1.86.0
To: Yash Shinde <Yash.Shinde@windriver.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	"MacLeod, Randy" <randy.macleod@windriver.com>, 
	"Kokkonda, Sundeep" <Sundeep.Kokkonda@windriver.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 May 2025 16:26:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217316

On Tue, 27 May 2025 at 16:42, Yash Shinde <Yash.Shinde@windriver.com> wrote:
> Yeah, that's the reason.
>
> I am not sure how rust-lld is installed in ${D} now. A similar error was
> previously resolved by using:
> "+TARGET_CC_ARCH +=
> "${LDFLAGS}""(https://git.yoctoproject.org/poky/commit/?id=cc24a0ff76f2e227cc3a0f478d078b2158299a80)
>
> LDFLAGS are explicitly unset in rust recipe.
> (https://git.yoctoproject.org/poky/tree/meta/recipes-devtools/rust/rust_1.85.1.bb#n194)
> I attempted to remove the "unset LDFLAGS" in rust recipe and exported
> TARGET_CC_ARCH as above, but that didn't work.
>
> Is there some different or recommended way to pass LDFLAGS to rust that
> I might be missing?

The issue isn't about how to pass LDFLAGS. The issue is that something
triggers building all these additional things, including rust-lld, and
you need to narrow down how and where that happens, and how to go back
to the install set (and build times) we've had in 1.85. Please get to
the particular point where that decision happens.

We can't just double the build times without a comprehensive,
convincing investigation.

Alex

