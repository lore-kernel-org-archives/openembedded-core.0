Return-Path: <claus.stovgaard@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CB30C4828F
	for <webhook@archiver.kernel.org>; Thu,  1 Feb 2024 14:37:52 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.web10.16979.1706798263373068086
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Feb 2024 06:37:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GL7Av6qX;
 spf=pass (domain: gmail.com, ip: 209.85.218.43, mailfrom: claus.stovgaard@gmail.com)
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a354fc17f24so127992766b.0
        for <openembedded-core@lists.openembedded.org>; Thu, 01 Feb 2024 06:37:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706798262; x=1707403062; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=++5L/+tAbceFgQEHh8GNy5XcQSz54hmSQaLzgq8R9To=;
        b=GL7Av6qXfK2c9gXjBtPVgRh+xqDpg5v0Nw/tDkMezr2c8h+Ij00cNI36u+M42C7MHl
         cj8mUbN0EuNVHV/+eavRN54LTcfGRi0tFF7OiEUngozkbJmY3OV0ecxsWPM1bVlwC/ug
         lEIPeyfSqkDb56+mxuYm/pCn8vnyaPxHsA+ydXNiVhFtI16j4lI6gG2mObN+EjhK8fZb
         61lvhOvYpQKCnEmkRi1m7ZZF2M6YvVWAa8R7zfQkbgS1WCBnu9nZzLQyNH5gJTPBETxA
         ddgGjNtKke0D5Jh/6Iwg6euXJ9pbEmqcpnfZf9SU/M6TztdSxTdJ3h7U9Pf+Gk4GsoFh
         K4JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706798262; x=1707403062;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=++5L/+tAbceFgQEHh8GNy5XcQSz54hmSQaLzgq8R9To=;
        b=UTuoVsTaUBJ1ufcqQs7ztLPOYlR4LAh7VDlD5m4AJihPTC8K8Pjq9VuqtNVxDosBW7
         Xx4Kp+I6Kb/8HfNeAJkcXhXXAPLvHq/1ziwAOKzBtGoBt4OIMlAcxlSBKqnWZcD84IRG
         EDAkUS1p/Nch+nSigHUxtp+zTNFvfSl6uRRanbUrwDE8hHBjrduacG3ymPd716Rs46/V
         rD3O9jdFi3GcNZkJp/cuCzOm7q1B9nHtrEd+1jWyXHdk0wi5+DEmQMJmJ4vuRiBUvvTk
         FuEflcUAjFf+f0hBnYR0sgkhYgi+DD+/RHHTUaxsWvv12WRFRLGD7iqzh71cFBu+mhtT
         sj/g==
X-Gm-Message-State: AOJu0Yw7t4xFwNA8qyGUc4GPtGa6Glmvl9fA+rG2rqwMOgtx2C5PAGCv
	lrD+MB9tXciS6kuqz2W98RzEsgNJJgpNs7NfRib9TzVn1Z5H9XGn
X-Google-Smtp-Source: AGHT+IHyUu0IVNJhngs9UnOKC/Q839yDsooXjf1DnvGLWwTJXcJzwnIBqKNIv69EowaRvcd9goECuw==
X-Received: by 2002:a17:906:3515:b0:a36:2dc:1903 with SMTP id r21-20020a170906351500b00a3602dc1903mr1972475eja.68.1706798261399;
        Thu, 01 Feb 2024 06:37:41 -0800 (PST)
Received: from [192.168.101.51] ([87.62.83.1])
        by smtp.gmail.com with ESMTPSA id t13-20020a170906064d00b00a316d360ac3sm7246384ejb.8.2024.02.01.06.37.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Feb 2024 06:37:40 -0800 (PST)
Message-ID: <212ff1e6d6315bba5371855ebd826bbbdd58f365.camel@gmail.com>
Subject: Re: [OE-core] [master][PATCH] kernel-devsrc: fix missing RDEPENDS
 gawk and make
From: claus.stovgaard@gmail.com
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Date: Thu, 01 Feb 2024 15:37:39 +0100
In-Reply-To: <CADkTA4MUkExGV3WM6LLZA6i9Nk=XU9G2Yc+0AkQchY5UJgAbMg@mail.gmail.com>
References: <20240201115326.506503-1-claus.stovgaard@gmail.com>
	 <CADkTA4NBTEH9js2E+KBGx3_LeLzd0RDCVY9gw2gHp-qP5ooO_Q@mail.gmail.com>
	 <b594d06bbba5dd65e8f1f9a7cc865a7e5aaaff66.camel@gmail.com>
	 <CADkTA4MUkExGV3WM6LLZA6i9Nk=XU9G2Yc+0AkQchY5UJgAbMg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.2 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Feb 2024 14:37:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194591

On Thu, 2024-02-01 at 08:41 -0500, Bruce Ashfield wrote:
> On Thu, Feb 1, 2024 at 8:31=E2=80=AFAM <claus.stovgaard@gmail.com> wrote:
> >=20
> >=20
> > Thanks for your quick reply Bruce
> >=20
> > On Thu, 2024-02-01 at 07:45 -0500, Bruce Ashfield wrote:
> > > On Thu, Feb 1, 2024 at 6:54=E2=80=AFAM Claus Stovgaard
> > > <claus.stovgaard@gmail.com> wrote:
> > > >=20
> > > > gawk is also needed for x86-64. See scripts/check-sysctl-docs
> > > > Since version 6.6 the package rules has been split up into a
> > > > rules
> > > > file
> > > > resulting in the need for make. See
> > > > scripts/package/debian/rules
> > >=20
> > > When I looked, the rules aren't actually used when we are
> > > building an
> > > out
> > > of tree module (and via make scripts prepare) indirectly.
> > >=20
> > > In a situation like this the approach I've taken to exclude the
> > > source from
> > > devsrc to keep it minimal.
> >=20
> > Okay. I will patch the do_install instead and remove the debian
> > rules
> > file. I don't see the usage either so it is fine with me.
>=20
> Just remove it in kernel-devsrc's copy of things. We can let the
> kernel continue to install them, we just don't need them in kernel-
> devsrc
> itself.
>=20

I have sent a new patch to rm the rules file - removing the need for
make, as you suggested.

> >=20
> > >=20
> > > If you are seeing gawk required as part of building a module or
> > > make
> > > scripts prepare, then we definitely do need to add the
> > > dependency.
> > >=20
> >=20
> > I can see we are including the scripts/check-sysctl-docs and
> > objdump-
> > func needing gawk - no matter the architecture.
> >=20
> > Alternative we should properly remove those also.
>=20
> We definitely can, if they are bringing in something we don't need to
> prepare the source tree for building modules.
>=20
> The ones I've added over time have all been related to that.
>=20
> Bruce
>=20

I looked a bit more into it, and I could remove the check-sysctl-docs
script, but it will still end up needing an awk.
(Also check-sysctl-docs has been there since 5.10)

A quick look revealed the folloing files.

usr/src/kernel/arch/x86/tools/gen-insn-attr-x86.awk:#!/usr/bin/awk -f
usr/src/kernel/scripts/ver_linux:#!/usr/bin/awk -f
usr/src/kernel/tools/arch/x86/tools/gen-insn-attr-86.awk:#!/usr/bin/awk
-f

My guess is that for all normal SDK's a awk/gawk has always been
present, hiding the issue. So I would suggest that we just change the
RDEPEND to cover all architectures, and not depend on some other
package include gawk.

(I only noticed the gawk issue, because I had a SDK with had the "make"
issue, and created the most basic setup to reproduce it with poky only.
For all normal SDK's I would expect it to include gawk)

What do you think Bruce?

/Claus



> >=20
> > Will split it up in two commits, and start with the "make" fix
> >=20
> > /Claus
> >=20
> >=20
> > >=20


