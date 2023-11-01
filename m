Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46A83C4167B
	for <webhook@archiver.kernel.org>; Wed,  1 Nov 2023 14:18:31 +0000 (UTC)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
 by mx.groups.io with SMTP id smtpd.web11.8309.1698848306168620209
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Nov 2023 07:18:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KeKG0lxW;
 spf=pass (domain: gmail.com, ip: 209.85.208.47, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5406c099cebso10769927a12.2;
        Wed, 01 Nov 2023 07:18:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698848304; x=1699453104; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=3SdL5tUZtoXsLzOBkE+oHV4HUeqexVFD6hgTkInjWVI=;
        b=KeKG0lxWRpHQZyc0z/Q7QCYC2yTHY7vB2/VB/Ju1aQ4xAgihVXBMyZ5nQzOXUvIK2v
         5aav/CVZzJ69yvnvwRgHvM15sLAr6V9AgYEGNhkGnzOLSaX1Bo4VMUfU6sBTxs428t+V
         iQiyyZIxIXj+M4TCvwJ7X3z3gjIC5eUHMXMx5eV7fBYSmv+jN/AYV33VAniPENxA8fP7
         3IDJabM4OCxENnvLXN3BO1gcZZJPqrvx6ruRBmbWgAuIUgXbt+SOeGUTIiZQGldVr6tG
         smxflP8fT9dTaayTQuIvc2te3JOB5GjnWG0XnnhcEolY0+8mp/RdajBOYMAEQ2mLOYYA
         n5LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698848304; x=1699453104;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3SdL5tUZtoXsLzOBkE+oHV4HUeqexVFD6hgTkInjWVI=;
        b=gu86LCHoGlfZ3nEO5XfyQbDJdvCPnyiMuQpMGfKhGIUgZaQFmpYpiWCmXSm48Rsz5I
         o6N8F99Q7ZzF22JQGT0PBgmzTsGBISoiWZEnc4v5coonSb7J2gensDo2qUa+r51WG+vg
         s7bQMWyx3SMk3/h+bNuGQ8cBwDpuFoqQJ2YVfKEO7Qzq6BMwo8Xws8fKmyhaxAQgtJVe
         42BtFUZ/ttKvuQTXtZDSr/r6PRjx/ocxFZgSAJNA40n2e4od3vYCcnwdX3pTKJmZocWY
         JplY3aLZNtH1x59FJdP6+mEKs4tRkabbGrjZe8affh+7f4Hs94KsI42QwQOV6EDu0SXu
         hoEw==
X-Gm-Message-State: AOJu0YzXZrF4eYgJLdX79dH+BRdtJ+movPGaYFRVgHUS2jY0MostorDk
	kJ/WANEWyAr4aHspBlMDDKw=
X-Google-Smtp-Source: AGHT+IEyZDzSl3dbZR+BNf+Kf3AbwQLymgpoHc19G4fibQzMD2LcqNp3va//0H5+gH2ZZIrxbw+qrw==
X-Received: by 2002:a50:aada:0:b0:543:75cb:2149 with SMTP id r26-20020a50aada000000b0054375cb2149mr3163141edc.38.1698848304244;
        Wed, 01 Nov 2023 07:18:24 -0700 (PDT)
Received: from ?IPv6:2a02:169:59a6:0:55c4:f628:91f3:4287? ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id o19-20020a509b13000000b00537963f692esm1167978edi.0.2023.11.01.07.18.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Nov 2023 07:18:23 -0700 (PDT)
Message-ID: <649b2f000761831cabd1f5737fb5b30a2ffc3654.camel@gmail.com>
Subject: Re: [OE-core] Core workflow: sstate for all, bblock/bbunlock, tools
 for why is sstate not being reused?
From: adrian.freihofer@gmail.com
To: Alexander Kanavin <alex.kanavin@gmail.com>, Richard Purdie
	 <richard.purdie@linuxfoundation.org>
Cc: openembedded-architecture
 <openembedded-architecture@lists.openembedded.org>, Michael Halstead
 <mhalstead@linuxfoundation.org>, Yocto-mailing-list
 <yocto@lists.yoctoproject.org>, ",openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>, Julien STEPHAN
 <jstephan@baylibre.com>
Date: Wed, 01 Nov 2023 15:18:22 +0100
In-Reply-To: <CANNYZj_uSknujoQUK2yV7U4N+WW_RkUH=sJnFDBfZgV0G5fv7Q@mail.gmail.com>
References: 
	<CAK5yBb9gO+WOJrv4TArzXK_1Bxu5AORp2oi=P-v=2nn6PgJE5Q@mail.gmail.com>
	 <CANNYZj9QpstUj_A8Vb2RbiaFGZkHkFjHkUfF=E1HR-nDJ_Vk6w@mail.gmail.com>
	 <81f4c191fe6dead1feec6bfc0d36aa328af1f7d4.camel@linuxfoundation.org>
	 <CANNYZj_uSknujoQUK2yV7U4N+WW_RkUH=sJnFDBfZgV0G5fv7Q@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.module_f38+17164+63eeee4a) 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Nov 2023 14:18:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189916

Hi Alex, hi Richard

The discussion looks really interesting. I would like to contribute
some comments from the point of view of a rather naive user and try to
understand the workflows for which these improvements would be
beneficial also on a bigger picture.


On Thu, 2023-09-14 at 20:51 +0200, Alexander Kanavin wrote:
> On Thu, 14 Sept 2023 at 14:56, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > For the task signatures, we need to think about some questions. If
> > I
> > make a change locally, can I query how much will rebuild and how
> > much
> > will be reused? There is bitbake --dry-run but perhaps it is time
> > for a
> > an option (or dedicated separate command?) to give some statistics
> > about what bitbake would do? How much sstate would be reused?
> >=20
> > That then logically leads into the questions, can we tell what has
> > changed? Why isn't my sstate being reused? For that we perhaps
> > should
> > define some existing scenarios where it is currently very difficult
> > to
> > work this out and then work out how we can report that information
> > to
> > the user. These could become test cases?
>=20
> So I think there are two questions here that the tools should answer:
>=20
> 1. If I would run a build, what would be missing in the cache and
> need
> to be built? The missing cache objects are in a dependency hierarchy,
> so only those missing objects with no dependecies on other missing
> objects would be printed. That should be comparatively easy to add as
> bitbake already does those checks all the time. Is there something
> else that's easily done and useful to print?
>=20
> 2. Then there's the question of *why* they are missing, which is
> harder to answer. If, say, curl:do_package is not in the cache, then
> the tool would have to walk the cache tree (I/O heavy operation as
> there is no index), make a list of all curl:do_package objects that
> are there, and do a recursive bitbake-diffsig (going up the task
> tree)
> on them vs the one we want. Then print them starting with the newest.
> Something like:
>=20

We are currently experimenting with replacing the eSDK installer with
the bitbake build environment for our users. Part of this
transformation is, of course, the shared sstate-cache, for which this
discussion seems quite relevant. The workflow we are aiming for is as
follows:

   1. Setup the layers and build config (out of scope here)
   2. Download the sstate for a particular recipe (usually an image
      recipe).
     =20
      Note: Working with SSTATE_MIRRORS does not work very well because
      bitbake connects way too often to the sstate server. So we
      started to develop a script which downloads the sstate artifacts
      into SSTATE_DIR to get the SDK set up.
     =20
      Your point 1. is basically what our (a bit hacky) download script
      does in the --dry-run mode: Printing all the required sstate
      artifacts. I think as a first step, it would be very valuable to
      have a function or a tinfoil API in the core that returns a list
      of sstate artifacts for a given recipe.
     =20
      As a second step a tool or a new feature of an existing tool
      could download the artifacts into SSTATE_DIR. This would also be
      a great successor for the not so much maintained devtool sdk-
      update command.
   3. At this point, the user is basically in the same situation as
      after installing the eSDK installer. devtool and now also bitbake
      are available, the sstate-cache is fully populated.

Maintaining such an SDK and sstate mirror infrastructure brings us to
your point 2. Tooling for maintaining the sstate cache becomes even
more important than it is now. Also, locking the sstate cache and
treating missing artifacts as errors seems to be an important feature.=C2=
=A0

But I would consider the locking/unlocking more relevant for testing
rather than for deploying locked SDKs. Unlocked SDKs allow the user to
switch the branches of the layers to commits where the sstate is not
available. If the user is in a full featured bitbake environment rather
than the constrained eSDK installer environment this is perfectly fine.
Bitbake can just compile the missing recipes.
Such an SDK would combine all the advantages of the current eSDK
installer and the much more flexible Bitbake environment. This would
imply that the sstate download script should just try to download
what's available on the mirror and maybe print a warning for artifacts
which cannot be downloaded. But it should not abort with an error for
missing artifacts.

Does that make sense?

Regrads,
Adrian

> Existing cache objects are not suitable because:
> <object id 1> was built on <date> and has a mismatching SRCREV
> <object id 2> was built on <earlier date> and has a different
> do_compile()
>=20
> > One of the big problems in the past was that we lost much of the
> > hash
> > information after parsing completed. This meant that if the hashes
> > then
> > didn't match, we couldn't tell why as the original computation was
> > lost. I did some work on allowing us to retain more of the
> > information
> > so that we didn't have to recompute it every time to be able to do
> > processing with it. I have to admit I've totally lost track of
> > where I
> > got to with that.
>=20
> Here's an idea I can't get out of my head. Right now, the cache is
> simply an amorphous mass of objects, with no information regarding
> how
> they were created. How about storing complete build confgurations as
> well into the same directory? There would be a dedicated, separate
> area for each configuration that placed objects into the cache,
> containing:
> - list of layers and revisions
> - config template used
> - complete content of build/conf
> - bitbake invocation (e.g. targets and prefixed variables like
> MACHINE etc.)
> - complete list of sstate objects that were produced as a result, so
> they can be checked for existence
>=20
> This would be written into the cache dir at the very end of the build
> when everything else is already there.
>=20
> Right now, everyone sets up their own builds first, then points
> local.conf or site.conf to the cache, and hopes for the best
> regarding
> hit rates. Having stored build configs would allow inverting the
> workflow, so that you first ask from the cache what it can provide
> (e.g. it can provide mickledore or kirkstone core-image-minimal for
> qemux86, and that's exactly what you want as a starting point), then
> you use the build config stored in the cache to set up a build, and
> run it - and that would guarantee complete sstate reuse and getting
> to
> a functional image as soon as possible. Kind of like binary distro,
> but implemented with sstate.
>=20
> Alex
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#187647):
> https://lists.openembedded.org/g/openembedded-core/message/187647
> Mute This Topic: https://lists.openembedded.org/mt/101356420/4454582
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe:
> https://lists.openembedded.org/g/openembedded-core/unsub=C2=A0[
> adrian.freihofer@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


