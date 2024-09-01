Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 079D5C54FC6
	for <webhook@archiver.kernel.org>; Sun,  1 Sep 2024 10:53:21 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web11.13956.1725187997893562050
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Sep 2024 03:53:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=T+TiYatA;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-374c84dcc90so173087f8f.1
        for <openembedded-core@lists.openembedded.org>; Sun, 01 Sep 2024 03:53:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1725187996; x=1725792796; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3VTM61TEgIM/5Gnwcm5Em4WbFCOnHAHgScmDBHUzmoE=;
        b=T+TiYatAnKQx7lIjJrOneZOr0lSqJXZr4uLpXnQHLUN28oqWRBcySgrHPyiAVCtN8c
         Sd3e5d1qNrQeBEn4A808/XLgwUQzeYZnNTF58SjgclnOBPuXDhtERDYPYK7Qy53P1tW5
         vLRfaxPWkusPoiVLSjmtcUx2FGObnqB7AqaA0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725187996; x=1725792796;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3VTM61TEgIM/5Gnwcm5Em4WbFCOnHAHgScmDBHUzmoE=;
        b=u0Ntqz6jjQMIkGB9Jkuyjx+Xt1N2mbVQEDDOc5Iaae3Slfks6dCBBdat64n+HwUsWC
         UmZgeE9dLnEOtnlb7sb11Lz4O2itkEefAL1DVkHj0CmF85blQuzOoy4vJ8FIen+enSuX
         CjgvdZZLNG5k9xgQ14znperni3h87cpHxdFp0LnZqFSIamBgZ1xFVomnkIJBBvPeHq2b
         +2Kv5ekxW0oZu57GrnTc/Ab5O/AkuZdinZEvSXC1wMtMQ4bMev5w2BqNi7sw5bFzZ8eG
         LYC97cLWWK129fn2ZozXPMFxjBb46hAkEl8KuKxa/12xJRVq6zM63iQ9fZgIGhtz+Wj2
         78SQ==
X-Forwarded-Encrypted: i=1; AJvYcCVv2ASM5HdpaojkYYnfiP1n0iA4PClcXc2zQC42oG4U7tpQo09mGFgkBl+QYsBrardKLWwLECKE1ww8SsbjUQLPBg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyURCzCghOvlVghA8Ajn+ZlwlgQnylSqNv0OxZ+IR67PWo7M/P3
	wDgVwQFeWs834BuKsh0bv15gCehGYNP5SHLkCDrSv0uqhTG4RxGZreOl9LjjxlQ=
X-Google-Smtp-Source: AGHT+IFV3JIPftgzW6LnTNwNb7NDrRkk4/+Kzs80xSa0/r49VfG6HJEdlXIIN0FxRJ1pUcL8VWKfAg==
X-Received: by 2002:a5d:424b:0:b0:367:8f81:fa09 with SMTP id ffacd0b85a97d-374c94717famr403260f8f.47.1725187996146;
        Sun, 01 Sep 2024 03:53:16 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:c6b5:7d2b:4127:f9f9? ([2001:8b0:aba:5f3c:c6b5:7d2b:4127:f9f9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-374c08e07b6sm3430185f8f.63.2024.09.01.03.53.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Sep 2024 03:53:15 -0700 (PDT)
Message-ID: <ad56dadc1ba7cc73785a7a1414f95f7771d1e0bd.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] abi-version/ssate: Bump to avoid systemd hash
 corruption issue
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>, 
 "openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Date: Sun, 01 Sep 2024 11:53:14 +0100
In-Reply-To: <DB5PR02MB102133BE7944D89C00AD695FFEF912@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <20240901071848.96558-1-richard.purdie@linuxfoundation.org>
	 <DB5PR02MB102133BE7944D89C00AD695FFEF912@DB5PR02MB10213.eurprd02.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Sep 2024 10:53:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204042

On Sun, 2024-09-01 at 10:36 +0000, Peter Kjellerstedt wrote:
> > -----Original Message-----
> > From:
> > openembedded-core@lists.openembedded.org=C2=A0<openembedded-core@lists.=
openembedded.org
> > > On Behalf Of Richard Purdie
> > Sent: den 1 september 2024 09:19
> > To: openembedded-core@lists.openembedded.org
> > Subject: [OE-core] [PATCH] abi-version/ssate: Bump to avoid systemd
> > hash corruption issue
> >=20
> > Unfortunately some recent patches caused non-deterministic output.
> > One input hash lead to both good and bad output and whilst that
> > patch
> > has been fixed, the problematic hash 'cross' linkage remains. Bump
> > to
> > a new sstate and hash equivalence version to avoid this and work
> > from
> > a clean slate.
> >=20
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > ---
> > =C2=A0meta/classes-global/sstate.bbclass | 2 +-
> > =C2=A0meta/conf/abi_version.conf=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 | 2 +-
> > =C2=A02 files changed, 2 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/meta/classes-global/sstate.bbclass b/meta/classes-
> > global/sstate.bbclass
> > index beb22f424e8..fdd529ee4e8 100644
> > --- a/meta/classes-global/sstate.bbclass
> > +++ b/meta/classes-global/sstate.bbclass
> > @@ -4,7 +4,7 @@
> > =C2=A0# SPDX-License-Identifier: MIT
> > =C2=A0#
> >=20
> > -SSTATE_VERSION =3D "12"
> > +SSTATE_VERSION =3D "14"
> >=20
> > =C2=A0SSTATE_ZSTD_CLEVEL ??=3D "8"
> >=20
> > diff --git a/meta/conf/abi_version.conf
> > b/meta/conf/abi_version.conf
> > index 0fe91b5ddf3..ac97752c976 100644
> > --- a/meta/conf/abi_version.conf
> > +++ b/meta/conf/abi_version.conf
> > @@ -12,4 +12,4 @@ OELAYOUT_ABI =3D "15"
> > =C2=A0# a reset of the equivalence, for example when reproducibility
> > issues break the
> > =C2=A0# existing match data. Distros can also append to this value for
> > the same effect.
> > =C2=A0#
> > -HASHEQUIV_HASH_VERSION=C2=A0 =3D "17"
> > +HASHEQUIV_HASH_VERSION=C2=A0 =3D "18"
>=20
> Is this actually needed now after the changes to insane.bbclass?
> Won't those changes effectively invalidate the whole sstate anyway?

Firstly, those changes don't change the output of the tasks so no, the
mismatched output hashes would have remained a problem.

Secondly, those had already merged and been tested alongside the
systemd changes so it was already too late anyway.

So sadly I just can't see an alternative to this due to where the
corruption is.

Cheers,

Richard

