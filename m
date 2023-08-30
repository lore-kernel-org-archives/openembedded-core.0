Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD40AC6FA8F
	for <webhook@archiver.kernel.org>; Wed, 30 Aug 2023 09:04:31 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web10.9861.1693386263301515538
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Aug 2023 02:04:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=F8Oe6qm/;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3110ab7110aso4529235f8f.3
        for <openembedded-core@lists.openembedded.org>; Wed, 30 Aug 2023 02:04:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1693386261; x=1693991061; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vv9qZrBr2I8VtS3Q07sQqXhPuUP4/C3GKmWtH1RpkXk=;
        b=F8Oe6qm/QMTGfDnbVqGLMo69E0Sk8In3DBg5TJ8vFwA6/YLOpNE17/dKgFbbdBlOHA
         ZkBfoYABlXfsM/4dd7+7ShebFBsECOYf26pYRcqyUIJ7erW4N+GgrXI/4LpO7Xb7s1Ea
         6gCs6akmYd42cTI4dFixLwa1Ea3qc3rtWOdEI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693386261; x=1693991061;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Vv9qZrBr2I8VtS3Q07sQqXhPuUP4/C3GKmWtH1RpkXk=;
        b=Yq5qggEqLd9mjcPc8XThee/OodLyUl7pwr58mt8GYZ3cIFE+XpSpVfYXB7NcgZSKEd
         e0xRE1HgFmsWHMXs15SUNBM7HftgzjQZvkKckmkA2xl+YvEeN5lZcd4LnxCU+iy4jsWt
         4OAjWiUyfGAFOIkDJF+0iBkjogpERXLbBVgc4hnqSwBnRZFcIffDCL4ofm7omQ2pEaIl
         fQfjEwlp0qtrh97O5PtVFbcS028+1mVLBJ7GRQ49t8WCr41a0PDK2eHdPs1fH2pR8Y1B
         dmMCcAFi6eEYKIPRAKPK3PmyYhe0TzFjwAhSiF9Fbv0pT/lfuwwcJQTIVdYe+B+HZ6ff
         N23w==
X-Gm-Message-State: AOJu0YxrKk6ynWoBqRZsdPtSHL/wnlJUZZJt8bVqO3gRrRZz+odlkC4q
	HXESpFHmPVpqjqKSwQFN3rlS5g==
X-Google-Smtp-Source: AGHT+IFBNFOTjagublOSMwU+Ii5orDG1ah2nO2xXgKow7Qio1TpKth8ao1Kgxdu2MkOeWxQbQTyZYA==
X-Received: by 2002:adf:e587:0:b0:319:6327:6adb with SMTP id l7-20020adfe587000000b0031963276adbmr1097190wrm.70.1693386261217;
        Wed, 30 Aug 2023 02:04:21 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:15ec:a052:9304:60a5? ([2001:8b0:aba:5f3c:15ec:a052:9304:60a5])
        by smtp.gmail.com with ESMTPSA id c4-20020a056000104400b00317a29af4b2sm16067567wrx.68.2023.08.30.02.04.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Aug 2023 02:04:20 -0700 (PDT)
Message-ID: <171af98e8758a2a933858f9b7297d1adb088c015.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] base.bbclass: Do not fail during parsing if
 ${SRCREV} does not exist
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>, 
	openembedded-core@lists.openembedded.org
Date: Wed, 30 Aug 2023 10:04:19 +0100
In-Reply-To: <20230825171625.1213968-1-pkj@axis.com>
References: <20230825171625.1213968-1-pkj@axis.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Aug 2023 09:04:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186874

On Fri, 2023-08-25 at 19:16 +0200, Peter Kjellerstedt wrote:
> After commit a8e7b0f932 (base/package: Move source revision information
> from PV to PKGV) was integrated, having a recipe with a SRCREV that
> currently cannot be fetched would lead to an exception during parsing.
> Catch that exception and instead raise bb.parse.SkipRecipe. That way
> the parsing continues as it should. Instead you now get a meaningful
> error if you try build a recipe with a SRCREV that cannot be fetched,
> e.g.:
>=20
>   ERROR: Nothing PROVIDES 'psplash'
>   psplash was skipped: Fetcher failure: Unable to resolve 'unknown-ref'
>   in upstream git repository in git ls-remote output for
>   git.yoctoproject.org/psplash

Something doesn't sound quite right in this description. You've said "a
SRCREV that currently cannot be fetched" but "unknown-ref" will never
be fetchable and is completely invalid as a revision. I'd guess bitbake
is assuming it is a tag and trying to resolve it.

I really don't like complicating the core code when it doesn't make
sense to, particularly when it relates to cornercases most people don't
hit. I think SkipRecipe is also the incorrect thing to do here,
particularly when no reason is being passed back to bitbake to give
back to the user.

I suspect if you set the SRCREV to something that looks like a
revision, like "badbadbadbadbadbadbadbadbadbadbadbadbadb" it will avoid
the problems. Alternatively, just add the SkipRecipe locally along with
your unknown-ref.

Cheers,

Richard


