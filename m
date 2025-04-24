Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0A1FC369AB
	for <webhook@archiver.kernel.org>; Thu, 24 Apr 2025 11:32:33 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web10.12713.1745494348837842587
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Apr 2025 04:32:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=NDurCwJh;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43cf034d4abso8448985e9.3
        for <openembedded-core@lists.openembedded.org>; Thu, 24 Apr 2025 04:32:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1745494347; x=1746099147; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=5Q90lNxDrZEZSCCtQkr+LvvCpJE2SqLFgc1AVmZ507s=;
        b=NDurCwJhDpX+iFnfQ8G9bPjhczBSpkkWQ5KehQwuh78R+F4kZESuC815nt0FvMFb+B
         pRKWE7/Zx0bI2WysnShLmJ0UU/aTOhAf+mynnKsd3C8nkY3udtK/nYpYev8xiPqmmllJ
         hWToGl1vK9IbiuDiie+LSxskFhX7UJ6DKNtk8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745494347; x=1746099147;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5Q90lNxDrZEZSCCtQkr+LvvCpJE2SqLFgc1AVmZ507s=;
        b=uhsXPoPJ9XdWzoi5lgxJZECp00MSYJN8rM8UpTckXIrnKWVxOeXIUBMN4PCHMntHNR
         1NVjLa4TfdIdvHUrjDdzKYFIq3Jui8+qRWNFlFZEybGTF8puBDjkhyVTBDVuUMfB65IP
         Wn6VZuBb2hkV4Cyk6DCWFwTjwp7OyxYOOT0Kp/iIS33eKFJtAgX1JjUSfFaHu2r6dazw
         k3GnX2UZHawmAanldk2+1idFAw5JfOC32VeKFrSbIMcBmgznRtSJ1PZX2xvmGMnPYfNu
         +R4aX8DchJA7JUefNdAj0HN2xV21qzw9c2HNnuj/Pj1Gjd4Go23WBEsJSENK3BjpejyZ
         CKBQ==
X-Forwarded-Encrypted: i=1; AJvYcCVvnNmgYzQ+WbEO+To++9C/xy+TH0PyRSkdksnqf/EDn83f780Zx5aTKyozT6OkuQLABaCeoC8LBBQvbHVnwwJG6A==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwQpEavUre2QbhqaEv9BMD96gxRxoHhQgRlL8BnU91J79zoSSbv
	OxV7v8/X9oExyKny+wdiePXVg23igICMqAIOt9UrVhyw36xKGBZ/xK5g4yzeWEs=
X-Gm-Gg: ASbGncvLLK7djX7TdZ8pAmv1rhNrTjju6yG19bJuLGwEz8ENX5aRNJDPzF1jAlAwTTd
	N1O5O2JGzScuJz5yEoO8vwYxbo/Xd1mhVBrnjLK2pxufrf7nzimI+djNVe8IdkawOmm9WJI5zw0
	YVbkj4h7uuOZIErAVWk0lmbng4/TS60H0Jw2sTtjaeJk+5t362KPz/xNTBl9Eyj8n37ieudov/b
	508chouPa9YUhW1jixWt1FU8k06zSdF9NonHjYskbRvZu5/SZurFu2nK5lRz6F0JNsp3fmznjI/
	V6izdLKMIBcdzpqXBHqSPlnuD/7YjXeXg9vJYxyULt1w3pCmAB1rGeX40V2ZMcMDxwOQzbqGNOf
	BwuHA6NRWwSplzSDhi5vKehlXJxXVFQ==
X-Google-Smtp-Source: AGHT+IF9zpnnZm6FNyHwHzaPPMtbCUzyIr4Lu6dt1xRS/TeeH610EHbGYHeN3AYwfz6udJNz+WzMGw==
X-Received: by 2002:a05:600c:1d81:b0:43c:efed:733e with SMTP id 5b1f17b1804b1-4409bd1e10cmr19761095e9.14.1745494347248;
        Thu, 24 Apr 2025 04:32:27 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:94cb:8780:19ce:62be? ([2001:8b0:aba:5f3c:94cb:8780:19ce:62be])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4409d2ad16asm17100165e9.21.2025.04.24.04.32.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 04:32:26 -0700 (PDT)
Message-ID: <cf05b37db043dd939ec540a24ae0343376e5a830.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 1/4] devtool: account for sources in UNPACKDIR
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: alex.kanavin@gmail.com, openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Date: Thu, 24 Apr 2025 12:32:25 +0100
In-Reply-To: <20250424111014.905507-1-alex.kanavin@gmail.com>
References: <20250424111014.905507-1-alex.kanavin@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Apr 2025 11:32:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215364

On Thu, 2025-04-24 at 13:10 +0200, Alexander Kanavin via lists.openembedded=
.org wrote:
> From: Alexander Kanavin <alex@linutronix.de>
>=20
> There's a couple of assumptions in devtool that sources
> are always in a directory under WORKDIR; this is no longer
> the case since introduction of UNPACKDIR: some recipes
> are starting to use
>=20
> S =3D "${UNPACKDIR}/git"
>=20
> or similar, and so the logic to determine source locations
> needs to be tweaked accordingly.
>=20
> The issue is that oe-core has no concept of 'top level source
> path' (S points to where the build is started from, inside that
> top level location), and yet devtool needs to know that in order
> to move the complete source tree correctly to a workspace (and possibly
> other uses).
>=20
> And so devtool performs convoluted path calculations from WORKDIR and S;
> now this has been extended to include UNPACKDIR and became more convolute=
d
> but hopefully it won't get any worse.
>=20
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
> =C2=A0meta/classes/devtool-source.bbclass |=C2=A0 8 ++++++--
> =C2=A0scripts/lib/devtool/ide_sdk.py=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=
=A0 2 +-
> =C2=A0scripts/lib/devtool/standard.py=C2=A0=C2=A0=C2=A0=C2=A0 | 25 ++++++=
+++++++++++++------
> =C2=A0scripts/lib/devtool/upgrade.py=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=
=A0 2 +-
> =C2=A04 files changed, 27 insertions(+), 10 deletions(-)

UNPACKDIR was meant to help with this. If devtool is changing the
location, can't it just change UNPACKDIR and leave everything else
alone? S will still be under UNPACKDIR/git even after devtool moves it?

Cheers,

Richard

