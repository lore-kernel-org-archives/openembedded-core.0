Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 671A4EEAA66
	for <webhook@archiver.kernel.org>; Thu, 14 Sep 2023 18:51:52 +0000 (UTC)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
 by mx.groups.io with SMTP id smtpd.web11.2767.1694717502498009299
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Sep 2023 11:51:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=Pjz51mqb;
 spf=pass (domain: gmail.com, ip: 209.85.208.177, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2bcb0b973a5so20412411fa.3;
        Thu, 14 Sep 2023 11:51:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694717500; x=1695322300; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=bZR6QcZk0zSg2X3ROLO14x6+CABHijjl2lebPDD2/ps=;
        b=Pjz51mqbnyp/r8cFbkuKt2OWaYBdWW58woBrv+3PZVFs7HRlULVqSZ4ZsmdRUqqPp+
         eAr95xPdeKYhq8n9YThCUrQeilAKlZVm6e205FrQwDzSukVrrNAgr5FUDH/sFKvJSMfL
         /P8xTTHHyv7//u/BmZTTSmEjjUuD5zr8Dye1JIpPqg2rN9tG1GJm2j7akBcYVXGcNSjn
         +HVe8Or6Za8j+yrKPwO5bc7Si34bOZ3XvqCecUzpGHLWs7+M6Qe51zhrb8Aj24Dv2Kgp
         XBRzHBxYbtuBU2Qu03nFoPyqA7iTRsE3qEXvztNqqmtDogrigD5Yc4JssCpBUobJWDCA
         Kxmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694717500; x=1695322300;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bZR6QcZk0zSg2X3ROLO14x6+CABHijjl2lebPDD2/ps=;
        b=KjUbxOb+9+dnCJSJbp3MQv7zGlP49zwST73AZxIyqzHRrLzpEbIOOwpyMnD87qsU3q
         Vy4W9Cs9lGNb7D4WLBNpuVgbArywnz/qSt6IL1oP8YcXSKNfptZSnC3ltc5IPSXdJ+Yc
         bx+x0fZduFobbTZ9QsawVHScpFaYGF3+8jEnXB/3W9QdyZyn0E/2eqIeI2ZDwEwdup6W
         L9zBCQztHxSNP/U/qktzYQvjKJaLpueQIKqvHaBMLpGvxIDA8qUvMOjQff2zXQ7N2f1c
         6QEHUqJwzYc91gsN2XfB724ymduzkngwbMKDgYyNGfaFfqhyhLg1RlfEwJ8mYLIy/07b
         sjZA==
X-Gm-Message-State: AOJu0YyMTM2TOIklpSl0bi+vjrTd07mCuG3g2jF8QfISSQq3VkHdgDls
	6dHH3ulEB0wiFPw0Lz91oaL+ia/P2i6gm0hWNA0=
X-Google-Smtp-Source: AGHT+IH3/OyK54D2eJcnSy7pwD6hjjBfAGK3dWrXc4dTr9yaU1nqzlKnZDXZE0X/qCxu6gf6r/hkeLGFKnw6FoA7V5Y=
X-Received: by 2002:a19:914f:0:b0:500:9c05:1059 with SMTP id
 y15-20020a19914f000000b005009c051059mr4232207lfj.41.1694717500320; Thu, 14
 Sep 2023 11:51:40 -0700 (PDT)
MIME-Version: 1.0
References: <CAK5yBb9gO+WOJrv4TArzXK_1Bxu5AORp2oi=P-v=2nn6PgJE5Q@mail.gmail.com>
 <CANNYZj9QpstUj_A8Vb2RbiaFGZkHkFjHkUfF=E1HR-nDJ_Vk6w@mail.gmail.com> <81f4c191fe6dead1feec6bfc0d36aa328af1f7d4.camel@linuxfoundation.org>
In-Reply-To: <81f4c191fe6dead1feec6bfc0d36aa328af1f7d4.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 14 Sep 2023 20:51:28 +0200
Message-ID: <CANNYZj_uSknujoQUK2yV7U4N+WW_RkUH=sJnFDBfZgV0G5fv7Q@mail.gmail.com>
Subject: Re: Core workflow: sstate for all, bblock/bbunlock, tools for why is
 sstate not being reused?
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-architecture <openembedded-architecture@lists.openembedded.org>, 
	Michael Halstead <mhalstead@linuxfoundation.org>, 
	Yocto-mailing-list <yocto@lists.yoctoproject.org>, 
	",openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	Julien STEPHAN <jstephan@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Sep 2023 18:51:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187647

On Thu, 14 Sept 2023 at 14:56, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> For the task signatures, we need to think about some questions. If I
> make a change locally, can I query how much will rebuild and how much
> will be reused? There is bitbake --dry-run but perhaps it is time for a
> an option (or dedicated separate command?) to give some statistics
> about what bitbake would do? How much sstate would be reused?
>
> That then logically leads into the questions, can we tell what has
> changed? Why isn't my sstate being reused? For that we perhaps should
> define some existing scenarios where it is currently very difficult to
> work this out and then work out how we can report that information to
> the user. These could become test cases?

So I think there are two questions here that the tools should answer:

1. If I would run a build, what would be missing in the cache and need
to be built? The missing cache objects are in a dependency hierarchy,
so only those missing objects with no dependecies on other missing
objects would be printed. That should be comparatively easy to add as
bitbake already does those checks all the time. Is there something
else that's easily done and useful to print?

2. Then there's the question of *why* they are missing, which is
harder to answer. If, say, curl:do_package is not in the cache, then
the tool would have to walk the cache tree (I/O heavy operation as
there is no index), make a list of all curl:do_package objects that
are there, and do a recursive bitbake-diffsig (going up the task tree)
on them vs the one we want. Then print them starting with the newest.
Something like:

Existing cache objects are not suitable because:
<object id 1> was built on <date> and has a mismatching SRCREV
<object id 2> was built on <earlier date> and has a different do_compile()

> One of the big problems in the past was that we lost much of the hash
> information after parsing completed. This meant that if the hashes then
> didn't match, we couldn't tell why as the original computation was
> lost. I did some work on allowing us to retain more of the information
> so that we didn't have to recompute it every time to be able to do
> processing with it. I have to admit I've totally lost track of where I
> got to with that.

Here's an idea I can't get out of my head. Right now, the cache is
simply an amorphous mass of objects, with no information regarding how
they were created. How about storing complete build confgurations as
well into the same directory? There would be a dedicated, separate
area for each configuration that placed objects into the cache,
containing:
- list of layers and revisions
- config template used
- complete content of build/conf
- bitbake invocation (e.g. targets and prefixed variables like MACHINE etc.)
- complete list of sstate objects that were produced as a result, so
they can be checked for existence

This would be written into the cache dir at the very end of the build
when everything else is already there.

Right now, everyone sets up their own builds first, then points
local.conf or site.conf to the cache, and hopes for the best regarding
hit rates. Having stored build configs would allow inverting the
workflow, so that you first ask from the cache what it can provide
(e.g. it can provide mickledore or kirkstone core-image-minimal for
qemux86, and that's exactly what you want as a starting point), then
you use the build config stored in the cache to set up a build, and
run it - and that would guarantee complete sstate reuse and getting to
a functional image as soon as possible. Kind of like binary distro,
but implemented with sstate.

Alex

