Return-Path: <claus.stovgaard@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B419CFA754
	for <webhook@archiver.kernel.org>; Mon,  7 Oct 2024 21:08:59 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.web11.3311.1728335333376150375
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Oct 2024 14:08:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=E8aeFbCA;
 spf=pass (domain: gmail.com, ip: 209.85.218.41, mailfrom: claus.stovgaard@gmail.com)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a99415adecaso370617266b.0
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Oct 2024 14:08:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728335332; x=1728940132; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6bGGk06VgBk1CCjzIwtEvBL9I+DodnlPPoj/YPYYUhs=;
        b=E8aeFbCAz7dRGgnOQRolm2ao0tXkoeIQ3ori2PgZR5GoqyzmfhN6IHuyMHFWtln7VG
         0AjFm2F1GiDHjKATVMxM8U1mE7n2pzfRPYNv6cRrlu+uXWkAvMSx7rYYAFgit2y/Cfi6
         UD8eksu5Fd4i841XLjnm7ZhH/9ijGfvp+byL3CbFIx8wV+h2HDRCjZBQ8Zt5xWyunZo2
         70qqT6gUhZJF4EqFZ8gSNLHS8IYkU4JWtmn9GHBEtfiuYdZDSdr6llniuJrOj+qWYO4U
         JFUx++5Q+4b0AilK4aJBpCcsnPCNxlgV/qdx/2XSS/IZaCc3qXbYnIWNHfTGKbOgDCuM
         d5Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728335332; x=1728940132;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6bGGk06VgBk1CCjzIwtEvBL9I+DodnlPPoj/YPYYUhs=;
        b=ndiRUQ1MaapJcnLd6g26bsRMixhuxl3lWFUkEmp0CJMJEcCrD5P8yGDjr8OBG4cIVu
         PC6ZHCQBcuYvsEss6Dy3JwwQS7/sO5Dano0EMGizeMhQGdPquFIDkjnMYJAfkITffjzV
         VcJDKoZN531PGXbqNOfQBYjEsuetP3V4E5yGwBBCc2NJ5hP9qSBBRW/pWLk74lqiJWEK
         mX3H20iJCEn5FEN0DWYQWvtNL7ZKMQTo/HYdG4MW3Ruiqi9MyQoXO3URfhIYODq7ENPc
         Y6ePk9DwCe8cBpo1F1FqH2O15iaU3+eqiEDn1aCtQ4Ao9gDK+ndxGCe5vTTrBRMFCPzB
         cbQg==
X-Forwarded-Encrypted: i=1; AJvYcCWwy0Pn1OD5SRfqDNrXOeBSPHtZaYcQ/mxXldBc4S4MSEKy7fOMaAoq639KA2I3dwu7kcHQc2WTa/xpA8wT7OO9AQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzkFl5XGcO2jera28syhcFISHcT1S5EqLqU+4XglHMbYzCWvL7W
	Ov/e87fUal4yBrh7FzI0izScpbm+jMeb8UPD9cwomO1nhHoLoT1/
X-Google-Smtp-Source: AGHT+IFUY/O3pL+zX9Gz6ZXaNlonElogp75Qg3myyfbkUGrRzi7f5YiaoRI1iQF2ax6dLcsg54OZMw==
X-Received: by 2002:a17:907:2ce3:b0:a86:9fac:6939 with SMTP id a640c23a62f3a-a99679501c6mr86852966b.30.1728335331305;
        Mon, 07 Oct 2024 14:08:51 -0700 (PDT)
Received: from [192.168.1.70] (0x57346aa5.static.cust.fastspeed.dk. [87.52.106.165])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a993d92ed5dsm362307866b.63.2024.10.07.14.08.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Oct 2024 14:08:50 -0700 (PDT)
Message-ID: <2456863182484d2b15f75fe0f67a3473240a3fe6.camel@gmail.com>
Subject: Re: [OE-core] [RFC][master][PATCH] populate_sdk_base: Add
 SDKIMAGE_INSTALL_COMPLEMENTARY_HARD_DEPENDS_ONLY
From: Claus Stovgaard <claus.stovgaard@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org, Ross.Burton@arm.com
Date: Mon, 07 Oct 2024 23:08:49 +0200
In-Reply-To: <c3155a29aa855283f3396582c989263d93ded4f3.camel@linuxfoundation.org>
References: <20240927132040.200122-1-claus.stovgaard@gmail.com>
	 <c3155a29aa855283f3396582c989263d93ded4f3.camel@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.2 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Oct 2024 21:08:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205280

On Tue, 2024-10-01 at 10:53 +0100, Richard Purdie wrote:
> On Fri, 2024-09-27 at 15:20 +0200, Claus Stovgaard via
> lists.openembedded.org wrote:
> > SDKIMAGE_INSTALL_COMPLEMENTARY_HARD_DEPENDS_ONLY is a new variable
> > to
> > enable installation of recommended complementary packages in the
> > classic
> > sdk. Use it to get populate_sdk behave like Kirkstone and earlier.
> >=20
> > As installing complementary recommended packages is known to cause
> > bugs
> > it was disabled. Though it can be usefull when having dummy
> > packages
> > with DEPENDS to create SDK's. Use this variable with caution.
> >=20
> > Signed-off-by: Claus Stovgaard <claus.stovgaard@gmail.com>
>=20
> The commit message needs improvement since I can't tell what this
> means/does.
>=20
> What was the behaviour in kirkstone and how did it change? Why/when
> would I need it?
>=20
> What is a "hard depends"?
>=20
> I don't have an opinion on whether should do something like this or
> not
> as yet, mainly as I can't tell what it is doing. Can you explain it
> without reference to "behaviour in kirkstone"?
>=20
> I also have an aversion to "1" as a magic value. Have a look at
> bb.utils.to_boolean() for that.
>=20

Thanks for your comments.

I will try to improve the commit message, and split the documentation
part out from the rest.

The issue it tries to solve is the one described here.
https://lists.openembedded.org/g/openembedded-core/topic/108100662#msg20374=
5

In short - with this commit

https://git.yoctoproject.org/poky/patch/?id=3D4705dd264681d908f144dd4d9bf1f=
6175f68d8b9
the behaviour of complementary package handling changed ignore
RRECOMMENDS.

This was changed to fix some long standing bugs for RDEPENDS from -dev
packages.

Though as the complementary handling of including packages from
RRECOMMENDS is needed in some situations the purpose of this patch is
to change from hardcoded disabled to be a configurable option.

A prime example for where we need the installation of packages in
RRECOMMENDS, and not ignore it is for generating a SDK with all
dependencies for an application.

E.g. if we have a dummy recipe with packages in DEPENDS, the packages
listed in DEPENDS will end in RRECOMMENDS. See process_depchains in
package.py for the pkg_adddeprrecs method, and not be installed in the
SDK. Using the variable introduced with this patch, will install
packages from RRECOMMENDS in the SDK, and we have a classic SDK with
all the packages from DEPENDS and ready to be used for the application.

Hope it make better sense for you now, and I will try to describe it
better in the commit message.

Regards
Claus


> Cheers,
>=20
> Richard


