Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AAD7EEAA6E
	for <webhook@archiver.kernel.org>; Thu, 14 Sep 2023 19:54:13 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web11.4414.1694721249787294871
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Sep 2023 12:54:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=P2CtL1Mu;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-31ad779e6b3so1268330f8f.2
        for <openembedded-core@lists.openembedded.org>; Thu, 14 Sep 2023 12:54:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1694721248; x=1695326048; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=YBP2PDOG5YQjNI+KzfY/fyafX0oLfnTanVvEIDF+YFk=;
        b=P2CtL1MuCAkWIeJXl/u1fDABylr9lglMqBk0J9dyT/CeMinHrgv0KZWk154+TJU3w6
         svjn1SP0xjpqEeOjGWwYor9lXjLAUUJoFH7WgjBceFmgJY8lU5PcurTWyNAKS7bNEAnL
         vsiI3P8vOLl/iWxoTNFQIs7xFHPBJUSaCEh5s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694721248; x=1695326048;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YBP2PDOG5YQjNI+KzfY/fyafX0oLfnTanVvEIDF+YFk=;
        b=JCWrCDr4HswWLPcMRxjU+5ZE8JgGbMg/DndBHAn9hUZATFik/NVvcKkGC8YIoZ6a1K
         aOohb67Ke1P8pjblCKb38ume3iMiP0sFI2rNTHkiC4/8t0L8edWjQ2nCDaH7AwUKrj2p
         3kfRGWfAsiXdCyGmkM2eYVoWMd+wE3lexx0u8Xn5PPvLJLFHSJRvqADR45JmPr9xze/i
         ue34NWniwnjOhsmZgH5Uhc7Ny0uqWO9uBM3/tco5/UDzxCIoNiyviRTGBlfl0Og3F4G1
         dZetgOfEWRLM9sSdqPf0kF++NAMNnWlCzwC50bOgklDY+CZfEU5dJKwEvvydQT4CfK60
         ecvw==
X-Gm-Message-State: AOJu0YySqqbQ48mkUKo1714FlRySD0diYne3bC3EeIOCof1UG9U492y9
	vd64UDfUnBiVbRWVmThoTg7fpw==
X-Google-Smtp-Source: AGHT+IHjOKDODsG769Wf8VqzF/rWyF+GQOfDXQDgb0jx0/HuI7PGP1H9TLCTGeyJD5nEUpSsfsJnqg==
X-Received: by 2002:a5d:67c8:0:b0:319:6d91:28bf with SMTP id n8-20020a5d67c8000000b003196d9128bfmr5513758wrw.60.1694721248116;
        Thu, 14 Sep 2023 12:54:08 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:93a7:bb97:496b:8932? ([2001:8b0:aba:5f3c:93a7:bb97:496b:8932])
        by smtp.gmail.com with ESMTPSA id g14-20020a5d698e000000b0031759e6b43fsm2546888wru.39.2023.09.14.12.54.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Sep 2023 12:54:07 -0700 (PDT)
Message-ID: <5ef99df95ab74e74df6f1e07ef4877487230d9fe.camel@linuxfoundation.org>
Subject: Re: Core workflow: sstate for all, bblock/bbunlock, tools for why
 is sstate not being reused?
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-architecture
 <openembedded-architecture@lists.openembedded.org>, Michael Halstead
 <mhalstead@linuxfoundation.org>, Yocto-mailing-list
 <yocto@lists.yoctoproject.org>, ",openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>, Julien STEPHAN
 <jstephan@baylibre.com>
Date: Thu, 14 Sep 2023 20:54:05 +0100
In-Reply-To: <CANNYZj_uSknujoQUK2yV7U4N+WW_RkUH=sJnFDBfZgV0G5fv7Q@mail.gmail.com>
References: 
	<CAK5yBb9gO+WOJrv4TArzXK_1Bxu5AORp2oi=P-v=2nn6PgJE5Q@mail.gmail.com>
	 <CANNYZj9QpstUj_A8Vb2RbiaFGZkHkFjHkUfF=E1HR-nDJ_Vk6w@mail.gmail.com>
	 <81f4c191fe6dead1feec6bfc0d36aa328af1f7d4.camel@linuxfoundation.org>
	 <CANNYZj_uSknujoQUK2yV7U4N+WW_RkUH=sJnFDBfZgV0G5fv7Q@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Sep 2023 19:54:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187648

On Thu, 2023-09-14 at 20:51 +0200, Alexander Kanavin wrote:
> On Thu, 14 Sept 2023 at 14:56, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > For the task signatures, we need to think about some questions. If I
> > make a change locally, can I query how much will rebuild and how much
> > will be reused? There is bitbake --dry-run but perhaps it is time for a
> > an option (or dedicated separate command?) to give some statistics
> > about what bitbake would do? How much sstate would be reused?
> >=20
> > That then logically leads into the questions, can we tell what has
> > changed? Why isn't my sstate being reused? For that we perhaps should
> > define some existing scenarios where it is currently very difficult to
> > work this out and then work out how we can report that information to
> > the user. These could become test cases?
>=20
> So I think there are two questions here that the tools should answer:
>=20
> 1. If I would run a build, what would be missing in the cache and need
> to be built? The missing cache objects are in a dependency hierarchy,
> so only those missing objects with no dependecies on other missing
> objects would be printed. That should be comparatively easy to add as
> bitbake already does those checks all the time.

Right, what we lack is a way for the user to ask this and see the
result easily. As you say, bitbake can do this already.

>  Is there something else that's easily done and useful to print?

I think there is also the scenario of:
"I've run a build and have an existing TMPDIR and stamp info. I've now
pulled in a change. How much is going to rebuild and more importantly
*why*?"

This is different to a remote sstate situation as you have the stamp
info of the previous build already there to compare against.

> 2. Then there's the question of *why* they are missing, which is
> harder to answer. If, say, curl:do_package is not in the cache, then
> the tool would have to walk the cache tree (I/O heavy operation as
> there is no index), make a list of all curl:do_package objects that
> are there, and do a recursive bitbake-diffsig (going up the task tree)
> on them vs the one we want. Then print them starting with the newest.
> Something like:
>=20
> Existing cache objects are not suitable because:
> <object id 1> was built on <date> and has a mismatching SRCREV
> <object id 2> was built on <earlier date> and has a different do_compile(=
)

In theory you can do an:

ls sstate/*/*/sstate:curl:corei7-64-poky-linux:<PV>:<PR>:corei7-64:10:*_pac=
kage.tar.zst

and get a list of possible objects. Some key information was put into
the cache file names for this reason. Obviously this becomes much
trickier when the sstate is remote over http though.

"newest" is problematic in this context as you really want the closest
match. There is no concept of build date in the cache as it often isn't
relevant (building an old release for example). The only point a
date/time is used is for cleaning out the cache for files which haven't
been accessed in a long time.

The tools are already supposed to support doing this with local file
sstate sources, they just do a bad job at getting the diffs right. One
intent of this work item was to try and understand why they don't work
and address that so at least for filesystem sstate mirrors, you can get
better results. I don't know how we solve the remote http issue as yet.

> > One of the big problems in the past was that we lost much of the hash
> > information after parsing completed. This meant that if the hashes then
> > didn't match, we couldn't tell why as the original computation was
> > lost. I did some work on allowing us to retain more of the information
> > so that we didn't have to recompute it every time to be able to do
> > processing with it. I have to admit I've totally lost track of where I
> > got to with that.
>=20
> Here's an idea I can't get out of my head. Right now, the cache is
> simply an amorphous mass of objects, with no information regarding how
> they were created. How about storing complete build confgurations as
> well into the same directory? There would be a dedicated, separate
> area for each configuration that placed objects into the cache,
> containing:
> - list of layers and revisions
> - config template used
> - complete content of build/conf
> - bitbake invocation (e.g. targets and prefixed variables like MACHINE et=
c.)
> - complete list of sstate objects that were produced as a result, so
> they can be checked for existence
>=20
> This would be written into the cache dir at the very end of the build
> when everything else is already there.

I'm not sure this helps as much as you'd like. For example I build
core-image-sato-sdk on the autobuilder and populate this but you want
to build core-image-sato locally. There would be no info here that
would help with information about what core-image-sato would need,
despite the fact we know one is a derivative of the other and there
would be a near full cache for it.

Taking your example above and curl:do_package, how would the list of
information above tell us why it wasn't and what the configuration
difference was? It can tell us a set of different configs which result
in hashes but not how an unknown hash may differ from the existing
configs. The best you could do is iterate the configs and see which one
got you closest to what you have but I suspect that may be even more
expensive that the sstate search mentioned above, indexing of http
aside.

I can see it helping for some limited debug scenarios but the
information you want is really mostly what is already being encoded
into the sstate filename.

Running with that thought, if that information is what we really need,
should be we indexing it and sharing through some kind of hash
equivalence like service to provide the index?


> Right now, everyone sets up their own builds first, then points
> local.conf or site.conf to the cache, and hopes for the best regarding
> hit rates. Having stored build configs would allow inverting the
> workflow, so that you first ask from the cache what it can provide
> (e.g. it can provide mickledore or kirkstone core-image-minimal for
> qemux86, and that's exactly what you want as a starting point), then
> you use the build config stored in the cache to set up a build, and
> run it - and that would guarantee complete sstate reuse and getting to
> a functional image as soon as possible. Kind of like binary distro,
> but implemented with sstate.

Effectively those "configs" are what the eSDK is, you're just proposing
a server side set of them rather than a built copy. In many ways that
could be useful way of possibly rethinking the way the eSDK works.

So in that sense I like the idea, we should just be clear the problem
it solves as it doesn't solve the "why is my build not using the cache"
question specifically but it potentially solves other issues.

Cheers,

Richard

