Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3EE21067034
	for <webhook@archiver.kernel.org>; Thu, 12 Mar 2026 14:12:11 +0000 (UTC)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.22617.1773324729150121410
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Mar 2026 07:12:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BLSkTytO;
 spf=pass (domain: gmail.com, ip: 209.85.128.177, mailfrom: jpewhacker@gmail.com)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-79801df3e42so15723467b3.0
        for <openembedded-core@lists.openembedded.org>; Thu, 12 Mar 2026 07:12:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773324728; cv=none;
        d=google.com; s=arc-20240605;
        b=AQowGAJ8AO21SyFzs00+HP4e0je/txPGmd8vjPI4Y3RamH+GHBxqqmH+4ldwhkv1/H
         uy1N1ZUdBTrI6JOp7gazT62ZyEtKQ2RhjaLbHBN3ffzE8MrRwBCFn8SZIHirgszF8NdH
         XlvM7gzkI2Hpwnj+aSc4xrlZ+spffEYH6bSgRY3vzet4fL0e2XRvU1txTiFh2nWN+xFJ
         U+tTK2Rd1USy6An35GSgbIbfVoR8vLKswYVqh8SvpLQJPvu8YfKHBXiA+ttGComhcOzy
         xkv5vUaMeF5oSJ+CC7zKzYOwLV1VhLD1hdsnAPjSkIoMFVIAXpsUDOZXYqoF+HzWHJbS
         MI2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zk6DSDWr2DKmfpC5heMgzhC+J54gpsaw1FwXheunXG8=;
        fh=Tyc0Jk2T+8fGWDixU3qFe8BDCZOG+4XtkeWc0U40ryA=;
        b=dJQiyWHOxIZo1DGoLYOfBE5WB4k1S0emkCc37ef257J0182aB/CX+5Tp5XYnedyvSX
         b+XG1JwsO+c3fPg7nTW5xUhZBuKlPHLk4hvVOT1faDR2qoQM3CNS1MdYsGtIzhruvOrN
         7OAmWS6mCqaT1Eq4yd/mf7d5pyWBfnA6PbPvSmkOV2EtayrsBsTpKdskBeHt4sqNnzQv
         RC9VAn9OtrA6ryEwIKRIwzKlCVYWzHlfRzZ5xLQkAMzqYPqORVFpdfkkI2N4mgrUafpQ
         DUdIskV1iUOUr3gow7xY7+f0/CV1mcqXfA9vFPcl81DFb139jji1TqT0ykO7IHmRt9Td
         C0gA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773324728; x=1773929528; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zk6DSDWr2DKmfpC5heMgzhC+J54gpsaw1FwXheunXG8=;
        b=BLSkTytOpVeYKwnRjjqTyE/1jXBV9NRXGCFknQsjb1AJXmt0e5ovJzICWWQYT9Hec2
         v+yvyQR5s3eZmow3o2hAkj7qaghvBSilJL22X1v7neVIj1yZuSpOV0WKV2+FHyDEBuml
         9o/OwJLS5ajDBslkhP5jOeob7KcsEuPfT9UT4kQmFuiiCkU2qbRsHJTb26MCqFoLpdkj
         NcKD3IaseqA/qGPTaNdHTKMJGXnfDumN59jx0YmqRJadLpdekMuhJgZ84LFHWettYUJi
         a9wBTddf46uF5c8Qnl5sRJEEidCkh6WbwwO0ur2E6ujYv5aPrb8MvD65WMXhdoppQ3/a
         nSTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773324728; x=1773929528;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zk6DSDWr2DKmfpC5heMgzhC+J54gpsaw1FwXheunXG8=;
        b=AWkzNMPlpLvst7u/Xrnr//onsV1tjK2C22VrOQb1LkOtndDIlOjY7NzPumbQljtv2N
         FqTL2q3DFB25rZypcIADBLUoTJCT8X4I+N/SjmRpEfe+sreNq8ole18u72L8M+suxyeE
         lm9E5vTJ/sBKGLTuAfOjpiArY8QiJdPL8DSuOdT3RDIMlrS2UO3NDhaT3rU+9yo4dPRJ
         9OSvQhioC5Ey2joQYPXhqPbq4K45NXlWpGWvlVjmQw56luxo1dBHXFfvoNDYDaoyaJND
         Igk9UhVzcXr44bLzGL9bU+wlWoyNF58gXunhgYUEgMmw+5JB67VcAY/sLIklN79RZfUD
         EI9A==
X-Gm-Message-State: AOJu0YyFh3w6YKrTMmBN9fZWiWgW5mMDTiDJNARYlWm25Fa1dfHUn1Zi
	mzQf4ECXrgVzD4yR4PMhYWyyzOinzVTHFf7dYBuNrMBuB7ELA3C6PZQuSTTgawWHIB5ZiVZ+/WR
	TdQfOEOe1QzuM1rRgPe8y99nHrUPnqhx0jg==
X-Gm-Gg: ATEYQzwZqyCKxqX2j98U6+WS1Syh/yzVzDbjpMVcZpliBQMGqILISYgP2rEa5PB0nV5
	FV3GyaI7vsXVSLYQXBTVbJrKmDCql5SenA4JDU7yZIDhQBEWob5g60BDcnjMgmERbJVOipjJfON
	GPGilAdGovvl9jmxV+PiXgyamO59KfeLzFiVvKYjftBt0ZTGNBHNPpfHGZpQnJQHtDHX1edoBaa
	MTrH+lO5T9xKUEzwcZbqIaiZJciLUpZIAj9223rXMqnpukYUuXjnNcBUTQd+STKzBkW7YwlfZDd
	Em+0SL53QfGjHyUvlFvBTnu9i0Agf4Ky
X-Received: by 2002:a05:690c:c4cf:b0:798:5bb7:4982 with SMTP id
 00721157ae682-799475e4a47mr32611617b3.16.1773324728230; Thu, 12 Mar 2026
 07:12:08 -0700 (PDT)
MIME-Version: 1.0
References: <20260304164835.3072507-1-JPEWhacker@gmail.com>
 <20260310184058.533343-1-JPEWhacker@gmail.com> <20260310184058.533343-4-JPEWhacker@gmail.com>
 <4e4dd4ef32301e4510d66b7504c2e207b3e883e7.camel@linuxfoundation.org>
In-Reply-To: <4e4dd4ef32301e4510d66b7504c2e207b3e883e7.camel@linuxfoundation.org>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Thu, 12 Mar 2026 08:11:57 -0600
X-Gm-Features: AaiRm50IWiruQnIdZcYyHLGR70Wt7my6zWtPUHz97Yd0Hf7CWkJpdqOAIbyz9q4
Message-ID: <CAJdd5Gbe4cKH3n7Fn3kEBnWwuqvS4wAUvpr=FbvH+ertLu_cQg@mail.gmail.com>
Subject: Re: [OE-core][PATCH v6 03/15] spdx3: Add recipe SPDX data
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Mar 2026 14:12:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232968

On Thu, Mar 12, 2026 at 5:43=E2=80=AFAM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Tue, 2026-03-10 at 12:38 -0600, Joshua Watt via lists.openembedded.org=
 wrote:
> > Adds a new package to the SPDX output that represents the recipe data
> > for a given recipe. Importantly, this data contains only things that ca=
n
> > be determined statically from only the recipe, so it doesn't require
> > fetching or building anything. This means that build time dependencies
> > and CVE information for recipes can be analyzed without needing to
> > actually do any builds.
> >
> > Sadly, license data cannot be included because NO_GENERIC_LICENSE means
> > that actual license text might only be available after do_fetch
>
> We talked about these patches on the review call. I'm a bit worried
> about the direction we're going from a few angles.
>
> The general theme is the complexity and increasingly seemingly tangled
> web we seem to be weaving and whether we're going to end up in a good
> place.
>
> Taking NO_GENERIC_LICENSE specifically, it may be we should mandate
> that such licenses are copied into the metadata, then we solve the
> license data problem that way? That would simplify some of the problems
> we're facing and reduce some set of the corner cases.
>
> This patch adds a new task into the task graph and I'm getting a bit
> worried about the number of them the SPDX class is adding. I appreciate
> there is a later patch removing one, which is nice though :)

With the removal of the vestigial task in this patch series, the task
graph for SPDX is:

do_create_recipe_spdx - > "static" information we can determine about
the recipe just from the metadata (no fetching, compiling, etc.)

do_create_spdx -> Information about what we built and how we built it.
We obviously have to build to figure this part out (the definition of
this didn't change in this patch series; it should really be called
do_create_build_spdx, but it inherited the name from the SPDX 2 code,
so I don't want to change it)

do_create_runtime_spdx -> Information about runtime packages. This has
to be a separate task because while the build graph is a DAG, the
runtime graph is not. The definition of this didn't change in this
patch series.

Various SBoM assembly tasks: These are the tasks that take the
individual SPDX files generated by the tasks above and link them into
a complete document that ends up in DEPLOY_DIR. They are all
identified by having "sbom" in the name (do_create_image_sbom_spdx)


>
> So, for this patch, could we just drop NO_GENERIC_LICENSE and how much
> code complexity improvement does that buy us?

I'm not clear what you mean by this. I'm not including any additional
License information, because we don't have it. I didn't change any
license handling in the SPDX code, and I didn't add any more, so if
you're talking about simplifying the SPDX code by dropping
NO_GENERIC_LICENSE, it gains you nothing here specifically.

It might be nice to improve NO_GENERIC_LICENSE in general, but I don't
think we can do that for 6.0. If we do that later, we might be able to
add license information to the "recipe" level SPDX data.

The comment in the commit messages was probably more of a gripe than
useful information (It feels like we _should_ be able to get license
data statically, but we can't). I'll just remove it.

>
> Cheers,
>
> Richard

