Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C70CC64EC4
	for <webhook@archiver.kernel.org>; Thu,  9 Mar 2023 12:04:01 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web11.11450.1678363434978230875
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Mar 2023 04:03:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=MKb0mEzi;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f43.google.com with SMTP id l7-20020a05600c4f0700b003e79fa98ce1so1075651wmq.2
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Mar 2023 04:03:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1678363433;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=1eEqNT4ezs47cH+oh9aSfp2qdH2ZHzJiq74xGuvLuu8=;
        b=MKb0mEziU5rEYwGhuRXFCcrF8OqbnAyrx2RDlb+OEDGQmHTU4OGpO0vifsKwXLyvLZ
         E0qWCxankj4HDkeBU7QhLkTJcaRcLr737WOF0qXaCq++rAFv2aWQauHxcUEpTKsLgQVs
         53aD58uNAQ3U58Dlz05a/s+pb9NKm+pBRy5lA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678363433;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1eEqNT4ezs47cH+oh9aSfp2qdH2ZHzJiq74xGuvLuu8=;
        b=l8vXMKgaVUrEb52RjM577bxKNLeY18L/5YpxfvN6nO+iwWPEcLp4iy3W/gyac/TOde
         6FEfJvSoUo7IdFW/nUKGmcqiOB/5ilFpqhIbM6c/sf90OPXMn8WHAdI+Sx93tbBu/LQd
         78HgG2AW/6eil9jwHVyemfjafA3CXGcGJCFYpR8pAJHYqohYCUvGUqo8UUyr56B0AfRI
         HAbRKB7FKwejlxIuXaD8NIb/yZzIT6+07Ti5eXDWNZtVuDR4l36XYNMMaLk2d4v2bjDI
         OPItqc1k/uZWT8cRYYBo2gEkTjvjYgMtAgfhSTw1tUBT15YYJcCzd7tWTG2iDSZsULfl
         XwqQ==
X-Gm-Message-State: AO0yUKVSOnvqdu0bvJBolsituBs3opI3U3SRpxDL53df7MzOofbjv0ZN
	BcnEyW96ltNV3HqQJxXZBKDWoA==
X-Google-Smtp-Source: AK7set9Bz6Q+2nV5cbU/v9//b3BMY5BzEhUsOXx3mnJEq5mGhiHh8Zx+9zYOjElpANJlfVG0e7siHw==
X-Received: by 2002:a05:600c:4f93:b0:3ea:e4bb:340c with SMTP id n19-20020a05600c4f9300b003eae4bb340cmr19463640wmq.18.1678363433239;
        Thu, 09 Mar 2023 04:03:53 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:7e05:8348:1f1a:b973? ([2001:8b0:aba:5f3c:7e05:8348:1f1a:b973])
        by smtp.gmail.com with ESMTPSA id h2-20020a1ccc02000000b003eb39e60ec9sm2445293wmb.36.2023.03.09.04.03.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Mar 2023 04:03:52 -0800 (PST)
Message-ID: <69e29ea4c4b9a0cf71578b55e0e2eeda137d4679.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] staging.bbclass: run prepare_recipe_sysroot
 after unpack, not fetch
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org, Alexander Kanavin
	 <alex@linutronix.de>
Date: Thu, 09 Mar 2023 12:03:52 +0000
In-Reply-To: <CANNYZj85v8Mt97qCNvTf8GdOUAXsfTFPGJfN-1_UxK1io1TrsQ@mail.gmail.com>
References: <20230309103225.3110783-1-alex@linutronix.de>
	 <39fcdfbf705f2d2f58bbf317171f0872df2aa2e1.camel@linuxfoundation.org>
	 <CANNYZj85v8Mt97qCNvTf8GdOUAXsfTFPGJfN-1_UxK1io1TrsQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Mar 2023 12:04:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178221

On Thu, 2023-03-09 at 12:44 +0100, Alexander Kanavin wrote:
> On Thu, 9 Mar 2023 at 11:39, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
>=20
> > Before we start changing core dependencies, we need to better
> > understand what happened there. Whilst this patch might fix this case,
> > we'd likely just leave races elsewhere as other tasks call git too.
> >=20
> > Which recipe was this?
> > Why is git calling into python?
> > Why didn't the staging code to move libs into position before binaries
> > prevent this?
>=20
> The recipe was libslirp-native (I don't think it matters). Git itself
> is not calling into python; it's poky/scripts/git, which is a python
> wrapper script around git.
>=20
> I don't have a definite answer to the last question - I believe the
> staging code also removes 'outdated' sysroot items before installing
> current ones, and that's where the window of having python binary, but
> not its library may have occurred?

It sounds like the removal is probably the thing that caused problems.

> Still, there seems to be a general problem here:
> prepare_recipe_sysroot runs at the same time as tasks (such as unpack)
> that have PATH pointing to directories being modified by it. So
> there's no determinism in which python (native one or one from the
> host) is going to be used for example; it may randomly change midway
> through the task.

This is a wider problem, the sysroots are often modified when things
are running against it as we don't require task serialisation. Instead
the code tries to be careful about it's manipulations. Things aren't
always installed/removed just from that task either, it can happen with
*any* task that tries to extend the sysroot (which fetch, unpack and
patch do as well).

Cheers,

Richard



