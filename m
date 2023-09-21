Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A289CE71086
	for <webhook@archiver.kernel.org>; Thu, 21 Sep 2023 14:59:33 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
 by mx.groups.io with SMTP id smtpd.web10.20227.1695308367010502295
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Sep 2023 07:59:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lzapjhZI;
 spf=pass (domain: gmail.com, ip: 209.85.167.41, mailfrom: jpewhacker@gmail.com)
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-50317080342so1930862e87.2
        for <openembedded-core@lists.openembedded.org>; Thu, 21 Sep 2023 07:59:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695308365; x=1695913165; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zKCkIgrWDgXpx0u2C85ziZJ2sOyoKnql09a6ycDhqcQ=;
        b=lzapjhZI/rFdPMSiiAsz5YDAT7t+J+0fXpqqJyDuXpCelKGN7aJEFt9JuPAqp3ZR6D
         wcQ2ObwbMPypfe4ZM0x1QK8vO0jq7hxj4mFre9sSHjJv3Qy/Nr8TQhXXyGfUzTve39y5
         IofJeOdlizZdyqTCEj3KsfJ0KyFobIfGg87IHmjhkfkJH6zMgAjMvfgyVz4SFnwJkaoJ
         ww8rnoTAi0o0XWkWmgySFtxzpA/gB+8oiPDoDiS4+HLnnnS5e7yUPEe9N4HdglUaU0hx
         x9mYsuNqe7YxowkIl3sH6SZJalkIvNGNI0toQp5uXvbdh027uCDf/eRfuJrgJZVztHrV
         4z7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695308365; x=1695913165;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zKCkIgrWDgXpx0u2C85ziZJ2sOyoKnql09a6ycDhqcQ=;
        b=iVPcOOuys76CG1Q7UY5SyrtArQAX9uUsr8pDHfFseFAaKpnYEejqV44Dy97DZ08OkK
         qmHMynUue0uW4U8pRXJaEQq0longgfyQIs7nJTWXOmV5bMc6aekf0qZUIQ63TzGpg3IX
         di/R6KieheQlNS/Cdcq4ZgMpV6EdRGgtwCIEj7/O45/o0+hjm/qDfZKZr0DRoQPnMcfP
         8V3SLPFA2IpesyWRu1Ut29pfR5CUfPjI0678JCq+l7rtJq/+e1rwIezkbVob5IZWb7rV
         WFgW59VxZOhcndSDOg36cHqOjTkVgmd27HmtkRVh25ejQTW+3YFpFLTQ8e5lNbgAKOSg
         LPsg==
X-Gm-Message-State: AOJu0YxFl5rUkSGwqXBL+zov0aCIQc5cL3E4j2YBhDtDWFlbdsdZnMf7
	4vEyo0QxgH4qkkjqRLpu5dlRrstzMqJST339Zjg=
X-Google-Smtp-Source: AGHT+IHjKEghmYMpYX9kVVzZLPlap3N6mVc/anGkg3tW1KzGzCAWL00cE53vyzVAuDVYiaEKZPMU+dZqckt99UCUpLI=
X-Received: by 2002:a05:6512:3105:b0:503:1bb0:a658 with SMTP id
 n5-20020a056512310500b005031bb0a658mr5823709lfb.32.1695308364741; Thu, 21 Sep
 2023 07:59:24 -0700 (PDT)
MIME-Version: 1.0
References: <20230921101337.090BDB257EA@pc37511-1950.se.axis.com> <f7163bde7ebb71d14c7abaf1299bf12e5b6c8ec1.camel@linuxfoundation.org>
In-Reply-To: <f7163bde7ebb71d14c7abaf1299bf12e5b6c8ec1.camel@linuxfoundation.org>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Thu, 21 Sep 2023 08:59:12 -0600
Message-ID: <CAJdd5GbhFLFxp43s4Vx3Q6B8W+CZ_MUMhkiF9wP6S8e_C3jizA@mail.gmail.com>
Subject: Re: [OE-core] Findings from using Hash Equivalence server
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Tobias Hagelborn <tobias.hagelborn@axis.com>, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Sep 2023 14:59:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188012

On Thu, Sep 21, 2023 at 6:38=E2=80=AFAM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Thu, 2023-09-21 at 12:13 +0200, Tobias Hagelborn wrote:
> > Findings from using Hash Equivalence server at scale:
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
> >
> > We have now used the OE Hash Equivalence server at scale in our C/I cha=
in at our company.
> > This has given some insights in what works and what can be improved whe=
n running this
> > service in full production.
> >
> > Some stats from our run:
> > ------------------------
> >
> > ### Hash Equivalence server:
> > * ~30M reqs/day
> > * ~500K new entries/day
> > * 2-3K reqs/s
> > * Data growth ~10GiB/day (with dbg info)
> >
> > ### C/I Builds:
> > * ~20K builds/day
> > * 15-20K tasks/build
> > * 140K sstate misses/day.
>
> These are really interesting numbers, thanks for sharing!

Very cool!

>
> > The good:
> > ---------
> > * It works! It finds reusable sstate tasks (in all of our builds)
> > * It is very valuable in recipes that invalidate
> >   almost any other package. (Examples: glib, openssl)
> > * Hashserve scales to the need even if only running one instance
> >   - Tested for 12K req/s which was sufficient for our needs
> > * Robust enough (if no external cleanup takes place)
> >   - _No_ non-recoverable crashes during 300M requests served
> >
> > The client site (Bitbake):
> > --------------------------
> > We have added a sanity check that disables the use of a remote HE serve=
r and switches
> > to a local one if the remote HE server cannot be connected. This is don=
e from the
> > "ConfigParsed" event. The reason for this is to avoid builds hanging in=
 case
> > the remote HE server is not responding.
>
> I'd have to see what that patch looked like but I get nervous about
> builds changing from the users configuration without the user making
> that change. If it shows a suitable warning it might be ok.
>
> ConfigParsed is a horrible place to do such a thing too. I know why
> you've done that but it would probably be better in the hashserve
> client code itself from an upstream perspective if you plan to submit
> it.
>
> > Areas of improvement:
> > ---------------------
> >
> > ### Data retention:
> > There is no built in data-retention. Solving this with recurring extern=
al
> > cleanup script. It works but also exposed locking in the server resulti=
ng
> > in inter-lock with the external cleanup and timeout for the clients.
> > This can partially be the nature of SQLite and a single file database.
> > OE Hashserve is not built for cleaning up data and the data growth is h=
igh so
> > it has to be handled.
> >
> > ### Protocol:
> > As our first tested option for deployment was Kubernetes, the absence o=
f the de-facto
> > standard HTTP(s) protocol required some workarounds.
> > Routing, authentication and monitoring support gets lost on the way. I =
would suggest that we
> > look into using HTTP(s) + JSON and some Basic Auth as the next basis of=
 the protocol.
>
> We did a lot of work to make answers "fast" from the server. To make
> 12k req/s possible, we couldn't use high level protocol like http, let
> alone https or signing. I would therefore caution that if you change it
> like this, it will no longer perform anywhere near as fast as you
> require and there would be knock on effects from that.

I think there are options here, like websockets that would perform at
pretty much the same levels and be compatible with web based
infrastructure, but it would take some effort. The trickier part is
making sure it's optional in the bitbake core, because it's not the
thing you want to do without using external python modules, and
bitbake core doesn't want to depend on external modules (by default
anyway). Once the websocket is established, the protocol is identical
so most of the bitbake code would be unchanged; it would only affect
how the connection is actually established with the server. I
architected the code with this in mind initially, so I think it's
mostly a matter of the logistics of how to implement it in bitbake.

On the server side, you'd want to make a stateless frontend HE service
that could talk to a backend database service so you can do all the
high availability and DB replication at scale. It's been on my TODO
list to write a server that works this way for a while (I think it
would be a separate project outside of bitbake), since it's hard to
have a client with no server to talk to :)

>
> > ### Security:
> > Supply-chain attacks is nowadays something to be aware of. This service=
 uses a
> > non encrypted and non authenticated protocol and is thus open to man-in=
-the-middle
> > attacks, or any type of fake data and manipulation. The protocol change=
s suggested above
> > could mitigate some of this. Additionally, one thought is for the clien=
t to
> > provide a signature of the hash together with the hash so that it can b=
e verified by the client using
> > it's secret upon retrieval.
>
> We've made the assumption that the write access ports would be under
> some kind of network control. For public services like the one the
> project shares, there is a risk of man-in-the-middle attacks but it
> would only really be exploitable if you can change the sstate being
> accessed too and if you can do that, you already have breached
> security.
>
> I suspect adding signing is going to affect speed a lot too
> unfortunately. We probably do need to think about what to do about all
> this but it isn't straightforward.

IIRC switching to a modern web infrastructure solves most of these
problems, since you can do SSL/client certificates/whatever much more
transparently without the server & client really having to know a
whole lot about it.

>
> > ### External database connection
> > An option for an external DB (For example PostgreSQL) would improve the
> > possibility for concurrent cleanup and vacuum while running.
> > In the stateless world of cloud/containers/pods, an option for external=
 DB
> > would be favorable.
> > This would probably make use of some external package for DB interactio=
n so it would
> > differ a little from the standard python only nature of Bitbake in gene=
ral.
> >
> > ### Nice to have
> > - Minor changes that should be more easily added as patches
> >
> > * Hash (LRU) cache. From our stats, there seem to be a 1:20 ratio in wr=
ites to reads
> >   from the DB so a cache might save some resources.
> >
> > Conclusions
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > Hashserve is FOSS and if we want improvements, we have to contribute.
> > I will investigate to what extent we can chip in on some of these parts=
.
> > However, especially for the protocol and maybe also on external Python
> > dependencies, via PyPI, it would be nice to know if this is acceptable =
and
> > wished-for changes, before starting out.
>
> I know Joshua has had plans for a different version of hashserve using
> more scalable technology which we can't include directly in bitbake due
> to dependency issues. We had planned to keep the protocol simple and
> minimal so other server implementations were possible.
>
> We haven't really thought about supporting multiple client protocols,
> it would be possible if there are compelling reasons but it obviously
> would increase our complexity a lot and be hard to ensure everything
> says working with suitable testing.
>
> Cheers,
>
> Richard
>
>

