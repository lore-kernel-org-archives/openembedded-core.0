Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D873C3DA45
	for <webhook@archiver.kernel.org>; Thu, 11 Jul 2024 19:30:56 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web10.604.1720726252609157116
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Jul 2024 12:30:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Vc5SiVqb;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-367ab50a07aso720117f8f.0
        for <openembedded-core@lists.openembedded.org>; Thu, 11 Jul 2024 12:30:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1720726251; x=1721331051; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=kjTBoImjR3HBzC8xGkNTQ6G67xjVEm73pvSy18TvrAk=;
        b=Vc5SiVqbZ/pWjJv5h5l6OBYK3hg9FljDxiGdeomRwyUFh0iY3RhB3IhdvQWjVzUdTV
         w9NWTT1WriOxfPXvSqU497unfaW8iubeKIru1Y5iclGjC/j0Ugsm3FbE+mNTzto1syIS
         wJDCtGDkLzShysenB+nn2Bcuw0pC++yVKRLbc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720726251; x=1721331051;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kjTBoImjR3HBzC8xGkNTQ6G67xjVEm73pvSy18TvrAk=;
        b=uBsQsSxfjSu5DtNR7ZoyXjAjc4aSJK8kPEmo0dIge6p3RreXOqJs5WjTQwfj9HemoB
         P8Fc/RBkFEszGfGXM5DEt8aJ8GBxkmZvwrOzeb9OvMJEMe0ghrGThfv6TRlXPJgMLOtJ
         7z7S+f9exiW9zrQuEevAn4U9M7bGYxiTiIQ3cQKXhqQPDoDcxuPjxwHERBTWuDy+nfIK
         vCbamxNHWFBl4O+jOvbq0sArBYkA+R+sk++LpFE+AZeUSOvzvX2R9EcGCOKtW3uRU/XA
         RT/IOFfE4nzxgFs+JCBPV7+FXUZzG4oOq1gU2NnSmnBoth36Tb5pqZEJWIbXEtWUDzTV
         eQKQ==
X-Gm-Message-State: AOJu0Yx94QhajCNbHtF6D9Utb5ygrdk352hJTVZ1ZPy/o2FRoEbw2T0n
	vd9/NW0GCAVXbWtoBoBhFprOciZDx5k9M30WsSMPwfmwzGQW8S4jAoqHVk4hSJU=
X-Google-Smtp-Source: AGHT+IE5DkWGXOCvu8d+wYr6OUxFG0K2syl3007j/Pdx/uVZow8GDY4goKyPC+G5xXsXQxe/sEvEEQ==
X-Received: by 2002:adf:e30b:0:b0:366:f041:935d with SMTP id ffacd0b85a97d-367cead92e6mr5494637f8f.60.1720726250844;
        Thu, 11 Jul 2024 12:30:50 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:d8ba:9b2d:97f1:1754? ([2001:8b0:aba:5f3c:d8ba:9b2d:97f1:1754])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-367cde84660sm8470773f8f.25.2024.07.11.12.30.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jul 2024 12:30:50 -0700 (PDT)
Message-ID: <87e16fd1bdd196b59057b00cf41c754d6f552d8b.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] bitbake.conf/webkitgtk: Split debug flag from
 DEBUG_FLAGS
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Ross Burton <Ross.Burton@arm.com>
Cc: "openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Date: Thu, 11 Jul 2024 20:30:50 +0100
In-Reply-To: <38C005D9-7212-4055-9CBD-0460B6D1F659@arm.com>
References: <20240711165432.1340223-1-richard.purdie@linuxfoundation.org>
	 <38C005D9-7212-4055-9CBD-0460B6D1F659@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.0-1build2 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Jul 2024 19:30:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201793

On Thu, 2024-07-11 at 19:05 +0000, Ross Burton wrote:
>=20
>=20
> > On 11 Jul 2024, at 17:54, Richard Purdie via lists.openembedded.org <ri=
chard.purdie=3Dlinuxfoundation.org@lists.openembedded.org> wrote:
> >=20
> > -DEBUG_FLAGS ?=3D "-g -feliminate-unused-debug-types ${DEBUG_PREFIX_MAP=
}"
> > +DEBUG_LEVELFLAG ?=3D "-g"
> > +DEBUG_FLAGS ?=3D "${DEBUG_LEVELFLAG} -feliminate-unused-debug-types ${=
DEBUG_PREFIX_MAP}=E2=80=9D
>=20
> Considering -feliminate-unused-debug-types is the default according to th=
e GCC=C2=A0
> docs, why don=E2=80=99t we remove DEBUG_FLAGS entirely to remove a level =
of indirection?

I think we were an early adopter of that one. If it is a default now we
can drop it.

> It=E2=80=99s not a huge amount of copy-paste as we can set=20
>=20
> FULL_OPTIMIZATION =3D "-O2 -pipe ${DEBUG_PREFIX_MAP} ${DEBUG_LEVELFLAG}=
=E2=80=9D
> DEBUG_OPTIMIZATION =3D "-Og -pipe ${DEBUG_PREFIX_MAP} ${DEBUG_LEVELFLAG}=
=E2=80=9D

It is the prefix map I worry about as some recipes do different things
with DEBUG_FLAGS. Its probably a better long term change but probably
more to debug to make it work.

> (also, why is -pipe an optimisation flag?)

It was controversial back then and was done as a speed improvement.
There is probably more refactoring that could be done here.

>=20
> I was also thinking a less invasive solution would be to do this in llvm.=
bb:
>=20
> DEBUG_FLAGS:append =3D "${@d.getVar(oe.utils.vartrue('DEBUG_BUILD', '', =
=E2=80=98-g0', d))}=E2=80=9D

I was trying to keep this as a distro level opt in/out rather than force th=
at decision=C2=A0
on everyone...

Cheers,

Richard


