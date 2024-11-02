Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F15DE67818
	for <webhook@archiver.kernel.org>; Sat,  2 Nov 2024 22:57:42 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web10.26780.1730588255662449475
 for <openembedded-core@lists.openembedded.org>;
 Sat, 02 Nov 2024 15:57:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=O/cEWSQY;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-37d8901cb98so2474415f8f.0
        for <openembedded-core@lists.openembedded.org>; Sat, 02 Nov 2024 15:57:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1730588254; x=1731193054; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=d+a0DOS6yJgzmGZ9KpcE+Nmk2mW6uC+xPLWO+cFWvxY=;
        b=O/cEWSQY0ZeKTZjlebetDrHlfXqscgZRyzXGpPhcvCb8tAXd41DE4JeYKbm3qo79aV
         XzJkbYE2CSRkfSMRCLCSNZga933tUq84caeB+w4FvtBQq7KVZQiRuoOpHYWfItg9oykO
         emNLRS4vlzQRViPfAyKHbtrqPMssH79d5Kow0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730588254; x=1731193054;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=d+a0DOS6yJgzmGZ9KpcE+Nmk2mW6uC+xPLWO+cFWvxY=;
        b=IxMCoDgLY3tnTzAJKp0+uw9Dg9nSDVEwQtk9OoIkwgacXKqfK5MV76tbv8jd8tXXBN
         sv+DYz2FMip0iHgLdeoCyQ+3ZcPUH9N3jgJwLuY1UmAwtGAAhl678JkepMeI2Y5zMYAE
         RbggKhpklMxoUleSprrdTiPMyn/PgQFG44xSNZWRKCypMd6JLtPKj217Nv2CZ3nLmmbo
         DECQne5wRA+a/MqmklcnGP2CzzluTQMjS8X6XxNRvO3JtIl6/GH6YsruFuWuKGcXnpfZ
         +zpJZQAflwSrMbk45M844NdfXPQtEU+d2XX32Eq7imcYk1iNsAOItfjktF7I8h2tbdza
         pARA==
X-Forwarded-Encrypted: i=1; AJvYcCWSSaac8ssAjBV7BClqK8WWQk8Ck31yXdUKmmQ9L/i8YnvSLPkeCyCEZ/riONFeRB+Y51uCmszilxU/zdczArOHrw==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yy50CnDYmVD1e6bQTdEhhD/moULqK8LR6uCJiJSgmA3xJjspJal
	CVWYSS+wfntlvIuhawl2yl+oQu/JD6gaqOqM9+JXKy+mLwSuaPZFDQwE4oDBS+4=
X-Google-Smtp-Source: AGHT+IGxd4CFtSllVuuyDmbslhq1pw0iDQ4JxU9nWbQOSpCHI/a1cWudjMUgvVi6gO0OXe8KFkrMvw==
X-Received: by 2002:a5d:5f54:0:b0:374:bd00:d1e with SMTP id ffacd0b85a97d-381c796767cmr6774006f8f.3.1730588253938;
        Sat, 02 Nov 2024 15:57:33 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:cdf4:f032:bd3a:44d7? ([2001:8b0:aba:5f3c:cdf4:f032:bd3a:44d7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-431bd9ca7ebsm138034415e9.42.2024.11.02.15.57.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Nov 2024 15:57:33 -0700 (PDT)
Message-ID: <d6fda363e9606afa375d96670d4126f6df229386.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 1/3] busybox: Backport a patch to build with
 CONFIG_SHA1_HWACCEL on non-x86
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: peter.kjellerstedt@axis.com, openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Date: Sat, 02 Nov 2024 22:57:32 +0000
In-Reply-To: <180448BAD9977D8B.18610@lists.openembedded.org>
References: <20241102203910.1267120-1-pkj@axis.com>
	 <180448BAD9977D8B.18610@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 02 Nov 2024 22:57:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206660

On Sat, 2024-11-02 at 22:55 +0000, Richard Purdie via
lists.openembedded.org wrote:
> On Sat, 2024-11-02 at 21:39 +0100, Peter Kjellerstedt via
> lists.openembedded.org wrote:
> > This allows CONFIG_SHA1_HWACCEL to be enabled regardless of the
> > architecture.
> >=20
> > Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> > ---
> > =C2=A0...sha1-on-x86-if-CONFIG_SHA1_HWACCEL-y.patch | 33
> > +++++++++++++++++++
> > =C2=A0meta/recipes-core/busybox/busybox_1.37.0.bb=C2=A0=C2=A0 |=C2=A0 1=
 +
> > =C2=A02 files changed, 34 insertions(+)
> > =C2=A0create mode 100644 meta/recipes-core/busybox/busybox/0001-libbb-
> > fix-sha1-on-x86-if-CONFIG_SHA1_HWACCEL-y.patch
> >=20
> > diff --git a/meta/recipes-core/busybox/busybox/0001-libbb-fix-sha1-
> > on-x86-if-CONFIG_SHA1_HWACCEL-y.patch b/meta/recipes-
> > core/busybox/busybox/0001-libbb-fix-sha1-on-x86-if-
> > CONFIG_SHA1_HWACCEL-y.patch
> > new file mode 100644
> > index 0000000000..2af188938e
> > --- /dev/null
> > +++ b/meta/recipes-core/busybox/busybox/0001-libbb-fix-sha1-on-x86-
> > if-CONFIG_SHA1_HWACCEL-y.patch
> > @@ -0,0 +1,33 @@
> > +From bf57f732a5b6842f6fa3e0f90385f039e5d6a92c Mon Sep 17 00:00:00
> > 2001
> > +From: Rudi Heitbaum <rudi@heitbaum.com>
> > +Date: Sun, 29 Sep 2024 17:57:55 +0000
> > +Subject: [PATCH] libbb: fix sha1 on !x86 if CONFIG_SHA1_HWACCEL=3Dy
> > +
> > +fixes non i386 and x86 builds
> > +
> > +libbb/hash_md5_sha.c: In function 'sha1_end':
> > +libbb/hash_md5_sha.c:1316:35: error: 'sha1_process_block64_shaNI'
> > undeclared
> > + 1316 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 || ctx->=
process_block =3D=3D
> > sha1_process_block64_shaNI
> > +
> > +Signed-off-by: Rudi Heitbaum <rudi@heitbaum.com>
> > +Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
> > +Upstream-Status: Backport
> > [https://git.busybox.net/busybox/commit/?id=3Dbf57f732a5b6842f6fa3e0f
> > 90385f039e5d6a92c]
> > +Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> > +---
> > + libbb/hash_md5_sha.c | 2 ++
> > + 1 file changed, 2 insertions(+)
> > +
> > +diff --git a/libbb/hash_md5_sha.c b/libbb/hash_md5_sha.c
> > +index 57a801459..75a61c32c 100644
> > +--- a/libbb/hash_md5_sha.c
> > ++++ b/libbb/hash_md5_sha.c
> > +@@ -1313,7 +1313,9 @@ unsigned FAST_FUNC sha1_end(sha1_ctx_t *ctx,
> > void *resbuf)
> > +=C2=A0	hash_size =3D 8;
> > +=C2=A0	if (ctx->process_block =3D=3D sha1_process_block64
> > + #if ENABLE_SHA1_HWACCEL
> > ++# if defined(__GNUC__) && (defined(__i386__) ||
> > defined(__x86_64__))
> > +=C2=A0	 || ctx->process_block =3D=3D sha1_process_block64_shaNI
> > ++# endif
> > + #endif
> > +=C2=A0	) {
> > +=C2=A0		hash_size =3D 5;
> > diff --git a/meta/recipes-core/busybox/busybox_1.37.0.bb
> > b/meta/recipes-core/busybox/busybox_1.37.0.bb
> > index c3131eb453..3aae6eff4d 100644
> > --- a/meta/recipes-core/busybox/busybox_1.37.0.bb
> > +++ b/meta/recipes-core/busybox/busybox_1.37.0.bb
> > @@ -53,6 +53,7 @@ SRC_URI =3D
> > "https://busybox.net/downloads/busybox-${PV}.tar.bz2;name=3Dtarball=C2=
=A0\
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> > file://0001-syslogd-fix-wrong-OPT_locallog-flag-detection.patch=C2=A0\
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 file=
://0002-start-stop-daemon-fix-tests.patch=C2=A0\
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 file=
://0003-start-stop-false.patch=C2=A0\
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> > file://0001-libbb-fix-sha1-on-x86-if-CONFIG_SHA1_HWACCEL-y.patch=C2=A0\
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "
> > =C2=A0SRC_URI:append:libc-musl =3D " file://musl.cfg"
> > =C2=A0SRC_URI:append:x86-64 =3D " file://sha_accel.cfg"
>=20
> Looks like musl doesn't like this:
>=20
> https://valkyrie.yoctoproject.org/#/builders/6/builds/368/steps/11/logs/s=
tdio

or qemux86 which is showing relocation in .text errors:

https://valkyrie.yoctoproject.org/#/builders/59/builds/358/steps/11/logs/st=
dio
https://valkyrie.yoctoproject.org/#/builders/30/builds/357
https://valkyrie.yoctoproject.org/#/builders/19/builds/368/steps/12/logs/st=
dio

Cheers,

Richard

