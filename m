Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFDAAD59F4B
	for <webhook@archiver.kernel.org>; Wed,  6 Nov 2024 16:01:57 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web10.49394.1730908915657545915
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Nov 2024 08:01:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=PMjjy/K4;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43169902057so53972295e9.0
        for <openembedded-core@lists.openembedded.org>; Wed, 06 Nov 2024 08:01:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1730908914; x=1731513714; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=BWogY2Rt7RTnZeEidQRI1bKL8P70JCvoXkRM9SIKvjE=;
        b=PMjjy/K4gH8OO20itC5i7ZDbnJI91XETg5TxHi1iWlhwTUPllOym0vu1L9eLa6mFdk
         AbwM8C2gsNBsJavQGnlTPW+8LZAZQZy8QxJT59ph4EJuz4JFuMD4pn6NY8xssZSLS0HK
         Krt2VjBtMdCVWKwcAn7joNkqDGxEUC1vTJaMc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730908914; x=1731513714;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BWogY2Rt7RTnZeEidQRI1bKL8P70JCvoXkRM9SIKvjE=;
        b=r/cF9XtJd4T6UKrm9EcmRy/mM6/6yGYA+yeXxNu4pWiKZZD5DhII8kBHcFcuqGFsz5
         HpWvj4/RShbRWfT8/QfesgNKOuZC7ru6XQNkcQ04+0Q/R6BwGryRTi2u5ESY71TGpRGW
         mf+ap+OlNI/O1EFypveHM6IB73OwxG/Z/v2ttp710cX8iy3zKieY+/fYBwaeixrMEjpy
         44vzjZ9JeiXEDSI/jzQGRRCha5OSQ9dyMsllzVCudRpK1qNPBjPgDEcahhrwQQuWmmUN
         caqIXJ/VRt568kdtFSRmsgFqMkBm1oIxThWB1cM9+XgjKhhp3NNy64NI2cWZ5FG6ANse
         ub7w==
X-Gm-Message-State: AOJu0YzedsKosrOBuyvvAf7QstdYLEINux/b0eRiG4fuJ5jx7VBrLj2j
	oPGpEXXMnunVYKAueXMHD9SngDPYdw9f1gLWxLW3A3B4JHcJ5UgP6qpjoTliB6I=
X-Google-Smtp-Source: AGHT+IH7VXv/WINHt/OWh777CCigXgOYjTMCmoFK5/CSP/IatsDBWq18+Jz65O7k5Lqf3KDUCWzrbw==
X-Received: by 2002:a05:600c:19d3:b0:431:5044:e388 with SMTP id 5b1f17b1804b1-431bb9d0aeamr252126285e9.22.1730908913740;
        Wed, 06 Nov 2024 08:01:53 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:5f26:5175:55ad:9264? ([2001:8b0:aba:5f3c:5f26:5175:55ad:9264])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381c10b7b32sm19603431f8f.18.2024.11.06.08.01.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2024 08:01:53 -0800 (PST)
Message-ID: <23f158f4bf232dda3d501a8bb724e2235092a4f0.camel@linuxfoundation.org>
Subject: Re: bitbake.conf: require lz4 instead of lz4c
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Justin Bronder <jsbronder@cold-front.org>
Cc: openembedded-core@lists.openembedded.org, Enrico Jorns
 <ejo@pengutronix.de>
Date: Wed, 06 Nov 2024 16:01:52 +0000
In-Reply-To: <ZyuQwnMFmfIXDIaa@ravine.members.linode.com>
References: <20241105153752.3610957-1-jsbronder@cold-front.org>
	 <3ac4b13ff08fc83cb2e37fc7caadeb89115e7814.camel@linuxfoundation.org>
	 <ZyuQwnMFmfIXDIaa@ravine.members.linode.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Nov 2024 16:01:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206792

On Wed, 2024-11-06 at 10:52 -0500, Justin Bronder wrote:
> On 06/11/24 07:50 +0000, Richard Purdie wrote:
> > On Tue, 2024-11-05 at 10:37 -0500, Justin Bronder via
> > lists.openembedded.org wrote:
> > > With bitbake commit 'bb: compress: use lz4 instead of lz4c' we
> > > require
> > > lz4, not lz4c [1].=C2=A0 Going as far back as Ubuntu 16.04/Fedora 25,
> > > they
> > > are packaged together so it should be safe to simply adjust the
> > > requirement from lz4c to lz4.
> > >=20
> > > Note that the two are largely the same, but upstream has
> > > considered lz4c
> > > deprecated since at least 2018 [2].
> > >=20
> > > 1.
> > > https://git.openembedded.org/bitbake/commit/?id=3D907472034b344e4eb73=
cfd43059a413469f52e1c
> > > 2. https://github.com/lz4/lz4/pull/553
> > >=20
> > > Signed-off-by: Justin Bronder <jsbronder@cold-front.org>
> > > ---
> > > =C2=A0meta/conf/bitbake.conf | 2 +-
> > > =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
> > >=20
> > > diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> > > index eda505c861..14e761e2e7 100644
> > > --- a/meta/conf/bitbake.conf
> > > +++ b/meta/conf/bitbake.conf
> > > @@ -517,7 +517,7 @@ HOSTTOOLS +=3D " \
> > > =C2=A0=C2=A0=C2=A0=C2=A0 [ ar as awk basename bash bunzip2 bzip2 cat =
chgrp chmod
> > > chown chrpath cmp comm cp cpio \
> > > =C2=A0=C2=A0=C2=A0=C2=A0 cpp cut date dd diff diffstat dirname du ech=
o egrep env
> > > expand expr false \
> > > =C2=A0=C2=A0=C2=A0=C2=A0 fgrep file find flock g++ gawk gcc getconf g=
etopt git grep
> > > gunzip gzip \
> > > -=C2=A0=C2=A0=C2=A0 head hostname iconv id install ld ldd ln ls lz4c =
make md5sum
> > > mkdir mkfifo mknod \
> > > +=C2=A0=C2=A0=C2=A0 head hostname iconv id install ld ldd ln ls lz4 m=
ake md5sum
> > > mkdir mkfifo mknod \
> > > =C2=A0=C2=A0=C2=A0=C2=A0 mktemp mv nm objcopy objdump od patch perl p=
r printf pwd \
> > > =C2=A0=C2=A0=C2=A0=C2=A0 python3 pzstd ranlib readelf readlink realpa=
th rm rmdir
> > > rpcgen sed seq sh \
> > > =C2=A0=C2=A0=C2=A0=C2=A0 sha1sum sha224sum sha256sum sha384sum sha512=
sum \
> > >=20
> >=20
> > This caused a failure in barebox:
> >=20
> > https://valkyrie.yoctoproject.org/#/builders/23/builds/409/steps/14/log=
s/stdio
> >=20
>=20
> I see, sorry about that.
>=20
> What would be the recommended path forward?
>=20
> - Add lz4c to HOSTTOOLS_NONFATAL so it's still symlinked.=C2=A0 This woul=
d
> fix barebox and any other recipes that still depend on lz4c on
> distributions where lz4c is still packaged but leave others without
> an early warning system.
> - Submit patches to barebox and others to use lz4 instead of lz4c.=C2=A0
> This is probably more correct but will leave Tumbleweed unsupported
> by default with other distros to presumably follow.

barebox only recently merged so I think it should be fine to see if we
can switch barebox to use lz4. How would that leave Tumbleweed
supported?

Cheers,

Richard


