Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E10CE71064
	for <webhook@archiver.kernel.org>; Thu, 21 Sep 2023 12:38:36 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web11.15602.1695299909565303576
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Sep 2023 05:38:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Psp6r6DY;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-405361bba99so4430405e9.2
        for <openembedded-core@lists.openembedded.org>; Thu, 21 Sep 2023 05:38:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1695299908; x=1695904708; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=j5mLiD6XBli7CnTdnGqNqIb1GpiYfvXrn050vUtiXxc=;
        b=Psp6r6DYOiHQSyayc4v+NXTg4W+lwUtmgkazpA1OJuWrrnJvkMtKHw/JguuRBNhFSV
         HyrJa5wHxFt/uwSnOrf4gQl5dmk3kJ9d4sAPCVLgRD0Zfjd/lbXuI5nFwmZTBAlLF3M3
         zFu22fvWF5FKT7E1eZLjEiuaFO74lRkUHwyn4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695299908; x=1695904708;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=j5mLiD6XBli7CnTdnGqNqIb1GpiYfvXrn050vUtiXxc=;
        b=bAsJBYRzWJMkn4nofuBtS7MKzNoOHulvPD2mL0Vp8moK5Wzx8Taa1SHdYzxT0edOE8
         D+yEbU0oypb723bqKSs/NwdhWdJ4AtLodQKL0VblkizQQFldwsNn5wkr6H9JfU/xNtY2
         Bfq0Ns9T5mrR9Gq2EcpneLrmuRxJ02wXVjL5nmwT8yyiUPl2tB/e+ahymQFWX2VbnTmW
         cqCBINb7lBRlza03B0OHF1iWnYerhFbz4dNw+8tGanCEiay9o+6EPWoZFQ01DaJx4c0Q
         R352l1B1qJAZHEdNxUw1AZd3uZRZVyDOewG9DkpUVAsoOZTqXWNai7LaGIOlncBAu5Fc
         nqxg==
X-Gm-Message-State: AOJu0YxroLQ83xLFtRRiW7B991h6b7MklmgtzRXGNi2qelb9yrizb5wV
	DYxWfjrgjc0ItG38PUyA0/5FnQ==
X-Google-Smtp-Source: AGHT+IHRsrx0aNQgizo6KuvHAtt7fHl4ldAjayH1sId1nQpUYty9/vbZ7KzKLIZUnIFeXymVRdmzSg==
X-Received: by 2002:a7b:cd9a:0:b0:3fe:5053:1a0b with SMTP id y26-20020a7bcd9a000000b003fe50531a0bmr4751723wmj.11.1695299907897;
        Thu, 21 Sep 2023 05:38:27 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:a109:22f2:cbec:fa4e? ([2001:8b0:aba:5f3c:a109:22f2:cbec:fa4e])
        by smtp.gmail.com with ESMTPSA id s13-20020a5d424d000000b0031753073abcsm1667224wrr.36.2023.09.21.05.38.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Sep 2023 05:38:27 -0700 (PDT)
Message-ID: <f7163bde7ebb71d14c7abaf1299bf12e5b6c8ec1.camel@linuxfoundation.org>
Subject: Re: [OE-core] Findings from using Hash Equivalence server
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Tobias Hagelborn <tobias.hagelborn@axis.com>, 
	openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Date: Thu, 21 Sep 2023 13:38:26 +0100
In-Reply-To: <20230921101337.090BDB257EA@pc37511-1950.se.axis.com>
References: <20230921101337.090BDB257EA@pc37511-1950.se.axis.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Sep 2023 12:38:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187993

On Thu, 2023-09-21 at 12:13 +0200, Tobias Hagelborn wrote:
> Findings from using Hash Equivalence server at scale:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
>=20
> We have now used the OE Hash Equivalence server at scale in our C/I chain=
 at our company.
> This has given some insights in what works and what can be improved when =
running this
> service in full production.
>=20
> Some stats from our run:
> ------------------------
>=20
> ### Hash Equivalence server:
> * ~30M reqs/day
> * ~500K new entries/day
> * 2-3K reqs/s
> * Data growth ~10GiB/day (with dbg info)
>=20
> ### C/I Builds:
> * ~20K builds/day
> * 15-20K tasks/build
> * 140K sstate misses/day.

These are really interesting numbers, thanks for sharing!

> The good:
> ---------
> * It works! It finds reusable sstate tasks (in all of our builds)
> * It is very valuable in recipes that invalidate
>   almost any other package. (Examples: glib, openssl)
> * Hashserve scales to the need even if only running one instance
>   - Tested for 12K req/s which was sufficient for our needs
> * Robust enough (if no external cleanup takes place)
>   - _No_ non-recoverable crashes during 300M requests served
>=20
> The client site (Bitbake):
> --------------------------
> We have added a sanity check that disables the use of a remote HE server =
and switches
> to a local one if the remote HE server cannot be connected. This is done =
from the
> "ConfigParsed" event. The reason for this is to avoid builds hanging in c=
ase=20
> the remote HE server is not responding.

I'd have to see what that patch looked like but I get nervous about
builds changing from the users configuration without the user making
that change. If it shows a suitable warning it might be ok.=C2=A0

ConfigParsed is a horrible place to do such a thing too. I know why
you've done that but it would probably be better in the hashserve
client code itself from an upstream perspective if you plan to submit
it.

> Areas of improvement:
> ---------------------
>=20
> ### Data retention:
> There is no built in data-retention. Solving this with recurring external
> cleanup script. It works but also exposed locking in the server resulting
> in inter-lock with the external cleanup and timeout for the clients.
> This can partially be the nature of SQLite and a single file database.
> OE Hashserve is not built for cleaning up data and the data growth is hig=
h so
> it has to be handled.
>=20
> ### Protocol:
> As our first tested option for deployment was Kubernetes, the absence of =
the de-facto
> standard HTTP(s) protocol required some workarounds.
> Routing, authentication and monitoring support gets lost on the way. I wo=
uld suggest that we
> look into using HTTP(s) + JSON and some Basic Auth as the next basis of t=
he protocol.

We did a lot of work to make answers "fast" from the server. To make
12k req/s possible, we couldn't use high level protocol like http, let
alone https or signing. I would therefore caution that if you change it
like this, it will no longer perform anywhere near as fast as you
require and there would be knock on effects from that.

> ### Security:
> Supply-chain attacks is nowadays something to be aware of. This service u=
ses a
> non encrypted and non authenticated protocol and is thus open to man-in-t=
he-middle
> attacks, or any type of fake data and manipulation. The protocol changes =
suggested above
> could mitigate some of this. Additionally, one thought is for the client =
to=20
> provide a signature of the hash together with the hash so that it can be =
verified by the client using
> it's secret upon retrieval.

We've made the assumption that the write access ports would be under
some kind of network control. For public services like the one the
project shares, there is a risk of man-in-the-middle attacks but it
would only really be exploitable if you can change the sstate being
accessed too and if you can do that, you already have breached
security.

I suspect adding signing is going to affect speed a lot too
unfortunately. We probably do need to think about what to do about all
this but it isn't straightforward.

> ### External database connection
> An option for an external DB (For example PostgreSQL) would improve the=
=20
> possibility for concurrent cleanup and vacuum while running.
> In the stateless world of cloud/containers/pods, an option for external D=
B
> would be favorable.
> This would probably make use of some external package for DB interaction =
so it would
> differ a little from the standard python only nature of Bitbake in genera=
l.
>=20
> ### Nice to have
> - Minor changes that should be more easily added as patches
>=20
> * Hash (LRU) cache. From our stats, there seem to be a 1:20 ratio in writ=
es to reads
>   from the DB so a cache might save some resources.
>=20
> Conclusions
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> Hashserve is FOSS and if we want improvements, we have to contribute.
> I will investigate to what extent we can chip in on some of these parts.
> However, especially for the protocol and maybe also on external Python
> dependencies, via PyPI, it would be nice to know if this is acceptable an=
d
> wished-for changes, before starting out.

I know Joshua has had plans for a different version of hashserve using
more scalable technology which we can't include directly in bitbake due
to dependency issues. We had planned to keep the protocol simple and
minimal so other server implementations were possible.

We haven't really thought about supporting multiple client protocols,
it would be possible if there are compelling reasons but it obviously
would increase our complexity a lot and be hard to ensure everything
says working with suitable testing.

Cheers,

Richard



