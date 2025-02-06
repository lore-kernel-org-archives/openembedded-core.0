Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3066C02194
	for <webhook@archiver.kernel.org>; Thu,  6 Feb 2025 20:48:47 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web11.53074.1738874918123576259
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Feb 2025 12:48:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=G+KxCdtR;
 spf=pass (domain: gmail.com, ip: 209.85.221.43, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-38be3bfb045so1572364f8f.0
        for <openembedded-core@lists.openembedded.org>; Thu, 06 Feb 2025 12:48:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738874916; x=1739479716; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N6ZJAcbN8MT8ADCVE4NTJ4k/NU9k23++EoxkT0NSeP8=;
        b=G+KxCdtRMvRoeSGsIMUn54fh//DFoWhOV9MgC2tKLEFOLPZDWP7DPGSa0q6CJ2oh1Y
         o0s7+8H2T/3gm6QQy/d7Dje7WNeC2Bc3O/rTKxCBZt4sWvZ5Szs7QzaIrI/DzaRkjj1E
         xWZbL8PyC+QAxsHcb+dwqUhNoN4jj5mdaqn+3+pxQkWPBMhwcf1N9/0/Fw3zmUkjUQYO
         q78tOGNK28T3Bz5ycHEYMCJWkwiu4dQ1ohUzEDaHDQq4cxkK2kyRcRHUf2YAFRX+Rg2w
         NR87OFWBvZEAKDqqu9sfUkC9vDqs3mxMG7AsxzgzqeCyqpZQXmIK9W8UcqPuzw3W3C3g
         6KoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738874916; x=1739479716;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=N6ZJAcbN8MT8ADCVE4NTJ4k/NU9k23++EoxkT0NSeP8=;
        b=qb5ppD0t+f8/LLE8SKGXSA3qqthsRJ2CD9ER8E8dfCE64LjLBu8L3t3y0pW+QqwIaD
         fjxx9Gem1liN+ot9NrfdGLfhzO0MWoyA9JIxQiz1Z7NVn+d7TK4EeN60MGNJSIlgXgC1
         YJEhKvGj9i6Qbel7MGoB+QUO4lgu09QOCmQsQvnQkmLI4cK1g9Ogq5s9qsfwed72omTJ
         HTO1QROsTT0hBG0WusM+a4qw2dtPkEkjd1tUSntfKLahW+6y6P7jfB5F/heWn3BMXdWR
         VKU5sVZG1+wpLExBD1A3SyvIn4q6dhsMKPAZzwqn2ff3p6rK4DzAhMEt3Ia5aks/sovH
         mtrA==
X-Forwarded-Encrypted: i=1; AJvYcCWxSBXQoIDubypuWw/6fuSe/sD6w+b9q577jl01JMPn0SRJGvsKg/mWlRZkE0fkzSModx/kNrLQt7PZyUqjwPs0NQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyBQYVzpPfZxZeAUjqOHXjQnhJmYCi/JVaoCycSkjHZ08n1VacW
	wg+rfgMYywHO7/4lI9007fGHqvPVI6FM1QbkF97wd5ZByecy54Wu
X-Gm-Gg: ASbGnct1WcqtuA33ZPqNVKYopVpXspLD2Fhcvd5b4KHH3LDjU3KvYHvc5uTmX1DSl+m
	xNxItvHP8itvDcz1STJht5QrLyxOThfp7kAaacFGSzXUJqRnv/08U50myRlM1l6ni9ZCXy6UwHp
	1bnp0yNlZJ/Yamv+dV7xgMbtW+NXvttertyCv12C+t/a0q2rFeKjGV4Ejd3+zaAZhPV78oIWRdn
	OXqY+JQ1JFByl8815seONUf0m121WACb02INzER+/hS0QkS6epvHd1BLUTquCxmNcph8jt0lxt4
	n4VDLhQdp9NblA44E7Vu4x3x+8GgYbzWGb0izs06ysct0je0hnEeUKkUoUx8cAfc
X-Google-Smtp-Source: AGHT+IHhH9bFScEWHnk7rtlxyRSpLjN/G+9fnGE+hKUpl/zsfxo9c5fI+hgou+EXZFxdpB1AsqpqQg==
X-Received: by 2002:adf:e60b:0:b0:38d:b52d:e11c with SMTP id ffacd0b85a97d-38dc994edbfmr214645f8f.15.1738874916257;
        Thu, 06 Feb 2025 12:48:36 -0800 (PST)
Received: from ?IPv6:2a02:169:59a6:0:55c4:f628:91f3:4287? ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dbdd548e2sm2574317f8f.46.2025.02.06.12.48.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 12:48:35 -0800 (PST)
Message-ID: <3b241e88ec706ebe368f1230e3bf5ba43d7de859.camel@gmail.com>
Subject: Re: [OE-core] multiple toolchains in SDK?
From: Adrian Freihofer <adrian.freihofer@gmail.com>
To: Joakim.Tjernlund@infinera.com,
 "openembedded-core@lists.openembedded.org"	
 <openembedded-core@lists.openembedded.org>, "ceggers@arri.de"
 <ceggers@arri.de>
Date: Thu, 06 Feb 2025 21:48:33 +0100
In-Reply-To: <6f0575fbc6938491c7f377314629a11c977d8fc1.camel@infinera.com>
References: <fbe1fa4c9130903dea41d988dac28af5ccca9de1.camel@infinera.com>
		 <2184595.9o76ZdvQCi@n9w6sw14>
	 <6f0575fbc6938491c7f377314629a11c977d8fc1.camel@infinera.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41app1) 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Feb 2025 20:48:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210961

On Wed, 2025-02-05 at 18:16 +0000, Joakim Tjernlund via
lists.openembedded.org wrote:
>=20
> On Fri, 2024-12-06 at 17:08 +0100, Christian Eggers wrote:
> > On Friday, 6 December 2024, 15:12:03 CET, Joakim Tjernlund via
> > lists.openembedded.org wrote:
> > > Trying to figure out how to build in SDK:
> > > gcc-arm32-musl
> > > and
> > > gcc-arm64-musl(or possibly gcc-arm64-newlib)
> >=20
> > +1
> >=20
> > We currently use ARMv7 (32 bit) with musl for our products and it
> > is possible
> > that we'll have to switch to ARMv8 for some derivatives in future.
> > As we
> > develop multiple products in parallel, having a SDK with both
> > compilers / library sets
> > would be great.
>=20
> Any luck?
>=20
> =C2=A0 Jocke
>=20
> >=20
> > >=20
> > > without using multilib(as musl do not support multilib gcc-
> > > style), also
> > > the arm64 toolchain only needs to contains static libc.a
> > >=20
> > > I cannot find how to express this in Yocto/Poky. Any pointers
> > > please?
> > >=20
> > > Jocke
> > >=20
> >=20

Hi

Since you are writing very specifically about tool chains, you probably
need the environment script that is traditionally available with the
SDK or the eSDK installer. However, an SDK installer is limited in many
ways. Supporting only one architecture is one of them.

For some releases, the same environment script has also been available
in the Bitbake environment. You can use for example
  devtool ide-sdk --mode=3Dshared
to bootstrap the SDK out of a bitbake environment as documented here:
https://docs.yoctoproject.org/dev/singleindex.html#devtool-ide-sdk-configur=
es-ides-and-bootstraps-sdks

I would argue that such an environment has many advantages over an
environment set up by an eSDK installer. But the bootstrapping of such
an SDK requires to replicate a bitbake environment, basically: the
layers, the sstate-cache and a build configuration. There are multiple
ways how this can be done:

- Here is probably the official future:
https://lists.openembedded.org/g/openembedded-core/message/210948
- layers and build configurations are in git, the sstate is shared
- And there several other tools doing this.

Therefore, it is probably more promising to make the replication of the
Bitbake environment as simple as running an SDK installer is at time,
instead of further improving the installer-based approach.

Regards,
Adrian



> >=20
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#210874):
> https://lists.openembedded.org/g/openembedded-core/message/210874
> Mute This Topic: https://lists.openembedded.org/mt/109957875/4454582
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe:
> https://lists.openembedded.org/g/openembedded-core/unsub=C2=A0[
> adrian.freihofer@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20

