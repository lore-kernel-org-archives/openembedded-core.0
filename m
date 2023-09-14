Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55AD1CA553C
	for <webhook@archiver.kernel.org>; Thu, 14 Sep 2023 12:56:09 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web11.11492.1694696165464520871
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Sep 2023 05:56:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=dRJiAhDW;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-31dcf18f9e2so846774f8f.0
        for <openembedded-core@lists.openembedded.org>; Thu, 14 Sep 2023 05:56:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1694696164; x=1695300964; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=0DRjHzof5KsmG7D163vLCZ+HiRokeCij4s+D9uGfYTs=;
        b=dRJiAhDWAFi6xLFeJgCjK2ZeyICUY3gkt52TFrRbVaijN95Lw4EaNyB9WfJY+RYxDy
         lqeYvmHNe+UvVjj/sJXtYabVpvOL2XTjulrpxXn3W715XBGyqId97M8x8HqAgqqXRXh0
         MdYx+J2wFSZUX0cUlvsT5nOR1mma0OKiCFRS4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694696164; x=1695300964;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0DRjHzof5KsmG7D163vLCZ+HiRokeCij4s+D9uGfYTs=;
        b=oPyB6B3k9orapdo/vOwjO2MeV6XFKG4WBzJDXNcBEv1MoFqKNLDysXDTbxpTipwm/B
         pErU2C6LcUHFe58ZnEAxbDLQyNEG3VMNuVoj4urlPWMXp4QWpDKGtLTO17K71z9f1Rn+
         7NciD86h6jpTAxJib5FPIV9FbQkp/ncY1FoJpBAuDczkZeeDB+rNoy8cX3cfKZWAYVk+
         ORvm3mXbU3pi0n/qril8R8bKjKal9N+C9Q9XB10h7uZJaNIHlh54nerEWo2VVqRwjXf5
         He7Oi2ypEPqJX7TJn7BspSJ5BEd2DdHNoi6r6GjgEg0/wCzh7LHt14aDEp54NqAqe0ZV
         Mf2A==
X-Gm-Message-State: AOJu0YwBmfOwpk9J8lGZSg4oGABV/XbcsRT9lemnSgz6lGQBH+zHDvqd
	XfrbydTs8rIq+UImpdQjETPl3g==
X-Google-Smtp-Source: AGHT+IHcIintTkXXNumFfnwHxUcsEfptiDR1a+wUTQ6xqT5Obd2u+k9uGWUI4dyMIQLrgcMhYrVVCQ==
X-Received: by 2002:a5d:624e:0:b0:319:7b66:7803 with SMTP id m14-20020a5d624e000000b003197b667803mr4170659wrv.55.1694696163769;
        Thu, 14 Sep 2023 05:56:03 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:a6e7:41e3:896b:6b97? ([2001:8b0:aba:5f3c:a6e7:41e3:896b:6b97])
        by smtp.gmail.com with ESMTPSA id q5-20020a5d6585000000b0031f5f0d0be0sm1730434wru.31.2023.09.14.05.56.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Sep 2023 05:56:03 -0700 (PDT)
Message-ID: <81f4c191fe6dead1feec6bfc0d36aa328af1f7d4.camel@linuxfoundation.org>
Subject: Re: Core workflow: sstate for all, bblock/bbunlock, tools for why
 is sstate not being reused?
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>, openembedded-architecture
	 <openembedded-architecture@lists.openembedded.org>, Michael Halstead
	 <mhalstead@linuxfoundation.org>
Cc: Yocto-mailing-list <yocto@lists.yoctoproject.org>, 
	",openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>, Julien STEPHAN
	 <jstephan@baylibre.com>
Date: Thu, 14 Sep 2023 13:56:02 +0100
In-Reply-To: <CANNYZj9QpstUj_A8Vb2RbiaFGZkHkFjHkUfF=E1HR-nDJ_Vk6w@mail.gmail.com>
References: 
	<CAK5yBb9gO+WOJrv4TArzXK_1Bxu5AORp2oi=P-v=2nn6PgJE5Q@mail.gmail.com>
	 <CANNYZj9QpstUj_A8Vb2RbiaFGZkHkFjHkUfF=E1HR-nDJ_Vk6w@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Sep 2023 12:56:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187640

On Thu, 2023-09-14 at 13:52 +0200, Alexander Kanavin wrote:
> On Tue, 12 Sept 2023 at 16:44, Stephen Jolley <sjolley.yp.pm@gmail.com> w=
rote:
> > Alexander Kanavin will be working on the core workflow topic
>=20
> I am now ready to start doing this, but before I do, I'd like to
> decompose the subject into manageable tasks with a bit of help from RP
> and the community:
>=20
> https://www.yoctoproject.org/community/yocto-project-engineering-request-=
for-quotation/
>=20
> =3D=3D=3D=3D
> Core Workflow =E2=80=93 Process Improvements
>=20
> Background
>=20
> The project builds everything from source by default. This means it
> has a reputation for being slow and heavy. There are ways the project
> can accelerate this which means faster workflows and improved
> developer experience but these are currently cumbersome to use.
>=20
> Rationale
>=20
> The project aims to defragment customised embedded Linux. This is
> important as if we succeed at this, it gives benefits to the wider
> ecosystem through making it easier to inject security fixes and an
> ability to share and collaborate without re-inventing the wheel.
>=20
> To do this, we need to provide best-in-class support and compete
> against binary distributions for usability and speed. One way we can
> do this is provide better support for binary artifacts via our sstate
> mechanism. We do already have some of this functionality in our
> =E2=80=9Cextensible SDK=E2=80=9D or =E2=80=9CeSDK=E2=80=9D.
>=20
> Deliverables
>=20
> Enable a public sstate mirror via a content delivery network (CDN) and
> populate using the autobuilder
> Ensure CDN sstate is reused under normal use case scenarios,
> particularly for slow components like rust-native. Identify any common
> sstate mismatch causes. Ensure test cases are added to cover the use
> cases and prevent regressions.
> Add lock and unlock commands to allow specific components to be locked
> down to specific sstate checksums or allow them to vary
> Allow switching between eSDK and non-eSDK modes
> Add tooling so we can understand why something is rebuilding when it
> isn=E2=80=99t expected to.
> =3D=3D=3D=3D=3D=3D=3D
>=20
> So: where to start? Do we need to 'design' something, or maybe time
> should go directly into addressing specific sore points? All feedback
> welcome.
>=20
> There's also an unfinished patchset for adding bblock/bbunlock, which
> I would prefer to *not* 'take over and finish' but rather see the
> author get it merged:
> https://patchwork.yoctoproject.org/project/oe-core/list/?series=3D15276

To start with I'll try and write down and give a random walk through my
thoughts.

Certainly we need to get something like that patchset over the line. I
think it was blocked on a reply to this email:

https://lists.openembedded.org/g/openembedded-core/message/186497

which has suffered whilst I was pulled into the qemuppc mess. I feel
bad for not getting to a reply to that.

There are design elements to this work. We need to work out how we can
make eSDK and "normal" builds more similar and less of an overhead to
switch between one and the other. A "bblock all" command does partly
get you to an eSDK effectively so part of this may be switching eSDK to
use the new lock command. What other differences are there? What other
differences are necessary or make sense for the use cases eSDK was
designed for? How would you turn an existing build into an eSDK like
one? Could you provide a copy of a local build to someone else easily
using something like eSDK's tooling? What does the eSDK look like at
the end of this. One section we don't have good answers to yet is setup
and configuration although I know you've started on some of that.

For the task signatures, we need to think about some questions. If I
make a change locally, can I query how much will rebuild and how much
will be reused? There is bitbake --dry-run but perhaps it is time for a
an option (or dedicated separate command?) to give some statistics
about what bitbake would do? How much sstate would be reused?

That then logically leads into the questions, can we tell what has
changed? Why isn't my sstate being reused? For that we perhaps should
define some existing scenarios where it is currently very difficult to
work this out and then work out how we can report that information to
the user. These could become test cases?

One of the big problems in the past was that we lost much of the hash
information after parsing completed. This meant that if the hashes then
didn't match, we couldn't tell why as the original computation was
lost. I did some work on allowing us to retain more of the information
so that we didn't have to recompute it every time to be able to do
processing with it. I have to admit I've totally lost track of where I
got to with that.

Michael Halstead will be working on setting the CDN up so I'll let him
comment on when we'll have things ready for testing with that. We do
already have sstate shared from the autobuilder so some basic tests to
make sure our "base" shared files do work as expected is something
which can happen there already.

Another interesting question - would the project be interested in
shipping "locked" hashes for a minimal subset of recipes such as rust-
native and maybe the cross compilers to bootstrap and speed people's
builds, assuming they have a fast network? What does the size of those
pieces look like and would it be useful/effective?

Probably more questions than answers here but it hopefully gives a bit
more insight into some of the directions I'm thinking about.

Cheers,

Richard






